;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "278296a1-1149-4286-0ff7-bc17a667446d")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 78892, e => {
    "use strict";
    var t = e.i(416340);

    function r(e, t) {
        if ("function" == typeof e) return e(t);
        null != e && (e.current = t)
    }

    function n() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
        return e => {
            let n = !1,
                o = t.map(t => {
                    let o = r(t, e);
                    return n || "function" != typeof o || (n = !0), o
                });
            if (n) return () => {
                for (let e = 0; e < o.length; e++) {
                    let n = o[e];
                    "function" == typeof n ? n() : r(t[e], null)
                }
            }
        }
    }
    e.s(["composeRefs", 0, n, "useComposedRefs", 0, function() {
        for (var e = arguments.length, r = Array(e), o = 0; o < e; o++) r[o] = arguments[o];
        return t.useCallback(n(...r), r)
    }])
}, 23342, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(78892),
        n = e.i(221628),
        o = Symbol.for("react.lazy"),
        i = t[" use ".trim().toString()];

    function a(e) {
        var t;
        return null != e && "object" == typeof e && "$$typeof" in e && e.$$typeof === o && "_payload" in e && "object" == typeof(t = e._payload) && null !== t && "then" in t
    }

    function s(e) {
        var o;
        let s, l = (o = e, (s = t.forwardRef((e, n) => {
                let {
                    children: o,
                    ...s
                } = e;
                if (a(o) && "function" == typeof i && (o = i(o._payload)), t.isValidElement(o)) {
                    var l, c, u;
                    let e, i, a = (i = (e = null == (c = Object.getOwnPropertyDescriptor((l = o).props, "ref")) ? void 0 : c.get) && "isReactWarning" in e && e.isReactWarning) ? l.ref : (i = (e = null == (u = Object.getOwnPropertyDescriptor(l, "ref")) ? void 0 : u.get) && "isReactWarning" in e && e.isReactWarning) ? l.props.ref : l.props.ref || l.ref,
                        p = function(e, t) {
                            let r = {
                                ...t
                            };
                            for (let n in t) {
                                let o = e[n],
                                    i = t[n];
                                /^on[A-Z]/.test(n) ? o && i ? r[n] = function() {
                                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                    let n = i(...t);
                                    return o(...t), n
                                } : o && (r[n] = o) : "style" === n ? r[n] = {
                                    ...o,
                                    ...i
                                } : "className" === n && (r[n] = [o, i].filter(Boolean).join(" "))
                            }
                            return {
                                ...e,
                                ...r
                            }
                        }(s, o.props);
                    return o.type !== t.Fragment && (p.ref = n ? (0, r.composeRefs)(n, a) : a), t.cloneElement(o, p)
                }
                return t.Children.count(o) > 1 ? t.Children.only(null) : null
            })).displayName = "".concat(o, ".SlotClone"), s),
            c = t.forwardRef((e, r) => {
                let {
                    children: o,
                    ...s
                } = e;
                a(o) && "function" == typeof i && (o = i(o._payload));
                let c = t.Children.toArray(o),
                    p = c.find(u);
                if (p) {
                    let e = p.props.children,
                        o = c.map(r => r !== p ? r : t.Children.count(e) > 1 ? t.Children.only(null) : t.isValidElement(e) ? e.props.children : null);
                    return (0, n.jsx)(l, {
                        ...s,
                        ref: r,
                        children: t.isValidElement(e) ? t.cloneElement(e, void 0, o) : null
                    })
                }
                return (0, n.jsx)(l, {
                    ...s,
                    ref: r,
                    children: o
                })
            });
        return c.displayName = "".concat(e, ".Slot"), c
    }
    var l = s("Slot"),
        c = Symbol("radix.slottable");

    function u(e) {
        return t.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === c
    }
    e.s(["Slot", 0, l, "createSlot", 0, s])
}, 41466, e => {
    "use strict";
    var t = e.i(140625),
        r = e.i(603955),
        n = e.i(427759),
        o = e.i(75584),
        i = e.i(197649),
        a = e.i(416340),
        s = e.i(23342);
    let l = {
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
        p = {
            Emphasis: ["bg-action-standard", "content-action-standard"],
            Standard: ["bg-action-standard", "content-action-standard"],
            SoftEmphasis: ["bg-action-standard", "content-action-standard"],
            Utility: ["bg-action-subtle", "content-action-standard"],
            Link: ["bg-action-link", "content-system-emphasis"],
            Alert: ["bg-action-standard", "content-action-standard"],
            ActionUtility: ["bg-action-subtle", "content-action-standard"]
        },
        d = (0, a.forwardRef)((e, d) => {
            let {
                children: f,
                className: h,
                style: m,
                isDisabled: v = !1,
                isLoading: y = !1,
                icon: g,
                size: b = "Large",
                variant: w = "Emphasis",
                asChild: x,
                ...A
            } = e, R = (0, i.default)("foundation-web-button", v ? r.disabledOpacity : [t.interactable, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", c[b], v ? p[w] : u[w], h), I = {
                textDecoration: "none",
                ...m
            }, S = e => a.default.createElement(a.default.Fragment, null, a.default.createElement(t.StateLayer, null), y && a.default.createElement("div", {
                "aria-hidden": "true",
                className: "absolute flex"
            }, a.default.createElement(n.LoadingSpinner, {
                width: l[b],
                height: l[b]
            })), a.default.createElement("span", {
                className: (0, i.default)("flex items-center min-width-0", "Large" === b || "Medium" === b ? "gap-small" : "gap-xsmall", y && "invisible")
            }, g && a.default.createElement(o.Icon, {
                name: g,
                size: b
            }), a.default.createElement("span", {
                className: "padding-y-xsmall text-truncate-end text-no-wrap"
            }, e)));
            if (x) {
                let {
                    as: e,
                    ...t
                } = A, r = a.default.Children.only(f);
                return a.default.createElement(s.Slot, {
                    ref: d,
                    ...t,
                    className: R,
                    style: I,
                    "aria-disabled": v || void 0
                }, a.default.cloneElement(r, {}, S(r.props.children)))
            }
            if ("a" === A.as) {
                let {
                    as: e,
                    href: t,
                    ...r
                } = A;
                return a.default.createElement("a", {
                    ref: d,
                    ...r,
                    "aria-disabled": v,
                    href: v ? void 0 : t,
                    className: R,
                    style: I
                }, S(f))
            }
            let {
                as: P,
                ...C
            } = A;
            return a.default.createElement("button", {
                ref: d,
                type: "button",
                ...C,
                disabled: v,
                className: R,
                style: I
            }, S(f))
        });
    e.s(["Button", 0, d])
}, 306607, e => {
    "use strict";
    var t = e.i(197649),
        r = e.i(416340);
    let n = (0, r.forwardRef)((e, n) => {
        let {
            className: o,
            style: i,
            orientation: a = "horizontal",
            variant: s = "Standard",
            ...l
        } = e, c = "vertical" === a, u = {};
        return c || "Inset" !== s ? c || "InsetLeft" !== s ? c || "InsetRight" !== s || (u = {
            marginRight: "var(--padding-xlarge)"
        }) : u = {
            marginLeft: "var(--padding-xlarge)"
        } : u = {
            marginLeft: "var(--padding-xlarge)",
            marginRight: "var(--padding-xlarge)"
        }, r.default.createElement("div", {
            ref: n,
            ...l,
            role: "separator",
            "data-orientation": a,
            "aria-orientation": a,
            style: {
                borderRightWidth: 0,
                borderBottomWidth: 0,
                boxSizing: "border-box",
                borderStyle: "solid",
                ...c ? {
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
                ...i
            },
            className: (0, t.default)("stroke-default self-stretch", o)
        })
    });
    n.displayName = "Divider", e.s(["Divider", 0, n])
}, 75584, e => {
    "use strict";
    var t = e.i(197649),
        r = e.i(416340);
    let n = {
            XSmall: "size-[var(--icon-size-xsmall)]",
            Small: "size-[var(--icon-size-small)]",
            Medium: "size-[var(--icon-size-medium)]",
            Large: "size-[var(--icon-size-large)]",
            XLarge: "size-[var(--icon-size-xlarge)]",
            XXLarge: "size-[var(--icon-size-xxlarge)]"
        },
        o = r.default.forwardRef((e, o) => {
            let {
                name: i,
                size: a = "Medium",
                className: s,
                children: l,
                ...c
            } = e;
            return r.default.createElement("span", {
                ref: o,
                "aria-hidden": !0,
                "data-testid": "foundation-web-icon",
                className: (0, t.default)("grow-0 shrink-0 basis-auto icon", i, n[a], s),
                ...c
            })
        });
    o.displayName = "Icon", e.s(["Icon", 0, o])
}, 225032, 425353, 199512, e => {
    "use strict";
    var t = e.i(140625),
        r = e.i(75584),
        n = e.i(197649),
        o = e.i(416340);
    let i = {
            Small: "padding-xsmall",
            Medium: "padding-small",
            Large: "padding-small"
        },
        a = {
            Utility: "bg-action-link",
            OverMedia: "bg-over-media-100"
        };
    e.s(["CloseAffordance", 0, e => {
        let {
            variant: s,
            size: l,
            isCircular: c,
            className: u,
            ...p
        } = e;
        return o.default.createElement("button", {
            type: "button",
            className: (0, n.default)("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", t.interactable, a[s], i[l], c && "radius-circle", u),
            ...p
        }, o.default.createElement(t.StateLayer, null), o.default.createElement(r.Icon, {
            name: "icon-regular-x",
            size: l
        }))
    }], 225032);
    var s = e.i(19655),
        l = e.i(78892),
        c = e.i(608652),
        u = e.i(40266),
        p = e.i(428156),
        d = e.i(598943),
        f = e.i(44265),
        h = e.i(763960),
        m = e.i(226972),
        v = e.i(594278),
        y = e.i(793808),
        g = e.i(813593),
        b = e.i(3300),
        w = e.i(699704),
        x = e.i(221628),
        A = "Dialog",
        [R, I] = (0, c.createContextScope)(A),
        [S, P] = R(A),
        C = e => {
            let {
                __scopeDialog: t,
                children: r,
                open: n,
                defaultOpen: i,
                onOpenChange: a,
                modal: s = !0
            } = e, l = o.useRef(null), c = o.useRef(null), [d = !1, f] = (0, p.useControllableState)({
                prop: n,
                defaultProp: i,
                onChange: a
            });
            return (0, x.jsx)(S, {
                scope: t,
                triggerRef: l,
                contentRef: c,
                contentId: (0, u.useId)(),
                titleId: (0, u.useId)(),
                descriptionId: (0, u.useId)(),
                open: d,
                onOpenChange: f,
                onOpenToggle: o.useCallback(() => f(e => !e), [f]),
                modal: s,
                children: r
            })
        };
    C.displayName = A;
    var q = "DialogTrigger",
        k = o.forwardRef((e, t) => {
            let {
                __scopeDialog: r,
                ...n
            } = e, o = P(q, r), i = (0, l.useComposedRefs)(t, o.triggerRef);
            return (0, x.jsx)(v.Primitive.button, {
                type: "button",
                "aria-haspopup": "dialog",
                "aria-expanded": o.open,
                "aria-controls": o.contentId,
                "data-state": X(o.open),
                ...n,
                ref: i,
                onClick: (0, s.composeEventHandlers)(e.onClick, o.onOpenToggle)
            })
        });
    k.displayName = q;
    var T = "DialogPortal",
        [E, O] = R(T, {
            forceMount: void 0
        }),
        U = e => {
            let {
                __scopeDialog: t,
                forceMount: r,
                children: n,
                container: i
            } = e, a = P(T, t);
            return (0, x.jsx)(E, {
                scope: t,
                forceMount: r,
                children: o.Children.map(n, e => (0, x.jsx)(m.Presence, {
                    present: r || a.open,
                    children: (0, x.jsx)(h.Portal, {
                        asChild: !0,
                        container: i,
                        children: e
                    })
                }))
            })
        };
    U.displayName = T;
    var _ = "DialogOverlay",
        z = o.forwardRef((e, t) => {
            let r = O(_, e.__scopeDialog),
                {
                    forceMount: n = r.forceMount,
                    ...o
                } = e,
                i = P(_, e.__scopeDialog);
            return i.modal ? (0, x.jsx)(m.Presence, {
                present: n || i.open,
                children: (0, x.jsx)(L, {
                    ...o,
                    ref: t
                })
            }) : null
        });
    z.displayName = _;
    var K = (0, w.createSlot)("DialogOverlay.RemoveScroll"),
        L = o.forwardRef((e, t) => {
            let {
                __scopeDialog: r,
                ...n
            } = e, o = P(_, r);
            return (0, x.jsx)(g.RemoveScroll, {
                as: K,
                allowPinchZoom: !0,
                shards: [o.contentRef],
                children: (0, x.jsx)(v.Primitive.div, {
                    "data-state": X(o.open),
                    ...n,
                    ref: t,
                    style: {
                        pointerEvents: "auto",
                        ...n.style
                    }
                })
            })
        }),
        D = "DialogContent",
        M = o.forwardRef((e, t) => {
            let r = O(D, e.__scopeDialog),
                {
                    forceMount: n = r.forceMount,
                    ...o
                } = e,
                i = P(D, e.__scopeDialog);
            return (0, x.jsx)(m.Presence, {
                present: n || i.open,
                children: i.modal ? (0, x.jsx)(j, {
                    ...o,
                    ref: t
                }) : (0, x.jsx)(N, {
                    ...o,
                    ref: t
                })
            })
        });
    M.displayName = D;
    var j = o.forwardRef((e, t) => {
            let r = P(D, e.__scopeDialog),
                n = o.useRef(null),
                i = (0, l.useComposedRefs)(t, r.contentRef, n);
            return o.useEffect(() => {
                let e = n.current;
                if (e) return (0, b.hideOthers)(e)
            }, []), (0, x.jsx)(V, {
                ...e,
                ref: i,
                trapFocus: r.open,
                disableOutsidePointerEvents: !0,
                onCloseAutoFocus: (0, s.composeEventHandlers)(e.onCloseAutoFocus, e => {
                    var t;
                    e.preventDefault(), null == (t = r.triggerRef.current) || t.focus()
                }),
                onPointerDownOutside: (0, s.composeEventHandlers)(e.onPointerDownOutside, e => {
                    let t = e.detail.originalEvent,
                        r = 0 === t.button && !0 === t.ctrlKey;
                    (2 === t.button || r) && e.preventDefault()
                }),
                onFocusOutside: (0, s.composeEventHandlers)(e.onFocusOutside, e => e.preventDefault())
            })
        }),
        N = o.forwardRef((e, t) => {
            let r = P(D, e.__scopeDialog),
                n = o.useRef(!1),
                i = o.useRef(!1);
            return (0, x.jsx)(V, {
                ...e,
                ref: t,
                trapFocus: !1,
                disableOutsidePointerEvents: !1,
                onCloseAutoFocus: t => {
                    var o, a;
                    null == (o = e.onCloseAutoFocus) || o.call(e, t), t.defaultPrevented || (n.current || null == (a = r.triggerRef.current) || a.focus(), t.preventDefault()), n.current = !1, i.current = !1
                },
                onInteractOutside: t => {
                    var o, a;
                    null == (o = e.onInteractOutside) || o.call(e, t), t.defaultPrevented || (n.current = !0, "pointerdown" === t.detail.originalEvent.type && (i.current = !0));
                    let s = t.target;
                    (null == (a = r.triggerRef.current) ? void 0 : a.contains(s)) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && i.current && t.preventDefault()
                }
            })
        }),
        V = o.forwardRef((e, t) => {
            let {
                __scopeDialog: r,
                trapFocus: n,
                onOpenAutoFocus: i,
                onCloseAutoFocus: a,
                ...s
            } = e, c = P(D, r), u = o.useRef(null), p = (0, l.useComposedRefs)(t, u);
            return (0, y.useFocusGuards)(), (0, x.jsxs)(x.Fragment, {
                children: [(0, x.jsx)(f.FocusScope, {
                    asChild: !0,
                    loop: !0,
                    trapped: n,
                    onMountAutoFocus: i,
                    onUnmountAutoFocus: a,
                    children: (0, x.jsx)(d.DismissableLayer, {
                        role: "dialog",
                        id: c.contentId,
                        "aria-describedby": c.descriptionId,
                        "aria-labelledby": c.titleId,
                        "data-state": X(c.open),
                        ...s,
                        ref: p,
                        onDismiss: () => c.onOpenChange(!1)
                    })
                }), (0, x.jsxs)(x.Fragment, {
                    children: [(0, x.jsx)(Q, {
                        titleId: c.titleId
                    }), (0, x.jsx)(ee, {
                        contentRef: u,
                        descriptionId: c.descriptionId
                    })]
                })]
            })
        }),
        G = "DialogTitle",
        F = o.forwardRef((e, t) => {
            let {
                __scopeDialog: r,
                ...n
            } = e, o = P(G, r);
            return (0, x.jsx)(v.Primitive.h2, {
                id: o.titleId,
                ...n,
                ref: t
            })
        });
    F.displayName = G;
    var B = "DialogDescription",
        W = o.forwardRef((e, t) => {
            let {
                __scopeDialog: r,
                ...n
            } = e, o = P(B, r);
            return (0, x.jsx)(v.Primitive.p, {
                id: o.descriptionId,
                ...n,
                ref: t
            })
        });
    W.displayName = B;
    var H = "DialogClose",
        J = o.forwardRef((e, t) => {
            let {
                __scopeDialog: r,
                ...n
            } = e, o = P(H, r);
            return (0, x.jsx)(v.Primitive.button, {
                type: "button",
                ...n,
                ref: t,
                onClick: (0, s.composeEventHandlers)(e.onClick, () => o.onOpenChange(!1))
            })
        });

    function X(e) {
        return e ? "open" : "closed"
    }
    J.displayName = H;
    var $ = "DialogTitleWarning",
        [Y, Z] = (0, c.createContext)($, {
            contentName: D,
            titleName: G,
            docsSlug: "dialog"
        }),
        Q = e => {
            let {
                titleId: t
            } = e, r = Z($), n = "`".concat(r.contentName, "` requires a `").concat(r.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(r.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(r.docsSlug);
            return o.useEffect(() => {
                t && (document.getElementById(t) || console.error(n))
            }, [n, t]), null
        },
        ee = e => {
            let {
                contentRef: t,
                descriptionId: r
            } = e, n = Z("DialogDescriptionWarning"), i = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(n.contentName, "}.");
            return o.useEffect(() => {
                var e;
                let n = null == (e = t.current) ? void 0 : e.getAttribute("aria-describedby");
                r && n && (document.getElementById(r) || console.warn(i))
            }, [i, t, r]), null
        };
    e.s(["Close", 0, J, "Content", 0, M, "Description", 0, W, "Overlay", 0, z, "Portal", 0, U, "Root", 0, C, "Title", 0, F, "Trigger", 0, k], 425353), e.i(149285);
    var et = e.i(23342),
        er = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce((e, t) => {
            let r = (0, et.createSlot)("Primitive.".concat(t)),
                n = o.forwardRef((e, n) => {
                    let {
                        asChild: o,
                        ...i
                    } = e;
                    return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, x.jsx)(o ? r : t, {
                        ...i,
                        ref: n
                    })
                });
            return n.displayName = "Primitive.".concat(t), {
                ...e,
                [t]: n
            }
        }, {}),
        en = Object.freeze({
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
        eo = o.forwardRef((e, t) => (0, x.jsx)(er.span, {
            ...e,
            ref: t,
            style: {
                ...en,
                ...e.style
            }
        }));
    eo.displayName = "VisuallyHidden", e.s(["VisuallyHidden", 0, eo], 199512)
}, 427759, e => {
    "use strict";
    var t = e.i(416340);
    e.s(["LoadingSpinner", 0, e => {
        let {
            width: r,
            height: n
        } = e;
        return t.default.createElement("svg", {
            className: "foundation-web-loading-spinner",
            width: r,
            height: n,
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
}, 140625, e => {
    "use strict";
    var t = e.i(197649),
        r = e.i(416340);
    e.s(["StateLayer", 0, e => {
        let {
            className: n
        } = e;
        return r.default.createElement("div", {
            "aria-hidden": !0,
            "data-testid": "foundation-web-state-layer",
            className: (0, t.default)("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", n)
        })
    }, "interactable", 0, "relative clip group/interactable focus-visible:outline-focus disabled:outline-none"])
}, 603955, e => {
    "use strict";
    e.s(["disabledOpacity", 0, "opacity-[0.5]"])
}, 172753, e => {
    "use strict";
    var t = e.i(221628),
        r = (0, e.i(634034).c)((0, t.jsx)("path", {
            d: "M19 6.41 17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"
        }), "Close");
    e.s(["C", 0, r])
}, 15645, e => {
    "use strict";
    var t = e.i(172753);
    e.s(["CloseIcon", () => t.C])
}, 257256, 682018, e => {
    "use strict";
    var t, r, n, o, i, a = e.i(194250),
        s = e.i(416340),
        l = e.i(863605),
        c = e.i(154502),
        u = e.i(690569),
        p = e.i(945146),
        d = e.i(251635),
        f = e.i(977987),
        h = e.i(787802),
        m = e.i(221628),
        v = e.i(441872),
        y = e.i(654188);
    e.i(407110), e.i(164136), e.i(465957);
    var g = e.i(710302),
        b = e.i(230505),
        w = e.i(15686),
        x = e.i(121880),
        A = {};
    Object.defineProperty(A, "__esModule", {
        value: !0
    });
    var R = A.default = void 0,
        I = function(e) {
            if (e && e.__esModule) return e;
            if (null === e || "object" != typeof e && "function" != typeof e) return {
                default: e
            };
            var t = P(void 0);
            if (t && t.has(e)) return t.get(e);
            var r = {
                    __proto__: null
                },
                n = Object.defineProperty && Object.getOwnPropertyDescriptor;
            for (var o in e)
                if ("default" !== o && Object.prototype.hasOwnProperty.call(e, o)) {
                    var i = n ? Object.getOwnPropertyDescriptor(e, o) : null;
                    i && (i.get || i.set) ? Object.defineProperty(r, o, i) : r[o] = e[o]
                } return r.default = e, t && t.set(e, r), r
        }(s.default),
        S = d.f;

    function P(e) {
        if ("function" != typeof WeakMap) return null;
        var t = new WeakMap,
            r = new WeakMap;
        return (P = function(e) {
            return e ? r : t
        })(e)
    }
    R = A.default = function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : null,
            t = I.useContext(S.ThemeContext);
        return t && 0 !== Object.keys(t).length ? t : e
    };
    var C = "bottom",
        q = "right",
        k = "left",
        T = "auto",
        E = ["top", C, q, k],
        O = "start",
        U = "viewport",
        _ = "popper",
        z = E.reduce(function(e, t) {
            return e.concat([t + "-" + O, t + "-end"])
        }, []),
        K = [].concat(E, [T]).reduce(function(e, t) {
            return e.concat([t, t + "-" + O, t + "-end"])
        }, []),
        L = ["beforeRead", "read", "afterRead", "beforeMain", "main", "afterMain", "beforeWrite", "write", "afterWrite"];

    function D(e) {
        return e ? (e.nodeName || "").toLowerCase() : null
    }

    function M(e) {
        if (null == e) return window;
        if ("[object Window]" !== e.toString()) {
            var t = e.ownerDocument;
            return t && t.defaultView || window
        }
        return e
    }

    function j(e) {
        return e instanceof M(e).Element || e instanceof Element
    }

    function N(e) {
        return e instanceof M(e).HTMLElement || e instanceof HTMLElement
    }

    function V(e) {
        return "u" > typeof ShadowRoot && (e instanceof M(e).ShadowRoot || e instanceof ShadowRoot)
    }

    function G(e) {
        return e.split("-")[0]
    }
    var F = Math.max,
        B = Math.min,
        W = Math.round;

    function H() {
        var e = navigator.userAgentData;
        return null != e && e.brands && Array.isArray(e.brands) ? e.brands.map(function(e) {
            return e.brand + "/" + e.version
        }).join(" ") : navigator.userAgent
    }

    function J() {
        return !/^((?!chrome|android).)*safari/i.test(H())
    }

    function X(e, t, r) {
        void 0 === t && (t = !1), void 0 === r && (r = !1);
        var n = e.getBoundingClientRect(),
            o = 1,
            i = 1;
        t && N(e) && (o = e.offsetWidth > 0 && W(n.width) / e.offsetWidth || 1, i = e.offsetHeight > 0 && W(n.height) / e.offsetHeight || 1);
        var a = (j(e) ? M(e) : window).visualViewport,
            s = !J() && r,
            l = (n.left + (s && a ? a.offsetLeft : 0)) / o,
            c = (n.top + (s && a ? a.offsetTop : 0)) / i,
            u = n.width / o,
            p = n.height / i;
        return {
            width: u,
            height: p,
            top: c,
            right: l + u,
            bottom: c + p,
            left: l,
            x: l,
            y: c
        }
    }

    function $(e) {
        var t = X(e),
            r = e.offsetWidth,
            n = e.offsetHeight;
        return 1 >= Math.abs(t.width - r) && (r = t.width), 1 >= Math.abs(t.height - n) && (n = t.height), {
            x: e.offsetLeft,
            y: e.offsetTop,
            width: r,
            height: n
        }
    }

    function Y(e, t) {
        var r = t.getRootNode && t.getRootNode();
        if (e.contains(t)) return !0;
        if (r && V(r)) {
            var n = t;
            do {
                if (n && e.isSameNode(n)) return !0;
                n = n.parentNode || n.host
            } while (n)
        }
        return !1
    }

    function Z(e) {
        return M(e).getComputedStyle(e)
    }

    function Q(e) {
        return ((j(e) ? e.ownerDocument : e.document) || window.document).documentElement
    }

    function ee(e) {
        return "html" === D(e) ? e : e.assignedSlot || e.parentNode || (V(e) ? e.host : null) || Q(e)
    }

    function et(e) {
        return N(e) && "fixed" !== Z(e).position ? e.offsetParent : null
    }

    function er(e) {
        for (var t = M(e), r = et(e); r && ["table", "td", "th"].indexOf(D(r)) >= 0 && "static" === Z(r).position;) r = et(r);
        return r && ("html" === D(r) || "body" === D(r) && "static" === Z(r).position) ? t : r || function(e) {
            var t = /firefox/i.test(H());
            if (/Trident/i.test(H()) && N(e) && "fixed" === Z(e).position) return null;
            var r = ee(e);
            for (V(r) && (r = r.host); N(r) && 0 > ["html", "body"].indexOf(D(r));) {
                var n = Z(r);
                if ("none" !== n.transform || "none" !== n.perspective || "paint" === n.contain || -1 !== ["transform", "perspective"].indexOf(n.willChange) || t && "filter" === n.willChange || t && n.filter && "none" !== n.filter) return r;
                r = r.parentNode
            }
            return null
        }(e) || t
    }

    function en(e) {
        return ["top", "bottom"].indexOf(e) >= 0 ? "x" : "y"
    }

    function eo(e, t, r) {
        return F(e, B(t, r))
    }

    function ei(e) {
        return Object.assign({}, {
            top: 0,
            right: 0,
            bottom: 0,
            left: 0
        }, e)
    }

    function ea(e, t) {
        return t.reduce(function(t, r) {
            return t[r] = e, t
        }, {})
    }

    function es(e) {
        return e.split("-")[1]
    }
    var el = {
        top: "auto",
        right: "auto",
        bottom: "auto",
        left: "auto"
    };

    function ec(e) {
        var t, r = e.popper,
            n = e.popperRect,
            o = e.placement,
            i = e.variation,
            a = e.offsets,
            s = e.position,
            l = e.gpuAcceleration,
            c = e.adaptive,
            u = e.roundOffsets,
            p = e.isFixed,
            d = a.x,
            f = void 0 === d ? 0 : d,
            h = a.y,
            m = void 0 === h ? 0 : h,
            v = "function" == typeof u ? u({
                x: f,
                y: m
            }) : {
                x: f,
                y: m
            };
        f = v.x, m = v.y;
        var y = a.hasOwnProperty("x"),
            g = a.hasOwnProperty("y"),
            b = k,
            w = "top",
            x = window;
        if (c) {
            var A = er(r),
                R = "clientHeight",
                I = "clientWidth";
            A === M(r) && "static" !== Z(A = Q(r)).position && "absolute" === s && (R = "scrollHeight", I = "scrollWidth"), ("top" === o || (o === k || o === q) && "end" === i) && (w = C, m -= (p && A === x && x.visualViewport ? x.visualViewport.height : A[R]) - n.height, m *= l ? 1 : -1), (o === k || ("top" === o || o === C) && "end" === i) && (b = q, f -= (p && A === x && x.visualViewport ? x.visualViewport.width : A[I]) - n.width, f *= l ? 1 : -1)
        }
        var S, P, T, E, O, U, _ = Object.assign({
                position: s
            }, c && el),
            z = !0 === u ? (S = {
                x: f,
                y: m
            }, P = M(r), T = S.x, E = S.y, {
                x: W(T * (O = P.devicePixelRatio || 1)) / O || 0,
                y: W(E * O) / O || 0
            }) : {
                x: f,
                y: m
            };
        return f = z.x, m = z.y, l ? Object.assign({}, _, ((U = {})[w] = g ? "0" : "", U[b] = y ? "0" : "", U.transform = 1 >= (x.devicePixelRatio || 1) ? "translate(" + f + "px, " + m + "px)" : "translate3d(" + f + "px, " + m + "px, 0)", U)) : Object.assign({}, _, ((t = {})[w] = g ? m + "px" : "", t[b] = y ? f + "px" : "", t.transform = "", t))
    }
    var eu = {
            passive: !0
        },
        ep = {
            left: "right",
            right: "left",
            bottom: "top",
            top: "bottom"
        };

    function ed(e) {
        return e.replace(/left|right|bottom|top/g, function(e) {
            return ep[e]
        })
    }
    var ef = {
        start: "end",
        end: "start"
    };

    function eh(e) {
        return e.replace(/start|end/g, function(e) {
            return ef[e]
        })
    }

    function em(e) {
        var t = M(e);
        return {
            scrollLeft: t.pageXOffset,
            scrollTop: t.pageYOffset
        }
    }

    function ev(e) {
        return X(Q(e)).left + em(e).scrollLeft
    }

    function ey(e) {
        var t = Z(e),
            r = t.overflow,
            n = t.overflowX,
            o = t.overflowY;
        return /auto|scroll|overlay|hidden/.test(r + o + n)
    }

    function eg(e, t) {
        void 0 === t && (t = []);
        var r, n = function e(t) {
                return ["html", "body", "#document"].indexOf(D(t)) >= 0 ? t.ownerDocument.body : N(t) && ey(t) ? t : e(ee(t))
            }(e),
            o = n === (null == (r = e.ownerDocument) ? void 0 : r.body),
            i = M(n),
            a = o ? [i].concat(i.visualViewport || [], ey(n) ? n : []) : n,
            s = t.concat(a);
        return o ? s : s.concat(eg(ee(a)))
    }

    function eb(e) {
        return Object.assign({}, e, {
            left: e.x,
            top: e.y,
            right: e.x + e.width,
            bottom: e.y + e.height
        })
    }

    function ew(e, t, r) {
        var n, o, i, a, s, l, c, u, p, d;
        return t === U ? eb(function(e, t) {
            var r = M(e),
                n = Q(e),
                o = r.visualViewport,
                i = n.clientWidth,
                a = n.clientHeight,
                s = 0,
                l = 0;
            if (o) {
                i = o.width, a = o.height;
                var c = J();
                (c || !c && "fixed" === t) && (s = o.offsetLeft, l = o.offsetTop)
            }
            return {
                width: i,
                height: a,
                x: s + ev(e),
                y: l
            }
        }(e, r)) : j(t) ? ((n = X(t, !1, "fixed" === r)).top = n.top + t.clientTop, n.left = n.left + t.clientLeft, n.bottom = n.top + t.clientHeight, n.right = n.left + t.clientWidth, n.width = t.clientWidth, n.height = t.clientHeight, n.x = n.left, n.y = n.top, n) : eb((o = Q(e), a = Q(o), s = em(o), l = null == (i = o.ownerDocument) ? void 0 : i.body, c = F(a.scrollWidth, a.clientWidth, l ? l.scrollWidth : 0, l ? l.clientWidth : 0), u = F(a.scrollHeight, a.clientHeight, l ? l.scrollHeight : 0, l ? l.clientHeight : 0), p = -s.scrollLeft + ev(o), d = -s.scrollTop, "rtl" === Z(l || a).direction && (p += F(a.clientWidth, l ? l.clientWidth : 0) - c), {
            width: c,
            height: u,
            x: p,
            y: d
        }))
    }

    function ex(e) {
        var t, r = e.reference,
            n = e.element,
            o = e.placement,
            i = o ? G(o) : null,
            a = o ? es(o) : null,
            s = r.x + r.width / 2 - n.width / 2,
            l = r.y + r.height / 2 - n.height / 2;
        switch (i) {
            case "top":
                t = {
                    x: s,
                    y: r.y - n.height
                };
                break;
            case C:
                t = {
                    x: s,
                    y: r.y + r.height
                };
                break;
            case q:
                t = {
                    x: r.x + r.width,
                    y: l
                };
                break;
            case k:
                t = {
                    x: r.x - n.width,
                    y: l
                };
                break;
            default:
                t = {
                    x: r.x,
                    y: r.y
                }
        }
        var c = i ? en(i) : null;
        if (null != c) {
            var u = "y" === c ? "height" : "width";
            switch (a) {
                case O:
                    t[c] = t[c] - (r[u] / 2 - n[u] / 2);
                    break;
                case "end":
                    t[c] = t[c] + (r[u] / 2 - n[u] / 2)
            }
        }
        return t
    }

    function eA(e, t) {
        void 0 === t && (t = {});
        var r, n, o, i, a, s, l, c, u = t,
            p = u.placement,
            d = void 0 === p ? e.placement : p,
            f = u.strategy,
            h = void 0 === f ? e.strategy : f,
            m = u.boundary,
            v = u.rootBoundary,
            y = u.elementContext,
            g = void 0 === y ? _ : y,
            b = u.altBoundary,
            w = u.padding,
            x = void 0 === w ? 0 : w,
            A = ei("number" != typeof x ? x : ea(x, E)),
            R = e.rects.popper,
            I = e.elements[void 0 !== b && b ? g === _ ? "reference" : _ : g],
            S = (r = j(I) ? I : I.contextElement || Q(e.elements.popper), n = void 0 === m ? "clippingParents" : m, o = void 0 === v ? U : v, l = (s = [].concat("clippingParents" === n ? (i = eg(ee(r)), j(a = ["absolute", "fixed"].indexOf(Z(r).position) >= 0 && N(r) ? er(r) : r) ? i.filter(function(e) {
                return j(e) && Y(e, a) && "body" !== D(e)
            }) : []) : [].concat(n), [o]))[0], (c = s.reduce(function(e, t) {
                var n = ew(r, t, h);
                return e.top = F(n.top, e.top), e.right = B(n.right, e.right), e.bottom = B(n.bottom, e.bottom), e.left = F(n.left, e.left), e
            }, ew(r, l, h))).width = c.right - c.left, c.height = c.bottom - c.top, c.x = c.left, c.y = c.top, c),
            P = X(e.elements.reference),
            k = ex({
                reference: P,
                element: R,
                strategy: "absolute",
                placement: d
            }),
            T = eb(Object.assign({}, R, k)),
            O = g === _ ? T : P,
            z = {
                top: S.top - O.top + A.top,
                bottom: O.bottom - S.bottom + A.bottom,
                left: S.left - O.left + A.left,
                right: O.right - S.right + A.right
            },
            K = e.modifiersData.offset;
        if (g === _ && K) {
            var L = K[d];
            Object.keys(z).forEach(function(e) {
                var t = [q, C].indexOf(e) >= 0 ? 1 : -1,
                    r = ["top", C].indexOf(e) >= 0 ? "y" : "x";
                z[e] += L[r] * t
            })
        }
        return z
    }

    function eR(e, t, r) {
        return void 0 === r && (r = {
            x: 0,
            y: 0
        }), {
            top: e.top - t.height - r.y,
            right: e.right - t.width + r.x,
            bottom: e.bottom - t.height + r.y,
            left: e.left - t.width - r.x
        }
    }

    function eI(e) {
        return ["top", q, C, k].some(function(t) {
            return e[t] >= 0
        })
    }
    var eS = {
        placement: "bottom",
        modifiers: [],
        strategy: "absolute"
    };

    function eP() {
        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
        return !t.some(function(e) {
            return !(e && "function" == typeof e.getBoundingClientRect)
        })
    }
    var eC = (n = void 0 === (r = (t = {
        defaultModifiers: [{
            name: "eventListeners",
            enabled: !0,
            phase: "write",
            fn: function() {},
            effect: function(e) {
                var t = e.state,
                    r = e.instance,
                    n = e.options,
                    o = n.scroll,
                    i = void 0 === o || o,
                    a = n.resize,
                    s = void 0 === a || a,
                    l = M(t.elements.popper),
                    c = [].concat(t.scrollParents.reference, t.scrollParents.popper);
                return i && c.forEach(function(e) {
                        e.addEventListener("scroll", r.update, eu)
                    }), s && l.addEventListener("resize", r.update, eu),
                    function() {
                        i && c.forEach(function(e) {
                            e.removeEventListener("scroll", r.update, eu)
                        }), s && l.removeEventListener("resize", r.update, eu)
                    }
            },
            data: {}
        }, {
            name: "popperOffsets",
            enabled: !0,
            phase: "read",
            fn: function(e) {
                var t = e.state,
                    r = e.name;
                t.modifiersData[r] = ex({
                    reference: t.rects.reference,
                    element: t.rects.popper,
                    strategy: "absolute",
                    placement: t.placement
                })
            },
            data: {}
        }, {
            name: "computeStyles",
            enabled: !0,
            phase: "beforeWrite",
            fn: function(e) {
                var t = e.state,
                    r = e.options,
                    n = r.gpuAcceleration,
                    o = r.adaptive,
                    i = r.roundOffsets,
                    a = void 0 === i || i,
                    s = {
                        placement: G(t.placement),
                        variation: es(t.placement),
                        popper: t.elements.popper,
                        popperRect: t.rects.popper,
                        gpuAcceleration: void 0 === n || n,
                        isFixed: "fixed" === t.options.strategy
                    };
                null != t.modifiersData.popperOffsets && (t.styles.popper = Object.assign({}, t.styles.popper, ec(Object.assign({}, s, {
                    offsets: t.modifiersData.popperOffsets,
                    position: t.options.strategy,
                    adaptive: void 0 === o || o,
                    roundOffsets: a
                })))), null != t.modifiersData.arrow && (t.styles.arrow = Object.assign({}, t.styles.arrow, ec(Object.assign({}, s, {
                    offsets: t.modifiersData.arrow,
                    position: "absolute",
                    adaptive: !1,
                    roundOffsets: a
                })))), t.attributes.popper = Object.assign({}, t.attributes.popper, {
                    "data-popper-placement": t.placement
                })
            },
            data: {}
        }, {
            name: "applyStyles",
            enabled: !0,
            phase: "write",
            fn: function(e) {
                var t = e.state;
                Object.keys(t.elements).forEach(function(e) {
                    var r = t.styles[e] || {},
                        n = t.attributes[e] || {},
                        o = t.elements[e];
                    N(o) && D(o) && (Object.assign(o.style, r), Object.keys(n).forEach(function(e) {
                        var t = n[e];
                        !1 === t ? o.removeAttribute(e) : o.setAttribute(e, !0 === t ? "" : t)
                    }))
                })
            },
            effect: function(e) {
                var t = e.state,
                    r = {
                        popper: {
                            position: t.options.strategy,
                            left: "0",
                            top: "0",
                            margin: "0"
                        },
                        arrow: {
                            position: "absolute"
                        },
                        reference: {}
                    };
                return Object.assign(t.elements.popper.style, r.popper), t.styles = r, t.elements.arrow && Object.assign(t.elements.arrow.style, r.arrow),
                    function() {
                        Object.keys(t.elements).forEach(function(e) {
                            var n = t.elements[e],
                                o = t.attributes[e] || {},
                                i = Object.keys(t.styles.hasOwnProperty(e) ? t.styles[e] : r[e]).reduce(function(e, t) {
                                    return e[t] = "", e
                                }, {});
                            N(n) && D(n) && (Object.assign(n.style, i), Object.keys(o).forEach(function(e) {
                                n.removeAttribute(e)
                            }))
                        })
                    }
            },
            requires: ["computeStyles"]
        }, {
            name: "offset",
            enabled: !0,
            phase: "main",
            requires: ["popperOffsets"],
            fn: function(e) {
                var t = e.state,
                    r = e.options,
                    n = e.name,
                    o = r.offset,
                    i = void 0 === o ? [0, 0] : o,
                    a = K.reduce(function(e, r) {
                        var n, o, a, s, l, c;
                        return e[r] = (n = t.rects, a = [k, "top"].indexOf(o = G(r)) >= 0 ? -1 : 1, l = (s = "function" == typeof i ? i(Object.assign({}, n, {
                            placement: r
                        })) : i)[0], c = s[1], l = l || 0, c = (c || 0) * a, [k, q].indexOf(o) >= 0 ? {
                            x: c,
                            y: l
                        } : {
                            x: l,
                            y: c
                        }), e
                    }, {}),
                    s = a[t.placement],
                    l = s.x,
                    c = s.y;
                null != t.modifiersData.popperOffsets && (t.modifiersData.popperOffsets.x += l, t.modifiersData.popperOffsets.y += c), t.modifiersData[n] = a
            }
        }, {
            name: "flip",
            enabled: !0,
            phase: "main",
            fn: function(e) {
                var t = e.state,
                    r = e.options,
                    n = e.name;
                if (!t.modifiersData[n]._skip) {
                    for (var o = r.mainAxis, i = void 0 === o || o, a = r.altAxis, s = void 0 === a || a, l = r.fallbackPlacements, c = r.padding, u = r.boundary, p = r.rootBoundary, d = r.altBoundary, f = r.flipVariations, h = void 0 === f || f, m = r.allowedAutoPlacements, v = t.options.placement, y = G(v), g = l || (y !== v && h ? function(e) {
                            if (G(e) === T) return [];
                            var t = ed(e);
                            return [eh(e), t, eh(t)]
                        }(v) : [ed(v)]), b = [v].concat(g).reduce(function(e, r) {
                            var n, o, i, a, s, l, d, f, v, y, g, b;
                            return e.concat(G(r) === T ? (o = (n = {
                                placement: r,
                                boundary: u,
                                rootBoundary: p,
                                padding: c,
                                flipVariations: h,
                                allowedAutoPlacements: m
                            }).placement, i = n.boundary, a = n.rootBoundary, s = n.padding, l = n.flipVariations, f = void 0 === (d = n.allowedAutoPlacements) ? K : d, 0 === (g = (y = (v = es(o)) ? l ? z : z.filter(function(e) {
                                return es(e) === v
                            }) : E).filter(function(e) {
                                return f.indexOf(e) >= 0
                            })).length && (g = y), Object.keys(b = g.reduce(function(e, r) {
                                return e[r] = eA(t, {
                                    placement: r,
                                    boundary: i,
                                    rootBoundary: a,
                                    padding: s
                                })[G(r)], e
                            }, {})).sort(function(e, t) {
                                return b[e] - b[t]
                            })) : r)
                        }, []), w = t.rects.reference, x = t.rects.popper, A = new Map, R = !0, I = b[0], S = 0; S < b.length; S++) {
                        var P = b[S],
                            U = G(P),
                            _ = es(P) === O,
                            L = ["top", C].indexOf(U) >= 0,
                            D = L ? "width" : "height",
                            M = eA(t, {
                                placement: P,
                                boundary: u,
                                rootBoundary: p,
                                altBoundary: d,
                                padding: c
                            }),
                            j = L ? _ ? q : k : _ ? C : "top";
                        w[D] > x[D] && (j = ed(j));
                        var N = ed(j),
                            V = [];
                        if (i && V.push(M[U] <= 0), s && V.push(M[j] <= 0, M[N] <= 0), V.every(function(e) {
                                return e
                            })) {
                            I = P, R = !1;
                            break
                        }
                        A.set(P, V)
                    }
                    if (R)
                        for (var F = function(e) {
                                var t = b.find(function(t) {
                                    var r = A.get(t);
                                    if (r) return r.slice(0, e).every(function(e) {
                                        return e
                                    })
                                });
                                if (t) return I = t, "break"
                            }, B = h ? 3 : 1; B > 0 && "break" !== F(B); B--);
                    t.placement !== I && (t.modifiersData[n]._skip = !0, t.placement = I, t.reset = !0)
                }
            },
            requiresIfExists: ["offset"],
            data: {
                _skip: !1
            }
        }, {
            name: "preventOverflow",
            enabled: !0,
            phase: "main",
            fn: function(e) {
                var t = e.state,
                    r = e.options,
                    n = e.name,
                    o = r.mainAxis,
                    i = r.altAxis,
                    a = r.boundary,
                    s = r.rootBoundary,
                    l = r.altBoundary,
                    c = r.padding,
                    u = r.tether,
                    p = void 0 === u || u,
                    d = r.tetherOffset,
                    f = void 0 === d ? 0 : d,
                    h = eA(t, {
                        boundary: a,
                        rootBoundary: s,
                        padding: c,
                        altBoundary: l
                    }),
                    m = G(t.placement),
                    v = es(t.placement),
                    y = !v,
                    g = en(m),
                    b = "x" === g ? "y" : "x",
                    w = t.modifiersData.popperOffsets,
                    x = t.rects.reference,
                    A = t.rects.popper,
                    R = "function" == typeof f ? f(Object.assign({}, t.rects, {
                        placement: t.placement
                    })) : f,
                    I = "number" == typeof R ? {
                        mainAxis: R,
                        altAxis: R
                    } : Object.assign({
                        mainAxis: 0,
                        altAxis: 0
                    }, R),
                    S = t.modifiersData.offset ? t.modifiersData.offset[t.placement] : null,
                    P = {
                        x: 0,
                        y: 0
                    };
                if (w) {
                    if (void 0 === o || o) {
                        var T, E = "y" === g ? "top" : k,
                            U = "y" === g ? C : q,
                            _ = "y" === g ? "height" : "width",
                            z = w[g],
                            K = z + h[E],
                            L = z - h[U],
                            D = p ? -A[_] / 2 : 0,
                            M = v === O ? x[_] : A[_],
                            j = v === O ? -A[_] : -x[_],
                            N = t.elements.arrow,
                            V = p && N ? $(N) : {
                                width: 0,
                                height: 0
                            },
                            W = t.modifiersData["arrow#persistent"] ? t.modifiersData["arrow#persistent"].padding : {
                                top: 0,
                                right: 0,
                                bottom: 0,
                                left: 0
                            },
                            H = W[E],
                            J = W[U],
                            X = eo(0, x[_], V[_]),
                            Y = y ? x[_] / 2 - D - X - H - I.mainAxis : M - X - H - I.mainAxis,
                            Z = y ? -x[_] / 2 + D + X + J + I.mainAxis : j + X + J + I.mainAxis,
                            Q = t.elements.arrow && er(t.elements.arrow),
                            ee = Q ? "y" === g ? Q.clientTop || 0 : Q.clientLeft || 0 : 0,
                            et = null != (T = null == S ? void 0 : S[g]) ? T : 0,
                            ei = eo(p ? B(K, z + Y - et - ee) : K, z, p ? F(L, z + Z - et) : L);
                        w[g] = ei, P[g] = ei - z
                    }
                    if (void 0 !== i && i) {
                        var ea, el, ec = "x" === g ? "top" : k,
                            eu = "x" === g ? C : q,
                            ep = w[b],
                            ed = "y" === b ? "height" : "width",
                            ef = ep + h[ec],
                            eh = ep - h[eu],
                            em = -1 !== ["top", k].indexOf(m),
                            ev = null != (el = null == S ? void 0 : S[b]) ? el : 0,
                            ey = em ? ef : ep - x[ed] - A[ed] - ev + I.altAxis,
                            eg = em ? ep + x[ed] + A[ed] - ev - I.altAxis : eh,
                            eb = p && em ? (ea = eo(ey, ep, eg)) > eg ? eg : ea : eo(p ? ey : ef, ep, p ? eg : eh);
                        w[b] = eb, P[b] = eb - ep
                    }
                    t.modifiersData[n] = P
                }
            },
            requiresIfExists: ["offset"]
        }, {
            name: "arrow",
            enabled: !0,
            phase: "main",
            fn: function(e) {
                var t, r = e.state,
                    n = e.name,
                    o = e.options,
                    i = r.elements.arrow,
                    a = r.modifiersData.popperOffsets,
                    s = G(r.placement),
                    l = en(s),
                    c = [k, q].indexOf(s) >= 0 ? "height" : "width";
                if (i && a) {
                    var u, p = (u = o.padding, ei("number" != typeof(u = "function" == typeof u ? u(Object.assign({}, r.rects, {
                            placement: r.placement
                        })) : u) ? u : ea(u, E))),
                        d = $(i),
                        f = "y" === l ? "top" : k,
                        h = "y" === l ? C : q,
                        m = r.rects.reference[c] + r.rects.reference[l] - a[l] - r.rects.popper[c],
                        v = a[l] - r.rects.reference[l],
                        y = er(i),
                        g = y ? "y" === l ? y.clientHeight || 0 : y.clientWidth || 0 : 0,
                        b = p[f],
                        w = g - d[c] - p[h],
                        x = g / 2 - d[c] / 2 + (m / 2 - v / 2),
                        A = eo(b, x, w);
                    r.modifiersData[n] = ((t = {})[l] = A, t.centerOffset = A - x, t)
                }
            },
            effect: function(e) {
                var t = e.state,
                    r = e.options.element,
                    n = void 0 === r ? "[data-popper-arrow]" : r;
                null != n && ("string" != typeof n || (n = t.elements.popper.querySelector(n))) && Y(t.elements.popper, n) && (t.elements.arrow = n)
            },
            requires: ["popperOffsets"],
            requiresIfExists: ["preventOverflow"]
        }, {
            name: "hide",
            enabled: !0,
            phase: "main",
            requiresIfExists: ["preventOverflow"],
            fn: function(e) {
                var t = e.state,
                    r = e.name,
                    n = t.rects.reference,
                    o = t.rects.popper,
                    i = t.modifiersData.preventOverflow,
                    a = eA(t, {
                        elementContext: "reference"
                    }),
                    s = eA(t, {
                        altBoundary: !0
                    }),
                    l = eR(a, n),
                    c = eR(s, o, i),
                    u = eI(l),
                    p = eI(c);
                t.modifiersData[r] = {
                    referenceClippingOffsets: l,
                    popperEscapeOffsets: c,
                    isReferenceHidden: u,
                    hasPopperEscaped: p
                }, t.attributes.popper = Object.assign({}, t.attributes.popper, {
                    "data-popper-reference-hidden": u,
                    "data-popper-escaped": p
                })
            }
        }]
    }).defaultModifiers) ? [] : r, i = void 0 === (o = t.defaultOptions) ? eS : o, function(e, t, r) {
        void 0 === r && (r = i);
        var o, a, s = {
                placement: "bottom",
                orderedModifiers: [],
                options: Object.assign({}, eS, i),
                modifiersData: {},
                elements: {
                    reference: e,
                    popper: t
                },
                attributes: {},
                styles: {}
            },
            l = [],
            c = !1,
            u = {
                state: s,
                setOptions: function(r) {
                    var o = "function" == typeof r ? r(s.options) : r;
                    p(), s.options = Object.assign({}, i, s.options, o), s.scrollParents = {
                        reference: j(e) ? eg(e) : e.contextElement ? eg(e.contextElement) : [],
                        popper: eg(t)
                    };
                    var a, c, d, f, h, m, v = (a = Object.keys(m = [].concat(n, s.options.modifiers).reduce(function(e, t) {
                        var r = e[t.name];
                        return e[t.name] = r ? Object.assign({}, r, t, {
                            options: Object.assign({}, r.options, t.options),
                            data: Object.assign({}, r.data, t.data)
                        }) : t, e
                    }, {})).map(function(e) {
                        return m[e]
                    }), c = new Map, d = new Set, f = [], a.forEach(function(e) {
                        c.set(e.name, e)
                    }), a.forEach(function(e) {
                        d.has(e.name) || function e(t) {
                            d.add(t.name), [].concat(t.requires || [], t.requiresIfExists || []).forEach(function(t) {
                                if (!d.has(t)) {
                                    var r = c.get(t);
                                    r && e(r)
                                }
                            }), f.push(t)
                        }(e)
                    }), h = f, L.reduce(function(e, t) {
                        return e.concat(h.filter(function(e) {
                            return e.phase === t
                        }))
                    }, []));
                    return s.orderedModifiers = v.filter(function(e) {
                        return e.enabled
                    }), s.orderedModifiers.forEach(function(e) {
                        var t = e.name,
                            r = e.options,
                            n = e.effect;
                        if ("function" == typeof n) {
                            var o = n({
                                state: s,
                                name: t,
                                instance: u,
                                options: void 0 === r ? {} : r
                            });
                            l.push(o || function() {})
                        }
                    }), u.update()
                },
                forceUpdate: function() {
                    if (!c) {
                        var e = s.elements,
                            t = e.reference,
                            r = e.popper;
                        if (eP(t, r)) {
                            s.rects = {
                                reference: (n = er(r), o = "fixed" === s.options.strategy, p = N(n), d = N(n) && (a = W((i = n.getBoundingClientRect()).width) / n.offsetWidth || 1, l = W(i.height) / n.offsetHeight || 1, 1 !== a || 1 !== l), f = Q(n), h = X(t, d, o), m = {
                                    scrollLeft: 0,
                                    scrollTop: 0
                                }, v = {
                                    x: 0,
                                    y: 0
                                }, (p || !p && !o) && (("body" !== D(n) || ey(f)) && (m = n !== M(n) && N(n) ? {
                                    scrollLeft: n.scrollLeft,
                                    scrollTop: n.scrollTop
                                } : em(n)), N(n) ? ((v = X(n, !0)).x += n.clientLeft, v.y += n.clientTop) : f && (v.x = ev(f))), {
                                    x: h.left + m.scrollLeft - v.x,
                                    y: h.top + m.scrollTop - v.y,
                                    width: h.width,
                                    height: h.height
                                }),
                                popper: $(r)
                            }, s.reset = !1, s.placement = s.options.placement, s.orderedModifiers.forEach(function(e) {
                                return s.modifiersData[e.name] = Object.assign({}, e.data)
                            });
                            for (var n, o, i, a, l, p, d, f, h, m, v, y = 0; y < s.orderedModifiers.length; y++)
                                if (!0 !== s.reset) {
                                    var g = s.orderedModifiers[y],
                                        b = g.fn,
                                        w = g.options,
                                        x = void 0 === w ? {} : w,
                                        A = g.name;
                                    "function" == typeof b && (s = b({
                                        state: s,
                                        options: x,
                                        name: A,
                                        instance: u
                                    }) || s)
                                } else s.reset = !1, y = -1
                        }
                    }
                },
                update: (o = function() {
                    return new Promise(function(e) {
                        u.forceUpdate(), e(s)
                    })
                }, function() {
                    return a || (a = new Promise(function(e) {
                        Promise.resolve().then(function() {
                            a = void 0, e(o())
                        })
                    })), a
                }),
                destroy: function() {
                    p(), c = !0
                }
            };
        if (!eP(e, t)) return u;

        function p() {
            l.forEach(function(e) {
                return e()
            }), l = []
        }
        return u.setOptions(r).then(function(e) {
            !c && r.onFirstUpdate && r.onFirstUpdate(e)
        }), u
    });

    function eq(e) {
        return (0, u.g)("MuiPopper", e)
    }(0, h.g)("MuiPopper", ["root"]);
    let ek = ["anchorEl", "children", "direction", "disablePortal", "modifiers", "open", "placement", "popperOptions", "popperRef", "slotProps", "slots", "TransitionProps", "ownerState"],
        eT = ["anchorEl", "children", "container", "direction", "disablePortal", "keepMounted", "modifiers", "open", "placement", "popperOptions", "popperRef", "style", "transition", "slotProps", "slots"];

    function eE(e) {
        return "function" == typeof e ? e() : e
    }
    let eO = {},
        eU = s.forwardRef(function(e, t) {
            var r;
            let {
                anchorEl: n,
                children: o,
                direction: i,
                disablePortal: a,
                modifiers: l,
                open: c,
                placement: f,
                popperOptions: h,
                popperRef: v,
                slotProps: y = {},
                slots: x = {},
                TransitionProps: A
            } = e, R = (0, u._)(e, ek), I = s.useRef(null), S = (0, g.u)(I, t), P = s.useRef(null), C = (0, g.u)(P, v), q = s.useRef(C);
            (0, b.u)(() => {
                q.current = C
            }, [C]), s.useImperativeHandle(v, () => P.current, []);
            let k = function(e, t) {
                    if ("ltr" === t) return e;
                    switch (e) {
                        case "bottom-end":
                            return "bottom-start";
                        case "bottom-start":
                            return "bottom-end";
                        case "top-end":
                            return "top-start";
                        case "top-start":
                            return "top-end";
                        default:
                            return e
                    }
                }(f, i),
                [T, E] = s.useState(k),
                [O, U] = s.useState(eE(n));
            s.useEffect(() => {
                P.current && P.current.forceUpdate()
            }), s.useEffect(() => {
                n && U(eE(n))
            }, [n]), (0, b.u)(() => {
                if (!O || !c) return;
                let e = [{
                    name: "preventOverflow",
                    options: {
                        altBoundary: a
                    }
                }, {
                    name: "flip",
                    options: {
                        altBoundary: a
                    }
                }, {
                    name: "onUpdate",
                    enabled: !0,
                    phase: "afterWrite",
                    fn: e => {
                        let {
                            state: t
                        } = e;
                        E(t.placement)
                    }
                }];
                null != l && (e = e.concat(l)), h && null != h.modifiers && (e = e.concat(h.modifiers));
                let t = eC(O, I.current, (0, p._)({
                    placement: k
                }, h, {
                    modifiers: e
                }));
                return q.current(t), () => {
                    t.destroy(), q.current(null)
                }
            }, [O, a, l, c, h, k]);
            let _ = {
                placement: T
            };
            null !== A && (_.TransitionProps = A);
            let z = (e => {
                    let {
                        classes: t
                    } = e;
                    return (0, d.a)({
                        root: ["root"]
                    }, eq, t)
                })(e),
                K = null != (r = x.root) ? r : "div",
                L = (0, w.u)({
                    elementType: K,
                    externalSlotProps: y.root,
                    externalForwardedProps: R,
                    additionalProps: {
                        role: "tooltip",
                        ref: S
                    },
                    ownerState: e,
                    className: z.root
                });
            return (0, m.jsx)(K, (0, p._)({}, L, {
                children: "function" == typeof o ? o(_) : o
            }))
        }),
        e_ = s.forwardRef(function(e, t) {
            let r, {
                    anchorEl: n,
                    children: o,
                    container: i,
                    direction: a = "ltr",
                    disablePortal: l = !1,
                    keepMounted: c = !1,
                    modifiers: d,
                    open: f,
                    placement: h = "bottom",
                    popperOptions: g = eO,
                    popperRef: b,
                    style: w,
                    transition: x = !1,
                    slotProps: A = {},
                    slots: R = {}
                } = e,
                I = (0, u._)(e, eT),
                [S, P] = s.useState(!0);
            if (!c && !f && (!x || S)) return null;
            if (i) r = i;
            else if (n) {
                let e = eE(n);
                r = e && void 0 !== e.nodeType ? (0, v.o)(e).body : (0, v.o)(null).body
            }
            let C = x ? {
                in: f,
                onEnter: () => {
                    P(!1)
                },
                onExited: () => {
                    P(!0)
                }
            } : void 0;
            return (0, m.jsx)(y.P, {
                disablePortal: l,
                container: r,
                children: (0, m.jsx)(eU, (0, p._)({
                    anchorEl: n,
                    direction: a,
                    disablePortal: l,
                    modifiers: d,
                    ref: t,
                    open: x ? !S : f,
                    placement: h,
                    popperOptions: g,
                    popperRef: b,
                    slotProps: A,
                    slots: R
                }, I, {
                    style: (0, p._)({
                        position: "fixed",
                        top: 0,
                        left: 0,
                        display: f || !c || x && !S ? void 0 : "none"
                    }, w),
                    TransitionProps: C,
                    children: o
                }))
            })
        }),
        ez = ["anchorEl", "component", "components", "componentsProps", "container", "disablePortal", "keepMounted", "modifiers", "open", "placement", "popperOptions", "popperRef", "transition", "slots", "slotProps"],
        eK = (0, d.s)(e_, {
            name: "MuiPopper",
            slot: "Root",
            overridesResolver: (e, t) => t.root
        })({}),
        eL = s.forwardRef(function(e, t) {
            var r;
            let n = R(),
                o = (0, x.u)({
                    props: e,
                    name: "MuiPopper"
                }),
                {
                    anchorEl: i,
                    component: a,
                    components: s,
                    componentsProps: l,
                    container: c,
                    disablePortal: d,
                    keepMounted: f,
                    modifiers: h,
                    open: v,
                    placement: y,
                    popperOptions: g,
                    popperRef: b,
                    transition: w,
                    slots: A,
                    slotProps: I
                } = o,
                S = (0, u._)(o, ez),
                P = null != (r = null == A ? void 0 : A.root) ? r : null == s ? void 0 : s.Root,
                C = (0, p._)({
                    anchorEl: i,
                    container: c,
                    disablePortal: d,
                    keepMounted: f,
                    modifiers: h,
                    open: v,
                    placement: y,
                    popperOptions: g,
                    popperRef: b,
                    transition: w
                }, S);
            return (0, m.jsx)(eK, (0, p._)({
                as: a,
                direction: null == n ? void 0 : n.direction,
                slots: {
                    root: P
                },
                slotProps: null != I ? I : l
            }, C, {
                ref: t
            }))
        });
    e.s(["M", 0, eL], 682018);
    var eD = e.i(342607),
        eM = e.i(353512),
        ej = e.i(946029),
        eN = e.i(236365),
        eV = e.i(950711),
        eG = e.i(352705),
        eF = e.i(782353),
        eB = e.i(577474),
        eW = e.i(81962);

    function eH(e) {
        return (0, u.g)("MuiTooltip", e)
    }
    e.i(304064);
    var eJ = (0, h.g)("MuiTooltip", ["popper", "popperInteractive", "popperArrow", "popperClose", "tooltip", "tooltipArrow", "touch", "tooltipPlacementLeft", "tooltipPlacementRight", "tooltipPlacementTop", "tooltipPlacementBottom", "arrow"]);
    let eX = ["arrow", "children", "classes", "components", "componentsProps", "describeChild", "disableFocusListener", "disableHoverListener", "disableInteractive", "disableTouchListener", "enterDelay", "enterNextDelay", "enterTouchDelay", "followCursor", "id", "leaveDelay", "leaveTouchDelay", "onClose", "onOpen", "open", "placement", "PopperComponent", "PopperProps", "slotProps", "slots", "title", "TransitionComponent", "TransitionProps"],
        e$ = (0, d.s)(eL, {
            name: "MuiTooltip",
            slot: "Popper",
            overridesResolver: (e, t) => {
                let {
                    ownerState: r
                } = e;
                return [t.popper, !r.disableInteractive && t.popperInteractive, r.arrow && t.popperArrow, !r.open && t.popperClose]
            }
        })(e => {
            let {
                theme: t,
                ownerState: r,
                open: n
            } = e;
            return (0, p._)({
                zIndex: (t.vars || t).zIndex.tooltip,
                pointerEvents: "none"
            }, !r.disableInteractive && {
                pointerEvents: "auto"
            }, !n && {
                pointerEvents: "none"
            }, r.arrow && {
                ['&[data-popper-placement*="bottom"] .'.concat(eJ.arrow)]: {
                    top: 0,
                    marginTop: "-0.71em",
                    "&::before": {
                        transformOrigin: "0 100%"
                    }
                },
                ['&[data-popper-placement*="top"] .'.concat(eJ.arrow)]: {
                    bottom: 0,
                    marginBottom: "-0.71em",
                    "&::before": {
                        transformOrigin: "100% 0"
                    }
                },
                ['&[data-popper-placement*="right"] .'.concat(eJ.arrow)]: (0, p._)({}, r.isRtl ? {
                    right: 0,
                    marginRight: "-0.71em"
                } : {
                    left: 0,
                    marginLeft: "-0.71em"
                }, {
                    height: "1em",
                    width: "0.71em",
                    "&::before": {
                        transformOrigin: "100% 100%"
                    }
                }),
                ['&[data-popper-placement*="left"] .'.concat(eJ.arrow)]: (0, p._)({}, r.isRtl ? {
                    left: 0,
                    marginLeft: "-0.71em"
                } : {
                    right: 0,
                    marginRight: "-0.71em"
                }, {
                    height: "1em",
                    width: "0.71em",
                    "&::before": {
                        transformOrigin: "0 0"
                    }
                })
            })
        }),
        eY = (0, d.s)("div", {
            name: "MuiTooltip",
            slot: "Tooltip",
            overridesResolver: (e, t) => {
                let {
                    ownerState: r
                } = e;
                return [t.tooltip, r.touch && t.touch, r.arrow && t.tooltipArrow, t["tooltipPlacement".concat((0, u.a)(r.placement.split("-")[0]))]]
            }
        })(e => {
            let {
                theme: t,
                ownerState: r
            } = e;
            return (0, p._)({
                backgroundColor: t.vars ? t.vars.palette.Tooltip.bg : (0, u.b)(t.palette.grey[700], .92),
                borderRadius: (t.vars || t).shape.borderRadius,
                color: (t.vars || t).palette.common.white,
                fontFamily: t.typography.fontFamily,
                padding: "4px 8px",
                fontSize: t.typography.pxToRem(11),
                maxWidth: 300,
                margin: 2,
                wordWrap: "break-word",
                fontWeight: t.typography.fontWeightMedium
            }, r.arrow && {
                position: "relative",
                margin: 0
            }, r.touch && {
                padding: "8px 16px",
                fontSize: t.typography.pxToRem(14),
                lineHeight: Math.round(16 / 14 * 1e5) / 1e5 + "em",
                fontWeight: t.typography.fontWeightRegular
            }, {
                [".".concat(eJ.popper, '[data-popper-placement*="left"] &')]: (0, p._)({
                    transformOrigin: "right center"
                }, r.isRtl ? (0, p._)({
                    marginLeft: "14px"
                }, r.touch && {
                    marginLeft: "24px"
                }) : (0, p._)({
                    marginRight: "14px"
                }, r.touch && {
                    marginRight: "24px"
                })),
                [".".concat(eJ.popper, '[data-popper-placement*="right"] &')]: (0, p._)({
                    transformOrigin: "left center"
                }, r.isRtl ? (0, p._)({
                    marginRight: "14px"
                }, r.touch && {
                    marginRight: "24px"
                }) : (0, p._)({
                    marginLeft: "14px"
                }, r.touch && {
                    marginLeft: "24px"
                })),
                [".".concat(eJ.popper, '[data-popper-placement*="top"] &')]: (0, p._)({
                    transformOrigin: "center bottom",
                    marginBottom: "14px"
                }, r.touch && {
                    marginBottom: "24px"
                }),
                [".".concat(eJ.popper, '[data-popper-placement*="bottom"] &')]: (0, p._)({
                    transformOrigin: "center top",
                    marginTop: "14px"
                }, r.touch && {
                    marginTop: "24px"
                })
            })
        }),
        eZ = (0, d.s)("span", {
            name: "MuiTooltip",
            slot: "Arrow",
            overridesResolver: (e, t) => t.arrow
        })(e => {
            let {
                theme: t
            } = e;
            return {
                overflow: "hidden",
                position: "absolute",
                width: "1em",
                height: "0.71em",
                boxSizing: "border-box",
                color: t.vars ? t.vars.palette.Tooltip.bg : (0, u.b)(t.palette.grey[700], .9),
                "&::before": {
                    content: '""',
                    margin: "auto",
                    display: "block",
                    width: "100%",
                    height: "100%",
                    backgroundColor: "currentColor",
                    transform: "rotate(45deg)"
                }
            }
        }),
        eQ = !1,
        e0 = new eM.T,
        e1 = {
            x: 0,
            y: 0
        };

    function e2(e, t) {
        return function(r) {
            for (var n = arguments.length, o = Array(n > 1 ? n - 1 : 0), i = 1; i < n; i++) o[i - 1] = arguments[i];
            t && t(r, ...o), e(r, ...o)
        }
    }
    let e4 = s.forwardRef(function(e, t) {
        var r, n, o, i, a, l, c, h, v, y, b, w, A, R, I, S, P, C, q;
        let k = (0, x.u)({
                props: e,
                name: "MuiTooltip"
            }),
            {
                arrow: T = !1,
                children: E,
                components: O = {},
                componentsProps: U = {},
                describeChild: _ = !1,
                disableFocusListener: z = !1,
                disableHoverListener: K = !1,
                disableInteractive: L = !1,
                disableTouchListener: D = !1,
                enterDelay: M = 100,
                enterNextDelay: j = 0,
                enterTouchDelay: N = 700,
                followCursor: V = !1,
                id: G,
                leaveDelay: F = 0,
                leaveTouchDelay: B = 1500,
                onClose: W,
                onOpen: H,
                open: J,
                placement: X = "bottom",
                PopperComponent: $,
                PopperProps: Y = {},
                slotProps: Z = {},
                slots: Q = {},
                title: ee,
                TransitionComponent: et = eB.G,
                TransitionProps: er
            } = k,
            en = (0, u._)(k, eX),
            eo = s.isValidElement(E) ? E : (0, m.jsx)("span", {
                children: E
            }),
            ei = (0, eD.u)(),
            ea = (0, f.u)(),
            [es, el] = s.useState(),
            [ec, eu] = s.useState(null),
            ep = s.useRef(!1),
            ed = L || V,
            ef = (0, eM.u)(),
            eh = (0, eM.u)(),
            em = (0, eM.u)(),
            ev = (0, eM.u)(),
            [ey, eg] = (0, ej.u)({
                controlled: J,
                default: !1,
                name: "Tooltip",
                state: "open"
            }),
            eb = ey,
            ew = (0, eN.u)(G),
            ex = s.useRef(),
            eA = (0, eV.u)(() => {
                void 0 !== ex.current && (document.body.style.WebkitUserSelect = ex.current, ex.current = void 0), ev.clear()
            });
        s.useEffect(() => eA, [eA]);
        let eR = e => {
                e0.clear(), eQ = !0, eg(!0), H && !eb && H(e)
            },
            eI = (0, eV.u)(e => {
                e0.start(800 + F, () => {
                    eQ = !1
                }), eg(!1), W && eb && W(e), ef.start(ei.transitions.duration.shortest, () => {
                    ep.current = !1
                })
            }),
            eS = e => {
                ep.current && "touchstart" !== e.type || (es && es.removeAttribute("title"), eh.clear(), em.clear(), M || eQ && j ? eh.start(eQ ? j : M, () => {
                    eR(e)
                }) : eR(e))
            },
            eP = e => {
                eh.clear(), em.start(F, () => {
                    eI(e)
                })
            },
            {
                isFocusVisibleRef: eC,
                onBlur: eq,
                onFocus: ek,
                ref: eT
            } = (0, eG.u)(),
            [, eE] = s.useState(!1),
            eO = e => {
                eq(e), !1 === eC.current && (eE(!1), eP(e))
            },
            eU = e => {
                es || el(e.currentTarget), ek(e), !0 === eC.current && (eE(!0), eS(e))
            },
            e_ = e => {
                ep.current = !0;
                let t = eo.props;
                t.onTouchStart && t.onTouchStart(e)
            };
        s.useEffect(() => {
            if (eb) return document.addEventListener("keydown", e), () => {
                document.removeEventListener("keydown", e)
            };

            function e(e) {
                "Escape" !== e.key && "Esc" !== e.key || eI(e)
            }
        }, [eI, eb]);
        let ez = (0, g.u)((0, eF.g)(eo), eT, el, t);
        ee || 0 === ee || (eb = !1);
        let eK = s.useRef(),
            eJ = {},
            e4 = "string" == typeof ee;
        _ ? (eJ.title = eb || !e4 || K ? null : ee, eJ["aria-describedby"] = eb ? ew : null) : (eJ["aria-label"] = e4 ? ee : null, eJ["aria-labelledby"] = eb && !e4 ? ew : null);
        let e5 = (0, p._)({}, eJ, en, eo.props, {
                className: (0, d.c)(en.className, eo.props.className),
                onTouchStart: e_,
                ref: ez
            }, V ? {
                onMouseMove: e => {
                    let t = eo.props;
                    t.onMouseMove && t.onMouseMove(e), e1 = {
                        x: e.clientX,
                        y: e.clientY
                    }, eK.current && eK.current.update()
                }
            } : {}),
            e6 = {};
        D || (e5.onTouchStart = e => {
            e_(e), em.clear(), ef.clear(), eA(), ex.current = document.body.style.WebkitUserSelect, document.body.style.WebkitUserSelect = "none", ev.start(N, () => {
                document.body.style.WebkitUserSelect = ex.current, eS(e)
            })
        }, e5.onTouchEnd = e => {
            eo.props.onTouchEnd && eo.props.onTouchEnd(e), eA(), em.start(B, () => {
                eI(e)
            })
        }), K || (e5.onMouseOver = e2(eS, e5.onMouseOver), e5.onMouseLeave = e2(eP, e5.onMouseLeave), ed || (e6.onMouseOver = eS, e6.onMouseLeave = eP)), z || (e5.onFocus = e2(eU, e5.onFocus), e5.onBlur = e2(eO, e5.onBlur), ed || (e6.onFocus = eU, e6.onBlur = eO));
        let e7 = s.useMemo(() => {
                var e;
                let t = [{
                    name: "arrow",
                    enabled: !!ec,
                    options: {
                        element: ec,
                        padding: 4
                    }
                }];
                return null != (e = Y.popperOptions) && e.modifiers && (t = t.concat(Y.popperOptions.modifiers)), (0, p._)({}, Y.popperOptions, {
                    modifiers: t
                })
            }, [ec, Y]),
            e9 = (0, p._)({}, k, {
                isRtl: ea,
                arrow: T,
                disableInteractive: ed,
                placement: X,
                PopperComponentProp: $,
                touch: ep.current
            }),
            e3 = (e => {
                let {
                    classes: t,
                    disableInteractive: r,
                    arrow: n,
                    touch: o,
                    placement: i
                } = e, a = {
                    popper: ["popper", !r && "popperInteractive", n && "popperArrow"],
                    tooltip: ["tooltip", n && "tooltipArrow", o && "touch", "tooltipPlacement".concat((0, u.a)(i.split("-")[0]))],
                    arrow: ["arrow"]
                };
                return (0, d.a)(a, eH, t)
            })(e9),
            e8 = null != (r = null != (n = Q.popper) ? n : O.Popper) ? r : e$,
            te = null != (o = null != (i = null != (a = Q.transition) ? a : O.Transition) ? i : et) ? o : eB.G,
            tt = null != (l = null != (c = Q.tooltip) ? c : O.Tooltip) ? l : eY,
            tr = null != (h = null != (v = Q.arrow) ? v : O.Arrow) ? h : eZ,
            tn = (0, eW.a)(e8, (0, p._)({}, Y, null != (y = Z.popper) ? y : U.popper, {
                className: (0, d.c)(e3.popper, null == Y ? void 0 : Y.className, null == (b = null != (w = Z.popper) ? w : U.popper) ? void 0 : b.className)
            }), e9),
            to = (0, eW.a)(te, (0, p._)({}, er, null != (A = Z.transition) ? A : U.transition), e9),
            ti = (0, eW.a)(tt, (0, p._)({}, null != (R = Z.tooltip) ? R : U.tooltip, {
                className: (0, d.c)(e3.tooltip, null == (I = null != (S = Z.tooltip) ? S : U.tooltip) ? void 0 : I.className)
            }), e9),
            ta = (0, eW.a)(tr, (0, p._)({}, null != (P = Z.arrow) ? P : U.arrow, {
                className: (0, d.c)(e3.arrow, null == (C = null != (q = Z.arrow) ? q : U.arrow) ? void 0 : C.className)
            }), e9);
        return (0, m.jsxs)(s.Fragment, {
            children: [s.cloneElement(eo, e5), (0, m.jsx)(e8, (0, p._)({
                as: null != $ ? $ : eL,
                placement: X,
                anchorEl: V ? {
                    getBoundingClientRect: () => ({
                        top: e1.y,
                        left: e1.x,
                        right: e1.x,
                        bottom: e1.y,
                        width: 0,
                        height: 0
                    })
                } : es,
                popperRef: eK,
                open: !!es && eb,
                id: ew,
                transition: !0
            }, e6, tn, {
                popperOptions: e7,
                children: e => {
                    let {
                        TransitionProps: t
                    } = e;
                    return (0, m.jsx)(te, (0, p._)({
                        timeout: ei.transitions.duration.shorter
                    }, t, to, {
                        children: (0, m.jsxs)(tt, (0, p._)({}, ti, {
                            children: [ee, T ? (0, m.jsx)(tr, (0, p._)({}, ta, {
                                ref: eu
                            })) : null]
                        }))
                    }))
                }
            }))]
        })
    });
    var e5 = (0, l.default)({
            name: "Tooltip"
        })(function(e) {
            return {
                tooltip: (0, a._)({
                    color: e.palette.content.inverse,
                    backgroundColor: e.palette.actionV2.primary.fill
                }, e.typography.tooltip),
                arrow: {
                    color: e.palette.actionV2.primary.fill
                }
            }
        }),
        e6 = (0, s.forwardRef)(function(e, t) {
            var r = e.classes,
                n = e.className,
                o = (0, a.a)(e, ["classes", "className"]),
                i = e5(void 0, {
                    props: {
                        classes: (0, c.default)(r, n)
                    }
                });
            return s.default.createElement(e4, (0, a._)({}, o, {
                classes: i.classes,
                ref: t
            }))
        });
    e.s(["Tooltip", 0, e6], 257256)
}, 794472, 648210, e => {
    "use strict";
    let t, r, n, o, i, a;
    var s = e.i(194250),
        l = e.i(416340),
        c = e.i(863605),
        u = e.i(154502),
        p = e.i(569384),
        d = e.i(690569),
        f = e.i(945146),
        h = e.i(251635),
        m = e.i(977987),
        v = e.i(787802),
        y = e.i(221628),
        g = e.i(121880),
        b = e.i(945589);

    function w() {
        let e = (0, p._)(["\n  0% {\n    left: -35%;\n    right: 100%;\n  }\n\n  60% {\n    left: 100%;\n    right: -90%;\n  }\n\n  100% {\n    left: 100%;\n    right: -90%;\n  }\n"]);
        return w = function() {
            return e
        }, e
    }

    function x() {
        let e = (0, p._)(["\n  0% {\n    left: -200%;\n    right: 100%;\n  }\n\n  60% {\n    left: 107%;\n    right: -8%;\n  }\n\n  100% {\n    left: 107%;\n    right: -8%;\n  }\n"]);
        return x = function() {
            return e
        }, e
    }

    function A() {
        let e = (0, p._)(["\n  0% {\n    opacity: 1;\n    background-position: 0 -23px;\n  }\n\n  60% {\n    opacity: 0;\n    background-position: 0 -23px;\n  }\n\n  100% {\n    opacity: 1;\n    background-position: -200px -23px;\n  }\n"]);
        return A = function() {
            return e
        }, e
    }

    function R() {
        let e = (0, p._)(["\n    animation: ", " 3s infinite linear;\n  "]);
        return R = function() {
            return e
        }, e
    }

    function I() {
        let e = (0, p._)(["\n      width: auto;\n      animation: ", " 2.1s cubic-bezier(0.65, 0.815, 0.735, 0.395) infinite;\n    "]);
        return I = function() {
            return e
        }, e
    }

    function S() {
        let e = (0, p._)(["\n      width: auto;\n      animation: ", " 2.1s cubic-bezier(0.165, 0.84, 0.44, 1) 1.15s infinite;\n    "]);
        return S = function() {
            return e
        }, e
    }

    function P(e) {
        return (0, d.g)("MuiLinearProgress", e)
    }(0, v.g)("MuiLinearProgress", ["root", "colorPrimary", "colorSecondary", "determinate", "indeterminate", "buffer", "query", "dashed", "dashedColorPrimary", "dashedColorSecondary", "bar", "barColorPrimary", "barColorSecondary", "bar1Indeterminate", "bar1Determinate", "bar1Buffer", "bar2Indeterminate", "bar2Buffer"]);
    let C = ["className", "color", "value", "valueBuffer", "variant"],
        q = (0, b.keyframes)(t || (t = w())),
        k = (0, b.keyframes)(r || (r = x())),
        T = (0, b.keyframes)(n || (n = A())),
        E = (e, t) => "inherit" === t ? "currentColor" : e.vars ? e.vars.palette.LinearProgress["".concat(t, "Bg")] : "light" === e.palette.mode ? (0, d.l)(e.palette[t].main, .62) : (0, d.j)(e.palette[t].main, .5),
        O = (0, h.s)("span", {
            name: "MuiLinearProgress",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: r
                } = e;
                return [t.root, t["color".concat((0, d.a)(r.color))], t[r.variant]]
            }
        })(e => {
            let {
                ownerState: t,
                theme: r
            } = e;
            return (0, f._)({
                position: "relative",
                overflow: "hidden",
                display: "block",
                height: 4,
                zIndex: 0,
                "@media print": {
                    colorAdjust: "exact"
                },
                backgroundColor: E(r, t.color)
            }, "inherit" === t.color && "buffer" !== t.variant && {
                backgroundColor: "none",
                "&::before": {
                    content: '""',
                    position: "absolute",
                    left: 0,
                    top: 0,
                    right: 0,
                    bottom: 0,
                    backgroundColor: "currentColor",
                    opacity: .3
                }
            }, "buffer" === t.variant && {
                backgroundColor: "transparent"
            }, "query" === t.variant && {
                transform: "rotate(180deg)"
            })
        }),
        U = (0, h.s)("span", {
            name: "MuiLinearProgress",
            slot: "Dashed",
            overridesResolver: (e, t) => {
                let {
                    ownerState: r
                } = e;
                return [t.dashed, t["dashedColor".concat((0, d.a)(r.color))]]
            }
        })(e => {
            let {
                ownerState: t,
                theme: r
            } = e, n = E(r, t.color);
            return (0, f._)({
                position: "absolute",
                marginTop: 0,
                height: "100%",
                width: "100%"
            }, "inherit" === t.color && {
                opacity: .3
            }, {
                backgroundImage: "radial-gradient(".concat(n, " 0%, ").concat(n, " 16%, transparent 42%)"),
                backgroundSize: "10px 10px",
                backgroundPosition: "0 -23px"
            })
        }, (0, b.css)(o || (o = R()), T)),
        _ = (0, h.s)("span", {
            name: "MuiLinearProgress",
            slot: "Bar1",
            overridesResolver: (e, t) => {
                let {
                    ownerState: r
                } = e;
                return [t.bar, t["barColor".concat((0, d.a)(r.color))], ("indeterminate" === r.variant || "query" === r.variant) && t.bar1Indeterminate, "determinate" === r.variant && t.bar1Determinate, "buffer" === r.variant && t.bar1Buffer]
            }
        })(e => {
            let {
                ownerState: t,
                theme: r
            } = e;
            return (0, f._)({
                width: "100%",
                position: "absolute",
                left: 0,
                bottom: 0,
                top: 0,
                transition: "transform 0.2s linear",
                transformOrigin: "left",
                backgroundColor: "inherit" === t.color ? "currentColor" : (r.vars || r).palette[t.color].main
            }, "determinate" === t.variant && {
                transition: "transform .4s linear"
            }, "buffer" === t.variant && {
                zIndex: 1,
                transition: "transform .4s linear"
            })
        }, e => {
            let {
                ownerState: t
            } = e;
            return ("indeterminate" === t.variant || "query" === t.variant) && (0, b.css)(i || (i = I()), q)
        }),
        z = (0, h.s)("span", {
            name: "MuiLinearProgress",
            slot: "Bar2",
            overridesResolver: (e, t) => {
                let {
                    ownerState: r
                } = e;
                return [t.bar, t["barColor".concat((0, d.a)(r.color))], ("indeterminate" === r.variant || "query" === r.variant) && t.bar2Indeterminate, "buffer" === r.variant && t.bar2Buffer]
            }
        })(e => {
            let {
                ownerState: t,
                theme: r
            } = e;
            return (0, f._)({
                width: "100%",
                position: "absolute",
                left: 0,
                bottom: 0,
                top: 0,
                transition: "transform 0.2s linear",
                transformOrigin: "left"
            }, "buffer" !== t.variant && {
                backgroundColor: "inherit" === t.color ? "currentColor" : (r.vars || r).palette[t.color].main
            }, "inherit" === t.color && {
                opacity: .3
            }, "buffer" === t.variant && {
                backgroundColor: E(r, t.color),
                transition: "transform .4s linear"
            })
        }, e => {
            let {
                ownerState: t
            } = e;
            return ("indeterminate" === t.variant || "query" === t.variant) && (0, b.css)(a || (a = S()), k)
        }),
        K = l.forwardRef(function(e, t) {
            let r = (0, g.u)({
                    props: e,
                    name: "MuiLinearProgress"
                }),
                {
                    className: n,
                    color: o = "primary",
                    value: i,
                    valueBuffer: a,
                    variant: s = "indeterminate"
                } = r,
                l = (0, d._)(r, C),
                c = (0, f._)({}, r, {
                    color: o,
                    variant: s
                }),
                u = (e => {
                    let {
                        classes: t,
                        variant: r,
                        color: n
                    } = e, o = {
                        root: ["root", "color".concat((0, d.a)(n)), r],
                        dashed: ["dashed", "dashedColor".concat((0, d.a)(n))],
                        bar1: ["bar", "barColor".concat((0, d.a)(n)), ("indeterminate" === r || "query" === r) && "bar1Indeterminate", "determinate" === r && "bar1Determinate", "buffer" === r && "bar1Buffer"],
                        bar2: ["bar", "buffer" !== r && "barColor".concat((0, d.a)(n)), "buffer" === r && "color".concat((0, d.a)(n)), ("indeterminate" === r || "query" === r) && "bar2Indeterminate", "buffer" === r && "bar2Buffer"]
                    };
                    return (0, h.a)(o, P, t)
                })(c),
                p = (0, m.u)(),
                v = {},
                b = {},
                w = {};
            if (("determinate" === s || "buffer" === s) && void 0 !== i) {
                v["aria-valuenow"] = Math.round(i), v["aria-valuemin"] = 0, v["aria-valuemax"] = 100;
                let e = i - 100;
                p && (e = -e), b.transform = "translateX(".concat(e, "%)")
            }
            if ("buffer" === s && void 0 !== a) {
                let e = (a || 0) - 100;
                p && (e = -e), w.transform = "translateX(".concat(e, "%)")
            }
            return (0, y.jsxs)(O, (0, f._)({
                className: (0, h.c)(u.root, n),
                ownerState: c,
                role: "progressbar"
            }, v, {
                ref: t
            }, l, {
                children: ["buffer" === s ? (0, y.jsx)(U, {
                    className: u.dashed,
                    ownerState: c
                }) : null, (0, y.jsx)(_, {
                    className: u.bar1,
                    ownerState: c,
                    style: b
                }), "determinate" === s ? null : (0, y.jsx)(z, {
                    className: u.bar2,
                    ownerState: c,
                    style: w
                })]
            }))
        });
    e.s(["M", 0, K], 648210);
    var L = (0, c.default)({
            name: "LinearProgress"
        })(function(e) {
            var t = e.palette.components.divider;
            return {
                colorSecondary: {
                    backgroundColor: t
                },
                buffer: {
                    backgroundColor: "transparent"
                },
                dashedColorSecondary: {
                    backgroundImage: "linear-gradient(to right, ".concat(t, ", ").concat(t, " 50%, transparent 50%, transparent 100%)")
                },
                dashedColorPrimary: {
                    backgroundImage: "linear-gradient(to right, ".concat(e.palette.actionV2.primaryBrand.fill, ", ").concat(e.palette.actionV2.primaryBrand.fill, " 50%, transparent 50%, transparent 100%)")
                },
                colorPrimary: {
                    backgroundColor: e.palette.components.linearProgress.backgroundSecondary
                }
            }
        }),
        D = (0, l.forwardRef)(function(e, t) {
            var r = e.classes,
                n = e.className,
                o = (0, s.a)(e, ["classes", "className"]),
                i = L(void 0, {
                    props: {
                        classes: (0, u.default)(r, n)
                    }
                });
            return l.default.createElement(K, (0, s._)({}, o, {
                classes: i.classes,
                ref: t
            }))
        });
    e.s(["LinearProgress", 0, D], 794472)
}, 752756, e => {
    "use strict";
    var t = e.i(29013);
    e.s(["WarningIcon", () => t.Warning])
}, 195920, e => {
    "use strict";
    var t = e.i(194250),
        r = e.i(416340),
        n = e.i(863605),
        o = e.i(154502),
        i = e.i(690768),
        a = e.i(576592);
    e.i(221628);
    var s = (0, n.default)({
            name: "IconButton"
        })(function(e, r) {
            var n, o, s, l, c, u, p, d, f, h, m = r.color,
                v = r.variant,
                y = {
                    color: e.palette.actionV2.primaryBrand.fill
                },
                g = {
                    color: e.palette.content.standard
                },
                b = {
                    color: e.palette.content.alert.important
                };
            return "contained" === v && (Object.assign(y, ((n = {
                color: e.palette.content.static.light,
                backgroundColor: e.palette.actionV2.primaryBrand.fill
            })["&:hover, &.".concat(i.b.focusVisible, " .").concat(i.t.root)] = {
                backgroundColor: e.palette.actionV2.primaryBrand.containedHoverFocus
            }, n)), Object.assign(g, ((o = {
                color: e.palette.content.inverse,
                backgroundColor: e.palette.actionV2.primary.fill
            })["&:hover, &.".concat(i.b.focusVisible, " .").concat(i.t.root)] = {
                backgroundColor: e.palette.actionV2.primary.containedHoverFocus
            }, o)), Object.assign(b, ((s = {
                color: e.palette.content.static.light,
                backgroundColor: e.palette.actionV2.important.fill
            })["&:hover, &.".concat(i.b.focusVisible, " .").concat(i.t.root)] = {
                backgroundColor: e.palette.actionV2.important.containedHoverFocus
            }, s))), "onMediaLight" === m || "onMediaDark" === m ? ((l = {
                backdropFilter: "blur(5px)",
                "-webkit-backdrop-filter": "blur(5px)",
                color: e.palette.content.static.light,
                backgroundColor: "transparent",
                "&:hover": {
                    backgroundColor: e.palette.components.mediaButtons[m].hover
                }
            })["&.".concat(i.b.focusVisible)] = {
                zIndex: 0,
                backgroundColor: e.palette.components.mediaButtons[m].focus
            }, l["&.".concat(i.b.focusVisible, " .").concat(i.t.root)] = {
                zIndex: -1,
                color: e.palette.components.mediaButtons[m].focus
            }, l["&.".concat(a.i.disabled)] = {
                color: e.palette.states.disabled
            }, h = l, "contained" === v && Object.assign(h, ((c = {
                backgroundColor: e.palette.components.mediaButtons[m].fill
            })["&.".concat(a.i.disabled)] = (0, t._)((0, t._)({}, h["&.".concat(a.i.disabled)]), {
                backgroundColor: e.palette.components.mediaButtons[m].fill
            }), c))) : ((u = {})["&.".concat(i.b.focusVisible)] = {
                zIndex: 0
            }, u["&.".concat(i.b.focusVisible, " .").concat(i.t.root)] = {
                zIndex: -1
            }, u["&.".concat(a.i.disabled)] = {
                color: e.palette.states.disabled
            }, h = u, "default" === m && Object.assign(h, ((p = {
                color: e.palette.states.active,
                "&:hover": {
                    color: e.palette.content.standard,
                    backgroundColor: e.palette.states.hover
                }
            })["&.".concat(i.b.focusVisible, " .").concat(i.t.root)] = {
                color: e.palette.content.standard,
                backgroundColor: e.palette.states.focus
            }, p)), "contained" === v && Object.assign(h, ((d = {
                backgroundColor: e.palette.actionV2.secondary.fill,
                "&:hover": (0, t._)((0, t._)({}, h["&:hover"]), {
                    backgroundColor: e.palette.actionV2.secondary.containedHoverFocus
                })
            })["&.".concat(a.i.disabled)] = (0, t._)((0, t._)({}, h["&.".concat(a.i.disabled)]), {
                backgroundColor: e.palette.states.disabledBackground
            }), d)), "outlined" === v && Object.assign(h, (0, t._)((0, t._)({}, e.border.radius.circle), ((f = {
                border: "1px solid ".concat(e.palette.surface.outline),
                "&:hover": (0, t._)((0, t._)({}, h["&:hover"]), {
                    backgroundColor: e.palette.states.hover
                })
            })["&.".concat(i.b.focusVisible, " .").concat(i.t.root)] = {
                backgroundColor: e.palette.states.focus
            }, f)))), {
                root: h,
                colorPrimary: y,
                colorSecondary: g,
                colorError: b,
                sizeSmall: {
                    padding: 4
                }
            }
        }),
        l = (0, r.forwardRef)(function(e, n) {
            var i = e.children,
                l = e.classes,
                c = e.className,
                u = e.color,
                p = void 0 === u ? "primary" : u,
                d = e.variant,
                f = (0, t.a)(e, ["children", "classes", "className", "color", "variant"]),
                h = s({
                    color: p,
                    variant: void 0 === d ? "default" : d
                }, {
                    props: {
                        classes: (0, o.default)(l, c)
                    }
                }),
                m = "onMediaLight" === p || "onMediaDark" === p ? "default" : p;
            return r.default.createElement(a.I, (0, t._)({}, f, {
                classes: h.classes,
                color: m,
                ref: n
            }), i)
        });
    e.s(["default", 0, l])
}, 649114, e => {
    "use strict";
    var t = e.i(195920);
    e.s(["IconButton", () => t.default])
}, 197649, e => {
    "use strict";

    function t() {
        for (var e, t, r = 0, n = "", o = arguments.length; r < o; r++)(e = arguments[r]) && (t = function e(t) {
            var r, n, o = "";
            if ("string" == typeof t || "number" == typeof t) o += t;
            else if ("object" == typeof t)
                if (Array.isArray(t)) {
                    var i = t.length;
                    for (r = 0; r < i; r++) t[r] && (n = e(t[r])) && (o && (o += " "), o += n)
                } else
                    for (n in t) t[n] && (o && (o += " "), o += n);
            return o
        }(e)) && (n && (n += " "), n += t);
        return n
    }
    e.s(["clsx", 0, t, "default", 0, t])
}, 678604, (e, t, r) => {
    "use strict";
    var n = e.r(416340);

    function o(e) {
        var t = "https://react.dev/errors/" + e;
        if (1 < arguments.length) {
            t += "?args[]=" + encodeURIComponent(arguments[1]);
            for (var r = 2; r < arguments.length; r++) t += "&args[]=" + encodeURIComponent(arguments[r])
        }
        return "Minified React error #" + e + "; visit " + t + " for the full message or use the non-minified dev environment for full errors and additional helpful warnings."
    }

    function i() {}
    var a = {
            d: {
                f: i,
                r: function() {
                    throw Error(o(522))
                },
                D: i,
                C: i,
                L: i,
                m: i,
                X: i,
                S: i,
                M: i
            },
            p: 0,
            findDOMNode: null
        },
        s = Symbol.for("react.portal"),
        l = n.__CLIENT_INTERNALS_DO_NOT_USE_OR_WARN_USERS_THEY_CANNOT_UPGRADE;

    function c(e, t) {
        return "font" === e ? "" : "string" == typeof t ? "use-credentials" === t ? t : "" : void 0
    }
    r.__DOM_INTERNALS_DO_NOT_USE_OR_WARN_USERS_THEY_CANNOT_UPGRADE = a, r.createPortal = function(e, t) {
        var r = 2 < arguments.length && void 0 !== arguments[2] ? arguments[2] : null;
        if (!t || 1 !== t.nodeType && 9 !== t.nodeType && 11 !== t.nodeType) throw Error(o(299));
        return function(e, t, r) {
            var n = 3 < arguments.length && void 0 !== arguments[3] ? arguments[3] : null;
            return {
                $$typeof: s,
                key: null == n ? null : "" + n,
                children: e,
                containerInfo: t,
                implementation: r
            }
        }(e, t, null, r)
    }, r.flushSync = function(e) {
        var t = l.T,
            r = a.p;
        try {
            if (l.T = null, a.p = 2, e) return e()
        } finally {
            l.T = t, a.p = r, a.d.f()
        }
    }, r.preconnect = function(e, t) {
        "string" == typeof e && (t = t ? "string" == typeof(t = t.crossOrigin) ? "use-credentials" === t ? t : "" : void 0 : null, a.d.C(e, t))
    }, r.prefetchDNS = function(e) {
        "string" == typeof e && a.d.D(e)
    }, r.preinit = function(e, t) {
        if ("string" == typeof e && t && "string" == typeof t.as) {
            var r = t.as,
                n = c(r, t.crossOrigin),
                o = "string" == typeof t.integrity ? t.integrity : void 0,
                i = "string" == typeof t.fetchPriority ? t.fetchPriority : void 0;
            "style" === r ? a.d.S(e, "string" == typeof t.precedence ? t.precedence : void 0, {
                crossOrigin: n,
                integrity: o,
                fetchPriority: i
            }) : "script" === r && a.d.X(e, {
                crossOrigin: n,
                integrity: o,
                fetchPriority: i,
                nonce: "string" == typeof t.nonce ? t.nonce : void 0
            })
        }
    }, r.preinitModule = function(e, t) {
        if ("string" == typeof e)
            if ("object" == typeof t && null !== t) {
                if (null == t.as || "script" === t.as) {
                    var r = c(t.as, t.crossOrigin);
                    a.d.M(e, {
                        crossOrigin: r,
                        integrity: "string" == typeof t.integrity ? t.integrity : void 0,
                        nonce: "string" == typeof t.nonce ? t.nonce : void 0
                    })
                }
            } else null == t && a.d.M(e)
    }, r.preload = function(e, t) {
        if ("string" == typeof e && "object" == typeof t && null !== t && "string" == typeof t.as) {
            var r = t.as,
                n = c(r, t.crossOrigin);
            a.d.L(e, r, {
                crossOrigin: n,
                integrity: "string" == typeof t.integrity ? t.integrity : void 0,
                nonce: "string" == typeof t.nonce ? t.nonce : void 0,
                type: "string" == typeof t.type ? t.type : void 0,
                fetchPriority: "string" == typeof t.fetchPriority ? t.fetchPriority : void 0,
                referrerPolicy: "string" == typeof t.referrerPolicy ? t.referrerPolicy : void 0,
                imageSrcSet: "string" == typeof t.imageSrcSet ? t.imageSrcSet : void 0,
                imageSizes: "string" == typeof t.imageSizes ? t.imageSizes : void 0,
                media: "string" == typeof t.media ? t.media : void 0
            })
        }
    }, r.preloadModule = function(e, t) {
        if ("string" == typeof e)
            if (t) {
                var r = c(t.as, t.crossOrigin);
                a.d.m(e, {
                    as: "string" == typeof t.as && "script" !== t.as ? t.as : void 0,
                    crossOrigin: r,
                    integrity: "string" == typeof t.integrity ? t.integrity : void 0
                })
            } else a.d.m(e)
    }, r.requestFormReset = function(e) {
        a.d.r(e)
    }, r.unstable_batchedUpdates = function(e, t) {
        return e(t)
    }, r.useFormState = function(e, t, r) {
        return l.H.useFormState(e, t, r)
    }, r.useFormStatus = function() {
        return l.H.useHostTransitionStatus()
    }, r.version = "19.2.6"
}, 149285, (e, t, r) => {
    "use strict";
    ! function e() {
        if ("u" > typeof __REACT_DEVTOOLS_GLOBAL_HOOK__ && "function" == typeof __REACT_DEVTOOLS_GLOBAL_HOOK__.checkDCE) try {
            __REACT_DEVTOOLS_GLOBAL_HOOK__.checkDCE(e)
        } catch (e) {
            console.error(e)
        }
    }(), t.exports = e.r(678604)
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
            store: c,
            children: u
        } = e, [p, d] = (0, t.useState)(!1), [f, h] = (0, t.useState)("initial"), m = (0, t.useCallback)(async function() {
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
            user: v,
            setUser: y
        } = {
            user: n(c, e => e.user),
            setUser: n(c, e => e.setUser)
        }, g = (0, t.useCallback)(async () => {
            await a.v1LogoutPost(), null !== v && (y(null), h("logged-out"))
        }, [a, v, y]);
        (0, t.useEffect)(() => {
            (async () => {
                try {
                    h("loading");
                    let {
                        id: e,
                        name: t,
                        displayName: r
                    } = await l.v1UsersAuthenticatedGet();
                    void 0 !== e && void 0 !== t ? (y({
                        id: e,
                        name: t,
                        displayName: r
                    }), h("success")) : h("error")
                } catch (r) {
                    let e = r.response,
                        t = e ? await o(e) : null;
                    (null == t ? void 0 : t.message) === "User is moderated" ? h("moderated"): (null == t ? void 0 : t.code) === 9002 || (null == e ? void 0 : e.status) === 401 ? h("unauthenticated") : h("error")
                } finally {
                    d(!0)
                }
            })()
        }, []);
        let b = (0, t.useMemo)(() => ({
            user: v,
            isFetched: p,
            status: f,
            login: m,
            logout: g
        }), [v, p, f, m, g]);
        return t.default.createElement(i.Provider, {
            value: b
        }, u)
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
}, 581577, 280162, e => {
    "use strict";
    let t;
    var r = e.i(416340),
        n = e.i(252842),
        o = e.i(697973),
        i = e.i(345886),
        a = e.i(623983),
        s = e.i(794472),
        l = e.i(649114),
        c = e.i(15645),
        u = e.i(748893),
        p = e.i(226519),
        d = e.i(677753),
        f = function(e, t) {
            return (f = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
            })(e, t)
        };

    function h(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function r() {
            this.constructor = e
        }
        f(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
    }

    function m(e, t, r, n) {
        return new(r || (r = Promise))(function(o, i) {
            function a(e) {
                try {
                    l(n.next(e))
                } catch (e) {
                    i(e)
                }
            }

            function s(e) {
                try {
                    l(n.throw(e))
                } catch (e) {
                    i(e)
                }
            }

            function l(e) {
                var t;
                e.done ? o(e.value) : ((t = e.value) instanceof r ? t : new r(function(e) {
                    e(t)
                })).then(a, s)
            }
            l((n = n.apply(e, t || [])).next())
        })
    }

    function v(e, t) {
        var r, n, o, i = {
                label: 0,
                sent: function() {
                    if (1 & o[0]) throw o[1];
                    return o[1]
                },
                trys: [],
                ops: []
            },
            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
            return this
        }), a;

        function s(s) {
            return function(l) {
                var c = [s, l];
                if (r) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, c[0] && (i = 0)), i;) try {
                    if (r = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                    switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                        case 0:
                        case 1:
                            o = c;
                            break;
                        case 4:
                            return i.label++, {
                                value: c[1],
                                done: !1
                            };
                        case 5:
                            i.label++, n = c[1], c = [0];
                            continue;
                        case 7:
                            c = i.ops.pop(), i.trys.pop();
                            continue;
                        default:
                            if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                i = 0;
                                continue
                            }
                            if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                i.label = c[1];
                                break
                            }
                            if (6 === c[0] && i.label < o[1]) {
                                i.label = o[1], o = c;
                                break
                            }
                            if (o && i.label < o[2]) {
                                i.label = o[2], i.ops.push(c);
                                break
                            }
                            o[2] && i.ops.pop(), i.trys.pop();
                            continue
                    }
                    c = t.call(e, i)
                } catch (e) {
                    c = [6, e], n = 0
                } finally {
                    r = o = 0
                }
                if (5 & c[0]) throw c[1];
                return {
                    value: c[0] ? c[1] : void 0,
                    done: !0
                }
            }
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function y(e, t) {
        return null == e ? e : {
            id: e.id,
            type: e.type
        }
    }

    function g(e) {
        var t;
        return null == (t = e) ? t : {
            ids: t.ids
        }
    }

    function b(e) {
        if (void 0 !== e) return null === e ? null : {
            ids: e.ids
        }
    }

    function w(e) {
        var t;
        return null == (t = e) ? t : {
            owner: y(t.owner),
            resources: (0, d.mapValues)(t.resources, g)
        }
    }

    function x(e) {
        if (void 0 !== e) return null === e ? null : {
            owner: function(e) {
                if (void 0 !== e) return null === e ? null : {
                    id: e.id,
                    type: e.type
                }
            }(e.owner),
            resources: (0, d.mapValues)(e.resources, b)
        }
    }

    function A(e) {
        return e
    }

    function R(e) {
        return e
    }

    function I(e) {
        return e
    }

    function S(e) {
        return e
    }

    function P(e) {
        var t;
        return null == (t = e) ? t : {
            scopeType: t.scopeType,
            operations: t.operations
        }
    }

    function C(e) {
        if (void 0 !== e) return null === e ? null : {
            scopeType: e.scopeType,
            operations: e.operations
        }
    }

    function q(e, t) {
        return null == e ? e : {
            requestedCategory: (0, d.exists)(e, "requestedCategory") ? e.requestedCategory : void 0,
            videoUri: (0, d.exists)(e, "videoUri") ? e.videoUri : void 0,
            categoryJustification: (0, d.exists)(e, "categoryJustification") ? e.categoryJustification : void 0
        }
    }

    function k(e, t) {
        return null == e ? e : {
            lastApprovedVersionNumber: (0, d.exists)(e, "lastApprovedVersionNumber") ? e.lastApprovedVersionNumber : void 0,
            versionNumber: e.versionNumber,
            isInReview: e.isInReview
        }
    }

    function T(e) {
        var t;
        return null == (t = e) ? t : {
            redirectUris: t.redirectUris,
            allowedScopes: t.allowedScopes.map(P),
            versionInfo: k(t.versionInfo),
            isBanned: t.isBanned,
            createdUtc: new Date(t.createdUtc),
            updatedUtc: new Date(t.updatedUtc),
            reviewSubmission: (0, d.exists)(t, "reviewSubmission") ? q(t.reviewSubmission) : void 0,
            applicationId: t.applicationId,
            owner: y(t.owner),
            name: t.name,
            summary: t.summary,
            tosUri: (0, d.exists)(t, "tosUri") ? t.tosUri : void 0,
            privacyUri: (0, d.exists)(t, "privacyUri") ? t.privacyUri : void 0,
            entryPointUri: (0, d.exists)(t, "entryPointUri") ? t.entryPointUri : void 0,
            imageAssetId: (0, d.exists)(t, "imageAssetId") ? t.imageAssetId : void 0,
            isFirstParty: (0, d.exists)(t, "isFirstParty") ? t.isFirstParty : void 0
        }
    }

    function E(e, t) {
        return null == e ? e : {
            applications: e.applications.map(T),
            nextPageCursor: (0, d.exists)(e, "nextPageCursor") ? e.nextPageCursor : void 0
        }
    }

    function O(e) {
        var t, r;
        return null == (t = e) ? t : {
            authorizationId: t.authorizationId,
            application: null == (r = t.application) ? r : {
                applicationId: r.applicationId,
                owner: y(r.owner),
                name: r.name,
                summary: r.summary,
                tosUri: (0, d.exists)(r, "tosUri") ? r.tosUri : void 0,
                privacyUri: (0, d.exists)(r, "privacyUri") ? r.privacyUri : void 0,
                entryPointUri: (0, d.exists)(r, "entryPointUri") ? r.entryPointUri : void 0,
                imageAssetId: (0, d.exists)(r, "imageAssetId") ? r.imageAssetId : void 0,
                isFirstParty: (0, d.exists)(r, "isFirstParty") ? r.isFirstParty : void 0
            },
            scopes: t.scopes.map(P),
            resourceInfo: t.resourceInfo.map(w),
            createdUtc: new Date(t.createdUtc),
            refreshedUtc: new Date(t.refreshedUtc)
        }
    }

    function U(e, t) {
        return null == e ? e : {
            applicationSecret: e.applicationSecret,
            redirectUris: e.redirectUris,
            allowedScopes: e.allowedScopes.map(P),
            versionInfo: k(e.versionInfo),
            isBanned: e.isBanned,
            createdUtc: new Date(e.createdUtc),
            updatedUtc: new Date(e.updatedUtc),
            reviewSubmission: (0, d.exists)(e, "reviewSubmission") ? q(e.reviewSubmission) : void 0,
            applicationId: e.applicationId,
            owner: y(e.owner),
            name: e.name,
            summary: e.summary,
            tosUri: (0, d.exists)(e, "tosUri") ? e.tosUri : void 0,
            privacyUri: (0, d.exists)(e, "privacyUri") ? e.privacyUri : void 0,
            entryPointUri: (0, d.exists)(e, "entryPointUri") ? e.entryPointUri : void 0,
            imageAssetId: (0, d.exists)(e, "imageAssetId") ? e.imageAssetId : void 0,
            isFirstParty: (0, d.exists)(e, "isFirstParty") ? e.isFirstParty : void 0
        }
    }

    function _(e, t) {
        return null == e ? e : {
            resourceInfos: e.resource_infos.map(w)
        }
    }

    function z(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0
        }
    }

    function K(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0
        }
    }

    function L(e) {
        var t;
        return null == (t = e) ? t : {
            scopeType: t.scopeType,
            operation: t.operation,
            targetType: (0, d.exists)(t, "targetType") ? t.targetType : void 0,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0,
            riskLevel: (0, d.exists)(t, "riskLevel") ? t.riskLevel : void 0,
            groupAllowed: (0, d.exists)(t, "groupAllowed") ? t.groupAllowed : void 0,
            firstPartyOAuthOnly: (0, d.exists)(t, "firstPartyOAuthOnly") ? t.firstPartyOAuthOnly : void 0,
            categories: (0, d.exists)(t, "categories") ? t.categories : void 0
        }
    }

    function D(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0
        }
    }

    function M(e) {
        return e
    }

    function j(e) {
        return e
    }

    function N(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0,
            descriptionTranslationKey: (0, d.exists)(t, "descriptionTranslationKey") ? t.descriptionTranslationKey : void 0,
            riskLevel: (0, d.exists)(t, "riskLevel") ? t.riskLevel : void 0
        }
    }

    function V(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            environments: (0, d.exists)(t, "environments") ? null === t.environments ? null : t.environments.map(j) : void 0,
            targetType: (0, d.exists)(t, "targetType") ? t.targetType : void 0,
            operations: t.operations,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0,
            product: (0, d.exists)(t, "product") ? t.product : void 0,
            operationOverrides: t.operationOverrides.map(N),
            authenticationSystems: t.authenticationSystems.map(M),
            groupAllowedOperations: (0, d.exists)(t, "groupAllowedOperations") ? t.groupAllowedOperations : void 0
        }
    }

    function G(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            type: t.type,
            constraints: t.constraints,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0
        }
    }

    function F(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            requiredParts: t.requiredParts,
            optionalParts: t.optionalParts,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0
        }
    }

    function B(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0,
            product: (0, d.exists)(t, "product") ? t.product : void 0
        }
    }

    function W(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            type: (0, d.exists)(t, "type") ? t.type : void 0,
            constraints: (0, d.exists)(t, "constraints") ? t.constraints : void 0,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0
        }
    }

    function H(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            requiredParts: (0, d.exists)(t, "requiredParts") ? t.requiredParts : void 0,
            optionalParts: (0, d.exists)(t, "optionalParts") ? t.optionalParts : void 0,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0
        }
    }

    function J(e) {
        var t;
        return null == (t = e) ? t : {
            id: t.id,
            agreementType: t.agreementType,
            clientType: t.clientType,
            regulationType: t.regulationType,
            displayUrl: t.displayUrl
        }
    }

    function X(e) {
        if (void 0 !== e) return null === e ? null : {
            name: e.name,
            summary: e.summary,
            redirectUris: e.redirectUris,
            allowedScopes: void 0 === e.allowedScopes ? void 0 : null === e.allowedScopes ? null : e.allowedScopes.map(C),
            tosUri: e.tosUri,
            privacyUri: e.privacyUri,
            entryPointUri: e.entryPointUri
        }
    }

    function $(e) {
        var t;
        return null == (t = e) ? t : {
            alg: t.alg,
            enc: (0, d.exists)(t, "enc") ? t.enc : void 0,
            kty: t.kty,
            kid: t.kid,
            use: t.use,
            n: (0, d.exists)(t, "n") ? t.n : void 0,
            e: (0, d.exists)(t, "e") ? t.e : void 0,
            d: (0, d.exists)(t, "d") ? t.d : void 0,
            p: (0, d.exists)(t, "p") ? t.p : void 0,
            q: (0, d.exists)(t, "q") ? t.q : void 0,
            dp: (0, d.exists)(t, "dp") ? t.dp : void 0,
            dq: (0, d.exists)(t, "dq") ? t.dq : void 0,
            qi: (0, d.exists)(t, "qi") ? t.qi : void 0,
            crv: (0, d.exists)(t, "crv") ? t.crv : void 0,
            x: (0, d.exists)(t, "x") ? t.x : void 0,
            y: (0, d.exists)(t, "y") ? t.y : void 0,
            k: (0, d.exists)(t, "k") ? t.k : void 0
        }
    }

    function Y(e, t) {
        return null == e ? e : {
            keys: e.keys.map($)
        }
    }
    var Z = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return h(t, e), t.prototype.applicationCreateApplicationForGroupRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new d.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling applicationCreateApplicationForGroup.");
                                if (null === e.applicationCreateApplicationForUserRequest || void 0 === e.applicationCreateApplicationForUserRequest) throw new d.RequiredError("applicationCreateApplicationForUserRequest", "Required parameter requestParameters.applicationCreateApplicationForUserRequest was null or undefined when calling applicationCreateApplicationForGroup.");
                                return r = {}, (n = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/groups/{groupId}/applications".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/applications",
                                    method: "POST",
                                    headers: n,
                                    query: r,
                                    body: X(e.applicationCreateApplicationForUserRequest)
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return U(e)
                                })]
                        }
                    })
                })
            }, t.prototype.applicationCreateApplicationForGroup = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.applicationCreateApplicationForGroupRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.applicationCreateApplicationForUserRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new d.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling applicationCreateApplicationForUser.");
                                if (null === e.applicationCreateApplicationForUserRequest || void 0 === e.applicationCreateApplicationForUserRequest) throw new d.RequiredError("applicationCreateApplicationForUserRequest", "Required parameter requestParameters.applicationCreateApplicationForUserRequest was null or undefined when calling applicationCreateApplicationForUser.");
                                return r = {}, (n = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/users/{userId}/applications".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/users/{userId}/applications",
                                    method: "POST",
                                    headers: n,
                                    query: r,
                                    body: X(e.applicationCreateApplicationForUserRequest)
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return U(e)
                                })]
                        }
                    })
                })
            }, t.prototype.applicationCreateApplicationForUser = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.applicationCreateApplicationForUserRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.applicationDeleteApplicationRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.applicationId || void 0 === e.applicationId) throw new d.RequiredError("applicationId", "Required parameter requestParameters.applicationId was null or undefined when calling applicationDeleteApplication.");
                                return r = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/{applicationId}".replace("{".concat("applicationId", "}"), encodeURIComponent(String(e.applicationId))),
                                    schemaPath: "/v1/applications/{applicationId}",
                                    method: "DELETE",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.VoidApiResponse(o)]
                        }
                    })
                })
            }, t.prototype.applicationDeleteApplication = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.applicationDeleteApplicationRaw(e, t)];
                            case 1:
                                return r.sent(), [2]
                        }
                    })
                })
            }, t.prototype.applicationGetApplicationRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.applicationId || void 0 === e.applicationId) throw new d.RequiredError("applicationId", "Required parameter requestParameters.applicationId was null or undefined when calling applicationGetApplication.");
                                return r = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/{applicationId}".replace("{".concat("applicationId", "}"), encodeURIComponent(String(e.applicationId))),
                                    schemaPath: "/v1/applications/{applicationId}",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return T(e)
                                })]
                        }
                    })
                })
            }, t.prototype.applicationGetApplication = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.applicationGetApplicationRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.applicationGetApplicationManagementMetadataRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return r = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/metadata",
                                    schemaPath: "/v1/applications/metadata",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        isCreateUserApplicationsAllowed: e.isCreateUserApplicationsAllowed,
                                        isViewUserApplicationsAllowed: e.isViewUserApplicationsAllowed,
                                        isUpdateUserApplicationsAllowed: e.isUpdateUserApplicationsAllowed,
                                        isDeleteUserApplicationsAllowed: e.isDeleteUserApplicationsAllowed,
                                        actions: e.actions.map(A),
                                        minNameLength: e.minNameLength,
                                        maxNameLength: e.maxNameLength,
                                        maxSummaryLength: e.maxSummaryLength,
                                        maxRedirectUriCount: e.maxRedirectUriCount,
                                        maxRedirectUriLength: e.maxRedirectUriLength,
                                        maxActiveApplications: e.maxActiveApplications,
                                        maxVideoUriLength: e.maxVideoUriLength,
                                        maxCategoryJustificationLength: e.maxCategoryJustificationLength
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.applicationGetApplicationManagementMetadata = function() {
                return m(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.applicationGetApplicationManagementMetadataRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.applicationListApplicationsForGroupRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new d.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling applicationListApplicationsForGroup.");
                                return r = {}, void 0 !== e.limit && (r.limit = e.limit), void 0 !== e.sortOrder && (r.sortOrder = e.sortOrder), void 0 !== e.cursor && (r.cursor = e.cursor), n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/groups/{groupId}/applications".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/applications",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return E(e)
                                })]
                        }
                    })
                })
            }, t.prototype.applicationListApplicationsForGroup = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.applicationListApplicationsForGroupRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.applicationListApplicationsForUserRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new d.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling applicationListApplicationsForUser.");
                                return r = {}, void 0 !== e.limit && (r.limit = e.limit), void 0 !== e.sortOrder && (r.sortOrder = e.sortOrder), void 0 !== e.cursor && (r.cursor = e.cursor), n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/users/{userId}/applications".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/users/{userId}/applications",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return E(e)
                                })]
                        }
                    })
                })
            }, t.prototype.applicationListApplicationsForUser = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.applicationListApplicationsForUserRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.applicationPrivatizeApplicationRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.applicationId || void 0 === e.applicationId) throw new d.RequiredError("applicationId", "Required parameter requestParameters.applicationId was null or undefined when calling applicationPrivatizeApplication.");
                                return r = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/{applicationId}/privatize".replace("{".concat("applicationId", "}"), encodeURIComponent(String(e.applicationId))),
                                    schemaPath: "/v1/applications/{applicationId}/privatize",
                                    method: "PATCH",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.VoidApiResponse(o)]
                        }
                    })
                })
            }, t.prototype.applicationPrivatizeApplication = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.applicationPrivatizeApplicationRaw(e, t)];
                            case 1:
                                return r.sent(), [2]
                        }
                    })
                })
            }, t.prototype.applicationPublishApplicationRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.applicationId || void 0 === e.applicationId) throw new d.RequiredError("applicationId", "Required parameter requestParameters.applicationId was null or undefined when calling applicationPublishApplication.");
                                return r = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/{applicationId}/publish".replace("{".concat("applicationId", "}"), encodeURIComponent(String(e.applicationId))),
                                    schemaPath: "/v1/applications/{applicationId}/publish",
                                    method: "PATCH",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.VoidApiResponse(o)]
                        }
                    })
                })
            }, t.prototype.applicationPublishApplication = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.applicationPublishApplicationRaw(e, t)];
                            case 1:
                                return r.sent(), [2]
                        }
                    })
                })
            }, t.prototype.applicationRegenerateApplicationSecretRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.applicationId || void 0 === e.applicationId) throw new d.RequiredError("applicationId", "Required parameter requestParameters.applicationId was null or undefined when calling applicationRegenerateApplicationSecret.");
                                return r = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/{applicationId}/secret".replace("{".concat("applicationId", "}"), encodeURIComponent(String(e.applicationId))),
                                    schemaPath: "/v1/applications/{applicationId}/secret",
                                    method: "POST",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        applicationSecret: e.applicationSecret
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.applicationRegenerateApplicationSecret = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.applicationRegenerateApplicationSecretRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.applicationUpdateApplicationRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.applicationId || void 0 === e.applicationId) throw new d.RequiredError("applicationId", "Required parameter requestParameters.applicationId was null or undefined when calling applicationUpdateApplication.");
                                if (null === e.applicationUpdateApplicationRequest || void 0 === e.applicationUpdateApplicationRequest) throw new d.RequiredError("applicationUpdateApplicationRequest", "Required parameter requestParameters.applicationUpdateApplicationRequest was null or undefined when calling applicationUpdateApplication.");
                                return r = {}, (n = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/{applicationId}".replace("{".concat("applicationId", "}"), encodeURIComponent(String(e.applicationId))),
                                    schemaPath: "/v1/applications/{applicationId}",
                                    method: "PATCH",
                                    headers: n,
                                    query: r,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            name: e.name,
                                            summary: e.summary,
                                            redirectUris: e.redirectUris,
                                            allowedScopes: void 0 === e.allowedScopes ? void 0 : null === e.allowedScopes ? null : e.allowedScopes.map(C),
                                            tosUri: e.tosUri,
                                            privacyUri: e.privacyUri,
                                            entryPointUri: e.entryPointUri,
                                            reviewSubmission: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    requestedCategory: e.requestedCategory,
                                                    videoUri: e.videoUri,
                                                    categoryJustification: e.categoryJustification
                                                }
                                            }(e.reviewSubmission)
                                        }
                                    }(e.applicationUpdateApplicationRequest)
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return T(e)
                                })]
                        }
                    })
                })
            }, t.prototype.applicationUpdateApplication = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.applicationUpdateApplicationRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.applicationUploadApplicationImageRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o, i;
                    return v(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.applicationId || void 0 === e.applicationId) throw new d.RequiredError("applicationId", "Required parameter requestParameters.applicationId was null or undefined when calling applicationUploadApplicationImage.");
                                if (null === e.imageFile || void 0 === e.imageFile) throw new d.RequiredError("imageFile", "Required parameter requestParameters.imageFile was null or undefined when calling applicationUploadApplicationImage.");
                                return r = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), o = (0, d.canConsumeForm)([{
                                    contentType: "multipart/form-data"
                                }]) ? new FormData : new URLSearchParams, void 0 !== e.imageFile && o.append("imageFile", e.imageFile), [4, this.request({
                                    path: "/v1/applications/{applicationId}/image".replace("{".concat("applicationId", "}"), encodeURIComponent(String(e.applicationId))),
                                    schemaPath: "/v1/applications/{applicationId}/image",
                                    method: "POST",
                                    headers: n,
                                    query: r,
                                    body: o
                                }, t)];
                            case 1:
                                return i = a.sent(), [2, new d.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        imageAssetId: (0, d.exists)(e, "imageAssetId") ? e.imageAssetId : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.applicationUploadApplicationImage = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.applicationUploadApplicationImageRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.applicationValidateApplicationNameRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.name || void 0 === e.name) throw new d.RequiredError("name", "Required parameter requestParameters.name was null or undefined when calling applicationValidateApplicationName.");
                                return r = {}, void 0 !== e.name && (r.name = e.name), void 0 !== e.applicationId && (r.applicationId = e.applicationId), n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/names/validate",
                                    schemaPath: "/v1/applications/names/validate",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.VoidApiResponse(o)]
                        }
                    })
                })
            }, t.prototype.applicationValidateApplicationName = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.applicationValidateApplicationNameRaw(e, t)];
                            case 1:
                                return r.sent(), [2]
                        }
                    })
                })
            }, t.prototype.applicationValidateApplicationSummaryRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.summary || void 0 === e.summary) throw new d.RequiredError("summary", "Required parameter requestParameters.summary was null or undefined when calling applicationValidateApplicationSummary.");
                                return r = {}, void 0 !== e.summary && (r.summary = e.summary), n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/summary/validate",
                                    schemaPath: "/v1/applications/summary/validate",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.VoidApiResponse(o)]
                        }
                    })
                })
            }, t.prototype.applicationValidateApplicationSummary = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.applicationValidateApplicationSummaryRaw(e, t)];
                            case 1:
                                return r.sent(), [2]
                        }
                    })
                })
            }, t
        }(d.BaseAPI),
        Q = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return h(t, e), t.prototype.authorizationDeleteAuthorizationRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.authorizationId || void 0 === e.authorizationId) throw new d.RequiredError("authorizationId", "Required parameter requestParameters.authorizationId was null or undefined when calling authorizationDeleteAuthorization.");
                                return r = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/authorizations/{authorizationId}".replace("{".concat("authorizationId", "}"), encodeURIComponent(String(e.authorizationId))),
                                    schemaPath: "/v1/authorizations/{authorizationId}",
                                    method: "DELETE",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.VoidApiResponse(o)]
                        }
                    })
                })
            }, t.prototype.authorizationDeleteAuthorization = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.authorizationDeleteAuthorizationRaw(e, t)];
                            case 1:
                                return r.sent(), [2]
                        }
                    })
                })
            }, t.prototype.authorizationGetAuthorizationRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.authorizationId || void 0 === e.authorizationId) throw new d.RequiredError("authorizationId", "Required parameter requestParameters.authorizationId was null or undefined when calling authorizationGetAuthorization.");
                                return r = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/authorizations/{authorizationId}".replace("{".concat("authorizationId", "}"), encodeURIComponent(String(e.authorizationId))),
                                    schemaPath: "/v1/authorizations/{authorizationId}",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return O(e)
                                })]
                        }
                    })
                })
            }, t.prototype.authorizationGetAuthorization = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.authorizationGetAuthorizationRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.authorizationGetAuthorizationResourcesRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.applicationId || void 0 === e.applicationId) throw new d.RequiredError("applicationId", "Required parameter requestParameters.applicationId was null or undefined when calling authorizationGetAuthorizationResources.");
                                if (null === e.partialScopes || void 0 === e.partialScopes) throw new d.RequiredError("partialScopes", "Required parameter requestParameters.partialScopes was null or undefined when calling authorizationGetAuthorizationResources.");
                                return r = {}, void 0 !== e.applicationId && (r.applicationId = e.applicationId), void 0 !== e.partialScopes && (r.partialScopes = e.partialScopes), n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/authorizations/resources",
                                    schemaPath: "/v1/authorizations/resources",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return _(e)
                                })]
                        }
                    })
                })
            }, t.prototype.authorizationGetAuthorizationResources = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.authorizationGetAuthorizationResourcesRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.authorizationListAuthorizationsRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return r = {}, void 0 !== e.limit && (r.limit = e.limit), void 0 !== e.sortOrder && (r.sortOrder = e.sortOrder), void 0 !== e.cursor && (r.cursor = e.cursor), n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/authorizations",
                                    schemaPath: "/v1/authorizations",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        authorizations: e.authorizations.map(O),
                                        nextPageCursor: (0, d.exists)(e, "nextPageCursor") ? e.nextPageCursor : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.authorizationListAuthorizations = function() {
                return m(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.authorizationListAuthorizationsRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t
        }(d.BaseAPI),
        ee = (function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            h(t, e), t.prototype.certificateGetAccessTokenCertificatesRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return r = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/certificates/access-tokens",
                                    schemaPath: "/v1/certificates/access-tokens",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return Y(e)
                                })]
                        }
                    })
                })
            }, t.prototype.certificateGetAccessTokenCertificates = function() {
                return m(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.certificateGetAccessTokenCertificatesRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.certificateGetDefaultCertificatesRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return r = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/certs",
                                    schemaPath: "/v1/certs",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return Y(e)
                                })]
                        }
                    })
                })
            }, t.prototype.certificateGetDefaultCertificates = function() {
                return m(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.certificateGetDefaultCertificatesRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.certificateGetIdentityTokenCertificatesRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return r = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/certificates/identity-tokens",
                                    schemaPath: "/v1/certificates/identity-tokens",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return Y(e)
                                })]
                        }
                    })
                })
            }, t.prototype.certificateGetIdentityTokenCertificates = function() {
                return m(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.certificateGetIdentityTokenCertificatesRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }
        }(d.BaseAPI), function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return h(t, e), t.prototype.discoveryGetDiscoveryConfigurationRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return r = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/.well-known/openid-configuration",
                                    schemaPath: "/.well-known/openid-configuration",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        issuer: e.issuer,
                                        authorizationEndpoint: e.authorization_endpoint,
                                        tokenEndpoint: e.token_endpoint,
                                        introspectionEndpoint: e.introspection_endpoint,
                                        revocationEndpoint: e.revocation_endpoint,
                                        resourcesEndpoint: e.resources_endpoint,
                                        userinfoEndpoint: e.userinfo_endpoint,
                                        jwksUri: e.jwks_uri,
                                        registrationEndpoint: e.registration_endpoint,
                                        serviceDocumentation: e.service_documentation,
                                        scopesSupported: e.scopes_supported,
                                        responseTypesSupported: e.response_types_supported,
                                        subjectTypesSupported: e.subject_types_supported,
                                        idTokenSigningAlgValuesSupported: e.id_token_signing_alg_values_supported,
                                        claimsSupported: e.claims_supported,
                                        tokenEndpointAuthMethodsSupported: e.token_endpoint_auth_methods_supported
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.discoveryGetDiscoveryConfiguration = function() {
                return m(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.discoveryGetDiscoveryConfigurationRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t
        }(d.BaseAPI)),
        et = (function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            h(t, e), t.prototype.externalVerificationSetExternalVerificationTypesRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.externalVerificationSetExternalVerificationTypesRequest || void 0 === e.externalVerificationSetExternalVerificationTypesRequest) throw new d.RequiredError("externalVerificationSetExternalVerificationTypesRequest", "Required parameter requestParameters.externalVerificationSetExternalVerificationTypesRequest was null or undefined when calling externalVerificationSetExternalVerificationTypes.");
                                return r = {}, (n = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/verification-types",
                                    schemaPath: "/v1/verification-types",
                                    method: "POST",
                                    headers: n,
                                    query: r,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            token: e.token
                                        }
                                    }(e.externalVerificationSetExternalVerificationTypesRequest)
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.VoidApiResponse(o)]
                        }
                    })
                })
            }, t.prototype.externalVerificationSetExternalVerificationTypes = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.externalVerificationSetExternalVerificationTypesRaw(e, t)];
                            case 1:
                                return r.sent(), [2]
                        }
                    })
                })
            }
        }(d.BaseAPI), function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return h(t, e), t.prototype.permissionRequestCreateAuthorizationGrantRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.permissionRequestCreateAuthorizationGrantRequest || void 0 === e.permissionRequestCreateAuthorizationGrantRequest) throw new d.RequiredError("permissionRequestCreateAuthorizationGrantRequest", "Required parameter requestParameters.permissionRequestCreateAuthorizationGrantRequest was null or undefined when calling permissionRequestCreateAuthorizationGrant.");
                                return r = {}, (n = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/authorizations",
                                    schemaPath: "/v1/authorizations",
                                    method: "POST",
                                    headers: n,
                                    query: r,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            clientId: e.clientId,
                                            responseTypes: e.responseTypes.map(S),
                                            redirectUri: e.redirectUri,
                                            scopes: e.scopes.map(C),
                                            state: e.state,
                                            nonce: e.nonce,
                                            codeChallenge: e.codeChallenge,
                                            codeChallengeMethod: e.codeChallengeMethod,
                                            resourceInfos: void 0 === e.resourceInfos ? void 0 : null === e.resourceInfos ? null : e.resourceInfos.map(x)
                                        }
                                    }(e.permissionRequestCreateAuthorizationGrantRequest)
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        location: e.location
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.permissionRequestCreateAuthorizationGrant = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.permissionRequestCreateAuthorizationGrantRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.permissionRequestCreateMagicAuthorizationGrantRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.permissionRequestCreateMagicAuthorizationGrantRequest || void 0 === e.permissionRequestCreateMagicAuthorizationGrantRequest) throw new d.RequiredError("permissionRequestCreateMagicAuthorizationGrantRequest", "Required parameter requestParameters.permissionRequestCreateMagicAuthorizationGrantRequest was null or undefined when calling permissionRequestCreateMagicAuthorizationGrant.");
                                return r = {}, (n = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/authorizations/magic",
                                    schemaPath: "/v1/authorizations/magic",
                                    method: "POST",
                                    headers: n,
                                    query: r,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            clientId: e.clientId,
                                            scopes: e.scopes.map(C),
                                            nonce: e.nonce
                                        }
                                    }(e.permissionRequestCreateMagicAuthorizationGrantRequest)
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        code: e.code
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.permissionRequestCreateMagicAuthorizationGrant = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.permissionRequestCreateMagicAuthorizationGrantRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.permissionRequestGetAuthorizationEndpointRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return r = {}, void 0 !== e.clientId && (r.client_id = e.clientId), void 0 !== e.responseType && (r.response_type = e.responseType), void 0 !== e.redirectUri && (r.redirect_uri = e.redirectUri), void 0 !== e.scope && (r.scope = e.scope), void 0 !== e.state && (r.state = e.state), void 0 !== e.nonce && (r.nonce = e.nonce), void 0 !== e.prompt && (r.prompt = e.prompt), void 0 !== e.codeChallenge && (r.code_challenge = e.codeChallenge), void 0 !== e.codeChallengeMethod && (r.code_challenge_method = e.codeChallengeMethod), void 0 !== e.rlt && (r.rlt = e.rlt), void 0 !== e.studioTraceId && (r.studio_trace_id = e.studioTraceId), n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/authorize",
                                    schemaPath: "/v1/authorize",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.VoidApiResponse(o)]
                        }
                    })
                })
            }, t.prototype.permissionRequestGetAuthorizationEndpoint = function() {
                return m(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.permissionRequestGetAuthorizationEndpointRaw(e, t)];
                            case 1:
                                return r.sent(), [2]
                        }
                    })
                })
            }, t.prototype.permissionRequestValidatePermissionRequestRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.clientId || void 0 === e.clientId) throw new d.RequiredError("clientId", "Required parameter requestParameters.clientId was null or undefined when calling permissionRequestValidatePermissionRequest.");
                                if (null === e.redirectUri || void 0 === e.redirectUri) throw new d.RequiredError("redirectUri", "Required parameter requestParameters.redirectUri was null or undefined when calling permissionRequestValidatePermissionRequest.");
                                if (null === e.scopes || void 0 === e.scopes) throw new d.RequiredError("scopes", "Required parameter requestParameters.scopes was null or undefined when calling permissionRequestValidatePermissionRequest.");
                                if (null === e.responseTypes || void 0 === e.responseTypes) throw new d.RequiredError("responseTypes", "Required parameter requestParameters.responseTypes was null or undefined when calling permissionRequestValidatePermissionRequest.");
                                return r = {}, void 0 !== e.clientId && (r.clientId = e.clientId), void 0 !== e.redirectUri && (r.redirectUri = e.redirectUri), void 0 !== e.scopes && (r.scopes = e.scopes), void 0 !== e.responseTypes && (r.responseTypes = e.responseTypes), void 0 !== e.prompts && (r.prompts = e.prompts), void 0 !== e.rlt && (r.rlt = e.rlt), n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/permission-request",
                                    schemaPath: "/v1/permission-request",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        scopes: e.scopes.map(P),
                                        responseTypes: e.responseTypes.map(I),
                                        promptTypes: e.promptTypes.map(R),
                                        userAgreements: e.userAgreements.map(J),
                                        applicationId: e.applicationId,
                                        owner: y(e.owner),
                                        name: e.name,
                                        summary: e.summary,
                                        tosUri: (0, d.exists)(e, "tosUri") ? e.tosUri : void 0,
                                        privacyUri: (0, d.exists)(e, "privacyUri") ? e.privacyUri : void 0,
                                        entryPointUri: (0, d.exists)(e, "entryPointUri") ? e.entryPointUri : void 0,
                                        imageAssetId: (0, d.exists)(e, "imageAssetId") ? e.imageAssetId : void 0,
                                        isFirstParty: (0, d.exists)(e, "isFirstParty") ? e.isFirstParty : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.permissionRequestValidatePermissionRequest = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.permissionRequestValidatePermissionRequestRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t
        }(d.BaseAPI)),
        er = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return h(t, e), t.prototype.scopeGetScopeConfigurationRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return r = {}, void 0 !== e.returnBetaScopes && (r.returnBetaScopes = e.returnBetaScopes), n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/scope-configuration",
                                    schemaPath: "/v1/scope-configuration",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        scopeTypes: e.scopeTypes.map(V),
                                        targetTypes: e.targetTypes.map(F),
                                        targetParts: e.targetParts.map(G),
                                        products: e.products.map(D),
                                        oidcScopes: e.oidcScopes
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.scopeGetScopeConfiguration = function() {
                return m(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.scopeGetScopeConfigurationRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.scopeGetScopesRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return r = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/scopes",
                                    schemaPath: "/v1/scopes",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        scopes: e.scopes.map(L),
                                        scopeTypes: e.scopeTypes.map(B),
                                        targetTypes: e.targetTypes.map(H),
                                        targetParts: e.targetParts.map(W),
                                        products: e.products.map(K),
                                        operations: e.operations.map(z),
                                        oidcScopes: e.oidcScopes
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.scopeGetScopes = function() {
                return m(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.scopeGetScopesRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t
        }(d.BaseAPI);
    (function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        h(t, e), t.prototype.tokenGetTokenAuthorizationResourcesRaw = function(e, t) {
            return m(this, void 0, void 0, function() {
                var r, n, o, i;
                return v(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.token || void 0 === e.token) throw new d.RequiredError("token", "Required parameter requestParameters.token was null or undefined when calling tokenGetTokenAuthorizationResources.");
                            return r = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), (0, d.canConsumeForm)([{
                                contentType: "application/x-www-form-urlencoded"
                            }]), o = new URLSearchParams, void 0 !== e.token && o.append("token", e.token), void 0 !== e.clientId && o.append("client_id", e.clientId), void 0 !== e.clientSecret && o.append("client_secret", e.clientSecret), [4, this.request({
                                path: "/v1/token/resources",
                                schemaPath: "/v1/token/resources",
                                method: "POST",
                                headers: n,
                                query: r,
                                body: o
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new d.JSONApiResponse(i, function(e) {
                                return _(e)
                            })]
                    }
                })
            })
        }, t.prototype.tokenGetTokenAuthorizationResources = function(e, t) {
            return m(this, void 0, void 0, function() {
                return v(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.tokenGetTokenAuthorizationResourcesRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, t.prototype.tokenIntrospectTokenRaw = function(e, t) {
            return m(this, void 0, void 0, function() {
                var r, n, o, i;
                return v(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.token || void 0 === e.token) throw new d.RequiredError("token", "Required parameter requestParameters.token was null or undefined when calling tokenIntrospectToken.");
                            return r = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), (0, d.canConsumeForm)([{
                                contentType: "application/x-www-form-urlencoded"
                            }]), o = new URLSearchParams, void 0 !== e.token && o.append("token", e.token), void 0 !== e.clientId && o.append("client_id", e.clientId), void 0 !== e.clientSecret && o.append("client_secret", e.clientSecret), [4, this.request({
                                path: "/v1/token/introspect",
                                schemaPath: "/v1/token/introspect",
                                method: "POST",
                                headers: n,
                                query: r,
                                body: o
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new d.JSONApiResponse(i, function(e) {
                                return null == e ? e : {
                                    active: e.active,
                                    jti: (0, d.exists)(e, "jti") ? e.jti : void 0,
                                    iss: (0, d.exists)(e, "iss") ? e.iss : void 0,
                                    tokenType: (0, d.exists)(e, "token_type") ? e.token_type : void 0,
                                    clientId: (0, d.exists)(e, "client_id") ? e.client_id : void 0,
                                    aud: (0, d.exists)(e, "aud") ? e.aud : void 0,
                                    sub: (0, d.exists)(e, "sub") ? e.sub : void 0,
                                    scope: (0, d.exists)(e, "scope") ? e.scope : void 0,
                                    exp: (0, d.exists)(e, "exp") ? e.exp : void 0,
                                    iat: (0, d.exists)(e, "iat") ? e.iat : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.tokenIntrospectToken = function(e, t) {
            return m(this, void 0, void 0, function() {
                return v(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.tokenIntrospectTokenRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, t.prototype.tokenRevokeTokenRaw = function(e, t) {
            return m(this, void 0, void 0, function() {
                var r, n, o, i;
                return v(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.token || void 0 === e.token) throw new d.RequiredError("token", "Required parameter requestParameters.token was null or undefined when calling tokenRevokeToken.");
                            return r = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), (0, d.canConsumeForm)([{
                                contentType: "application/x-www-form-urlencoded"
                            }]), o = new URLSearchParams, void 0 !== e.token && o.append("token", e.token), void 0 !== e.clientId && o.append("client_id", e.clientId), void 0 !== e.clientSecret && o.append("client_secret", e.clientSecret), [4, this.request({
                                path: "/v1/token/revoke",
                                schemaPath: "/v1/token/revoke",
                                method: "POST",
                                headers: n,
                                query: r,
                                body: o
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new d.VoidApiResponse(i)]
                    }
                })
            })
        }, t.prototype.tokenRevokeToken = function(e, t) {
            return m(this, void 0, void 0, function() {
                return v(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.tokenRevokeTokenRaw(e, t)];
                        case 1:
                            return r.sent(), [2]
                    }
                })
            })
        }, t.prototype.tokenUseAuthorizationGrantRaw = function(e, t) {
            return m(this, void 0, void 0, function() {
                var r, n, o, i;
                return v(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.grantType || void 0 === e.grantType) throw new d.RequiredError("grantType", "Required parameter requestParameters.grantType was null or undefined when calling tokenUseAuthorizationGrant.");
                            return r = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), (0, d.canConsumeForm)([{
                                contentType: "application/x-www-form-urlencoded"
                            }]), o = new URLSearchParams, void 0 !== e.grantType && o.append("grant_type", e.grantType), void 0 !== e.code && o.append("code", e.code), void 0 !== e.codeVerifier && o.append("code_verifier", e.codeVerifier), void 0 !== e.refreshToken && o.append("refresh_token", e.refreshToken), void 0 !== e.clientId && o.append("client_id", e.clientId), void 0 !== e.clientSecret && o.append("client_secret", e.clientSecret), [4, this.request({
                                path: "/v1/token",
                                schemaPath: "/v1/token",
                                method: "POST",
                                headers: n,
                                query: r,
                                body: o
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new d.JSONApiResponse(i, function(e) {
                                return null == e ? e : {
                                    accessToken: e.access_token,
                                    refreshToken: (0, d.exists)(e, "refresh_token") ? e.refresh_token : void 0,
                                    tokenType: e.token_type,
                                    expiresIn: e.expires_in,
                                    idToken: (0, d.exists)(e, "id_token") ? e.id_token : void 0,
                                    scope: (0, d.exists)(e, "scope") ? e.scope : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.tokenUseAuthorizationGrant = function(e, t) {
            return m(this, void 0, void 0, function() {
                return v(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.tokenUseAuthorizationGrantRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }
    })(d.BaseAPI),
    function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        h(t, e), t.prototype.userInfoGetUserInfoRaw = function(e, t) {
            return m(this, void 0, void 0, function() {
                var r, n, o;
                return v(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return r = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/userinfo",
                                schemaPath: "/v1/userinfo",
                                method: "GET",
                                headers: n,
                                query: r
                            }, t)];
                        case 1:
                            return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    sub: e.sub,
                                    name: (0, d.exists)(e, "name") ? e.name : void 0,
                                    nickname: (0, d.exists)(e, "nickname") ? e.nickname : void 0,
                                    preferredUsername: (0, d.exists)(e, "preferred_username") ? e.preferred_username : void 0,
                                    createdAt: (0, d.exists)(e, "created_at") ? e.created_at : void 0,
                                    profile: (0, d.exists)(e, "profile") ? e.profile : void 0,
                                    picture: (0, d.exists)(e, "picture") ? e.picture : void 0,
                                    email: (0, d.exists)(e, "email") ? e.email : void 0,
                                    emailVerified: (0, d.exists)(e, "email_verified") ? e.email_verified : void 0,
                                    verified: (0, d.exists)(e, "verified") ? e.verified : void 0,
                                    ageChecked: (0, d.exists)(e, "age_checked") ? e.age_checked : void 0,
                                    ageBracket: (0, d.exists)(e, "age_bracket") ? e.age_bracket : void 0,
                                    premium: (0, d.exists)(e, "premium") ? e.premium : void 0,
                                    roles: (0, d.exists)(e, "roles") ? e.roles : void 0,
                                    internalUser: (0, d.exists)(e, "internal_user") ? e.internal_user : void 0,
                                    attributes: (0, d.exists)(e, "attributes") ? e.attributes : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.userInfoGetUserInfo = function() {
            return m(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), v(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.userInfoGetUserInfoRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }
    }(d.BaseAPI), e.s(["ApplicationApi", 0, Z, "ApplicationAuthorizationsApiModelsEnumErrorCode", 0, {
        InternalError: "InternalError",
        NotAuthenticated: "NotAuthenticated",
        MissingArgument: "MissingArgument",
        DuplicateValuesArgument: "DuplicateValuesArgument",
        InvalidArgument: "InvalidArgument",
        InvalidRequest: "InvalidRequest",
        ArgumentExceedsLimit: "ArgumentExceedsLimit",
        AuthorizationUnauthorizedAccess: "AuthorizationUnauthorizedAccess",
        AuthorizationNotFound: "AuthorizationNotFound",
        ApplicationUnauthorizedAccess: "ApplicationUnauthorizedAccess",
        ApplicationNotFound: "ApplicationNotFound",
        TargetUnauthorizedAccess: "TargetUnauthorizedAccess",
        TargetNotFound: "TargetNotFound",
        ApplicationNameTaken: "ApplicationNameTaken",
        TextInappropriate: "TextInappropriate",
        InvalidScope: "InvalidScope",
        MalformedRedirectUri: "MalformedRedirectUri",
        IllegalSchemeRedirectUri: "IllegalSchemeRedirectUri",
        RedirectUriMismatch: "RedirectUriMismatch",
        ScopeMismatch: "ScopeMismatch",
        AccessDenied: "AccessDenied",
        SettingsChangeRequired: "SettingsChangeRequired",
        LuobuCreatorMobileBindingMissing: "LuobuCreatorMobileBindingMissing",
        AgeCheckRequired: "AgeCheckRequired",
        EmailVerificationRequired: "EmailVerificationRequired",
        InvalidPromptValue: "InvalidPromptValue",
        InvalidResponseTypeValue: "InvalidResponseTypeValue",
        IllegalPrompt: "IllegalPrompt",
        InteractionRequired: "InteractionRequired",
        LoginRequired: "LoginRequired",
        AccountSelectionRequired: "AccountSelectionRequired",
        ConsentRequired: "ConsentRequired",
        GroupNotFound: "GroupNotFound",
        Conflict: "Conflict",
        UnauthorizedAccess: "UnauthorizedAccess",
        ActiveApplicationLimitExceeded: "ActiveApplicationLimitExceeded",
        AuthorizationLimitExceeded: "AuthorizationLimitExceeded",
        InvalidImageFile: "InvalidImageFile",
        ApplicationStatusConflict: "ApplicationStatusConflict",
        InvalidOrigin: "InvalidOrigin",
        InvalidVerificationToken: "InvalidVerificationToken",
        PublishLimitExceeded: "PublishLimitExceeded",
        ApplicationModerated: "ApplicationModerated",
        ReviewSubmissionRequired: "ReviewSubmissionRequired"
    }, "AuthorizationApi", 0, Q, "DiscoveryApi", 0, ee, "PermissionRequestApi", 0, et, "ScopeApi", 0, er], 280162);
    let en = (0, r.createContext)(null);
    en.displayName = "StudioResources";
    let eo = (0, o.makeStyles)()(() => ({
        closeIcon: {
            position: "absolute",
            right: 8,
            top: 8
        },
        studioIcon: {
            width: 80
        },
        dialogText: {
            marginTop: 20,
            marginBottom: 20,
            textAlign: "center"
        }
    }));
    var ei, ea = e => {
            let {
                logoSrc: t,
                translations: n
            } = e, {
                classes: {
                    studioIcon: o,
                    dialogText: l
                }
            } = eo();
            return r.default.createElement(r.default.Fragment, null, r.default.createElement(i.Grid, {
                container: !0,
                "data-testid": "studio-dialog-loading",
                direction: "column",
                alignItems: "center"
            }, r.default.createElement("img", {
                width: 64,
                className: o,
                src: t,
                alt: "studio logo"
            }), r.default.createElement(a.Typography, {
                classes: {
                    root: l
                },
                variant: "body1",
                color: "secondary"
            }, n["Message.CheckingStudio"])), r.default.createElement(s.LinearProgress, {
                title: "progress bar"
            }))
        },
        es = e => {
            let {
                logoSrc: t,
                translations: n,
                onClose: o
            } = e, {
                classes: {
                    closeIcon: s,
                    studioIcon: u,
                    dialogText: p
                }
            } = eo();
            return r.default.createElement(i.Grid, {
                container: !0,
                "data-testid": "studio-dialog-error",
                direction: "column",
                alignItems: "center"
            }, r.default.createElement(l.IconButton, {
                className: s,
                color: "secondary",
                "aria-label": "close",
                onClick: o,
                size: "large"
            }, r.default.createElement(c.CloseIcon, null)), r.default.createElement("img", {
                width: 64,
                className: u,
                src: t,
                alt: "studio logo"
            }), r.default.createElement(a.Typography, {
                classes: {
                    root: p
                },
                variant: "body1",
                color: "secondary"
            }, n["Message.OpenStudioError"]))
        },
        el = e => {
            let {
                downloadUrl: t,
                logoSrc: n,
                translations: o,
                onClose: s,
                onDownload: p
            } = e, {
                classes: {
                    closeIcon: d,
                    studioIcon: f,
                    dialogText: h
                }
            } = eo();
            return r.default.createElement(i.Grid, {
                container: !0,
                "data-testid": "studio-dialog-download",
                direction: "column",
                alignItems: "center"
            }, r.default.createElement(l.IconButton, {
                className: d,
                color: "secondary",
                "aria-label": "close",
                onClick: s,
                size: "large"
            }, r.default.createElement(c.CloseIcon, null)), r.default.createElement("img", {
                width: 64,
                className: f,
                src: n,
                alt: "studio logo"
            }), r.default.createElement(a.Typography, {
                classes: {
                    root: h
                },
                variant: "body1",
                color: "secondary"
            }, o["Message.StartYourCreation"]), r.default.createElement(u.Button, {
                "data-testid": "cancel-studio-dialog-button",
                variant: "contained",
                onClick: () => {
                    p(), window.open(t, "_blank")
                },
                "aria-label": o["Action.DownloadStudio"]
            }, o["Action.DownloadStudio"]))
        };
    let ec = "sitetest1",
        eu = "sitetest2",
        ep = "sitetest3",
        ed = "production",
        ef = "luobu";
    var eh = ((ei = {}).Default = "Default", ei.ReturnFromLogin = "ReturnFromLogin", ei.EditPlace = "EditPlace", ei.EditPlaceRevision = "EditPlaceRevision", ei.ViewAsset = "ViewAsset", ei);
    let em = async (e, t, r) => {
        let n = "".concat(e, "/product-experimentation-platform/v1/projects/1/layers/").concat(t, "/values?parameters=").concat(r);
        return (await fetch(n, {
            headers: {
                "Content-Type": "application/json"
            },
            credentials: "include"
        })).json()
    }, ev = async e => {
        var t, r, o, i, a;
        let s = (0, n.getCurrentPlatform)();
        if (s === n.Platform.macOS) {
            let n = await em(e, "CreatorHubStudioInMac", "enablePersonalizedInstallerInMac,enablePersonalizedStudioLaunchInMac");
            return {
                enablePersonalizedInstaller: !1,
                enableDummyCodeInInstaller: !1,
                enablePersonalizedInstallerInMac: null != (t = n.enablePersonalizedInstallerInMac) && t,
                enablePersonalizedStudioLaunch: !1,
                enablePersonalizedStudioLaunchInMac: null != (r = n.enablePersonalizedStudioLaunchInMac) && r
            }
        }
        if (s === n.Platform.Windows) {
            let t = await em(e, "CreatorHubStudio", "enableDummyCodeInInstaller,enablePersonalizedInstaller,enablePersonalizedStudioLaunch");
            return {
                enablePersonalizedInstaller: null != (o = t.enablePersonalizedInstaller) && o,
                enableDummyCodeInInstaller: null != (i = t.enableDummyCodeInInstaller) && i,
                enablePersonalizedInstallerInMac: !1,
                enablePersonalizedStudioLaunch: null != (a = t.enablePersonalizedStudioLaunch) && a,
                enablePersonalizedStudioLaunchInMac: !1
            }
        }
        return {
            enablePersonalizedInstaller: !1,
            enableDummyCodeInInstaller: !1,
            enablePersonalizedInstallerInMac: !1,
            enablePersonalizedStudioLaunch: !1,
            enablePersonalizedStudioLaunchInMac: !1
        }
    }, ey = async e => null != t ? t : t = ev(e), eg = [{
        scopeType: "openid",
        operations: ["read"]
    }, {
        scopeType: "credentials",
        operations: ["read"]
    }, {
        scopeType: "profile",
        operations: ["read"]
    }, {
        scopeType: "age",
        operations: ["read"]
    }, {
        scopeType: "roles",
        operations: ["read"]
    }, {
        scopeType: "premium",
        operations: ["read"]
    }, {
        scopeType: "verification",
        operations: ["read"]
    }];

    function eb(e) {
        let t = new Uint8Array(e);
        globalThis.crypto.getRandomValues(t);
        let r = "";
        return t.forEach(e => {
            r += String.fromCharCode(e)
        }), btoa(r)
    }
    let ew = async e => {
        let {
            clientId: t,
            bedev2BasePath: r
        } = e, n = new et(new d.Configuration({
            basePath: "".concat(r, "/oauth"),
            credentials: "include",
            enableMrRouter: !0
        })), o = eb(64);
        try {
            let e = await ey(r);
            if (null == e ? void 0 : e.enableDummyCodeInInstaller) return eb(33).replaceAll("+", "-").replaceAll("/", "_").replace(/=+$/, "");
            if (!e || !e.enablePersonalizedInstaller && !e.enablePersonalizedInstallerInMac || "function" != typeof n.permissionRequestCreateMagicAuthorizationGrant) return;
            return (await n.permissionRequestCreateMagicAuthorizationGrant({
                permissionRequestCreateMagicAuthorizationGrantRequest: {
                    clientId: t,
                    scopes: eg,
                    nonce: o
                }
            })).code
        } catch (e) {
            return
        }
    }, ex = [{
        scopeType: "openid",
        operations: ["read"]
    }, {
        scopeType: "credentials",
        operations: ["read"]
    }, {
        scopeType: "profile",
        operations: ["read"]
    }, {
        scopeType: "age",
        operations: ["read"]
    }, {
        scopeType: "roles",
        operations: ["read"]
    }, {
        scopeType: "premium",
        operations: ["read"]
    }, {
        scopeType: "verification",
        operations: ["read"]
    }], eA = async (e, t) => {
        let {
            clientId: r,
            bedev2BasePath: n
        } = e, o, i, a, s = new et(new d.Configuration({
            basePath: "".concat(n, "/oauth"),
            credentials: "include",
            enableMrRouter: !0
        })), l = (i = new Uint8Array(64), globalThis.crypto.getRandomValues(i), a = "", i.forEach(e => {
            a += String.fromCharCode(e)
        }), btoa(a));
        try {
            o = await ey(n)
        } catch (e) {
            return
        }
        if (o && (o.enablePersonalizedStudioLaunch || o.enablePersonalizedStudioLaunchInMac) && "permissionRequestCreateMagicAuthorizationGrant" in s && "function" == typeof s.permissionRequestCreateMagicAuthorizationGrant) try {
            return (await s.permissionRequestCreateMagicAuthorizationGrant({
                permissionRequestCreateMagicAuthorizationGrantRequest: {
                    clientId: r,
                    scopes: ex,
                    nonce: l
                }
            })).code
        } catch (e) {
            try {
                null == t || t(e instanceof Error ? e : Error(String(e)))
            } catch (e) {}
            return
        }
    }, eR = e => {
        let t = ["".concat(e.protocolScheme, ":1"), "launchtime:".concat(Date.now()), "avatar", "browsertrackerid:".concat((() => {
            let e = (0, n.getCookieValueByKey)("RBXEventTrackerV2") || (0, n.getCookieValueByKey)("RBXEventTracker");
            if (e) {
                let t = e.match(/browserid=([^&]*)/i);
                if (t) return t[1] || ""
            }
            return ""
        })()), "robloxLocale:".concat(e.locale), "gameLocale:".concat(e.locale), "channel:".concat(e.channel), "browser:".concat(n.device.getCurrentBrowser()), "userId:".concat(e.userId), "distributorType:".concat(e.distributorType)];
        return void 0 !== e.authCode && "" !== e.authCode && t.push("authCode:".concat(e.authCode), "authCodeType:magic"), void 0 !== e.baseUrl && t.push("baseUrl:".concat(encodeURIComponent(e.baseUrl))), e.task === eh.ViewAsset ? (t.push("launchmode:asset"), t.push("assetid:".concat(e.assetId))) : (t.push("launchmode:edit"), e.task === eh.EditPlace && (t.push("task:".concat(e.task), "placeId:".concat(e.placeId), "universeId:".concat(e.universeId)), e.adPlacementId && (t.push("adPlacementId:".concat(e.adPlacementId)), e.referrerId && t.push("referrerId:".concat(e.referrerId)))), e.task === eh.EditPlaceRevision && (t.push("task:".concat(e.task), "placeId:".concat(e.placeId), "universeId:".concat(e.universeId), "placeversion:".concat(e.placeVersion)), e.scriptUniqueId && t.push("openscriptfromid:".concat(e.scriptUniqueId)), e.scriptPath && t.push("openscriptpath:".concat(e.scriptPath)), null != e.startLine && null != e.endLine && t.push("startline:".concat(e.startLine), "endline:".concat(e.endLine)), null != e.startCharacter && null != e.endCharacter && t.push("startcharacter:".concat(e.startCharacter), "endcharacter:".concat(e.endCharacter))), (e.task === eh.Default || e.task === eh.ReturnFromLogin) && t.push("task:".concat(e.task))), t.join("+")
    }, eI = (0, o.makeStyles)()(e => ({
        dialog: {
            backgroundColor: e.palette.background.media,
            padding: "40px 20px 30px 20px",
            minWidth: 400
        }
    }));
    async function eS(e) {
        return Array.from(new Uint8Array(await crypto.subtle.digest("SHA-1", new TextEncoder().encode(e)))).map(e => e.toString(16).padStart(2, "0")).join("")
    }
    let eP = {
            [ec]: "5248896133416875863",
            [eu]: "3992715735343249042",
            [ep]: "5462362171564719537",
            [ed]: "7968549422692352298"
        },
        eC = {
            [ec]: "6593031293946509533",
            [eu]: "6280195288255344888",
            [ep]: "5437780827214302073",
            [ed]: "6154550030602747221"
        },
        eq = "https://setup.c.robloxdev.cn",
        ek = "".concat(eq, "/cjv/RobloxStudioInstallerCJV.exe"),
        eT = "".concat(eq, "/mac/cjv/RobloxStudioCJV.dmg");
    e.s(["EStudioTaskType", 0, eh, "StudioResourcesProvider", 0, e => {
        let {
            resources: t,
            children: n
        } = e;
        return r.default.createElement(en.Provider, {
            value: t
        }, n)
    }, "createStudioResources", 0, function(e) {
        let {
            logoSrc: t,
            environment: r,
            target: o,
            fetchers: i,
            errorHandler: a
        } = e, s, l = o === ef ? eC[r] : eP[r];
        return {
            logoSrc: t,
            downloadURL: (s = (0, n.getCurrentPlatform)(), o === ef ? s === n.Platform.macOS ? eT : ek : r === ed ? "https://www.roblox.com/download/studio" : "https://www.".concat(r, ".robloxlabs.com/download/studio")),
            bedev2BasePath: r === ed ? "https://apis.roblox.com" : "https://apis.".concat(r, ".robloxlabs.com"),
            clientId: l,
            async fetchUserChannel() {
                let e = await i.userChannel();
                return void 0 === e || "LIVE" === e.toUpperCase() ? "" : e
            },
            onError(e, t) {
                null == a || a(e, t)
            }
        }
    }, "useStudio", 0, (e, t) => {
        let o = (0, n.getCurrentPlatform)(),
            i = function() {
                let e = (0, r.useContext)(en);
                if (null === e) throw Error("Cannot load required studio resources, please make sure the provider has been properly set up");
                return e
            }(),
            {
                classes: {
                    dialog: a
                }
            } = eI(),
            [s, l] = (0, r.useState)(),
            [c, u] = (0, r.useState)(),
            d = (0, r.useRef)(s),
            f = (0, r.useRef)(void 0),
            h = (0, r.useCallback)(async () => {
                let e = await ew(i);
                return void 0 === e ? i.downloadURL : "".concat(i.downloadURL, "?code=").concat(e)
            }, [i]),
            m = (0, r.useCallback)(async () => void 0 === c ? void 0 : eS(c), [c]),
            v = (0, r.useCallback)(e => {
                f.current = e
            }, []),
            y = (0, r.useCallback)(e => {
                d.current = e, l(e)
            }, []),
            g = (0, r.useRef)(t);
        (0, r.useEffect)(() => {
            g.current = t
        }, [t]);
        let b = (0, r.useCallback)(() => {
                var e, t;
                let r = f.current;
                v(void 0), y(void 0), void 0 !== r && (null == (t = g.current) || null == (e = t.close) || e.call(t, r))
            }, [v, y]),
            w = (0, r.useCallback)(() => {
                "Download" === d.current && b()
            }, [b]);
        (0, r.useEffect)(() => (window.addEventListener("blur", w), () => {
            window.removeEventListener("blur", w)
        }), [w]);
        let x = (0, r.useCallback)(async (e, r) => {
                let {
                    userId: n,
                    locale: o,
                    protocolScheme: a,
                    distributorType: s,
                    baseUrl: l
                } = r;
                try {
                    var c, p, d, f;
                    let r, h;
                    v(e), y("Loading"), null == t || null == (p = t.startAttempt) || p.call(t, e);
                    let [m, g, b] = await Promise.all([i.fetchUserChannel(), ew(i), eA(i, t => i.onError(t, e))]);
                    u(g);
                    let w = {
                            userId: null != (c = null == n ? void 0 : n.toString()) ? c : "",
                            locale: o,
                            protocolScheme: a,
                            distributorType: s,
                            baseUrl: l,
                            channel: m,
                            authCode: b
                        },
                        x = "";
                    switch (e.task) {
                        case eh.EditPlace:
                            x = eR({
                                ...w,
                                task: e.task,
                                universeId: e.universeId,
                                placeId: e.placeId,
                                adPlacementId: e.adPlacementId,
                                referrerId: e.referrerId
                            });
                            break;
                        case eh.EditPlaceRevision:
                            x = eR({
                                ...w,
                                task: e.task,
                                universeId: e.universeId,
                                placeId: e.placeId,
                                placeVersion: e.placeVersion,
                                scriptUniqueId: e.scriptUniqueId,
                                scriptPath: e.scriptPath,
                                startLine: e.startLine,
                                endLine: e.endLine,
                                startCharacter: e.startCharacter,
                                endCharacter: e.endCharacter
                            });
                            break;
                        case eh.ViewAsset:
                            x = eR({
                                ...w,
                                task: e.task,
                                assetId: e.assetId
                            });
                            break;
                        case eh.Default:
                        case eh.ReturnFromLogin:
                            x = eR({
                                ...w,
                                task: e.task
                            })
                    }
                    f = x, (r = document.querySelector('[data-testid="studio-protocol-iframe"]')) && r.remove(), (h = document.createElement("iframe")).style.display = "none", h.src = f, h.setAttribute("data-testid", "studio-protocol-iframe"), document.body.appendChild(h);
                    let A = void 0 !== b && "" !== b,
                        R = A ? await eS(b).catch(() => "hash_failed") : void 0;
                    null == t || null == (d = t.startSuccess) || d.call(t, e, {
                        hasAuthCode: A,
                        authCodeHash: R
                    }), await new Promise(e => {
                        setTimeout(e, 3e3)
                    }), y("Download")
                } catch (t) {
                    y("Error"), i.onError(t instanceof Error ? t : Error(String(t)), e)
                }
            }, [t, v, y, i]),
            A = void 0 === c ? i.downloadURL : "".concat(i.downloadURL, "?code=").concat(c);
        return {
            open: x,
            dialog: (0, r.useMemo)(() => r.default.createElement(p.Dialog, {
                classes: {
                    paper: a
                },
                maxWidth: "XSmall",
                open: void 0 !== s
            }, "Loading" === s && r.default.createElement(ea, {
                logoSrc: i.logoSrc,
                translations: e
            }), "Error" === s && r.default.createElement(es, {
                onClose: b,
                logoSrc: i.logoSrc,
                translations: e
            }), "Download" === s && r.default.createElement(el, {
                onClose: b,
                onDownload: () => {
                    var e;
                    void 0 !== f.current && (null == t || null == (e = t.download) || e.call(t, f.current, {
                        getDownloadCode: m
                    }))
                },
                downloadUrl: A,
                logoSrc: i.logoSrc,
                translations: e
            })), [b, a, s, m, A, t, i.logoSrc, e]),
            isCompatible: o === n.Platform.Windows || o === n.Platform.macOS,
            getStudioDownloadUrlAsync: h
        }
    }], 581577)
}]);

//# debugId=278296a1-1149-4286-0ff7-bc17a667446d
//# sourceMappingURL=3znjaqdplcdjj.js.map
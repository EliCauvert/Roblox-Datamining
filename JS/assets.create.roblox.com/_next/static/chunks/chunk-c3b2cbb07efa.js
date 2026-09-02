;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "65dc2ec0-eb09-df7e-160c-1404306e61c3")
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
        l = e.i(598943),
        s = e.i(44265),
        d = e.i(763960),
        u = e.i(226972),
        c = e.i(594278),
        f = e.i(793808),
        p = e.i(813593),
        g = e.i(3300),
        v = e.i(699704),
        m = e.i(221628),
        h = "Dialog",
        [b, y] = (0, o.createContextScope)(h),
        [x, w] = b(h),
        R = e => {
            let {
                __scopeDialog: r,
                children: n,
                open: o,
                defaultOpen: l,
                onOpenChange: s,
                modal: d = !0
            } = e, u = t.useRef(null), c = t.useRef(null), [f = !1, p] = (0, a.useControllableState)({
                prop: o,
                defaultProp: l,
                onChange: s
            });
            return (0, m.jsx)(x, {
                scope: r,
                triggerRef: u,
                contentRef: c,
                contentId: (0, i.useId)(),
                titleId: (0, i.useId)(),
                descriptionId: (0, i.useId)(),
                open: f,
                onOpenChange: p,
                onOpenToggle: t.useCallback(() => p(e => !e), [p]),
                modal: d,
                children: n
            })
        };
    R.displayName = h;
    var j = "DialogTrigger",
        D = t.forwardRef((e, t) => {
            let {
                __scopeDialog: o,
                ...i
            } = e, a = w(j, o), l = (0, n.useComposedRefs)(t, a.triggerRef);
            return (0, m.jsx)(c.Primitive.button, {
                type: "button",
                "aria-haspopup": "dialog",
                "aria-expanded": a.open,
                "aria-controls": a.contentId,
                "data-state": $(a.open),
                ...i,
                ref: l,
                onClick: (0, r.composeEventHandlers)(e.onClick, a.onOpenToggle)
            })
        });
    D.displayName = j;
    var C = "DialogPortal",
        [O, E] = b(C, {
            forceMount: void 0
        }),
        I = e => {
            let {
                __scopeDialog: r,
                forceMount: n,
                children: o,
                container: i
            } = e, a = w(C, r);
            return (0, m.jsx)(O, {
                scope: r,
                forceMount: n,
                children: t.Children.map(o, e => (0, m.jsx)(u.Presence, {
                    present: n || a.open,
                    children: (0, m.jsx)(d.Portal, {
                        asChild: !0,
                        container: i,
                        children: e
                    })
                }))
            })
        };
    I.displayName = C;
    var P = "DialogOverlay",
        T = t.forwardRef((e, t) => {
            let r = E(P, e.__scopeDialog),
                {
                    forceMount: n = r.forceMount,
                    ...o
                } = e,
                i = w(P, e.__scopeDialog);
            return i.modal ? (0, m.jsx)(u.Presence, {
                present: n || i.open,
                children: (0, m.jsx)(N, {
                    ...o,
                    ref: t
                })
            }) : null
        });
    T.displayName = P;
    var S = (0, v.createSlot)("DialogOverlay.RemoveScroll"),
        N = t.forwardRef((e, t) => {
            let {
                __scopeDialog: r,
                ...n
            } = e, o = w(P, r);
            return (0, m.jsx)(p.RemoveScroll, {
                as: S,
                allowPinchZoom: !0,
                shards: [o.contentRef],
                children: (0, m.jsx)(c.Primitive.div, {
                    "data-state": $(o.open),
                    ...n,
                    ref: t,
                    style: {
                        pointerEvents: "auto",
                        ...n.style
                    }
                })
            })
        }),
        F = "DialogContent",
        L = t.forwardRef((e, t) => {
            let r = E(F, e.__scopeDialog),
                {
                    forceMount: n = r.forceMount,
                    ...o
                } = e,
                i = w(F, e.__scopeDialog);
            return (0, m.jsx)(u.Presence, {
                present: n || i.open,
                children: i.modal ? (0, m.jsx)(k, {
                    ...o,
                    ref: t
                }) : (0, m.jsx)(W, {
                    ...o,
                    ref: t
                })
            })
        });
    L.displayName = F;
    var k = t.forwardRef((e, o) => {
            let i = w(F, e.__scopeDialog),
                a = t.useRef(null),
                l = (0, n.useComposedRefs)(o, i.contentRef, a);
            return t.useEffect(() => {
                let e = a.current;
                if (e) return (0, g.hideOthers)(e)
            }, []), (0, m.jsx)(M, {
                ...e,
                ref: l,
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
        W = t.forwardRef((e, r) => {
            let n = w(F, e.__scopeDialog),
                o = t.useRef(!1),
                i = t.useRef(!1);
            return (0, m.jsx)(M, {
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
                    let l = t.target;
                    (null == (a = n.triggerRef.current) ? void 0 : a.contains(l)) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && i.current && t.preventDefault()
                }
            })
        }),
        M = t.forwardRef((e, r) => {
            let {
                __scopeDialog: o,
                trapFocus: i,
                onOpenAutoFocus: a,
                onCloseAutoFocus: d,
                ...u
            } = e, c = w(F, o), p = t.useRef(null), g = (0, n.useComposedRefs)(r, p);
            return (0, f.useFocusGuards)(), (0, m.jsxs)(m.Fragment, {
                children: [(0, m.jsx)(s.FocusScope, {
                    asChild: !0,
                    loop: !0,
                    trapped: i,
                    onMountAutoFocus: a,
                    onUnmountAutoFocus: d,
                    children: (0, m.jsx)(l.DismissableLayer, {
                        role: "dialog",
                        id: c.contentId,
                        "aria-describedby": c.descriptionId,
                        "aria-labelledby": c.titleId,
                        "data-state": $(c.open),
                        ...u,
                        ref: g,
                        onDismiss: () => c.onOpenChange(!1)
                    })
                }), (0, m.jsxs)(m.Fragment, {
                    children: [(0, m.jsx)(G, {
                        titleId: c.titleId
                    }), (0, m.jsx)(Q, {
                        contentRef: p,
                        descriptionId: c.descriptionId
                    })]
                })]
            })
        }),
        _ = "DialogTitle",
        A = t.forwardRef((e, t) => {
            let {
                __scopeDialog: r,
                ...n
            } = e, o = w(_, r);
            return (0, m.jsx)(c.Primitive.h2, {
                id: o.titleId,
                ...n,
                ref: t
            })
        });
    A.displayName = _;
    var H = "DialogDescription",
        B = t.forwardRef((e, t) => {
            let {
                __scopeDialog: r,
                ...n
            } = e, o = w(H, r);
            return (0, m.jsx)(c.Primitive.p, {
                id: o.descriptionId,
                ...n,
                ref: t
            })
        });
    B.displayName = H;
    var z = "DialogClose",
        U = t.forwardRef((e, t) => {
            let {
                __scopeDialog: n,
                ...o
            } = e, i = w(z, n);
            return (0, m.jsx)(c.Primitive.button, {
                type: "button",
                ...o,
                ref: t,
                onClick: (0, r.composeEventHandlers)(e.onClick, () => i.onOpenChange(!1))
            })
        });

    function $(e) {
        return e ? "open" : "closed"
    }
    U.displayName = z;
    var K = "DialogTitleWarning",
        [V, q] = (0, o.createContext)(K, {
            contentName: F,
            titleName: _,
            docsSlug: "dialog"
        }),
        G = e => {
            let {
                titleId: r
            } = e, n = q(K), o = "`".concat(n.contentName, "` requires a `").concat(n.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(n.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(n.docsSlug);
            return t.useEffect(() => {
                r && (document.getElementById(r) || console.error(o))
            }, [o, r]), null
        },
        Q = e => {
            let {
                contentRef: r,
                descriptionId: n
            } = e, o = q("DialogDescriptionWarning"), i = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(o.contentName, "}.");
            return t.useEffect(() => {
                var e;
                let t = null == (e = r.current) ? void 0 : e.getAttribute("aria-describedby");
                n && t && (document.getElementById(n) || console.warn(i))
            }, [i, r, n]), null
        };
    e.s(["Close", 0, U, "Content", 0, L, "Description", 0, B, "Overlay", 0, T, "Portal", 0, I, "Root", 0, R, "Title", 0, A, "Trigger", 0, D], 425353), e.i(149285);
    var Z = e.i(23342),
        J = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce((e, r) => {
            let n = (0, Z.createSlot)("Primitive.".concat(r)),
                o = t.forwardRef((e, t) => {
                    let {
                        asChild: o,
                        ...i
                    } = e;
                    return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, m.jsx)(o ? n : r, {
                        ...i,
                        ref: t
                    })
                });
            return o.displayName = "Primitive.".concat(r), {
                ...e,
                [r]: o
            }
        }, {}),
        X = Object.freeze({
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
        Y = t.forwardRef((e, t) => (0, m.jsx)(J.span, {
            ...e,
            ref: t,
            style: {
                ...X,
                ...e.style
            }
        }));
    Y.displayName = "VisuallyHidden", e.s(["VisuallyHidden", 0, Y], 199512)
}, 635710, e => {
    "use strict";
    var t = e.i(197649),
        r = e.i(416340);
    let n = (0, r.forwardRef)((e, n) => {
        let {
            className: o,
            style: i,
            orientation: a = "horizontal",
            variant: l = "Standard",
            ...s
        } = e, d = "vertical" === a, u = {};
        return d || "Inset" !== l ? d || "InsetLeft" !== l ? d || "InsetRight" !== l || (u = {
            marginRight: "var(--padding-xlarge)"
        }) : u = {
            marginLeft: "var(--padding-xlarge)"
        } : u = {
            marginLeft: "var(--padding-xlarge)",
            marginRight: "var(--padding-xlarge)"
        }, r.default.createElement("div", {
            ref: n,
            ...s,
            role: "separator",
            "data-orientation": a,
            "aria-orientation": a,
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
                } : "Thick" === l ? {
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
}, 25818, e => {
    "use strict";
    var t = e.i(472536),
        r = e.i(725074),
        n = e.i(197649),
        o = e.i(416340);
    let i = {
            Small: "padding-xsmall",
            Medium: "padding-small",
            Large: "padding-medium"
        },
        a = {
            Utility: "bg-action-link",
            OverMedia: "bg-over-media-100"
        };
    e.s(["CloseAffordance", 0, e => {
        let {
            variant: l,
            size: s,
            isCircular: d,
            className: u,
            ...c
        } = e;
        return o.default.createElement("button", {
            type: "button",
            className: (0, n.default)("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", t.interactable, a[l], i[s], d && "radius-circle", u),
            ...c
        }, o.default.createElement(t.StateLayer, null), o.default.createElement(r.Icon, {
            name: "icon-regular-x",
            size: s
        }))
    }])
}, 223808, (e, t, r) => {
    var n = 0 / 0,
        o = /^\s+|\s+$/g,
        i = /^[-+]0x[0-9a-f]+$/i,
        a = /^0b[01]+$/i,
        l = /^0o[0-7]+$/i,
        s = parseInt,
        d = e.g && e.g.Object === Object && e.g,
        u = "object" == typeof self && self && self.Object === Object && self,
        c = d || u || Function("return this")(),
        f = Object.prototype.toString,
        p = Math.max,
        g = Math.min,
        v = function() {
            return c.Date.now()
        };

    function m(e) {
        var t = typeof e;
        return !!e && ("object" == t || "function" == t)
    }

    function h(e) {
        if ("number" == typeof e) return e;
        if ("symbol" == typeof(t = e) || t && "object" == typeof t && "[object Symbol]" == f.call(t)) return n;
        if (m(e)) {
            var t, r = "function" == typeof e.valueOf ? e.valueOf() : e;
            e = m(r) ? r + "" : r
        }
        if ("string" != typeof e) return 0 === e ? e : +e;
        e = e.replace(o, "");
        var d = a.test(e);
        return d || l.test(e) ? s(e.slice(2), d ? 2 : 8) : i.test(e) ? n : +e
    }
    t.exports = function(e, t, r) {
        var n, o, i, a, l, s, d = 0,
            u = !1,
            c = !1,
            f = !0;
        if ("function" != typeof e) throw TypeError("Expected a function");

        function b(t) {
            var r = n,
                i = o;
            return n = o = void 0, d = t, a = e.apply(i, r)
        }

        function y(e) {
            var r = e - s,
                n = e - d;
            return void 0 === s || r >= t || r < 0 || c && n >= i
        }

        function x() {
            var e, r, n, o = v();
            if (y(o)) return w(o);
            l = setTimeout(x, (e = o - s, r = o - d, n = t - e, c ? g(n, i - r) : n))
        }

        function w(e) {
            return (l = void 0, f && n) ? b(e) : (n = o = void 0, a)
        }

        function R() {
            var e, r = v(),
                i = y(r);
            if (n = arguments, o = this, s = r, i) {
                if (void 0 === l) return d = e = s, l = setTimeout(x, t), u ? b(e) : a;
                if (c) return l = setTimeout(x, t), b(s)
            }
            return void 0 === l && (l = setTimeout(x, t)), a
        }
        return t = h(t) || 0, m(r) && (u = !!r.leading, i = (c = "maxWait" in r) ? p(h(r.maxWait) || 0, t) : i, f = "trailing" in r ? !!r.trailing : f), R.cancel = function() {
            void 0 !== l && clearTimeout(l), d = 0, n = s = o = l = void 0
        }, R.flush = function() {
            return void 0 === l ? a : w(v())
        }, R
    }
}, 167878, e => {
    "use strict";
    var t = e.i(416340);
    e.i(223808);
    var r = "u" > typeof window ? t.useLayoutEffect : t.useEffect,
        n = "u" < typeof window;
    e.s(["useMediaQuery", 0, function(e) {
        let {
            defaultValue: o = !1,
            initializeWithValue: i = !0
        } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}, a = e => n ? o : window.matchMedia(e).matches, [l, s] = (0, t.useState)(() => i ? a(e) : o);

        function d() {
            s(a(e))
        }
        return r(() => {
            let t = window.matchMedia(e);
            return d(), t.addListener ? t.addListener(d) : t.addEventListener("change", d), () => {
                t.removeListener ? t.removeListener(d) : t.removeEventListener("change", d)
            }
        }, [e]), l
    }])
}]);

//# debugId=65dc2ec0-eb09-df7e-160c-1404306e61c3
//# sourceMappingURL=1rbl_ozoi1w0x.js.map
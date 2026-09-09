;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "eaeddf9b-5bca-1400-333a-6e47ebe0b166")
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
        u = e.i(763960),
        c = e.i(226972),
        d = e.i(594278),
        f = e.i(793808),
        p = e.i(813593),
        v = e.i(3300),
        m = e.i(699704),
        g = e.i(221628),
        y = "Dialog",
        [h, b] = (0, o.createContextScope)(y),
        [w, j] = h(y),
        x = e => {
            let {
                __scopeDialog: r,
                children: n,
                open: o,
                defaultOpen: s,
                onOpenChange: l,
                modal: u = !0
            } = e, c = t.useRef(null), d = t.useRef(null), [f = !1, p] = (0, a.useControllableState)({
                prop: o,
                defaultProp: s,
                onChange: l
            });
            return (0, g.jsx)(w, {
                scope: r,
                triggerRef: c,
                contentRef: d,
                contentId: (0, i.useId)(),
                titleId: (0, i.useId)(),
                descriptionId: (0, i.useId)(),
                open: f,
                onOpenChange: p,
                onOpenToggle: t.useCallback(() => p(e => !e), [p]),
                modal: u,
                children: n
            })
        };
    x.displayName = y;
    var D = "DialogTrigger",
        R = t.forwardRef((e, t) => {
            let {
                __scopeDialog: o,
                ...i
            } = e, a = j(D, o), s = (0, n.useComposedRefs)(t, a.triggerRef);
            return (0, g.jsx)(d.Primitive.button, {
                type: "button",
                "aria-haspopup": "dialog",
                "aria-expanded": a.open,
                "aria-controls": a.contentId,
                "data-state": U(a.open),
                ...i,
                ref: s,
                onClick: (0, r.composeEventHandlers)(e.onClick, a.onOpenToggle)
            })
        });
    R.displayName = D;
    var C = "DialogPortal",
        [O, P] = h(C, {
            forceMount: void 0
        }),
        E = e => {
            let {
                __scopeDialog: r,
                forceMount: n,
                children: o,
                container: i
            } = e, a = j(C, r);
            return (0, g.jsx)(O, {
                scope: r,
                forceMount: n,
                children: t.Children.map(o, e => (0, g.jsx)(c.Presence, {
                    present: n || a.open,
                    children: (0, g.jsx)(u.Portal, {
                        asChild: !0,
                        container: i,
                        children: e
                    })
                }))
            })
        };
    E.displayName = C;
    var I = "DialogOverlay",
        T = t.forwardRef((e, t) => {
            let r = P(I, e.__scopeDialog),
                {
                    forceMount: n = r.forceMount,
                    ...o
                } = e,
                i = j(I, e.__scopeDialog);
            return i.modal ? (0, g.jsx)(c.Presence, {
                present: n || i.open,
                children: (0, g.jsx)(N, {
                    ...o,
                    ref: t
                })
            }) : null
        });
    T.displayName = I;
    var F = (0, m.createSlot)("DialogOverlay.RemoveScroll"),
        N = t.forwardRef((e, t) => {
            let {
                __scopeDialog: r,
                ...n
            } = e, o = j(I, r);
            return (0, g.jsx)(p.RemoveScroll, {
                as: F,
                allowPinchZoom: !0,
                shards: [o.contentRef],
                children: (0, g.jsx)(d.Primitive.div, {
                    "data-state": U(o.open),
                    ...n,
                    ref: t,
                    style: {
                        pointerEvents: "auto",
                        ...n.style
                    }
                })
            })
        }),
        S = "DialogContent",
        _ = t.forwardRef((e, t) => {
            let r = P(S, e.__scopeDialog),
                {
                    forceMount: n = r.forceMount,
                    ...o
                } = e,
                i = j(S, e.__scopeDialog);
            return (0, g.jsx)(c.Presence, {
                present: n || i.open,
                children: i.modal ? (0, g.jsx)(M, {
                    ...o,
                    ref: t
                }) : (0, g.jsx)(A, {
                    ...o,
                    ref: t
                })
            })
        });
    _.displayName = S;
    var M = t.forwardRef((e, o) => {
            let i = j(S, e.__scopeDialog),
                a = t.useRef(null),
                s = (0, n.useComposedRefs)(o, i.contentRef, a);
            return t.useEffect(() => {
                let e = a.current;
                if (e) return (0, v.hideOthers)(e)
            }, []), (0, g.jsx)(H, {
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
        A = t.forwardRef((e, r) => {
            let n = j(S, e.__scopeDialog),
                o = t.useRef(!1),
                i = t.useRef(!1);
            return (0, g.jsx)(H, {
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
        H = t.forwardRef((e, r) => {
            let {
                __scopeDialog: o,
                trapFocus: i,
                onOpenAutoFocus: a,
                onCloseAutoFocus: u,
                ...c
            } = e, d = j(S, o), p = t.useRef(null), v = (0, n.useComposedRefs)(r, p);
            return (0, f.useFocusGuards)(), (0, g.jsxs)(g.Fragment, {
                children: [(0, g.jsx)(l.FocusScope, {
                    asChild: !0,
                    loop: !0,
                    trapped: i,
                    onMountAutoFocus: a,
                    onUnmountAutoFocus: u,
                    children: (0, g.jsx)(s.DismissableLayer, {
                        role: "dialog",
                        id: d.contentId,
                        "aria-describedby": d.descriptionId,
                        "aria-labelledby": d.titleId,
                        "data-state": U(d.open),
                        ...c,
                        ref: v,
                        onDismiss: () => d.onOpenChange(!1)
                    })
                }), (0, g.jsxs)(g.Fragment, {
                    children: [(0, g.jsx)(G, {
                        titleId: d.titleId
                    }), (0, g.jsx)(Q, {
                        contentRef: p,
                        descriptionId: d.descriptionId
                    })]
                })]
            })
        }),
        L = "DialogTitle",
        W = t.forwardRef((e, t) => {
            let {
                __scopeDialog: r,
                ...n
            } = e, o = j(L, r);
            return (0, g.jsx)(d.Primitive.h2, {
                id: o.titleId,
                ...n,
                ref: t
            })
        });
    W.displayName = L;
    var k = "DialogDescription",
        B = t.forwardRef((e, t) => {
            let {
                __scopeDialog: r,
                ...n
            } = e, o = j(k, r);
            return (0, g.jsx)(d.Primitive.p, {
                id: o.descriptionId,
                ...n,
                ref: t
            })
        });
    B.displayName = k;
    var $ = "DialogClose",
        K = t.forwardRef((e, t) => {
            let {
                __scopeDialog: n,
                ...o
            } = e, i = j($, n);
            return (0, g.jsx)(d.Primitive.button, {
                type: "button",
                ...o,
                ref: t,
                onClick: (0, r.composeEventHandlers)(e.onClick, () => i.onOpenChange(!1))
            })
        });

    function U(e) {
        return e ? "open" : "closed"
    }
    K.displayName = $;
    var V = "DialogTitleWarning",
        [q, z] = (0, o.createContext)(V, {
            contentName: S,
            titleName: L,
            docsSlug: "dialog"
        }),
        G = e => {
            let {
                titleId: r
            } = e, n = z(V), o = "`".concat(n.contentName, "` requires a `").concat(n.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(n.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(n.docsSlug);
            return t.useEffect(() => {
                r && (document.getElementById(r) || console.error(o))
            }, [o, r]), null
        },
        Q = e => {
            let {
                contentRef: r,
                descriptionId: n
            } = e, o = z("DialogDescriptionWarning"), i = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(o.contentName, "}.");
            return t.useEffect(() => {
                var e;
                let t = null == (e = r.current) ? void 0 : e.getAttribute("aria-describedby");
                n && t && (document.getElementById(n) || console.warn(i))
            }, [i, r, n]), null
        };
    e.s(["Close", 0, K, "Content", 0, _, "Description", 0, B, "Overlay", 0, T, "Portal", 0, E, "Root", 0, x, "Title", 0, W, "Trigger", 0, R], 425353), e.i(149285);
    var Z = e.i(23342),
        J = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce((e, r) => {
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
        Y = t.forwardRef((e, t) => (0, g.jsx)(J.span, {
            ...e,
            ref: t,
            style: {
                ...X,
                ...e.style
            }
        }));
    Y.displayName = "VisuallyHidden", e.s(["VisuallyHidden", 0, Y], 199512)
}, 223808, (e, t, r) => {
    var n = 0 / 0,
        o = /^\s+|\s+$/g,
        i = /^[-+]0x[0-9a-f]+$/i,
        a = /^0b[01]+$/i,
        s = /^0o[0-7]+$/i,
        l = parseInt,
        u = e.g && e.g.Object === Object && e.g,
        c = "object" == typeof self && self && self.Object === Object && self,
        d = u || c || Function("return this")(),
        f = Object.prototype.toString,
        p = Math.max,
        v = Math.min,
        m = function() {
            return d.Date.now()
        };

    function g(e) {
        var t = typeof e;
        return !!e && ("object" == t || "function" == t)
    }

    function y(e) {
        if ("number" == typeof e) return e;
        if ("symbol" == typeof(t = e) || t && "object" == typeof t && "[object Symbol]" == f.call(t)) return n;
        if (g(e)) {
            var t, r = "function" == typeof e.valueOf ? e.valueOf() : e;
            e = g(r) ? r + "" : r
        }
        if ("string" != typeof e) return 0 === e ? e : +e;
        e = e.replace(o, "");
        var u = a.test(e);
        return u || s.test(e) ? l(e.slice(2), u ? 2 : 8) : i.test(e) ? n : +e
    }
    t.exports = function(e, t, r) {
        var n, o, i, a, s, l, u = 0,
            c = !1,
            d = !1,
            f = !0;
        if ("function" != typeof e) throw TypeError("Expected a function");

        function h(t) {
            var r = n,
                i = o;
            return n = o = void 0, u = t, a = e.apply(i, r)
        }

        function b(e) {
            var r = e - l,
                n = e - u;
            return void 0 === l || r >= t || r < 0 || d && n >= i
        }

        function w() {
            var e, r, n, o = m();
            if (b(o)) return j(o);
            s = setTimeout(w, (e = o - l, r = o - u, n = t - e, d ? v(n, i - r) : n))
        }

        function j(e) {
            return (s = void 0, f && n) ? h(e) : (n = o = void 0, a)
        }

        function x() {
            var e, r = m(),
                i = b(r);
            if (n = arguments, o = this, l = r, i) {
                if (void 0 === s) return u = e = l, s = setTimeout(w, t), c ? h(e) : a;
                if (d) return s = setTimeout(w, t), h(l)
            }
            return void 0 === s && (s = setTimeout(w, t)), a
        }
        return t = y(t) || 0, g(r) && (c = !!r.leading, i = (d = "maxWait" in r) ? p(y(r.maxWait) || 0, t) : i, f = "trailing" in r ? !!r.trailing : f), x.cancel = function() {
            void 0 !== s && clearTimeout(s), u = 0, n = l = o = s = void 0
        }, x.flush = function() {
            return void 0 === s ? a : j(m())
        }, x
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
        } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}, a = e => n ? o : window.matchMedia(e).matches, [s, l] = (0, t.useState)(() => i ? a(e) : o);

        function u() {
            l(a(e))
        }
        return r(() => {
            let t = window.matchMedia(e);
            return u(), t.addListener ? t.addListener(u) : t.addEventListener("change", u), () => {
                t.removeListener ? t.removeListener(u) : t.removeEventListener("change", u)
            }
        }, [e]), s
    }])
}]);

//# debugId=eaeddf9b-5bca-1400-333a-6e47ebe0b166
//# sourceMappingURL=2he36k6xphhnh.js.map
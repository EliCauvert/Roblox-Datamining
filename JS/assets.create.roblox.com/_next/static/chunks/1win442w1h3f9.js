;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "614bd6e8-cdff-2e21-111f-20fc761b26fb")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 174528, e => {
    "use strict";
    let t, n;
    var r, a, o = e.i(221628),
        i = e.i(416340),
        s = e.i(260241),
        c = e.i(721281),
        l = (e.i(76145), e.i(197649), e.i(438082)),
        u = e.i(694533);

    function d(e, t) {
        let {
            checkForDefaultPrevented: n = !0
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
        return function(r) {
            if (null == e || e(r), !1 === n || !r.defaultPrevented) return null == t ? void 0 : t(r)
        }
    }

    function f(e, t) {
        if ("function" == typeof e) return e(t);
        null != e && (e.current = t)
    }

    function p() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
        return e => {
            let n = !1,
                r = t.map(t => {
                    let r = f(t, e);
                    return n || "function" != typeof r || (n = !0), r
                });
            if (n) return () => {
                for (let e = 0; e < r.length; e++) {
                    let n = r[e];
                    "function" == typeof n ? n() : f(t[e], null)
                }
            }
        }
    }

    function h() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
        return i.useCallback(p(...t), t)
    }
    e.i(149285);
    var m = (null == (a = globalThis) ? void 0 : a.document) ? i.useLayoutEffect : () => {},
        g = e => {
            var t, n;
            let r, {
                    present: a,
                    children: o
                } = e,
                s = function(e) {
                    var t, n;
                    let [r, a] = i.useState(), o = i.useRef({}), s = i.useRef(e), c = i.useRef("none"), [l, u] = (t = e ? "mounted" : "unmounted", n = {
                        mounted: {
                            UNMOUNT: "unmounted",
                            ANIMATION_OUT: "unmountSuspended"
                        },
                        unmountSuspended: {
                            MOUNT: "mounted",
                            ANIMATION_END: "unmounted"
                        },
                        unmounted: {
                            MOUNT: "mounted"
                        }
                    }, i.useReducer((e, t) => {
                        var r;
                        return null != (r = n[e][t]) ? r : e
                    }, t));
                    return i.useEffect(() => {
                        let e = v(o.current);
                        c.current = "mounted" === l ? e : "none"
                    }, [l]), m(() => {
                        let t = o.current,
                            n = s.current;
                        if (n !== e) {
                            let r = c.current,
                                a = v(t);
                            e ? u("MOUNT") : "none" === a || "none" === (null == t ? void 0 : t.display) ? u("UNMOUNT") : u(n && r !== a ? "ANIMATION_OUT" : "UNMOUNT"), s.current = e
                        }
                    }, [e, u]), m(() => {
                        if (r) {
                            var e;
                            let t, n = null != (e = r.ownerDocument.defaultView) ? e : window,
                                a = e => {
                                    let a = v(o.current).includes(e.animationName);
                                    if (e.target === r && a && (u("ANIMATION_END"), !s.current)) {
                                        let e = r.style.animationFillMode;
                                        r.style.animationFillMode = "forwards", t = n.setTimeout(() => {
                                            "forwards" === r.style.animationFillMode && (r.style.animationFillMode = e)
                                        })
                                    }
                                },
                                i = e => {
                                    e.target === r && (c.current = v(o.current))
                                };
                            return r.addEventListener("animationstart", i), r.addEventListener("animationcancel", a), r.addEventListener("animationend", a), () => {
                                n.clearTimeout(t), r.removeEventListener("animationstart", i), r.removeEventListener("animationcancel", a), r.removeEventListener("animationend", a)
                            }
                        }
                        u("ANIMATION_END")
                    }, [r, u]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(l),
                        ref: i.useCallback(e => {
                            e && (o.current = getComputedStyle(e)), a(e)
                        }, [])
                    }
                }(a),
                c = "function" == typeof o ? o({
                    present: s.isPresent
                }) : i.Children.only(o),
                l = h(s.ref, (r = null == (t = Object.getOwnPropertyDescriptor(c.props, "ref")) ? void 0 : t.get) && "isReactWarning" in r && r.isReactWarning ? c.ref : (r = null == (n = Object.getOwnPropertyDescriptor(c, "ref")) ? void 0 : n.get) && "isReactWarning" in r && r.isReactWarning ? c.props.ref : c.props.ref || c.ref);
            return "function" == typeof o || s.isPresent ? i.cloneElement(c, {
                ref: l
            }) : null
        };

    function v(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }

    function y(e) {
        var t;
        let n, r = (t = e, (n = i.forwardRef((e, t) => {
                let {
                    children: n,
                    ...r
                } = e;
                if (i.isValidElement(n)) {
                    var a, o;
                    let e, s = (e = null == (a = Object.getOwnPropertyDescriptor(n.props, "ref")) ? void 0 : a.get) && "isReactWarning" in e && e.isReactWarning ? n.ref : (e = null == (o = Object.getOwnPropertyDescriptor(n, "ref")) ? void 0 : o.get) && "isReactWarning" in e && e.isReactWarning ? n.props.ref : n.props.ref || n.ref,
                        c = function(e, t) {
                            let n = {
                                ...t
                            };
                            for (let r in t) {
                                let a = e[r],
                                    o = t[r];
                                /^on[A-Z]/.test(r) ? a && o ? n[r] = function() {
                                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                    o(...t), a(...t)
                                } : a && (n[r] = a) : "style" === r ? n[r] = {
                                    ...a,
                                    ...o
                                } : "className" === r && (n[r] = [a, o].filter(Boolean).join(" "))
                            }
                            return {
                                ...e,
                                ...n
                            }
                        }(r, n.props);
                    return n.type !== i.Fragment && (c.ref = t ? p(t, s) : s), i.cloneElement(n, c)
                }
                return i.Children.count(n) > 1 ? i.Children.only(null) : null
            })).displayName = "".concat(t, ".SlotClone"), n),
            a = i.forwardRef((e, t) => {
                let {
                    children: n,
                    ...a
                } = e, s = i.Children.toArray(n), c = s.find(b);
                if (c) {
                    let e = c.props.children,
                        n = s.map(t => t === c ? i.Children.count(e) > 1 ? i.Children.only(null) : i.isValidElement(e) ? e.props.children : null : t);
                    return (0, o.jsx)(r, {
                        ...a,
                        ref: t,
                        children: i.isValidElement(e) ? i.cloneElement(e, void 0, n) : null
                    })
                }
                return (0, o.jsx)(r, {
                    ...a,
                    ref: t,
                    children: n
                })
            });
        return a.displayName = "".concat(e, ".Slot"), a
    }
    g.displayName = "Presence";
    var w = Symbol("radix.slottable");

    function b(e) {
        return i.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === w
    }
    var x = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((e, t) => {
            let n = y("Primitive.".concat(t)),
                r = i.forwardRef((e, r) => {
                    let {
                        asChild: a,
                        ...i
                    } = e;
                    return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, o.jsx)(a ? n : t, {
                        ...i,
                        ref: r
                    })
                });
            return r.displayName = "Primitive.".concat(t), {
                ...e,
                [t]: r
            }
        }, {}),
        P = "Dialog",
        [C, A] = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                n = [],
                r = () => {
                    let t = n.map(e => i.createContext(e));
                    return function(n) {
                        let r = (null == n ? void 0 : n[e]) || t;
                        return i.useMemo(() => ({
                            ["__scope".concat(e)]: {
                                ...n,
                                [e]: r
                            }
                        }), [n, r])
                    }
                };
            return r.scopeName = e, [function(t, r) {
                let a = i.createContext(r),
                    s = n.length;
                n = [...n, r];
                let c = t => {
                    var n;
                    let {
                        scope: r,
                        children: c,
                        ...l
                    } = t, u = (null == r || null == (n = r[e]) ? void 0 : n[s]) || a, d = i.useMemo(() => l, Object.values(l));
                    return (0, o.jsx)(u.Provider, {
                        value: d,
                        children: c
                    })
                };
                return c.displayName = t + "Provider", [c, function(n, o) {
                    var c;
                    let l = (null == o || null == (c = o[e]) ? void 0 : c[s]) || a,
                        u = i.useContext(l);
                    if (u) return u;
                    if (void 0 !== r) return r;
                    throw Error("`".concat(n, "` must be used within `").concat(t, "`"))
                }]
            }, function() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                let r = t[0];
                if (1 === t.length) return r;
                let a = () => {
                    let e = t.map(e => ({
                        useScope: e(),
                        scopeName: e.scopeName
                    }));
                    return function(t) {
                        let n = e.reduce((e, n) => {
                            let {
                                useScope: r,
                                scopeName: a
                            } = n;
                            return {
                                ...e,
                                ...r(t)["__scope".concat(a)]
                            }
                        }, {});
                        return i.useMemo(() => ({
                            ["__scope".concat(r.scopeName)]: n
                        }), [n])
                    }
                };
                return a.scopeName = r.scopeName, a
            }(r, ...t)]
        }(P),
        [I, R] = C(P),
        D = "DialogTrigger";
    i.forwardRef((e, t) => {
        let {
            __scopeDialog: n,
            ...r
        } = e, a = R(D, n), i = h(t, a.triggerRef);
        return (0, o.jsx)(x.button, {
            type: "button",
            "aria-haspopup": "dialog",
            "aria-expanded": a.open,
            "aria-controls": a.contentId,
            "data-state": L(a.open),
            ...r,
            ref: i,
            onClick: d(e.onClick, a.onOpenToggle)
        })
    }).displayName = D;
    var k = "DialogPortal",
        [E, N] = C(k, {
            forceMount: void 0
        }),
        S = "DialogOverlay";
    i.forwardRef((e, t) => {
        let n = N(S, e.__scopeDialog),
            {
                forceMount: r = n.forceMount,
                ...a
            } = e,
            i = R(S, e.__scopeDialog);
        return i.modal ? (0, o.jsx)(g, {
            present: r || i.open,
            children: (0, o.jsx)(j, {
                ...a,
                ref: t
            })
        }) : null
    }).displayName = S;
    var M = y("DialogOverlay.RemoveScroll"),
        j = i.forwardRef((e, t) => {
            let {
                __scopeDialog: n,
                ...r
            } = e, a = R(S, n);
            return (0, o.jsx)(u.R, {
                as: M,
                allowPinchZoom: !0,
                shards: [a.contentRef],
                children: (0, o.jsx)(x.div, {
                    "data-state": L(a.open),
                    ...r,
                    ref: t,
                    style: {
                        pointerEvents: "auto",
                        ...r.style
                    }
                })
            })
        }),
        G = "DialogContent";
    i.forwardRef((e, t) => {
        let n = N(G, e.__scopeDialog),
            {
                forceMount: r = n.forceMount,
                ...a
            } = e,
            i = R(G, e.__scopeDialog);
        return (0, o.jsx)(g, {
            present: r || i.open,
            children: i.modal ? (0, o.jsx)(O, {
                ...a,
                ref: t
            }) : (0, o.jsx)(F, {
                ...a,
                ref: t
            })
        })
    }).displayName = G;
    var O = i.forwardRef((e, t) => {
            let n = R(G, e.__scopeDialog),
                r = i.useRef(null),
                a = h(t, n.contentRef, r);
            return i.useEffect(() => {
                let e = r.current;
                if (e) return (0, u.h)(e)
            }, []), (0, o.jsx)(T, {
                ...e,
                ref: a,
                trapFocus: n.open,
                disableOutsidePointerEvents: !0,
                onCloseAutoFocus: d(e.onCloseAutoFocus, e => {
                    var t;
                    e.preventDefault(), null == (t = n.triggerRef.current) || t.focus()
                }),
                onPointerDownOutside: d(e.onPointerDownOutside, e => {
                    let t = e.detail.originalEvent,
                        n = 0 === t.button && !0 === t.ctrlKey;
                    (2 === t.button || n) && e.preventDefault()
                }),
                onFocusOutside: d(e.onFocusOutside, e => e.preventDefault())
            })
        }),
        F = i.forwardRef((e, t) => {
            let n = R(G, e.__scopeDialog),
                r = i.useRef(!1),
                a = i.useRef(!1);
            return (0, o.jsx)(T, {
                ...e,
                ref: t,
                trapFocus: !1,
                disableOutsidePointerEvents: !1,
                onCloseAutoFocus: t => {
                    var o, i;
                    null == (o = e.onCloseAutoFocus) || o.call(e, t), t.defaultPrevented || (r.current || null == (i = n.triggerRef.current) || i.focus(), t.preventDefault()), r.current = !1, a.current = !1
                },
                onInteractOutside: t => {
                    var o, i;
                    null == (o = e.onInteractOutside) || o.call(e, t), t.defaultPrevented || (r.current = !0, "pointerdown" === t.detail.originalEvent.type && (a.current = !0));
                    let s = t.target;
                    (null == (i = n.triggerRef.current) ? void 0 : i.contains(s)) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && a.current && t.preventDefault()
                }
            })
        }),
        T = i.forwardRef((e, t) => {
            let {
                __scopeDialog: n,
                trapFocus: r,
                onOpenAutoFocus: a,
                onCloseAutoFocus: s,
                ...c
            } = e, l = R(G, n), d = i.useRef(null), f = h(t, d);
            return (0, u.u)(), (0, o.jsxs)(o.Fragment, {
                children: [(0, o.jsx)(u.F, {
                    asChild: !0,
                    loop: !0,
                    trapped: r,
                    onMountAutoFocus: a,
                    onUnmountAutoFocus: s,
                    children: (0, o.jsx)(u.D, {
                        role: "dialog",
                        id: l.contentId,
                        "aria-describedby": l.descriptionId,
                        "aria-labelledby": l.titleId,
                        "data-state": L(l.open),
                        ...c,
                        ref: f,
                        onDismiss: () => l.onOpenChange(!1)
                    })
                }), (0, o.jsxs)(o.Fragment, {
                    children: [(0, o.jsx)(V, {
                        titleId: l.titleId
                    }), (0, o.jsx)(H, {
                        contentRef: d,
                        descriptionId: l.descriptionId
                    })]
                })]
            })
        }),
        _ = "DialogTitle";
    i.forwardRef((e, t) => {
        let {
            __scopeDialog: n,
            ...r
        } = e, a = R(_, n);
        return (0, o.jsx)(x.h2, {
            id: a.titleId,
            ...r,
            ref: t
        })
    }).displayName = _;
    var U = "DialogDescription";
    i.forwardRef((e, t) => {
        let {
            __scopeDialog: n,
            ...r
        } = e, a = R(U, n);
        return (0, o.jsx)(x.p, {
            id: a.descriptionId,
            ...r,
            ref: t
        })
    }).displayName = U;
    var B = "DialogClose";

    function L(e) {
        return e ? "open" : "closed"
    }
    i.forwardRef((e, t) => {
        let {
            __scopeDialog: n,
            ...r
        } = e, a = R(B, n);
        return (0, o.jsx)(x.button, {
            type: "button",
            ...r,
            ref: t,
            onClick: d(e.onClick, () => a.onOpenChange(!1))
        })
    }).displayName = B;
    var q = "DialogTitleWarning",
        [W, z] = (r = {
            contentName: G,
            titleName: _,
            docsSlug: "dialog"
        }, t = i.createContext(r), (n = e => {
            let {
                children: n,
                ...r
            } = e, a = i.useMemo(() => r, Object.values(r));
            return (0, o.jsx)(t.Provider, {
                value: a,
                children: n
            })
        }).displayName = q + "Provider", [n, function(e) {
            let n = i.useContext(t);
            if (n) return n;
            if (void 0 !== r) return r;
            throw Error("`".concat(e, "` must be used within `").concat(q, "`"))
        }]),
        V = e => {
            let {
                titleId: t
            } = e, n = z(q), r = "`".concat(n.contentName, "` requires a `").concat(n.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(n.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(n.docsSlug);
            return i.useEffect(() => {
                t && (document.getElementById(t) || console.error(r))
            }, [r, t]), null
        },
        H = e => {
            let {
                contentRef: t,
                descriptionId: n
            } = e, r = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(z("DialogDescriptionWarning").contentName, "}.");
            return i.useEffect(() => {
                var e;
                let a = null == (e = t.current) ? void 0 : e.getAttribute("aria-describedby");
                n && a && (document.getElementById(n) || console.warn(r))
            }, [r, t, n]), null
        };

    function K(e, t) {
        if ("function" == typeof e) return e(t);
        null != e && (e.current = t)
    }
    var X = Symbol("radix.slottable");

    function Z(e) {
        return i.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === X
    }
    var Q = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce((e, t) => {
            var n, r;
            let a, s, c, l = (r = n = "Primitive.".concat(t), (a = i.forwardRef((e, t) => {
                    let {
                        children: n,
                        ...r
                    } = e;
                    if (i.isValidElement(n)) {
                        var a, o;
                        let e, s = (e = null == (a = Object.getOwnPropertyDescriptor(n.props, "ref")) ? void 0 : a.get) && "isReactWarning" in e && e.isReactWarning ? n.ref : (e = null == (o = Object.getOwnPropertyDescriptor(n, "ref")) ? void 0 : o.get) && "isReactWarning" in e && e.isReactWarning ? n.props.ref : n.props.ref || n.ref,
                            c = function(e, t) {
                                let n = {
                                    ...t
                                };
                                for (let r in t) {
                                    let a = e[r],
                                        o = t[r];
                                    /^on[A-Z]/.test(r) ? a && o ? n[r] = function() {
                                        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                        let r = o(...t);
                                        return a(...t), r
                                    } : a && (n[r] = a) : "style" === r ? n[r] = {
                                        ...a,
                                        ...o
                                    } : "className" === r && (n[r] = [a, o].filter(Boolean).join(" "))
                                }
                                return {
                                    ...e,
                                    ...n
                                }
                            }(r, n.props);
                        return n.type !== i.Fragment && (c.ref = t ? function() {
                            for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                            return e => {
                                let n = !1,
                                    r = t.map(t => {
                                        let r = K(t, e);
                                        return n || "function" != typeof r || (n = !0), r
                                    });
                                if (n) return () => {
                                    for (let e = 0; e < r.length; e++) {
                                        let n = r[e];
                                        "function" == typeof n ? n() : K(t[e], null)
                                    }
                                }
                            }
                        }(t, s) : s), i.cloneElement(n, c)
                    }
                    return i.Children.count(n) > 1 ? i.Children.only(null) : null
                })).displayName = "".concat(r, ".SlotClone"), s = a, (c = i.forwardRef((e, t) => {
                    let {
                        children: n,
                        ...r
                    } = e, a = i.Children.toArray(n), c = a.find(Z);
                    if (c) {
                        let e = c.props.children,
                            n = a.map(t => t === c ? i.Children.count(e) > 1 ? i.Children.only(null) : i.isValidElement(e) ? e.props.children : null : t);
                        return (0, o.jsx)(s, {
                            ...r,
                            ref: t,
                            children: i.isValidElement(e) ? i.cloneElement(e, void 0, n) : null
                        })
                    }
                    return (0, o.jsx)(s, {
                        ...r,
                        ref: t,
                        children: n
                    })
                })).displayName = "".concat(n, ".Slot"), c),
                u = i.forwardRef((e, n) => {
                    let {
                        asChild: r,
                        ...a
                    } = e;
                    return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, o.jsx)(r ? l : t, {
                        ...a,
                        ref: n
                    })
                });
            return u.displayName = "Primitive.".concat(t), {
                ...e,
                [t]: u
            }
        }, {}),
        Y = Object.freeze({
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
        });
    i.forwardRef((e, t) => (0, o.jsx)(Q.span, {
        ...e,
        ref: t,
        style: {
            ...Y,
            ...e.style
        }
    })).displayName = "VisuallyHidden", e.i(94572);
    var J = e.i(751818);
    e.i(899659), (0, J.s)(".foundation-web-dialog-overlay{bottom:0;display:grid;left:0;overflow-y:auto;place-items:center;position:fixed;right:0;top:0}.foundation-web-dialog-close-container{right:var(--size-300);top:var(--size-300);z-index:1}.foundation-web-dialog-hero-media{border-top-left-radius:var(--radius-large);border-top-right-radius:var(--radius-large);margin-left:calc(var(--stroke-standard)*-1);margin-right:calc(var(--stroke-standard)*-1);margin-top:calc(var(--stroke-standard)*-1);overflow:clip}.foundation-web-dialog-content[data-size=Small]{max-width:calc(var(--size-100)*80);min-width:calc(var(--size-100)*75)}.foundation-web-dialog-content[data-size=Medium]{max-width:calc(var(--size-100)*120);min-width:calc(var(--size-100)*75)}.foundation-web-dialog-content[data-size=Large]{max-width:calc(var(--size-100)*160);min-width:calc(var(--size-100)*75)}@keyframes foundation-web-dialog-backdrop-fade-in{0%{opacity:0}to{opacity:1}}@keyframes foundation-web-dialog-backdrop-fade-out{0%{opacity:1}to{opacity:0}}@keyframes foundation-web-dialog-content-scale-in{0%{transform:scale(.975)}to{transform:scale(1)}}@keyframes foundation-web-dialog-content-scale-out{0%{transform:scale(1)}to{transform:scale(.975)}}@media (prefers-reduced-motion:no-preference){.foundation-web-dialog-overlay[data-state=open]{animation:foundation-web-dialog-backdrop-fade-in var(--time-100) var(--ease-linear)}.foundation-web-dialog-overlay[data-state=closed]{animation:foundation-web-dialog-backdrop-fade-out var(--time-100) var(--ease-linear)}.foundation-web-dialog-content[data-state=open]{animation:foundation-web-dialog-content-scale-in var(--time-300) var(--ease-standard-out)}.foundation-web-dialog-content[data-state=closed]{animation:foundation-web-dialog-content-scale-out var(--time-300) var(--ease-standard-out)}}");
    (0, i.createContext)({
        size: "Medium",
        isModal: !0,
        hasCloseAffordance: !1,
        hasMarginTop: !0,
        hasMarginBottom: !0,
        hasDescription: !1,
        type: "Default"
    });
    e.i(634865);
    var $ = e.i(157310),
        ee = e.i(677753),
        et = function(e, t) {
            return (et = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
            })(e, t)
        };

    function en(e, t, n, r) {
        return new(n || (n = Promise))(function(a, o) {
            function i(e) {
                try {
                    c(r.next(e))
                } catch (e) {
                    o(e)
                }
            }

            function s(e) {
                try {
                    c(r.throw(e))
                } catch (e) {
                    o(e)
                }
            }

            function c(e) {
                var t;
                e.done ? a(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(i, s)
            }
            c((r = r.apply(e, t || [])).next())
        })
    }

    function er(e, t) {
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
        return i.next = s(0), i.throw = s(1), i.return = s(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
            return this
        }), i;

        function s(s) {
            return function(c) {
                var l = [s, c];
                if (n) throw TypeError("Generator is already executing.");
                for (; i && (i = 0, l[0] && (o = 0)), o;) try {
                    if (n = 1, r && (a = 2 & l[0] ? r.return : l[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, l[1])).done) return a;
                    switch (r = 0, a && (l = [2 & l[0], a.value]), l[0]) {
                        case 0:
                        case 1:
                            a = l;
                            break;
                        case 4:
                            return o.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            o.label++, r = l[1], l = [0];
                            continue;
                        case 7:
                            l = o.ops.pop(), o.trys.pop();
                            continue;
                        default:
                            if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                o = 0;
                                continue
                            }
                            if (3 === l[0] && (!a || l[1] > a[0] && l[1] < a[3])) {
                                o.label = l[1];
                                break
                            }
                            if (6 === l[0] && o.label < a[1]) {
                                o.label = a[1], a = l;
                                break
                            }
                            if (a && o.label < a[2]) {
                                o.label = a[2], o.ops.push(l);
                                break
                            }
                            a[2] && o.ops.pop(), o.trys.pop();
                            continue
                    }
                    l = t.call(e, o)
                } catch (e) {
                    l = [6, e], r = 0
                } finally {
                    n = a = 0
                }
                if (5 & l[0]) throw l[1];
                return {
                    value: l[0] ? l[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function ea(e) {
        if (void 0 !== e) return null === e ? null : {
            userId: e.userId,
            featureName: e.featureName,
            namespace: e.namespace
        }
    }
    "function" == typeof SuppressedError && SuppressedError;
    var eo = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return function(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

                function n() {
                    this.constructor = e
                }
                et(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
            }(t, e), t.prototype.accessManagementAPIGetFeatureAccessRaw = function(e, t) {
                return en(this, void 0, void 0, function() {
                    var n, r, a;
                    return er(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return n = {}, void 0 !== e.featureNames && (n.featureNames = e.featureNames), void 0 !== e.namespace && (n.namespace = e.namespace), void 0 !== e.extraParameters && (n.extraParameters = e.extraParameters), r = {}, [4, this.request({
                                    path: "/v1/feature-access",
                                    schemaPath: "/v1/feature-access",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return a = o.sent(), [2, new ee.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.accessManagementAPIGetFeatureAccess = function() {
                return en(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), er(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.accessManagementAPIGetFeatureAccessRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.accessManagementAPIGetPairwiseFeatureAccessRaw = function(e, t) {
                return en(this, void 0, void 0, function() {
                    var n, r, a;
                    return er(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return n = {}, void 0 !== e.featureName && (n.featureName = e.featureName), void 0 !== e.namespace && (n.namespace = e.namespace), void 0 !== e.targetUserId && (n.targetUserId = e.targetUserId), e.otherUserIds && (n.otherUserIds = e.otherUserIds), r = {}, [4, this.request({
                                    path: "/v1/pairwise-feature-access",
                                    schemaPath: "/v1/pairwise-feature-access",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return a = o.sent(), [2, new ee.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.accessManagementAPIGetPairwiseFeatureAccess = function() {
                return en(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), er(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.accessManagementAPIGetPairwiseFeatureAccessRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.accessManagementAPIGetRCCOwnerFeatureAccessRaw = function(e, t) {
                return en(this, void 0, void 0, function() {
                    var n, r, a;
                    return er(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return n = {}, void 0 !== e.featureNames && (n.featureNames = e.featureNames), void 0 !== e.namespace && (n.namespace = e.namespace), void 0 !== e.extraParameters && (n.extraParameters = e.extraParameters), r = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (r["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                                    path: "/v1/rcc-owner-feature-access",
                                    schemaPath: "/v1/rcc-owner-feature-access",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return a = o.sent(), [2, new ee.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.accessManagementAPIGetRCCOwnerFeatureAccess = function() {
                return en(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), er(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.accessManagementAPIGetRCCOwnerFeatureAccessRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.accessManagementAPIGetRCCUserFeatureAccessRaw = function(e, t) {
                return en(this, void 0, void 0, function() {
                    var n, r, a;
                    return er(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return n = {}, void 0 !== e.featureNames && (n.featureNames = e.featureNames), void 0 !== e.userId && (n.userId = e.userId), void 0 !== e.namespace && (n.namespace = e.namespace), void 0 !== e.extraParameters && (n.extraParameters = e.extraParameters), r = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (r["Roblox-Place-Id"] = String(e.robloxPlaceId)), void 0 !== e.robloxGameId && null !== e.robloxGameId && (r["Roblox-Game-Id"] = String(e.robloxGameId)), [4, this.request({
                                    path: "/v1/rcc-user-feature-access",
                                    schemaPath: "/v1/rcc-user-feature-access",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return a = o.sent(), [2, new ee.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.accessManagementAPIGetRCCUserFeatureAccess = function() {
                return en(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), er(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.accessManagementAPIGetRCCUserFeatureAccessRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.accessManagementAPIGetRCCUserFeatureEvaluationRaw = function(e, t) {
                return en(this, void 0, void 0, function() {
                    var n, r, a;
                    return er(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return n = {}, (r = {})["Content-Type"] = "application/json", void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (r["Roblox-Place-Id"] = String(e.robloxPlaceId)), void 0 !== e.robloxGameId && null !== e.robloxGameId && (r["Roblox-Game-Id"] = String(e.robloxGameId)), [4, this.request({
                                    path: "/v1/rcc-user-feature-evaluation",
                                    schemaPath: "/v1/rcc-user-feature-evaluation",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            requests: void 0 === e.requests ? void 0 : null === e.requests ? null : e.requests.map(ea)
                                        }
                                    }(e.accessManagementAPIGetRCCUserFeatureEvaluationRequest)
                                }, t)];
                            case 1:
                                return a = o.sent(), [2, new ee.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.accessManagementAPIGetRCCUserFeatureEvaluation = function() {
                return en(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), er(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.accessManagementAPIGetRCCUserFeatureEvaluationRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.accessManagementAPIGetUpsellFeatureAccessRaw = function(e, t) {
                return en(this, void 0, void 0, function() {
                    var n, r, a;
                    return er(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return n = {}, void 0 !== e.featureName && (n.featureName = e.featureName), void 0 !== e.namespace && (n.namespace = e.namespace), void 0 !== e.extraParameters && (n.extraParameters = e.extraParameters), void 0 !== e.successfulActions && (n.successfulActions = e.successfulActions), r = {}, [4, this.request({
                                    path: "/v1/upsell-feature-access",
                                    schemaPath: "/v1/upsell-feature-access",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return a = o.sent(), [2, new ee.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.accessManagementAPIGetUpsellFeatureAccess = function() {
                return en(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), er(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.accessManagementAPIGetUpsellFeatureAccessRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.accessManagementAPIPostPairwiseFeatureAccessRaw = function(e, t) {
                return en(this, void 0, void 0, function() {
                    var n, r, a;
                    return er(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/pairwise-feature-access",
                                    schemaPath: "/v1/pairwise-feature-access",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            featureName: e.featureName,
                                            namespace: e.namespace,
                                            targetUserId: e.targetUserId,
                                            otherUserIds: e.otherUserIds
                                        }
                                    }(e.accessManagementAPIPostPairwiseFeatureAccessRequest)
                                }, t)];
                            case 1:
                                return a = o.sent(), [2, new ee.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.accessManagementAPIPostPairwiseFeatureAccess = function() {
                return en(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), er(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.accessManagementAPIPostPairwiseFeatureAccessRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t
        }(ee.BaseAPI),
        ei = e.i(897547);
    new eo(new ee.Configuration({
        robloxSiteDomain: "roblox.com",
        basePath: "".concat("https://apis.roblox.com", "/access-management"),
        credentials: "include",
        enableMrRouter: !0
    }));
    let es = new Map,
        ec = async (e, t, n) => {
            let r, a, o = (r = "".concat(e, "/access-management"), (a = es.get(r)) || (a = new eo(new ee.Configuration({
                basePath: r,
                credentials: "include",
                enableMrRouter: !0
            })), es.set(r, a)), a);
            try {
                let e = await o.accessManagementAPIGetUpsellFeatureAccessRaw({
                    featureName: t,
                    namespace: n
                });
                return await e.raw.json()
            } catch (t) {
                let e = t instanceof Error ? t.message : "Unknown error";
                throw Error("Failed to check feature access: ".concat(e), {
                    cause: t
                })
            }
        }, el = new Map, eu = e => {
            let t = el.get(e);
            return t || (t = new ei.UserSettingsApiApi(new ee.Configuration({
                basePath: e,
                credentials: "include",
                enableMrRouter: !0
            })), el.set(e, t)), t
        }, ed = async e => {
            let t = eu(e);
            try {
                await t.userSettingsApiSetGlobalPrivacyControl()
            } catch (t) {
                let e = t instanceof Error ? t.message : "Unknown error";
                throw Error("Failed to set Global Privacy Control: ".concat(e), {
                    cause: t
                })
            }
        }, ef = async e => {
            let t = eu(e);
            try {
                return await t.userSettingsApiGet({
                    requestedUserSettings: "allowSellShareData"
                })
            } catch (t) {
                let e = t instanceof Error ? t.message : "Unknown error";
                throw Error("Failed to get user settings: ".concat(e), {
                    cause: t
                })
            }
        }, ep = () => !("u" < typeof navigator) && !!navigator.globalPrivacyControl, eh = async e => {
            var t, n;
            if (e && (null == (n = window.evidon) || null == (t = n.notice) ? void 0 : t.showOptions)) try {
                window.evidon.notice.showOptions()
            } catch (e) {
                console.error("Failed to call Evidon API:", e)
            }
        };
    class em {
        updateCookiePreferences(e) {
            this.currentCookiePreferences = {
                ...e
            }
        }
        hasCookiePreferencesChanged() {
            return Array.from(new Set([...Object.keys(this.currentCookiePreferences), ...Object.keys(this.initialCookiePreferences)])).some(e => this.currentCookiePreferences[e] !== this.initialCookiePreferences[e])
        }
        getGpcState() {
            let e = ep(),
                t = this.hasCookiePreferencesChanged();
            return {
                isGpcDetected: e,
                initialGpcState: this.initialGpcState,
                hasUserMadeCookieChanges: t,
                scenario: e ? t ? "signal-with-changes" : "signal-honored" : "no-signal"
            }
        }
        initializeEvidon(e) {
            var t;
            let n;
            e && (eh(e).catch(e => {
                console.error("Failed to call Evidon API:", e)
            }), this.evidonCleanup = (t = () => {}, n = () => {
                try {
                    var e, n;
                    (null == (n = window.evidon) || null == (e = n.notice) ? void 0 : e.userGpcEnabled) !== void 0 && t(window.evidon.notice.userGpcEnabled)
                } catch (e) {
                    console.error("Failed to extract GPC signal from Evidon event:", e)
                }
            }, window.addEventListener("evidon-consent-change", n), () => {
                window.removeEventListener("evidon-consent-change", n)
            }))
        }
        cleanup() {
            this.evidonCleanup && (this.evidonCleanup(), this.evidonCleanup = null)
        }
        constructor(e = {}) {
            (0, c._)(this, "initialGpcState", void 0), (0, c._)(this, "evidonCleanup", null), (0, c._)(this, "initialCookiePreferences", void 0), (0, c._)(this, "currentCookiePreferences", void 0), this.initialGpcState = ep(), this.initialCookiePreferences = {
                ...e
            }, this.currentCookiePreferences = {
                ...e
            }
        }
    }
    var eg = e.i(514961),
        ev = e.i(427650),
        ey = e.i(79187),
        ew = e.i(982234),
        eb = e.i(199834),
        ex = e.i(169722),
        eP = e.i(706442),
        eC = e.i(814975);
    let eA = (0, eP.makeStyles)()(() => ({
            container: {
                textAlign: "center",
                paddingTop: "20px",
                paddingBottom: "20px",
                width: "100%",
                marginTop: "0",
                marginBottom: "0"
            },
            link: {
                textDecoration: "none",
                display: "inline-flex",
                alignItems: "center",
                cursor: "pointer",
                "&:hover": {
                    textDecoration: "underline"
                },
                "&:visited": {
                    color: "inherit"
                }
            },
            icon: {
                marginLeft: "8px",
                verticalAlign: "middle",
                height: "16px",
                width: "auto"
            }
        })),
        eI = "Title.GpcDetected",
        eR = "Body.GpcDetectedSettingDisabledIneligible",
        eD = "Body.GpcDetectedSettingDisabledEligible",
        ek = "Body.GpcDetectedSettingEnabledIneligible",
        eE = "Body.GpcMissingSettingIneligible",
        eN = (0, eP.makeStyles)()(() => ({
            modalLink: {
                color: "inherit",
                textDecoration: "none",
                "&:hover": {
                    textDecoration: "underline"
                },
                "&:focus": {
                    textDecoration: "underline"
                }
            },
            inlineLink: {
                display: "inline-flex",
                alignItems: "center"
            },
            inlineIcon: {
                marginLeft: "8px",
                height: "16px",
                width: "auto",
                verticalAlign: "middle"
            }
        })),
        eS = e => {
            var t, n;
            let {
                gpcState: r,
                modalData: a,
                translate: s,
                translateHTML: c,
                handleClose: l,
                privacyPreferencesUrl: u,
                modalLinkClass: d
            } = e, {
                user: f
            } = (0, eC.useAuthentication)(), p = !!f, h = null != (t = null == a ? void 0 : a.isAdsSellShareDataEnabled) && t, m = null != (n = null == a ? void 0 : a.canUserManageAdsSettings) && n, g = (0, i.useCallback)(e => {
                window.location.pathname.includes("/my/account") && (e.preventDefault(), window.location.href = u)
            }, [u]), v = (0, i.useCallback)(e => (0, o.jsx)(ew.Link, {
                href: "https://en.help.roblox.com/hc/articles/28943243301780",
                target: "_blank",
                rel: "noreferrer",
                className: d,
                children: e
            }), [d]), y = (0, i.useCallback)(e => (0, o.jsx)(ew.Link, {
                href: u,
                className: d,
                onClick: g,
                children: e
            }), [u, d, g]), w = (0, i.useMemo)(() => (0, o.jsx)("br", {}), []), b = (0, i.useCallback)((e, t) => {
                let n = (s(e, {
                        link: "",
                        hrefEnd: ""
                    }) || "").replaceAll(/{link}/g, "").replaceAll(/{hrefEnd}/g, ""),
                    r = n.split(/{aTagWithHref}|{aTagEnd}/),
                    a = e => {
                        let t = e.split(/{lineBreak}/);
                        return 1 === t.length ? e : (0, o.jsx)(o.Fragment, {
                            children: t.map((e, n) => {
                                let r = "linebreak-".concat(n, "-").concat(e.substring(0, 10));
                                return (0, o.jsxs)(i.Fragment, {
                                    children: [e, n < t.length - 1 && w]
                                }, r)
                            })
                        })
                    };
                return 3 === r.length ? (0, o.jsxs)(o.Fragment, {
                    children: [a(r[0]), t(r[1]), a(r[2])]
                }) : a(n)
            }, [s, w]);
            return (0, o.jsxs)(o.Fragment, {
                children: [(0, o.jsxs)(ev.DialogBody, {
                    children: [(0, o.jsx)(ev.DialogTitle, {
                        className: "text-heading-small",
                        children: r.isGpcDetected ? s(eI) || "" : s("Title.NoGpcDetected") || ""
                    }), (0, o.jsx)("div", {
                        className: "text-body-medium",
                        children: (() => {
                            if (!p) {
                                let e = [{
                                        opening: "aTagStart",
                                        closing: "aTagEnd",
                                        content: v
                                    }],
                                    t = {
                                        lineBreak: w
                                    };
                                return r.isGpcDetected ? h ? c(ek, e, t) : c(eR, e, t) : c(eE, e, t)
                            }
                            if (!r.isGpcDetected) return m ? b("Body.GpcMissingSettingEligible", y) : c(eE, [{
                                opening: "aTagStart",
                                closing: "aTagEnd",
                                content: v
                            }], {
                                lineBreak: w
                            });
                            if (h) return m ? b("Body.GpcDetectedSettingEnabledEligible", y) : c(ek, [{
                                opening: "aTagStart",
                                closing: "aTagEnd",
                                content: v
                            }], {
                                lineBreak: w
                            });
                            let e = m ? {
                                tags: [{
                                    opening: "aTagWithHref",
                                    closing: "aTagEnd",
                                    content: y
                                }],
                                args: {
                                    lineBreak: w
                                }
                            } : {
                                tags: [{
                                    opening: "aTagStart",
                                    closing: "aTagEnd",
                                    content: v
                                }],
                                args: {
                                    lineBreak: w
                                }
                            };
                            if ("signal-with-changes" === r.scenario) return m ? b(eD, y) : c(eR, e.tags, e.args);
                            let t = m ? eD : eR;
                            return m ? b(t, y) : c(t, e.tags, e.args)
                        })()
                    })]
                }), (0, o.jsx)(ev.DialogFooter, {
                    className: "width-full",
                    children: (0, o.jsx)(eg.Button, {
                        className: "width-full",
                        size: "Large",
                        variant: "Emphasis",
                        onClick: l,
                        children: s("Action.Ok") || ""
                    })
                })]
            })
        },
        eM = e => {
            let {
                inline: t = !1
            } = e, {
                translate: n,
                translateHTML: r
            } = (0, ey.useTranslation)(), a = (0, ey.useLocalization)(), c = (0, s.useCookieConsentContext)().preferences, l = (0, i.useRef)(null), u = (0, i.useRef)(!1), [d, f] = (0, i.useState)(!1), {
                classes: {
                    container: p
                }
            } = eA(), {
                classes: h
            } = eN(), m = (0, i.useCallback)(() => {
                if ("u" < typeof document) return {};
                let e = document.cookie.split("; ").find(e => e.startsWith("RBXcb="));
                if (!e) return {};
                let t = e.substring(6),
                    n = t;
                try {
                    n = decodeURIComponent(t)
                } catch (e) {}
                let r = {};
                return n.split("&").forEach(e => {
                    let [t, n] = e.split("=");
                    t && (r[t] = "true" === n)
                }), r
            }, []), [g, v] = (0, i.useState)({
                isGpcDetected: !1,
                initialGpcState: !1,
                hasUserMadeCookieChanges: !1,
                scenario: "no-signal"
            });
            (0, i.useEffect)(() => () => {
                l.current && l.current.cleanup()
            }, []), (0, i.useEffect)(() => {
                if (d && !u.current) {
                    let e = m();
                    l.current = new em(Object.keys(e).length > 0 ? e : c), u.current = !0, v(l.current.getGpcState())
                }
            }, [d, c, m]), (0, i.useEffect)(() => {
                if (l.current) {
                    let e = m(),
                        t = Object.keys(e).length > 0 ? e : c;
                    l.current.updateCookiePreferences(t);
                    let n = l.current.getGpcState();
                    v(e => e.scenario !== n.scenario || e.isGpcDetected !== n.isGpcDetected || e.hasUserMadeCookieChanges !== n.hasUserMadeCookieChanges ? n : e)
                }
            }, [c, m]), (0, i.useEffect)(() => {
                if (!l.current) return;
                let e = setInterval(() => {
                    if (l.current) {
                        let e = m(),
                            t = Object.keys(e).length > 0 ? e : c;
                        l.current.updateCookiePreferences(t);
                        let n = l.current.getGpcState();
                        v(e => e.scenario !== n.scenario || e.isGpcDetected !== n.isGpcDetected || e.hasUserMadeCookieChanges !== n.hasUserMadeCookieChanges ? n : e)
                    }
                }, 2e3);
                return () => clearInterval(e)
            }, [c, m]);
            let {
                user: y
            } = (0, eC.useAuthentication)(), w = !!y, {
                data: b,
                isLoading: x
            } = (e => {
                let {
                    showModal: t,
                    gpcTrackerRef: n,
                    userSettingsApiBaseUrl: r,
                    apiGatewayBaseUrl: a,
                    isAuthenticated: o
                } = e;
                return (0, $.useQuery)({
                    queryKey: ["yourPrivacyChoicesModal", t],
                    queryFn: async () => {
                        var e, t, i;
                        let s = null != (e = null == o ? void 0 : o()) && e,
                            c = null != (t = null == (i = n.current) ? void 0 : i.getGpcState()) ? t : {
                                isGpcDetected: !1,
                                scenario: "no-signal"
                            },
                            {
                                isGpcDetected: l
                            } = c;
                        s && l && await ed(r);
                        let u = !1;
                        if (s) try {
                            let {
                                access: e
                            } = await ec(a, "ShouldShowAdsSettings", "account_management/UserSettingsPolicy");
                            u = "Granted" === e
                        } catch (e) {
                            console.error("Failed to check feature access:", e)
                        }
                        let d = !1;
                        if (s) try {
                            let e = await ef(r);
                            d = "Enabled" === e.allowSellShareData
                        } catch (e) {
                            console.error("Failed to get user settings:", e)
                        } else if ("u" > typeof document) {
                            let e = document.cookie.split("; ").find(e => e.trim().startsWith("RBXcb="));
                            if (e) {
                                let t = e.substring(6),
                                    n = t;
                                try {
                                    n = decodeURIComponent(t)
                                } catch (e) {}
                                let r = n.split("&"),
                                    a = r.some(e => {
                                        let [t, n] = e.split("=");
                                        return "GoogleAnalytics" === t && "true" === n
                                    }),
                                    o = r.some(e => {
                                        let [t, n] = e.split("=");
                                        return "RBXSource" === t && "true" === n
                                    });
                                (a || o) && (d = !0)
                            }
                        } return {
                            isGpcDetected: l,
                            canUserManageAdsSettings: u,
                            isAdsSellShareDataEnabled: d,
                            scenario: c.scenario
                        }
                    },
                    enabled: t,
                    gcTime: 0
                })
            })({
                showModal: d,
                gpcTrackerRef: l,
                userSettingsApiBaseUrl: (0, i.useMemo)(() => "".concat("https://apis.roblox.com", "/user-settings-api"), []),
                apiGatewayBaseUrl: (0, i.useMemo)(() => "https://apis.roblox.com", []),
                isAuthenticated: () => w
            }), P = (0, i.useMemo)(() => a.locale ? (0, ey.toRobloxLocale)(a.locale) : "en_us", [a.locale]), C = (0, i.useMemo)(() => {
                let e = "/my/account#!/privacy/AdPreferences?locale=".concat(P);
                return "https://www.roblox.com".concat(e)
            }, [P]), A = (0, i.useCallback)(e => {
                e.preventDefault(), f(!0)
            }, []), I = (0, i.useCallback)(() => {
                f(!1)
            }, []), R = n("Label.YourPrivacyChoices") || "", D = (0, o.jsx)("button", {
                type: "button",
                onClick: A,
                style: {
                    display: "inline-flex",
                    alignItems: "center",
                    background: "none",
                    border: "none",
                    padding: 0,
                    cursor: "pointer",
                    color: "inherit"
                },
                children: (0, o.jsxs)(eb.Typography, {
                    variant: "footer",
                    color: "secondary",
                    component: "span",
                    children: [R, (0, o.jsx)("img", {
                        src: "".concat("https://assets.create.roblox.com/338074cebde25c69bc5ebc23feab492ef1e17005/assets", "/navigation/privacy_icon.png"),
                        alt: "",
                        style: {
                            marginLeft: "8px",
                            height: "16px",
                            width: "auto",
                            verticalAlign: "middle"
                        }
                    })]
                })
            });
            return (0, o.jsxs)(o.Fragment, {
                children: [t ? D : (0, o.jsx)(ex.Grid, {
                    classes: {
                        root: p
                    },
                    container: !0,
                    justifyContent: "center",
                    item: !0,
                    children: D
                }), (0, o.jsx)(ev.Dialog, {
                    open: d,
                    onOpenChange: I,
                    size: "Small",
                    isModal: !0,
                    hasCloseAffordance: !0,
                    closeLabel: n("Action.Close"),
                    children: (0, o.jsx)(ev.DialogContent, {
                        children: x ? (0, o.jsxs)(ev.DialogBody, {
                            children: [(0, o.jsx)(ev.DialogTitle, {
                                className: "text-heading-small",
                                children: n(eI) || ""
                            }), (0, o.jsx)("div", {
                                className: "text-body-medium",
                                children: n("Description.Loading") || ""
                            })]
                        }) : (0, o.jsx)(eS, {
                            gpcState: g,
                            modalData: b,
                            translate: n,
                            translateHTML: r,
                            handleClose: I,
                            privacyPreferencesUrl: C,
                            modalLinkClass: h.modalLink
                        })
                    })
                })]
            })
        };
    e.s(["default", 0, e => {
        let {
            inline: t = !1
        } = e;
        try {
            return (0, o.jsx)(eM, {
                inline: t
            })
        } catch (e) {
            return console.error("Error rendering PrivacyChoicesFooterLink:", e), null
        }
    }], 174528)
}]);

//# debugId=614bd6e8-cdff-2e21-111f-20fc761b26fb
//# sourceMappingURL=2n139p8xqkfy3.js.map
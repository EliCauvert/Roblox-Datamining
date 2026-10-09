;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "43ce0662-4565-5740-a156-af8cee1d90ed")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 306607, e => {
    "use strict";
    var t = e.i(197649),
        o = e.i(416340);
    let r = (0, o.forwardRef)((e, r) => {
        let {
            className: n,
            style: i,
            orientation: a = "horizontal",
            variant: s = "Standard",
            ...l
        } = e, p = "vertical" === a, c = {};
        return p || "Inset" !== s ? p || "InsetLeft" !== s ? p || "InsetRight" !== s || (c = {
            marginRight: "var(--padding-xlarge)"
        }) : c = {
            marginLeft: "var(--padding-xlarge)"
        } : c = {
            marginLeft: "var(--padding-xlarge)",
            marginRight: "var(--padding-xlarge)"
        }, o.default.createElement("div", {
            ref: r,
            ...l,
            role: "separator",
            "data-orientation": a,
            "aria-orientation": a,
            style: {
                borderRightWidth: 0,
                borderBottomWidth: 0,
                boxSizing: "border-box",
                borderStyle: "solid",
                ...p ? {
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
                ...c,
                ...i
            },
            className: (0, t.default)("stroke-default self-stretch", n)
        })
    });
    r.displayName = "Divider", e.s(["Divider", 0, r])
}, 225032, 425353, 199512, e => {
    "use strict";
    var t = e.i(140625),
        o = e.i(75584),
        r = e.i(197649),
        n = e.i(416340);
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
            isCircular: p,
            className: c,
            ...u
        } = e;
        return n.default.createElement("button", {
            type: "button",
            className: (0, r.default)("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", t.interactable, a[s], i[l], p && "radius-circle", c),
            ...u
        }, n.default.createElement(t.StateLayer, null), n.default.createElement(o.Icon, {
            name: "icon-regular-x",
            size: l
        }))
    }], 225032);
    var s = e.i(19655),
        l = e.i(78892),
        p = e.i(608652),
        c = e.i(40266),
        u = e.i(428156),
        d = e.i(598943),
        f = e.i(44265),
        m = e.i(763960),
        h = e.i(226972),
        g = e.i(594278),
        v = e.i(793808),
        y = e.i(813593),
        b = e.i(3300),
        w = e.i(699704),
        x = e.i(221628),
        O = "Dialog",
        [P, R] = (0, p.createContextScope)(O),
        [j, E] = P(O),
        T = e => {
            let {
                __scopeDialog: t,
                children: o,
                open: r,
                defaultOpen: i,
                onOpenChange: a,
                modal: s = !0
            } = e, l = n.useRef(null), p = n.useRef(null), [d = !1, f] = (0, u.useControllableState)({
                prop: r,
                defaultProp: i,
                onChange: a
            });
            return (0, x.jsx)(j, {
                scope: t,
                triggerRef: l,
                contentRef: p,
                contentId: (0, c.useId)(),
                titleId: (0, c.useId)(),
                descriptionId: (0, c.useId)(),
                open: d,
                onOpenChange: f,
                onOpenToggle: n.useCallback(() => f(e => !e), [f]),
                modal: s,
                children: o
            })
        };
    T.displayName = O;
    var D = "DialogTrigger",
        M = n.forwardRef((e, t) => {
            let {
                __scopeDialog: o,
                ...r
            } = e, n = E(D, o), i = (0, l.useComposedRefs)(t, n.triggerRef);
            return (0, x.jsx)(g.Primitive.button, {
                type: "button",
                "aria-haspopup": "dialog",
                "aria-expanded": n.open,
                "aria-controls": n.contentId,
                "data-state": Y(n.open),
                ...r,
                ref: i,
                onClick: (0, s.composeEventHandlers)(e.onClick, n.onOpenToggle)
            })
        });
    M.displayName = D;
    var C = "DialogPortal",
        [_, k] = P(C, {
            forceMount: void 0
        }),
        S = e => {
            let {
                __scopeDialog: t,
                forceMount: o,
                children: r,
                container: i
            } = e, a = E(C, t);
            return (0, x.jsx)(_, {
                scope: t,
                forceMount: o,
                children: n.Children.map(r, e => (0, x.jsx)(h.Presence, {
                    present: o || a.open,
                    children: (0, x.jsx)(m.Portal, {
                        asChild: !0,
                        container: i,
                        children: e
                    })
                }))
            })
        };
    S.displayName = C;
    var A = "DialogOverlay",
        L = n.forwardRef((e, t) => {
            let o = k(A, e.__scopeDialog),
                {
                    forceMount: r = o.forceMount,
                    ...n
                } = e,
                i = E(A, e.__scopeDialog);
            return i.modal ? (0, x.jsx)(h.Presence, {
                present: r || i.open,
                children: (0, x.jsx)(I, {
                    ...n,
                    ref: t
                })
            }) : null
        });
    L.displayName = A;
    var W = (0, w.createSlot)("DialogOverlay.RemoveScroll"),
        I = n.forwardRef((e, t) => {
            let {
                __scopeDialog: o,
                ...r
            } = e, n = E(A, o);
            return (0, x.jsx)(y.RemoveScroll, {
                as: W,
                allowPinchZoom: !0,
                shards: [n.contentRef],
                children: (0, x.jsx)(g.Primitive.div, {
                    "data-state": Y(n.open),
                    ...r,
                    ref: t,
                    style: {
                        pointerEvents: "auto",
                        ...r.style
                    }
                })
            })
        }),
        N = "DialogContent",
        B = n.forwardRef((e, t) => {
            let o = k(N, e.__scopeDialog),
                {
                    forceMount: r = o.forceMount,
                    ...n
                } = e,
                i = E(N, e.__scopeDialog);
            return (0, x.jsx)(h.Presence, {
                present: r || i.open,
                children: i.modal ? (0, x.jsx)(F, {
                    ...n,
                    ref: t
                }) : (0, x.jsx)(H, {
                    ...n,
                    ref: t
                })
            })
        });
    B.displayName = N;
    var F = n.forwardRef((e, t) => {
            let o = E(N, e.__scopeDialog),
                r = n.useRef(null),
                i = (0, l.useComposedRefs)(t, o.contentRef, r);
            return n.useEffect(() => {
                let e = r.current;
                if (e) return (0, b.hideOthers)(e)
            }, []), (0, x.jsx)(V, {
                ...e,
                ref: i,
                trapFocus: o.open,
                disableOutsidePointerEvents: !0,
                onCloseAutoFocus: (0, s.composeEventHandlers)(e.onCloseAutoFocus, e => {
                    var t;
                    e.preventDefault(), null == (t = o.triggerRef.current) || t.focus()
                }),
                onPointerDownOutside: (0, s.composeEventHandlers)(e.onPointerDownOutside, e => {
                    let t = e.detail.originalEvent,
                        o = 0 === t.button && !0 === t.ctrlKey;
                    (2 === t.button || o) && e.preventDefault()
                }),
                onFocusOutside: (0, s.composeEventHandlers)(e.onFocusOutside, e => e.preventDefault())
            })
        }),
        H = n.forwardRef((e, t) => {
            let o = E(N, e.__scopeDialog),
                r = n.useRef(!1),
                i = n.useRef(!1);
            return (0, x.jsx)(V, {
                ...e,
                ref: t,
                trapFocus: !1,
                disableOutsidePointerEvents: !1,
                onCloseAutoFocus: t => {
                    var n, a;
                    null == (n = e.onCloseAutoFocus) || n.call(e, t), t.defaultPrevented || (r.current || null == (a = o.triggerRef.current) || a.focus(), t.preventDefault()), r.current = !1, i.current = !1
                },
                onInteractOutside: t => {
                    var n, a;
                    null == (n = e.onInteractOutside) || n.call(e, t), t.defaultPrevented || (r.current = !0, "pointerdown" === t.detail.originalEvent.type && (i.current = !0));
                    let s = t.target;
                    (null == (a = o.triggerRef.current) ? void 0 : a.contains(s)) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && i.current && t.preventDefault()
                }
            })
        }),
        V = n.forwardRef((e, t) => {
            let {
                __scopeDialog: o,
                trapFocus: r,
                onOpenAutoFocus: i,
                onCloseAutoFocus: a,
                ...s
            } = e, p = E(N, o), c = n.useRef(null), u = (0, l.useComposedRefs)(t, c);
            return (0, v.useFocusGuards)(), (0, x.jsxs)(x.Fragment, {
                children: [(0, x.jsx)(f.FocusScope, {
                    asChild: !0,
                    loop: !0,
                    trapped: r,
                    onMountAutoFocus: i,
                    onUnmountAutoFocus: a,
                    children: (0, x.jsx)(d.DismissableLayer, {
                        role: "dialog",
                        id: p.contentId,
                        "aria-describedby": p.descriptionId,
                        "aria-labelledby": p.titleId,
                        "data-state": Y(p.open),
                        ...s,
                        ref: u,
                        onDismiss: () => p.onOpenChange(!1)
                    })
                }), (0, x.jsxs)(x.Fragment, {
                    children: [(0, x.jsx)($, {
                        titleId: p.titleId
                    }), (0, x.jsx)(ee, {
                        contentRef: c,
                        descriptionId: p.descriptionId
                    })]
                })]
            })
        }),
        U = "DialogTitle",
        z = n.forwardRef((e, t) => {
            let {
                __scopeDialog: o,
                ...r
            } = e, n = E(U, o);
            return (0, x.jsx)(g.Primitive.h2, {
                id: n.titleId,
                ...r,
                ref: t
            })
        });
    z.displayName = U;
    var q = "DialogDescription",
        G = n.forwardRef((e, t) => {
            let {
                __scopeDialog: o,
                ...r
            } = e, n = E(q, o);
            return (0, x.jsx)(g.Primitive.p, {
                id: n.descriptionId,
                ...r,
                ref: t
            })
        });
    G.displayName = q;
    var K = "DialogClose",
        X = n.forwardRef((e, t) => {
            let {
                __scopeDialog: o,
                ...r
            } = e, n = E(K, o);
            return (0, x.jsx)(g.Primitive.button, {
                type: "button",
                ...r,
                ref: t,
                onClick: (0, s.composeEventHandlers)(e.onClick, () => n.onOpenChange(!1))
            })
        });

    function Y(e) {
        return e ? "open" : "closed"
    }
    X.displayName = K;
    var Z = "DialogTitleWarning",
        [J, Q] = (0, p.createContext)(Z, {
            contentName: N,
            titleName: U,
            docsSlug: "dialog"
        }),
        $ = e => {
            let {
                titleId: t
            } = e, o = Q(Z), r = "`".concat(o.contentName, "` requires a `").concat(o.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(o.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(o.docsSlug);
            return n.useEffect(() => {
                t && (document.getElementById(t) || console.error(r))
            }, [r, t]), null
        },
        ee = e => {
            let {
                contentRef: t,
                descriptionId: o
            } = e, r = Q("DialogDescriptionWarning"), i = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(r.contentName, "}.");
            return n.useEffect(() => {
                var e;
                let r = null == (e = t.current) ? void 0 : e.getAttribute("aria-describedby");
                o && r && (document.getElementById(o) || console.warn(i))
            }, [i, t, o]), null
        };
    e.s(["Close", 0, X, "Content", 0, B, "Description", 0, G, "Overlay", 0, L, "Portal", 0, S, "Root", 0, T, "Title", 0, z, "Trigger", 0, M], 425353), e.i(149285);
    var et = e.i(23342),
        eo = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce((e, t) => {
            let o = (0, et.createSlot)("Primitive.".concat(t)),
                r = n.forwardRef((e, r) => {
                    let {
                        asChild: n,
                        ...i
                    } = e;
                    return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, x.jsx)(n ? o : t, {
                        ...i,
                        ref: r
                    })
                });
            return r.displayName = "Primitive.".concat(t), {
                ...e,
                [t]: r
            }
        }, {}),
        er = Object.freeze({
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
        en = n.forwardRef((e, t) => (0, x.jsx)(eo.span, {
            ...e,
            ref: t,
            style: {
                ...er,
                ...e.style
            }
        }));
    en.displayName = "VisuallyHidden", e.s(["VisuallyHidden", 0, en], 199512)
}, 257256, 682018, e => {
    "use strict";
    var t, o, r, n, i, a = e.i(194250),
        s = e.i(416340),
        l = e.i(863605),
        p = e.i(154502),
        c = e.i(690569),
        u = e.i(945146),
        d = e.i(251635),
        f = e.i(977987),
        m = e.i(787802),
        h = e.i(221628),
        g = e.i(441872),
        v = e.i(654188);
    e.i(407110), e.i(164136), e.i(465957);
    var y = e.i(710302),
        b = e.i(230505),
        w = e.i(15686),
        x = e.i(121880),
        O = {};
    Object.defineProperty(O, "__esModule", {
        value: !0
    });
    var P = O.default = void 0,
        R = function(e) {
            if (e && e.__esModule) return e;
            if (null === e || "object" != typeof e && "function" != typeof e) return {
                default: e
            };
            var t = E(void 0);
            if (t && t.has(e)) return t.get(e);
            var o = {
                    __proto__: null
                },
                r = Object.defineProperty && Object.getOwnPropertyDescriptor;
            for (var n in e)
                if ("default" !== n && Object.prototype.hasOwnProperty.call(e, n)) {
                    var i = r ? Object.getOwnPropertyDescriptor(e, n) : null;
                    i && (i.get || i.set) ? Object.defineProperty(o, n, i) : o[n] = e[n]
                } return o.default = e, t && t.set(e, o), o
        }(s.default),
        j = d.f;

    function E(e) {
        if ("function" != typeof WeakMap) return null;
        var t = new WeakMap,
            o = new WeakMap;
        return (E = function(e) {
            return e ? o : t
        })(e)
    }
    P = O.default = function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : null,
            t = R.useContext(j.ThemeContext);
        return t && 0 !== Object.keys(t).length ? t : e
    };
    var T = "bottom",
        D = "right",
        M = "left",
        C = "auto",
        _ = ["top", T, D, M],
        k = "start",
        S = "viewport",
        A = "popper",
        L = _.reduce(function(e, t) {
            return e.concat([t + "-" + k, t + "-end"])
        }, []),
        W = [].concat(_, [C]).reduce(function(e, t) {
            return e.concat([t, t + "-" + k, t + "-end"])
        }, []),
        I = ["beforeRead", "read", "afterRead", "beforeMain", "main", "afterMain", "beforeWrite", "write", "afterWrite"];

    function N(e) {
        return e ? (e.nodeName || "").toLowerCase() : null
    }

    function B(e) {
        if (null == e) return window;
        if ("[object Window]" !== e.toString()) {
            var t = e.ownerDocument;
            return t && t.defaultView || window
        }
        return e
    }

    function F(e) {
        return e instanceof B(e).Element || e instanceof Element
    }

    function H(e) {
        return e instanceof B(e).HTMLElement || e instanceof HTMLElement
    }

    function V(e) {
        return "u" > typeof ShadowRoot && (e instanceof B(e).ShadowRoot || e instanceof ShadowRoot)
    }

    function U(e) {
        return e.split("-")[0]
    }
    var z = Math.max,
        q = Math.min,
        G = Math.round;

    function K() {
        var e = navigator.userAgentData;
        return null != e && e.brands && Array.isArray(e.brands) ? e.brands.map(function(e) {
            return e.brand + "/" + e.version
        }).join(" ") : navigator.userAgent
    }

    function X() {
        return !/^((?!chrome|android).)*safari/i.test(K())
    }

    function Y(e, t, o) {
        void 0 === t && (t = !1), void 0 === o && (o = !1);
        var r = e.getBoundingClientRect(),
            n = 1,
            i = 1;
        t && H(e) && (n = e.offsetWidth > 0 && G(r.width) / e.offsetWidth || 1, i = e.offsetHeight > 0 && G(r.height) / e.offsetHeight || 1);
        var a = (F(e) ? B(e) : window).visualViewport,
            s = !X() && o,
            l = (r.left + (s && a ? a.offsetLeft : 0)) / n,
            p = (r.top + (s && a ? a.offsetTop : 0)) / i,
            c = r.width / n,
            u = r.height / i;
        return {
            width: c,
            height: u,
            top: p,
            right: l + c,
            bottom: p + u,
            left: l,
            x: l,
            y: p
        }
    }

    function Z(e) {
        var t = Y(e),
            o = e.offsetWidth,
            r = e.offsetHeight;
        return 1 >= Math.abs(t.width - o) && (o = t.width), 1 >= Math.abs(t.height - r) && (r = t.height), {
            x: e.offsetLeft,
            y: e.offsetTop,
            width: o,
            height: r
        }
    }

    function J(e, t) {
        var o = t.getRootNode && t.getRootNode();
        if (e.contains(t)) return !0;
        if (o && V(o)) {
            var r = t;
            do {
                if (r && e.isSameNode(r)) return !0;
                r = r.parentNode || r.host
            } while (r)
        }
        return !1
    }

    function Q(e) {
        return B(e).getComputedStyle(e)
    }

    function $(e) {
        return ((F(e) ? e.ownerDocument : e.document) || window.document).documentElement
    }

    function ee(e) {
        return "html" === N(e) ? e : e.assignedSlot || e.parentNode || (V(e) ? e.host : null) || $(e)
    }

    function et(e) {
        return H(e) && "fixed" !== Q(e).position ? e.offsetParent : null
    }

    function eo(e) {
        for (var t = B(e), o = et(e); o && ["table", "td", "th"].indexOf(N(o)) >= 0 && "static" === Q(o).position;) o = et(o);
        return o && ("html" === N(o) || "body" === N(o) && "static" === Q(o).position) ? t : o || function(e) {
            var t = /firefox/i.test(K());
            if (/Trident/i.test(K()) && H(e) && "fixed" === Q(e).position) return null;
            var o = ee(e);
            for (V(o) && (o = o.host); H(o) && 0 > ["html", "body"].indexOf(N(o));) {
                var r = Q(o);
                if ("none" !== r.transform || "none" !== r.perspective || "paint" === r.contain || -1 !== ["transform", "perspective"].indexOf(r.willChange) || t && "filter" === r.willChange || t && r.filter && "none" !== r.filter) return o;
                o = o.parentNode
            }
            return null
        }(e) || t
    }

    function er(e) {
        return ["top", "bottom"].indexOf(e) >= 0 ? "x" : "y"
    }

    function en(e, t, o) {
        return z(e, q(t, o))
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
        return t.reduce(function(t, o) {
            return t[o] = e, t
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

    function ep(e) {
        var t, o = e.popper,
            r = e.popperRect,
            n = e.placement,
            i = e.variation,
            a = e.offsets,
            s = e.position,
            l = e.gpuAcceleration,
            p = e.adaptive,
            c = e.roundOffsets,
            u = e.isFixed,
            d = a.x,
            f = void 0 === d ? 0 : d,
            m = a.y,
            h = void 0 === m ? 0 : m,
            g = "function" == typeof c ? c({
                x: f,
                y: h
            }) : {
                x: f,
                y: h
            };
        f = g.x, h = g.y;
        var v = a.hasOwnProperty("x"),
            y = a.hasOwnProperty("y"),
            b = M,
            w = "top",
            x = window;
        if (p) {
            var O = eo(o),
                P = "clientHeight",
                R = "clientWidth";
            O === B(o) && "static" !== Q(O = $(o)).position && "absolute" === s && (P = "scrollHeight", R = "scrollWidth"), ("top" === n || (n === M || n === D) && "end" === i) && (w = T, h -= (u && O === x && x.visualViewport ? x.visualViewport.height : O[P]) - r.height, h *= l ? 1 : -1), (n === M || ("top" === n || n === T) && "end" === i) && (b = D, f -= (u && O === x && x.visualViewport ? x.visualViewport.width : O[R]) - r.width, f *= l ? 1 : -1)
        }
        var j, E, C, _, k, S, A = Object.assign({
                position: s
            }, p && el),
            L = !0 === c ? (j = {
                x: f,
                y: h
            }, E = B(o), C = j.x, _ = j.y, {
                x: G(C * (k = E.devicePixelRatio || 1)) / k || 0,
                y: G(_ * k) / k || 0
            }) : {
                x: f,
                y: h
            };
        return f = L.x, h = L.y, l ? Object.assign({}, A, ((S = {})[w] = y ? "0" : "", S[b] = v ? "0" : "", S.transform = 1 >= (x.devicePixelRatio || 1) ? "translate(" + f + "px, " + h + "px)" : "translate3d(" + f + "px, " + h + "px, 0)", S)) : Object.assign({}, A, ((t = {})[w] = y ? h + "px" : "", t[b] = v ? f + "px" : "", t.transform = "", t))
    }
    var ec = {
            passive: !0
        },
        eu = {
            left: "right",
            right: "left",
            bottom: "top",
            top: "bottom"
        };

    function ed(e) {
        return e.replace(/left|right|bottom|top/g, function(e) {
            return eu[e]
        })
    }
    var ef = {
        start: "end",
        end: "start"
    };

    function em(e) {
        return e.replace(/start|end/g, function(e) {
            return ef[e]
        })
    }

    function eh(e) {
        var t = B(e);
        return {
            scrollLeft: t.pageXOffset,
            scrollTop: t.pageYOffset
        }
    }

    function eg(e) {
        return Y($(e)).left + eh(e).scrollLeft
    }

    function ev(e) {
        var t = Q(e),
            o = t.overflow,
            r = t.overflowX,
            n = t.overflowY;
        return /auto|scroll|overlay|hidden/.test(o + n + r)
    }

    function ey(e, t) {
        void 0 === t && (t = []);
        var o, r = function e(t) {
                return ["html", "body", "#document"].indexOf(N(t)) >= 0 ? t.ownerDocument.body : H(t) && ev(t) ? t : e(ee(t))
            }(e),
            n = r === (null == (o = e.ownerDocument) ? void 0 : o.body),
            i = B(r),
            a = n ? [i].concat(i.visualViewport || [], ev(r) ? r : []) : r,
            s = t.concat(a);
        return n ? s : s.concat(ey(ee(a)))
    }

    function eb(e) {
        return Object.assign({}, e, {
            left: e.x,
            top: e.y,
            right: e.x + e.width,
            bottom: e.y + e.height
        })
    }

    function ew(e, t, o) {
        var r, n, i, a, s, l, p, c, u, d;
        return t === S ? eb(function(e, t) {
            var o = B(e),
                r = $(e),
                n = o.visualViewport,
                i = r.clientWidth,
                a = r.clientHeight,
                s = 0,
                l = 0;
            if (n) {
                i = n.width, a = n.height;
                var p = X();
                (p || !p && "fixed" === t) && (s = n.offsetLeft, l = n.offsetTop)
            }
            return {
                width: i,
                height: a,
                x: s + eg(e),
                y: l
            }
        }(e, o)) : F(t) ? ((r = Y(t, !1, "fixed" === o)).top = r.top + t.clientTop, r.left = r.left + t.clientLeft, r.bottom = r.top + t.clientHeight, r.right = r.left + t.clientWidth, r.width = t.clientWidth, r.height = t.clientHeight, r.x = r.left, r.y = r.top, r) : eb((n = $(e), a = $(n), s = eh(n), l = null == (i = n.ownerDocument) ? void 0 : i.body, p = z(a.scrollWidth, a.clientWidth, l ? l.scrollWidth : 0, l ? l.clientWidth : 0), c = z(a.scrollHeight, a.clientHeight, l ? l.scrollHeight : 0, l ? l.clientHeight : 0), u = -s.scrollLeft + eg(n), d = -s.scrollTop, "rtl" === Q(l || a).direction && (u += z(a.clientWidth, l ? l.clientWidth : 0) - p), {
            width: p,
            height: c,
            x: u,
            y: d
        }))
    }

    function ex(e) {
        var t, o = e.reference,
            r = e.element,
            n = e.placement,
            i = n ? U(n) : null,
            a = n ? es(n) : null,
            s = o.x + o.width / 2 - r.width / 2,
            l = o.y + o.height / 2 - r.height / 2;
        switch (i) {
            case "top":
                t = {
                    x: s,
                    y: o.y - r.height
                };
                break;
            case T:
                t = {
                    x: s,
                    y: o.y + o.height
                };
                break;
            case D:
                t = {
                    x: o.x + o.width,
                    y: l
                };
                break;
            case M:
                t = {
                    x: o.x - r.width,
                    y: l
                };
                break;
            default:
                t = {
                    x: o.x,
                    y: o.y
                }
        }
        var p = i ? er(i) : null;
        if (null != p) {
            var c = "y" === p ? "height" : "width";
            switch (a) {
                case k:
                    t[p] = t[p] - (o[c] / 2 - r[c] / 2);
                    break;
                case "end":
                    t[p] = t[p] + (o[c] / 2 - r[c] / 2)
            }
        }
        return t
    }

    function eO(e, t) {
        void 0 === t && (t = {});
        var o, r, n, i, a, s, l, p, c = t,
            u = c.placement,
            d = void 0 === u ? e.placement : u,
            f = c.strategy,
            m = void 0 === f ? e.strategy : f,
            h = c.boundary,
            g = c.rootBoundary,
            v = c.elementContext,
            y = void 0 === v ? A : v,
            b = c.altBoundary,
            w = c.padding,
            x = void 0 === w ? 0 : w,
            O = ei("number" != typeof x ? x : ea(x, _)),
            P = e.rects.popper,
            R = e.elements[void 0 !== b && b ? y === A ? "reference" : A : y],
            j = (o = F(R) ? R : R.contextElement || $(e.elements.popper), r = void 0 === h ? "clippingParents" : h, n = void 0 === g ? S : g, l = (s = [].concat("clippingParents" === r ? (i = ey(ee(o)), F(a = ["absolute", "fixed"].indexOf(Q(o).position) >= 0 && H(o) ? eo(o) : o) ? i.filter(function(e) {
                return F(e) && J(e, a) && "body" !== N(e)
            }) : []) : [].concat(r), [n]))[0], (p = s.reduce(function(e, t) {
                var r = ew(o, t, m);
                return e.top = z(r.top, e.top), e.right = q(r.right, e.right), e.bottom = q(r.bottom, e.bottom), e.left = z(r.left, e.left), e
            }, ew(o, l, m))).width = p.right - p.left, p.height = p.bottom - p.top, p.x = p.left, p.y = p.top, p),
            E = Y(e.elements.reference),
            M = ex({
                reference: E,
                element: P,
                strategy: "absolute",
                placement: d
            }),
            C = eb(Object.assign({}, P, M)),
            k = y === A ? C : E,
            L = {
                top: j.top - k.top + O.top,
                bottom: k.bottom - j.bottom + O.bottom,
                left: j.left - k.left + O.left,
                right: k.right - j.right + O.right
            },
            W = e.modifiersData.offset;
        if (y === A && W) {
            var I = W[d];
            Object.keys(L).forEach(function(e) {
                var t = [D, T].indexOf(e) >= 0 ? 1 : -1,
                    o = ["top", T].indexOf(e) >= 0 ? "y" : "x";
                L[e] += I[o] * t
            })
        }
        return L
    }

    function eP(e, t, o) {
        return void 0 === o && (o = {
            x: 0,
            y: 0
        }), {
            top: e.top - t.height - o.y,
            right: e.right - t.width + o.x,
            bottom: e.bottom - t.height + o.y,
            left: e.left - t.width - o.x
        }
    }

    function eR(e) {
        return ["top", D, T, M].some(function(t) {
            return e[t] >= 0
        })
    }
    var ej = {
        placement: "bottom",
        modifiers: [],
        strategy: "absolute"
    };

    function eE() {
        for (var e = arguments.length, t = Array(e), o = 0; o < e; o++) t[o] = arguments[o];
        return !t.some(function(e) {
            return !(e && "function" == typeof e.getBoundingClientRect)
        })
    }
    var eT = (r = void 0 === (o = (t = {
        defaultModifiers: [{
            name: "eventListeners",
            enabled: !0,
            phase: "write",
            fn: function() {},
            effect: function(e) {
                var t = e.state,
                    o = e.instance,
                    r = e.options,
                    n = r.scroll,
                    i = void 0 === n || n,
                    a = r.resize,
                    s = void 0 === a || a,
                    l = B(t.elements.popper),
                    p = [].concat(t.scrollParents.reference, t.scrollParents.popper);
                return i && p.forEach(function(e) {
                        e.addEventListener("scroll", o.update, ec)
                    }), s && l.addEventListener("resize", o.update, ec),
                    function() {
                        i && p.forEach(function(e) {
                            e.removeEventListener("scroll", o.update, ec)
                        }), s && l.removeEventListener("resize", o.update, ec)
                    }
            },
            data: {}
        }, {
            name: "popperOffsets",
            enabled: !0,
            phase: "read",
            fn: function(e) {
                var t = e.state,
                    o = e.name;
                t.modifiersData[o] = ex({
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
                    o = e.options,
                    r = o.gpuAcceleration,
                    n = o.adaptive,
                    i = o.roundOffsets,
                    a = void 0 === i || i,
                    s = {
                        placement: U(t.placement),
                        variation: es(t.placement),
                        popper: t.elements.popper,
                        popperRect: t.rects.popper,
                        gpuAcceleration: void 0 === r || r,
                        isFixed: "fixed" === t.options.strategy
                    };
                null != t.modifiersData.popperOffsets && (t.styles.popper = Object.assign({}, t.styles.popper, ep(Object.assign({}, s, {
                    offsets: t.modifiersData.popperOffsets,
                    position: t.options.strategy,
                    adaptive: void 0 === n || n,
                    roundOffsets: a
                })))), null != t.modifiersData.arrow && (t.styles.arrow = Object.assign({}, t.styles.arrow, ep(Object.assign({}, s, {
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
                    var o = t.styles[e] || {},
                        r = t.attributes[e] || {},
                        n = t.elements[e];
                    H(n) && N(n) && (Object.assign(n.style, o), Object.keys(r).forEach(function(e) {
                        var t = r[e];
                        !1 === t ? n.removeAttribute(e) : n.setAttribute(e, !0 === t ? "" : t)
                    }))
                })
            },
            effect: function(e) {
                var t = e.state,
                    o = {
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
                return Object.assign(t.elements.popper.style, o.popper), t.styles = o, t.elements.arrow && Object.assign(t.elements.arrow.style, o.arrow),
                    function() {
                        Object.keys(t.elements).forEach(function(e) {
                            var r = t.elements[e],
                                n = t.attributes[e] || {},
                                i = Object.keys(t.styles.hasOwnProperty(e) ? t.styles[e] : o[e]).reduce(function(e, t) {
                                    return e[t] = "", e
                                }, {});
                            H(r) && N(r) && (Object.assign(r.style, i), Object.keys(n).forEach(function(e) {
                                r.removeAttribute(e)
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
                    o = e.options,
                    r = e.name,
                    n = o.offset,
                    i = void 0 === n ? [0, 0] : n,
                    a = W.reduce(function(e, o) {
                        var r, n, a, s, l, p;
                        return e[o] = (r = t.rects, a = [M, "top"].indexOf(n = U(o)) >= 0 ? -1 : 1, l = (s = "function" == typeof i ? i(Object.assign({}, r, {
                            placement: o
                        })) : i)[0], p = s[1], l = l || 0, p = (p || 0) * a, [M, D].indexOf(n) >= 0 ? {
                            x: p,
                            y: l
                        } : {
                            x: l,
                            y: p
                        }), e
                    }, {}),
                    s = a[t.placement],
                    l = s.x,
                    p = s.y;
                null != t.modifiersData.popperOffsets && (t.modifiersData.popperOffsets.x += l, t.modifiersData.popperOffsets.y += p), t.modifiersData[r] = a
            }
        }, {
            name: "flip",
            enabled: !0,
            phase: "main",
            fn: function(e) {
                var t = e.state,
                    o = e.options,
                    r = e.name;
                if (!t.modifiersData[r]._skip) {
                    for (var n = o.mainAxis, i = void 0 === n || n, a = o.altAxis, s = void 0 === a || a, l = o.fallbackPlacements, p = o.padding, c = o.boundary, u = o.rootBoundary, d = o.altBoundary, f = o.flipVariations, m = void 0 === f || f, h = o.allowedAutoPlacements, g = t.options.placement, v = U(g), y = l || (v !== g && m ? function(e) {
                            if (U(e) === C) return [];
                            var t = ed(e);
                            return [em(e), t, em(t)]
                        }(g) : [ed(g)]), b = [g].concat(y).reduce(function(e, o) {
                            var r, n, i, a, s, l, d, f, g, v, y, b;
                            return e.concat(U(o) === C ? (n = (r = {
                                placement: o,
                                boundary: c,
                                rootBoundary: u,
                                padding: p,
                                flipVariations: m,
                                allowedAutoPlacements: h
                            }).placement, i = r.boundary, a = r.rootBoundary, s = r.padding, l = r.flipVariations, f = void 0 === (d = r.allowedAutoPlacements) ? W : d, 0 === (y = (v = (g = es(n)) ? l ? L : L.filter(function(e) {
                                return es(e) === g
                            }) : _).filter(function(e) {
                                return f.indexOf(e) >= 0
                            })).length && (y = v), Object.keys(b = y.reduce(function(e, o) {
                                return e[o] = eO(t, {
                                    placement: o,
                                    boundary: i,
                                    rootBoundary: a,
                                    padding: s
                                })[U(o)], e
                            }, {})).sort(function(e, t) {
                                return b[e] - b[t]
                            })) : o)
                        }, []), w = t.rects.reference, x = t.rects.popper, O = new Map, P = !0, R = b[0], j = 0; j < b.length; j++) {
                        var E = b[j],
                            S = U(E),
                            A = es(E) === k,
                            I = ["top", T].indexOf(S) >= 0,
                            N = I ? "width" : "height",
                            B = eO(t, {
                                placement: E,
                                boundary: c,
                                rootBoundary: u,
                                altBoundary: d,
                                padding: p
                            }),
                            F = I ? A ? D : M : A ? T : "top";
                        w[N] > x[N] && (F = ed(F));
                        var H = ed(F),
                            V = [];
                        if (i && V.push(B[S] <= 0), s && V.push(B[F] <= 0, B[H] <= 0), V.every(function(e) {
                                return e
                            })) {
                            R = E, P = !1;
                            break
                        }
                        O.set(E, V)
                    }
                    if (P)
                        for (var z = function(e) {
                                var t = b.find(function(t) {
                                    var o = O.get(t);
                                    if (o) return o.slice(0, e).every(function(e) {
                                        return e
                                    })
                                });
                                if (t) return R = t, "break"
                            }, q = m ? 3 : 1; q > 0 && "break" !== z(q); q--);
                    t.placement !== R && (t.modifiersData[r]._skip = !0, t.placement = R, t.reset = !0)
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
                    o = e.options,
                    r = e.name,
                    n = o.mainAxis,
                    i = o.altAxis,
                    a = o.boundary,
                    s = o.rootBoundary,
                    l = o.altBoundary,
                    p = o.padding,
                    c = o.tether,
                    u = void 0 === c || c,
                    d = o.tetherOffset,
                    f = void 0 === d ? 0 : d,
                    m = eO(t, {
                        boundary: a,
                        rootBoundary: s,
                        padding: p,
                        altBoundary: l
                    }),
                    h = U(t.placement),
                    g = es(t.placement),
                    v = !g,
                    y = er(h),
                    b = "x" === y ? "y" : "x",
                    w = t.modifiersData.popperOffsets,
                    x = t.rects.reference,
                    O = t.rects.popper,
                    P = "function" == typeof f ? f(Object.assign({}, t.rects, {
                        placement: t.placement
                    })) : f,
                    R = "number" == typeof P ? {
                        mainAxis: P,
                        altAxis: P
                    } : Object.assign({
                        mainAxis: 0,
                        altAxis: 0
                    }, P),
                    j = t.modifiersData.offset ? t.modifiersData.offset[t.placement] : null,
                    E = {
                        x: 0,
                        y: 0
                    };
                if (w) {
                    if (void 0 === n || n) {
                        var C, _ = "y" === y ? "top" : M,
                            S = "y" === y ? T : D,
                            A = "y" === y ? "height" : "width",
                            L = w[y],
                            W = L + m[_],
                            I = L - m[S],
                            N = u ? -O[A] / 2 : 0,
                            B = g === k ? x[A] : O[A],
                            F = g === k ? -O[A] : -x[A],
                            H = t.elements.arrow,
                            V = u && H ? Z(H) : {
                                width: 0,
                                height: 0
                            },
                            G = t.modifiersData["arrow#persistent"] ? t.modifiersData["arrow#persistent"].padding : {
                                top: 0,
                                right: 0,
                                bottom: 0,
                                left: 0
                            },
                            K = G[_],
                            X = G[S],
                            Y = en(0, x[A], V[A]),
                            J = v ? x[A] / 2 - N - Y - K - R.mainAxis : B - Y - K - R.mainAxis,
                            Q = v ? -x[A] / 2 + N + Y + X + R.mainAxis : F + Y + X + R.mainAxis,
                            $ = t.elements.arrow && eo(t.elements.arrow),
                            ee = $ ? "y" === y ? $.clientTop || 0 : $.clientLeft || 0 : 0,
                            et = null != (C = null == j ? void 0 : j[y]) ? C : 0,
                            ei = en(u ? q(W, L + J - et - ee) : W, L, u ? z(I, L + Q - et) : I);
                        w[y] = ei, E[y] = ei - L
                    }
                    if (void 0 !== i && i) {
                        var ea, el, ep = "x" === y ? "top" : M,
                            ec = "x" === y ? T : D,
                            eu = w[b],
                            ed = "y" === b ? "height" : "width",
                            ef = eu + m[ep],
                            em = eu - m[ec],
                            eh = -1 !== ["top", M].indexOf(h),
                            eg = null != (el = null == j ? void 0 : j[b]) ? el : 0,
                            ev = eh ? ef : eu - x[ed] - O[ed] - eg + R.altAxis,
                            ey = eh ? eu + x[ed] + O[ed] - eg - R.altAxis : em,
                            eb = u && eh ? (ea = en(ev, eu, ey)) > ey ? ey : ea : en(u ? ev : ef, eu, u ? ey : em);
                        w[b] = eb, E[b] = eb - eu
                    }
                    t.modifiersData[r] = E
                }
            },
            requiresIfExists: ["offset"]
        }, {
            name: "arrow",
            enabled: !0,
            phase: "main",
            fn: function(e) {
                var t, o = e.state,
                    r = e.name,
                    n = e.options,
                    i = o.elements.arrow,
                    a = o.modifiersData.popperOffsets,
                    s = U(o.placement),
                    l = er(s),
                    p = [M, D].indexOf(s) >= 0 ? "height" : "width";
                if (i && a) {
                    var c, u = (c = n.padding, ei("number" != typeof(c = "function" == typeof c ? c(Object.assign({}, o.rects, {
                            placement: o.placement
                        })) : c) ? c : ea(c, _))),
                        d = Z(i),
                        f = "y" === l ? "top" : M,
                        m = "y" === l ? T : D,
                        h = o.rects.reference[p] + o.rects.reference[l] - a[l] - o.rects.popper[p],
                        g = a[l] - o.rects.reference[l],
                        v = eo(i),
                        y = v ? "y" === l ? v.clientHeight || 0 : v.clientWidth || 0 : 0,
                        b = u[f],
                        w = y - d[p] - u[m],
                        x = y / 2 - d[p] / 2 + (h / 2 - g / 2),
                        O = en(b, x, w);
                    o.modifiersData[r] = ((t = {})[l] = O, t.centerOffset = O - x, t)
                }
            },
            effect: function(e) {
                var t = e.state,
                    o = e.options.element,
                    r = void 0 === o ? "[data-popper-arrow]" : o;
                null != r && ("string" != typeof r || (r = t.elements.popper.querySelector(r))) && J(t.elements.popper, r) && (t.elements.arrow = r)
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
                    o = e.name,
                    r = t.rects.reference,
                    n = t.rects.popper,
                    i = t.modifiersData.preventOverflow,
                    a = eO(t, {
                        elementContext: "reference"
                    }),
                    s = eO(t, {
                        altBoundary: !0
                    }),
                    l = eP(a, r),
                    p = eP(s, n, i),
                    c = eR(l),
                    u = eR(p);
                t.modifiersData[o] = {
                    referenceClippingOffsets: l,
                    popperEscapeOffsets: p,
                    isReferenceHidden: c,
                    hasPopperEscaped: u
                }, t.attributes.popper = Object.assign({}, t.attributes.popper, {
                    "data-popper-reference-hidden": c,
                    "data-popper-escaped": u
                })
            }
        }]
    }).defaultModifiers) ? [] : o, i = void 0 === (n = t.defaultOptions) ? ej : n, function(e, t, o) {
        void 0 === o && (o = i);
        var n, a, s = {
                placement: "bottom",
                orderedModifiers: [],
                options: Object.assign({}, ej, i),
                modifiersData: {},
                elements: {
                    reference: e,
                    popper: t
                },
                attributes: {},
                styles: {}
            },
            l = [],
            p = !1,
            c = {
                state: s,
                setOptions: function(o) {
                    var n = "function" == typeof o ? o(s.options) : o;
                    u(), s.options = Object.assign({}, i, s.options, n), s.scrollParents = {
                        reference: F(e) ? ey(e) : e.contextElement ? ey(e.contextElement) : [],
                        popper: ey(t)
                    };
                    var a, p, d, f, m, h, g = (a = Object.keys(h = [].concat(r, s.options.modifiers).reduce(function(e, t) {
                        var o = e[t.name];
                        return e[t.name] = o ? Object.assign({}, o, t, {
                            options: Object.assign({}, o.options, t.options),
                            data: Object.assign({}, o.data, t.data)
                        }) : t, e
                    }, {})).map(function(e) {
                        return h[e]
                    }), p = new Map, d = new Set, f = [], a.forEach(function(e) {
                        p.set(e.name, e)
                    }), a.forEach(function(e) {
                        d.has(e.name) || function e(t) {
                            d.add(t.name), [].concat(t.requires || [], t.requiresIfExists || []).forEach(function(t) {
                                if (!d.has(t)) {
                                    var o = p.get(t);
                                    o && e(o)
                                }
                            }), f.push(t)
                        }(e)
                    }), m = f, I.reduce(function(e, t) {
                        return e.concat(m.filter(function(e) {
                            return e.phase === t
                        }))
                    }, []));
                    return s.orderedModifiers = g.filter(function(e) {
                        return e.enabled
                    }), s.orderedModifiers.forEach(function(e) {
                        var t = e.name,
                            o = e.options,
                            r = e.effect;
                        if ("function" == typeof r) {
                            var n = r({
                                state: s,
                                name: t,
                                instance: c,
                                options: void 0 === o ? {} : o
                            });
                            l.push(n || function() {})
                        }
                    }), c.update()
                },
                forceUpdate: function() {
                    if (!p) {
                        var e = s.elements,
                            t = e.reference,
                            o = e.popper;
                        if (eE(t, o)) {
                            s.rects = {
                                reference: (r = eo(o), n = "fixed" === s.options.strategy, u = H(r), d = H(r) && (a = G((i = r.getBoundingClientRect()).width) / r.offsetWidth || 1, l = G(i.height) / r.offsetHeight || 1, 1 !== a || 1 !== l), f = $(r), m = Y(t, d, n), h = {
                                    scrollLeft: 0,
                                    scrollTop: 0
                                }, g = {
                                    x: 0,
                                    y: 0
                                }, (u || !u && !n) && (("body" !== N(r) || ev(f)) && (h = r !== B(r) && H(r) ? {
                                    scrollLeft: r.scrollLeft,
                                    scrollTop: r.scrollTop
                                } : eh(r)), H(r) ? ((g = Y(r, !0)).x += r.clientLeft, g.y += r.clientTop) : f && (g.x = eg(f))), {
                                    x: m.left + h.scrollLeft - g.x,
                                    y: m.top + h.scrollTop - g.y,
                                    width: m.width,
                                    height: m.height
                                }),
                                popper: Z(o)
                            }, s.reset = !1, s.placement = s.options.placement, s.orderedModifiers.forEach(function(e) {
                                return s.modifiersData[e.name] = Object.assign({}, e.data)
                            });
                            for (var r, n, i, a, l, u, d, f, m, h, g, v = 0; v < s.orderedModifiers.length; v++)
                                if (!0 !== s.reset) {
                                    var y = s.orderedModifiers[v],
                                        b = y.fn,
                                        w = y.options,
                                        x = void 0 === w ? {} : w,
                                        O = y.name;
                                    "function" == typeof b && (s = b({
                                        state: s,
                                        options: x,
                                        name: O,
                                        instance: c
                                    }) || s)
                                } else s.reset = !1, v = -1
                        }
                    }
                },
                update: (n = function() {
                    return new Promise(function(e) {
                        c.forceUpdate(), e(s)
                    })
                }, function() {
                    return a || (a = new Promise(function(e) {
                        Promise.resolve().then(function() {
                            a = void 0, e(n())
                        })
                    })), a
                }),
                destroy: function() {
                    u(), p = !0
                }
            };
        if (!eE(e, t)) return c;

        function u() {
            l.forEach(function(e) {
                return e()
            }), l = []
        }
        return c.setOptions(o).then(function(e) {
            !p && o.onFirstUpdate && o.onFirstUpdate(e)
        }), c
    });

    function eD(e) {
        return (0, c.g)("MuiPopper", e)
    }(0, m.g)("MuiPopper", ["root"]);
    let eM = ["anchorEl", "children", "direction", "disablePortal", "modifiers", "open", "placement", "popperOptions", "popperRef", "slotProps", "slots", "TransitionProps", "ownerState"],
        eC = ["anchorEl", "children", "container", "direction", "disablePortal", "keepMounted", "modifiers", "open", "placement", "popperOptions", "popperRef", "style", "transition", "slotProps", "slots"];

    function e_(e) {
        return "function" == typeof e ? e() : e
    }
    let ek = {},
        eS = s.forwardRef(function(e, t) {
            var o;
            let {
                anchorEl: r,
                children: n,
                direction: i,
                disablePortal: a,
                modifiers: l,
                open: p,
                placement: f,
                popperOptions: m,
                popperRef: g,
                slotProps: v = {},
                slots: x = {},
                TransitionProps: O
            } = e, P = (0, c._)(e, eM), R = s.useRef(null), j = (0, y.u)(R, t), E = s.useRef(null), T = (0, y.u)(E, g), D = s.useRef(T);
            (0, b.u)(() => {
                D.current = T
            }, [T]), s.useImperativeHandle(g, () => E.current, []);
            let M = function(e, t) {
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
                [C, _] = s.useState(M),
                [k, S] = s.useState(e_(r));
            s.useEffect(() => {
                E.current && E.current.forceUpdate()
            }), s.useEffect(() => {
                r && S(e_(r))
            }, [r]), (0, b.u)(() => {
                if (!k || !p) return;
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
                        _(t.placement)
                    }
                }];
                null != l && (e = e.concat(l)), m && null != m.modifiers && (e = e.concat(m.modifiers));
                let t = eT(k, R.current, (0, u._)({
                    placement: M
                }, m, {
                    modifiers: e
                }));
                return D.current(t), () => {
                    t.destroy(), D.current(null)
                }
            }, [k, a, l, p, m, M]);
            let A = {
                placement: C
            };
            null !== O && (A.TransitionProps = O);
            let L = (e => {
                    let {
                        classes: t
                    } = e;
                    return (0, d.a)({
                        root: ["root"]
                    }, eD, t)
                })(e),
                W = null != (o = x.root) ? o : "div",
                I = (0, w.u)({
                    elementType: W,
                    externalSlotProps: v.root,
                    externalForwardedProps: P,
                    additionalProps: {
                        role: "tooltip",
                        ref: j
                    },
                    ownerState: e,
                    className: L.root
                });
            return (0, h.jsx)(W, (0, u._)({}, I, {
                children: "function" == typeof n ? n(A) : n
            }))
        }),
        eA = s.forwardRef(function(e, t) {
            let o, {
                    anchorEl: r,
                    children: n,
                    container: i,
                    direction: a = "ltr",
                    disablePortal: l = !1,
                    keepMounted: p = !1,
                    modifiers: d,
                    open: f,
                    placement: m = "bottom",
                    popperOptions: y = ek,
                    popperRef: b,
                    style: w,
                    transition: x = !1,
                    slotProps: O = {},
                    slots: P = {}
                } = e,
                R = (0, c._)(e, eC),
                [j, E] = s.useState(!0);
            if (!p && !f && (!x || j)) return null;
            if (i) o = i;
            else if (r) {
                let e = e_(r);
                o = e && void 0 !== e.nodeType ? (0, g.o)(e).body : (0, g.o)(null).body
            }
            let T = x ? {
                in: f,
                onEnter: () => {
                    E(!1)
                },
                onExited: () => {
                    E(!0)
                }
            } : void 0;
            return (0, h.jsx)(v.P, {
                disablePortal: l,
                container: o,
                children: (0, h.jsx)(eS, (0, u._)({
                    anchorEl: r,
                    direction: a,
                    disablePortal: l,
                    modifiers: d,
                    ref: t,
                    open: x ? !j : f,
                    placement: m,
                    popperOptions: y,
                    popperRef: b,
                    slotProps: O,
                    slots: P
                }, R, {
                    style: (0, u._)({
                        position: "fixed",
                        top: 0,
                        left: 0,
                        display: f || !p || x && !j ? void 0 : "none"
                    }, w),
                    TransitionProps: T,
                    children: n
                }))
            })
        }),
        eL = ["anchorEl", "component", "components", "componentsProps", "container", "disablePortal", "keepMounted", "modifiers", "open", "placement", "popperOptions", "popperRef", "transition", "slots", "slotProps"],
        eW = (0, d.s)(eA, {
            name: "MuiPopper",
            slot: "Root",
            overridesResolver: (e, t) => t.root
        })({}),
        eI = s.forwardRef(function(e, t) {
            var o;
            let r = P(),
                n = (0, x.u)({
                    props: e,
                    name: "MuiPopper"
                }),
                {
                    anchorEl: i,
                    component: a,
                    components: s,
                    componentsProps: l,
                    container: p,
                    disablePortal: d,
                    keepMounted: f,
                    modifiers: m,
                    open: g,
                    placement: v,
                    popperOptions: y,
                    popperRef: b,
                    transition: w,
                    slots: O,
                    slotProps: R
                } = n,
                j = (0, c._)(n, eL),
                E = null != (o = null == O ? void 0 : O.root) ? o : null == s ? void 0 : s.Root,
                T = (0, u._)({
                    anchorEl: i,
                    container: p,
                    disablePortal: d,
                    keepMounted: f,
                    modifiers: m,
                    open: g,
                    placement: v,
                    popperOptions: y,
                    popperRef: b,
                    transition: w
                }, j);
            return (0, h.jsx)(eW, (0, u._)({
                as: a,
                direction: null == r ? void 0 : r.direction,
                slots: {
                    root: E
                },
                slotProps: null != R ? R : l
            }, T, {
                ref: t
            }))
        });
    e.s(["M", 0, eI], 682018);
    var eN = e.i(342607),
        eB = e.i(353512),
        eF = e.i(946029),
        eH = e.i(236365),
        eV = e.i(950711),
        eU = e.i(352705),
        ez = e.i(782353),
        eq = e.i(577474),
        eG = e.i(81962);

    function eK(e) {
        return (0, c.g)("MuiTooltip", e)
    }
    e.i(304064);
    var eX = (0, m.g)("MuiTooltip", ["popper", "popperInteractive", "popperArrow", "popperClose", "tooltip", "tooltipArrow", "touch", "tooltipPlacementLeft", "tooltipPlacementRight", "tooltipPlacementTop", "tooltipPlacementBottom", "arrow"]);
    let eY = ["arrow", "children", "classes", "components", "componentsProps", "describeChild", "disableFocusListener", "disableHoverListener", "disableInteractive", "disableTouchListener", "enterDelay", "enterNextDelay", "enterTouchDelay", "followCursor", "id", "leaveDelay", "leaveTouchDelay", "onClose", "onOpen", "open", "placement", "PopperComponent", "PopperProps", "slotProps", "slots", "title", "TransitionComponent", "TransitionProps"],
        eZ = (0, d.s)(eI, {
            name: "MuiTooltip",
            slot: "Popper",
            overridesResolver: (e, t) => {
                let {
                    ownerState: o
                } = e;
                return [t.popper, !o.disableInteractive && t.popperInteractive, o.arrow && t.popperArrow, !o.open && t.popperClose]
            }
        })(e => {
            let {
                theme: t,
                ownerState: o,
                open: r
            } = e;
            return (0, u._)({
                zIndex: (t.vars || t).zIndex.tooltip,
                pointerEvents: "none"
            }, !o.disableInteractive && {
                pointerEvents: "auto"
            }, !r && {
                pointerEvents: "none"
            }, o.arrow && {
                ['&[data-popper-placement*="bottom"] .'.concat(eX.arrow)]: {
                    top: 0,
                    marginTop: "-0.71em",
                    "&::before": {
                        transformOrigin: "0 100%"
                    }
                },
                ['&[data-popper-placement*="top"] .'.concat(eX.arrow)]: {
                    bottom: 0,
                    marginBottom: "-0.71em",
                    "&::before": {
                        transformOrigin: "100% 0"
                    }
                },
                ['&[data-popper-placement*="right"] .'.concat(eX.arrow)]: (0, u._)({}, o.isRtl ? {
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
                ['&[data-popper-placement*="left"] .'.concat(eX.arrow)]: (0, u._)({}, o.isRtl ? {
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
        eJ = (0, d.s)("div", {
            name: "MuiTooltip",
            slot: "Tooltip",
            overridesResolver: (e, t) => {
                let {
                    ownerState: o
                } = e;
                return [t.tooltip, o.touch && t.touch, o.arrow && t.tooltipArrow, t["tooltipPlacement".concat((0, c.a)(o.placement.split("-")[0]))]]
            }
        })(e => {
            let {
                theme: t,
                ownerState: o
            } = e;
            return (0, u._)({
                backgroundColor: t.vars ? t.vars.palette.Tooltip.bg : (0, c.b)(t.palette.grey[700], .92),
                borderRadius: (t.vars || t).shape.borderRadius,
                color: (t.vars || t).palette.common.white,
                fontFamily: t.typography.fontFamily,
                padding: "4px 8px",
                fontSize: t.typography.pxToRem(11),
                maxWidth: 300,
                margin: 2,
                wordWrap: "break-word",
                fontWeight: t.typography.fontWeightMedium
            }, o.arrow && {
                position: "relative",
                margin: 0
            }, o.touch && {
                padding: "8px 16px",
                fontSize: t.typography.pxToRem(14),
                lineHeight: Math.round(16 / 14 * 1e5) / 1e5 + "em",
                fontWeight: t.typography.fontWeightRegular
            }, {
                [".".concat(eX.popper, '[data-popper-placement*="left"] &')]: (0, u._)({
                    transformOrigin: "right center"
                }, o.isRtl ? (0, u._)({
                    marginLeft: "14px"
                }, o.touch && {
                    marginLeft: "24px"
                }) : (0, u._)({
                    marginRight: "14px"
                }, o.touch && {
                    marginRight: "24px"
                })),
                [".".concat(eX.popper, '[data-popper-placement*="right"] &')]: (0, u._)({
                    transformOrigin: "left center"
                }, o.isRtl ? (0, u._)({
                    marginRight: "14px"
                }, o.touch && {
                    marginRight: "24px"
                }) : (0, u._)({
                    marginLeft: "14px"
                }, o.touch && {
                    marginLeft: "24px"
                })),
                [".".concat(eX.popper, '[data-popper-placement*="top"] &')]: (0, u._)({
                    transformOrigin: "center bottom",
                    marginBottom: "14px"
                }, o.touch && {
                    marginBottom: "24px"
                }),
                [".".concat(eX.popper, '[data-popper-placement*="bottom"] &')]: (0, u._)({
                    transformOrigin: "center top",
                    marginTop: "14px"
                }, o.touch && {
                    marginTop: "24px"
                })
            })
        }),
        eQ = (0, d.s)("span", {
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
                color: t.vars ? t.vars.palette.Tooltip.bg : (0, c.b)(t.palette.grey[700], .9),
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
        e$ = !1,
        e0 = new eB.T,
        e1 = {
            x: 0,
            y: 0
        };

    function e2(e, t) {
        return function(o) {
            for (var r = arguments.length, n = Array(r > 1 ? r - 1 : 0), i = 1; i < r; i++) n[i - 1] = arguments[i];
            t && t(o, ...n), e(o, ...n)
        }
    }
    let e4 = s.forwardRef(function(e, t) {
        var o, r, n, i, a, l, p, m, g, v, b, w, O, P, R, j, E, T, D;
        let M = (0, x.u)({
                props: e,
                name: "MuiTooltip"
            }),
            {
                arrow: C = !1,
                children: _,
                components: k = {},
                componentsProps: S = {},
                describeChild: A = !1,
                disableFocusListener: L = !1,
                disableHoverListener: W = !1,
                disableInteractive: I = !1,
                disableTouchListener: N = !1,
                enterDelay: B = 100,
                enterNextDelay: F = 0,
                enterTouchDelay: H = 700,
                followCursor: V = !1,
                id: U,
                leaveDelay: z = 0,
                leaveTouchDelay: q = 1500,
                onClose: G,
                onOpen: K,
                open: X,
                placement: Y = "bottom",
                PopperComponent: Z,
                PopperProps: J = {},
                slotProps: Q = {},
                slots: $ = {},
                title: ee,
                TransitionComponent: et = eq.G,
                TransitionProps: eo
            } = M,
            er = (0, c._)(M, eY),
            en = s.isValidElement(_) ? _ : (0, h.jsx)("span", {
                children: _
            }),
            ei = (0, eN.u)(),
            ea = (0, f.u)(),
            [es, el] = s.useState(),
            [ep, ec] = s.useState(null),
            eu = s.useRef(!1),
            ed = I || V,
            ef = (0, eB.u)(),
            em = (0, eB.u)(),
            eh = (0, eB.u)(),
            eg = (0, eB.u)(),
            [ev, ey] = (0, eF.u)({
                controlled: X,
                default: !1,
                name: "Tooltip",
                state: "open"
            }),
            eb = ev,
            ew = (0, eH.u)(U),
            ex = s.useRef(),
            eO = (0, eV.u)(() => {
                void 0 !== ex.current && (document.body.style.WebkitUserSelect = ex.current, ex.current = void 0), eg.clear()
            });
        s.useEffect(() => eO, [eO]);
        let eP = e => {
                e0.clear(), e$ = !0, ey(!0), K && !eb && K(e)
            },
            eR = (0, eV.u)(e => {
                e0.start(800 + z, () => {
                    e$ = !1
                }), ey(!1), G && eb && G(e), ef.start(ei.transitions.duration.shortest, () => {
                    eu.current = !1
                })
            }),
            ej = e => {
                eu.current && "touchstart" !== e.type || (es && es.removeAttribute("title"), em.clear(), eh.clear(), B || e$ && F ? em.start(e$ ? F : B, () => {
                    eP(e)
                }) : eP(e))
            },
            eE = e => {
                em.clear(), eh.start(z, () => {
                    eR(e)
                })
            },
            {
                isFocusVisibleRef: eT,
                onBlur: eD,
                onFocus: eM,
                ref: eC
            } = (0, eU.u)(),
            [, e_] = s.useState(!1),
            ek = e => {
                eD(e), !1 === eT.current && (e_(!1), eE(e))
            },
            eS = e => {
                es || el(e.currentTarget), eM(e), !0 === eT.current && (e_(!0), ej(e))
            },
            eA = e => {
                eu.current = !0;
                let t = en.props;
                t.onTouchStart && t.onTouchStart(e)
            };
        s.useEffect(() => {
            if (eb) return document.addEventListener("keydown", e), () => {
                document.removeEventListener("keydown", e)
            };

            function e(e) {
                "Escape" !== e.key && "Esc" !== e.key || eR(e)
            }
        }, [eR, eb]);
        let eL = (0, y.u)((0, ez.g)(en), eC, el, t);
        ee || 0 === ee || (eb = !1);
        let eW = s.useRef(),
            eX = {},
            e4 = "string" == typeof ee;
        A ? (eX.title = eb || !e4 || W ? null : ee, eX["aria-describedby"] = eb ? ew : null) : (eX["aria-label"] = e4 ? ee : null, eX["aria-labelledby"] = eb && !e4 ? ew : null);
        let e5 = (0, u._)({}, eX, er, en.props, {
                className: (0, d.c)(er.className, en.props.className),
                onTouchStart: eA,
                ref: eL
            }, V ? {
                onMouseMove: e => {
                    let t = en.props;
                    t.onMouseMove && t.onMouseMove(e), e1 = {
                        x: e.clientX,
                        y: e.clientY
                    }, eW.current && eW.current.update()
                }
            } : {}),
            e6 = {};
        N || (e5.onTouchStart = e => {
            eA(e), eh.clear(), ef.clear(), eO(), ex.current = document.body.style.WebkitUserSelect, document.body.style.WebkitUserSelect = "none", eg.start(H, () => {
                document.body.style.WebkitUserSelect = ex.current, ej(e)
            })
        }, e5.onTouchEnd = e => {
            en.props.onTouchEnd && en.props.onTouchEnd(e), eO(), eh.start(q, () => {
                eR(e)
            })
        }), W || (e5.onMouseOver = e2(ej, e5.onMouseOver), e5.onMouseLeave = e2(eE, e5.onMouseLeave), ed || (e6.onMouseOver = ej, e6.onMouseLeave = eE)), L || (e5.onFocus = e2(eS, e5.onFocus), e5.onBlur = e2(ek, e5.onBlur), ed || (e6.onFocus = eS, e6.onBlur = ek));
        let e7 = s.useMemo(() => {
                var e;
                let t = [{
                    name: "arrow",
                    enabled: !!ep,
                    options: {
                        element: ep,
                        padding: 4
                    }
                }];
                return null != (e = J.popperOptions) && e.modifiers && (t = t.concat(J.popperOptions.modifiers)), (0, u._)({}, J.popperOptions, {
                    modifiers: t
                })
            }, [ep, J]),
            e3 = (0, u._)({}, M, {
                isRtl: ea,
                arrow: C,
                disableInteractive: ed,
                placement: Y,
                PopperComponentProp: Z,
                touch: eu.current
            }),
            e9 = (e => {
                let {
                    classes: t,
                    disableInteractive: o,
                    arrow: r,
                    touch: n,
                    placement: i
                } = e, a = {
                    popper: ["popper", !o && "popperInteractive", r && "popperArrow"],
                    tooltip: ["tooltip", r && "tooltipArrow", n && "touch", "tooltipPlacement".concat((0, c.a)(i.split("-")[0]))],
                    arrow: ["arrow"]
                };
                return (0, d.a)(a, eK, t)
            })(e3),
            e8 = null != (o = null != (r = $.popper) ? r : k.Popper) ? o : eZ,
            te = null != (n = null != (i = null != (a = $.transition) ? a : k.Transition) ? i : et) ? n : eq.G,
            tt = null != (l = null != (p = $.tooltip) ? p : k.Tooltip) ? l : eJ,
            to = null != (m = null != (g = $.arrow) ? g : k.Arrow) ? m : eQ,
            tr = (0, eG.a)(e8, (0, u._)({}, J, null != (v = Q.popper) ? v : S.popper, {
                className: (0, d.c)(e9.popper, null == J ? void 0 : J.className, null == (b = null != (w = Q.popper) ? w : S.popper) ? void 0 : b.className)
            }), e3),
            tn = (0, eG.a)(te, (0, u._)({}, eo, null != (O = Q.transition) ? O : S.transition), e3),
            ti = (0, eG.a)(tt, (0, u._)({}, null != (P = Q.tooltip) ? P : S.tooltip, {
                className: (0, d.c)(e9.tooltip, null == (R = null != (j = Q.tooltip) ? j : S.tooltip) ? void 0 : R.className)
            }), e3),
            ta = (0, eG.a)(to, (0, u._)({}, null != (E = Q.arrow) ? E : S.arrow, {
                className: (0, d.c)(e9.arrow, null == (T = null != (D = Q.arrow) ? D : S.arrow) ? void 0 : T.className)
            }), e3);
        return (0, h.jsxs)(s.Fragment, {
            children: [s.cloneElement(en, e5), (0, h.jsx)(e8, (0, u._)({
                as: null != Z ? Z : eI,
                placement: Y,
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
                popperRef: eW,
                open: !!es && eb,
                id: ew,
                transition: !0
            }, e6, tr, {
                popperOptions: e7,
                children: e => {
                    let {
                        TransitionProps: t
                    } = e;
                    return (0, h.jsx)(te, (0, u._)({
                        timeout: ei.transitions.duration.shorter
                    }, t, tn, {
                        children: (0, h.jsxs)(tt, (0, u._)({}, ti, {
                            children: [ee, C ? (0, h.jsx)(to, (0, u._)({}, ta, {
                                ref: ec
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
            var o = e.classes,
                r = e.className,
                n = (0, a.a)(e, ["classes", "className"]),
                i = e5(void 0, {
                    props: {
                        classes: (0, p.default)(o, r)
                    }
                });
            return s.default.createElement(e4, (0, a._)({}, n, {
                classes: i.classes,
                ref: t
            }))
        });
    e.s(["Tooltip", 0, e6], 257256)
}]);

//# debugId=43ce0662-4565-5740-a156-af8cee1d90ed
//# sourceMappingURL=3dps223z1k0v0.js.map
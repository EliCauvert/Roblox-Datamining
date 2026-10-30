;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "25a9f644-bf38-0877-15b0-a798d43541d7")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 278862, e => {
    "use strict";
    var t = e.i(999210),
        n = e.i(640409),
        r = e.i(288354),
        o = e.i(562991),
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
                icon: b,
                size: g = "Large",
                variant: w = "Emphasis",
                asChild: x,
                ...A
            } = e, R = (0, i.default)("foundation-web-button", v ? n.disabledOpacity : [t.interactable, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", c[g], v ? p[w] : u[w], h), I = {
                textDecoration: "none",
                ...m
            }, S = e => a.default.createElement(a.default.Fragment, null, a.default.createElement(t.StateLayer, null), y && a.default.createElement("div", {
                "aria-hidden": "true",
                className: "absolute flex"
            }, a.default.createElement(r.LoadingSpinner, {
                width: l[g],
                height: l[g]
            })), a.default.createElement("span", {
                className: (0, i.default)("flex items-center min-width-0", "Large" === g || "Medium" === g ? "gap-small" : "gap-xsmall", y && "invisible")
            }, b && a.default.createElement(o.Icon, {
                name: b,
                size: g
            }), a.default.createElement("span", {
                className: "padding-y-xsmall text-truncate-end text-no-wrap"
            }, e)));
            if (x) {
                let {
                    as: e,
                    ...t
                } = A, n = a.default.Children.only(f);
                return a.default.createElement(s.Slot, {
                    ref: d,
                    ...t,
                    className: R,
                    style: I,
                    "aria-disabled": v || void 0
                }, a.default.cloneElement(n, {}, S(n.props.children)))
            }
            if ("a" === A.as) {
                let {
                    as: e,
                    href: t,
                    ...n
                } = A;
                return a.default.createElement("a", {
                    ref: d,
                    ...n,
                    "aria-disabled": v,
                    href: v ? void 0 : t,
                    className: R,
                    style: I
                }, S(f))
            }
            let {
                as: P,
                ...q
            } = A;
            return a.default.createElement("button", {
                ref: d,
                type: "button",
                ...q,
                disabled: v,
                className: R,
                style: I
            }, S(f))
        });
    e.s(["Button", 0, d])
}, 562991, e => {
    "use strict";
    var t = e.i(197649),
        n = e.i(416340);
    let r = {
            XSmall: "size-[var(--icon-size-xsmall)]",
            Small: "size-[var(--icon-size-small)]",
            Medium: "size-[var(--icon-size-medium)]",
            Large: "size-[var(--icon-size-large)]",
            XLarge: "size-[var(--icon-size-xlarge)]",
            XXLarge: "size-[var(--icon-size-xxlarge)]"
        },
        o = n.default.forwardRef((e, o) => {
            let {
                name: i,
                size: a = "Medium",
                className: s,
                children: l,
                ...c
            } = e;
            return n.default.createElement("span", {
                ref: o,
                "aria-hidden": !0,
                "data-testid": "foundation-web-icon",
                className: (0, t.default)("grow-0 shrink-0 basis-auto icon", i, r[a], s),
                ...c
            })
        });
    o.displayName = "Icon", e.s(["Icon", 0, o])
}, 489098, e => {
    "use strict";
    var t = e.i(999210),
        n = e.i(640409),
        r = e.i(197649),
        o = e.i(416340),
        i = e.i(23342);
    let a = {
            Large: "size-1200",
            Medium: "size-1000",
            Small: "size-800",
            XSmall: "size-600"
        },
        s = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-700"
        },
        l = {
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
        p = {
            Emphasis: "bg-action-emphasis",
            Standard: "bg-action-standard",
            Alert: "bg-action-standard",
            Utility: "bg-shift-300",
            OverMedia: "bg-over-media-0"
        },
        d = {
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
        f = {
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
        h = (0, o.forwardRef)((e, h) => {
            let m, {
                className: v,
                icon: y,
                ariaLabel: b,
                isDisabled: g = !1,
                isCircular: w = !1,
                isSelected: x = !1,
                size: A = "Large",
                variant: R = "Emphasis",
                iconColor: I = "Default",
                asChild: S,
                children: P,
                ...q
            } = e;
            m = g ? u[R] : x ? p[R] : c[R];
            let C = (0, r.default)("foundation-web-icon-button", g ? n.disabledOpacity : [t.interactable, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", a[A], l[A][w ? "circular" : "square"], m, v),
                k = o.default.createElement(o.default.Fragment, null, o.default.createElement(t.StateLayer, null), o.default.createElement("span", {
                    className: (0, r.default)("icon", y, s[A], g ? f[I][R] : d[I][R])
                }));
            if (S) {
                let {
                    as: e,
                    ...t
                } = q, n = o.default.Children.only(P);
                return o.default.createElement(i.Slot, {
                    ref: h,
                    ...t,
                    className: C,
                    "aria-label": b,
                    "aria-disabled": g || void 0
                }, o.default.cloneElement(n, {}, k))
            }
            if ("a" === q.as) {
                let {
                    as: e,
                    href: t,
                    ...n
                } = q;
                return o.default.createElement("a", {
                    ref: h,
                    ...n,
                    "aria-label": b,
                    "aria-disabled": g,
                    href: g ? void 0 : t,
                    className: C
                }, k)
            }
            let {
                as: E,
                ...T
            } = q;
            return o.default.createElement("button", {
                ref: h,
                type: "button",
                ...T,
                "aria-label": b,
                disabled: g,
                className: C
            }, k)
        });
    e.s(["IconButton", 0, h])
}, 508019, e => {
    "use strict";
    var t = e.i(197649),
        n = e.i(416340);

    function r(e) {
        let {
            className: r
        } = e;
        return n.default.createElement("svg", {
            xmlns: "http://www.w3.org/2000/svg",
            width: "13",
            height: "6",
            viewBox: "0 0 13 6",
            fill: "none",
            className: (0, t.default)("block", r),
            style: {
                marginTop: -1
            }
        }, n.default.createElement("path", {
            d: "M0.249999 0.666628L4.83579 5.25241C5.61683 6.03346 6.88316 6.03346 7.66421 5.25241L12.25 0.666626L0.249999 0.666628Z",
            fill: "currentColor"
        }))
    }
    var o = e.i(989665);
    e.s(["Tooltip", 0, function(e) {
        let {
            position: i,
            hasBeak: a = !0,
            title: s,
            description: l,
            ariaLabel: c,
            delayDurationMs: u = 500,
            children: p,
            open: d,
            onOpenChange: f,
            contentClassName: h
        } = e, [m, v] = i.split("-"), y = null != c ? c : "string" == typeof s && null == l ? s : void 0;
        return n.createElement(o.Provider, {
            delayDuration: u
        }, n.createElement(o.Root, {
            open: d,
            onOpenChange: f
        }, p, n.createElement(o.Portal, null, n.createElement(o.Content, {
            side: m,
            align: v,
            "aria-label": y,
            className: (0, t.default)("foundation-web-portal-zindex bg-inverse-surface-0 padding-y-xsmall padding-x-small radius-small shadow-transient-low", h),
            sideOffset: 5
        }, a && n.createElement(o.Arrow, {
            asChild: !0
        }, n.createElement(r, {
            className: "content-[var(--inverse-surface-0)]"
        })), n.createElement("div", {
            className: "flex flex-col text-truncate-split"
        }, n.createElement("div", {
            className: "text-caption-medium content-inverse-default"
        }, s), l && n.createElement("div", {
            className: "text-body-small padding-top-xsmall content-inverse-default max-width-[calc(var(--size-100)*50)]"
        }, l))))))
    }, "TooltipTrigger", 0, function(e) {
        let {
            children: t,
            asChild: r,
            className: i
        } = e;
        return n.createElement(o.Trigger, {
            asChild: r,
            className: i
        }, t)
    }], 508019)
}, 999210, e => {
    "use strict";
    var t = e.i(197649),
        n = e.i(416340);
    e.s(["StateLayer", 0, e => {
        let {
            className: r
        } = e;
        return n.default.createElement("div", {
            "aria-hidden": !0,
            "data-testid": "foundation-web-state-layer",
            className: (0, t.default)("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", r)
        })
    }, "interactable", 0, "relative clip group/interactable focus-visible:outline-focus disabled:outline-none"])
}, 640409, 288354, e => {
    "use strict";
    e.s(["disabledOpacity", 0, "opacity-[0.5]"], 640409);
    var t = e.i(416340);
    e.s(["LoadingSpinner", 0, e => {
        let {
            width: n,
            height: r
        } = e;
        return t.default.createElement("svg", {
            className: "foundation-web-loading-spinner",
            width: n,
            height: r,
            viewBox: "0 0 20 20",
            fill: "none",
            xmlns: "http://www.w3.org/2000/svg"
        }, t.default.createElement("path", {
            fillRule: "evenodd",
            clipRule: "evenodd",
            fill: "currentColor",
            d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
        }))
    }], 288354)
}, 930669, 298886, e => {
    "use strict";
    var t = e.i(221628),
        n = (0, e.i(588393).c)((0, t.jsx)("path", {
            d: "M19 6.41 17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"
        }), "Close");
    e.s(["C", 0, n], 298886), e.s(["CloseIcon", 0, n], 930669)
}, 46591, 356983, e => {
    "use strict";
    var t, n, r, o, i, a = e.i(30941),
        s = e.i(416340),
        l = e.i(936993),
        c = e.i(129210),
        u = e.i(169336),
        p = e.i(477763),
        d = e.i(226319),
        f = e.i(91375),
        h = e.i(928277),
        m = e.i(221628),
        v = e.i(882638),
        y = e.i(90190);
    e.i(802400), e.i(118371), e.i(333032);
    var b = e.i(823079),
        g = e.i(756684),
        w = e.i(747310),
        x = e.i(442632),
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
            var n = {
                    __proto__: null
                },
                r = Object.defineProperty && Object.getOwnPropertyDescriptor;
            for (var o in e)
                if ("default" !== o && Object.prototype.hasOwnProperty.call(e, o)) {
                    var i = r ? Object.getOwnPropertyDescriptor(e, o) : null;
                    i && (i.get || i.set) ? Object.defineProperty(n, o, i) : n[o] = e[o]
                } return n.default = e, t && t.set(e, n), n
        }(s.default),
        S = d.f;

    function P(e) {
        if ("function" != typeof WeakMap) return null;
        var t = new WeakMap,
            n = new WeakMap;
        return (P = function(e) {
            return e ? n : t
        })(e)
    }
    R = A.default = function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : null,
            t = I.useContext(S.ThemeContext);
        return t && 0 !== Object.keys(t).length ? t : e
    };
    var q = "bottom",
        C = "right",
        k = "left",
        E = "auto",
        T = ["top", q, C, k],
        U = "start",
        O = "viewport",
        z = "popper",
        K = T.reduce(function(e, t) {
            return e.concat([t + "-" + U, t + "-end"])
        }, []),
        L = [].concat(T, [E]).reduce(function(e, t) {
            return e.concat([t, t + "-" + U, t + "-end"])
        }, []),
        _ = ["beforeRead", "read", "afterRead", "beforeMain", "main", "afterMain", "beforeWrite", "write", "afterWrite"];

    function M(e) {
        return e ? (e.nodeName || "").toLowerCase() : null
    }

    function V(e) {
        if (null == e) return window;
        if ("[object Window]" !== e.toString()) {
            var t = e.ownerDocument;
            return t && t.defaultView || window
        }
        return e
    }

    function G(e) {
        return e instanceof V(e).Element || e instanceof Element
    }

    function N(e) {
        return e instanceof V(e).HTMLElement || e instanceof HTMLElement
    }

    function D(e) {
        return "u" > typeof ShadowRoot && (e instanceof V(e).ShadowRoot || e instanceof ShadowRoot)
    }

    function j(e) {
        return e.split("-")[0]
    }
    var F = Math.max,
        B = Math.min,
        W = Math.round;

    function J() {
        var e = navigator.userAgentData;
        return null != e && e.brands && Array.isArray(e.brands) ? e.brands.map(function(e) {
            return e.brand + "/" + e.version
        }).join(" ") : navigator.userAgent
    }

    function H() {
        return !/^((?!chrome|android).)*safari/i.test(J())
    }

    function X(e, t, n) {
        void 0 === t && (t = !1), void 0 === n && (n = !1);
        var r = e.getBoundingClientRect(),
            o = 1,
            i = 1;
        t && N(e) && (o = e.offsetWidth > 0 && W(r.width) / e.offsetWidth || 1, i = e.offsetHeight > 0 && W(r.height) / e.offsetHeight || 1);
        var a = (G(e) ? V(e) : window).visualViewport,
            s = !H() && n,
            l = (r.left + (s && a ? a.offsetLeft : 0)) / o,
            c = (r.top + (s && a ? a.offsetTop : 0)) / i,
            u = r.width / o,
            p = r.height / i;
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

    function Y(e) {
        var t = X(e),
            n = e.offsetWidth,
            r = e.offsetHeight;
        return 1 >= Math.abs(t.width - n) && (n = t.width), 1 >= Math.abs(t.height - r) && (r = t.height), {
            x: e.offsetLeft,
            y: e.offsetTop,
            width: n,
            height: r
        }
    }

    function Z(e, t) {
        var n = t.getRootNode && t.getRootNode();
        if (e.contains(t)) return !0;
        if (n && D(n)) {
            var r = t;
            do {
                if (r && e.isSameNode(r)) return !0;
                r = r.parentNode || r.host
            } while (r)
        }
        return !1
    }

    function $(e) {
        return V(e).getComputedStyle(e)
    }

    function Q(e) {
        return ((G(e) ? e.ownerDocument : e.document) || window.document).documentElement
    }

    function ee(e) {
        return "html" === M(e) ? e : e.assignedSlot || e.parentNode || (D(e) ? e.host : null) || Q(e)
    }

    function et(e) {
        return N(e) && "fixed" !== $(e).position ? e.offsetParent : null
    }

    function en(e) {
        for (var t = V(e), n = et(e); n && ["table", "td", "th"].indexOf(M(n)) >= 0 && "static" === $(n).position;) n = et(n);
        return n && ("html" === M(n) || "body" === M(n) && "static" === $(n).position) ? t : n || function(e) {
            var t = /firefox/i.test(J());
            if (/Trident/i.test(J()) && N(e) && "fixed" === $(e).position) return null;
            var n = ee(e);
            for (D(n) && (n = n.host); N(n) && 0 > ["html", "body"].indexOf(M(n));) {
                var r = $(n);
                if ("none" !== r.transform || "none" !== r.perspective || "paint" === r.contain || -1 !== ["transform", "perspective"].indexOf(r.willChange) || t && "filter" === r.willChange || t && r.filter && "none" !== r.filter) return n;
                n = n.parentNode
            }
            return null
        }(e) || t
    }

    function er(e) {
        return ["top", "bottom"].indexOf(e) >= 0 ? "x" : "y"
    }

    function eo(e, t, n) {
        return F(e, B(t, n))
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
        return t.reduce(function(t, n) {
            return t[n] = e, t
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
        var t, n = e.popper,
            r = e.popperRect,
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
            b = a.hasOwnProperty("y"),
            g = k,
            w = "top",
            x = window;
        if (c) {
            var A = en(n),
                R = "clientHeight",
                I = "clientWidth";
            A === V(n) && "static" !== $(A = Q(n)).position && "absolute" === s && (R = "scrollHeight", I = "scrollWidth"), ("top" === o || (o === k || o === C) && "end" === i) && (w = q, m -= (p && A === x && x.visualViewport ? x.visualViewport.height : A[R]) - r.height, m *= l ? 1 : -1), (o === k || ("top" === o || o === q) && "end" === i) && (g = C, f -= (p && A === x && x.visualViewport ? x.visualViewport.width : A[I]) - r.width, f *= l ? 1 : -1)
        }
        var S, P, E, T, U, O, z = Object.assign({
                position: s
            }, c && el),
            K = !0 === u ? (S = {
                x: f,
                y: m
            }, P = V(n), E = S.x, T = S.y, {
                x: W(E * (U = P.devicePixelRatio || 1)) / U || 0,
                y: W(T * U) / U || 0
            }) : {
                x: f,
                y: m
            };
        return f = K.x, m = K.y, l ? Object.assign({}, z, ((O = {})[w] = b ? "0" : "", O[g] = y ? "0" : "", O.transform = 1 >= (x.devicePixelRatio || 1) ? "translate(" + f + "px, " + m + "px)" : "translate3d(" + f + "px, " + m + "px, 0)", O)) : Object.assign({}, z, ((t = {})[w] = b ? m + "px" : "", t[g] = y ? f + "px" : "", t.transform = "", t))
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
        var t = V(e);
        return {
            scrollLeft: t.pageXOffset,
            scrollTop: t.pageYOffset
        }
    }

    function ev(e) {
        return X(Q(e)).left + em(e).scrollLeft
    }

    function ey(e) {
        var t = $(e),
            n = t.overflow,
            r = t.overflowX,
            o = t.overflowY;
        return /auto|scroll|overlay|hidden/.test(n + o + r)
    }

    function eb(e, t) {
        void 0 === t && (t = []);
        var n, r = function e(t) {
                return ["html", "body", "#document"].indexOf(M(t)) >= 0 ? t.ownerDocument.body : N(t) && ey(t) ? t : e(ee(t))
            }(e),
            o = r === (null == (n = e.ownerDocument) ? void 0 : n.body),
            i = V(r),
            a = o ? [i].concat(i.visualViewport || [], ey(r) ? r : []) : r,
            s = t.concat(a);
        return o ? s : s.concat(eb(ee(a)))
    }

    function eg(e) {
        return Object.assign({}, e, {
            left: e.x,
            top: e.y,
            right: e.x + e.width,
            bottom: e.y + e.height
        })
    }

    function ew(e, t, n) {
        var r, o, i, a, s, l, c, u, p, d;
        return t === O ? eg(function(e, t) {
            var n = V(e),
                r = Q(e),
                o = n.visualViewport,
                i = r.clientWidth,
                a = r.clientHeight,
                s = 0,
                l = 0;
            if (o) {
                i = o.width, a = o.height;
                var c = H();
                (c || !c && "fixed" === t) && (s = o.offsetLeft, l = o.offsetTop)
            }
            return {
                width: i,
                height: a,
                x: s + ev(e),
                y: l
            }
        }(e, n)) : G(t) ? ((r = X(t, !1, "fixed" === n)).top = r.top + t.clientTop, r.left = r.left + t.clientLeft, r.bottom = r.top + t.clientHeight, r.right = r.left + t.clientWidth, r.width = t.clientWidth, r.height = t.clientHeight, r.x = r.left, r.y = r.top, r) : eg((o = Q(e), a = Q(o), s = em(o), l = null == (i = o.ownerDocument) ? void 0 : i.body, c = F(a.scrollWidth, a.clientWidth, l ? l.scrollWidth : 0, l ? l.clientWidth : 0), u = F(a.scrollHeight, a.clientHeight, l ? l.scrollHeight : 0, l ? l.clientHeight : 0), p = -s.scrollLeft + ev(o), d = -s.scrollTop, "rtl" === $(l || a).direction && (p += F(a.clientWidth, l ? l.clientWidth : 0) - c), {
            width: c,
            height: u,
            x: p,
            y: d
        }))
    }

    function ex(e) {
        var t, n = e.reference,
            r = e.element,
            o = e.placement,
            i = o ? j(o) : null,
            a = o ? es(o) : null,
            s = n.x + n.width / 2 - r.width / 2,
            l = n.y + n.height / 2 - r.height / 2;
        switch (i) {
            case "top":
                t = {
                    x: s,
                    y: n.y - r.height
                };
                break;
            case q:
                t = {
                    x: s,
                    y: n.y + n.height
                };
                break;
            case C:
                t = {
                    x: n.x + n.width,
                    y: l
                };
                break;
            case k:
                t = {
                    x: n.x - r.width,
                    y: l
                };
                break;
            default:
                t = {
                    x: n.x,
                    y: n.y
                }
        }
        var c = i ? er(i) : null;
        if (null != c) {
            var u = "y" === c ? "height" : "width";
            switch (a) {
                case U:
                    t[c] = t[c] - (n[u] / 2 - r[u] / 2);
                    break;
                case "end":
                    t[c] = t[c] + (n[u] / 2 - r[u] / 2)
            }
        }
        return t
    }

    function eA(e, t) {
        void 0 === t && (t = {});
        var n, r, o, i, a, s, l, c, u = t,
            p = u.placement,
            d = void 0 === p ? e.placement : p,
            f = u.strategy,
            h = void 0 === f ? e.strategy : f,
            m = u.boundary,
            v = u.rootBoundary,
            y = u.elementContext,
            b = void 0 === y ? z : y,
            g = u.altBoundary,
            w = u.padding,
            x = void 0 === w ? 0 : w,
            A = ei("number" != typeof x ? x : ea(x, T)),
            R = e.rects.popper,
            I = e.elements[void 0 !== g && g ? b === z ? "reference" : z : b],
            S = (n = G(I) ? I : I.contextElement || Q(e.elements.popper), r = void 0 === m ? "clippingParents" : m, o = void 0 === v ? O : v, l = (s = [].concat("clippingParents" === r ? (i = eb(ee(n)), G(a = ["absolute", "fixed"].indexOf($(n).position) >= 0 && N(n) ? en(n) : n) ? i.filter(function(e) {
                return G(e) && Z(e, a) && "body" !== M(e)
            }) : []) : [].concat(r), [o]))[0], (c = s.reduce(function(e, t) {
                var r = ew(n, t, h);
                return e.top = F(r.top, e.top), e.right = B(r.right, e.right), e.bottom = B(r.bottom, e.bottom), e.left = F(r.left, e.left), e
            }, ew(n, l, h))).width = c.right - c.left, c.height = c.bottom - c.top, c.x = c.left, c.y = c.top, c),
            P = X(e.elements.reference),
            k = ex({
                reference: P,
                element: R,
                strategy: "absolute",
                placement: d
            }),
            E = eg(Object.assign({}, R, k)),
            U = b === z ? E : P,
            K = {
                top: S.top - U.top + A.top,
                bottom: U.bottom - S.bottom + A.bottom,
                left: S.left - U.left + A.left,
                right: U.right - S.right + A.right
            },
            L = e.modifiersData.offset;
        if (b === z && L) {
            var _ = L[d];
            Object.keys(K).forEach(function(e) {
                var t = [C, q].indexOf(e) >= 0 ? 1 : -1,
                    n = ["top", q].indexOf(e) >= 0 ? "y" : "x";
                K[e] += _[n] * t
            })
        }
        return K
    }

    function eR(e, t, n) {
        return void 0 === n && (n = {
            x: 0,
            y: 0
        }), {
            top: e.top - t.height - n.y,
            right: e.right - t.width + n.x,
            bottom: e.bottom - t.height + n.y,
            left: e.left - t.width - n.x
        }
    }

    function eI(e) {
        return ["top", C, q, k].some(function(t) {
            return e[t] >= 0
        })
    }
    var eS = {
        placement: "bottom",
        modifiers: [],
        strategy: "absolute"
    };

    function eP() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
        return !t.some(function(e) {
            return !(e && "function" == typeof e.getBoundingClientRect)
        })
    }
    var eq = (r = void 0 === (n = (t = {
        defaultModifiers: [{
            name: "eventListeners",
            enabled: !0,
            phase: "write",
            fn: function() {},
            effect: function(e) {
                var t = e.state,
                    n = e.instance,
                    r = e.options,
                    o = r.scroll,
                    i = void 0 === o || o,
                    a = r.resize,
                    s = void 0 === a || a,
                    l = V(t.elements.popper),
                    c = [].concat(t.scrollParents.reference, t.scrollParents.popper);
                return i && c.forEach(function(e) {
                        e.addEventListener("scroll", n.update, eu)
                    }), s && l.addEventListener("resize", n.update, eu),
                    function() {
                        i && c.forEach(function(e) {
                            e.removeEventListener("scroll", n.update, eu)
                        }), s && l.removeEventListener("resize", n.update, eu)
                    }
            },
            data: {}
        }, {
            name: "popperOffsets",
            enabled: !0,
            phase: "read",
            fn: function(e) {
                var t = e.state,
                    n = e.name;
                t.modifiersData[n] = ex({
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
                    n = e.options,
                    r = n.gpuAcceleration,
                    o = n.adaptive,
                    i = n.roundOffsets,
                    a = void 0 === i || i,
                    s = {
                        placement: j(t.placement),
                        variation: es(t.placement),
                        popper: t.elements.popper,
                        popperRect: t.rects.popper,
                        gpuAcceleration: void 0 === r || r,
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
                    var n = t.styles[e] || {},
                        r = t.attributes[e] || {},
                        o = t.elements[e];
                    N(o) && M(o) && (Object.assign(o.style, n), Object.keys(r).forEach(function(e) {
                        var t = r[e];
                        !1 === t ? o.removeAttribute(e) : o.setAttribute(e, !0 === t ? "" : t)
                    }))
                })
            },
            effect: function(e) {
                var t = e.state,
                    n = {
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
                return Object.assign(t.elements.popper.style, n.popper), t.styles = n, t.elements.arrow && Object.assign(t.elements.arrow.style, n.arrow),
                    function() {
                        Object.keys(t.elements).forEach(function(e) {
                            var r = t.elements[e],
                                o = t.attributes[e] || {},
                                i = Object.keys(t.styles.hasOwnProperty(e) ? t.styles[e] : n[e]).reduce(function(e, t) {
                                    return e[t] = "", e
                                }, {});
                            N(r) && M(r) && (Object.assign(r.style, i), Object.keys(o).forEach(function(e) {
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
                    n = e.options,
                    r = e.name,
                    o = n.offset,
                    i = void 0 === o ? [0, 0] : o,
                    a = L.reduce(function(e, n) {
                        var r, o, a, s, l, c;
                        return e[n] = (r = t.rects, a = [k, "top"].indexOf(o = j(n)) >= 0 ? -1 : 1, l = (s = "function" == typeof i ? i(Object.assign({}, r, {
                            placement: n
                        })) : i)[0], c = s[1], l = l || 0, c = (c || 0) * a, [k, C].indexOf(o) >= 0 ? {
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
                null != t.modifiersData.popperOffsets && (t.modifiersData.popperOffsets.x += l, t.modifiersData.popperOffsets.y += c), t.modifiersData[r] = a
            }
        }, {
            name: "flip",
            enabled: !0,
            phase: "main",
            fn: function(e) {
                var t = e.state,
                    n = e.options,
                    r = e.name;
                if (!t.modifiersData[r]._skip) {
                    for (var o = n.mainAxis, i = void 0 === o || o, a = n.altAxis, s = void 0 === a || a, l = n.fallbackPlacements, c = n.padding, u = n.boundary, p = n.rootBoundary, d = n.altBoundary, f = n.flipVariations, h = void 0 === f || f, m = n.allowedAutoPlacements, v = t.options.placement, y = j(v), b = l || (y !== v && h ? function(e) {
                            if (j(e) === E) return [];
                            var t = ed(e);
                            return [eh(e), t, eh(t)]
                        }(v) : [ed(v)]), g = [v].concat(b).reduce(function(e, n) {
                            var r, o, i, a, s, l, d, f, v, y, b, g;
                            return e.concat(j(n) === E ? (o = (r = {
                                placement: n,
                                boundary: u,
                                rootBoundary: p,
                                padding: c,
                                flipVariations: h,
                                allowedAutoPlacements: m
                            }).placement, i = r.boundary, a = r.rootBoundary, s = r.padding, l = r.flipVariations, f = void 0 === (d = r.allowedAutoPlacements) ? L : d, 0 === (b = (y = (v = es(o)) ? l ? K : K.filter(function(e) {
                                return es(e) === v
                            }) : T).filter(function(e) {
                                return f.indexOf(e) >= 0
                            })).length && (b = y), Object.keys(g = b.reduce(function(e, n) {
                                return e[n] = eA(t, {
                                    placement: n,
                                    boundary: i,
                                    rootBoundary: a,
                                    padding: s
                                })[j(n)], e
                            }, {})).sort(function(e, t) {
                                return g[e] - g[t]
                            })) : n)
                        }, []), w = t.rects.reference, x = t.rects.popper, A = new Map, R = !0, I = g[0], S = 0; S < g.length; S++) {
                        var P = g[S],
                            O = j(P),
                            z = es(P) === U,
                            _ = ["top", q].indexOf(O) >= 0,
                            M = _ ? "width" : "height",
                            V = eA(t, {
                                placement: P,
                                boundary: u,
                                rootBoundary: p,
                                altBoundary: d,
                                padding: c
                            }),
                            G = _ ? z ? C : k : z ? q : "top";
                        w[M] > x[M] && (G = ed(G));
                        var N = ed(G),
                            D = [];
                        if (i && D.push(V[O] <= 0), s && D.push(V[G] <= 0, V[N] <= 0), D.every(function(e) {
                                return e
                            })) {
                            I = P, R = !1;
                            break
                        }
                        A.set(P, D)
                    }
                    if (R)
                        for (var F = function(e) {
                                var t = g.find(function(t) {
                                    var n = A.get(t);
                                    if (n) return n.slice(0, e).every(function(e) {
                                        return e
                                    })
                                });
                                if (t) return I = t, "break"
                            }, B = h ? 3 : 1; B > 0 && "break" !== F(B); B--);
                    t.placement !== I && (t.modifiersData[r]._skip = !0, t.placement = I, t.reset = !0)
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
                    n = e.options,
                    r = e.name,
                    o = n.mainAxis,
                    i = n.altAxis,
                    a = n.boundary,
                    s = n.rootBoundary,
                    l = n.altBoundary,
                    c = n.padding,
                    u = n.tether,
                    p = void 0 === u || u,
                    d = n.tetherOffset,
                    f = void 0 === d ? 0 : d,
                    h = eA(t, {
                        boundary: a,
                        rootBoundary: s,
                        padding: c,
                        altBoundary: l
                    }),
                    m = j(t.placement),
                    v = es(t.placement),
                    y = !v,
                    b = er(m),
                    g = "x" === b ? "y" : "x",
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
                        var E, T = "y" === b ? "top" : k,
                            O = "y" === b ? q : C,
                            z = "y" === b ? "height" : "width",
                            K = w[b],
                            L = K + h[T],
                            _ = K - h[O],
                            M = p ? -A[z] / 2 : 0,
                            V = v === U ? x[z] : A[z],
                            G = v === U ? -A[z] : -x[z],
                            N = t.elements.arrow,
                            D = p && N ? Y(N) : {
                                width: 0,
                                height: 0
                            },
                            W = t.modifiersData["arrow#persistent"] ? t.modifiersData["arrow#persistent"].padding : {
                                top: 0,
                                right: 0,
                                bottom: 0,
                                left: 0
                            },
                            J = W[T],
                            H = W[O],
                            X = eo(0, x[z], D[z]),
                            Z = y ? x[z] / 2 - M - X - J - I.mainAxis : V - X - J - I.mainAxis,
                            $ = y ? -x[z] / 2 + M + X + H + I.mainAxis : G + X + H + I.mainAxis,
                            Q = t.elements.arrow && en(t.elements.arrow),
                            ee = Q ? "y" === b ? Q.clientTop || 0 : Q.clientLeft || 0 : 0,
                            et = null != (E = null == S ? void 0 : S[b]) ? E : 0,
                            ei = eo(p ? B(L, K + Z - et - ee) : L, K, p ? F(_, K + $ - et) : _);
                        w[b] = ei, P[b] = ei - K
                    }
                    if (void 0 !== i && i) {
                        var ea, el, ec = "x" === b ? "top" : k,
                            eu = "x" === b ? q : C,
                            ep = w[g],
                            ed = "y" === g ? "height" : "width",
                            ef = ep + h[ec],
                            eh = ep - h[eu],
                            em = -1 !== ["top", k].indexOf(m),
                            ev = null != (el = null == S ? void 0 : S[g]) ? el : 0,
                            ey = em ? ef : ep - x[ed] - A[ed] - ev + I.altAxis,
                            eb = em ? ep + x[ed] + A[ed] - ev - I.altAxis : eh,
                            eg = p && em ? (ea = eo(ey, ep, eb)) > eb ? eb : ea : eo(p ? ey : ef, ep, p ? eb : eh);
                        w[g] = eg, P[g] = eg - ep
                    }
                    t.modifiersData[r] = P
                }
            },
            requiresIfExists: ["offset"]
        }, {
            name: "arrow",
            enabled: !0,
            phase: "main",
            fn: function(e) {
                var t, n = e.state,
                    r = e.name,
                    o = e.options,
                    i = n.elements.arrow,
                    a = n.modifiersData.popperOffsets,
                    s = j(n.placement),
                    l = er(s),
                    c = [k, C].indexOf(s) >= 0 ? "height" : "width";
                if (i && a) {
                    var u, p = (u = o.padding, ei("number" != typeof(u = "function" == typeof u ? u(Object.assign({}, n.rects, {
                            placement: n.placement
                        })) : u) ? u : ea(u, T))),
                        d = Y(i),
                        f = "y" === l ? "top" : k,
                        h = "y" === l ? q : C,
                        m = n.rects.reference[c] + n.rects.reference[l] - a[l] - n.rects.popper[c],
                        v = a[l] - n.rects.reference[l],
                        y = en(i),
                        b = y ? "y" === l ? y.clientHeight || 0 : y.clientWidth || 0 : 0,
                        g = p[f],
                        w = b - d[c] - p[h],
                        x = b / 2 - d[c] / 2 + (m / 2 - v / 2),
                        A = eo(g, x, w);
                    n.modifiersData[r] = ((t = {})[l] = A, t.centerOffset = A - x, t)
                }
            },
            effect: function(e) {
                var t = e.state,
                    n = e.options.element,
                    r = void 0 === n ? "[data-popper-arrow]" : n;
                null != r && ("string" != typeof r || (r = t.elements.popper.querySelector(r))) && Z(t.elements.popper, r) && (t.elements.arrow = r)
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
                    n = e.name,
                    r = t.rects.reference,
                    o = t.rects.popper,
                    i = t.modifiersData.preventOverflow,
                    a = eA(t, {
                        elementContext: "reference"
                    }),
                    s = eA(t, {
                        altBoundary: !0
                    }),
                    l = eR(a, r),
                    c = eR(s, o, i),
                    u = eI(l),
                    p = eI(c);
                t.modifiersData[n] = {
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
    }).defaultModifiers) ? [] : n, i = void 0 === (o = t.defaultOptions) ? eS : o, function(e, t, n) {
        void 0 === n && (n = i);
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
                setOptions: function(n) {
                    var o = "function" == typeof n ? n(s.options) : n;
                    p(), s.options = Object.assign({}, i, s.options, o), s.scrollParents = {
                        reference: G(e) ? eb(e) : e.contextElement ? eb(e.contextElement) : [],
                        popper: eb(t)
                    };
                    var a, c, d, f, h, m, v = (a = Object.keys(m = [].concat(r, s.options.modifiers).reduce(function(e, t) {
                        var n = e[t.name];
                        return e[t.name] = n ? Object.assign({}, n, t, {
                            options: Object.assign({}, n.options, t.options),
                            data: Object.assign({}, n.data, t.data)
                        }) : t, e
                    }, {})).map(function(e) {
                        return m[e]
                    }), c = new Map, d = new Set, f = [], a.forEach(function(e) {
                        c.set(e.name, e)
                    }), a.forEach(function(e) {
                        d.has(e.name) || function e(t) {
                            d.add(t.name), [].concat(t.requires || [], t.requiresIfExists || []).forEach(function(t) {
                                if (!d.has(t)) {
                                    var n = c.get(t);
                                    n && e(n)
                                }
                            }), f.push(t)
                        }(e)
                    }), h = f, _.reduce(function(e, t) {
                        return e.concat(h.filter(function(e) {
                            return e.phase === t
                        }))
                    }, []));
                    return s.orderedModifiers = v.filter(function(e) {
                        return e.enabled
                    }), s.orderedModifiers.forEach(function(e) {
                        var t = e.name,
                            n = e.options,
                            r = e.effect;
                        if ("function" == typeof r) {
                            var o = r({
                                state: s,
                                name: t,
                                instance: u,
                                options: void 0 === n ? {} : n
                            });
                            l.push(o || function() {})
                        }
                    }), u.update()
                },
                forceUpdate: function() {
                    if (!c) {
                        var e = s.elements,
                            t = e.reference,
                            n = e.popper;
                        if (eP(t, n)) {
                            s.rects = {
                                reference: (r = en(n), o = "fixed" === s.options.strategy, p = N(r), d = N(r) && (a = W((i = r.getBoundingClientRect()).width) / r.offsetWidth || 1, l = W(i.height) / r.offsetHeight || 1, 1 !== a || 1 !== l), f = Q(r), h = X(t, d, o), m = {
                                    scrollLeft: 0,
                                    scrollTop: 0
                                }, v = {
                                    x: 0,
                                    y: 0
                                }, (p || !p && !o) && (("body" !== M(r) || ey(f)) && (m = r !== V(r) && N(r) ? {
                                    scrollLeft: r.scrollLeft,
                                    scrollTop: r.scrollTop
                                } : em(r)), N(r) ? ((v = X(r, !0)).x += r.clientLeft, v.y += r.clientTop) : f && (v.x = ev(f))), {
                                    x: h.left + m.scrollLeft - v.x,
                                    y: h.top + m.scrollTop - v.y,
                                    width: h.width,
                                    height: h.height
                                }),
                                popper: Y(n)
                            }, s.reset = !1, s.placement = s.options.placement, s.orderedModifiers.forEach(function(e) {
                                return s.modifiersData[e.name] = Object.assign({}, e.data)
                            });
                            for (var r, o, i, a, l, p, d, f, h, m, v, y = 0; y < s.orderedModifiers.length; y++)
                                if (!0 !== s.reset) {
                                    var b = s.orderedModifiers[y],
                                        g = b.fn,
                                        w = b.options,
                                        x = void 0 === w ? {} : w,
                                        A = b.name;
                                    "function" == typeof g && (s = g({
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
        return u.setOptions(n).then(function(e) {
            !c && n.onFirstUpdate && n.onFirstUpdate(e)
        }), u
    });

    function eC(e) {
        return (0, u.g)("MuiPopper", e)
    }(0, h.g)("MuiPopper", ["root"]);
    let ek = ["anchorEl", "children", "direction", "disablePortal", "modifiers", "open", "placement", "popperOptions", "popperRef", "slotProps", "slots", "TransitionProps", "ownerState"],
        eE = ["anchorEl", "children", "container", "direction", "disablePortal", "keepMounted", "modifiers", "open", "placement", "popperOptions", "popperRef", "style", "transition", "slotProps", "slots"];

    function eT(e) {
        return "function" == typeof e ? e() : e
    }
    let eU = {},
        eO = s.forwardRef(function(e, t) {
            var n;
            let {
                anchorEl: r,
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
            } = e, R = (0, u._)(e, ek), I = s.useRef(null), S = (0, b.u)(I, t), P = s.useRef(null), q = (0, b.u)(P, v), C = s.useRef(q);
            (0, g.u)(() => {
                C.current = q
            }, [q]), s.useImperativeHandle(v, () => P.current, []);
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
                [E, T] = s.useState(k),
                [U, O] = s.useState(eT(r));
            s.useEffect(() => {
                P.current && P.current.forceUpdate()
            }), s.useEffect(() => {
                r && O(eT(r))
            }, [r]), (0, g.u)(() => {
                if (!U || !c) return;
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
                        T(t.placement)
                    }
                }];
                null != l && (e = e.concat(l)), h && null != h.modifiers && (e = e.concat(h.modifiers));
                let t = eq(U, I.current, (0, p._)({
                    placement: k
                }, h, {
                    modifiers: e
                }));
                return C.current(t), () => {
                    t.destroy(), C.current(null)
                }
            }, [U, a, l, c, h, k]);
            let z = {
                placement: E
            };
            null !== A && (z.TransitionProps = A);
            let K = (e => {
                    let {
                        classes: t
                    } = e;
                    return (0, d.a)({
                        root: ["root"]
                    }, eC, t)
                })(e),
                L = null != (n = x.root) ? n : "div",
                _ = (0, w.u)({
                    elementType: L,
                    externalSlotProps: y.root,
                    externalForwardedProps: R,
                    additionalProps: {
                        role: "tooltip",
                        ref: S
                    },
                    ownerState: e,
                    className: K.root
                });
            return (0, m.jsx)(L, (0, p._)({}, _, {
                children: "function" == typeof o ? o(z) : o
            }))
        }),
        ez = s.forwardRef(function(e, t) {
            let n, {
                    anchorEl: r,
                    children: o,
                    container: i,
                    direction: a = "ltr",
                    disablePortal: l = !1,
                    keepMounted: c = !1,
                    modifiers: d,
                    open: f,
                    placement: h = "bottom",
                    popperOptions: b = eU,
                    popperRef: g,
                    style: w,
                    transition: x = !1,
                    slotProps: A = {},
                    slots: R = {}
                } = e,
                I = (0, u._)(e, eE),
                [S, P] = s.useState(!0);
            if (!c && !f && (!x || S)) return null;
            if (i) n = i;
            else if (r) {
                let e = eT(r);
                n = e && void 0 !== e.nodeType ? (0, v.o)(e).body : (0, v.o)(null).body
            }
            let q = x ? {
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
                container: n,
                children: (0, m.jsx)(eO, (0, p._)({
                    anchorEl: r,
                    direction: a,
                    disablePortal: l,
                    modifiers: d,
                    ref: t,
                    open: x ? !S : f,
                    placement: h,
                    popperOptions: b,
                    popperRef: g,
                    slotProps: A,
                    slots: R
                }, I, {
                    style: (0, p._)({
                        position: "fixed",
                        top: 0,
                        left: 0,
                        display: f || !c || x && !S ? void 0 : "none"
                    }, w),
                    TransitionProps: q,
                    children: o
                }))
            })
        }),
        eK = ["anchorEl", "component", "components", "componentsProps", "container", "disablePortal", "keepMounted", "modifiers", "open", "placement", "popperOptions", "popperRef", "transition", "slots", "slotProps"],
        eL = (0, d.s)(ez, {
            name: "MuiPopper",
            slot: "Root",
            overridesResolver: (e, t) => t.root
        })({}),
        e_ = s.forwardRef(function(e, t) {
            var n;
            let r = R(),
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
                    popperOptions: b,
                    popperRef: g,
                    transition: w,
                    slots: A,
                    slotProps: I
                } = o,
                S = (0, u._)(o, eK),
                P = null != (n = null == A ? void 0 : A.root) ? n : null == s ? void 0 : s.Root,
                q = (0, p._)({
                    anchorEl: i,
                    container: c,
                    disablePortal: d,
                    keepMounted: f,
                    modifiers: h,
                    open: v,
                    placement: y,
                    popperOptions: b,
                    popperRef: g,
                    transition: w
                }, S);
            return (0, m.jsx)(eL, (0, p._)({
                as: a,
                direction: null == r ? void 0 : r.direction,
                slots: {
                    root: P
                },
                slotProps: null != I ? I : l
            }, q, {
                ref: t
            }))
        });
    e.s(["M", 0, e_], 356983);
    var eM = e.i(745984),
        eV = e.i(249707),
        eG = e.i(506391),
        eN = e.i(127633),
        eD = e.i(564349),
        ej = e.i(576070),
        eF = e.i(329102),
        eB = e.i(819139),
        eW = e.i(548601);

    function eJ(e) {
        return (0, u.g)("MuiTooltip", e)
    }
    e.i(596779);
    var eH = (0, h.g)("MuiTooltip", ["popper", "popperInteractive", "popperArrow", "popperClose", "tooltip", "tooltipArrow", "touch", "tooltipPlacementLeft", "tooltipPlacementRight", "tooltipPlacementTop", "tooltipPlacementBottom", "arrow"]);
    let eX = ["arrow", "children", "classes", "components", "componentsProps", "describeChild", "disableFocusListener", "disableHoverListener", "disableInteractive", "disableTouchListener", "enterDelay", "enterNextDelay", "enterTouchDelay", "followCursor", "id", "leaveDelay", "leaveTouchDelay", "onClose", "onOpen", "open", "placement", "PopperComponent", "PopperProps", "slotProps", "slots", "title", "TransitionComponent", "TransitionProps"],
        eY = (0, d.s)(e_, {
            name: "MuiTooltip",
            slot: "Popper",
            overridesResolver: (e, t) => {
                let {
                    ownerState: n
                } = e;
                return [t.popper, !n.disableInteractive && t.popperInteractive, n.arrow && t.popperArrow, !n.open && t.popperClose]
            }
        })(e => {
            let {
                theme: t,
                ownerState: n,
                open: r
            } = e;
            return (0, p._)({
                zIndex: (t.vars || t).zIndex.tooltip,
                pointerEvents: "none"
            }, !n.disableInteractive && {
                pointerEvents: "auto"
            }, !r && {
                pointerEvents: "none"
            }, n.arrow && {
                ['&[data-popper-placement*="bottom"] .'.concat(eH.arrow)]: {
                    top: 0,
                    marginTop: "-0.71em",
                    "&::before": {
                        transformOrigin: "0 100%"
                    }
                },
                ['&[data-popper-placement*="top"] .'.concat(eH.arrow)]: {
                    bottom: 0,
                    marginBottom: "-0.71em",
                    "&::before": {
                        transformOrigin: "100% 0"
                    }
                },
                ['&[data-popper-placement*="right"] .'.concat(eH.arrow)]: (0, p._)({}, n.isRtl ? {
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
                ['&[data-popper-placement*="left"] .'.concat(eH.arrow)]: (0, p._)({}, n.isRtl ? {
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
        eZ = (0, d.s)("div", {
            name: "MuiTooltip",
            slot: "Tooltip",
            overridesResolver: (e, t) => {
                let {
                    ownerState: n
                } = e;
                return [t.tooltip, n.touch && t.touch, n.arrow && t.tooltipArrow, t["tooltipPlacement".concat((0, u.a)(n.placement.split("-")[0]))]]
            }
        })(e => {
            let {
                theme: t,
                ownerState: n
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
            }, n.arrow && {
                position: "relative",
                margin: 0
            }, n.touch && {
                padding: "8px 16px",
                fontSize: t.typography.pxToRem(14),
                lineHeight: Math.round(16 / 14 * 1e5) / 1e5 + "em",
                fontWeight: t.typography.fontWeightRegular
            }, {
                [".".concat(eH.popper, '[data-popper-placement*="left"] &')]: (0, p._)({
                    transformOrigin: "right center"
                }, n.isRtl ? (0, p._)({
                    marginLeft: "14px"
                }, n.touch && {
                    marginLeft: "24px"
                }) : (0, p._)({
                    marginRight: "14px"
                }, n.touch && {
                    marginRight: "24px"
                })),
                [".".concat(eH.popper, '[data-popper-placement*="right"] &')]: (0, p._)({
                    transformOrigin: "left center"
                }, n.isRtl ? (0, p._)({
                    marginRight: "14px"
                }, n.touch && {
                    marginRight: "24px"
                }) : (0, p._)({
                    marginLeft: "14px"
                }, n.touch && {
                    marginLeft: "24px"
                })),
                [".".concat(eH.popper, '[data-popper-placement*="top"] &')]: (0, p._)({
                    transformOrigin: "center bottom",
                    marginBottom: "14px"
                }, n.touch && {
                    marginBottom: "24px"
                }),
                [".".concat(eH.popper, '[data-popper-placement*="bottom"] &')]: (0, p._)({
                    transformOrigin: "center top",
                    marginTop: "14px"
                }, n.touch && {
                    marginTop: "24px"
                })
            })
        }),
        e$ = (0, d.s)("span", {
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
        e0 = new eV.T,
        e1 = {
            x: 0,
            y: 0
        };

    function e2(e, t) {
        return function(n) {
            for (var r = arguments.length, o = Array(r > 1 ? r - 1 : 0), i = 1; i < r; i++) o[i - 1] = arguments[i];
            t && t(n, ...o), e(n, ...o)
        }
    }
    let e4 = s.forwardRef(function(e, t) {
        var n, r, o, i, a, l, c, h, v, y, g, w, A, R, I, S, P, q, C;
        let k = (0, x.u)({
                props: e,
                name: "MuiTooltip"
            }),
            {
                arrow: E = !1,
                children: T,
                components: U = {},
                componentsProps: O = {},
                describeChild: z = !1,
                disableFocusListener: K = !1,
                disableHoverListener: L = !1,
                disableInteractive: _ = !1,
                disableTouchListener: M = !1,
                enterDelay: V = 100,
                enterNextDelay: G = 0,
                enterTouchDelay: N = 700,
                followCursor: D = !1,
                id: j,
                leaveDelay: F = 0,
                leaveTouchDelay: B = 1500,
                onClose: W,
                onOpen: J,
                open: H,
                placement: X = "bottom",
                PopperComponent: Y,
                PopperProps: Z = {},
                slotProps: $ = {},
                slots: Q = {},
                title: ee,
                TransitionComponent: et = eB.G,
                TransitionProps: en
            } = k,
            er = (0, u._)(k, eX),
            eo = s.isValidElement(T) ? T : (0, m.jsx)("span", {
                children: T
            }),
            ei = (0, eM.u)(),
            ea = (0, f.u)(),
            [es, el] = s.useState(),
            [ec, eu] = s.useState(null),
            ep = s.useRef(!1),
            ed = _ || D,
            ef = (0, eV.u)(),
            eh = (0, eV.u)(),
            em = (0, eV.u)(),
            ev = (0, eV.u)(),
            [ey, eb] = (0, eG.u)({
                controlled: H,
                default: !1,
                name: "Tooltip",
                state: "open"
            }),
            eg = ey,
            ew = (0, eN.u)(j),
            ex = s.useRef(),
            eA = (0, eD.u)(() => {
                void 0 !== ex.current && (document.body.style.WebkitUserSelect = ex.current, ex.current = void 0), ev.clear()
            });
        s.useEffect(() => eA, [eA]);
        let eR = e => {
                e0.clear(), eQ = !0, eb(!0), J && !eg && J(e)
            },
            eI = (0, eD.u)(e => {
                e0.start(800 + F, () => {
                    eQ = !1
                }), eb(!1), W && eg && W(e), ef.start(ei.transitions.duration.shortest, () => {
                    ep.current = !1
                })
            }),
            eS = e => {
                ep.current && "touchstart" !== e.type || (es && es.removeAttribute("title"), eh.clear(), em.clear(), V || eQ && G ? eh.start(eQ ? G : V, () => {
                    eR(e)
                }) : eR(e))
            },
            eP = e => {
                eh.clear(), em.start(F, () => {
                    eI(e)
                })
            },
            {
                isFocusVisibleRef: eq,
                onBlur: eC,
                onFocus: ek,
                ref: eE
            } = (0, ej.u)(),
            [, eT] = s.useState(!1),
            eU = e => {
                eC(e), !1 === eq.current && (eT(!1), eP(e))
            },
            eO = e => {
                es || el(e.currentTarget), ek(e), !0 === eq.current && (eT(!0), eS(e))
            },
            ez = e => {
                ep.current = !0;
                let t = eo.props;
                t.onTouchStart && t.onTouchStart(e)
            };
        s.useEffect(() => {
            if (eg) return document.addEventListener("keydown", e), () => {
                document.removeEventListener("keydown", e)
            };

            function e(e) {
                "Escape" !== e.key && "Esc" !== e.key || eI(e)
            }
        }, [eI, eg]);
        let eK = (0, b.u)((0, eF.g)(eo), eE, el, t);
        ee || 0 === ee || (eg = !1);
        let eL = s.useRef(),
            eH = {},
            e4 = "string" == typeof ee;
        z ? (eH.title = eg || !e4 || L ? null : ee, eH["aria-describedby"] = eg ? ew : null) : (eH["aria-label"] = e4 ? ee : null, eH["aria-labelledby"] = eg && !e4 ? ew : null);
        let e6 = (0, p._)({}, eH, er, eo.props, {
                className: (0, d.c)(er.className, eo.props.className),
                onTouchStart: ez,
                ref: eK
            }, D ? {
                onMouseMove: e => {
                    let t = eo.props;
                    t.onMouseMove && t.onMouseMove(e), e1 = {
                        x: e.clientX,
                        y: e.clientY
                    }, eL.current && eL.current.update()
                }
            } : {}),
            e9 = {};
        M || (e6.onTouchStart = e => {
            ez(e), em.clear(), ef.clear(), eA(), ex.current = document.body.style.WebkitUserSelect, document.body.style.WebkitUserSelect = "none", ev.start(N, () => {
                document.body.style.WebkitUserSelect = ex.current, eS(e)
            })
        }, e6.onTouchEnd = e => {
            eo.props.onTouchEnd && eo.props.onTouchEnd(e), eA(), em.start(B, () => {
                eI(e)
            })
        }), L || (e6.onMouseOver = e2(eS, e6.onMouseOver), e6.onMouseLeave = e2(eP, e6.onMouseLeave), ed || (e9.onMouseOver = eS, e9.onMouseLeave = eP)), K || (e6.onFocus = e2(eO, e6.onFocus), e6.onBlur = e2(eU, e6.onBlur), ed || (e9.onFocus = eO, e9.onBlur = eU));
        let e3 = s.useMemo(() => {
                var e;
                let t = [{
                    name: "arrow",
                    enabled: !!ec,
                    options: {
                        element: ec,
                        padding: 4
                    }
                }];
                return null != (e = Z.popperOptions) && e.modifiers && (t = t.concat(Z.popperOptions.modifiers)), (0, p._)({}, Z.popperOptions, {
                    modifiers: t
                })
            }, [ec, Z]),
            e5 = (0, p._)({}, k, {
                isRtl: ea,
                arrow: E,
                disableInteractive: ed,
                placement: X,
                PopperComponentProp: Y,
                touch: ep.current
            }),
            e8 = (e => {
                let {
                    classes: t,
                    disableInteractive: n,
                    arrow: r,
                    touch: o,
                    placement: i
                } = e, a = {
                    popper: ["popper", !n && "popperInteractive", r && "popperArrow"],
                    tooltip: ["tooltip", r && "tooltipArrow", o && "touch", "tooltipPlacement".concat((0, u.a)(i.split("-")[0]))],
                    arrow: ["arrow"]
                };
                return (0, d.a)(a, eJ, t)
            })(e5),
            e7 = null != (n = null != (r = Q.popper) ? r : U.Popper) ? n : eY,
            te = null != (o = null != (i = null != (a = Q.transition) ? a : U.Transition) ? i : et) ? o : eB.G,
            tt = null != (l = null != (c = Q.tooltip) ? c : U.Tooltip) ? l : eZ,
            tn = null != (h = null != (v = Q.arrow) ? v : U.Arrow) ? h : e$,
            tr = (0, eW.a)(e7, (0, p._)({}, Z, null != (y = $.popper) ? y : O.popper, {
                className: (0, d.c)(e8.popper, null == Z ? void 0 : Z.className, null == (g = null != (w = $.popper) ? w : O.popper) ? void 0 : g.className)
            }), e5),
            to = (0, eW.a)(te, (0, p._)({}, en, null != (A = $.transition) ? A : O.transition), e5),
            ti = (0, eW.a)(tt, (0, p._)({}, null != (R = $.tooltip) ? R : O.tooltip, {
                className: (0, d.c)(e8.tooltip, null == (I = null != (S = $.tooltip) ? S : O.tooltip) ? void 0 : I.className)
            }), e5),
            ta = (0, eW.a)(tn, (0, p._)({}, null != (P = $.arrow) ? P : O.arrow, {
                className: (0, d.c)(e8.arrow, null == (q = null != (C = $.arrow) ? C : O.arrow) ? void 0 : q.className)
            }), e5);
        return (0, m.jsxs)(s.Fragment, {
            children: [s.cloneElement(eo, e6), (0, m.jsx)(e7, (0, p._)({
                as: null != Y ? Y : e_,
                placement: X,
                anchorEl: D ? {
                    getBoundingClientRect: () => ({
                        top: e1.y,
                        left: e1.x,
                        right: e1.x,
                        bottom: e1.y,
                        width: 0,
                        height: 0
                    })
                } : es,
                popperRef: eL,
                open: !!es && eg,
                id: ew,
                transition: !0
            }, e9, tr, {
                popperOptions: e3,
                children: e => {
                    let {
                        TransitionProps: t
                    } = e;
                    return (0, m.jsx)(te, (0, p._)({
                        timeout: ei.transitions.duration.shorter
                    }, t, to, {
                        children: (0, m.jsxs)(tt, (0, p._)({}, ti, {
                            children: [ee, E ? (0, m.jsx)(tn, (0, p._)({}, ta, {
                                ref: eu
                            })) : null]
                        }))
                    }))
                }
            }))]
        })
    });
    var e6 = (0, l.default)({
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
        e9 = (0, s.forwardRef)(function(e, t) {
            var n = e.classes,
                r = e.className,
                o = (0, a.a)(e, ["classes", "className"]),
                i = e6(void 0, {
                    props: {
                        classes: (0, c.default)(n, r)
                    }
                });
            return s.default.createElement(e4, (0, a._)({}, o, {
                classes: i.classes,
                ref: t
            }))
        });
    e.s(["Tooltip", 0, e9], 46591)
}, 222634, 382655, e => {
    "use strict";
    let t, n, r, o, i, a;
    var s = e.i(30941),
        l = e.i(416340),
        c = e.i(936993),
        u = e.i(129210),
        p = e.i(569384),
        d = e.i(169336),
        f = e.i(477763),
        h = e.i(226319),
        m = e.i(91375),
        v = e.i(928277),
        y = e.i(221628),
        b = e.i(442632),
        g = e.i(945589);

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
    let q = ["className", "color", "value", "valueBuffer", "variant"],
        C = (0, g.keyframes)(t || (t = w())),
        k = (0, g.keyframes)(n || (n = x())),
        E = (0, g.keyframes)(r || (r = A())),
        T = (e, t) => "inherit" === t ? "currentColor" : e.vars ? e.vars.palette.LinearProgress["".concat(t, "Bg")] : "light" === e.palette.mode ? (0, d.l)(e.palette[t].main, .62) : (0, d.j)(e.palette[t].main, .5),
        U = (0, h.s)("span", {
            name: "MuiLinearProgress",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: n
                } = e;
                return [t.root, t["color".concat((0, d.a)(n.color))], t[n.variant]]
            }
        })(e => {
            let {
                ownerState: t,
                theme: n
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
                backgroundColor: T(n, t.color)
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
        O = (0, h.s)("span", {
            name: "MuiLinearProgress",
            slot: "Dashed",
            overridesResolver: (e, t) => {
                let {
                    ownerState: n
                } = e;
                return [t.dashed, t["dashedColor".concat((0, d.a)(n.color))]]
            }
        })(e => {
            let {
                ownerState: t,
                theme: n
            } = e, r = T(n, t.color);
            return (0, f._)({
                position: "absolute",
                marginTop: 0,
                height: "100%",
                width: "100%"
            }, "inherit" === t.color && {
                opacity: .3
            }, {
                backgroundImage: "radial-gradient(".concat(r, " 0%, ").concat(r, " 16%, transparent 42%)"),
                backgroundSize: "10px 10px",
                backgroundPosition: "0 -23px"
            })
        }, (0, g.css)(o || (o = R()), E)),
        z = (0, h.s)("span", {
            name: "MuiLinearProgress",
            slot: "Bar1",
            overridesResolver: (e, t) => {
                let {
                    ownerState: n
                } = e;
                return [t.bar, t["barColor".concat((0, d.a)(n.color))], ("indeterminate" === n.variant || "query" === n.variant) && t.bar1Indeterminate, "determinate" === n.variant && t.bar1Determinate, "buffer" === n.variant && t.bar1Buffer]
            }
        })(e => {
            let {
                ownerState: t,
                theme: n
            } = e;
            return (0, f._)({
                width: "100%",
                position: "absolute",
                left: 0,
                bottom: 0,
                top: 0,
                transition: "transform 0.2s linear",
                transformOrigin: "left",
                backgroundColor: "inherit" === t.color ? "currentColor" : (n.vars || n).palette[t.color].main
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
            return ("indeterminate" === t.variant || "query" === t.variant) && (0, g.css)(i || (i = I()), C)
        }),
        K = (0, h.s)("span", {
            name: "MuiLinearProgress",
            slot: "Bar2",
            overridesResolver: (e, t) => {
                let {
                    ownerState: n
                } = e;
                return [t.bar, t["barColor".concat((0, d.a)(n.color))], ("indeterminate" === n.variant || "query" === n.variant) && t.bar2Indeterminate, "buffer" === n.variant && t.bar2Buffer]
            }
        })(e => {
            let {
                ownerState: t,
                theme: n
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
                backgroundColor: "inherit" === t.color ? "currentColor" : (n.vars || n).palette[t.color].main
            }, "inherit" === t.color && {
                opacity: .3
            }, "buffer" === t.variant && {
                backgroundColor: T(n, t.color),
                transition: "transform .4s linear"
            })
        }, e => {
            let {
                ownerState: t
            } = e;
            return ("indeterminate" === t.variant || "query" === t.variant) && (0, g.css)(a || (a = S()), k)
        }),
        L = l.forwardRef(function(e, t) {
            let n = (0, b.u)({
                    props: e,
                    name: "MuiLinearProgress"
                }),
                {
                    className: r,
                    color: o = "primary",
                    value: i,
                    valueBuffer: a,
                    variant: s = "indeterminate"
                } = n,
                l = (0, d._)(n, q),
                c = (0, f._)({}, n, {
                    color: o,
                    variant: s
                }),
                u = (e => {
                    let {
                        classes: t,
                        variant: n,
                        color: r
                    } = e, o = {
                        root: ["root", "color".concat((0, d.a)(r)), n],
                        dashed: ["dashed", "dashedColor".concat((0, d.a)(r))],
                        bar1: ["bar", "barColor".concat((0, d.a)(r)), ("indeterminate" === n || "query" === n) && "bar1Indeterminate", "determinate" === n && "bar1Determinate", "buffer" === n && "bar1Buffer"],
                        bar2: ["bar", "buffer" !== n && "barColor".concat((0, d.a)(r)), "buffer" === n && "color".concat((0, d.a)(r)), ("indeterminate" === n || "query" === n) && "bar2Indeterminate", "buffer" === n && "bar2Buffer"]
                    };
                    return (0, h.a)(o, P, t)
                })(c),
                p = (0, m.u)(),
                v = {},
                g = {},
                w = {};
            if (("determinate" === s || "buffer" === s) && void 0 !== i) {
                v["aria-valuenow"] = Math.round(i), v["aria-valuemin"] = 0, v["aria-valuemax"] = 100;
                let e = i - 100;
                p && (e = -e), g.transform = "translateX(".concat(e, "%)")
            }
            if ("buffer" === s && void 0 !== a) {
                let e = (a || 0) - 100;
                p && (e = -e), w.transform = "translateX(".concat(e, "%)")
            }
            return (0, y.jsxs)(U, (0, f._)({
                className: (0, h.c)(u.root, r),
                ownerState: c,
                role: "progressbar"
            }, v, {
                ref: t
            }, l, {
                children: ["buffer" === s ? (0, y.jsx)(O, {
                    className: u.dashed,
                    ownerState: c
                }) : null, (0, y.jsx)(z, {
                    className: u.bar1,
                    ownerState: c,
                    style: g
                }), "determinate" === s ? null : (0, y.jsx)(K, {
                    className: u.bar2,
                    ownerState: c,
                    style: w
                })]
            }))
        });
    e.s(["M", 0, L], 382655);
    var _ = (0, c.default)({
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
        M = (0, l.forwardRef)(function(e, t) {
            var n = e.classes,
                r = e.className,
                o = (0, s.a)(e, ["classes", "className"]),
                i = _(void 0, {
                    props: {
                        classes: (0, u.default)(n, r)
                    }
                });
            return l.default.createElement(L, (0, s._)({}, o, {
                classes: i.classes,
                ref: t
            }))
        });
    e.s(["LinearProgress", 0, M], 222634)
}, 223914, e => {
    "use strict";
    var t = e.i(484613);
    e.s(["WarningIcon", () => t.Warning])
}, 401631, 948463, e => {
    "use strict";
    var t = e.i(30941),
        n = e.i(416340),
        r = e.i(936993),
        o = e.i(129210),
        i = e.i(759599),
        a = e.i(466127);
    e.i(221628);
    var s = (0, r.default)({
            name: "IconButton"
        })(function(e, n) {
            var r, o, s, l, c, u, p, d, f, h, m = n.color,
                v = n.variant,
                y = {
                    color: e.palette.actionV2.primaryBrand.fill
                },
                b = {
                    color: e.palette.content.standard
                },
                g = {
                    color: e.palette.content.alert.important
                };
            return "contained" === v && (Object.assign(y, ((r = {
                color: e.palette.content.static.light,
                backgroundColor: e.palette.actionV2.primaryBrand.fill
            })["&:hover, &.".concat(i.b.focusVisible, " .").concat(i.t.root)] = {
                backgroundColor: e.palette.actionV2.primaryBrand.containedHoverFocus
            }, r)), Object.assign(b, ((o = {
                color: e.palette.content.inverse,
                backgroundColor: e.palette.actionV2.primary.fill
            })["&:hover, &.".concat(i.b.focusVisible, " .").concat(i.t.root)] = {
                backgroundColor: e.palette.actionV2.primary.containedHoverFocus
            }, o)), Object.assign(g, ((s = {
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
                colorSecondary: b,
                colorError: g,
                sizeSmall: {
                    padding: 4
                }
            }
        }),
        l = (0, n.forwardRef)(function(e, r) {
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
            return n.default.createElement(a.I, (0, t._)({}, f, {
                classes: h.classes,
                color: m,
                ref: r
            }), i)
        });
    e.s(["default", 0, l], 948463), e.s(["IconButton", 0, l], 401631)
}, 581577, 280162, e => {
    "use strict";
    let t;
    var n = e.i(416340),
        r = e.i(252842),
        o = e.i(695763),
        i = e.i(537683),
        a = e.i(611043),
        s = e.i(222634),
        l = e.i(401631),
        c = e.i(930669),
        u = e.i(848427),
        p = e.i(547710),
        d = e.i(677753),
        f = function(e, t) {
            return (f = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
            })(e, t)
        };

    function h(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function n() {
            this.constructor = e
        }
        f(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
    }

    function m(e, t, n, r) {
        return new(n || (n = Promise))(function(o, i) {
            function a(e) {
                try {
                    l(r.next(e))
                } catch (e) {
                    i(e)
                }
            }

            function s(e) {
                try {
                    l(r.throw(e))
                } catch (e) {
                    i(e)
                }
            }

            function l(e) {
                var t;
                e.done ? o(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(a, s)
            }
            l((r = r.apply(e, t || [])).next())
        })
    }

    function v(e, t) {
        var n, r, o, i = {
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
                if (n) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, c[0] && (i = 0)), i;) try {
                    if (n = 1, r && (o = 2 & c[0] ? r.return : c[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, c[1])).done) return o;
                    switch (r = 0, o && (c = [2 & c[0], o.value]), c[0]) {
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
                            i.label++, r = c[1], c = [0];
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
                    c = [6, e], r = 0
                } finally {
                    n = o = 0
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

    function b(e) {
        var t;
        return null == (t = e) ? t : {
            ids: t.ids
        }
    }

    function g(e) {
        if (void 0 !== e) return null === e ? null : {
            ids: e.ids
        }
    }

    function w(e) {
        var t;
        return null == (t = e) ? t : {
            owner: y(t.owner),
            resources: (0, d.mapValues)(t.resources, b)
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
            resources: (0, d.mapValues)(e.resources, g)
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

    function q(e) {
        if (void 0 !== e) return null === e ? null : {
            scopeType: e.scopeType,
            operations: e.operations
        }
    }

    function C(e, t) {
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

    function E(e) {
        var t;
        return null == (t = e) ? t : {
            redirectUris: t.redirectUris,
            allowedScopes: t.allowedScopes.map(P),
            versionInfo: k(t.versionInfo),
            isBanned: t.isBanned,
            createdUtc: new Date(t.createdUtc),
            updatedUtc: new Date(t.updatedUtc),
            reviewSubmission: (0, d.exists)(t, "reviewSubmission") ? C(t.reviewSubmission) : void 0,
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

    function T(e, t) {
        return null == e ? e : {
            applications: e.applications.map(E),
            nextPageCursor: (0, d.exists)(e, "nextPageCursor") ? e.nextPageCursor : void 0
        }
    }

    function U(e) {
        var t, n;
        return null == (t = e) ? t : {
            authorizationId: t.authorizationId,
            application: null == (n = t.application) ? n : {
                applicationId: n.applicationId,
                owner: y(n.owner),
                name: n.name,
                summary: n.summary,
                tosUri: (0, d.exists)(n, "tosUri") ? n.tosUri : void 0,
                privacyUri: (0, d.exists)(n, "privacyUri") ? n.privacyUri : void 0,
                entryPointUri: (0, d.exists)(n, "entryPointUri") ? n.entryPointUri : void 0,
                imageAssetId: (0, d.exists)(n, "imageAssetId") ? n.imageAssetId : void 0,
                isFirstParty: (0, d.exists)(n, "isFirstParty") ? n.isFirstParty : void 0
            },
            scopes: t.scopes.map(P),
            resourceInfo: t.resourceInfo.map(w),
            createdUtc: new Date(t.createdUtc),
            refreshedUtc: new Date(t.refreshedUtc)
        }
    }

    function O(e, t) {
        return null == e ? e : {
            applicationSecret: e.applicationSecret,
            redirectUris: e.redirectUris,
            allowedScopes: e.allowedScopes.map(P),
            versionInfo: k(e.versionInfo),
            isBanned: e.isBanned,
            createdUtc: new Date(e.createdUtc),
            updatedUtc: new Date(e.updatedUtc),
            reviewSubmission: (0, d.exists)(e, "reviewSubmission") ? C(e.reviewSubmission) : void 0,
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

    function z(e, t) {
        return null == e ? e : {
            resourceInfos: e.resource_infos.map(w)
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
            name: t.name,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0
        }
    }

    function _(e) {
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

    function M(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0
        }
    }

    function V(e) {
        return e
    }

    function G(e) {
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

    function D(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            environments: (0, d.exists)(t, "environments") ? null === t.environments ? null : t.environments.map(G) : void 0,
            targetType: (0, d.exists)(t, "targetType") ? t.targetType : void 0,
            operations: t.operations,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0,
            product: (0, d.exists)(t, "product") ? t.product : void 0,
            operationOverrides: t.operationOverrides.map(N),
            authenticationSystems: t.authenticationSystems.map(V),
            groupAllowedOperations: (0, d.exists)(t, "groupAllowedOperations") ? t.groupAllowedOperations : void 0
        }
    }

    function j(e) {
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

    function J(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            requiredParts: (0, d.exists)(t, "requiredParts") ? t.requiredParts : void 0,
            optionalParts: (0, d.exists)(t, "optionalParts") ? t.optionalParts : void 0,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0
        }
    }

    function H(e) {
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
            allowedScopes: void 0 === e.allowedScopes ? void 0 : null === e.allowedScopes ? null : e.allowedScopes.map(q),
            tosUri: e.tosUri,
            privacyUri: e.privacyUri,
            entryPointUri: e.entryPointUri
        }
    }

    function Y(e) {
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

    function Z(e, t) {
        return null == e ? e : {
            keys: e.keys.map(Y)
        }
    }
    var $ = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return h(t, e), t.prototype.applicationCreateApplicationForGroupRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, r, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new d.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling applicationCreateApplicationForGroup.");
                                if (null === e.applicationCreateApplicationForUserRequest || void 0 === e.applicationCreateApplicationForUserRequest) throw new d.RequiredError("applicationCreateApplicationForUserRequest", "Required parameter requestParameters.applicationCreateApplicationForUserRequest was null or undefined when calling applicationCreateApplicationForGroup.");
                                return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/groups/{groupId}/applications".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/applications",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: X(e.applicationCreateApplicationForUserRequest)
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return O(e)
                                })]
                        }
                    })
                })
            }, t.prototype.applicationCreateApplicationForGroup = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.applicationCreateApplicationForGroupRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.applicationCreateApplicationForUserRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, r, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new d.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling applicationCreateApplicationForUser.");
                                if (null === e.applicationCreateApplicationForUserRequest || void 0 === e.applicationCreateApplicationForUserRequest) throw new d.RequiredError("applicationCreateApplicationForUserRequest", "Required parameter requestParameters.applicationCreateApplicationForUserRequest was null or undefined when calling applicationCreateApplicationForUser.");
                                return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/users/{userId}/applications".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/users/{userId}/applications",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: X(e.applicationCreateApplicationForUserRequest)
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return O(e)
                                })]
                        }
                    })
                })
            }, t.prototype.applicationCreateApplicationForUser = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.applicationCreateApplicationForUserRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.applicationDeleteApplicationRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, r, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.applicationId || void 0 === e.applicationId) throw new d.RequiredError("applicationId", "Required parameter requestParameters.applicationId was null or undefined when calling applicationDeleteApplication.");
                                return n = {}, r = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/{applicationId}".replace("{".concat("applicationId", "}"), encodeURIComponent(String(e.applicationId))),
                                    schemaPath: "/v1/applications/{applicationId}",
                                    method: "DELETE",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.VoidApiResponse(o)]
                        }
                    })
                })
            }, t.prototype.applicationDeleteApplication = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.applicationDeleteApplicationRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.applicationGetApplicationRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, r, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.applicationId || void 0 === e.applicationId) throw new d.RequiredError("applicationId", "Required parameter requestParameters.applicationId was null or undefined when calling applicationGetApplication.");
                                return n = {}, r = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/{applicationId}".replace("{".concat("applicationId", "}"), encodeURIComponent(String(e.applicationId))),
                                    schemaPath: "/v1/applications/{applicationId}",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return E(e)
                                })]
                        }
                    })
                })
            }, t.prototype.applicationGetApplication = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.applicationGetApplicationRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.applicationGetApplicationManagementMetadataRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, r, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return n = {}, r = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/metadata",
                                    schemaPath: "/v1/applications/metadata",
                                    method: "GET",
                                    headers: r,
                                    query: n
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
                    return void 0 === e && (e = {}), v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.applicationGetApplicationManagementMetadataRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.applicationListApplicationsForGroupRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, r, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new d.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling applicationListApplicationsForGroup.");
                                return n = {}, void 0 !== e.limit && (n.limit = e.limit), void 0 !== e.sortOrder && (n.sortOrder = e.sortOrder), void 0 !== e.cursor && (n.cursor = e.cursor), r = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/groups/{groupId}/applications".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/applications",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return T(e)
                                })]
                        }
                    })
                })
            }, t.prototype.applicationListApplicationsForGroup = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.applicationListApplicationsForGroupRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.applicationListApplicationsForUserRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, r, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new d.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling applicationListApplicationsForUser.");
                                return n = {}, void 0 !== e.limit && (n.limit = e.limit), void 0 !== e.sortOrder && (n.sortOrder = e.sortOrder), void 0 !== e.cursor && (n.cursor = e.cursor), r = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/users/{userId}/applications".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/users/{userId}/applications",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return T(e)
                                })]
                        }
                    })
                })
            }, t.prototype.applicationListApplicationsForUser = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.applicationListApplicationsForUserRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.applicationPrivatizeApplicationRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, r, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.applicationId || void 0 === e.applicationId) throw new d.RequiredError("applicationId", "Required parameter requestParameters.applicationId was null or undefined when calling applicationPrivatizeApplication.");
                                return n = {}, r = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/{applicationId}/privatize".replace("{".concat("applicationId", "}"), encodeURIComponent(String(e.applicationId))),
                                    schemaPath: "/v1/applications/{applicationId}/privatize",
                                    method: "PATCH",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.VoidApiResponse(o)]
                        }
                    })
                })
            }, t.prototype.applicationPrivatizeApplication = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.applicationPrivatizeApplicationRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.applicationPublishApplicationRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, r, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.applicationId || void 0 === e.applicationId) throw new d.RequiredError("applicationId", "Required parameter requestParameters.applicationId was null or undefined when calling applicationPublishApplication.");
                                return n = {}, r = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/{applicationId}/publish".replace("{".concat("applicationId", "}"), encodeURIComponent(String(e.applicationId))),
                                    schemaPath: "/v1/applications/{applicationId}/publish",
                                    method: "PATCH",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.VoidApiResponse(o)]
                        }
                    })
                })
            }, t.prototype.applicationPublishApplication = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.applicationPublishApplicationRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.applicationRegenerateApplicationSecretRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, r, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.applicationId || void 0 === e.applicationId) throw new d.RequiredError("applicationId", "Required parameter requestParameters.applicationId was null or undefined when calling applicationRegenerateApplicationSecret.");
                                return n = {}, r = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/{applicationId}/secret".replace("{".concat("applicationId", "}"), encodeURIComponent(String(e.applicationId))),
                                    schemaPath: "/v1/applications/{applicationId}/secret",
                                    method: "POST",
                                    headers: r,
                                    query: n
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
                    return v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.applicationRegenerateApplicationSecretRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.applicationUpdateApplicationRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, r, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.applicationId || void 0 === e.applicationId) throw new d.RequiredError("applicationId", "Required parameter requestParameters.applicationId was null or undefined when calling applicationUpdateApplication.");
                                if (null === e.applicationUpdateApplicationRequest || void 0 === e.applicationUpdateApplicationRequest) throw new d.RequiredError("applicationUpdateApplicationRequest", "Required parameter requestParameters.applicationUpdateApplicationRequest was null or undefined when calling applicationUpdateApplication.");
                                return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/{applicationId}".replace("{".concat("applicationId", "}"), encodeURIComponent(String(e.applicationId))),
                                    schemaPath: "/v1/applications/{applicationId}",
                                    method: "PATCH",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            name: e.name,
                                            summary: e.summary,
                                            redirectUris: e.redirectUris,
                                            allowedScopes: void 0 === e.allowedScopes ? void 0 : null === e.allowedScopes ? null : e.allowedScopes.map(q),
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
                                    return E(e)
                                })]
                        }
                    })
                })
            }, t.prototype.applicationUpdateApplication = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.applicationUpdateApplicationRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.applicationUploadApplicationImageRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, r, o, i;
                    return v(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.applicationId || void 0 === e.applicationId) throw new d.RequiredError("applicationId", "Required parameter requestParameters.applicationId was null or undefined when calling applicationUploadApplicationImage.");
                                if (null === e.imageFile || void 0 === e.imageFile) throw new d.RequiredError("imageFile", "Required parameter requestParameters.imageFile was null or undefined when calling applicationUploadApplicationImage.");
                                return n = {}, r = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), o = (0, d.canConsumeForm)([{
                                    contentType: "multipart/form-data"
                                }]) ? new FormData : new URLSearchParams, void 0 !== e.imageFile && o.append("imageFile", e.imageFile), [4, this.request({
                                    path: "/v1/applications/{applicationId}/image".replace("{".concat("applicationId", "}"), encodeURIComponent(String(e.applicationId))),
                                    schemaPath: "/v1/applications/{applicationId}/image",
                                    method: "POST",
                                    headers: r,
                                    query: n,
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
                    return v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.applicationUploadApplicationImageRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.applicationValidateApplicationNameRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, r, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.name || void 0 === e.name) throw new d.RequiredError("name", "Required parameter requestParameters.name was null or undefined when calling applicationValidateApplicationName.");
                                return n = {}, void 0 !== e.name && (n.name = e.name), void 0 !== e.applicationId && (n.applicationId = e.applicationId), r = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/names/validate",
                                    schemaPath: "/v1/applications/names/validate",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.VoidApiResponse(o)]
                        }
                    })
                })
            }, t.prototype.applicationValidateApplicationName = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.applicationValidateApplicationNameRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.applicationValidateApplicationSummaryRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, r, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.summary || void 0 === e.summary) throw new d.RequiredError("summary", "Required parameter requestParameters.summary was null or undefined when calling applicationValidateApplicationSummary.");
                                return n = {}, void 0 !== e.summary && (n.summary = e.summary), r = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/summary/validate",
                                    schemaPath: "/v1/applications/summary/validate",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.VoidApiResponse(o)]
                        }
                    })
                })
            }, t.prototype.applicationValidateApplicationSummary = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.applicationValidateApplicationSummaryRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
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
                    var n, r, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.authorizationId || void 0 === e.authorizationId) throw new d.RequiredError("authorizationId", "Required parameter requestParameters.authorizationId was null or undefined when calling authorizationDeleteAuthorization.");
                                return n = {}, r = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/authorizations/{authorizationId}".replace("{".concat("authorizationId", "}"), encodeURIComponent(String(e.authorizationId))),
                                    schemaPath: "/v1/authorizations/{authorizationId}",
                                    method: "DELETE",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.VoidApiResponse(o)]
                        }
                    })
                })
            }, t.prototype.authorizationDeleteAuthorization = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.authorizationDeleteAuthorizationRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.authorizationGetAuthorizationRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, r, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.authorizationId || void 0 === e.authorizationId) throw new d.RequiredError("authorizationId", "Required parameter requestParameters.authorizationId was null or undefined when calling authorizationGetAuthorization.");
                                return n = {}, r = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/authorizations/{authorizationId}".replace("{".concat("authorizationId", "}"), encodeURIComponent(String(e.authorizationId))),
                                    schemaPath: "/v1/authorizations/{authorizationId}",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return U(e)
                                })]
                        }
                    })
                })
            }, t.prototype.authorizationGetAuthorization = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.authorizationGetAuthorizationRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.authorizationGetAuthorizationResourcesRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, r, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.applicationId || void 0 === e.applicationId) throw new d.RequiredError("applicationId", "Required parameter requestParameters.applicationId was null or undefined when calling authorizationGetAuthorizationResources.");
                                if (null === e.partialScopes || void 0 === e.partialScopes) throw new d.RequiredError("partialScopes", "Required parameter requestParameters.partialScopes was null or undefined when calling authorizationGetAuthorizationResources.");
                                return n = {}, void 0 !== e.applicationId && (n.applicationId = e.applicationId), void 0 !== e.partialScopes && (n.partialScopes = e.partialScopes), r = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/authorizations/resources",
                                    schemaPath: "/v1/authorizations/resources",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return z(e)
                                })]
                        }
                    })
                })
            }, t.prototype.authorizationGetAuthorizationResources = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.authorizationGetAuthorizationResourcesRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.authorizationListAuthorizationsRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, r, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return n = {}, void 0 !== e.limit && (n.limit = e.limit), void 0 !== e.sortOrder && (n.sortOrder = e.sortOrder), void 0 !== e.cursor && (n.cursor = e.cursor), r = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/authorizations",
                                    schemaPath: "/v1/authorizations",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        authorizations: e.authorizations.map(U),
                                        nextPageCursor: (0, d.exists)(e, "nextPageCursor") ? e.nextPageCursor : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.authorizationListAuthorizations = function() {
                return m(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.authorizationListAuthorizationsRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
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
                    var n, r, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return n = {}, r = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/certificates/access-tokens",
                                    schemaPath: "/v1/certificates/access-tokens",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return Z(e)
                                })]
                        }
                    })
                })
            }, t.prototype.certificateGetAccessTokenCertificates = function() {
                return m(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.certificateGetAccessTokenCertificatesRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.certificateGetDefaultCertificatesRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, r, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return n = {}, r = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/certs",
                                    schemaPath: "/v1/certs",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return Z(e)
                                })]
                        }
                    })
                })
            }, t.prototype.certificateGetDefaultCertificates = function() {
                return m(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.certificateGetDefaultCertificatesRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.certificateGetIdentityTokenCertificatesRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, r, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return n = {}, r = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/certificates/identity-tokens",
                                    schemaPath: "/v1/certificates/identity-tokens",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return Z(e)
                                })]
                        }
                    })
                })
            }, t.prototype.certificateGetIdentityTokenCertificates = function() {
                return m(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.certificateGetIdentityTokenCertificatesRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
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
                    var n, r, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return n = {}, r = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/.well-known/openid-configuration",
                                    schemaPath: "/.well-known/openid-configuration",
                                    method: "GET",
                                    headers: r,
                                    query: n
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
                    return void 0 === e && (e = {}), v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.discoveryGetDiscoveryConfigurationRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
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
                    var n, r, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.externalVerificationSetExternalVerificationTypesRequest || void 0 === e.externalVerificationSetExternalVerificationTypesRequest) throw new d.RequiredError("externalVerificationSetExternalVerificationTypesRequest", "Required parameter requestParameters.externalVerificationSetExternalVerificationTypesRequest was null or undefined when calling externalVerificationSetExternalVerificationTypes.");
                                return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/verification-types",
                                    schemaPath: "/v1/verification-types",
                                    method: "POST",
                                    headers: r,
                                    query: n,
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
                    return v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.externalVerificationSetExternalVerificationTypesRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
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
                    var n, r, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.permissionRequestCreateAuthorizationGrantRequest || void 0 === e.permissionRequestCreateAuthorizationGrantRequest) throw new d.RequiredError("permissionRequestCreateAuthorizationGrantRequest", "Required parameter requestParameters.permissionRequestCreateAuthorizationGrantRequest was null or undefined when calling permissionRequestCreateAuthorizationGrant.");
                                return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/authorizations",
                                    schemaPath: "/v1/authorizations",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            clientId: e.clientId,
                                            responseTypes: e.responseTypes.map(S),
                                            redirectUri: e.redirectUri,
                                            scopes: e.scopes.map(q),
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
                    return v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.permissionRequestCreateAuthorizationGrantRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.permissionRequestCreateMagicAuthorizationGrantRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, r, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.permissionRequestCreateMagicAuthorizationGrantRequest || void 0 === e.permissionRequestCreateMagicAuthorizationGrantRequest) throw new d.RequiredError("permissionRequestCreateMagicAuthorizationGrantRequest", "Required parameter requestParameters.permissionRequestCreateMagicAuthorizationGrantRequest was null or undefined when calling permissionRequestCreateMagicAuthorizationGrant.");
                                return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/authorizations/magic",
                                    schemaPath: "/v1/authorizations/magic",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            clientId: e.clientId,
                                            scopes: e.scopes.map(q),
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
                    return v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.permissionRequestCreateMagicAuthorizationGrantRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.permissionRequestGetAuthorizationEndpointRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, r, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return n = {}, void 0 !== e.clientId && (n.client_id = e.clientId), void 0 !== e.responseType && (n.response_type = e.responseType), void 0 !== e.redirectUri && (n.redirect_uri = e.redirectUri), void 0 !== e.scope && (n.scope = e.scope), void 0 !== e.state && (n.state = e.state), void 0 !== e.nonce && (n.nonce = e.nonce), void 0 !== e.prompt && (n.prompt = e.prompt), void 0 !== e.codeChallenge && (n.code_challenge = e.codeChallenge), void 0 !== e.codeChallengeMethod && (n.code_challenge_method = e.codeChallengeMethod), void 0 !== e.rlt && (n.rlt = e.rlt), void 0 !== e.studioTraceId && (n.studio_trace_id = e.studioTraceId), r = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/authorize",
                                    schemaPath: "/v1/authorize",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.VoidApiResponse(o)]
                        }
                    })
                })
            }, t.prototype.permissionRequestGetAuthorizationEndpoint = function() {
                return m(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.permissionRequestGetAuthorizationEndpointRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.permissionRequestValidatePermissionRequestRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, r, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.clientId || void 0 === e.clientId) throw new d.RequiredError("clientId", "Required parameter requestParameters.clientId was null or undefined when calling permissionRequestValidatePermissionRequest.");
                                if (null === e.redirectUri || void 0 === e.redirectUri) throw new d.RequiredError("redirectUri", "Required parameter requestParameters.redirectUri was null or undefined when calling permissionRequestValidatePermissionRequest.");
                                if (null === e.scopes || void 0 === e.scopes) throw new d.RequiredError("scopes", "Required parameter requestParameters.scopes was null or undefined when calling permissionRequestValidatePermissionRequest.");
                                if (null === e.responseTypes || void 0 === e.responseTypes) throw new d.RequiredError("responseTypes", "Required parameter requestParameters.responseTypes was null or undefined when calling permissionRequestValidatePermissionRequest.");
                                return n = {}, void 0 !== e.clientId && (n.clientId = e.clientId), void 0 !== e.redirectUri && (n.redirectUri = e.redirectUri), void 0 !== e.scopes && (n.scopes = e.scopes), void 0 !== e.responseTypes && (n.responseTypes = e.responseTypes), void 0 !== e.prompts && (n.prompts = e.prompts), void 0 !== e.rlt && (n.rlt = e.rlt), r = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/permission-request",
                                    schemaPath: "/v1/permission-request",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        scopes: e.scopes.map(P),
                                        responseTypes: e.responseTypes.map(I),
                                        promptTypes: e.promptTypes.map(R),
                                        userAgreements: e.userAgreements.map(H),
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
                    return v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.permissionRequestValidatePermissionRequestRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t
        }(d.BaseAPI)),
        en = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return h(t, e), t.prototype.scopeGetScopeConfigurationRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, r, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return n = {}, void 0 !== e.returnBetaScopes && (n.returnBetaScopes = e.returnBetaScopes), r = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/scope-configuration",
                                    schemaPath: "/v1/scope-configuration",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        scopeTypes: e.scopeTypes.map(D),
                                        targetTypes: e.targetTypes.map(F),
                                        targetParts: e.targetParts.map(j),
                                        products: e.products.map(M),
                                        oidcScopes: e.oidcScopes
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.scopeGetScopeConfiguration = function() {
                return m(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.scopeGetScopeConfigurationRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.scopeGetScopesRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, r, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return n = {}, r = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/scopes",
                                    schemaPath: "/v1/scopes",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        scopes: e.scopes.map(_),
                                        scopeTypes: e.scopeTypes.map(B),
                                        targetTypes: e.targetTypes.map(J),
                                        targetParts: e.targetParts.map(W),
                                        products: e.products.map(L),
                                        operations: e.operations.map(K),
                                        oidcScopes: e.oidcScopes
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.scopeGetScopes = function() {
                return m(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.scopeGetScopesRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
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
                var n, r, o, i;
                return v(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.token || void 0 === e.token) throw new d.RequiredError("token", "Required parameter requestParameters.token was null or undefined when calling tokenGetTokenAuthorizationResources.");
                            return n = {}, r = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), (0, d.canConsumeForm)([{
                                contentType: "application/x-www-form-urlencoded"
                            }]), o = new URLSearchParams, void 0 !== e.token && o.append("token", e.token), void 0 !== e.clientId && o.append("client_id", e.clientId), void 0 !== e.clientSecret && o.append("client_secret", e.clientSecret), [4, this.request({
                                path: "/v1/token/resources",
                                schemaPath: "/v1/token/resources",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: o
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new d.JSONApiResponse(i, function(e) {
                                return z(e)
                            })]
                    }
                })
            })
        }, t.prototype.tokenGetTokenAuthorizationResources = function(e, t) {
            return m(this, void 0, void 0, function() {
                return v(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.tokenGetTokenAuthorizationResourcesRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.tokenIntrospectTokenRaw = function(e, t) {
            return m(this, void 0, void 0, function() {
                var n, r, o, i;
                return v(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.token || void 0 === e.token) throw new d.RequiredError("token", "Required parameter requestParameters.token was null or undefined when calling tokenIntrospectToken.");
                            return n = {}, r = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), (0, d.canConsumeForm)([{
                                contentType: "application/x-www-form-urlencoded"
                            }]), o = new URLSearchParams, void 0 !== e.token && o.append("token", e.token), void 0 !== e.clientId && o.append("client_id", e.clientId), void 0 !== e.clientSecret && o.append("client_secret", e.clientSecret), [4, this.request({
                                path: "/v1/token/introspect",
                                schemaPath: "/v1/token/introspect",
                                method: "POST",
                                headers: r,
                                query: n,
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
                return v(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.tokenIntrospectTokenRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.tokenRevokeTokenRaw = function(e, t) {
            return m(this, void 0, void 0, function() {
                var n, r, o, i;
                return v(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.token || void 0 === e.token) throw new d.RequiredError("token", "Required parameter requestParameters.token was null or undefined when calling tokenRevokeToken.");
                            return n = {}, r = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), (0, d.canConsumeForm)([{
                                contentType: "application/x-www-form-urlencoded"
                            }]), o = new URLSearchParams, void 0 !== e.token && o.append("token", e.token), void 0 !== e.clientId && o.append("client_id", e.clientId), void 0 !== e.clientSecret && o.append("client_secret", e.clientSecret), [4, this.request({
                                path: "/v1/token/revoke",
                                schemaPath: "/v1/token/revoke",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: o
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new d.VoidApiResponse(i)]
                    }
                })
            })
        }, t.prototype.tokenRevokeToken = function(e, t) {
            return m(this, void 0, void 0, function() {
                return v(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.tokenRevokeTokenRaw(e, t)];
                        case 1:
                            return n.sent(), [2]
                    }
                })
            })
        }, t.prototype.tokenUseAuthorizationGrantRaw = function(e, t) {
            return m(this, void 0, void 0, function() {
                var n, r, o, i;
                return v(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.grantType || void 0 === e.grantType) throw new d.RequiredError("grantType", "Required parameter requestParameters.grantType was null or undefined when calling tokenUseAuthorizationGrant.");
                            return n = {}, r = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), (0, d.canConsumeForm)([{
                                contentType: "application/x-www-form-urlencoded"
                            }]), o = new URLSearchParams, void 0 !== e.grantType && o.append("grant_type", e.grantType), void 0 !== e.code && o.append("code", e.code), void 0 !== e.codeVerifier && o.append("code_verifier", e.codeVerifier), void 0 !== e.refreshToken && o.append("refresh_token", e.refreshToken), void 0 !== e.clientId && o.append("client_id", e.clientId), void 0 !== e.clientSecret && o.append("client_secret", e.clientSecret), [4, this.request({
                                path: "/v1/token",
                                schemaPath: "/v1/token",
                                method: "POST",
                                headers: r,
                                query: n,
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
                return v(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.tokenUseAuthorizationGrantRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
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
                var n, r, o;
                return v(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, r = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/userinfo",
                                schemaPath: "/v1/userinfo",
                                method: "GET",
                                headers: r,
                                query: n
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
                return void 0 === e && (e = {}), v(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.userInfoGetUserInfoRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }
    }(d.BaseAPI), e.s(["ApplicationApi", 0, $, "ApplicationAuthorizationsApiModelsEnumErrorCode", 0, {
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
    }, "AuthorizationApi", 0, Q, "DiscoveryApi", 0, ee, "PermissionRequestApi", 0, et, "ScopeApi", 0, en], 280162);
    let er = (0, n.createContext)(null);
    er.displayName = "StudioResources";
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
                translations: r
            } = e, {
                classes: {
                    studioIcon: o,
                    dialogText: l
                }
            } = eo();
            return n.default.createElement(n.default.Fragment, null, n.default.createElement(i.Grid, {
                container: !0,
                "data-testid": "studio-dialog-loading",
                direction: "column",
                alignItems: "center"
            }, n.default.createElement("img", {
                width: 64,
                className: o,
                src: t,
                alt: "studio logo"
            }), n.default.createElement(a.Typography, {
                classes: {
                    root: l
                },
                variant: "body1",
                color: "secondary"
            }, r["Message.CheckingStudio"])), n.default.createElement(s.LinearProgress, {
                title: "progress bar"
            }))
        },
        es = e => {
            let {
                logoSrc: t,
                translations: r,
                onClose: o
            } = e, {
                classes: {
                    closeIcon: s,
                    studioIcon: u,
                    dialogText: p
                }
            } = eo();
            return n.default.createElement(i.Grid, {
                container: !0,
                "data-testid": "studio-dialog-error",
                direction: "column",
                alignItems: "center"
            }, n.default.createElement(l.IconButton, {
                className: s,
                color: "secondary",
                "aria-label": "close",
                onClick: o,
                size: "large"
            }, n.default.createElement(c.CloseIcon, null)), n.default.createElement("img", {
                width: 64,
                className: u,
                src: t,
                alt: "studio logo"
            }), n.default.createElement(a.Typography, {
                classes: {
                    root: p
                },
                variant: "body1",
                color: "secondary"
            }, r["Message.OpenStudioError"]))
        },
        el = e => {
            let {
                downloadUrl: t,
                logoSrc: r,
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
            return n.default.createElement(i.Grid, {
                container: !0,
                "data-testid": "studio-dialog-download",
                direction: "column",
                alignItems: "center"
            }, n.default.createElement(l.IconButton, {
                className: d,
                color: "secondary",
                "aria-label": "close",
                onClick: s,
                size: "large"
            }, n.default.createElement(c.CloseIcon, null)), n.default.createElement("img", {
                width: 64,
                className: f,
                src: r,
                alt: "studio logo"
            }), n.default.createElement(a.Typography, {
                classes: {
                    root: h
                },
                variant: "body1",
                color: "secondary"
            }, o["Message.StartYourCreation"]), n.default.createElement(u.Button, {
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
    let em = async (e, t, n) => {
        let r = "".concat(e, "/product-experimentation-platform/v1/projects/1/layers/").concat(t, "/values?parameters=").concat(n);
        return (await fetch(r, {
            headers: {
                "Content-Type": "application/json"
            },
            credentials: "include"
        })).json()
    }, ev = async e => {
        var t, n, o, i, a;
        let s = (0, r.getCurrentPlatform)();
        if (s === r.Platform.macOS) {
            let r = await em(e, "CreatorHubStudioInMac", "enablePersonalizedInstallerInMac,enablePersonalizedStudioLaunchInMac");
            return {
                enablePersonalizedInstaller: !1,
                enableDummyCodeInInstaller: !1,
                enablePersonalizedInstallerInMac: null != (t = r.enablePersonalizedInstallerInMac) && t,
                enablePersonalizedStudioLaunch: !1,
                enablePersonalizedStudioLaunchInMac: null != (n = r.enablePersonalizedStudioLaunchInMac) && n
            }
        }
        if (s === r.Platform.Windows) {
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
    }, ey = async e => null != t ? t : t = ev(e), eb = [{
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

    function eg(e) {
        let t = new Uint8Array(e);
        globalThis.crypto.getRandomValues(t);
        let n = "";
        return t.forEach(e => {
            n += String.fromCharCode(e)
        }), btoa(n)
    }
    let ew = async e => {
        let {
            clientId: t,
            bedev2BasePath: n
        } = e, r = new et(new d.Configuration({
            basePath: "".concat(n, "/oauth"),
            credentials: "include",
            enableMrRouter: !0
        })), o = eg(64);
        try {
            let e = await ey(n);
            if (null == e ? void 0 : e.enableDummyCodeInInstaller) return eg(33).replaceAll("+", "-").replaceAll("/", "_").replace(/=+$/, "");
            if (!e || !e.enablePersonalizedInstaller && !e.enablePersonalizedInstallerInMac || "function" != typeof r.permissionRequestCreateMagicAuthorizationGrant) return;
            return (await r.permissionRequestCreateMagicAuthorizationGrant({
                permissionRequestCreateMagicAuthorizationGrantRequest: {
                    clientId: t,
                    scopes: eb,
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
            clientId: n,
            bedev2BasePath: r
        } = e, o, i, a, s = new et(new d.Configuration({
            basePath: "".concat(r, "/oauth"),
            credentials: "include",
            enableMrRouter: !0
        })), l = (i = new Uint8Array(64), globalThis.crypto.getRandomValues(i), a = "", i.forEach(e => {
            a += String.fromCharCode(e)
        }), btoa(a));
        try {
            o = await ey(r)
        } catch (e) {
            return
        }
        if (o && (o.enablePersonalizedStudioLaunch || o.enablePersonalizedStudioLaunchInMac) && "permissionRequestCreateMagicAuthorizationGrant" in s && "function" == typeof s.permissionRequestCreateMagicAuthorizationGrant) try {
            return (await s.permissionRequestCreateMagicAuthorizationGrant({
                permissionRequestCreateMagicAuthorizationGrantRequest: {
                    clientId: n,
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
            let e = (0, r.getCookieValueByKey)("RBXEventTrackerV2") || (0, r.getCookieValueByKey)("RBXEventTracker");
            if (e) {
                let t = e.match(/browserid=([^&]*)/i);
                if (t) return t[1] || ""
            }
            return ""
        })()), "robloxLocale:".concat(e.locale), "gameLocale:".concat(e.locale), "channel:".concat(e.channel), "browser:".concat(r.device.getCurrentBrowser()), "userId:".concat(e.userId), "distributorType:".concat(e.distributorType)];
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
        eq = {
            [ec]: "6593031293946509533",
            [eu]: "6280195288255344888",
            [ep]: "5437780827214302073",
            [ed]: "6154550030602747221"
        },
        eC = "https://setup.c.robloxdev.cn",
        ek = "".concat(eC, "/cjv/RobloxStudioInstallerCJV.exe"),
        eE = "".concat(eC, "/mac/cjv/RobloxStudioCJV.dmg");
    e.s(["EStudioTaskType", 0, eh, "StudioResourcesProvider", 0, e => {
        let {
            resources: t,
            children: r
        } = e;
        return n.default.createElement(er.Provider, {
            value: t
        }, r)
    }, "createStudioResources", 0, function(e) {
        let {
            logoSrc: t,
            environment: n,
            target: o,
            fetchers: i,
            errorHandler: a
        } = e, s, l = o === ef ? eq[n] : eP[n];
        return {
            logoSrc: t,
            downloadURL: (s = (0, r.getCurrentPlatform)(), o === ef ? s === r.Platform.macOS ? eE : ek : n === ed ? "https://www.roblox.com/download/studio" : "https://www.".concat(n, ".robloxlabs.com/download/studio")),
            bedev2BasePath: n === ed ? "https://apis.roblox.com" : "https://apis.".concat(n, ".robloxlabs.com"),
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
        let o = (0, r.getCurrentPlatform)(),
            i = function() {
                let e = (0, n.useContext)(er);
                if (null === e) throw Error("Cannot load required studio resources, please make sure the provider has been properly set up");
                return e
            }(),
            {
                classes: {
                    dialog: a
                }
            } = eI(),
            [s, l] = (0, n.useState)(),
            [c, u] = (0, n.useState)(),
            d = (0, n.useRef)(s),
            f = (0, n.useRef)(void 0),
            h = (0, n.useCallback)(async () => {
                let e = await ew(i);
                return void 0 === e ? i.downloadURL : "".concat(i.downloadURL, "?code=").concat(e)
            }, [i]),
            m = (0, n.useCallback)(async () => void 0 === c ? void 0 : eS(c), [c]),
            v = (0, n.useCallback)(e => {
                f.current = e
            }, []),
            y = (0, n.useCallback)(e => {
                d.current = e, l(e)
            }, []),
            b = (0, n.useRef)(t);
        (0, n.useEffect)(() => {
            b.current = t
        }, [t]);
        let g = (0, n.useCallback)(() => {
                var e, t;
                let n = f.current;
                v(void 0), y(void 0), void 0 !== n && (null == (t = b.current) || null == (e = t.close) || e.call(t, n))
            }, [v, y]),
            w = (0, n.useCallback)(() => {
                "Download" === d.current && g()
            }, [g]);
        (0, n.useEffect)(() => (window.addEventListener("blur", w), () => {
            window.removeEventListener("blur", w)
        }), [w]);
        let x = (0, n.useCallback)(async (e, n) => {
                let {
                    userId: r,
                    locale: o,
                    protocolScheme: a,
                    distributorType: s,
                    baseUrl: l
                } = n;
                try {
                    var c, p, d, f;
                    let n, h;
                    v(e), y("Loading"), null == t || null == (p = t.startAttempt) || p.call(t, e);
                    let [m, b, g] = await Promise.all([i.fetchUserChannel(), ew(i), eA(i, t => i.onError(t, e))]);
                    u(b);
                    let w = {
                            userId: null != (c = null == r ? void 0 : r.toString()) ? c : "",
                            locale: o,
                            protocolScheme: a,
                            distributorType: s,
                            baseUrl: l,
                            channel: m,
                            authCode: g
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
                    f = x, (n = document.querySelector('[data-testid="studio-protocol-iframe"]')) && n.remove(), (h = document.createElement("iframe")).style.display = "none", h.src = f, h.setAttribute("data-testid", "studio-protocol-iframe"), document.body.appendChild(h);
                    let A = void 0 !== g && "" !== g,
                        R = A ? await eS(g).catch(() => "hash_failed") : void 0;
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
            dialog: (0, n.useMemo)(() => n.default.createElement(p.Dialog, {
                classes: {
                    paper: a
                },
                maxWidth: "XSmall",
                open: void 0 !== s
            }, "Loading" === s && n.default.createElement(ea, {
                logoSrc: i.logoSrc,
                translations: e
            }), "Error" === s && n.default.createElement(es, {
                onClose: g,
                logoSrc: i.logoSrc,
                translations: e
            }), "Download" === s && n.default.createElement(el, {
                onClose: g,
                onDownload: () => {
                    var e;
                    void 0 !== f.current && (null == t || null == (e = t.download) || e.call(t, f.current, {
                        getDownloadCode: m
                    }))
                },
                downloadUrl: A,
                logoSrc: i.logoSrc,
                translations: e
            })), [g, a, s, m, A, t, i.logoSrc, e]),
            isCompatible: o === r.Platform.Windows || o === r.Platform.macOS,
            getStudioDownloadUrlAsync: h
        }
    }], 581577)
}]);

//# debugId=25a9f644-bf38-0877-15b0-a798d43541d7
//# sourceMappingURL=2un08m6x-ty6p.js.map
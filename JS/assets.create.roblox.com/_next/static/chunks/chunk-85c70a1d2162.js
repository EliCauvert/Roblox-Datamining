;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "fff233d8-6e56-e417-5067-7782bdf884b4")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 494118, e => {
    "use strict";
    var t = e.i(737586),
        a = e.i(999544),
        n = e.i(197649),
        i = e.i(416340),
        r = e.i(23342);
    let s = {
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
        o = {
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
        d = {
            Emphasis: "bg-action-emphasis",
            Standard: "bg-action-standard",
            Alert: "bg-action-alert",
            Utility: "bg-action-link",
            OverMedia: "bg-over-media-0"
        },
        c = {
            Emphasis: "bg-action-standard",
            Standard: "bg-action-standard",
            Alert: "bg-action-standard",
            Utility: "bg-action-link",
            OverMedia: "bg-over-media-0"
        },
        u = {
            Emphasis: "bg-action-emphasis",
            Standard: "bg-action-standard",
            Alert: "bg-action-standard",
            Utility: "bg-shift-300",
            OverMedia: "bg-over-media-0"
        },
        m = {
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
        v = (0, i.forwardRef)((e, v) => {
            let p, {
                className: h,
                icon: b,
                ariaLabel: g,
                isDisabled: y = !1,
                isCircular: E = !1,
                isSelected: x = !1,
                size: S = "Large",
                variant: w = "Emphasis",
                iconColor: M = "Default",
                asChild: k,
                children: L,
                ...O
            } = e;
            p = y ? c[w] : x ? u[w] : d[w];
            let N = (0, n.default)("foundation-web-icon-button", y ? a.disabledOpacity : [t.interactable, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", s[S], o[S][E ? "circular" : "square"], p, h),
                j = i.default.createElement(i.default.Fragment, null, i.default.createElement(t.StateLayer, null), i.default.createElement("span", {
                    className: (0, n.default)("icon", b, l[S], y ? f[M][w] : m[M][w])
                }));
            if (k) {
                let {
                    as: e,
                    ...t
                } = O, a = i.default.Children.only(L);
                return i.default.createElement(r.Slot, {
                    ref: v,
                    ...t,
                    className: N,
                    "aria-label": g,
                    "aria-disabled": y || void 0
                }, i.default.cloneElement(a, {}, j))
            }
            if ("a" === O.as) {
                let {
                    as: e,
                    href: t,
                    ...a
                } = O;
                return i.default.createElement("a", {
                    ref: v,
                    ...a,
                    "aria-label": g,
                    "aria-disabled": y,
                    href: y ? void 0 : t,
                    className: N
                }, j)
            }
            let {
                as: z,
                ...C
            } = O;
            return i.default.createElement("button", {
                ref: v,
                type: "button",
                ...C,
                "aria-label": g,
                disabled: y,
                className: N
            }, j)
        });
    e.s(["IconButton", 0, v])
}, 24286, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340),
        n = e.i(23342);
    let i = new Set(["_self", "_parent", "_top"]),
        r = {
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        s = {
            Standard: "content-emphasis",
            Emphasis: "content-emphasis",
            Inverse: "content-inverse-default"
        },
        l = (0, a.forwardRef)((e, l) => {
            var o, d, c;
            let {
                children: u,
                className: m,
                size: f,
                color: v = "Emphasis",
                variant: p = "Standalone",
                underline: h = "hover",
                isExternal: b,
                asChild: g,
                ...y
            } = e, E = (d = null != (o = y.as) ? o : "a", c = "button" === y.as ? void 0 : y.target, void 0 !== b ? b : "button" !== d && void 0 !== c && !i.has(c)), x = (0, t.default)("foundation-web-link", "button" === y.as && "bg-none stroke-none padding-none appearance-none [text-align:inherit]", ("Standalone" === p || E) && "inline-flex items-center gap-xsmall", void 0 !== f && r[f], s[v], "always" === h ? "underline" : "no-underline", "hover" === h && "hover:underline", "motion-safe:transition-opacity", "hover:cursor-pointer hover:[opacity:0.8]", "radius-xsmall focus-visible:[outline-style:solid] focus-visible:[outline-width:var(--stroke-standard)] focus-visible:[outline-color:var(--color-system-emphasis)]", m), S = E ? a.default.createElement("span", {
                "aria-hidden": !0,
                "data-testid": "foundation-web-icon",
                className: (0, t.default)("grow-0 shrink-0 basis-auto icon size-[1em]", "icon-regular-arrow-up-right-from-square")
            }) : null;
            if (g) {
                let {
                    as: e,
                    ...t
                } = y, i = a.default.Children.only(u);
                return a.default.isValidElement(i) ? a.default.createElement(n.Slot, {
                    ref: l,
                    ...t,
                    className: x
                }, a.default.cloneElement(i, {}, a.default.createElement(a.default.Fragment, null, i.props.children, S))) : null
            }
            if ("button" === y.as) {
                let {
                    as: e,
                    type: t,
                    ...n
                } = y;
                return a.default.createElement("button", {
                    ref: l,
                    type: null != t ? t : "button",
                    ...n,
                    className: x
                }, u, S)
            }
            let {
                as: w,
                ...M
            } = y;
            return a.default.createElement("a", {
                ref: l,
                ...M,
                className: x
            }, u, S)
        });
    l.displayName = "Link", e.s(["Link", 0, l])
}, 830655, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340);
    let n = {
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
        i = a.default.forwardRef((e, i) => {
            let {
                className: r,
                size: s = "Large",
                variant: l = "Determinate",
                value: o = 0,
                showValue: d = !1,
                ariaLabel: c,
                ...u
            } = e, {
                dimension: m,
                strokeWidth: f,
                textClass: v,
                valueContainerSize: p
            } = n[s], h = (m - f) / 2, b = 2 * Math.PI * h, g = m / 2, y = Math.min(100, Math.max(0, o)), E = d && void 0 !== p ? p : m, x = "Determinate" === l;
            return a.default.createElement("div", {
                ref: i,
                className: (0, t.default)("foundation-web-progress-circle inline-flex items-center justify-center", r),
                role: "progressbar",
                "aria-label": c,
                "aria-valuemin": x ? 0 : void 0,
                "aria-valuemax": x ? 100 : void 0,
                "aria-valuenow": x ? y : void 0,
                style: {
                    width: E,
                    height: E
                },
                ...u
            }, a.default.createElement("svg", {
                width: m,
                height: m,
                viewBox: "0 0 ".concat(m, " ").concat(m),
                className: "relative"
            }, a.default.createElement("circle", {
                cx: g,
                cy: g,
                r: h,
                fill: "none",
                strokeWidth: f,
                style: {
                    stroke: "var(--color-shift-200)"
                }
            }), a.default.createElement("circle", {
                cx: g,
                cy: g,
                r: h,
                fill: "none",
                strokeWidth: f,
                strokeDasharray: x ? b : "".concat(.75 * b, " ").concat(.25 * b),
                strokeDashoffset: x ? b * (1 - y / 100) : 0,
                strokeLinecap: "round",
                className: (0, t.default)(!x && "foundation-web-progress-circle-indeterminate"),
                style: x ? {
                    stroke: "var(--fui-future-alpha-color-system-progress)",
                    transform: "rotate(-90deg)",
                    transformOrigin: "50% 50%",
                    transition: "stroke-dashoffset 0.3s ease-out"
                } : {
                    stroke: "var(--fui-future-alpha-color-system-progress)",
                    transformOrigin: "50% 50%"
                }
            })), x && d && "Large" === s && a.default.createElement("div", {
                className: (0, t.default)("absolute content-emphasis flex items-center justify-center", v),
                "aria-hidden": "true"
            }, a.default.createElement("span", null, Math.round(y)), a.default.createElement("span", null, "%")))
        });
    i.displayName = "ProgressCircle", e.s(["ProgressCircle", 0, i])
}, 223808, (e, t, a) => {
    var n = 0 / 0,
        i = /^\s+|\s+$/g,
        r = /^[-+]0x[0-9a-f]+$/i,
        s = /^0b[01]+$/i,
        l = /^0o[0-7]+$/i,
        o = parseInt,
        d = e.g && e.g.Object === Object && e.g,
        c = "object" == typeof self && self && self.Object === Object && self,
        u = d || c || Function("return this")(),
        m = Object.prototype.toString,
        f = Math.max,
        v = Math.min,
        p = function() {
            return u.Date.now()
        };

    function h(e) {
        var t = typeof e;
        return !!e && ("object" == t || "function" == t)
    }

    function b(e) {
        if ("number" == typeof e) return e;
        if ("symbol" == typeof(t = e) || t && "object" == typeof t && "[object Symbol]" == m.call(t)) return n;
        if (h(e)) {
            var t, a = "function" == typeof e.valueOf ? e.valueOf() : e;
            e = h(a) ? a + "" : a
        }
        if ("string" != typeof e) return 0 === e ? e : +e;
        e = e.replace(i, "");
        var d = s.test(e);
        return d || l.test(e) ? o(e.slice(2), d ? 2 : 8) : r.test(e) ? n : +e
    }
    t.exports = function(e, t, a) {
        var n, i, r, s, l, o, d = 0,
            c = !1,
            u = !1,
            m = !0;
        if ("function" != typeof e) throw TypeError("Expected a function");

        function g(t) {
            var a = n,
                r = i;
            return n = i = void 0, d = t, s = e.apply(r, a)
        }

        function y(e) {
            var a = e - o,
                n = e - d;
            return void 0 === o || a >= t || a < 0 || u && n >= r
        }

        function E() {
            var e, a, n, i = p();
            if (y(i)) return x(i);
            l = setTimeout(E, (e = i - o, a = i - d, n = t - e, u ? v(n, r - a) : n))
        }

        function x(e) {
            return (l = void 0, m && n) ? g(e) : (n = i = void 0, s)
        }

        function S() {
            var e, a = p(),
                r = y(a);
            if (n = arguments, i = this, o = a, r) {
                if (void 0 === l) return d = e = o, l = setTimeout(E, t), c ? g(e) : s;
                if (u) return l = setTimeout(E, t), g(o)
            }
            return void 0 === l && (l = setTimeout(E, t)), s
        }
        return t = b(t) || 0, h(a) && (c = !!a.leading, r = (u = "maxWait" in a) ? f(b(a.maxWait) || 0, t) : r, m = "trailing" in a ? !!a.trailing : m), S.cancel = function() {
            void 0 !== l && clearTimeout(l), d = 0, n = o = i = l = void 0
        }, S.flush = function() {
            return void 0 === l ? s : x(p())
        }, S
    }
}, 167878, e => {
    "use strict";
    var t = e.i(416340);
    e.i(223808);
    var a = "u" > typeof window ? t.useLayoutEffect : t.useEffect,
        n = "u" < typeof window;
    e.s(["useMediaQuery", 0, function(e) {
        let {
            defaultValue: i = !1,
            initializeWithValue: r = !0
        } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}, s = e => n ? i : window.matchMedia(e).matches, [l, o] = (0, t.useState)(() => r ? s(e) : i);

        function d() {
            o(s(e))
        }
        return a(() => {
            let t = window.matchMedia(e);
            return d(), t.addListener ? t.addListener(d) : t.addEventListener("change", d), () => {
                t.removeListener ? t.removeListener(d) : t.removeEventListener("change", d)
            }
        }, [e]), l
    }])
}]);

//# debugId=fff233d8-6e56-e417-5067-7782bdf884b4
//# sourceMappingURL=1dnm2ytb33_d6.js.map
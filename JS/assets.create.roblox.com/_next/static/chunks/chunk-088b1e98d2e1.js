;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "592da7ae-3995-7576-4feb-c7cc3a890334")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 678365, e => {
    "use strict";
    var t = e.i(631719),
        a = e.i(942625),
        i = e.i(197649),
        n = e.i(416340),
        r = e.i(425353);
    let l = e => {
            let {
                type: t,
                sideSheetSide: a = "right",
                isSideSheetFlush: l = !1,
                centerSheetSize: o = "Medium",
                children: u,
                overlayClassName: s,
                contentClassName: d,
                onOpenAutoFocus: c,
                onCloseAutoFocus: f,
                onPointerDownOutside: m,
                onEscapeKeyDown: h,
                onInteractOutside: p
            } = e;
            return n.default.createElement(r.Portal, null, n.default.createElement(r.Overlay, {
                "data-testid": "fui-base-sheet-overlay",
                "data-type": t,
                "data-side": "sideSheet" === t ? a : void 0,
                "data-flush": "sideSheet" === t ? l : void 0,
                "data-size": "centerSheet" === t ? o : void 0,
                className: (0, i.default)("fui-base-sheet-overlay", "foundation-web-portal-zindex fixed inset-[0] flex", s)
            }, n.default.createElement(r.Content, {
                "data-testid": "fui-base-sheet-content",
                className: (0, i.default)("fui-base-sheet-content relative bg-surface-100 stroke-muted stroke-standard shadow-transient-high", "flex flex-col clip", d),
                onOpenAutoFocus: c,
                onCloseAutoFocus: f,
                onPointerDownOutside: m,
                onEscapeKeyDown: h,
                onInteractOutside: p
            }, u)))
        },
        o = e => {
            let t = e.currentTarget;
            if (!t) return;
            let a = t.querySelectorAll("[data-autofocus-priority]");
            if (0 === a.length) return;
            let i = [];
            a.forEach(e => {
                let t = parseInt(e.getAttribute("data-autofocus-priority") || "", 10);
                !Number.isNaN(t) && e instanceof HTMLElement && i.push({
                    element: e,
                    priority: t
                })
            }), i.sort((e, t) => e.priority - t.priority);
            let n = i.find(e => {
                var t, a;
                return ("function" != typeof(a = t = e.element).checkVisibility || a.checkVisibility()) && !("disabled" in t && t.disabled || "true" === t.getAttribute("aria-disabled"))
            });
            if (n) {
                var r;
                e.preventDefault();
                let t = document.activeElement === n.element;
                n.element.focus(), !t && (r = n.element) instanceof HTMLInputElement && "function" == typeof r.select && r.select()
            }
        };
    var u = e.i(199512),
        s = e.i(167878);
    let d = (0, n.createContext)(null),
        c = () => {
            let e = (0, n.useContext)(d);
            if (!e) throw Error("Sheet components must be used within a Sheet");
            return e
        },
        f = "padding-x-xlarge",
        m = (0, n.forwardRef)((e, t) => {
            let {
                children: a,
                className: r,
                hasPaddingX: l = !0,
                ...o
            } = e, {
                type: u
            } = c();
            return n.default.createElement("div", {
                ref: t,
                className: (0, i.default)("scroll-y", l && f, "sideSheet" === u ? "grow-1" : "", r),
                ...o
            }, a)
        });
    m.displayName = "SheetBody", e.s(["SheetActions", 0, e => {
        let {
            children: t,
            className: r,
            ...l
        } = e;
        return n.default.createElement(n.default.Fragment, null, n.default.createElement(a.Divider, null), n.default.createElement("div", {
            className: (0, i.default)(f, "margin-y-small shrink-0", r),
            ...l
        }, t))
    }, "SheetBody", 0, m, "SheetContent", 0, e => {
        let t, {
                children: a,
                centerSheetSize: r = "Medium",
                largeScreenVariant: u = "center",
                closeLabel: c,
                className: f,
                mobilePortraitClassName: m,
                mobileLandscapeClassName: h,
                largeScreenClassName: p,
                onOpenAutoFocus: v,
                onCloseAutoFocus: g,
                onPointerDownOutside: y,
                onEscapeKeyDown: b,
                onInteractOutside: E
            } = e,
            x = (0, s.useMediaQuery)("(orientation: portrait) and (max-width: 600px)"),
            S = (0, s.useMediaQuery)("(orientation: landscape) and (max-height: 600px)");
        t = x ? "bottomSheet" : S || "side" === u ? "sideSheet" : "centerSheet";
        let w = (0, n.useMemo)(() => ({
                centerSheetSize: r,
                largeScreenVariant: u,
                closeLabel: c,
                isPortraitMobile: x,
                isLandscapeMobile: S,
                type: t
            }), [r, u, c, x, S, t]),
            T = (0, i.default)(f, x && m, S && h, !x && !S && p);
        return n.default.createElement(d.Provider, {
            value: w
        }, n.default.createElement(l, {
            type: t,
            sideSheetSide: "right",
            isSideSheetFlush: S,
            centerSheetSize: r,
            contentClassName: T,
            onOpenAutoFocus: null != v ? v : o,
            onCloseAutoFocus: g,
            onPointerDownOutside: y,
            onEscapeKeyDown: b,
            onInteractOutside: E
        }, a))
    }, "SheetDescription", 0, e => n.default.createElement(r.Description, {
        asChild: !0,
        ...e
    }), "SheetRoot", 0, e => {
        let {
            open: t,
            onOpenChange: a,
            defaultOpen: i,
            children: l
        } = e;
        return n.default.createElement(r.Root, {
            open: t,
            onOpenChange: a,
            defaultOpen: i,
            modal: !0
        }, l)
    }, "SheetTitle", 0, e => {
        let {
            className: a,
            children: l,
            navigation: o,
            utilities: s,
            visuallyHideTitleText: d
        } = e, {
            closeLabel: f
        } = c(), m = n.default.createElement(r.Title, {
            className: "text-heading-small margin-none"
        }, l);
        return n.default.createElement("div", {
            className: (0, i.default)(a, o ? "padding-left-medium" : "padding-left-xlarge", "padding-right-small padding-y-small", "flex items-center justify-between")
        }, n.default.createElement("div", {
            className: (0, i.default)("flex items-center", o && "gap-xsmall")
        }, o, d ? n.default.createElement(u.VisuallyHidden, null, m) : m), n.default.createElement("div", {
            className: (0, i.default)("flex items-center", s && "gap-xxsmall")
        }, s, n.default.createElement("div", {
            className: "fui-sheet-close-affordance-container"
        }, n.default.createElement(r.Close, {
            asChild: !0
        }, n.default.createElement(t.IconButton, {
            variant: "Utility",
            size: "Medium",
            icon: "icon-regular-x",
            ariaLabel: f || "",
            "data-autofocus-priority": "1000"
        })))))
    }, "SheetTrigger", 0, e => n.default.createElement(r.Trigger, {
        asChild: !0,
        ...e
    })], 678365)
}, 223808, (e, t, a) => {
    var i = 0 / 0,
        n = /^\s+|\s+$/g,
        r = /^[-+]0x[0-9a-f]+$/i,
        l = /^0b[01]+$/i,
        o = /^0o[0-7]+$/i,
        u = parseInt,
        s = e.g && e.g.Object === Object && e.g,
        d = "object" == typeof self && self && self.Object === Object && self,
        c = s || d || Function("return this")(),
        f = Object.prototype.toString,
        m = Math.max,
        h = Math.min,
        p = function() {
            return c.Date.now()
        };

    function v(e) {
        var t = typeof e;
        return !!e && ("object" == t || "function" == t)
    }

    function g(e) {
        if ("number" == typeof e) return e;
        if ("symbol" == typeof(t = e) || t && "object" == typeof t && "[object Symbol]" == f.call(t)) return i;
        if (v(e)) {
            var t, a = "function" == typeof e.valueOf ? e.valueOf() : e;
            e = v(a) ? a + "" : a
        }
        if ("string" != typeof e) return 0 === e ? e : +e;
        e = e.replace(n, "");
        var s = l.test(e);
        return s || o.test(e) ? u(e.slice(2), s ? 2 : 8) : r.test(e) ? i : +e
    }
    t.exports = function(e, t, a) {
        var i, n, r, l, o, u, s = 0,
            d = !1,
            c = !1,
            f = !0;
        if ("function" != typeof e) throw TypeError("Expected a function");

        function y(t) {
            var a = i,
                r = n;
            return i = n = void 0, s = t, l = e.apply(r, a)
        }

        function b(e) {
            var a = e - u,
                i = e - s;
            return void 0 === u || a >= t || a < 0 || c && i >= r
        }

        function E() {
            var e, a, i, n = p();
            if (b(n)) return x(n);
            o = setTimeout(E, (e = n - u, a = n - s, i = t - e, c ? h(i, r - a) : i))
        }

        function x(e) {
            return (o = void 0, f && i) ? y(e) : (i = n = void 0, l)
        }

        function S() {
            var e, a = p(),
                r = b(a);
            if (i = arguments, n = this, u = a, r) {
                if (void 0 === o) return s = e = u, o = setTimeout(E, t), d ? y(e) : l;
                if (c) return o = setTimeout(E, t), y(u)
            }
            return void 0 === o && (o = setTimeout(E, t)), l
        }
        return t = g(t) || 0, v(a) && (d = !!a.leading, r = (c = "maxWait" in a) ? m(g(a.maxWait) || 0, t) : r, f = "trailing" in a ? !!a.trailing : f), S.cancel = function() {
            void 0 !== o && clearTimeout(o), s = 0, i = u = n = o = void 0
        }, S.flush = function() {
            return void 0 === o ? l : x(p())
        }, S
    }
}, 167878, e => {
    "use strict";
    var t = e.i(416340);
    e.i(223808);
    var a = "u" > typeof window ? t.useLayoutEffect : t.useEffect,
        i = "u" < typeof window;
    e.s(["useMediaQuery", 0, function(e) {
        let {
            defaultValue: n = !1,
            initializeWithValue: r = !0
        } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}, l = e => i ? n : window.matchMedia(e).matches, [o, u] = (0, t.useState)(() => r ? l(e) : n);

        function s() {
            u(l(e))
        }
        return a(() => {
            let t = window.matchMedia(e);
            return s(), t.addListener ? t.addListener(s) : t.addEventListener("change", s), () => {
                t.removeListener ? t.removeListener(s) : t.removeEventListener("change", s)
            }
        }, [e]), o
    }])
}]);

//# debugId=592da7ae-3995-7576-4feb-c7cc3a890334
//# sourceMappingURL=0ldu4y8kaq77x.js.map
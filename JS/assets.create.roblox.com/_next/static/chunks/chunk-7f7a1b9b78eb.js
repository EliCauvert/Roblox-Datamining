;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "1a274d32-16a6-db10-9721-bd8b57188850")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 897350, e => {
    "use strict";
    var t = e.i(708064),
        a = e.i(256539),
        i = e.i(599226),
        n = e.i(432528),
        r = e.i(197649),
        l = e.i(416340),
        u = e.i(425353),
        o = e.i(199512),
        s = e.i(167878);
    let d = (0, l.createContext)(null),
        c = () => {
            let e = (0, l.useContext)(d);
            if (!e) throw Error("Sheet components must be used within a Sheet");
            return e
        },
        f = "padding-x-xlarge",
        m = (0, l.forwardRef)((e, t) => {
            let {
                children: a,
                className: i,
                hasPaddingX: n = !0,
                ...u
            } = e, {
                type: o
            } = c();
            return l.default.createElement("div", {
                ref: t,
                className: (0, r.default)("scroll-y", n && f, "sideSheet" === o ? "grow-1" : "", i),
                ...u
            }, a)
        });
    m.displayName = "SheetBody", e.s(["SheetActions", 0, e => {
        let {
            children: t,
            className: i,
            ...n
        } = e;
        return l.default.createElement(l.default.Fragment, null, l.default.createElement(a.Divider, null), l.default.createElement("div", {
            className: (0, r.default)(f, "margin-y-small shrink-0", i),
            ...n
        }, t))
    }, "SheetBody", 0, m, "SheetContent", 0, e => {
        let t, {
                children: a,
                centerSheetSize: u = "Medium",
                largeScreenVariant: o = "center",
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
        t = x ? "bottomSheet" : S || "side" === o ? "sideSheet" : "centerSheet";
        let w = (0, l.useMemo)(() => ({
                centerSheetSize: u,
                largeScreenVariant: o,
                closeLabel: c,
                isPortraitMobile: x,
                isLandscapeMobile: S,
                type: t
            }), [u, o, c, x, S, t]),
            T = (0, r.default)(f, x && m, S && h, !x && !S && p);
        return l.default.createElement(d.Provider, {
            value: w
        }, l.default.createElement(i.BaseSheetContent, {
            type: t,
            sideSheetSide: "right",
            isSideSheetFlush: S,
            centerSheetSize: u,
            contentClassName: T,
            onOpenAutoFocus: null != v ? v : n.default,
            onCloseAutoFocus: g,
            onPointerDownOutside: y,
            onEscapeKeyDown: b,
            onInteractOutside: E
        }, a))
    }, "SheetDescription", 0, e => l.default.createElement(u.Description, {
        asChild: !0,
        ...e
    }), "SheetRoot", 0, e => {
        let {
            open: t,
            onOpenChange: a,
            defaultOpen: i,
            children: n
        } = e;
        return l.default.createElement(u.Root, {
            open: t,
            onOpenChange: a,
            defaultOpen: i,
            modal: !0
        }, n)
    }, "SheetTitle", 0, e => {
        let {
            className: a,
            children: i,
            navigation: n,
            utilities: s,
            visuallyHideTitleText: d
        } = e, {
            closeLabel: f
        } = c(), m = l.default.createElement(u.Title, {
            className: "text-heading-small margin-none"
        }, i);
        return l.default.createElement("div", {
            className: (0, r.default)(a, n ? "padding-left-medium" : "padding-left-xlarge", "padding-right-small padding-y-small", "flex items-center justify-between")
        }, l.default.createElement("div", {
            className: (0, r.default)("flex items-center", n && "gap-xsmall")
        }, n, d ? l.default.createElement(o.VisuallyHidden, null, m) : m), l.default.createElement("div", {
            className: (0, r.default)("flex items-center", s && "gap-xxsmall")
        }, s, l.default.createElement("div", {
            className: "fui-sheet-close-affordance-container"
        }, l.default.createElement(u.Close, {
            asChild: !0
        }, l.default.createElement(t.IconButton, {
            variant: "Utility",
            size: "Medium",
            icon: "icon-regular-x",
            ariaLabel: f || "",
            "data-autofocus-priority": "1000"
        })))))
    }, "SheetTrigger", 0, e => l.default.createElement(u.Trigger, {
        asChild: !0,
        ...e
    })])
}, 599226, 432528, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340),
        i = e.i(425353);
    e.s(["BaseSheetContent", 0, e => {
        let {
            type: n,
            sideSheetSide: r = "right",
            isSideSheetFlush: l = !1,
            centerSheetSize: u = "Medium",
            children: o,
            overlayClassName: s,
            contentClassName: d,
            onOpenAutoFocus: c,
            onCloseAutoFocus: f,
            onPointerDownOutside: m,
            onEscapeKeyDown: h,
            onInteractOutside: p
        } = e;
        return a.default.createElement(i.Portal, null, a.default.createElement(i.Overlay, {
            "data-testid": "fui-base-sheet-overlay",
            "data-type": n,
            "data-side": "sideSheet" === n ? r : void 0,
            "data-flush": "sideSheet" === n ? l : void 0,
            "data-size": "centerSheet" === n ? u : void 0,
            className: (0, t.default)("fui-base-sheet-overlay", "foundation-web-portal-zindex fixed inset-[0] flex", s)
        }, a.default.createElement(i.Content, {
            "data-testid": "fui-base-sheet-content",
            className: (0, t.default)("fui-base-sheet-content relative bg-surface-100 stroke-muted stroke-standard shadow-transient-high", "flex flex-col clip", d),
            onOpenAutoFocus: c,
            onCloseAutoFocus: f,
            onPointerDownOutside: m,
            onEscapeKeyDown: h,
            onInteractOutside: p
        }, o)))
    }], 599226), e.s(["default", 0, e => {
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
    }], 432528)
}, 223808, (e, t, a) => {
    var i = 0 / 0,
        n = /^\s+|\s+$/g,
        r = /^[-+]0x[0-9a-f]+$/i,
        l = /^0b[01]+$/i,
        u = /^0o[0-7]+$/i,
        o = parseInt,
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
        return s || u.test(e) ? o(e.slice(2), s ? 2 : 8) : r.test(e) ? i : +e
    }
    t.exports = function(e, t, a) {
        var i, n, r, l, u, o, s = 0,
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
            var a = e - o,
                i = e - s;
            return void 0 === o || a >= t || a < 0 || c && i >= r
        }

        function E() {
            var e, a, i, n = p();
            if (b(n)) return x(n);
            u = setTimeout(E, (e = n - o, a = n - s, i = t - e, c ? h(i, r - a) : i))
        }

        function x(e) {
            return (u = void 0, f && i) ? y(e) : (i = n = void 0, l)
        }

        function S() {
            var e, a = p(),
                r = b(a);
            if (i = arguments, n = this, o = a, r) {
                if (void 0 === u) return s = e = o, u = setTimeout(E, t), d ? y(e) : l;
                if (c) return u = setTimeout(E, t), y(o)
            }
            return void 0 === u && (u = setTimeout(E, t)), l
        }
        return t = g(t) || 0, v(a) && (d = !!a.leading, r = (c = "maxWait" in a) ? m(g(a.maxWait) || 0, t) : r, f = "trailing" in a ? !!a.trailing : f), S.cancel = function() {
            void 0 !== u && clearTimeout(u), s = 0, i = o = n = u = void 0
        }, S.flush = function() {
            return void 0 === u ? l : x(p())
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
        } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}, l = e => i ? n : window.matchMedia(e).matches, [u, o] = (0, t.useState)(() => r ? l(e) : n);

        function s() {
            o(l(e))
        }
        return a(() => {
            let t = window.matchMedia(e);
            return s(), t.addListener ? t.addListener(s) : t.addEventListener("change", s), () => {
                t.removeListener ? t.removeListener(s) : t.removeEventListener("change", s)
            }
        }, [e]), u
    }])
}]);

//# debugId=1a274d32-16a6-db10-9721-bd8b57188850
//# sourceMappingURL=37z1_24gonlvj.js.map
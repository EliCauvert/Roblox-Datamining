;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "3b2f351d-40a4-f42d-06ad-21ab1fc5ac41")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 223808, (e, t, a) => {
    var i = 0 / 0,
        n = /^\s+|\s+$/g,
        r = /^[-+]0x[0-9a-f]+$/i,
        l = /^0b[01]+$/i,
        o = /^0o[0-7]+$/i,
        u = parseInt,
        d = e.g && e.g.Object === Object && e.g,
        s = "object" == typeof self && self && self.Object === Object && self,
        c = d || s || Function("return this")(),
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
        var d = l.test(e);
        return d || o.test(e) ? u(e.slice(2), d ? 2 : 8) : r.test(e) ? i : +e
    }
    t.exports = function(e, t, a) {
        var i, n, r, l, o, u, d = 0,
            s = !1,
            c = !1,
            f = !0;
        if ("function" != typeof e) throw TypeError("Expected a function");

        function y(t) {
            var a = i,
                r = n;
            return i = n = void 0, d = t, l = e.apply(r, a)
        }

        function b(e) {
            var a = e - u,
                i = e - d;
            return void 0 === u || a >= t || a < 0 || c && i >= r
        }

        function E() {
            var e, a, i, n = p();
            if (b(n)) return x(n);
            o = setTimeout(E, (e = n - u, a = n - d, i = t - e, c ? h(i, r - a) : i))
        }

        function x(e) {
            return (o = void 0, f && i) ? y(e) : (i = n = void 0, l)
        }

        function S() {
            var e, a = p(),
                r = b(a);
            if (i = arguments, n = this, u = a, r) {
                if (void 0 === o) return d = e = u, o = setTimeout(E, t), s ? y(e) : l;
                if (c) return o = setTimeout(E, t), y(u)
            }
            return void 0 === o && (o = setTimeout(E, t)), l
        }
        return t = g(t) || 0, v(a) && (s = !!a.leading, r = (c = "maxWait" in a) ? m(g(a.maxWait) || 0, t) : r, f = "trailing" in a ? !!a.trailing : f), S.cancel = function() {
            void 0 !== o && clearTimeout(o), d = 0, i = u = n = o = void 0
        }, S.flush = function() {
            return void 0 === o ? l : x(p())
        }, S
    }
}, 897350, e => {
    "use strict";
    var t = e.i(708064),
        a = e.i(256539),
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
                overlayClassName: d,
                contentClassName: s,
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
                className: (0, i.default)("fui-base-sheet-overlay", "foundation-web-portal-zindex fixed inset-[0] flex", d)
            }, n.default.createElement(r.Content, {
                "data-testid": "fui-base-sheet-content",
                className: (0, i.default)("fui-base-sheet-content relative bg-surface-100 stroke-muted stroke-standard shadow-transient-high", "flex flex-col clip", s),
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
    var u = e.i(199512);
    e.i(223808);
    var d = "u" > typeof window ? n.useLayoutEffect : n.useEffect,
        s = "u" < typeof window;

    function c(e) {
        let {
            defaultValue: t = !1,
            initializeWithValue: a = !0
        } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}, i = e => s ? t : window.matchMedia(e).matches, [r, l] = (0, n.useState)(() => a ? i(e) : t);

        function o() {
            l(i(e))
        }
        return d(() => {
            let t = window.matchMedia(e);
            return o(), t.addListener ? t.addListener(o) : t.addEventListener("change", o), () => {
                t.removeListener ? t.removeListener(o) : t.removeEventListener("change", o)
            }
        }, [e]), r
    }
    let f = (0, n.createContext)(null),
        m = () => {
            let e = (0, n.useContext)(f);
            if (!e) throw Error("Sheet components must be used within a Sheet");
            return e
        },
        h = "padding-x-xlarge",
        p = (0, n.forwardRef)((e, t) => {
            let {
                children: a,
                className: r,
                hasPaddingX: l = !0,
                ...o
            } = e, {
                type: u
            } = m();
            return n.default.createElement("div", {
                ref: t,
                className: (0, i.default)("scroll-y", l && h, "sideSheet" === u ? "grow-1" : "", r),
                ...o
            }, a)
        });
    p.displayName = "SheetBody", e.s(["SheetActions", 0, e => {
        let {
            children: t,
            className: r,
            ...l
        } = e;
        return n.default.createElement(n.default.Fragment, null, n.default.createElement(a.Divider, null), n.default.createElement("div", {
            className: (0, i.default)(h, "margin-y-small shrink-0", r),
            ...l
        }, t))
    }, "SheetBody", 0, p, "SheetContent", 0, e => {
        let t, {
                children: a,
                centerSheetSize: r = "Medium",
                largeScreenVariant: u = "center",
                closeLabel: d,
                className: s,
                mobilePortraitClassName: m,
                mobileLandscapeClassName: h,
                largeScreenClassName: p,
                onOpenAutoFocus: v,
                onCloseAutoFocus: g,
                onPointerDownOutside: y,
                onEscapeKeyDown: b,
                onInteractOutside: E
            } = e,
            x = c("(orientation: portrait) and (max-width: 600px)"),
            S = c("(orientation: landscape) and (max-height: 600px)");
        t = x ? "bottomSheet" : S || "side" === u ? "sideSheet" : "centerSheet";
        let w = (0, n.useMemo)(() => ({
                centerSheetSize: r,
                largeScreenVariant: u,
                closeLabel: d,
                isPortraitMobile: x,
                isLandscapeMobile: S,
                type: t
            }), [r, u, d, x, S, t]),
            T = (0, i.default)(s, x && m, S && h, !x && !S && p);
        return n.default.createElement(f.Provider, {
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
            utilities: d,
            visuallyHideTitleText: s
        } = e, {
            closeLabel: c
        } = m(), f = n.default.createElement(r.Title, {
            className: "text-heading-small margin-none"
        }, l);
        return n.default.createElement("div", {
            className: (0, i.default)(a, o ? "padding-left-medium" : "padding-left-xlarge", "padding-right-small padding-y-small", "flex items-center justify-between")
        }, n.default.createElement("div", {
            className: (0, i.default)("flex items-center", o && "gap-xsmall")
        }, o, s ? n.default.createElement(u.VisuallyHidden, null, f) : f), n.default.createElement("div", {
            className: (0, i.default)("flex items-center", d && "gap-xxsmall")
        }, d, n.default.createElement("div", {
            className: "fui-sheet-close-affordance-container"
        }, n.default.createElement(r.Close, {
            asChild: !0
        }, n.default.createElement(t.IconButton, {
            variant: "Utility",
            size: "Medium",
            icon: "icon-regular-x",
            ariaLabel: c || "",
            "data-autofocus-priority": "1000"
        })))))
    }, "SheetTrigger", 0, e => n.default.createElement(r.Trigger, {
        asChild: !0,
        ...e
    })], 897350)
}]);

//# debugId=3b2f351d-40a4-f42d-06ad-21ab1fc5ac41
//# sourceMappingURL=3tsnl1eba1hdi.js.map
;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "a5b0dc2d-7e6f-ee6d-df81-8b3a48dff574")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 498072, (e, t, a) => {
    var l = /^\s+|\s+$/g,
        i = /^[-+]0x[0-9a-f]+$/i,
        n = /^0b[01]+$/i,
        r = /^0o[0-7]+$/i,
        o = parseInt,
        s = e.g && e.g.Object === Object && e.g,
        d = "object" == typeof self && self && self.Object === Object && self,
        u = s || d || Function("return this")(),
        c = Object.prototype.toString,
        m = Math.max,
        f = Math.min,
        g = function() {
            return u.Date.now()
        };

    function b(e) {
        var t = typeof e;
        return !!e && ("object" == t || "function" == t)
    }

    function p(e) {
        if ("number" == typeof e) return e;
        if ("symbol" == typeof(t = e) || t && "object" == typeof t && "[object Symbol]" == c.call(t)) return 0 / 0;
        if (b(e)) {
            var t, a = "function" == typeof e.valueOf ? e.valueOf() : e;
            e = b(a) ? a + "" : a
        }
        if ("string" != typeof e) return 0 === e ? e : +e;
        e = e.replace(l, "");
        var s = n.test(e);
        return s || r.test(e) ? o(e.slice(2), s ? 2 : 8) : i.test(e) ? 0 / 0 : +e
    }
    t.exports = function(e, t, a) {
        var l, i, n, r, o, s, d = 0,
            u = !1,
            c = !1,
            v = !0;
        if ("function" != typeof e) throw TypeError("Expected a function");

        function y(t) {
            var a = l,
                n = i;
            return l = i = void 0, d = t, r = e.apply(n, a)
        }

        function h(e) {
            var a = e - s,
                l = e - d;
            return void 0 === s || a >= t || a < 0 || c && l >= n
        }

        function x() {
            var e, a, l, i = g();
            if (h(i)) return w(i);
            o = setTimeout(x, (e = i - s, a = i - d, l = t - e, c ? f(l, n - a) : l))
        }

        function w(e) {
            return (o = void 0, v && l) ? y(e) : (l = i = void 0, r)
        }

        function E() {
            var e, a = g(),
                n = h(a);
            if (l = arguments, i = this, s = a, n) {
                if (void 0 === o) return d = e = s, o = setTimeout(x, t), u ? y(e) : r;
                if (c) return o = setTimeout(x, t), y(s)
            }
            return void 0 === o && (o = setTimeout(x, t)), r
        }
        return t = p(t) || 0, b(a) && (u = !!a.leading, n = (c = "maxWait" in a) ? m(p(a.maxWait) || 0, t) : n, v = "trailing" in a ? !!a.trailing : v), E.cancel = function() {
            void 0 !== o && clearTimeout(o), d = 0, l = s = i = o = void 0
        }, E.flush = function() {
            return void 0 === o ? r : w(g())
        }, E
    }
}, 29506, e => {
    "use strict";
    var t = e.i(643766);
    e.i(498072);
    var a = "u" > typeof window ? t.useLayoutEffect : t.useEffect,
        l = "u" < typeof window;
    e.s(["f", 0, function(e) {
        let {
            defaultValue: i = !1,
            initializeWithValue: n = !0
        } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}, r = e => l ? i : window.matchMedia(e).matches, [o, s] = (0, t.useState)(() => n ? r(e) : i);

        function d() {
            s(r(e))
        }
        return a(() => {
            let t = window.matchMedia(e);
            return d(), t.addListener ? t.addListener(d) : t.addEventListener("change", d), () => {
                t.removeListener ? t.removeListener(d) : t.removeEventListener("change", d)
            }
        }, [e]), o
    }])
}, 923499, e => {
    "use strict";
    var t = e.i(746878),
        a = e.i(206241),
        l = e.i(225885),
        i = e.i(335020),
        n = e.i(643766);
    let r = {
            Small: "XSmall",
            Medium: "Small"
        },
        o = {
            Small: "size-600",
            Medium: "size-800"
        },
        s = {
            Small: "text-label-small",
            Medium: "text-label-medium"
        },
        d = (e, t) => t ? "Page ".concat(e, ", current page") : "Go to page ".concat(e),
        u = (0, n.forwardRef)((e, t) => {
            let {
                currentPage: u,
                totalPages: c,
                onPageChange: m,
                navType: f = "MultiPage",
                size: g = "Medium",
                hasFirstLastButtons: b,
                firstPageLabel: p,
                previousPageLabel: v,
                nextPageLabel: y,
                lastPageLabel: h,
                pageLabel: x = d,
                isAlwaysVisible: w = !1,
                className: E,
                "aria-label": N,
                ...M
            } = e, S = Math.max(0, Math.floor(c)), T = Math.min(Math.max(1, Math.floor(u)), Math.max(1, S)), U = 0 === S || 1 === T, C = 0 === S || T === S;
            if (S <= 1 && !w) return null;
            let k = [];
            if ("MultiPage" === f) k = S <= 7 ? Array.from({
                length: S
            }, (e, t) => t + 1) : T <= 4 ? [1, 2, 3, 4, 5, "trailing-ellipsis", S] : T >= S - 3 ? [1, "leading-ellipsis", S - 4, S - 3, S - 2, S - 1, S] : [1, "leading-ellipsis", T - 1, T, T + 1, "trailing-ellipsis", S];
            else "SinglePage" === f && S > 0 && (k = [T]);
            let j = r[g];
            return n.default.createElement("nav", {
                ref: t,
                "aria-label": N,
                className: (0, i.U)("foundation-web-pagination inline-flex items-center gap-small", E),
                ...M
            }, n.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, b && n.default.createElement(l.f, {
                icon: "icon-regular-double-chevron-large-left",
                ariaLabel: p,
                size: j,
                variant: "Utility",
                isCircular: !0,
                isDisabled: U,
                onClick: () => m(1)
            }), n.default.createElement(l.f, {
                icon: "icon-regular-chevron-small-left",
                ariaLabel: v,
                size: j,
                variant: "Utility",
                isCircular: !0,
                isDisabled: U,
                onClick: () => m(T - 1)
            })), k.length > 0 && n.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, k.map(e => "number" != typeof e ? n.default.createElement("span", {
                key: e,
                "aria-hidden": "true",
                className: (0, i.U)("inline-flex items-center justify-center content-action-utility select-none", o[g], s[g])
            }, "…") : e === T ? n.default.createElement("span", {
                key: e,
                role: "img",
                "aria-current": "page",
                "aria-label": x(e, !0),
                className: (0, i.U)("inline-flex items-center justify-center radius-circle bg-inverse-surface-0 content-inverse-emphasis select-none", o[g], s[g])
            }, e) : n.default.createElement("button", {
                key: e,
                type: "button",
                "aria-label": x(e, !1),
                className: (0, i.U)("relative clip group/interactable focus-visible:outline-focus disabled:outline-none", "relative inline-flex items-center justify-center radius-circle stroke-none bg-none content-action-utility cursor-pointer", o[g], s[g]),
                onClick: () => m(e)
            }, n.default.createElement(a.v, null), e))), n.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, n.default.createElement(l.f, {
                icon: "icon-regular-chevron-small-right",
                ariaLabel: y,
                size: j,
                variant: "Utility",
                isCircular: !0,
                isDisabled: C,
                onClick: () => m(T + 1)
            }), b && n.default.createElement(l.f, {
                icon: "icon-regular-double-chevron-large-right",
                ariaLabel: h,
                size: j,
                variant: "Utility",
                isCircular: !0,
                isDisabled: C,
                onClick: () => m(S)
            })))
        });
    u.displayName = "Pagination";
    let c = (0, n.createContext)(null),
        m = e => {
            let t = (0, n.useContext)(c);
            if (!t) throw Error("".concat(e, " must be used within a <Table>"));
            return t
        },
        f = {
            XSmall: "height-800",
            Small: "height-1200",
            Medium: "height-1500"
        },
        g = {
            XSmall: "padding-x-medium",
            Small: "padding-x-large",
            Medium: "padding-x-xlarge"
        },
        b = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-small",
            Medium: "padding-y-medium"
        },
        p = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-medium"
        },
        v = {
            XSmall: "text-body-small",
            Small: "text-body-medium",
            Medium: "text-body-medium"
        },
        y = {
            start: "text-align-x-start",
            center: "text-align-x-center",
            end: "text-align-x-end"
        },
        h = {
            start: "justify-start",
            center: "justify-center",
            end: "justify-end"
        },
        x = (0, n.forwardRef)((e, t) => {
            let {
                children: a,
                size: l = "Medium",
                variant: r = "Divided",
                className: o,
                ...s
            } = e, d = (0, n.useMemo)(() => ({
                size: l,
                variant: r
            }), [l, r]), u = "Framed" === r;
            return n.default.createElement(c.Provider, {
                value: d
            }, n.default.createElement("div", {
                className: (0, i.U)("width-full bg-surface-100", u && "radius-medium clip stroke-standard stroke-default")
            }, n.default.createElement("table", {
                ref: t,
                className: (0, i.U)("foundation-web-table width-full content-default", o),
                ...s
            }, a)))
        });
    x.displayName = "Table";
    let w = (0, n.forwardRef)((e, t) => {
        let {
            children: a,
            className: l,
            ...r
        } = e;
        return m("TableHeader"), n.default.createElement("thead", {
            ref: t,
            className: (0, i.U)("foundation-web-table-header", l),
            ...r
        }, a)
    });
    w.displayName = "TableHeader";
    let E = (0, n.forwardRef)((e, t) => {
        let {
            children: a,
            className: l,
            ...r
        } = e;
        return m("TableBody"), n.default.createElement("tbody", {
            ref: t,
            className: (0, i.U)("foundation-web-table-body", l),
            ...r
        }, a)
    });
    E.displayName = "TableBody";
    let N = (0, n.forwardRef)((e, t) => {
        let {
            children: a,
            className: l,
            isInteractive: r = !1,
            isHoverable: o = !1,
            isSelected: s = !1,
            isDisabled: d = !1,
            onClick: u,
            onKeyDown: c,
            tabIndex: f,
            role: g,
            ...b
        } = e;
        m("TableRow");
        let p = r ? {
            role: null != g ? g : "row",
            tabIndex: null != f ? f : 0,
            onClick: d ? void 0 : u,
            onKeyDown: e => {
                d || (null == c || c(e), e.defaultPrevented || ("Enter" === e.key || " " === e.key) && (e.preventDefault(), null == u || u(e)))
            }
        } : {
            role: g,
            tabIndex: f,
            onClick: u,
            onKeyDown: c
        };
        return n.default.createElement("tr", {
            ref: t,
            "aria-selected": r ? s : void 0,
            "aria-disabled": !!r && !!d || void 0,
            "data-selected": s || void 0,
            className: (0, i.U)("foundation-web-table-row", (r || o) && "hover:bg-shift-100", r && !d && "cursor-pointer", r && d && "opacity-disabled pointer-events-none", s && "bg-shift-200", l),
            ...p,
            ...b
        }, a)
    });
    N.displayName = "TableRow";
    let M = (0, n.forwardRef)((e, a) => {
        let {
            children: l,
            className: r,
            sortDirection: o,
            onSort: s,
            align: d = "start",
            sortLabel: u,
            scope: c,
            ...f
        } = e, {
            size: v
        } = m("TableHeaderCell"), x = !!s, w = null != o ? o : "none", E = x && "none" !== w && n.default.createElement(t.f, {
            name: "ascending" === w ? "icon-regular-arrow-small-up" : "icon-regular-arrow-small-down",
            size: "XSmall",
            className: "shrink-0 content-muted"
        }), N = n.default.createElement("div", {
            className: (0, i.U)("flex items-center gap-xsmall", p[v], "content-muted", h[d])
        }, "end" === d && E, n.default.createElement("span", {
            className: "text-truncate-end"
        }, l), "end" !== d && E), M = "string" == typeof l ? "Sort by ".concat(l) : void 0;
        return n.default.createElement("th", {
            ref: a,
            scope: null != c ? c : "col",
            "aria-sort": x ? w : void 0,
            className: (0, i.U)("foundation-web-table-header-cell foundation-web-table-header-cell-divider", b[v], g[v], y[d], "content-muted", r),
            ...f
        }, x ? n.default.createElement("button", {
            type: "button",
            className: "bg-none stroke-none padding-none margin-none cursor-pointer width-full content-inherit [font:inherit] [text-align:inherit] focus-visible:outline-focus hover:content-default hover:bg-shift-100 radius-small",
            onClick: s,
            "aria-label": null != u ? u : M
        }, N) : N)
    });
    M.displayName = "TableHeaderCell";
    let S = (0, n.forwardRef)((e, t) => {
        let {
            children: a,
            className: l,
            align: r = "start",
            ...o
        } = e, {
            size: s
        } = m("TableCell");
        return n.default.createElement("td", {
            ref: t,
            className: (0, i.U)("foundation-web-table-cell foundation-web-table-row-divider", f[s], g[s], v[s], y[r], "content-default", l),
            ...o
        }, a)
    });
    S.displayName = "TableCell";
    let T = {
            XSmall: "padding-x-small",
            Small: "padding-x-medium",
            Medium: "padding-x-large"
        },
        U = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-small",
            Medium: "padding-y-medium"
        },
        C = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-small"
        },
        k = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium"
        },
        j = (0, n.forwardRef)((e, t) => {
            let {
                size: a = "Medium",
                page: l,
                rowsPerPage: r,
                totalRows: o,
                rowsPerPageOptions: s = [10, 25, 50],
                onPageChange: d,
                onRowsPerPageChange: c,
                paginationAriaLabel: m,
                rowsPerPageLabel: f = "Rows per page",
                firstPageLabel: g = "First page",
                previousPageLabel: b = "Previous page",
                nextPageLabel: p = "Next page",
                lastPageLabel: v = "Last page",
                rangeLabel: y,
                className: h,
                ...x
            } = e, w = Math.max(1, Math.ceil(o / r)), E = 0 === o ? 0 : l * r + 1, N = Math.min((l + 1) * r, o), M = (0, n.useCallback)(e => {
                let t = Number(e.target.value);
                null == c || c(t), d(0)
            }, [c, d]);
            return n.default.createElement("div", {
                ref: t,
                className: (0, i.U)("flex items-center justify-end", T[a], U[a], h),
                ...x
            }, n.default.createElement("div", {
                className: "flex items-center gap-large"
            }, n.default.createElement("div", {
                className: "flex items-center gap-xlarge"
            }, c && n.default.createElement("div", {
                className: "flex items-center gap-small"
            }, n.default.createElement("span", {
                className: (0, i.U)(C[a], "content-default")
            }, f), n.default.createElement("div", {
                className: "foundation-web-table-pagination-select-wrapper relative"
            }, n.default.createElement("select", {
                className: (0, i.U)("foundation-web-table-pagination-select", C[a], "content-default bg-action-standard radius-small cursor-pointer", "Medium" === a ? "height-800 padding-x-medium" : "height-600 padding-x-small"),
                value: r,
                onChange: M,
                "aria-label": f
            }, s.map(e => n.default.createElement("option", {
                key: e,
                value: e
            }, e))))), n.default.createElement("span", {
                className: (0, i.U)(k[a], "content-default")
            }, y ? y(E, N, o) : "".concat(E, "-").concat(N, " of ").concat(o))), n.default.createElement(u, {
                "aria-label": m,
                currentPage: l + 1,
                totalPages: w,
                navType: "NoPage",
                size: "Medium" === a ? "Medium" : "Small",
                hasFirstLastButtons: !0,
                isAlwaysVisible: !0,
                firstPageLabel: g,
                previousPageLabel: b,
                nextPageLabel: p,
                lastPageLabel: v,
                onPageChange: e => d(e - 1)
            })))
        });
    j.displayName = "TablePagination", e.s(["s", 0, x, "z", 0, E, "d", 0, S, "E", 0, w, "U", 0, M, "c", 0, j, "N", 0, N], 923499)
}]);

//# debugId=a5b0dc2d-7e6f-ee6d-df81-8b3a48dff574
//# sourceMappingURL=27e-iob8qm2_7.js.map
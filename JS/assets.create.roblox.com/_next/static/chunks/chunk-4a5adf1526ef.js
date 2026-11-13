;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "72b3ece8-f4bd-1bfa-e954-b915f17165ce")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 498072, (e, t, a) => {
    var l = /^\s+|\s+$/g,
        i = /^[-+]0x[0-9a-f]+$/i,
        n = /^0b[01]+$/i,
        r = /^0o[0-7]+$/i,
        d = parseInt,
        s = e.g && e.g.Object === Object && e.g,
        u = "object" == typeof self && self && self.Object === Object && self,
        o = s || u || Function("return this")(),
        m = Object.prototype.toString,
        c = Math.max,
        f = Math.min,
        g = function() {
            return o.Date.now()
        };

    function p(e) {
        var t = typeof e;
        return !!e && ("object" == t || "function" == t)
    }

    function b(e) {
        if ("number" == typeof e) return e;
        if ("symbol" == typeof(t = e) || t && "object" == typeof t && "[object Symbol]" == m.call(t)) return 0 / 0;
        if (p(e)) {
            var t, a = "function" == typeof e.valueOf ? e.valueOf() : e;
            e = p(a) ? a + "" : a
        }
        if ("string" != typeof e) return 0 === e ? e : +e;
        e = e.replace(l, "");
        var s = n.test(e);
        return s || r.test(e) ? d(e.slice(2), s ? 2 : 8) : i.test(e) ? 0 / 0 : +e
    }
    t.exports = function(e, t, a) {
        var l, i, n, r, d, s, u = 0,
            o = !1,
            m = !1,
            v = !0;
        if ("function" != typeof e) throw TypeError("Expected a function");

        function h(t) {
            var a = l,
                n = i;
            return l = i = void 0, u = t, r = e.apply(n, a)
        }

        function y(e) {
            var a = e - s,
                l = e - u;
            return void 0 === s || a >= t || a < 0 || m && l >= n
        }

        function x() {
            var e, a, l, i = g();
            if (y(i)) return E(i);
            d = setTimeout(x, (e = i - s, a = i - u, l = t - e, m ? f(l, n - a) : l))
        }

        function E(e) {
            return (d = void 0, v && l) ? h(e) : (l = i = void 0, r)
        }

        function w() {
            var e, a = g(),
                n = y(a);
            if (l = arguments, i = this, s = a, n) {
                if (void 0 === d) return u = e = s, d = setTimeout(x, t), o ? h(e) : r;
                if (m) return d = setTimeout(x, t), h(s)
            }
            return void 0 === d && (d = setTimeout(x, t)), r
        }
        return t = b(t) || 0, p(a) && (o = !!a.leading, n = (m = "maxWait" in a) ? c(b(a.maxWait) || 0, t) : n, v = "trailing" in a ? !!a.trailing : v), w.cancel = function() {
            void 0 !== d && clearTimeout(d), u = 0, l = s = i = d = void 0
        }, w.flush = function() {
            return void 0 === d ? r : E(g())
        }, w
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
        } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}, r = e => l ? i : window.matchMedia(e).matches, [d, s] = (0, t.useState)(() => n ? r(e) : i);

        function u() {
            s(r(e))
        }
        return a(() => {
            let t = window.matchMedia(e);
            return u(), t.addListener ? t.addListener(u) : t.addEventListener("change", u), () => {
                t.removeListener ? t.removeListener(u) : t.removeEventListener("change", u)
            }
        }, [e]), d
    }])
}, 357667, e => {
    "use strict";
    var t = e.i(27213),
        a = e.i(94302),
        l = e.i(154570),
        i = e.i(397706),
        n = e.i(335020),
        r = e.i(643766),
        d = e.i(637068);
    let s = {
            Small: "XSmall",
            Medium: "Small",
            Large: "Medium"
        },
        u = {
            Small: ["height-600", "text-label-small"],
            Medium: ["height-800", "text-label-medium"],
            Large: ["height-1000", "text-label-medium"]
        },
        o = {
            Small: "padding-left-small",
            Medium: "padding-left-medium",
            Large: "padding-left-large"
        },
        m = {
            Small: "padding-left-small",
            Medium: "padding-left-medium",
            Large: "padding-left-medium"
        },
        c = {
            Small: "padding-right-small",
            Medium: "padding-right-medium",
            Large: "padding-right-large"
        },
        f = {
            Small: "padding-right-small",
            Medium: "padding-right-medium",
            Large: "padding-right-medium"
        },
        g = {
            Small: "padding-left-xsmall",
            Medium: "padding-left-[var(--size-150)]",
            Large: "padding-left-small"
        },
        p = {
            Small: "padding-right-[var(--size-150)]",
            Medium: "padding-right-small",
            Large: "padding-right-[var(--size-250)]"
        },
        b = {
            Standard: "bg-shift-300",
            Utility: "bg-none"
        },
        v = {
            Small: "size-[var(--icon-size-xsmall)]",
            Medium: "size-[var(--icon-size-small)]",
            Large: "size-[var(--icon-size-medium)]"
        },
        h = e => {
            let {
                iconName: t,
                node: a,
                size: i
            } = e;
            return null != t ? r.default.createElement(l.f, {
                name: t,
                size: s[i]
            }) : null != a ? r.default.createElement("span", {
                className: (0, n.U)("inline-flex items-center justify-center shrink-0", v[i])
            }, a) : null
        },
        y = (0, r.forwardRef)((e, l) => {
            var s;
            let {
                className: v,
                style: y,
                text: x,
                isDisabled: E = !1,
                size: w = "Medium",
                variant: M = "Standard",
                leadingIconName: N,
                leadingIconNode: S,
                trailingIconName: C,
                trailingIconNode: U,
                ...k
            } = e, T = (0, r.useContext)(i.f), L = null != (s = null == T ? void 0 : T.size) ? s : w, z = E || (null == T ? void 0 : T.isDisabled) || !1, j = null != N || null != S, P = null != C || null != U, R = (0, n.U)(z ? a.f : [t.Y, "cursor-pointer"], "relative flex justify-center items-center radius-circle stroke-none", j ? m[L] : o[L], P ? f[L] : c[L], u[L], v), D = r.default.createElement(r.default.Fragment, null, r.default.createElement(t.v, null), r.default.createElement(h, {
                iconName: N,
                node: S,
                size: L
            }), r.default.createElement("span", {
                className: (0, n.U)("padding-y-xsmall text-no-wrap text-truncate-end", j && g[L], P && p[L])
            }, x), r.default.createElement(h, {
                iconName: C,
                node: U,
                size: L
            })), X = {
                textDecoration: "none",
                ...y
            };
            if (k.asChild) {
                let {
                    as: e,
                    asChild: t,
                    children: a,
                    ...i
                } = k, s = r.default.Children.only(a), u = e => {
                    e.preventDefault(), e.stopPropagation()
                };
                return r.default.createElement(d.M, {
                    ref: l,
                    ...i,
                    "aria-disabled": z || void 0,
                    tabIndex: z ? -1 : i.tabIndex,
                    onClickCapture: z ? u : i.onClickCapture,
                    onAuxClickCapture: z ? u : i.onAuxClickCapture,
                    className: (0, n.U)(R, b[M], "content-action-utility"),
                    style: X
                }, r.default.cloneElement(s, {}, D))
            }
            if ("a" === k.as) {
                let {
                    as: e,
                    href: t,
                    ...a
                } = k;
                return r.default.createElement("a", {
                    ref: l,
                    ...a,
                    "aria-disabled": z,
                    href: z ? void 0 : t,
                    className: (0, n.U)(R, b[M], "content-action-utility"),
                    style: X
                }, D)
            }
            let {
                as: O,
                isChecked: A,
                onCheckedChange: B,
                ...F
            } = k;
            return r.default.createElement("button", {
                ref: l,
                type: "button",
                ...F,
                className: (0, n.U)(A ? "bg-inverse-surface-0" : b[M], A ? "content-inverse-emphasis" : "content-action-utility", R),
                style: X,
                "aria-pressed": A,
                disabled: z,
                onClick: null == B ? void 0 : () => B(!A)
            }, D)
        });
    e.s(["f", 0, y])
}, 402467, e => {
    "use strict";
    var t = e.i(154570),
        a = e.i(27213),
        l = e.i(331420),
        i = e.i(335020),
        n = e.i(643766);
    let r = {
            Small: "XSmall",
            Medium: "Small"
        },
        d = {
            Small: "size-600",
            Medium: "size-800"
        },
        s = {
            Small: "text-label-small",
            Medium: "text-label-medium"
        },
        u = (e, t) => t ? "Page ".concat(e, ", current page") : "Go to page ".concat(e),
        o = (0, n.forwardRef)((e, t) => {
            let {
                currentPage: o,
                totalPages: m,
                onPageChange: c,
                navType: f = "MultiPage",
                size: g = "Medium",
                hasFirstLastButtons: p,
                firstPageLabel: b,
                previousPageLabel: v,
                nextPageLabel: h,
                lastPageLabel: y,
                pageLabel: x = u,
                isAlwaysVisible: E = !1,
                className: w,
                "aria-label": M,
                ...N
            } = e, S = Math.max(0, Math.floor(m)), C = Math.min(Math.max(1, Math.floor(o)), Math.max(1, S)), U = 0 === S || 1 === C, k = 0 === S || C === S;
            if (S <= 1 && !E) return null;
            let T = [];
            if ("MultiPage" === f) T = S <= 7 ? Array.from({
                length: S
            }, (e, t) => t + 1) : C <= 4 ? [1, 2, 3, 4, 5, "trailing-ellipsis", S] : C >= S - 3 ? [1, "leading-ellipsis", S - 4, S - 3, S - 2, S - 1, S] : [1, "leading-ellipsis", C - 1, C, C + 1, "trailing-ellipsis", S];
            else "SinglePage" === f && S > 0 && (T = [C]);
            let L = r[g];
            return n.default.createElement("nav", {
                ref: t,
                "aria-label": M,
                className: (0, i.U)("foundation-web-pagination inline-flex items-center gap-small", w),
                ...N
            }, n.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, p && n.default.createElement(l.f, {
                icon: "icon-regular-double-chevron-large-left",
                ariaLabel: b,
                size: L,
                variant: "Utility",
                isCircular: !0,
                isDisabled: U,
                onClick: () => c(1)
            }), n.default.createElement(l.f, {
                icon: "icon-regular-chevron-small-left",
                ariaLabel: v,
                size: L,
                variant: "Utility",
                isCircular: !0,
                isDisabled: U,
                onClick: () => c(C - 1)
            })), T.length > 0 && n.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, T.map(e => "number" != typeof e ? n.default.createElement("span", {
                key: e,
                "aria-hidden": "true",
                className: (0, i.U)("inline-flex items-center justify-center content-action-utility select-none", d[g], s[g])
            }, "…") : e === C ? n.default.createElement("span", {
                key: e,
                role: "img",
                "aria-current": "page",
                "aria-label": x(e, !0),
                className: (0, i.U)("inline-flex items-center justify-center radius-circle bg-inverse-surface-0 content-inverse-emphasis select-none", d[g], s[g])
            }, e) : n.default.createElement("button", {
                key: e,
                type: "button",
                "aria-label": x(e, !1),
                className: (0, i.U)("relative clip group/interactable focus-visible:outline-focus disabled:outline-none", "relative inline-flex items-center justify-center radius-circle stroke-none bg-none content-action-utility cursor-pointer", d[g], s[g]),
                onClick: () => c(e)
            }, n.default.createElement(a.v, null), e))), n.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, n.default.createElement(l.f, {
                icon: "icon-regular-chevron-small-right",
                ariaLabel: h,
                size: L,
                variant: "Utility",
                isCircular: !0,
                isDisabled: k,
                onClick: () => c(C + 1)
            }), p && n.default.createElement(l.f, {
                icon: "icon-regular-double-chevron-large-right",
                ariaLabel: y,
                size: L,
                variant: "Utility",
                isCircular: !0,
                isDisabled: k,
                onClick: () => c(S)
            })))
        });
    o.displayName = "Pagination";
    let m = (0, n.createContext)(null),
        c = e => {
            let t = (0, n.useContext)(m);
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
        p = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-small",
            Medium: "padding-y-medium"
        },
        b = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-medium"
        },
        v = {
            XSmall: "text-body-small",
            Small: "text-body-medium",
            Medium: "text-body-medium"
        },
        h = {
            start: "text-align-x-start",
            center: "text-align-x-center",
            end: "text-align-x-end"
        },
        y = {
            start: "justify-start",
            center: "justify-center",
            end: "justify-end"
        },
        x = (0, n.forwardRef)((e, t) => {
            let {
                children: a,
                size: l = "Medium",
                variant: r = "Divided",
                className: d,
                ...s
            } = e, u = (0, n.useMemo)(() => ({
                size: l,
                variant: r
            }), [l, r]), o = "Framed" === r;
            return n.default.createElement(m.Provider, {
                value: u
            }, n.default.createElement("div", {
                className: (0, i.U)("width-full bg-surface-100", o && "radius-medium clip stroke-standard stroke-default")
            }, n.default.createElement("table", {
                ref: t,
                className: (0, i.U)("foundation-web-table width-full content-default", d),
                ...s
            }, a)))
        });
    x.displayName = "Table";
    let E = (0, n.forwardRef)((e, t) => {
        let {
            children: a,
            className: l,
            ...r
        } = e;
        return c("TableHeader"), n.default.createElement("thead", {
            ref: t,
            className: (0, i.U)("foundation-web-table-header", l),
            ...r
        }, a)
    });
    E.displayName = "TableHeader";
    let w = (0, n.forwardRef)((e, t) => {
        let {
            children: a,
            className: l,
            ...r
        } = e;
        return c("TableBody"), n.default.createElement("tbody", {
            ref: t,
            className: (0, i.U)("foundation-web-table-body", l),
            ...r
        }, a)
    });
    w.displayName = "TableBody";
    let M = (0, n.forwardRef)((e, t) => {
        let {
            children: a,
            className: l,
            isInteractive: r = !1,
            isHoverable: d = !1,
            isSelected: s = !1,
            isDisabled: u = !1,
            onClick: o,
            onKeyDown: m,
            tabIndex: f,
            role: g,
            ...p
        } = e;
        c("TableRow");
        let b = r ? {
            role: null != g ? g : "row",
            tabIndex: null != f ? f : 0,
            onClick: u ? void 0 : o,
            onKeyDown: e => {
                u || (null == m || m(e), e.defaultPrevented || ("Enter" === e.key || " " === e.key) && (e.preventDefault(), null == o || o(e)))
            }
        } : {
            role: g,
            tabIndex: f,
            onClick: o,
            onKeyDown: m
        };
        return n.default.createElement("tr", {
            ref: t,
            "aria-selected": r ? s : void 0,
            "aria-disabled": !!r && !!u || void 0,
            "data-selected": s || void 0,
            className: (0, i.U)("foundation-web-table-row", (r || d) && "hover:bg-shift-100", r && !u && "cursor-pointer", r && u && "opacity-disabled pointer-events-none", s && "bg-shift-200", l),
            ...b,
            ...p
        }, a)
    });
    M.displayName = "TableRow";
    let N = (0, n.forwardRef)((e, a) => {
        let {
            children: l,
            className: r,
            sortDirection: d,
            onSort: s,
            align: u = "start",
            sortLabel: o,
            scope: m,
            ...f
        } = e, {
            size: v
        } = c("TableHeaderCell"), x = !!s, E = null != d ? d : "none", w = x && "none" !== E && n.default.createElement(t.f, {
            name: "ascending" === E ? "icon-regular-arrow-small-up" : "icon-regular-arrow-small-down",
            size: "XSmall",
            className: "shrink-0 content-muted"
        }), M = n.default.createElement("div", {
            className: (0, i.U)("flex items-center gap-xsmall", b[v], "content-muted", y[u])
        }, "end" === u && w, n.default.createElement("span", {
            className: "text-truncate-end"
        }, l), "end" !== u && w), N = "string" == typeof l ? "Sort by ".concat(l) : void 0;
        return n.default.createElement("th", {
            ref: a,
            scope: null != m ? m : "col",
            "aria-sort": x ? E : void 0,
            className: (0, i.U)("foundation-web-table-header-cell foundation-web-table-header-cell-divider", p[v], g[v], h[u], "content-muted", r),
            ...f
        }, x ? n.default.createElement("button", {
            type: "button",
            className: "bg-none stroke-none padding-none margin-none cursor-pointer width-full content-inherit [font:inherit] [text-align:inherit] focus-visible:outline-focus hover:content-default hover:bg-shift-100 radius-small",
            onClick: s,
            "aria-label": null != o ? o : N
        }, M) : M)
    });
    N.displayName = "TableHeaderCell";
    let S = (0, n.forwardRef)((e, t) => {
        let {
            children: a,
            className: l,
            align: r = "start",
            ...d
        } = e, {
            size: s
        } = c("TableCell");
        return n.default.createElement("td", {
            ref: t,
            className: (0, i.U)("foundation-web-table-cell foundation-web-table-row-divider", f[s], g[s], v[s], h[r], "content-default", l),
            ...d
        }, a)
    });
    S.displayName = "TableCell";
    let C = {
            XSmall: "padding-x-small",
            Small: "padding-x-medium",
            Medium: "padding-x-large"
        },
        U = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-small",
            Medium: "padding-y-medium"
        },
        k = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-small"
        },
        T = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium"
        },
        L = (0, n.forwardRef)((e, t) => {
            let {
                size: a = "Medium",
                page: l,
                rowsPerPage: r,
                totalRows: d,
                rowsPerPageOptions: s = [10, 25, 50],
                onPageChange: u,
                onRowsPerPageChange: m,
                paginationAriaLabel: c,
                rowsPerPageLabel: f = "Rows per page",
                firstPageLabel: g = "First page",
                previousPageLabel: p = "Previous page",
                nextPageLabel: b = "Next page",
                lastPageLabel: v = "Last page",
                rangeLabel: h,
                className: y,
                ...x
            } = e, E = Math.max(1, Math.ceil(d / r)), w = 0 === d ? 0 : l * r + 1, M = Math.min((l + 1) * r, d), N = (0, n.useCallback)(e => {
                let t = Number(e.target.value);
                null == m || m(t), u(0)
            }, [m, u]);
            return n.default.createElement("div", {
                ref: t,
                className: (0, i.U)("flex items-center justify-end", C[a], U[a], y),
                ...x
            }, n.default.createElement("div", {
                className: "flex items-center gap-large"
            }, n.default.createElement("div", {
                className: "flex items-center gap-xlarge"
            }, m && n.default.createElement("div", {
                className: "flex items-center gap-small"
            }, n.default.createElement("span", {
                className: (0, i.U)(k[a], "content-default")
            }, f), n.default.createElement("div", {
                className: "foundation-web-table-pagination-select-wrapper relative"
            }, n.default.createElement("select", {
                className: (0, i.U)("foundation-web-table-pagination-select", k[a], "content-default bg-action-standard radius-small cursor-pointer", "Medium" === a ? "height-800 padding-x-medium" : "height-600 padding-x-small"),
                value: r,
                onChange: N,
                "aria-label": f
            }, s.map(e => n.default.createElement("option", {
                key: e,
                value: e
            }, e))))), n.default.createElement("span", {
                className: (0, i.U)(T[a], "content-default")
            }, h ? h(w, M, d) : "".concat(w, "-").concat(M, " of ").concat(d))), n.default.createElement(o, {
                "aria-label": c,
                currentPage: l + 1,
                totalPages: E,
                navType: "NoPage",
                size: "Medium" === a ? "Medium" : "Small",
                hasFirstLastButtons: !0,
                isAlwaysVisible: !0,
                firstPageLabel: g,
                previousPageLabel: p,
                nextPageLabel: b,
                lastPageLabel: v,
                onPageChange: e => u(e - 1)
            })))
        });
    L.displayName = "TablePagination", e.s(["s", 0, x, "z", 0, w, "d", 0, S, "E", 0, E, "U", 0, N, "c", 0, L, "N", 0, M], 402467)
}]);

//# debugId=72b3ece8-f4bd-1bfa-e954-b915f17165ce
//# sourceMappingURL=1b0kfpzp5yp92.js.map
;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "444b64cf-6f6c-9663-35d1-b2f4890672ce")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 180535, e => {
    "use strict";
    var a = e.i(820520),
        t = e.i(328535),
        l = e.i(835315),
        n = e.i(202621),
        i = e.i(813555),
        r = e.i(335020),
        o = e.i(643766),
        d = e.i(548223);
    let s = (0, o.createContext)(null),
        c = {
            XSmall: "size-300",
            Small: "size-400",
            Medium: "size-500",
            Large: "size-600"
        },
        u = {
            XSmall: "padding-x-medium",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-large"
        },
        m = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-medium",
            Large: "text-title-large"
        },
        p = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        f = {
            XSmall: "gap-xsmall",
            Small: "gap-small",
            Medium: "gap-small",
            Large: "gap-small"
        },
        g = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        h = {
            XSmall: "height-600",
            Small: "height-800",
            Medium: "height-1000",
            Large: "height-1200"
        },
        v = (0, o.forwardRef)((e, v) => {
            let {
                label: x,
                labelTooltip: b,
                ariaLabelledBy: w,
                ariaLabel: S,
                className: E,
                size: k,
                variant: y = "Standard",
                value: M,
                placeholder: C,
                isDisabled: N,
                hasError: z,
                hint: L,
                onValueChange: W,
                onOpenChange: D,
                children: X
            } = e, P = (0, t.f)(), [U, R] = (0, o.useState)(!1), [_, F] = (0, o.useState)(!1), B = void 0 !== M && "" !== M || U;
            (0, o.useEffect)(() => {
                let e = e => {
                        (0, n.f)(e) && F(!0)
                    },
                    a = () => F(!1);
                return window.addEventListener("keydown", e, !0), window.addEventListener("pointerdown", a, !0), () => {
                    window.removeEventListener("keydown", e, !0), window.removeEventListener("pointerdown", a, !0)
                }
            }, []);
            let j = (0, o.useMemo)(() => ({
                    size: k,
                    hasSelection: B,
                    isKeyboardNavigation: _
                }), [k, B, _]),
                T = x ? o.default.createElement("span", {
                    id: P,
                    className: (0, r.U)(m[k], "content-emphasis")
                }, x) : null;
            return o.default.createElement(s.Provider, {
                value: j
            }, o.default.createElement("div", {
                className: (0, r.U)("flex flex-col", N && ["opacity-[0.5]", "pointer-events-none"], f[k], E)
            }, T && (b ? o.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, T, o.default.createElement(l.f, b)) : T), o.default.createElement(d.F, {
                value: M,
                disabled: N,
                onValueChange: e => {
                    void 0 === M && R(!0), null == W || W(e)
                },
                onOpenChange: D
            }, o.default.createElement(d.d, {
                onPointerDownCapture: () => F(!1),
                className: (0, r.U)("relative clip group/interactable outline-none", "foundation-web-input flex items-center justify-between width-full cursor-pointer", i.L[y], i.U[y], g[k], h[k], u[k], p[k], z ? "stroke-system-alert" : "stroke-contrast-alpha", _ && (z ? "focus-visible:stroke-system-alert" : "focus-visible:stroke-system-emphasis"), B ? "content-emphasis" : "content-default"),
                ref: v,
                "aria-labelledby": x ? P : w,
                "aria-label": S
            }, o.default.createElement(a.v, null), o.default.createElement("div", {
                className: "grow-1 text-truncate-split text-align-x-left"
            }, o.default.createElement(d.A, {
                placeholder: C
            })), o.default.createElement(d.W, {
                className: (0, r.U)(c[k], "icon icon-regular-chevron-large-down")
            })), o.default.createElement(d.z, null, o.default.createElement(d.c, {
                position: "popper",
                onPointerMoveCapture: () => F(!1),
                className: "padding-y-small foundation-web-portal-zindex",
                style: {
                    maxHeight: "var(--radix-select-content-available-height)"
                }
            }, X))), L && o.default.createElement("span", {
                className: (0, r.U)("text-caption-small", {
                    "content-system-alert": z,
                    "content-default": !z
                })
            }, L)))
        });
    v.displayName = "Dropdown", e.s(["x", 0, v, "d", 0, s])
}, 797117, e => {
    "use strict";
    var a = e.i(820520),
        t = e.i(574487),
        l = e.i(625141),
        n = e.i(801996),
        i = e.i(702957),
        r = e.i(180535),
        o = e.i(335020),
        d = e.i(643766),
        s = e.i(637068),
        c = e.i(548223),
        u = e.i(114903);
    let m = {
            XSmall: "radius-medium",
            Small: "radius-large",
            Medium: "radius-large",
            Large: "radius-large"
        },
        p = {
            XSmall: "padding-xsmall",
            Small: "padding-small",
            Medium: "padding-small",
            Large: "padding-small"
        },
        f = {
            XSmall: "[.foundation-web-menu-section+&]:[margin-block-start:calc(var(--padding-xsmall)*2)]",
            Small: "[.foundation-web-menu-section+&]:[margin-block-start:calc(var(--padding-small)*2)]",
            Medium: "[.foundation-web-menu-section+&]:[margin-block-start:calc(var(--padding-small)*2)]",
            Large: "[.foundation-web-menu-section+&]:[margin-block-start:calc(var(--padding-small)*2)]"
        },
        g = {
            XSmall: "[margin-inline:calc(var(--padding-xsmall)*-1)] [margin-block:var(--padding-xsmall)]",
            Small: "[margin-inline:calc(var(--padding-small)*-1)] [margin-block:var(--padding-small)]",
            Medium: "[margin-inline:calc(var(--padding-small)*-1)] [margin-block:var(--padding-small)]",
            Large: "[margin-inline:calc(var(--padding-small)*-1)] [margin-block:var(--padding-small)]"
        },
        h = {
            XSmall: "padding-x-small",
            Small: "padding-x-small",
            Medium: "padding-x-[var(--size-250)]",
            Large: "padding-x-[var(--size-350)]"
        },
        v = {
            XSmall: "padding-right-small",
            Small: "padding-right-small",
            Medium: "padding-right-[var(--size-250)]",
            Large: "padding-right-[var(--size-350)]"
        },
        x = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-small",
            Medium: "padding-y-small",
            Large: "padding-y-medium"
        },
        b = {
            XSmall: "gap-x-[var(--size-150)]",
            Small: "gap-x-[var(--size-150)]",
            Medium: "gap-x-[var(--size-150)]",
            Large: "gap-x-small"
        },
        w = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-500",
            Large: "size-600"
        },
        S = {
            XSmall: "Small",
            Small: "Medium",
            Medium: "Medium",
            Large: "Large"
        },
        E = {
            XSmall: "Small",
            Small: "Medium",
            Medium: "Medium",
            Large: "Large"
        },
        k = {
            XSmall: "XSmall",
            Small: "Small",
            Medium: "Medium",
            Large: "Large"
        },
        y = {
            XSmall: "Small",
            Small: "Small",
            Medium: "Medium",
            Large: "Large"
        },
        M = {
            XSmall: "XSmall",
            Small: "XSmall",
            Medium: "XSmall",
            Large: "Small"
        },
        C = {
            XSmall: "min-height-600",
            Small: "min-height-800",
            Medium: "min-height-1000",
            Large: "min-height-1200"
        },
        N = {
            XSmall: "gap-y-xxsmall",
            Small: "gap-y-xxsmall",
            Medium: "gap-y-xsmall",
            Large: "gap-y-xsmall"
        },
        z = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        L = {
            XSmall: "text-caption-small",
            Small: "text-caption-small",
            Medium: "text-caption-medium",
            Large: "text-caption-large"
        },
        W = {
            XSmall: "padding-left-[var(--size-500)]",
            Small: "padding-left-[var(--size-600)]",
            Medium: "padding-left-[var(--size-700)]",
            Large: "padding-left-[var(--size-800)]"
        },
        D = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-small",
            Large: "text-body-medium"
        },
        X = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        P = {
            XSmall: "width-500",
            Small: "width-600",
            Medium: "width-700",
            Large: "width-800"
        },
        U = {
            XSmall: "height-400",
            Small: "height-400",
            Medium: "height-500",
            Large: "height-600"
        },
        R = "height-[1lh]",
        _ = (e, a) => (0, o.U)(P[e], a ? R : U[e]),
        F = e => {
            let {
                children: a
            } = e;
            return d.default.createElement("span", {
                className: (0, o.U)("flex items-center shrink-0", R)
            }, a)
        },
        B = (e, a) => a && null != e ? d.default.createElement(F, null, e) : e,
        j = (e, a, l) => {
            if (null == e || !1 === e) return null;
            let n = d.default.isValidElement(e) && (e.type === q || e.type === t.f),
                i = d.default.isValidElement(e) && e.type === t.f ? d.default.cloneElement(e, {
                    size: E[a]
                }) : e,
                r = d.default.createElement("span", {
                    "data-testid": "foundation-web-menu-leading",
                    className: (0, o.U)("inline-flex shrink-0 items-center justify-center", n && w[a])
                }, i);
            return l ? d.default.createElement(F, null, r) : r
        },
        T = {
            XSmall: "Small",
            Small: "Small",
            Medium: "Medium",
            Large: "Large"
        },
        I = d.default.forwardRef((e, a) => {
            let {
                size: l,
                className: n,
                ...i
            } = e;
            return d.default.createElement(t.f, {
                ref: a,
                name: "icon-regular-check",
                size: T[l],
                className: (0, o.U)("content-emphasis", n),
                ...i
            })
        });
    I.displayName = "CheckIcon";
    let K = e => {
            let {
                size: a,
                mode: t,
                checked: l,
                hasDescription: n
            } = e;
            return d.default.createElement("span", {
                "aria-hidden": !0,
                "data-testid": "foundation-web-menu-item-check",
                className: (0, o.U)("flex items-center justify-center shrink-0", _(a, n))
            }, "dropdown" === t ? d.default.createElement(c.j, {
                asChild: !0
            }, d.default.createElement(I, {
                size: a
            })) : l && d.default.createElement(I, {
                size: a
            }))
        },
        O = (0, d.createContext)(null),
        A = (0, d.createContext)(null),
        V = (0, d.createContext)(!1),
        Y = () => {
            let e = (0, d.useContext)(O);
            if (!e) throw Error("Menu components must be used within a Menu");
            return e
        },
        q = e => {
            let {
                type: a,
                src: t,
                alt: l
            } = e, {
                size: n
            } = Y(), [r, s] = (0, d.useState)();
            if ("Media" === a) {
                let e = !!t && t !== r;
                return d.default.createElement("span", {
                    "data-testid": "foundation-web-menu-leading-media",
                    className: (0, o.U)("inline-flex shrink-0 [overflow:hidden] radius-xsmall bg-shift-200", w[n])
                }, e ? d.default.createElement("img", {
                    alt: null != l ? l : "",
                    className: "size-full [object-fit:cover]",
                    src: t,
                    onError: () => s(t)
                }) : null)
            }
            return d.default.createElement(i.f, {
                alt: l,
                size: S[n],
                src: t
            })
        };
    e.s(["k", 0, e => {
        var a;
        let {
            children: t,
            className: l,
            size: n
        } = e, i = (0, d.useContext)(r.d), s = i ? "dropdown" : "standalone", f = null != (a = null != n ? n : null == i ? void 0 : i.size) ? a : "Medium", [g, h] = (0, d.useState)(0), v = (0, d.useCallback)(() => (h(e => e + 1), () => h(e => e - 1)), []), x = "standalone" === s && g > 0, b = (0, d.useContext)(V), w = (0, d.useMemo)(() => ({
            size: f,
            mode: s,
            hasCheckedItem: x,
            registerCheckedItem: v
        }), [f, s, x, v]), S = (0, o.U)("foundation-web-menu bg-surface-200 stroke-standard stroke-default shadow-transient-high", m[f], p[f], "[box-sizing:border-box]", l), E = "standalone" === s ? d.default.createElement(u.F, {
            asChild: !0,
            orientation: "vertical",
            loop: !0
        }, d.default.createElement("div", {
            role: b ? "none" : "menu",
            tabIndex: -1,
            className: S
        }, t)) : d.default.createElement("div", {
            className: S
        }, t);
        return d.default.createElement(O.Provider, {
            value: w
        }, "dropdown" === s ? d.default.createElement(c.n, {
            asChild: !0,
            style: {
                width: "var(--radix-popper-anchor-width)"
            }
        }, E) : E)
    }, "d", 0, e => {
        let n, i, {
                value: m,
                leading: p,
                title: f,
                description: g,
                submenu: w,
                trailing: S,
                isChecked: E = !1,
                disabled: k,
                className: M,
                onSelect: L,
                asChild: W,
                children: P,
                ...U
            } = e,
            {
                size: R,
                mode: _,
                hasCheckedItem: F,
                registerCheckedItem: T
            } = Y(),
            I = (0, d.useContext)(r.d);
        (0, d.useLayoutEffect)(() => {
            if ("standalone" === _ && E) return T()
        }, [_, E, T]);
        let O = void 0 !== w,
            q = "standalone" === _ && O,
            H = (0, d.useContext)(A),
            [J, Z] = (0, d.useState)(!1),
            G = (0, d.useCallback)(() => {
                Z(!1), null == H || H()
            }, [H]);
        if ("dropdown" === _ && O) throw Error("MenuItem `submenu` is only supported in a standalone Menu.");
        let Q = "dropdown" === _ && (null == I ? void 0 : I.hasSelection) === !0 || "standalone" === _ && F,
            $ = (0, o.U)(a.Y, "foundation-web-menu-item flex content-default text-truncate-split focus-visible:hover:outline-none cursor-pointer stroke-none bg-none text-align-x-left width-full [box-sizing:border-box]", g ? "items-start" : "items-center", "dropdown" === _ && !(null == I ? void 0 : I.isKeyboardNavigation) && "focus-visible:outline-none", z[R], C[R], Q ? "padding-left-none" : h[R], Q && v[R], x[R], Q ? void 0 : b[R], X[R], k && "opacity-[0.5]", k && "pointer-events-none", M),
            ee = "dropdown" === _ ? "group-data-[highlighted]/interactable:bg-[var(--color-state-hover)]" : void 0,
            ea = d.default.createElement("span", {
                className: "foundation-web-menu-item-title min-width-0 text-no-wrap text-truncate-split content-emphasis"
            }, f);
        switch (_) {
            case "dropdown":
                ea = d.default.createElement(c.s, {
                    asChild: !0
                }, ea);
                break;
            case "standalone":
                break;
            default:
                console.error("Invalid menu mode:", _)
        }
        let et = d.default.createElement(d.default.Fragment, null, j(p, R, !!g), d.default.createElement("div", {
                className: (0, o.U)("grow-1 min-width-0 flex flex-col", N[R])
            }, ea, g && d.default.createElement("div", {
                className: (0, o.U)("foundation-web-menu-item-description content-muted min-width-0", D[R])
            }, g)), B(q ? d.default.createElement(t.f, {
                className: "content-emphasis",
                "data-testid": "foundation-web-menu-item-chevron",
                name: "icon-regular-chevron-small-right",
                size: y[R]
            }) : S, !!g)),
            el = e => d.default.createElement(d.default.Fragment, null, !k && d.default.createElement(a.v, {
                className: ee
            }), Q && d.default.createElement(K, {
                size: R,
                mode: _,
                checked: E,
                hasDescription: !!g
            }), Q ? d.default.createElement("div", {
                "data-testid": "foundation-web-menu-item-row",
                className: (0, o.U)("flex grow-1 min-width-0", g ? "items-start" : "items-center", b[R])
            }, e) : e),
            en = el(et);
        "standalone" === _ && (n = F ? "menuitemcheckbox" : "menuitem");
        let ei = "standalone" === _ && F ? E : void 0,
            er = e => {
                if (!k) {
                    if (q) {
                        e.preventDefault(), Z(e => !e);
                        return
                    }
                    null == L || L(), null == H || H()
                }
            },
            eo = e => {
                var a;
                null == (a = U.onKeyDown) || a.call(U, e), e.defaultPrevented || k || !q || "ArrowRight" !== e.key || (e.preventDefault(), Z(!0))
            };
        if (W) {
            let {
                as: e,
                ...a
            } = U, t = d.default.Children.only(P), l = void 0 === f && t.props.children;
            i = d.default.createElement(s.M, {
                ...a,
                role: n,
                "aria-checked": ei,
                "aria-disabled": k || void 0,
                "aria-haspopup": q ? "menu" : void 0,
                className: $,
                style: {
                    outlineOffset: 0
                },
                onClick: k ? void 0 : er,
                onKeyDown: eo
            }, l ? d.default.cloneElement(t, {}, el(t.props.children)) : d.default.cloneElement(t, {}, en))
        } else if ("a" === U.as) {
            let {
                as: e,
                href: a,
                ...t
            } = U;
            i = d.default.createElement("a", {
                ...t,
                role: n,
                "aria-checked": ei,
                "aria-disabled": k,
                "aria-haspopup": q ? "menu" : void 0,
                href: k || q ? void 0 : a,
                className: $,
                style: {
                    outlineOffset: 0,
                    textDecoration: "none"
                },
                onClick: k ? void 0 : er,
                onKeyDown: eo
            }, en)
        } else {
            let {
                as: e,
                ...a
            } = U;
            i = d.default.createElement("button", {
                type: "button",
                ...a,
                role: n,
                "aria-checked": ei,
                "aria-disabled": k,
                "aria-haspopup": q ? "menu" : void 0,
                className: $,
                style: {
                    outlineOffset: 0
                },
                onClick: k ? void 0 : er,
                onKeyDown: eo
            }, en)
        }
        if ("dropdown" === _) return d.default.createElement(c.M, {
            value: m,
            disabled: k,
            asChild: !0
        }, i);
        let ed = d.default.createElement(u.M, {
            asChild: !0,
            focusable: !k,
            tabStopId: m
        }, i);
        return q && !k ? d.default.createElement(l.V, {
            open: J,
            onOpenChange: Z
        }, d.default.createElement(l.J, {
            asChild: !0
        }, ed), d.default.createElement(l.T, {
            side: "right",
            align: "start",
            role: "menu",
            "aria-label": null != f ? f : m,
            onKeyDown: e => {
                "ArrowLeft" === e.key && (e.preventDefault(), e.stopPropagation(), Z(!1))
            }
        }, d.default.createElement(V.Provider, {
            value: !0
        }, d.default.createElement(A.Provider, {
            value: G
        }, w)))) : ed
    }, "U", 0, e => {
        let {
            title: a,
            description: t,
            leading: l,
            trailing: n,
            disabled: i,
            className: s
        } = e, {
            size: c,
            mode: u,
            hasCheckedItem: m
        } = Y(), p = (0, d.useContext)(r.d), f = "dropdown" === u && (null == p ? void 0 : p.hasSelection) === !0 || "standalone" === u && m, g = (0, o.U)("foundation-web-menu-label flex content-default text-truncate-split text-align-x-left width-full [box-sizing:border-box]", t ? "items-start" : "items-center", z[c], C[c], f ? "padding-left-none" : h[c], f && v[c], x[c], f ? void 0 : b[c], i && "opacity-[0.5]", s), w = d.default.createElement(d.default.Fragment, null, j(l, c, !!t), d.default.createElement("div", {
            className: (0, o.U)("grow-1 min-width-0 flex flex-col", N[c])
        }, d.default.createElement("span", {
            className: "foundation-web-menu-label-title min-width-0 text-no-wrap text-truncate-split content-emphasis"
        }, a), t && d.default.createElement("div", {
            className: (0, o.U)("foundation-web-menu-label-description content-muted min-width-0", D[c])
        }, t)), B(n, !!t));
        return d.default.createElement("div", {
            role: "none",
            "data-testid": "foundation-web-menu-label",
            className: g
        }, f && d.default.createElement("span", {
            "aria-hidden": !0,
            "data-testid": "foundation-web-menu-label-check-spacer",
            className: (0, o.U)("shrink-0", _(c, !!t))
        }), f ? d.default.createElement("div", {
            className: (0, o.U)("flex grow-1 min-width-0", t ? "items-start" : "items-center", b[c])
        }, w) : w)
    }, "E", 0, q, "T", 0, e => {
        let {
            children: a,
            className: t,
            title: l
        } = e, {
            size: n,
            mode: i,
            hasCheckedItem: s
        } = Y(), c = (0, d.useContext)(r.d), u = "dropdown" === i && (null == c ? void 0 : c.hasSelection) === !0 || "standalone" === i && s;
        return d.default.createElement("div", {
            role: "group",
            "aria-label": l || void 0,
            className: (0, o.U)("foundation-web-menu-section", f[n], t)
        }, l ? d.default.createElement("div", {
            "aria-hidden": !0,
            "data-testid": "foundation-web-menu-section-title",
            className: (0, o.U)("foundation-web-menu-section-title content-default width-full [box-sizing:border-box] margin-bottom-[var(--gap-xxsmall)]", L[n], u ? [W[n], v[n]] : h[n])
        }, l) : null, a)
    }, "Z", 0, e => {
        let {
            className: a
        } = e, {
            size: t
        } = Y();
        return d.default.createElement("div", {
            role: "separator",
            className: (0, o.U)("foundation-web-menu-separator", g[t], a)
        })
    }, "K", 0, e => {
        let {
            size: a
        } = Y(), {
            type: l
        } = e;
        if ("Hint" === l) {
            let {
                text: a
            } = e;
            return d.default.createElement("span", {
                "data-testid": "foundation-web-menu-trailing-hint",
                className: "inline-flex items-center shrink-0 padding-x-xsmall radius-small bg-shift-200 text-caption-medium content-muted"
            }, a)
        }
        if ("Badge" === l) {
            let {
                icon: t,
                label: l,
                variant: i = "Contrast"
            } = e;
            return d.default.createElement(n.t, {
                className: "shrink-0",
                "data-testid": "foundation-web-menu-trailing-badge",
                icon: t,
                label: l,
                size: M[a],
                variant: i
            })
        }
        let {
            name: i
        } = e;
        return d.default.createElement("span", {
            "data-testid": "foundation-web-menu-trailing",
            className: (0, o.U)("inline-flex shrink-0 items-center justify-center", w[a])
        }, d.default.createElement(t.f, {
            className: "content-emphasis",
            name: i,
            size: k[a]
        }))
    }])
}, 625141, 702957, e => {
    "use strict";
    var a = e.i(335020),
        t = e.i(643766),
        l = e.i(539377);
    let n = e => {
        var a, t, l, n, i, r;
        let o = null != (a = null == (l = (n = window).matchMedia) || null == (t = l.call(n, "(pointer: coarse)")) ? void 0 : t.matches) && a,
            d = null == (i = document.activeElement) ? void 0 : i.matches(":focus-visible");
        if (o && !d) return void e.preventDefault();
        let s = null == (r = e.currentTarget) ? void 0 : r.querySelector('[role="menuitem"]:not([aria-disabled="true"])');
        s && (e.preventDefault(), s.focus())
    };
    e.s(["V", 0, function(e) {
        let {
            open: a,
            defaultOpen: n,
            onOpenChange: i,
            children: r
        } = e;
        return t.createElement(l.F, {
            open: a,
            defaultOpen: n,
            onOpenChange: i
        }, r)
    }, "r", 0, function(e) {
        let {
            asChild: a,
            className: n,
            children: i
        } = e;
        return t.createElement(l.g, {
            asChild: a,
            className: n
        }, i)
    }, "I", 0, function(e) {
        let {
            children: a,
            ...n
        } = e;
        return t.createElement(l.K, n, a)
    }, "T", 0, function(e) {
        let {
            side: i = "bottom",
            align: r = "center",
            sideOffset: o = 4,
            className: d,
            children: s,
            ariaLabel: c,
            onOpenAutoFocus: u,
            ...m
        } = e;
        return t.createElement(l.z, null, t.createElement(l.c, {
            side: i,
            align: r,
            sideOffset: o,
            ...m,
            "aria-label": null != c ? c : m["aria-label"],
            onOpenAutoFocus: null != u ? u : n,
            className: (0, a.U)("foundation-web-portal-zindex", d)
        }, s))
    }, "J", 0, function(e) {
        let {
            asChild: a,
            disabled: n,
            className: i,
            children: r
        } = e;
        return t.createElement(l.d, {
            asChild: a,
            disabled: n,
            className: i
        }, r)
    }], 625141);
    var i = e.i(574487);
    let r = {
            XSmall: "size-300",
            Small: "size-400",
            Medium: "size-500",
            Large: "size-600",
            XLarge: "size-700"
        },
        o = (0, t.forwardRef)((e, l) => {
            let {
                src: n,
                alt: o,
                initials: d,
                icon: s = "icon-filled-person",
                size: c = "Medium",
                className: u,
                ...m
            } = e, [p, f] = (0, t.useState)(), g = !!n && n !== p;
            return t.default.createElement("span", {
                ref: l,
                role: o ? "img" : void 0,
                "aria-label": o || void 0,
                "aria-hidden": !o || void 0,
                ...m,
                className: (0, a.U)("foundation-web-avatar-icon inline-flex items-center justify-center shrink-0 [overflow:hidden] radius-circle select-none bg-shift-200 content-emphasis", r[c], u)
            }, g ? t.default.createElement("img", {
                src: n,
                alt: "",
                className: "size-full [object-fit:cover]",
                onError: () => f(n)
            }) : t.default.createElement("span", {
                "aria-hidden": !0,
                className: "inline-flex items-center justify-center size-full"
            }, d ? t.default.createElement("span", {
                className: "text-caption-small text-no-wrap"
            }, d) : t.default.createElement(i.f, {
                name: s,
                className: "!size-[75%]"
            })))
        });
    o.displayName = "AvatarIcon", e.s(["f", 0, o], 702957)
}, 835315, e => {
    "use strict";
    var a = e.i(574487),
        t = e.i(766433),
        l = e.i(643766);
    e.s(["f", 0, e => {
        let {
            title: n,
            description: i,
            position: r = "top-center"
        } = e;
        return l.default.createElement(t.W, {
            position: r,
            title: n,
            description: i
        }, l.default.createElement(t.y, {
            asChild: !0
        }, l.default.createElement("span", {
            role: "button",
            tabIndex: 0,
            "aria-label": n,
            className: "flex items-center content-muted",
            "data-testid": "label-tooltip-trigger"
        }, l.default.createElement(a.f, {
            name: "icon-regular-circle-i",
            size: "Small"
        }))))
    }])
}, 813555, e => {
    "use strict";
    e.s(["L", 0, {
        Standard: "bg-none",
        Contrast: "bg-shift-200",
        Utility: "bg-none"
    }, "U", 0, {
        Standard: "stroke-standard",
        Contrast: "stroke-none",
        Utility: "stroke-none"
    }, "_", 0, ["Standard", "Contrast", "Utility"]])
}, 202621, e => {
    "use strict";
    let a = ["Alt", "Control", "Meta", "Shift"];
    e.s(["f", 0, e => !(e.metaKey || e.ctrlKey || e.altKey || a.includes(e.key))])
}, 463655, 469031, e => {
    "use strict";
    var a = e.i(225226),
        t = e.i(643766),
        l = e.i(231543),
        n = e.i(130933),
        i = e.i(179183),
        r = e.i(433659),
        o = e.i(365434),
        d = e.i(677484),
        s = e.i(785517),
        c = e.i(274438),
        u = e.i(268953);

    function m(e) {
        return (0, r.g)("MuiCard", e)
    }
    e.i(386856), (0, d.g)("MuiCard", ["root"]);
    let p = ["className", "raised"],
        f = (0, o.s)(c.M, {
            name: "MuiCard",
            slot: "Root",
            overridesResolver: (e, a) => a.root
        })(() => ({
            overflow: "hidden"
        })),
        g = t.forwardRef(function(e, a) {
            let t = (0, u.u)({
                    props: e,
                    name: "MuiCard"
                }),
                {
                    className: l,
                    raised: n = !1
                } = t,
                d = (0, r._)(t, p),
                c = (0, i._)({}, t, {
                    raised: n
                }),
                g = (e => {
                    let {
                        classes: a
                    } = e;
                    return (0, o.a)({
                        root: ["root"]
                    }, m, a)
                })(c);
            return (0, s.jsx)(f, (0, i._)({
                className: (0, o.c)(g.root, l),
                elevation: n ? 8 : void 0,
                ref: a,
                ownerState: c
            }, d))
        });
    var h = (0, l.f)({
            name: "Card"
        })(function(e, t) {
            var l = t.variant;
            return {
                root: (0, a._)({
                    boxShadow: "none",
                    overflow: "hidden",
                    WebkitMaskImage: "-webkit-radial-gradient(white, black)",
                    backgroundColor: "outlined" === l ? "transparent" : e.palette.surface[200],
                    position: "relative"
                }, e.border.radius.large)
            }
        }),
        v = (0, t.forwardRef)(function(e, l) {
            var i = e.children,
                r = e.classes,
                o = e.variant,
                d = e.className,
                s = (0, a.a)(e, ["children", "classes", "variant", "className"]),
                c = h((0, a._)((0, a._)({}, s), {
                    variant: o
                }), {
                    props: {
                        classes: (0, n.f)(r, d)
                    }
                });
            return t.default.createElement(g, (0, a._)({}, s, {
                variant: "outlined" === o ? "outlined" : "elevation",
                classes: c.classes,
                ref: l
            }), i)
        });
    e.s(["C", 0, v], 469031), e.s(["f", 0, v], 463655)
}, 628520, e => {
    "use strict";
    let a = e.i(643766).createContext({});
    e.s(["D", 0, a])
}, 629156, e => {
    "use strict";
    var a = e.i(433659),
        t = e.i(179183),
        l = e.i(643766),
        n = e.i(365434),
        i = e.i(313660),
        r = e.i(677484),
        o = e.i(785517),
        d = e.i(927828),
        s = e.i(546538);

    function c(e) {
        return (0, a.g)("PrivateSwitchBase", e)
    }
    e.i(475252), (0, r.g)("PrivateSwitchBase", ["root", "checked", "disabled", "input", "edgeStart", "edgeEnd"]);
    let u = ["autoFocus", "checked", "checkedIcon", "className", "defaultChecked", "disabled", "disableFocusRipple", "edge", "icon", "id", "inputProps", "inputRef", "name", "onBlur", "onChange", "onFocus", "readOnly", "required", "tabIndex", "type", "value"],
        m = (0, n.s)(d.B, {
            name: "MuiSwitchBase"
        })(e => {
            let {
                ownerState: a
            } = e;
            return (0, t._)({
                padding: 9,
                borderRadius: "50%"
            }, "start" === a.edge && {
                marginLeft: "small" === a.size ? -3 : -12
            }, "end" === a.edge && {
                marginRight: "small" === a.size ? -3 : -12
            })
        }),
        p = (0, n.s)("input", {
            name: "MuiSwitchBase",
            shouldForwardProp: n.r
        })({
            cursor: "inherit",
            position: "absolute",
            opacity: 0,
            width: "100%",
            height: "100%",
            top: 0,
            left: 0,
            margin: 0,
            padding: 0,
            zIndex: 1
        }),
        f = l.forwardRef(function(e, l) {
            let {
                autoFocus: r,
                checked: d,
                checkedIcon: f,
                className: g,
                defaultChecked: h,
                disabled: v,
                disableFocusRipple: x = !1,
                edge: b = !1,
                icon: w,
                id: S,
                inputProps: E,
                inputRef: k,
                name: y,
                onBlur: M,
                onChange: C,
                onFocus: N,
                readOnly: z,
                required: L = !1,
                tabIndex: W,
                type: D,
                value: X
            } = e, P = (0, a._)(e, u), [U, R] = (0, s.u)({
                controlled: d,
                default: !!h,
                name: "SwitchBase",
                state: "checked"
            }), _ = (0, i.u)(), F = v;
            _ && void 0 === F && (F = _.disabled);
            let B = "checkbox" === D || "radio" === D,
                j = (0, t._)({}, e, {
                    checked: U,
                    disabled: F,
                    disableFocusRipple: x,
                    edge: b
                }),
                T = (e => {
                    let {
                        classes: t,
                        checked: l,
                        disabled: i,
                        edge: r
                    } = e, o = {
                        root: ["root", l && "checked", i && "disabled", r && "edge".concat((0, a.a)(r))],
                        input: ["input"]
                    };
                    return (0, n.a)(o, c, t)
                })(j);
            return (0, o.jsxs)(m, (0, t._)({
                component: "span",
                className: (0, n.c)(T.root, g),
                centerRipple: !0,
                focusRipple: !x,
                disabled: F,
                tabIndex: null,
                role: void 0,
                onFocus: e => {
                    N && N(e), _ && _.onFocus && _.onFocus(e)
                },
                onBlur: e => {
                    M && M(e), _ && _.onBlur && _.onBlur(e)
                },
                ownerState: j,
                ref: l
            }, P, {
                children: [(0, o.jsx)(p, (0, t._)({
                    autoFocus: r,
                    checked: d,
                    defaultChecked: h,
                    className: T.input,
                    disabled: F,
                    id: B ? S : void 0,
                    name: y,
                    onChange: e => {
                        if (e.nativeEvent.defaultPrevented) return;
                        let a = e.target.checked;
                        R(a), C && C(e, a)
                    },
                    readOnly: z,
                    ref: k,
                    required: L,
                    ownerState: j,
                    tabIndex: W,
                    type: D
                }, "checkbox" === D && void 0 === X ? {} : {
                    value: X
                }, E)), U ? f : w]
            }))
        });
    e.s(["S", 0, f])
}, 246481, 693985, e => {
    "use strict";
    var a = e.i(225226),
        t = e.i(643766),
        l = e.i(231543),
        n = e.i(130933),
        i = e.i(433659),
        r = e.i(179183),
        o = e.i(365434),
        d = e.i(677484),
        s = e.i(628520),
        c = e.i(657698),
        u = e.i(785517),
        m = e.i(379044),
        p = e.i(364294),
        f = e.i(274438),
        g = e.i(268953),
        h = e.i(144796),
        v = e.i(347419);

    function x(e) {
        return (0, i.g)("MuiDialog", e)
    }
    var b = (0, d.g)("MuiDialog", ["root", "scrollPaper", "scrollBody", "container", "paper", "paperScrollPaper", "paperScrollBody", "paperWidthFalse", "paperWidthXs", "paperWidthSm", "paperWidthMd", "paperWidthLg", "paperWidthXl", "paperFullWidth", "paperFullScreen"]);
    let w = ["aria-describedby", "aria-labelledby", "BackdropComponent", "BackdropProps", "children", "className", "disableEscapeKeyDown", "fullScreen", "fullWidth", "maxWidth", "onBackdropClick", "onClick", "onClose", "open", "PaperComponent", "PaperProps", "scroll", "TransitionComponent", "transitionDuration", "TransitionProps"],
        S = (0, o.s)(m.M, {
            name: "MuiDialog",
            slot: "Backdrop",
            overrides: (e, a) => a.backdrop
        })({
            zIndex: -1
        }),
        E = (0, o.s)(p.M, {
            name: "MuiDialog",
            slot: "Root",
            overridesResolver: (e, a) => a.root
        })({
            "@media print": {
                position: "absolute !important"
            }
        }),
        k = (0, o.s)("div", {
            name: "MuiDialog",
            slot: "Container",
            overridesResolver: (e, a) => {
                let {
                    ownerState: t
                } = e;
                return [a.container, a["scroll".concat((0, i.a)(t.scroll))]]
            }
        })(e => {
            let {
                ownerState: a
            } = e;
            return (0, r._)({
                height: "100%",
                "@media print": {
                    height: "auto"
                },
                outline: 0
            }, "paper" === a.scroll && {
                display: "flex",
                justifyContent: "center",
                alignItems: "center"
            }, "body" === a.scroll && {
                overflowY: "auto",
                overflowX: "hidden",
                textAlign: "center",
                "&::after": {
                    content: '""',
                    display: "inline-block",
                    verticalAlign: "middle",
                    height: "100%",
                    width: "0"
                }
            })
        }),
        y = (0, o.s)(f.M, {
            name: "MuiDialog",
            slot: "Paper",
            overridesResolver: (e, a) => {
                let {
                    ownerState: t
                } = e;
                return [a.paper, a["scrollPaper".concat((0, i.a)(t.scroll))], a["paperWidth".concat((0, i.a)(String(t.maxWidth)))], t.fullWidth && a.paperFullWidth, t.fullScreen && a.paperFullScreen]
            }
        })(e => {
            let {
                theme: a,
                ownerState: t
            } = e;
            return (0, r._)({
                margin: 32,
                position: "relative",
                overflowY: "auto",
                "@media print": {
                    overflowY: "visible",
                    boxShadow: "none"
                }
            }, "paper" === t.scroll && {
                display: "flex",
                flexDirection: "column",
                maxHeight: "calc(100% - 64px)"
            }, "body" === t.scroll && {
                display: "inline-block",
                verticalAlign: "middle",
                textAlign: "left"
            }, !t.maxWidth && {
                maxWidth: "calc(100% - 64px)"
            }, "xs" === t.maxWidth && {
                maxWidth: "px" === a.breakpoints.unit ? Math.max(a.breakpoints.values.xs, 444) : "max(".concat(a.breakpoints.values.xs).concat(a.breakpoints.unit, ", 444px)"),
                ["&.".concat(b.paperScrollBody)]: {
                    [a.breakpoints.down(Math.max(a.breakpoints.values.xs, 444) + 64)]: {
                        maxWidth: "calc(100% - 64px)"
                    }
                }
            }, t.maxWidth && "xs" !== t.maxWidth && {
                maxWidth: "".concat(a.breakpoints.values[t.maxWidth]).concat(a.breakpoints.unit),
                ["&.".concat(b.paperScrollBody)]: {
                    [a.breakpoints.down(a.breakpoints.values[t.maxWidth] + 64)]: {
                        maxWidth: "calc(100% - 64px)"
                    }
                }
            }, t.fullWidth && {
                width: "calc(100% - 64px)"
            }, t.fullScreen && {
                margin: 0,
                width: "100%",
                maxWidth: "100%",
                height: "100%",
                maxHeight: "none",
                borderRadius: 0,
                ["&.".concat(b.paperScrollBody)]: {
                    margin: 0,
                    maxWidth: "100%"
                }
            })
        }),
        M = t.forwardRef(function(e, a) {
            let l = (0, g.u)({
                    props: e,
                    name: "MuiDialog"
                }),
                n = (0, c.u)(),
                d = {
                    enter: n.transitions.duration.enteringScreen,
                    exit: n.transitions.duration.leavingScreen
                },
                {
                    "aria-describedby": m,
                    "aria-labelledby": p,
                    BackdropComponent: b,
                    BackdropProps: M,
                    children: C,
                    className: N,
                    disableEscapeKeyDown: z = !1,
                    fullScreen: L = !1,
                    fullWidth: W = !1,
                    maxWidth: D = "sm",
                    onBackdropClick: X,
                    onClick: P,
                    onClose: U,
                    open: R,
                    PaperComponent: _ = f.M,
                    PaperProps: F = {},
                    scroll: B = "paper",
                    TransitionComponent: j = v.F,
                    transitionDuration: T = d,
                    TransitionProps: I
                } = l,
                K = (0, i._)(l, w),
                O = (0, r._)({}, l, {
                    disableEscapeKeyDown: z,
                    fullScreen: L,
                    fullWidth: W,
                    maxWidth: D,
                    scroll: B
                }),
                A = (e => {
                    let {
                        classes: a,
                        scroll: t,
                        maxWidth: l,
                        fullWidth: n,
                        fullScreen: r
                    } = e, d = {
                        root: ["root"],
                        container: ["container", "scroll".concat((0, i.a)(t))],
                        paper: ["paper", "paperScroll".concat((0, i.a)(t)), "paperWidth".concat((0, i.a)(String(l))), n && "paperFullWidth", r && "paperFullScreen"]
                    };
                    return (0, o.a)(d, x, a)
                })(O),
                V = t.useRef(),
                Y = (0, h.u)(p),
                q = t.useMemo(() => ({
                    titleId: Y
                }), [Y]);
            return (0, u.jsx)(E, (0, r._)({
                className: (0, o.c)(A.root, N),
                closeAfterTransition: !0,
                components: {
                    Backdrop: S
                },
                componentsProps: {
                    backdrop: (0, r._)({
                        transitionDuration: T,
                        as: b
                    }, M)
                },
                disableEscapeKeyDown: z,
                onClose: U,
                open: R,
                ref: a,
                onClick: e => {
                    P && P(e), V.current && (V.current = null, X && X(e), U && U(e, "backdropClick"))
                },
                ownerState: O
            }, K, {
                children: (0, u.jsx)(j, (0, r._)({
                    appear: !0,
                    in: R,
                    timeout: T,
                    role: "presentation"
                }, I, {
                    children: (0, u.jsx)(k, {
                        className: (0, o.c)(A.container),
                        onMouseDown: e => {
                            V.current = e.target === e.currentTarget
                        },
                        ownerState: O,
                        children: (0, u.jsx)(y, (0, r._)({
                            as: _,
                            elevation: 24,
                            role: "dialog",
                            "aria-describedby": m,
                            "aria-labelledby": Y
                        }, F, {
                            className: (0, o.c)(A.paper, F.className),
                            ownerState: O,
                            children: (0, u.jsx)(s.D.Provider, {
                                value: q,
                                children: C
                            })
                        }))
                    })
                }))
            }))
        });
    e.s(["M", 0, M, "d", 0, b], 693985), e.i(860663);
    var C = (0, l.f)({
            name: "Dialog"
        })(function(e) {
            return {
                paper: (0, a._)({
                    boxShadow: e.elevation.overlay,
                    backgroundColor: e.palette.surface[300]
                }, e.border.radius.large),
                xsmallBreakpointWidthOverride: {}
            }
        }),
        N = (0, t.forwardRef)(function(e, l) {
            var i = e.classes,
                r = e.children;
            e.fullScreen;
            var o = e.className,
                d = e.maxWidth,
                s = (0, a.a)(e, ["classes", "children", "fullScreen", "className", "maxWidth"]),
                c = C(void 0, {
                    props: {
                        classes: (0, n.f)(i, o)
                    }
                });
            return t.default.createElement(M, (0, a._)({}, s, {
                fullScreen: !1,
                classes: c.classes,
                maxWidth: "XSmall" === d ? "Small" : d,
                ref: l
            }), r)
        });
    e.s(["f", 0, N], 246481)
}, 148792, e => {
    "use strict";
    var a = e.i(246481);
    e.s(["f", () => a.f])
}, 8994, 197240, 272164, 973649, e => {
    "use strict";
    var a = e.i(225226),
        t = e.i(643766),
        l = e.i(231543),
        n = e.i(130933),
        i = e.i(433659),
        r = e.i(179183),
        o = e.i(365434),
        d = e.i(677484),
        s = (0, d.g)("MuiDialogTitle", ["root"]);
    e.s(["d", 0, s, "g", 0, function(e) {
        return (0, i.g)("MuiDialogTitle", e)
    }], 197240);
    var c = e.i(785517),
        u = e.i(268953);

    function m(e) {
        return (0, i.g)("MuiDialogContent", e)
    }
    var p = (0, d.g)("MuiDialogContent", ["root", "dividers"]);
    let f = ["className", "dividers"],
        g = (0, o.s)("div", {
            name: "MuiDialogContent",
            slot: "Root",
            overridesResolver: (e, a) => {
                let {
                    ownerState: t
                } = e;
                return [a.root, t.dividers && a.dividers]
            }
        })(e => {
            let {
                theme: a,
                ownerState: t
            } = e;
            return (0, r._)({
                flex: "1 1 auto",
                WebkitOverflowScrolling: "touch",
                overflowY: "auto",
                padding: "20px 24px"
            }, t.dividers ? {
                padding: "16px 24px",
                borderTop: "1px solid ".concat((a.vars || a).palette.divider),
                borderBottom: "1px solid ".concat((a.vars || a).palette.divider)
            } : {
                [".".concat(s.root, " + &")]: {
                    paddingTop: 0
                }
            })
        }),
        h = t.forwardRef(function(e, a) {
            let t = (0, u.u)({
                    props: e,
                    name: "MuiDialogContent"
                }),
                {
                    className: l,
                    dividers: n = !1
                } = t,
                d = (0, i._)(t, f),
                s = (0, r._)({}, t, {
                    dividers: n
                }),
                p = (e => {
                    let {
                        classes: a,
                        dividers: t
                    } = e;
                    return (0, o.a)({
                        root: ["root", t && "dividers"]
                    }, m, a)
                })(s);
            return (0, c.jsx)(g, (0, r._)({
                className: (0, o.c)(p.root, l),
                ownerState: s,
                ref: a
            }, d))
        });
    e.s(["D", 0, h, "d", 0, p], 272164);
    var v = (0, l.f)({
            name: "DialogContent"
        })({
            root: {
                paddingLeft: 20,
                paddingRight: 20,
                paddingBottom: 12
            },
            dividers: {
                margin: "0 24px",
                padding: "16px 0"
            }
        }),
        x = (0, t.forwardRef)(function(e, l) {
            var i = e.classes,
                r = e.children,
                o = e.className,
                d = (0, a.a)(e, ["classes", "children", "className"]),
                s = v(void 0, {
                    props: {
                        classes: (0, n.f)(i, o)
                    }
                });
            return t.default.createElement(h, (0, a._)({}, d, {
                classes: s.classes,
                ref: l
            }), r)
        });
    e.s(["f", 0, x], 973649), e.s(["f", 0, x], 8994)
}, 898012, e => {
    "use strict";
    var a = e.i(179183),
        t = e.i(433659),
        l = e.i(219155),
        n = e.i(611785);
    let i = ["className", "elementType", "ownerState", "externalForwardedProps", "getSlotOwnerState", "internalForwardedProps"],
        r = ["component", "slots", "slotProps"],
        o = ["component"];
    e.s(["u", 0, function(e, d) {
        let {
            className: s,
            elementType: c,
            ownerState: u,
            externalForwardedProps: m,
            getSlotOwnerState: p,
            internalForwardedProps: f
        } = d, g = (0, t._)(d, i), {
            component: h,
            slots: v = {
                [e]: void 0
            },
            slotProps: x = {
                [e]: void 0
            }
        } = m, b = (0, t._)(m, r), w = v[e] || c, S = (0, l.r)(x[e], u), E = (0, l.m)((0, a._)({
            className: s
        }, g, {
            externalForwardedProps: "root" === e ? b : void 0,
            externalSlotProps: S
        })), {
            props: {
                component: k
            },
            internalRef: y
        } = E, M = (0, t._)(E.props, o), C = (0, n.u)(y, null == S ? void 0 : S.ref, d.ref), N = p ? p(M) : {}, z = (0, a._)({}, u, N), L = "root" === e ? k || h : k, W = (0, l.a)(w, (0, a._)({}, "root" === e && !h && !v[e] && f, "root" !== e && !v[e] && f, M, L && {
            as: L
        }, {
            ref: C
        }), z);
        return Object.keys(N).forEach(e => {
            delete W[e]
        }), [w, W]
    }])
}, 444550, e => {
    "use strict";
    var a = e.i(631552),
        t = e.i(830793);
    e.s(["u", 0, function(e) {
        let {
            props: l,
            name: n,
            defaultTheme: i,
            themeId: r
        } = e, o = (0, t.u)(i);
        return r && (o = o[r] || o), (0, a.g)({
            theme: o,
            name: n,
            props: l
        })
    }])
}, 350898, 674836, e => {
    "use strict";
    var a = e.i(611465);
    e.i(643766);
    var t = a.u;
    e.s(["f", 0, t], 674836), e.s(["f", 0, t], 350898)
}]);

//# debugId=444b64cf-6f6c-9663-35d1-b2f4890672ce
//# sourceMappingURL=2e3vynnshhcmo.js.map
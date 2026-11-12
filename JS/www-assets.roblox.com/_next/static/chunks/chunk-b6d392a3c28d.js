;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "1f922f5f-6edb-760b-3b23-581e46f02680")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 908740, e => {
    "use strict";
    var t = e.i(420482),
        r = e.i(855790);
    let a = ["color-mode-dark", "color-mode-light", "color-mode-system"];
    e.s(["default", 0, function() {
        let e = (0, r.useMediaQuery)("(prefers-color-scheme: dark)", {
                defaultValue: !1,
                initializeWithValue: !1
            }),
            i = (0, t.useCallback)(() => {
                if ("u" > typeof document) {
                    let e = [document.body, document.documentElement].find(e => a.some(t => e.classList.contains(t)));
                    if (e?.classList.contains("color-mode-dark")) return "dark";
                    if (e?.classList.contains("color-mode-light")) return "light"
                }
                return e ? "dark" : "light"
            }, [e]),
            [l, n] = (0, t.useState)("light");
        return (0, t.useEffect)(() => {
            if (n(i()), "u" < typeof document || "u" < typeof MutationObserver) return;
            let e = new MutationObserver(() => {
                    n(i())
                }),
                t = {
                    attributes: !0,
                    attributeFilter: ["class"]
                };
            return e.observe(document.documentElement, t), e.observe(document.body, t), () => {
                e.disconnect()
            }
        }, [i]), l
    }])
}, 120274, e => {
    "use strict";
    var t = e.i(19836),
        r = e.i(254226),
        a = e.i(264458),
        i = e.i(496283);
    let l = ["JPY"];
    var n = e.i(598887);

    function s(e) {
        let {
            amount: r,
            currencyCode: s,
            tagClassName: o
        } = e, {
            formattedAmount: d,
            isNegative: c,
            className: u
        } = function(e) {
            let {
                amount: t,
                currencyCode: r,
                tagClassName: s
            } = e, o = Math.abs(t), d = `${o}${r}`, c = (0, a.default)("price-tag", s);
            try {
                let e, t = (e = Intl.NumberFormat().resolvedOptions().locale).startsWith("ar-") ? ((0, n.trackCounter)("PriceTag_ArabicLocaleTriggered"), e.replace("ar-", "en-")) : e,
                    a = {
                        style: "currency",
                        currency: r,
                        notation: "standard"
                    };
                o >= 1e4 && !l.includes(r) && (a.minimumFractionDigits = 0, a.maximumFractionDigits = 2, a.maximumSignificantDigits = 21, a.notation = "compact"), c.split(" ").includes("navbar-compact") && (a.maximumSignificantDigits = 4), d = Intl.NumberFormat(t, a).format(o)
            } catch {
                (0, n.trackCriticalError)("PriceTag_NumberFormatLocaleException", {
                    currencyCode: null === r ? "null" : void 0 === r ? "undefined" : "" === r ? "empty" : "string" == typeof r && /^[a-z]{3}$/i.test(r) ? r.toUpperCase() : "invalid",
                    internalPageName: (0, i.getInternalPageName)() ?? "unknown"
                })
            }
            return {
                formattedAmount: d,
                isNegative: t < 0,
                className: c
            }
        }({
            amount: r,
            currencyCode: s,
            tagClassName: o
        });
        return (0, t.jsxs)("div", {
            className: "d-flex-inline gap-1 justify-content-start align-items-center",
            children: [c && (0, t.jsx)("span", {
                className: u,
                children: "-"
            }), (0, t.jsx)("span", {
                className: u,
                children: d
            })]
        })
    }
    s.propTypes = {
        amount: r.default.number.isRequired,
        currencyCode: r.default.string.isRequired
    }, e.s(["PriceTag", 0, s], 120274)
}, 176489, 231756, e => {
    "use strict";
    var t = e.i(7284),
        r = e.i(420482);
    e.s(["StateLayer", 0, e => {
        let {
            className: a
        } = e;
        return r.default.createElement("div", {
            "aria-hidden": !0,
            "data-testid": "foundation-web-state-layer",
            className: (0, t.default)("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", a)
        })
    }, "interactable", 0, "relative clip group/interactable focus-visible:outline-focus disabled:outline-none"], 176489), e.s(["disabledOpacity", 0, "opacity-[0.5]"], 231756)
}, 660053, e => {
    "use strict";
    var t = e.i(176489),
        r = e.i(231756),
        a = e.i(7284),
        i = e.i(420482),
        l = e.i(919403);
    let n = {
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
        p = (0, i.forwardRef)((e, p) => {
            let g, {
                className: b,
                icon: h,
                ariaLabel: v,
                isDisabled: y = !1,
                isCircular: x = !1,
                isSelected: S = !1,
                size: E = "Large",
                variant: R = "Emphasis",
                iconColor: C = "Default",
                asChild: k,
                children: _,
                ...w
            } = e;
            g = y ? c[R] : S ? u[R] : d[R];
            let I = (0, a.default)("foundation-web-icon-button", y ? r.disabledOpacity : [t.interactable, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", n[E], o[E][x ? "circular" : "square"], g, b),
                N = i.default.createElement(i.default.Fragment, null, i.default.createElement(t.StateLayer, null), i.default.createElement("span", {
                    className: (0, a.default)("icon", h, s[E], y ? f[C][R] : m[C][R])
                }));
            if (k) {
                let {
                    as: e,
                    ...t
                } = w, r = i.default.Children.only(_);
                return i.default.createElement(l.Slot, {
                    ref: p,
                    ...t,
                    className: I,
                    "aria-label": v,
                    "aria-disabled": y || void 0
                }, i.default.cloneElement(r, {}, N))
            }
            if ("a" === w.as) {
                let {
                    as: e,
                    href: t,
                    ...r
                } = w;
                return i.default.createElement("a", {
                    ref: p,
                    ...r,
                    "aria-label": v,
                    "aria-disabled": y,
                    href: y ? void 0 : t,
                    className: I
                }, N)
            }
            let {
                as: P,
                ...L
            } = w;
            return i.default.createElement("button", {
                ref: p,
                type: "button",
                ...L,
                "aria-label": v,
                disabled: y,
                className: I
            }, N)
        }),
        g = (0, i.forwardRef)((e, t) => {
            let {
                className: r,
                style: l,
                orientation: n = "horizontal",
                variant: s = "Standard",
                ...o
            } = e, d = "vertical" === n, c = {};
            return d || "Inset" !== s ? d || "InsetLeft" !== s ? d || "InsetRight" !== s || (c = {
                marginRight: "var(--padding-xlarge)"
            }) : c = {
                marginLeft: "var(--padding-xlarge)"
            } : c = {
                marginLeft: "var(--padding-xlarge)",
                marginRight: "var(--padding-xlarge)"
            }, i.default.createElement("div", {
                ref: t,
                ...o,
                role: "separator",
                "data-orientation": n,
                "aria-orientation": n,
                style: {
                    borderRightWidth: 0,
                    borderBottomWidth: 0,
                    boxSizing: "border-box",
                    borderStyle: "solid",
                    ...d ? {
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
                    ...l
                },
                className: (0, a.default)("stroke-default self-stretch", r)
            })
        });
    g.displayName = "Divider";
    var b = e.i(513443);
    let h = e => {
            let {
                type: t,
                sideSheetSide: r = "right",
                isSideSheetFlush: l = !1,
                centerSheetSize: n = "Medium",
                children: s,
                overlayClassName: o,
                contentClassName: d,
                onOpenAutoFocus: c,
                onCloseAutoFocus: u,
                onPointerDownOutside: m,
                onEscapeKeyDown: f,
                onInteractOutside: p
            } = e;
            return i.default.createElement(b.Portal, null, i.default.createElement(b.Overlay, {
                "data-testid": "fui-base-sheet-overlay",
                "data-type": t,
                "data-side": "sideSheet" === t ? r : void 0,
                "data-flush": "sideSheet" === t ? l : void 0,
                "data-size": "centerSheet" === t ? n : void 0,
                className: (0, a.default)("fui-base-sheet-overlay", "foundation-web-portal-zindex fixed inset-[0] flex", o)
            }, i.default.createElement(b.Content, {
                "data-testid": "fui-base-sheet-content",
                className: (0, a.default)("fui-base-sheet-content relative bg-surface-100 stroke-muted stroke-standard shadow-transient-high", "flex flex-col clip", d),
                onOpenAutoFocus: c,
                onCloseAutoFocus: u,
                onPointerDownOutside: m,
                onEscapeKeyDown: f,
                onInteractOutside: p
            }, s)))
        },
        v = e => {
            let t = e.currentTarget;
            if (!t) return;
            let r = t.querySelectorAll("[data-autofocus-priority]");
            if (0 === r.length) return;
            let a = [];
            r.forEach(e => {
                let t = parseInt(e.getAttribute("data-autofocus-priority") || "", 10);
                !Number.isNaN(t) && e instanceof HTMLElement && a.push({
                    element: e,
                    priority: t
                })
            }), a.sort((e, t) => e.priority - t.priority);
            let i = a.find(e => {
                var t, r;
                return ("function" != typeof(r = t = e.element).checkVisibility || r.checkVisibility()) && !("disabled" in t && t.disabled || "true" === t.getAttribute("aria-disabled"))
            });
            if (i) {
                var l;
                e.preventDefault();
                let t = document.activeElement === i.element;
                i.element.focus(), !t && (l = i.element) instanceof HTMLInputElement && "function" == typeof l.select && l.select()
            }
        };
    var y = e.i(855790),
        x = e.i(806887);
    let S = (0, i.createContext)(null),
        E = () => {
            let e = (0, i.useContext)(S);
            if (!e) throw Error("Sheet components must be used within a Sheet");
            return e
        },
        R = "padding-x-xlarge",
        C = (0, i.forwardRef)((e, t) => {
            let {
                children: r,
                className: l,
                hasPaddingX: n = !0,
                ...s
            } = e, {
                type: o
            } = E();
            return i.default.createElement("div", {
                ref: t,
                className: (0, a.default)("scroll-y", n && R, "sideSheet" === o ? "grow-1" : "", l),
                ...s
            }, r)
        });
    C.displayName = "SheetBody", e.s(["SheetActions", 0, e => {
        let {
            children: t,
            className: r,
            ...l
        } = e;
        return i.default.createElement(i.default.Fragment, null, i.default.createElement(g, null), i.default.createElement("div", {
            className: (0, a.default)(R, "margin-y-small shrink-0", r),
            ...l
        }, t))
    }, "SheetBody", 0, C, "SheetContent", 0, e => {
        let t, {
                children: r,
                centerSheetSize: l = "Medium",
                largeScreenVariant: n = "center",
                closeLabel: s,
                className: o,
                mobilePortraitClassName: d,
                mobileLandscapeClassName: c,
                largeScreenClassName: u,
                onOpenAutoFocus: m,
                onCloseAutoFocus: f,
                onPointerDownOutside: p,
                onEscapeKeyDown: g,
                onInteractOutside: b
            } = e,
            x = (0, y.useMediaQuery)("(orientation: portrait) and (max-width: 600px)"),
            E = (0, y.useMediaQuery)("(orientation: landscape) and (max-height: 600px)");
        t = x ? "bottomSheet" : E || "side" === n ? "sideSheet" : "centerSheet";
        let R = (0, i.useMemo)(() => ({
                centerSheetSize: l,
                largeScreenVariant: n,
                closeLabel: s,
                isPortraitMobile: x,
                isLandscapeMobile: E,
                type: t
            }), [l, n, s, x, E, t]),
            C = (0, a.default)(o, x && d, E && c, !x && !E && u);
        return i.default.createElement(S.Provider, {
            value: R
        }, i.default.createElement(h, {
            type: t,
            sideSheetSide: "right",
            isSideSheetFlush: E,
            centerSheetSize: l,
            contentClassName: C,
            onOpenAutoFocus: m ?? v,
            onCloseAutoFocus: f,
            onPointerDownOutside: p,
            onEscapeKeyDown: g,
            onInteractOutside: b
        }, r))
    }, "SheetRoot", 0, e => {
        let {
            open: t,
            onOpenChange: r,
            defaultOpen: a,
            children: l
        } = e;
        return i.default.createElement(b.Root, {
            open: t,
            onOpenChange: r,
            defaultOpen: a,
            modal: !0
        }, l)
    }, "SheetTitle", 0, e => {
        let {
            className: t,
            children: r,
            navigation: l,
            utilities: n,
            visuallyHideTitleText: s
        } = e, {
            closeLabel: o
        } = E(), d = i.default.createElement(b.Title, {
            className: "text-heading-small margin-none"
        }, r);
        return i.default.createElement("div", {
            className: (0, a.default)(t, l ? "padding-left-medium" : "padding-left-xlarge", "padding-right-small padding-y-small", "flex items-center justify-between")
        }, i.default.createElement("div", {
            className: (0, a.default)("flex items-center", l && "gap-xsmall")
        }, l, s ? i.default.createElement(x.VisuallyHidden, null, d) : d), i.default.createElement("div", {
            className: (0, a.default)("flex items-center", n && "gap-xxsmall")
        }, n, i.default.createElement("div", {
            className: "fui-sheet-close-affordance-container"
        }, i.default.createElement(b.Close, {
            asChild: !0
        }, i.default.createElement(p, {
            variant: "Utility",
            size: "Medium",
            icon: "icon-regular-x",
            ariaLabel: o || "",
            "data-autofocus-priority": "1000"
        })))))
    }], 660053)
}, 190187, e => {
    "use strict";
    var t = e.i(306627),
        r = e.i(7284),
        a = e.i(420482);
    let i = {
            Neutral: "bg-shift-200",
            Standard: "bg-shift-200",
            Contrast: "bg-system-contrast",
            Emphasis: "bg-system-emphasis",
            Success: "bg-[rgb(from_var(--color-system-success)_r_g_b_/_0.2)]",
            Warning: "bg-[rgb(from_var(--color-system-warning)_r_g_b_/_0.2)]",
            Alert: "bg-[rgb(from_var(--color-system-alert)_r_g_b_/_0.2)]",
            OverMediaLight: "bg-[var(--light-mode-over-media-0)]",
            OverMedia: "bg-over-media-0"
        },
        l = {
            Neutral: "content-emphasis",
            Standard: "content-emphasis",
            Contrast: "content-inverse-emphasis",
            Emphasis: "content-[var(--dark-mode-content-emphasis)]",
            Success: "content-emphasis",
            Warning: "content-emphasis",
            Alert: "content-emphasis",
            OverMediaLight: "content-[var(--light-mode-content-emphasis)]",
            OverMedia: "content-emphasis"
        },
        n = {
            Neutral: "content-emphasis",
            Standard: "content-emphasis",
            Contrast: "content-inverse-emphasis",
            Emphasis: "content-[var(--dark-mode-content-emphasis)]",
            Success: "content-system-success",
            Warning: "content-system-warning",
            Alert: "content-system-alert",
            OverMediaLight: "content-[var(--light-mode-content-emphasis)]",
            OverMedia: "content-emphasis"
        },
        s = {
            Neutral: "stroke-none",
            Standard: "stroke-none",
            Contrast: "stroke-none",
            Emphasis: "stroke-none",
            Success: "stroke-none",
            Warning: "stroke-none",
            Alert: "stroke-none",
            OverMediaLight: "stroke-none",
            OverMedia: "stroke-none"
        },
        o = {
            Small: "height-600",
            XSmall: "height-400"
        },
        d = {
            Small: "padding-x-small",
            XSmall: "padding-x-xsmall"
        },
        c = {
            Small: "width-600",
            XSmall: "width-400"
        },
        u = {
            Small: "text-label-small",
            XSmall: "text-caption-small"
        },
        m = {
            Small: "padding-y-xsmall",
            XSmall: "padding-y-none"
        },
        f = {
            Small: "XSmall",
            XSmall: "XSmall"
        },
        p = {
            Pill: "radius-circle",
            Box: "radius-small"
        },
        g = a.default.forwardRef((e, g) => {
            let {
                className: b,
                label: h,
                variant: v = "Standard",
                icon: y,
                iconPosition: x = "Leading",
                size: S = "Small",
                shape: E = "Pill",
                ...R
            } = e, C = y && !h, k = "padding-x-xxsmall";
            y && (k = "Leading" === x ? "padding-right-xxsmall" : "padding-left-xxsmall");
            let _ = y && a.default.createElement(t.Icon, {
                name: y,
                size: f[S],
                className: n[v]
            });
            return a.default.createElement("div", {
                ref: g,
                ...R,
                className: (0, r.default)("foundation-web-badge flex items-center select-none gap-[var(--size-150)]", p[E], o[S], C ? [c[S], "justify-center"] : ["width-[fit-content]", d[S]], i[v], l[v], s[v], b)
            }, "Leading" === x && _, h && a.default.createElement("span", {
                className: (0, r.default)("text-no-wrap text-truncate-split", u[S], m[S], k, l[v])
            }, h), "Trailing" === x && _)
        });
    g.displayName = "Badge", e.s(["Badge", 0, g])
}, 910866, e => {
    "use strict";
    e.s(["INTRODUCTORY_DISCOUNT_DAYS", 0, 60, "ONE_ROBUX_IN_MICROS", 0, 1e6, "PLUS_REFERRALS_PATH", 0, "/plus?referrals", "REFERRAL_REWARD_ROBUX", 0, 100, "SUBSCRIPTION_TERMS_URL", 0, "https://www.roblox.com/info/terms"])
}, 801354, e => {
    "use strict";
    var t = e.i(176489),
        r = e.i(231756),
        a = e.i(420482);
    let i = e => {
        let {
            width: t,
            height: r
        } = e;
        return a.default.createElement("svg", {
            className: "foundation-web-loading-spinner",
            width: t,
            height: r,
            viewBox: "0 0 20 20",
            fill: "none",
            xmlns: "http://www.w3.org/2000/svg"
        }, a.default.createElement("path", {
            fillRule: "evenodd",
            clipRule: "evenodd",
            fill: "currentColor",
            d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
        }))
    };
    var l = e.i(306627),
        n = e.i(7284),
        s = e.i(919403);
    let o = {
            Large: 24,
            Medium: 20,
            Small: 16,
            XSmall: 12
        },
        d = {
            Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
            Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
            Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
            XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
        },
        c = {
            Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
            Standard: ["bg-action-standard", "content-action-standard"],
            SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
            Utility: ["bg-action-subtle", "content-action-standard"],
            Link: ["bg-action-link", "content-system-emphasis"],
            Alert: ["bg-action-alert", "content-action-alert"],
            ActionUtility: ["bg-action-subtle", "content-action-standard"]
        },
        u = {
            Emphasis: ["bg-action-standard", "content-action-standard"],
            Standard: ["bg-action-standard", "content-action-standard"],
            SoftEmphasis: ["bg-action-standard", "content-action-standard"],
            Utility: ["bg-action-subtle", "content-action-standard"],
            Link: ["bg-action-link", "content-system-emphasis"],
            Alert: ["bg-action-standard", "content-action-standard"],
            ActionUtility: ["bg-action-subtle", "content-action-standard"]
        },
        m = (0, a.forwardRef)((e, m) => {
            let {
                children: f,
                className: p,
                style: g,
                isDisabled: b = !1,
                isLoading: h = !1,
                icon: v,
                size: y = "Large",
                variant: x = "Emphasis",
                asChild: S,
                ...E
            } = e, R = (0, n.default)("foundation-web-button", b ? r.disabledOpacity : [t.interactable, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", d[y], b ? u[x] : c[x], p), C = {
                textDecoration: "none",
                ...g
            }, k = e => a.default.createElement(a.default.Fragment, null, a.default.createElement(t.StateLayer, null), h && a.default.createElement("div", {
                "aria-hidden": "true",
                className: "absolute flex"
            }, a.default.createElement(i, {
                width: o[y],
                height: o[y]
            })), a.default.createElement("span", {
                className: (0, n.default)("flex items-center min-width-0", "Large" === y || "Medium" === y ? "gap-small" : "gap-xsmall", h && "invisible")
            }, v && a.default.createElement(l.Icon, {
                name: v,
                size: y
            }), a.default.createElement("span", {
                className: "padding-y-xsmall text-truncate-end text-no-wrap"
            }, e)));
            if (S) {
                let {
                    as: e,
                    ...t
                } = E, r = a.default.Children.only(f);
                return a.default.createElement(s.Slot, {
                    ref: m,
                    ...t,
                    className: R,
                    style: C,
                    "aria-disabled": b || void 0
                }, a.default.cloneElement(r, {}, k(r.props.children)))
            }
            if ("a" === E.as) {
                let {
                    as: e,
                    href: t,
                    ...r
                } = E;
                return a.default.createElement("a", {
                    ref: m,
                    ...r,
                    "aria-disabled": b,
                    href: b ? void 0 : t,
                    className: R,
                    style: C
                }, k(f))
            }
            let {
                as: _,
                ...w
            } = E;
            return a.default.createElement("button", {
                ref: m,
                type: "button",
                ...w,
                disabled: b,
                className: R,
                style: C
            }, k(f))
        });
    e.s(["Button", 0, m], 801354)
}, 482131, e => {
    "use strict";
    var t = e.i(19836),
        r = e.i(309380),
        a = e.i(851460),
        i = e.i(801354),
        l = e.i(420482),
        n = e.i(357355);
    e.s(["default", 0, e => {
        let {
            productType: s,
            productId: o,
            deviceMeta: d,
            variant: c = "Emphasis",
            size: u,
            className: m,
            isDisabled: f = !1,
            redirectUrl: p,
            referrerId: g,
            paymentSessionId: b,
            onSubscribeClick: h,
            onMobilePurchaseInitiated: v,
            isLoading: y,
            children: x,
            trackSubscriptionButtonClick: S,
            loadingStateDisabled: E = !1
        } = e, [R, C] = (0, l.useState)(!1), k = d.isAndroidApp || d.isIosApp, _ = s === r.ProductType.Blackbird ? "RobloxPlus" : s, w = a.UrlSearchParams.new({
            ctx: "subscription",
            type: _,
            id: o,
            ...b ? {
                paymentSessionId: b
            } : {},
            ...g ? {
                referrerId: g
            } : {},
            ...!k && p ? {
                redirectUrl: p
            } : {}
        }), I = `${k?"/mobile-app-upgrades/buy":"/upgrades/paymentmethods"}?${w.toString()}`, N = (0, l.useCallback)(() => {
            if (!f && I) {
                if (S?.(), p && function(e) {
                        try {
                            let t = JSON.stringify({
                                url: e,
                                ts: Date.now()
                            });
                            n.window?.sessionStorage.setItem("roblox_subscription_redirect_url", t)
                        } catch {}
                    }(p), h?.(), k) return void v?.();
                C(!0)
            }
        }, [f, I, S, p, h, k, v]);
        return (0, t.jsx)(i.Button, {
            as: "a",
            className: m,
            href: I,
            isDisabled: f || !I,
            isLoading: E ? void 0 : y ?? R,
            size: u,
            variant: c,
            onClick: N,
            children: x
        })
    }], 482131)
}, 51267, e => {
    "use strict";
    var t = e.i(19836),
        r = e.i(309380),
        a = e.i(431545),
        i = e.i(306627),
        l = e.i(782009),
        n = e.i(420482),
        s = e.i(910866);
    let o = e => {
        let {
            iconName: r,
            label: a
        } = e;
        return (0, t.jsxs)("div", {
            className: "gap-x-medium items-center flex flex-row",
            children: [(0, t.jsx)(i.Icon, {
                name: r,
                size: "Large"
            }), (0, t.jsx)("span", {
                className: "[font-size:var(--font-size-350)]",
                children: a
            })]
        })
    };
    e.s(["BenefitItem", 0, o, "default", 0, e => {
        let {
            featureConfig: i,
            currencySubscriptionBenefit: d,
            freeTrialOffer: c
        } = e, {
            translate: u
        } = (0, a.useTranslation)(), m = (0, l.useFormatter)(), f = c?.freeTrialOffer?.periodType === r.PeriodType.Week ? s.INTRODUCTORY_DISCOUNT_DAYS + 7 * c.freeTrialOffer.duration : s.INTRODUCTORY_DISCOUNT_DAYS, p = (0, n.useMemo)(() => i.virtualTransactionDiscounts?.find(e => 0 === e.periodIndex), [i]), g = (0, n.useMemo)(() => i.virtualTransactionDiscounts?.filter(e => e.periodIndex > 0).reduce((e, t) => null === e || t.periodIndex < e.periodIndex ? t : e, null), [i]);
        return (0, t.jsxs)("div", {
            className: "gap-y-xlarge flex flex-col",
            children: [p && (g ? (0, t.jsx)(o, {
                iconName: "icon-regular-tag",
                label: u("Description.Benefit.DiscountV3", {
                    trialUnlockDays: m.number(f)
                })
            }) : (0, t.jsx)(o, {
                iconName: "icon-regular-tag",
                label: u("Description.Benefit.DiscountBase", {
                    discountPercent: m.number(.01 * p.discountPercent, {
                        style: "percent"
                    })
                })
            })), (0, t.jsx)(o, {
                iconName: "icon-regular-paint-brush",
                label: u("Description.Benefit.Customize")
            }), (0, t.jsx)(o, {
                iconName: "icon-regular-controller",
                label: u("Label.BlackbirdPSDiscount")
            }), d && d.entitledAmountMicrosPerGrantingPeriod > 0 && (0, t.jsx)(o, {
                iconName: "icon-regular-robux",
                label: u("Description.Benefit.RobuxStipend", {
                    amount: m.number(Math.round(d.entitledAmountMicrosPerGrantingPeriod / s.ONE_ROBUX_IN_MICROS)),
                    periodType: d.grantingPeriodType
                })
            }), i.isRobuxTransferEnabled && (0, t.jsx)(o, {
                iconName: "icon-regular-robux",
                label: u("Description.Benefit.RobuxTransfers")
            }), i.isTradingEnabled && (0, t.jsx)(o, {
                iconName: "icon-regular-hand-two-arrows-horizontal",
                label: u("Description.Benefit.TradeResellItems")
            }), i.isUgcPublishingEnabled && (0, t.jsx)(o, {
                iconName: "icon-regular-arrow-up-from-landscape-rectangle",
                label: u("Description.Benefit.PublishItems")
            })]
        })
    }])
}, 836260, e => {
    "use strict";
    var t = e.i(782009),
        r = e.i(420482);
    e.s(["default", 0, (e, a) => {
        let i = (0, t.useFormatter)();
        return (0, r.useMemo)(() => {
            let t = e.units + 1e-9 * e.nanos;
            return i.number(t, {
                style: "currency",
                currency: e.currencyCode,
                ...a
            })
        }, [i, e, a])
    }])
}, 882792, e => {
    "use strict";
    let t = (0, e.i(333982).createFireTelemetryCounter)("SubscriptionsCommon");
    e.s(["trackCounter", 0, function(e, r) {
        t(e, r)
    }])
}, 31081, e => {
    "use strict";
    var t = e.i(908740);
    e.s(["useResolvedColorMode", () => t.default])
}, 739472, e => {
    "use strict";
    e.s(["isReferralEnabled", 0, () => (() => {
        if ("u" < typeof document) return null;
        let e = document.querySelector('meta[name="subscription-referral-data"]');
        return e?.dataset ?? null
    })()?.isEnabled === "true"])
}, 641928, e => {
    "use strict";
    var t = e.i(245837),
        r = e.i(764925),
        a = e.i(309380),
        i = e.i(357355);
    let {
        apiGatewayUrl: l,
        domain: n
    } = t.EnvironmentUrls, s = new r.Configuration({
        robloxSiteDomain: n,
        basePath: `${l}/subscriptions`,
        credentials: "include"
    }), o = new a.SubscriptionsV2Api(s);
    e.s(["resolveReferrerId", 0, e => (void 0 !== e ? e : (() => {
        if (!i.window) return;
        let e = new URLSearchParams(i.window.location.search).get("referrerId");
        if (!e) return;
        let t = Number.parseInt(e, 10);
        return Number.isFinite(t) && t > 0 ? t : void 0
    })()) ?? void 0, "subscriptionsV2Api", 0, o])
}, 570817, e => {
    e.q("https://www-assets.roblox.com/_next/static/media/plus_robux_dark.svg.13~if1d1u80n~.svg")
}, 224794, e => {
    e.q("https://www-assets.roblox.com/_next/static/media/plus_robux_light.svg.08j32l7udorcv.svg")
}, 283023, e => {
    "use strict";
    var t, r = ((t = {}).BuyRobuxPage = "buyRobuxPage", t.Flyout = "flyout", t.DirectUrl = "directUrl", t);
    let a = "plus_referral_dashboard_shown",
        i = "plus_referral_copy_link_click",
        l = "plus_referral_sheet_shown",
        n = "plus_referral_subscribe_click",
        s = "plus_referral_sheet_dismissed",
        o = "plus_referral_flyout_share_shown",
        d = "plus_referral_flyout_share_click",
        c = "plus_referral_flyout_join_shown",
        u = "plus_referral_flyout_join_click",
        m = "plus_referral_flyout_upsell_shown",
        f = "plus_referral_flyout_upsell_click",
        p = "plus_referral_share_card_shown",
        g = "plus_referral_share_card_invite_click",
        b = "plus_referral_buy_robux_shown",
        h = "plus_referral_buy_robux_review_click",
        v = "plusReferral";
    e.s(["PlusReferralSurface", () => r, "getReferralEventParams", 0, {
        referrerImpression: () => ({
            name: a,
            type: a,
            context: v,
            params: {}
        }),
        referrerCopyClick: () => ({
            name: i,
            type: i,
            context: v,
            params: {}
        }),
        refereeImpression: (e, t, r, a, i) => ({
            name: l,
            type: l,
            context: v,
            params: {
                face: e,
                hasReferrerId: String(t),
                ...r ? {
                    referrerId: r
                } : {},
                ...a ? {
                    referralCode: a
                } : {},
                ...i ? {
                    surface: i
                } : {}
            }
        }),
        refereeSubscribeClick: (e, t, r, a) => ({
            name: n,
            type: n,
            context: v,
            params: {
                face: e,
                ...t ? {
                    referrerId: t
                } : {},
                ...r ? {
                    referralCode: r
                } : {},
                ...a ? {
                    surface: a
                } : {}
            }
        }),
        refereeDismissed: (e, t, r, a) => ({
            name: s,
            type: s,
            context: v,
            params: {
                face: e,
                ...t ? {
                    referrerId: t
                } : {},
                ...r ? {
                    referralCode: r
                } : {},
                ...a ? {
                    surface: a
                } : {}
            }
        }),
        flyoutShareImpression: () => ({
            name: o,
            type: o,
            context: v,
            params: {}
        }),
        flyoutShareClick: () => ({
            name: d,
            type: d,
            context: v,
            params: {}
        }),
        flyoutJoinImpression: e => ({
            name: c,
            type: c,
            context: v,
            params: {
                ...e ? {
                    referrerId: e
                } : {}
            }
        }),
        flyoutJoinClick: e => ({
            name: u,
            type: u,
            context: v,
            params: {
                ...e ? {
                    referrerId: e
                } : {}
            }
        }),
        flyoutUpsellImpression: () => ({
            name: m,
            type: m,
            context: v,
            params: {}
        }),
        flyoutUpsellClick: () => ({
            name: f,
            type: f,
            context: v,
            params: {}
        }),
        shareCardImpression: () => ({
            name: p,
            type: p,
            context: v,
            params: {}
        }),
        shareCardInviteClick: () => ({
            name: g,
            type: g,
            context: v,
            params: {}
        }),
        buyRobuxReferralImpression: (e, t) => ({
            name: b,
            type: b,
            context: v,
            params: {
                ...e ? {
                    referrerId: e
                } : {},
                ...void 0 !== t ? {
                    referralId: String(t)
                } : {}
            }
        }),
        buyRobuxReferralReviewClick: (e, t) => ({
            name: h,
            type: h,
            context: v,
            params: {
                ...e ? {
                    referrerId: e
                } : {},
                ...void 0 !== t ? {
                    referralId: String(t)
                } : {}
            }
        })
    }])
}, 907119, e => {
    "use strict";
    var t = e.i(778579),
        r = e.i(283023),
        a = e.i(882792);
    let i = e => {
        (0, t.sendEventWithTarget)(e.type, e.context, e.params)
    };
    e.s(["default", 0, {
        referrerImpression: () => {
            try {
                i(r.getReferralEventParams.referrerImpression())
            } catch {}
        },
        referrerCopyClick: () => {
            try {
                i(r.getReferralEventParams.referrerCopyClick())
            } catch {}
        },
        refereeImpression: (e, t, a, l, n) => {
            try {
                i(r.getReferralEventParams.refereeImpression(e, t, a, l, n))
            } catch {}
        },
        refereeSubscribeClick: (e, t, a, l) => {
            try {
                i(r.getReferralEventParams.refereeSubscribeClick(e, t, a, l))
            } catch {}
        },
        refereeDismissed: (e, t, a, l) => {
            try {
                i(r.getReferralEventParams.refereeDismissed(e, t, a, l))
            } catch {}
        },
        flyoutShareImpression: () => {
            try {
                i(r.getReferralEventParams.flyoutShareImpression()), (0, a.trackCounter)("FlyoutShareShown")
            } catch {}
        },
        flyoutShareClick: () => {
            try {
                i(r.getReferralEventParams.flyoutShareClick()), (0, a.trackCounter)("FlyoutShareClick")
            } catch {}
        },
        flyoutJoinImpression: e => {
            try {
                i(r.getReferralEventParams.flyoutJoinImpression(e)), (0, a.trackCounter)("FlyoutJoinShown", {
                    hasReferrerId: String(!!e)
                })
            } catch {}
        },
        flyoutJoinClick: e => {
            try {
                i(r.getReferralEventParams.flyoutJoinClick(e)), (0, a.trackCounter)("FlyoutJoinClick", {
                    hasReferrerId: String(!!e)
                })
            } catch {}
        },
        flyoutUpsellImpression: () => {
            try {
                i(r.getReferralEventParams.flyoutUpsellImpression()), (0, a.trackCounter)("FlyoutUpsellShown")
            } catch {}
        },
        flyoutUpsellClick: () => {
            try {
                i(r.getReferralEventParams.flyoutUpsellClick()), (0, a.trackCounter)("FlyoutUpsellClick")
            } catch {}
        },
        shareCardImpression: () => {
            try {
                i(r.getReferralEventParams.shareCardImpression()), (0, a.trackCounter)("ShareCardShown")
            } catch {}
        },
        shareCardInviteClick: () => {
            try {
                i(r.getReferralEventParams.shareCardInviteClick()), (0, a.trackCounter)("ShareCardInviteClick")
            } catch {}
        },
        buyRobuxReferralImpression: (e, t) => {
            try {
                i(r.getReferralEventParams.buyRobuxReferralImpression(e, t)), (0, a.trackCounter)("BuyRobuxReferralShown", {
                    hasReferrerId: String(!!e)
                })
            } catch {}
        },
        buyRobuxReferralReviewClick: (e, t) => {
            try {
                i(r.getReferralEventParams.buyRobuxReferralReviewClick(e, t)), (0, a.trackCounter)("BuyRobuxReferralReviewClick", {
                    hasReferrerId: String(!!e)
                })
            } catch {}
        }
    }])
}, 858836, e => {
    "use strict";
    var t = e.i(641928),
        r = e.i(708923);
    e.s(["useCreateSubscriptionReferral", 0, function() {
        let {
            referrerId: e,
            enabled: a = !0
        } = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {}, i = Number.parseInt(e ?? "", 10), l = Number.isFinite(i) && i > 0, n = a && l, {
            data: s,
            isLoading: o
        } = (0, r.useQuery)({
            queryKey: ["plus-referrals", "create", i],
            enabled: n,
            staleTime: 1 / 0,
            queryFn: async () => {
                if (!l) return;
                let {
                    referralId: e
                } = await t.subscriptionsV2Api.subscriptionsV2CreateSubscriptionReferral({
                    referrerId: i
                });
                return e
            }
        });
        return {
            referralId: s,
            isLoading: n && o
        }
    }])
}, 101538, 199196, 41621, e => {
    "use strict";
    var t = e.i(309380),
        r = e.i(341332),
        a = e.i(641928),
        i = e.i(708923),
        l = e.i(420482),
        n = e.i(910866);
    let s = e => Math.floor((e.productTypeDetails.robloxSubscriptionProductDetails?.featureConfig.currencySubscriptionConfig?.entitledAmountMicros ?? 0) / n.ONE_ROBUX_IN_MICROS);
    e.s(["usePlusSubscribeProduct", 0, function() {
        let {
            enabled: e = !0
        } = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {}, n = (0, a.resolveReferrerId)(), {
            data: o,
            isLoading: d
        } = (0, i.useQuery)({
            queryKey: ["plus-referrals", "subscribe-product", n ?? null],
            enabled: e,
            staleTime: 1 / 0,
            queryFn: async () => {
                let {
                    products: e
                } = await a.subscriptionsV2Api.subscriptionsV2ListAvailableSubscriptionProducts({
                    productType: t.ProductType.Blackbird,
                    includePurchased: !0,
                    includeBundles: !0,
                    skipEligibilityCheck: !0,
                    referrerId: n
                });
                return e.toSorted((e, t) => s(e) - s(t)).at(0) ?? null
            }
        });
        return {
            subscribeButtonProps: (0, l.useMemo)(() => {
                let e = (0, r.getDeviceMeta)();
                if (null != o && null !== e) return {
                    productId: o.productKey.id,
                    productType: o.productKey.type,
                    deviceMeta: e
                }
            }, [o]),
            subscribePrice: o?.localizedPrice,
            subscribePeriodType: o?.periodType,
            subscribeFeatureConfig: o?.productTypeDetails.robloxSubscriptionProductDetails?.featureConfig,
            subscribeEligibleOffers: o?.eligibleOffers,
            isLoading: e && d
        }
    }], 101538);
    let o = new Map([
        ["Invalid", "Invalid"],
        ["Eligible", "Eligible"],
        ["Ineligible", "Ineligible"],
        [t.SubscriptionReferralEligibility.NUMBER_0, "Invalid"],
        [t.SubscriptionReferralEligibility.NUMBER_1, "Eligible"],
        [t.SubscriptionReferralEligibility.NUMBER_2, "Ineligible"]
    ]);
    e.s(["useReferralEligibility", 0, function() {
        let {
            referrerId: e,
            enabled: t = !0
        } = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {}, r = Number.parseInt(e ?? "", 10), l = Number.isFinite(r) && r > 0, n = t && l, {
            data: s,
            isLoading: d
        } = (0, i.useQuery)({
            queryKey: ["plus-referrals", "eligibility", r],
            enabled: n,
            queryFn: async () => {
                if (!l) return;
                let {
                    eligibility: e
                } = await a.subscriptionsV2Api.subscriptionsV2CheckSubscriptionReferralEligibility({
                    referrerId: r
                });
                return o.get(e)
            }
        });
        return {
            eligibility: s,
            isLoading: n && d
        }
    }], 199196);
    var d = e.i(646424),
        c = e.i(587541),
        u = e.i(245837);
    e.i(350223);
    var m = e.i(874296);
    let f = m.object({
        name: m.string(),
        isBanned: m.boolean()
    });
    e.s(["useReferrerHandle", 0, e => {
        let t = Number.parseInt(e ?? "", 10),
            r = Number.isFinite(t) && t > 0,
            {
                data: a,
                isLoading: l
            } = (0, i.useQuery)({
                queryKey: ["plus-referrals", "referrer", t],
                enabled: r,
                retry: !1,
                queryFn: () => {
                    let e;
                    return e = t, d.get(c.Url.parse(u.default.usersApi).getOrThrow().withPath(`/v1/users/${e}`), f, {
                        credentials: "include"
                    }).getOrThrow().then(e => {
                        if (e.isBanned) throw Error("Referrer is withheld");
                        return e
                    })
                }
            });
        return {
            handle: a ? `@${a.name}` : void 0,
            isLoading: r && l
        }
    }], 41621)
}, 938759, e => {
    "use strict";
    var t = e.i(19836),
        r = e.i(309380),
        a = e.i(739472),
        i = e.i(570817),
        l = e.i(224794),
        n = e.i(801354),
        s = e.i(306627),
        o = e.i(660053),
        d = e.i(380688),
        c = e.i(564035),
        u = e.i(745911),
        m = e.i(361185),
        f = e.i(420482),
        p = e.i(51267),
        g = e.i(907119),
        b = e.i(858836),
        h = e.i(836260),
        v = e.i(101538),
        y = e.i(199196),
        x = e.i(41621),
        S = e.i(910866),
        E = e.i(882792),
        R = e.i(482131);
    let C = "margin-x-auto width-full max-width-[200px] medium:max-width-[320px]",
        k = "margin-bottom-[-8px]",
        _ = {
            currencyCode: "USD",
            units: 0,
            nanos: 0
        },
        w = {
            invalid: {
                key: "Description.ReferralInvalid",
                fallback: "This referral link is no longer valid. You can still join Roblox Plus without the referral reward."
            },
            ineligible: {
                key: "Description.ReferralIneligible",
                fallback: "This referral reward is not available on your account. You can still join Roblox Plus."
            }
        },
        I = e => {
            let {
                face: a,
                open: b,
                onOpenChange: v,
                referralCode: y,
                referrerUserId: I,
                surface: N,
                subscribeButtonProps: P,
                subscribePrice: L,
                subscribePeriodType: T,
                featureConfig: M
            } = e, j = (0, m.useTranslations)("Feature.RobloxSubscription"), z = function(e, t) {
                let r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "";
                return j.has(e) ? j(e, t) : r
            }, A = "pitch" === a, U = (0, u.useFormatter)().number(S.REFERRAL_REWARD_ROBUX), O = (0, h.default)(L ?? _), {
                handle: D,
                isLoading: B
            } = (0, x.useReferrerHandle)(A ? I : void 0), F = z("Heading.ReferralRecipientJoin", void 0, "Join Plus, get"), X = z("Action.ReferralJoinPlus", void 0, "Join Roblox Plus"), $ = z("Action.Subscribe", void 0, "Subscribe"), q = (0, f.useMemo)(() => {
                let e, t = void 0 !== y ? (e = new URLSearchParams({
                    ctx: "plus_referral",
                    referralCode: y
                }), I && e.set("referrerId", I), `/plus?${e.toString()}`) : void 0;
                return {
                    ...P,
                    redirectUrl: P.redirectUrl ?? t,
                    referrerId: P.referrerId ?? I
                }
            }, [y, I, P]), W = [{
                opening: "linkStartRef",
                closing: "linkEndRef",
                render: e => (0, t.jsx)("a", {
                    className: "content-link underline",
                    href: "https://en.help.roblox.com/hc/en-us/articles/52737229124628",
                    rel: "noopener noreferrer",
                    target: "_blank",
                    children: e
                })
            }, {
                opening: "linkStart",
                closing: "linkEnd",
                render: e => (0, t.jsx)("a", {
                    className: "content-link underline",
                    href: S.SUBSCRIPTION_TERMS_URL,
                    rel: "noopener noreferrer",
                    target: "_blank",
                    children: e
                })
            }], V = (0, f.useRef)(!1);
            (0, f.useEffect)(() => {
                b && (V.current = !1)
            }, [b]);
            let J = (0, f.useCallback)(() => {
                    V.current = !0, g.default.refereeSubscribeClick(a, I, y, N), (0, E.trackCounter)("ReferralSubscribeClick", {
                        face: a,
                        ...N ? {
                            surface: N
                        } : {}
                    })
                }, [a, I, y, N]),
                Y = (0, f.useCallback)(e => {
                    e || V.current || (g.default.refereeDismissed(a, I, y, N), (0, E.trackCounter)("ReferralDismissed", {
                        face: a,
                        ...N ? {
                            surface: N
                        } : {}
                    })), v(e)
                }, [a, v, I, y, N]);
            return (0, t.jsx)(o.SheetRoot, {
                open: b,
                onOpenChange: Y,
                children: (0, t.jsxs)(o.SheetContent, {
                    centerSheetSize: "Medium",
                    className: A ? "[&>[role=separator]]:[display:none]" : void 0,
                    closeLabel: z("Action.Close"),
                    largeScreenVariant: "center",
                    children: [(0, t.jsx)(o.SheetTitle, {
                        visuallyHideTitleText: !0,
                        children: A ? `${F} ${U}` : X
                    }), "pitch" === a ? (0, t.jsxs)(o.SheetBody, {
                        className: "gap-y-medium padding-top-small padding-bottom-small medium:padding-top-medium medium:padding-bottom-medium flex flex-col",
                        children: [(0, t.jsx)("img", {
                            alt: "",
                            className: `${C} ${k} dark:hidden`,
                            src: (0, c.assetUrl)(l.default)
                        }), (0, t.jsx)("img", {
                            alt: "",
                            className: `${C} ${k} hidden dark:block`,
                            src: (0, c.assetUrl)(i.default)
                        }), (0, t.jsxs)("div", {
                            className: "gap-y-medium text-align-x-left flex flex-col items-start",
                            children: [(0, t.jsxs)("div", {
                                className: "text-heading-small medium:text-heading-medium content-emphasis margin-none gap-x-xsmall flex flex-wrap items-center justify-start",
                                style: {
                                    fontFamily: '"Builder Extended", "Builder Sans", sans-serif'
                                },
                                children: [F, (0, t.jsxs)("span", {
                                    className: "gap-x-xsmall inline-flex items-center",
                                    children: [(0, t.jsx)(s.Icon, {
                                        name: "icon-regular-robux",
                                        size: "Large"
                                    }), U]
                                })]
                            }), B ? (0, t.jsx)("div", {
                                className: "bg-shift-100 radius-medium height-[40px] width-full"
                            }) : D ? (0, t.jsx)("p", {
                                className: "text-body-small medium:text-body-medium content-default margin-none",
                                children: z("Description.ReferralRecipientInvitedBy", {
                                    displayName: D,
                                    amount: U
                                }, `${D} invited you to join Plus. You'll both get ${U} Robux when you join.`)
                            }) : null]
                        }), L && (0, t.jsx)("p", {
                            className: "text-title-medium content-emphasis margin-none",
                            children: z("Action.PricePerMonth", {
                                price: O,
                                periodType: T ?? r.PeriodType.Month
                            })
                        }), M && (0, t.jsx)(p.default, {
                            featureConfig: {
                                ...M,
                                isTradingEnabled: !1,
                                isUgcPublishingEnabled: !1
                            },
                            periodType: T ?? r.PeriodType.Month
                        })]
                    }) : (0, t.jsxs)(o.SheetBody, {
                        className: "gap-y-large padding-top-large padding-bottom-medium medium:padding-top-xlarge medium:padding-bottom-large flex flex-col items-center text-center",
                        children: [(0, t.jsx)(s.Icon, {
                            className: "content-emphasis !size-1800 medium:!size-2200",
                            name: "icon-regular-triangle-exclamation",
                            size: "XLarge"
                        }), (0, t.jsx)("p", {
                            className: "text-body-small medium:text-body-medium content-emphasis margin-none",
                            children: z(w[a].key, void 0, w[a].fallback)
                        })]
                    }), A ? (0, t.jsx)(o.SheetActions, {
                        children: (0, t.jsxs)("div", {
                            className: "gap-y-medium width-full flex flex-col",
                            children: [(0, t.jsx)(R.default, {
                                ...q,
                                className: "width-full",
                                size: "Large",
                                trackSubscriptionButtonClick: J,
                                variant: "Emphasis",
                                children: $
                            }), (0, t.jsx)("span", {
                                className: "text-caption-medium content-muted",
                                children: (0, d.translateHtml)(z, "Description.ReferralRecipientLegalDisclosure", W)
                            })]
                        })
                    }) : (0, t.jsxs)(o.SheetActions, {
                        className: "gap-y-small flex flex-col",
                        children: [(0, t.jsx)(R.default, {
                            ...P,
                            className: "width-full",
                            size: "Large",
                            trackSubscriptionButtonClick: J,
                            variant: "Emphasis",
                            children: X
                        }), (0, t.jsx)(n.Button, {
                            className: "width-full",
                            size: "Large",
                            variant: "Standard",
                            onClick: () => {
                                Y(!1)
                            },
                            children: z("Action.Cancel", void 0, "Cancel")
                        })]
                    })]
                })
            })
        },
        N = e => {
            let {
                face: t,
                hasReferrerId: r,
                referrerId: a,
                referralCode: i,
                surface: l,
                open: n
            } = e, s = (0, f.useRef)(!1);
            return (0, f.useEffect)(() => {
                !s.current && n && (s.current = !0, (0, E.trackCounter)("PlusReferralSheetShown", {
                    face: t,
                    hasReferrerId: String(r),
                    ...l ? {
                        surface: l
                    } : {}
                }), g.default.refereeImpression(t, r, a, i, l))
            }, [t, r, a, i, l, n]), null
        };
    e.s(["default", 0, e => {
        let {
            open: r,
            onOpenChange: i,
            invite: l,
            surface: n,
            isReferralRolloutEnabled: s = (0, a.isReferralEnabled)(),
            subscribeButtonProps: o,
            subscribePrice: d,
            subscribePeriodType: c,
            subscribeFeatureConfig: u,
            subscribeEligibleOffers: m
        } = e, p = void 0 !== l && s, {
            eligibility: g,
            isLoading: h
        } = (0, y.useReferralEligibility)({
            referrerId: l?.referrerId,
            enabled: p
        }), {
            subscribeButtonProps: x,
            subscribePrice: S,
            subscribePeriodType: E,
            subscribeFeatureConfig: R,
            isLoading: C
        } = (0, v.usePlusSubscribeProduct)({
            enabled: void 0 === o || void 0 === d || void 0 === u || void 0 === m
        }), k = o ?? x;
        if ((0, b.useCreateSubscriptionReferral)({
                referrerId: l?.referrerId,
                enabled: p && void 0 !== l.code && "Eligible" === g
            }), h) return null;
        let _ = p && "Eligible" === g ? "pitch" : "Ineligible" === g ? "ineligible" : "invalid";
        return "pitch" === _ && C || void 0 === k ? null : (0, t.jsxs)(f.default.Fragment, {
            children: [(0, t.jsx)(N, {
                face: _,
                hasReferrerId: l?.referrerId !== void 0,
                open: r,
                referralCode: l?.code,
                referrerId: l?.referrerId,
                surface: n
            }), (0, t.jsx)(I, {
                face: _,
                featureConfig: u ?? R,
                open: r,
                referralCode: l?.code,
                referrerUserId: l?.referrerId,
                subscribeButtonProps: k,
                subscribePeriodType: void 0 !== d ? c : E,
                subscribePrice: d ?? S,
                surface: n,
                onOpenChange: i
            })]
        })
    }])
}, 992228, e => {
    "use strict";
    var t = e.i(778935),
        r = e.i(7284),
        a = e.i(420482);
    let i = {
            XSmall: "size-600",
            Small: "size-800",
            Medium: "size-1000",
            Large: "size-1200",
            XLarge: "size-1400",
            Pictogram: "size-2400"
        },
        l = {
            XSmall: "text-caption-small",
            Small: "text-label-small",
            Medium: "text-label-medium",
            Large: "text-title-small",
            XLarge: "text-title-medium",
            Pictogram: "text-display-small"
        },
        n = {
            XSmall: "var(--icon-size-small)",
            Small: "var(--icon-size-medium)",
            Medium: "var(--icon-size-large)",
            Large: "var(--icon-size-xlarge)",
            XLarge: "var(--size-900)",
            Pictogram: "var(--size-1600)"
        },
        s = {
            XSmall: "var(--size-150)",
            Small: "var(--size-150)",
            Medium: "var(--size-200)",
            Large: "var(--size-200)",
            XLarge: "var(--size-250)",
            Pictogram: "var(--size-500)"
        },
        o = {
            XSmall: "1.5px",
            Small: "1.5px",
            Medium: "2px",
            Large: "2px",
            XLarge: "2.5px",
            Pictogram: "5px"
        },
        d = {
            XSmall: {
                right: 0,
                bottom: 0
            },
            Small: {
                right: 0,
                bottom: 2
            },
            Medium: {
                right: 0,
                bottom: 2
            },
            Large: {
                right: 0,
                bottom: 3
            },
            XLarge: {
                right: 3,
                bottom: 3
            },
            Pictogram: {
                right: 0,
                bottom: 4
            }
        },
        c = {
            XSmall: 10,
            Small: 12,
            Medium: 14,
            Large: 14,
            XLarge: 16,
            Pictogram: 26
        },
        u = {
            XSmall: 24,
            Small: 32,
            Medium: 40,
            Large: 48,
            XLarge: 56,
            Pictogram: 96
        },
        m = {
            XSmall: "var(--size-50)",
            Small: "var(--size-50)",
            Medium: "var(--size-50)",
            Large: "var(--size-50)",
            XLarge: "var(--size-50)",
            Pictogram: "var(--size-100)"
        },
        f = e => {
            let {
                status: t,
                size: r
            } = e;
            if ("InExperience" === t) return null;
            let i = s[r],
                l = d[r];
            return a.default.createElement("span", {
                "aria-hidden": "true",
                "data-testid": "avatar-status",
                "data-status": t,
                className: "absolute flex items-center justify-center radius-circle",
                style: {
                    width: i,
                    height: i,
                    right: l.right,
                    bottom: l.bottom,
                    boxSizing: "border-box",
                    boxShadow: "0 0 0 var(--size-50) var(--avatar-surrounding-background, var(--color-surface-100))",
                    backgroundColor: "Active" === t ? "var(--color-system-success)" : "transparent",
                    border: "Away" === t ? `${o[r]} solid var(--color-content-default)` : void 0
                }
            })
        },
        p = (0, a.forwardRef)((e, s) => {
            let {
                className: o,
                style: p,
                src: g,
                alt: b,
                size: h = "Medium",
                status: v,
                initials: y,
                icon: x = "icon-filled-person",
                hasBorder: S = !1,
                ...E
            } = e, [R, C] = (0, a.useState)(!1);
            (0, a.useEffect)(() => {
                C(!1)
            }, [g]);
            let k = !!g && !R,
                _ = !k && !!y,
                w = "InExperience" === v,
                I = "Active" === v || "Away" === v,
                N = (0, a.useMemo)(() => {
                    if (!I) return;
                    let e = u[h],
                        t = c[h] / 2,
                        r = d[h],
                        a = {
                            XSmall: 6,
                            Small: 6,
                            Medium: 8,
                            Large: 8,
                            XLarge: 10,
                            Pictogram: 20
                        } [h],
                        i = e - r.right - a / 2,
                        l = e - r.bottom - a / 2;
                    return {
                        maskImage: `radial-gradient(circle ${t+1}px at ${i}px ${l}px, transparent ${t}px, black ${t+.5}px)`,
                        WebkitMaskImage: `radial-gradient(circle ${t+1}px at ${i}px ${l}px, transparent ${t}px, black ${t+.5}px)`
                    }
                }, [I, h]),
                P = {};
            return b && !k ? P = {
                role: "img",
                "aria-label": b
            } : b || (P = {
                "aria-hidden": !0
            }), a.default.createElement("span", {
                ref: s,
                "data-testid": "avatar-root",
                ...P,
                ...E,
                className: (0, r.default)("foundation-web-avatar relative inline-flex items-center justify-center shrink-0 select-none radius-circle", i[h], !k && "content-emphasis", o),
                style: p
            }, a.default.createElement("span", {
                "data-testid": "avatar-visual",
                className: "foundation-web-avatar-visual relative flex size-full radius-circle"
            }, a.default.createElement("span", {
                "data-testid": "avatar-content",
                className: (0, r.default)("relative radius-circle flex items-center justify-center", !k && "bg-shift-200"),
                style: {
                    width: "100%",
                    height: "100%",
                    overflow: "hidden",
                    ...N
                }
            }, k && a.default.createElement("img", {
                src: g,
                alt: b ?? "",
                "data-testid": "avatar-image",
                onError: () => C(!0),
                style: {
                    width: "100%",
                    height: "100%",
                    objectFit: "cover",
                    objectPosition: "center"
                }
            }), _ && a.default.createElement("span", {
                "aria-hidden": "true",
                className: (0, r.default)("foundation-web-avatar-initials text-no-wrap", l[h])
            }, y), !k && !_ && a.default.createElement(t.Icon, {
                name: x,
                "aria-hidden": "true",
                "data-testid": "avatar-fallback-icon",
                className: "grow-0 shrink-0 basis-auto content-emphasis",
                style: {
                    width: n[h],
                    height: n[h]
                }
            })), (w || S) && a.default.createElement("span", {
                "aria-hidden": "true",
                "data-testid": w ? "avatar-inexperience-ring" : "avatar-border-ring",
                className: "absolute pointer-events-none radius-circle",
                style: {
                    inset: 0,
                    borderStyle: "solid",
                    borderWidth: m[h],
                    borderColor: w ? "var(--color-system-emphasis)" : "var(--color-stroke-default)"
                }
            })), v && a.default.createElement(f, {
                status: v,
                size: h
            }))
        });
    p.displayName = "Avatar", e.s(["Avatar", 0, p])
}]);

//# debugId=1f922f5f-6edb-760b-3b23-581e46f02680
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/14-tbo32ow04r.js.map
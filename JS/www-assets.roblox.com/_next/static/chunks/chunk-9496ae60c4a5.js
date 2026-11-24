;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "55f210f4-f0da-183c-af95-12dadeb93edf")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 31326, e => {
    "use strict";
    var t = e.i(285586);
    e.s(["captureException", 0, function() {
        for (var e = arguments.length, a = Array(e), r = 0; r < e; r++) a[r] = arguments[r];
        (0, t.captureException)(...a)
    }, "reportError", 0, (e, a) => {
        console.error(e, a), (0, t.captureException)(e, a ? {
            extra: a
        } : void 0)
    }])
}, 438058, (e, t, a) => {
    "use strict";
    t.exports = "SECRET_DO_NOT_PASS_THIS_OR_YOU_WILL_BE_FIRED"
}, 177836, (e, t, a) => {
    "use strict";
    var r = e.r(438058);

    function i() {}

    function n() {}
    n.resetWarningCache = i, t.exports = function() {
        function e(e, t, a, i, n, l) {
            if (l !== r) {
                var s = Error("Calling PropTypes validators directly is not supported by the `prop-types` package. Use PropTypes.checkPropTypes() to call them. Read more at http://fb.me/use-check-prop-types");
                throw s.name = "Invariant Violation", s
            }
        }

        function t() {
            return e
        }
        e.isRequired = e;
        var a = {
            array: e,
            bool: e,
            func: e,
            number: e,
            object: e,
            string: e,
            symbol: e,
            any: e,
            arrayOf: t,
            element: e,
            elementType: e,
            instanceOf: t,
            node: e,
            objectOf: t,
            oneOf: t,
            oneOfType: t,
            shape: t,
            exact: t,
            checkPropTypes: n,
            resetWarningCache: i
        };
        return a.PropTypes = a, a
    }
}, 254226, (e, t, a) => {
    t.exports = e.r(177836)()
}, 532486, e => {
    "use strict";
    var t = e.i(357355);
    e.s(["openAccountSettings", 0, e => {
        t.window?.location.assign("/my/account#!/personalized-recommendations")
    }])
}, 349030, 207626, e => {
    "use strict";
    var t = e.i(822969);
    t.ProductType.Blackbird.toLowerCase(), t.ProductType.Blackbird, t.ProductType.Blackbird, t.ProductType.CurrencySubscription.toLowerCase(), t.ProductType.CurrencySubscription, t.PeriodType.Week, t.PeriodType.Month, t.PeriodType.Year, t.PeriodType.Week, t.PeriodType.Month, t.PeriodType.Year;
    let a = {
            [t.PeriodType.Week]: {
                singular: "Label.SubscriptionPeriodWeek",
                plural: "Label.SubscriptionPeriodWeeks"
            },
            [t.PeriodType.Month]: {
                singular: "Label.SubscriptionPeriodMonth",
                plural: "Label.SubscriptionPeriodMonths"
            },
            [t.PeriodType.Year]: {
                singular: "Label.SubscriptionPeriodYear",
                plural: "Label.SubscriptionPeriodYears"
            }
        },
        r = {
            [t.PeriodType.Week]: {
                singular: "label.week",
                plural: "label.weeks"
            },
            [t.PeriodType.Month]: {
                singular: "Label.month",
                plural: "Label.months"
            },
            [t.PeriodType.Year]: {
                singular: "label.year",
                plural: "label.years"
            }
        };
    t.PaymentMethod.CreditAndDebitCard.toLowerCase(), t.PaymentMethod.CreditAndDebitCard, t.PaymentMethod.Paypal.toLowerCase(), t.PaymentMethod.Paypal, t.PaymentMethod.Venmo.toLowerCase(), t.PaymentMethod.Venmo, t.PaymentMethod.CreditAndDebitCard, t.PaymentProvider.Stripe, t.PaymentMethod.Paypal, t.PaymentProvider.Braintree, t.PaymentMethod.Venmo, t.PaymentProvider.Braintree, t.PaymentMethod.RobloxCredit, t.PaymentProvider.CreditBalance;
    let i = (e, t) => new Date(Date.UTC(e, t + 1, 0)).getUTCDate();

    function n(e, t) {
        let a = r[e] ?? r.Month;
        return 1 === t ? a.singular : a.plural
    }
    e.s(["addBillingPeriod", 0, function(e, a, r) {
        let n = new Date(e);
        switch (r) {
            case t.PeriodType.Week:
                return n.setUTCDate(n.getUTCDate() + 7 * a), n;
            case t.PeriodType.Month:
                let l, s, o, d;
                return l = n.getUTCMonth() + a, s = n.getUTCFullYear() + Math.floor(l / 12), o = (l % 12 + 12) % 12, d = Math.min(n.getUTCDate(), i(s, o)), new Date(Date.UTC(s, o, d, n.getUTCHours(), n.getUTCMinutes(), n.getUTCSeconds(), n.getUTCMilliseconds()));
            case t.PeriodType.Year:
                let u, c, m;
                return u = n.getUTCFullYear() + a, c = n.getUTCMonth(), m = Math.min(n.getUTCDate(), i(u, c)), new Date(Date.UTC(u, c, m, n.getUTCHours(), n.getUTCMinutes(), n.getUTCSeconds(), n.getUTCMilliseconds()));
            default:
                throw Error(`Unsupported period type: ${r}`)
        }
    }, "getFreeTrialDisplay", 0, function(e, a) {
        let r = e?.freeTrialOffer;
        if (!r) return null;
        let {
            duration: i,
            periodType: l
        } = r;
        return l !== t.PeriodType.Week && l !== t.PeriodType.Month && l !== t.PeriodType.Year || !Number.isFinite(i) || i <= 0 ? null : {
            trialDuration: i,
            trialPeriodType: l,
            trialPeriodKey: n(l, i),
            billingPeriodKey: n(a, 1)
        }
    }, "getSubscriptionPeriodTranslationKey", 0, function(e, t) {
        let r = a[e] ?? a.Month;
        return 1 === t ? r.singular : r.plural
    }], 349030);
    var l = e.i(939747);
    e.i(638516);
    var s = e.i(7284),
        o = e.i(371847),
        d = e.i(513443);
    let u = e => {
            let {
                type: t,
                sideSheetSide: a = "right",
                isSideSheetFlush: r = !1,
                centerSheetSize: i = "Medium",
                children: n,
                overlayClassName: l,
                contentClassName: u,
                onOpenAutoFocus: c,
                onCloseAutoFocus: m,
                onPointerDownOutside: f,
                onEscapeKeyDown: p,
                onInteractOutside: g
            } = e;
            return o.default.createElement(d.Portal, null, o.default.createElement(d.Overlay, {
                "data-testid": "fui-base-sheet-overlay",
                "data-type": t,
                "data-side": "sideSheet" === t ? a : void 0,
                "data-flush": "sideSheet" === t ? r : void 0,
                "data-size": "centerSheet" === t ? i : void 0,
                className: (0, s.default)("fui-base-sheet-overlay", "foundation-web-portal-zindex fixed inset-[0] flex", l)
            }, o.default.createElement(d.Content, {
                "data-testid": "fui-base-sheet-content",
                className: (0, s.default)("fui-base-sheet-content relative bg-surface-100 stroke-muted stroke-standard shadow-transient-high", "flex flex-col clip", u),
                onOpenAutoFocus: c,
                onCloseAutoFocus: m,
                onPointerDownOutside: f,
                onEscapeKeyDown: p,
                onInteractOutside: g
            }, n)))
        },
        c = e => {
            let t = e.currentTarget;
            if (!t) return;
            let a = t.querySelectorAll("[data-autofocus-priority]");
            if (0 === a.length) return;
            let r = [];
            a.forEach(e => {
                let t = parseInt(e.getAttribute("data-autofocus-priority") || "", 10);
                !Number.isNaN(t) && e instanceof HTMLElement && r.push({
                    element: e,
                    priority: t
                })
            }), r.sort((e, t) => e.priority - t.priority);
            let i = r.find(e => {
                var t, a;
                return ("function" != typeof(a = t = e.element).checkVisibility || a.checkVisibility()) && !("disabled" in t && t.disabled || "true" === t.getAttribute("aria-disabled"))
            });
            if (i) {
                var n;
                e.preventDefault();
                let t = document.activeElement === i.element;
                i.element.focus(), !t && (n = i.element) instanceof HTMLInputElement && "function" == typeof n.select && n.select()
            }
        };
    var m = e.i(855790),
        f = e.i(806887);
    let p = (0, o.createContext)(null),
        g = () => {
            let e = (0, o.useContext)(p);
            if (!e) throw Error("Sheet components must be used within a Sheet");
            return e
        },
        h = (0, o.forwardRef)((e, t) => {
            let {
                children: a,
                className: r,
                hasPaddingX: i = !0,
                ...n
            } = e, {
                type: l
            } = g();
            return o.default.createElement("div", {
                ref: t,
                className: (0, s.default)("scroll-y", i && "padding-x-xlarge", "sideSheet" === l ? "grow-1" : "", r),
                ...n
            }, a)
        });
    h.displayName = "SheetBody", e.s(["SheetBody", 0, h, "SheetContent", 0, e => {
        let t, {
                children: a,
                centerSheetSize: r = "Medium",
                largeScreenVariant: i = "center",
                closeLabel: n,
                className: l,
                mobilePortraitClassName: d,
                mobileLandscapeClassName: f,
                largeScreenClassName: g,
                onOpenAutoFocus: h,
                onCloseAutoFocus: y,
                onPointerDownOutside: b,
                onEscapeKeyDown: v,
                onInteractOutside: x
            } = e,
            E = (0, m.useMediaQuery)("(orientation: portrait) and (max-width: 600px)"),
            S = (0, m.useMediaQuery)("(orientation: landscape) and (max-height: 600px)");
        t = E ? "bottomSheet" : S || "side" === i ? "sideSheet" : "centerSheet";
        let T = (0, o.useMemo)(() => ({
                centerSheetSize: r,
                largeScreenVariant: i,
                closeLabel: n,
                isPortraitMobile: E,
                isLandscapeMobile: S,
                type: t
            }), [r, i, n, E, S, t]),
            N = (0, s.default)(l, E && d, S && f, !E && !S && g);
        return o.default.createElement(p.Provider, {
            value: T
        }, o.default.createElement(u, {
            type: t,
            sideSheetSide: "right",
            isSideSheetFlush: S,
            centerSheetSize: r,
            contentClassName: N,
            onOpenAutoFocus: h ?? c,
            onCloseAutoFocus: y,
            onPointerDownOutside: b,
            onEscapeKeyDown: v,
            onInteractOutside: x
        }, a))
    }, "SheetRoot", 0, e => {
        let {
            open: t,
            onOpenChange: a,
            defaultOpen: r,
            children: i
        } = e;
        return o.default.createElement(d.Root, {
            open: t,
            onOpenChange: a,
            defaultOpen: r,
            modal: !0
        }, i)
    }, "SheetTitle", 0, e => {
        let {
            className: t,
            children: a,
            navigation: r,
            utilities: i,
            visuallyHideTitleText: n
        } = e, {
            closeLabel: u
        } = g(), c = o.default.createElement(d.Title, {
            className: "text-heading-small margin-none"
        }, a);
        return o.default.createElement("div", {
            className: (0, s.default)(t, r ? "padding-left-medium" : "padding-left-xlarge", "padding-right-small padding-y-small", "flex items-center justify-between")
        }, o.default.createElement("div", {
            className: (0, s.default)("flex items-center", r && "gap-xsmall")
        }, r, n ? o.default.createElement(f.VisuallyHidden, null, c) : c), o.default.createElement("div", {
            className: (0, s.default)("flex items-center", i && "gap-xxsmall")
        }, i, o.default.createElement("div", {
            className: "fui-sheet-close-affordance-container"
        }, o.default.createElement(d.Close, {
            asChild: !0
        }, o.default.createElement(l.IconButton, {
            variant: "Utility",
            size: "Medium",
            icon: "icon-regular-x",
            ariaLabel: u || "",
            "data-autofocus-priority": "1000"
        })))))
    }], 207626)
}, 836406, 687328, 809510, e => {
    "use strict";
    var t = e.i(809804),
        a = e.i(7284),
        r = e.i(371847);
    let i = {
            XSmall: "size-[var(--icon-size-xsmall)]",
            Small: "size-[var(--icon-size-small)]",
            Medium: "size-[var(--icon-size-medium)]",
            Large: "size-[var(--icon-size-large)]",
            XLarge: "size-[var(--icon-size-xlarge)]",
            XXLarge: "size-[var(--icon-size-xxlarge)]"
        },
        n = r.default.forwardRef((e, t) => {
            let {
                name: n,
                size: l = "Medium",
                className: s,
                children: o,
                ...d
            } = e;
            return r.default.createElement("span", {
                ref: t,
                "aria-hidden": !0,
                "data-testid": "foundation-web-icon",
                className: (0, a.default)("grow-0 shrink-0 basis-auto icon", n, i[l], s),
                ...d
            })
        });
    n.displayName = "Icon", e.s(["Icon", 0, n], 687328), e.s(["default", 0, e => {
        let {
            isVerified: a,
            isRobloxPlus: r,
            isPremium: i,
            isRobloxAdmin: l,
            size: s = "Large",
            plusBadgeAriaLabel: o
        } = e, d = !0 === r, u = !0 === i && !d, c = !0 === a, m = !0 === l;
        return c || d || u || m ? (0, t.jsxs)("span", {
            className: "items-center gap-xxsmall inline-flex shrink-0 [--icon-size-small:1em]",
            children: [c && (0, t.jsxs)("span", {
                className: "relative flex items-center justify-center",
                children: [(0, t.jsx)(n, {
                    name: "icon-filled-verified-backplate",
                    className: "content-system-emphasis",
                    size: s
                }), (0, t.jsx)(n, {
                    name: "icon-filled-verified-check",
                    className: "absolute",
                    style: {
                        color: "white"
                    },
                    size: s
                })]
            }), d && (0, t.jsx)(n, {
                name: "icon-regular-roblox-plus",
                className: "content-system-contrast",
                size: s,
                "aria-label": o
            }), u && (0, t.jsx)(n, {
                name: "icon-filled-premium",
                className: "content-system-contrast",
                size: s
            }), m && (0, t.jsx)(n, {
                name: "icon-filled-tilt",
                className: "content-system-contrast",
                size: s
            })]
        }) : null
    }], 836406), e.s(["PLUS_BADGE_ARIA_LABEL", 0, "Roblox Plus subscriber", "PLUS_BADGE_ARIA_LABEL_KEY", 0, "Label.RobloxPlusSubscriber", "PLUS_PROFILE_FIELD", 0, "hasRobloxSubscription"], 809510)
}, 361261, 177326, e => {
    "use strict";
    var t = e.i(836406);
    e.s(["DisplayNameBadges", () => t.default], 361261);
    var a = e.i(708923),
        r = e.i(139047);
    let i = "web-plus-identity-badge";
    e.s(["useIsPlusBadgeEnabled", 0, () => {
        let {
            data: e
        } = (0, a.useQuery)({
            queryKey: [`guac/${i}`],
            queryFn: () => (0, r.callBehaviour)(i),
            staleTime: 1 / 0
        });
        return "object" == typeof e && null !== e && !0 === e.plusIdentityBadgeEnabled
    }], 177326)
}, 511336, e => {
    "use strict";
    var t = e.i(371847);
    let a = 0;
    e.s(["default", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "«r",
            r = (0, t.useRef)();
        return r.current || (a += 1, r.current = `${e}${a}`), r.current
    }])
}, 790033, 644165, 459089, 227801, e => {
    "use strict";
    var t = e.i(491965),
        a = e.i(7284),
        r = e.i(371847);

    function i(e) {
        let {
            className: t
        } = e;
        return r.default.createElement("svg", {
            xmlns: "http://www.w3.org/2000/svg",
            width: "13",
            height: "6",
            viewBox: "0 0 13 6",
            fill: "none",
            className: (0, a.default)("block", t),
            style: {
                marginTop: -1
            }
        }, r.default.createElement("path", {
            d: "M0.249999 0.666628L4.83579 5.25241C5.61683 6.03346 6.88316 6.03346 7.66421 5.25241L12.25 0.666626L0.249999 0.666628Z",
            fill: "currentColor"
        }))
    }
    e.s(["Beak", 0, i], 644165);
    var n = e.i(997004);

    function l(e) {
        let {
            position: t,
            hasBeak: l = !0,
            title: s,
            description: o,
            ariaLabel: d,
            delayDurationMs: u = 500,
            children: c,
            open: m,
            onOpenChange: f,
            contentClassName: p
        } = e, [g, h] = t.split("-"), y = d ?? ("string" == typeof s && null == o ? s : void 0);
        return r.createElement(n.Provider, {
            delayDuration: u
        }, r.createElement(n.Root, {
            open: m,
            onOpenChange: f
        }, c, r.createElement(n.Portal, null, r.createElement(n.Content, {
            side: g,
            align: h,
            "aria-label": y,
            className: (0, a.default)("foundation-web-portal-zindex bg-inverse-surface-0 padding-y-xsmall padding-x-small radius-small shadow-transient-low", p),
            sideOffset: 5
        }, l && r.createElement(n.Arrow, {
            asChild: !0
        }, r.createElement(i, {
            className: "content-[var(--inverse-surface-0)]"
        })), r.createElement("div", {
            className: "flex flex-col text-truncate-split"
        }, r.createElement("div", {
            className: "text-caption-medium content-inverse-default"
        }, s), o && r.createElement("div", {
            className: "text-body-small padding-top-xsmall content-inverse-default max-width-[calc(var(--size-100)*50)]"
        }, o))))))
    }

    function s(e) {
        let {
            children: t,
            asChild: a,
            className: i
        } = e;
        return r.createElement(n.Trigger, {
            asChild: a,
            className: i
        }, t)
    }
    e.s(["Tooltip", 0, l, "TooltipTrigger", 0, s, "tooltipAligns", 0, ["start", "center", "end"], "tooltipSides", 0, ["top", "bottom", "left", "right"]], 459089), e.s(["LabelTooltip", 0, e => {
        let {
            title: a,
            description: i,
            position: n = "top-center"
        } = e;
        return r.default.createElement(l, {
            position: n,
            title: a,
            description: i
        }, r.default.createElement(s, {
            asChild: !0
        }, r.default.createElement("span", {
            role: "button",
            tabIndex: 0,
            "aria-label": a,
            className: "flex items-center content-muted",
            "data-testid": "label-tooltip-trigger"
        }, r.default.createElement(t.Icon, {
            name: "icon-regular-circle-i",
            size: "Small"
        }))))
    }], 790033), e.s(["INPUT_BACKGROUND_BY_VARIANT", 0, {
        Standard: "bg-none",
        Contrast: "bg-shift-200",
        Utility: "bg-none"
    }, "INPUT_STROKE_BY_VARIANT", 0, {
        Standard: "stroke-standard",
        Contrast: "stroke-none",
        Utility: "stroke-none"
    }, "INPUT_VARIANTS", 0, ["Standard", "Contrast", "Utility"]], 227801)
}, 312319, e => {
    "use strict";
    var t = e.i(7284),
        a = e.i(371847),
        r = e.i(919403);
    let i = new Set(["_self", "_parent", "_top"]),
        n = {
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        l = {
            Standard: "content-emphasis",
            Emphasis: "content-emphasis",
            Inverse: "content-inverse-default"
        },
        s = (0, a.forwardRef)((e, s) => {
            var o, d;
            let {
                children: u,
                className: c,
                size: m,
                color: f = "Emphasis",
                variant: p = "Standalone",
                underline: g = "hover",
                isExternal: h,
                asChild: y,
                ...b
            } = e, v = (o = b.as ?? "a", d = "button" === b.as ? void 0 : b.target, void 0 !== h ? h : "button" !== o && void 0 !== d && !i.has(d)), x = (0, t.default)("foundation-web-link", "button" === b.as && "bg-none stroke-none padding-none appearance-none [text-align:inherit]", ("Standalone" === p || v) && "inline-flex items-center gap-xsmall", void 0 !== m && n[m], l[f], "always" === g ? "underline" : "no-underline", "hover" === g && "hover:underline", "motion-safe:transition-opacity", "hover:cursor-pointer hover:[opacity:0.8]", "radius-xsmall focus-visible:[outline-style:solid] focus-visible:[outline-width:var(--stroke-standard)] focus-visible:[outline-color:var(--color-system-emphasis)]", c), E = v ? a.default.createElement("span", {
                "aria-hidden": !0,
                "data-testid": "foundation-web-icon",
                className: (0, t.default)("grow-0 shrink-0 basis-auto icon size-[1em]", "icon-regular-arrow-up-right-from-square")
            }) : null;
            if (y) {
                let {
                    as: e,
                    ...t
                } = b, i = a.default.Children.only(u);
                return a.default.isValidElement(i) ? a.default.createElement(r.Slot, {
                    ref: s,
                    ...t,
                    className: x
                }, a.default.cloneElement(i, {}, a.default.createElement(a.default.Fragment, null, i.props.children, E))) : null
            }
            if ("button" === b.as) {
                let {
                    as: e,
                    type: t,
                    ...r
                } = b;
                return a.default.createElement("button", {
                    ref: s,
                    type: t ?? "button",
                    ...r,
                    className: x
                }, u, E)
            }
            let {
                as: S,
                ...T
            } = b;
            return a.default.createElement("a", {
                ref: s,
                ...T,
                className: x
            }, u, E)
        });
    s.displayName = "Link", e.s(["Link", 0, s])
}, 638516, e => {
    "use strict";
    var t = e.i(7284),
        a = e.i(371847);
    let r = (0, a.forwardRef)((e, r) => {
        let {
            className: i,
            style: n,
            orientation: l = "horizontal",
            variant: s = "Standard",
            ...o
        } = e, d = "vertical" === l, u = {};
        return d || "Inset" !== s ? d || "InsetLeft" !== s ? d || "InsetRight" !== s || (u = {
            marginRight: "var(--padding-xlarge)"
        }) : u = {
            marginLeft: "var(--padding-xlarge)"
        } : u = {
            marginLeft: "var(--padding-xlarge)",
            marginRight: "var(--padding-xlarge)"
        }, a.default.createElement("div", {
            ref: r,
            ...o,
            role: "separator",
            "data-orientation": l,
            "aria-orientation": l,
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
                ...u,
                ...n
            },
            className: (0, t.default)("stroke-default self-stretch", i)
        })
    });
    r.displayName = "Divider", e.s(["Divider", 0, r])
}, 242637, e => {
    "use strict";
    var t = e.i(826550),
        a = e.i(491965),
        r = e.i(511336),
        i = e.i(790033),
        n = e.i(227801),
        l = e.i(7284),
        s = e.i(371847);
    let o = {
            XSmall: "padding-x-small",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-medium"
        },
        d = {
            XSmall: "gap-x-xsmall",
            Small: "gap-x-small",
            Medium: "gap-x-small",
            Large: "gap-x-small"
        },
        u = {
            XSmall: "height-600",
            Small: "height-800",
            Medium: "height-1000",
            Large: "height-1200"
        },
        c = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        m = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-medium",
            Large: "text-title-large"
        },
        f = {
            XSmall: ["text-body-small", "placeholder:text-body-small"],
            Small: ["text-body-small", "placeholder:text-body-small"],
            Medium: ["text-body-medium", "placeholder:text-body-medium"],
            Large: ["text-body-large", "placeholder:text-body-large"]
        },
        p = (0, s.forwardRef)((e, p) => {
            let {
                label: g,
                labelTooltip: h,
                leadingIconName: y,
                trailingIconName: b,
                leadingIconNode: v,
                trailingIconNode: x,
                hasError: E,
                error: S,
                helperText: T,
                size: N,
                variant: L = "Standard",
                isRequired: M,
                isDisabled: P,
                className: w,
                style: C,
                inputContainerClassName: k,
                inputContainerClassStyle: I,
                id: R,
                ...A
            } = e, O = (0, r.default)(), U = R || O, _ = `${U}-description`, z = N ?? "Large", D = E || !!S, j = S || T, B = (0, s.useMemo)(() => y ? s.default.createElement(a.Icon, {
                name: y,
                size: z,
                className: "content-emphasis",
                "data-testid": "text-input-leading-icon"
            }) : v, [y, v, z]), X = (0, s.useMemo)(() => b ? s.default.createElement(a.Icon, {
                name: b,
                size: z,
                className: "content-emphasis",
                "data-testid": "text-input-trailing-icon"
            }) : x, [z, b, x]), F = g ? s.default.createElement("label", {
                htmlFor: U,
                className: (0, l.default)(m[z], "content-emphasis")
            }, g, M && s.default.createElement(s.default.Fragment, null, " ", s.default.createElement("span", {
                className: "content-default"
            }, "*"))) : null;
            return s.default.createElement("div", {
                "data-testid": "text-input-wrapper",
                className: (0, l.default)(`flex width-full flex-col gap-small ${w}`, {
                    [t.disabledOpacity]: P
                }),
                style: C
            }, F && (h ? s.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, F, s.default.createElement(i.LabelTooltip, h)) : F), s.default.createElement("div", {
                "data-testid": "text-input-container",
                className: (0, l.default)("foundation-web-input flex items-center width-full", n.INPUT_STROKE_BY_VARIANT[L], n.INPUT_BACKGROUND_BY_VARIANT[L], k, u[z], c[z], o[z], d[z], D ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis"),
                style: I
            }, B, s.default.createElement("input", {
                type: "text",
                id: U,
                ref: p,
                className: (0, l.default)("width-full padding-none bg-none stroke-none outline-none content-emphasis placeholder:content-muted", f[z]),
                style: {
                    appearance: "none"
                },
                "aria-invalid": D,
                "aria-describedby": j ? _ : void 0,
                required: M,
                ...A,
                disabled: P
            }), X), j && s.default.createElement("span", {
                id: _,
                className: (0, l.default)("text-caption-small", {
                    "content-system-alert": D,
                    "content-default": !D
                })
            }, j))
        });
    p.displayName = "TextInput", e.s(["TextInput", 0, p])
}, 830670, 260842, e => {
    "use strict";
    var t = e.i(371847),
        a = e.i(539181),
        r = e.i(734988),
        i = e.i(291967),
        n = e.i(118747),
        l = e.i(183901),
        s = e.i(189192),
        o = e.i(13522),
        d = e => {
            var r;
            let i, n, {
                    present: l,
                    children: s
                } = e,
                d = function(e) {
                    var a, r;
                    let [i, n] = t.useState(), l = t.useRef(null), s = t.useRef(e), d = t.useRef("none"), [c, m] = (a = e ? "mounted" : "unmounted", r = {
                        mounted: {
                            UNMOUNT: "unmounted",
                            ANIMATION_OUT: "unmountSuspended"
                        },
                        unmountSuspended: {
                            MOUNT: "mounted",
                            ANIMATION_END: "unmounted"
                        },
                        unmounted: {
                            MOUNT: "mounted"
                        }
                    }, t.useReducer((e, t) => r[e][t] ?? e, a));
                    return t.useEffect(() => {
                        let e = u(l.current);
                        d.current = "mounted" === c ? e : "none"
                    }, [c]), (0, o.useLayoutEffect)(() => {
                        let t = l.current,
                            a = s.current;
                        if (a !== e) {
                            let r = d.current,
                                i = u(t);
                            e ? m("MOUNT") : "none" === i || t?.display === "none" ? m("UNMOUNT") : a && r !== i ? m("ANIMATION_OUT") : m("UNMOUNT"), s.current = e
                        }
                    }, [e, m]), (0, o.useLayoutEffect)(() => {
                        if (i) {
                            let e, t = i.ownerDocument.defaultView ?? window,
                                a = a => {
                                    let r = u(l.current).includes(CSS.escape(a.animationName));
                                    if (a.target === i && r && (m("ANIMATION_END"), !s.current)) {
                                        let a = i.style.animationFillMode;
                                        i.style.animationFillMode = "forwards", e = t.setTimeout(() => {
                                            "forwards" === i.style.animationFillMode && (i.style.animationFillMode = a)
                                        })
                                    }
                                },
                                r = e => {
                                    e.target === i && (d.current = u(l.current))
                                };
                            return i.addEventListener("animationstart", r), i.addEventListener("animationcancel", a), i.addEventListener("animationend", a), () => {
                                t.clearTimeout(e), i.removeEventListener("animationstart", r), i.removeEventListener("animationcancel", a), i.removeEventListener("animationend", a)
                            }
                        }
                        m("ANIMATION_END")
                    }, [i, m]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(c),
                        ref: t.useCallback(e => {
                            l.current = e ? getComputedStyle(e) : null, n(e)
                        }, [])
                    }
                }(l),
                c = "function" == typeof s ? s({
                    present: d.isPresent
                }) : t.Children.only(s),
                m = (0, a.useComposedRefs)(d.ref, (r = c, (n = (i = Object.getOwnPropertyDescriptor(r.props, "ref")?.get) && "isReactWarning" in i && i.isReactWarning) ? r.ref : (n = (i = Object.getOwnPropertyDescriptor(r, "ref")?.get) && "isReactWarning" in i && i.isReactWarning) ? r.props.ref : r.props.ref || r.ref));
            return "function" == typeof s || d.isPresent ? t.cloneElement(c, {
                ref: m
            }) : null
        };

    function u(e) {
        return e?.animationName || "none"
    }
    d.displayName = "Presence", e.s(["Presence", 0, d], 260842);
    var c = e.i(743682),
        m = e.i(809804),
        f = "Checkbox",
        [p, g] = (0, r.createContextScope)(f),
        [h, y] = p(f);

    function b(e) {
        let {
            __scopeCheckbox: a,
            checked: r,
            children: i,
            defaultChecked: l,
            disabled: s,
            form: o,
            name: d,
            onCheckedChange: u,
            required: c,
            value: p = "on",
            internal_do_not_use_render: g
        } = e, [y, b] = (0, n.useControllableState)({
            prop: r,
            defaultProp: l ?? !1,
            onChange: u,
            caller: f
        }), [v, x] = t.useState(null), [E, S] = t.useState(null), T = t.useRef(!1), N = !v || !!o || !!v.closest("form"), L = {
            checked: y,
            disabled: s,
            setChecked: b,
            control: v,
            setControl: x,
            name: d,
            form: o,
            value: p,
            hasConsumerStoppedPropagationRef: T,
            required: c,
            defaultChecked: !M(l) && l,
            isFormControl: N,
            bubbleInput: E,
            setBubbleInput: S
        };
        return (0, m.jsx)(h, {
            scope: a,
            ...L,
            children: "function" == typeof g ? g(L) : i
        })
    }
    var v = "CheckboxTrigger",
        x = t.forwardRef((e, r) => {
            let {
                __scopeCheckbox: n,
                onKeyDown: l,
                onClick: s,
                ...o
            } = e, {
                control: d,
                value: u,
                disabled: f,
                checked: p,
                required: g,
                setControl: h,
                setChecked: b,
                hasConsumerStoppedPropagationRef: x,
                isFormControl: E,
                bubbleInput: S
            } = y(v, n), T = (0, a.useComposedRefs)(r, h), N = t.useRef(p);
            return t.useEffect(() => {
                let e = d?.form;
                if (e) {
                    let t = () => b(N.current);
                    return e.addEventListener("reset", t), () => e.removeEventListener("reset", t)
                }
            }, [d, b]), (0, m.jsx)(c.Primitive.button, {
                type: "button",
                role: "checkbox",
                "aria-checked": M(p) ? "mixed" : p,
                "aria-required": g,
                "data-state": P(p),
                "data-disabled": f ? "" : void 0,
                disabled: f,
                value: u,
                ...o,
                ref: T,
                onKeyDown: (0, i.composeEventHandlers)(l, e => {
                    "Enter" === e.key && e.preventDefault()
                }),
                onClick: (0, i.composeEventHandlers)(s, e => {
                    b(e => !!M(e) || !e), S && E && (x.current = e.isPropagationStopped(), x.current || e.stopPropagation())
                })
            })
        });
    x.displayName = v;
    var E = t.forwardRef((e, t) => {
        let {
            __scopeCheckbox: a,
            name: r,
            checked: i,
            defaultChecked: n,
            required: l,
            disabled: s,
            value: o,
            onCheckedChange: d,
            form: u,
            ...c
        } = e;
        return (0, m.jsx)(b, {
            __scopeCheckbox: a,
            checked: i,
            defaultChecked: n,
            disabled: s,
            required: l,
            onCheckedChange: d,
            name: r,
            form: u,
            value: o,
            internal_do_not_use_render: e => {
                let {
                    isFormControl: r
                } = e;
                return (0, m.jsxs)(m.Fragment, {
                    children: [(0, m.jsx)(x, {
                        ...c,
                        ref: t,
                        __scopeCheckbox: a
                    }), r && (0, m.jsx)(L, {
                        __scopeCheckbox: a
                    })]
                })
            }
        })
    });
    E.displayName = f;
    var S = "CheckboxIndicator",
        T = t.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                forceMount: r,
                ...i
            } = e, n = y(S, a);
            return (0, m.jsx)(d, {
                present: r || M(n.checked) || !0 === n.checked,
                children: (0, m.jsx)(c.Primitive.span, {
                    "data-state": P(n.checked),
                    "data-disabled": n.disabled ? "" : void 0,
                    ...i,
                    ref: t,
                    style: {
                        pointerEvents: "none",
                        ...e.style
                    }
                })
            })
        });
    T.displayName = S;
    var N = "CheckboxBubbleInput",
        L = t.forwardRef((e, r) => {
            let {
                __scopeCheckbox: i,
                ...n
            } = e, {
                control: o,
                hasConsumerStoppedPropagationRef: d,
                checked: u,
                defaultChecked: f,
                required: p,
                disabled: g,
                name: h,
                value: b,
                form: v,
                bubbleInput: x,
                setBubbleInput: E
            } = y(N, i), S = (0, a.useComposedRefs)(r, E), T = (0, l.usePrevious)(u), L = (0, s.useSize)(o);
            t.useEffect(() => {
                if (!x) return;
                let e = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set,
                    t = !d.current;
                if (T !== u && e) {
                    let a = new Event("click", {
                        bubbles: t
                    });
                    x.indeterminate = M(u), e.call(x, !M(u) && u), x.dispatchEvent(a)
                }
            }, [x, T, u, d]);
            let P = t.useRef(!M(u) && u);
            return (0, m.jsx)(c.Primitive.input, {
                type: "checkbox",
                "aria-hidden": !0,
                defaultChecked: f ?? P.current,
                required: p,
                disabled: g,
                name: h,
                value: b,
                form: v,
                ...n,
                tabIndex: -1,
                ref: S,
                style: {
                    ...n.style,
                    ...L,
                    position: "absolute",
                    pointerEvents: "none",
                    opacity: 0,
                    margin: 0,
                    transform: "translateX(-100%)"
                }
            })
        });

    function M(e) {
        return "indeterminate" === e
    }

    function P(e) {
        return M(e) ? "indeterminate" : e ? "checked" : "unchecked"
    }
    L.displayName = N, e.s(["Indicator", 0, T, "Root", 0, E], 830670)
}, 264458, (e, t, a) => {
    ! function() {
        "use strict";
        var a = {}.hasOwnProperty;

        function r() {
            for (var e = "", t = 0; t < arguments.length; t++) {
                var n = arguments[t];
                n && (e = i(e, function(e) {
                    if ("string" == typeof e || "number" == typeof e) return e;
                    if ("object" != typeof e) return "";
                    if (Array.isArray(e)) return r.apply(null, e);
                    if (e.toString !== Object.prototype.toString && !e.toString.toString().includes("[native code]")) return e.toString();
                    var t = "";
                    for (var n in e) a.call(e, n) && e[n] && (t = i(t, n));
                    return t
                }(n)))
            }
            return e
        }

        function i(e, t) {
            return t ? e ? e + " " + t : e + t : e
        }
        if (t.exports) r.default = r, t.exports = r;
        else if ("function" == typeof define && "object" == typeof define.amd && define.amd) void 0 !== r && e.v(r);
        else window.classNames = r
    }()
}, 939747, e => {
    "use strict";
    var t = e.i(885065),
        a = e.i(826550),
        r = e.i(7284),
        i = e.i(371847),
        n = e.i(919403);
    let l = {
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
        u = {
            Emphasis: "bg-action-standard",
            Standard: "bg-action-standard",
            Alert: "bg-action-standard",
            Utility: "bg-action-link",
            OverMedia: "bg-over-media-0"
        },
        c = {
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
                className: h,
                icon: y,
                ariaLabel: b,
                isDisabled: v = !1,
                isCircular: x = !1,
                isSelected: E = !1,
                size: S = "Large",
                variant: T = "Emphasis",
                iconColor: N = "Default",
                asChild: L,
                children: M,
                ...P
            } = e;
            g = v ? u[T] : E ? c[T] : d[T];
            let w = (0, r.default)("foundation-web-icon-button", v ? a.disabledOpacity : [t.interactable, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", l[S], o[S][x ? "circular" : "square"], g, h),
                C = i.default.createElement(i.default.Fragment, null, i.default.createElement(t.StateLayer, null), i.default.createElement("span", {
                    className: (0, r.default)("icon", y, s[S], v ? f[N][T] : m[N][T])
                }));
            if (L) {
                let {
                    as: e,
                    ...t
                } = P, a = i.default.Children.only(M);
                return i.default.createElement(n.Slot, {
                    ref: p,
                    ...t,
                    className: w,
                    "aria-label": b,
                    "aria-disabled": v || void 0
                }, i.default.cloneElement(a, {}, C))
            }
            if ("a" === P.as) {
                let {
                    as: e,
                    href: t,
                    ...a
                } = P;
                return i.default.createElement("a", {
                    ref: p,
                    ...a,
                    "aria-label": b,
                    "aria-disabled": v,
                    href: v ? void 0 : t,
                    className: w
                }, C)
            }
            let {
                as: k,
                ...I
            } = P;
            return i.default.createElement("button", {
                ref: p,
                type: "button",
                ...I,
                "aria-label": b,
                disabled: v,
                className: w
            }, C)
        });
    e.s(["IconButton", 0, p])
}, 773424, e => {
    "use strict";
    var t = e.i(371847);
    let a = (0, t.createContext)(null),
        r = (0, t.createContext)(null),
        i = (0, t.createContext)(null);
    e.s(["CheckboxGroupContext", 0, a, "ChipGroupContext", 0, i, "ToggleGroupContext", 0, r])
}, 727516, e => {
    "use strict";
    var t = e.i(885065),
        a = e.i(511336),
        r = e.i(773424),
        i = e.i(7284),
        n = e.i(371847),
        l = e.i(830670);
    let s = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-600"
        },
        o = {
            XSmall: "",
            Small: "",
            Medium: "",
            Large: "padding-y-xxsmall"
        },
        d = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        u = {
            XSmall: "",
            Small: "padding-top-xxsmall",
            Medium: "padding-top-xxsmall",
            Large: "padding-top-xxsmall"
        };
    e.s(["Checkbox", 0, e => {
        let {
            label: c,
            className: m,
            isChecked: f,
            isDisabled: p,
            size: g,
            hint: h,
            placement: y,
            onCheckedChange: b,
            id: v,
            "aria-describedby": x,
            ...E
        } = e, S = (0, n.useContext)(r.CheckboxGroupContext), T = S?.size ?? g ?? "Medium", N = S?.placement ?? y ?? "Start", L = p || S?.isDisabled, M = (0, a.default)(), P = v || M, w = S && c && h ? `${P}Hint` : void 0, C = c && n.default.createElement("label", {
            htmlFor: P,
            className: (0, i.default)("flex flex-col grow-1 gap-xsmall", !L && "cursor-pointer")
        }, n.default.createElement("span", {
            className: (0, i.default)(d[T], u[T], "content-emphasis")
        }, c), h && n.default.createElement("span", {
            id: w,
            className: (0, i.default)(S ? d[T] : "text-body-medium", "content-default")
        }, h));
        return n.default.createElement("div", {
            className: (0, i.default)("foundation-web-checkbox flex gap-medium", L && "opacity-[0.5]", !L && "cursor-pointer", m)
        }, "End" === N && C, n.default.createElement("div", {
            className: (0, i.default)(o[T])
        }, n.default.createElement(l.Root, {
            "data-slot": "checkbox",
            className: (0, i.default)(s[T], t.interactable, !L && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
            id: P,
            checked: f,
            disabled: L,
            onCheckedChange: b,
            "aria-label": c,
            "aria-describedby": [x, w].filter(Boolean).join(" ") || void 0,
            ...E
        }, n.default.createElement(t.StateLayer, null), n.default.createElement(l.Indicator, {
            "data-slot": "checkbox-indicator",
            className: (0, i.default)(s[T], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
        }))), "Start" === N && C)
    }])
}, 154286, e => {
    "use strict";
    var t = e.i(868275),
        a = e.i(270784),
        r = e.i(778579),
        i = e.i(309937),
        n = e.i(245837);
    e.i(912035);
    var l = e.i(646424),
        s = e.i(587541),
        o = e.i(423517),
        d = e.i(257771);
    class u {
        getAllValuesForLayer(e) {
            var t;
            let a = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : o.DEFAULT_ROBLOX_PROJECT,
                r = arguments.length > 2 ? arguments[2] : void 0,
                i = {
                    url: `${n.default.apiGatewayUrl}/product-experimentation-platform/v1/projects/${a}/values`,
                    withCredentials: !0
                };
            return (t = {
                layers: {
                    [e]: r ?? {}
                }
            }, Promise.resolve().then(() => l.postUntyped(s.Url.parse(i.url).getOrThrow(), t, i.withCredentials ? {
                credentials: "include"
            } : {}).getOrThrow()).then(e => ({
                data: e
            }))).then(t => {
                if (t?.data) {
                    let i = t.data,
                        n = r ? u.getInputMetadataKey(e, r) : e;
                    return this.registerLayerMetadataAndGetParameters(i, e, n, a, void 0 !== r)
                }
                return Promise.reject()
            })
        }
        logLayerExposure(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : o.DEFAULT_ROBLOX_PROJECT,
                a = arguments.length > 2 ? arguments[2] : void 0,
                r = a ? u.getInputMetadataKey(e, a) : e;
            this.logLayerExposureForMetadataKey(e, r, t)
        }
        static getInputMetadataKey(e, t) {
            let a = Object.entries(t).sort((e, t) => {
                let [a] = e, [r] = t;
                return a.localeCompare(r)
            });
            return `${e}:${JSON.stringify(a)}`
        }
        registerLayerMetadataAndGetParameters(e, t, a, r) {
            let i = arguments.length > 4 && void 0 !== arguments[4] && arguments[4],
                n = this.projectLayerMetadataMaps[r] ?? new Map;
            this.projectLayerMetadataMaps[r] = n;
            let l = e.layers[t];
            return l.experimentName ? n.set(a, e) : i && n.delete(a), l.parameters
        }
        logLayerExposureForMetadataKey(e, t, n) {
            let l = this.projectLayerMetadataMaps[n]?.get(t);
            if (l) {
                let t = (0, d.buildLayerExposureEvent)(l, e, (0, i.userId)() ?? 0, (0, a.getBrowserTrackerId)() || "0");
                (0, r.sendEventWithTarget)(o.EXPOSED_EVENT_NAME, o.EXPERIMENTATION_TARGET_NAME, t, r.targetTypes.WWW)
            }
        }
        constructor() {
            (0, t._)(this, "projectLayerMetadataMaps", void 0), this.projectLayerMetadataMaps = []
        }
    }
    let c = new u;
    e.s(["default", 0, c], 154286)
}, 195567, e => {
    "use strict";
    var t = e.i(885065),
        a = e.i(7284),
        r = e.i(371847);
    let i = (0, r.createContext)(null),
        n = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-medium"
        },
        l = {
            XSmall: "text-title-small",
            Small: "text-title-medium",
            Medium: "text-title-medium",
            Large: "text-title-large"
        },
        s = {
            XSmall: "text-body-small",
            Small: "text-body-medium",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        o = (0, r.forwardRef)((e, o) => {
            let {
                isContained: d,
                size: u,
                divider: c,
                alignment: m,
                title: f,
                isTitleBold: p = !0,
                text: g,
                isMultiline: h,
                metadata: y,
                description: b,
                leading: v,
                trailing: x,
                onSelect: E,
                className: S
            } = e, T = void 0 === y && void 0 === b && void 0 === m && void 0 === u;
            if ((void 0 !== g || void 0 !== h) && !T) throw Error('ListItem: Cannot use deprecated "text" or "isMultiline" props with "metadata", "description", "alignment", or "size".');
            let N = u ?? "Large",
                L = void 0 !== E,
                M = L ? "button" : "div",
                P = !!T && h,
                w = "Top" === m ? "justify-start" : "justify-center";
            P && (w = "justify-start");
            let C = r.default.createElement(M, {
                    className: (0, a.default)("bg-none width-full flex gap-medium stroke-none foundation-web-list-item padding-y-none", d ? "padding-x-medium" : "padding-x-xlarge", "Full" === c && "foundation-web-list-item-bottom-divider", L && "relative clip group/interactable focus-visible:outline-focus disabled:outline-none", L && "cursor-pointer", S),
                    ...L && {
                        onClick: () => E()
                    }
                }, L && r.default.createElement(t.StateLayer, null), v && r.default.createElement("div", {
                    className: (0, a.default)("flex flex-col padding-y-large", w)
                }, v), r.default.createElement("div", {
                    className: "flex fill clip-x padding-y-large gap-x-medium relative "
                }, r.default.createElement("div", {
                    className: (0, a.default)("flex flex-col fill clip-x justify-center", P && "gap-xsmall")
                }, f && r.default.createElement("div", {
                    className: (0, a.default)("content-emphasis text-align-x-start", p ? l[N] : s[N])
                }, f), T && g && r.default.createElement("div", {
                    className: (0, a.default)("content-default text-align-x-start", n[N], !h && "text-truncate-split text-no-wrap")
                }, g), !T && y && r.default.createElement("div", {
                    className: (0, a.default)("content-default text-align-x-start text-truncate-split text-no-wrap", n[N])
                }, y), !T && b && r.default.createElement("div", {
                    className: (0, a.default)("content-default text-align-x-start padding-top-xsmall", n[N])
                }, b)), x && r.default.createElement("div", {
                    className: (0, a.default)("flex flex-col", w)
                }, x), "Inset" === c && r.default.createElement("div", {
                    className: "foundation-web-list-item-inset-divider"
                }))),
                k = (0, r.useMemo)(() => ({
                    size: N
                }), [N]);
            return r.default.createElement("li", {
                ref: o,
                style: {
                    listStyle: "none"
                }
            }, r.default.createElement(i.Provider, {
                value: k
            }, C))
        });
    o.displayName = "ListItem";
    let d = (0, r.forwardRef)((e, t) => {
        let {
            children: i,
            className: n,
            as: l = "ul",
            ...s
        } = e;
        return r.default.createElement(l, {
            ref: t,
            className: (0, a.default)("foundation-web-list", n),
            ...s
        }, i)
    });
    d.displayName = "List", e.s(["List", 0, d, "ListItem", 0, o, "useListItemProvider", 0, () => {
        let e = (0, r.useContext)(i);
        if (!e) throw Error("useListItemProvider must be used within a ListItem");
        return e
    }])
}, 175055, e => {
    "use strict";
    var t = e.i(491965),
        a = e.i(195567),
        r = e.i(7284),
        i = e.i(371847);
    let n = {
            XSmall: "Small",
            Small: "Medium",
            Medium: "Medium",
            Large: "Large"
        },
        l = {
            XSmall: "Small",
            Small: "Medium",
            Medium: "Large",
            Large: "Large"
        },
        s = e => {
            let {
                ...r
            } = e, {
                size: l
            } = (0, a.useListItemProvider)();
            return i.default.createElement(t.Icon, {
                ...r,
                size: n[l]
            })
        },
        o = {
            XSmall: "width-600",
            Small: "width-800",
            Medium: "width-1000",
            Large: "width-1400"
        };
    e.s(["ListItemChevronTrailingAccessory", 0, () => i.default.createElement(s, {
        name: "icon-filled-chevron-large-right"
    }), "ListItemLeadingAccessorySpacer", 0, e => {
        let {
            children: t
        } = e, {
            size: n
        } = (0, a.useListItemProvider)();
        return i.default.createElement("div", {
            className: (0, r.default)("flex items-center justify-center", o[n])
        }, t)
    }, "ListItemLeadingIcon", 0, e => {
        let {
            ...r
        } = e, {
            size: n
        } = (0, a.useListItemProvider)();
        return i.default.createElement(t.Icon, {
            ...r,
            size: l[n]
        })
    }])
}]);

//# debugId=55f210f4-f0da-183c-af95-12dadeb93edf
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/16icb784n.p88.js.map
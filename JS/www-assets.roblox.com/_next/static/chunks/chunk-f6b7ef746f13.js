;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "70d05ce0-f3a5-f0f9-954f-d67eaa4d2037")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 438058, (e, t, a) => {
    "use strict";
    t.exports = "SECRET_DO_NOT_PASS_THIS_OR_YOU_WILL_BE_FIRED"
}, 177836, (e, t, a) => {
    "use strict";
    var l = e.r(438058);

    function i() {}

    function r() {}
    r.resetWarningCache = i, t.exports = function() {
        function e(e, t, a, i, r, n) {
            if (n !== l) {
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
            checkPropTypes: r,
            resetWarningCache: i
        };
        return a.PropTypes = a, a
    }
}, 254226, (e, t, a) => {
    t.exports = e.r(177836)()
}, 941127, e => {
    "use strict";
    var t = e.i(941918),
        a = e.i(7284),
        l = e.i(420482);
    let i = (0, l.createContext)(null),
        r = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-medium"
        },
        n = {
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
        d = (0, l.forwardRef)((e, d) => {
            let {
                isContained: o,
                size: u,
                divider: m,
                alignment: c,
                title: f,
                isTitleBold: p = !0,
                text: g,
                isMultiline: h,
                metadata: y,
                description: b,
                leading: x,
                trailing: v,
                onSelect: E,
                className: T
            } = e, S = void 0 === y && void 0 === b && void 0 === c && void 0 === u;
            if ((void 0 !== g || void 0 !== h) && !S) throw Error('ListItem: Cannot use deprecated "text" or "isMultiline" props with "metadata", "description", "alignment", or "size".');
            let P = u ?? "Large",
                L = void 0 !== E,
                N = L ? "button" : "div",
                w = !!S && h,
                C = "Top" === c ? "justify-start" : "justify-center";
            w && (C = "justify-start");
            let M = l.default.createElement(N, {
                    className: (0, a.default)("bg-none width-full flex gap-medium stroke-none foundation-web-list-item padding-y-none", o ? "padding-x-medium" : "padding-x-xlarge", "Full" === m && "foundation-web-list-item-bottom-divider", L && "relative clip group/interactable focus-visible:outline-focus disabled:outline-none", L && "cursor-pointer", T),
                    ...L && {
                        onClick: () => E()
                    }
                }, L && l.default.createElement(t.StateLayer, null), x && l.default.createElement("div", {
                    className: (0, a.default)("flex flex-col padding-y-large", C)
                }, x), l.default.createElement("div", {
                    className: "flex fill clip-x padding-y-large gap-x-medium relative "
                }, l.default.createElement("div", {
                    className: (0, a.default)("flex flex-col fill clip-x justify-center", w && "gap-xsmall")
                }, f && l.default.createElement("div", {
                    className: (0, a.default)("content-emphasis text-align-x-start", p ? n[P] : s[P])
                }, f), S && g && l.default.createElement("div", {
                    className: (0, a.default)("content-default text-align-x-start", r[P], !h && "text-truncate-split text-no-wrap")
                }, g), !S && y && l.default.createElement("div", {
                    className: (0, a.default)("content-default text-align-x-start text-truncate-split text-no-wrap", r[P])
                }, y), !S && b && l.default.createElement("div", {
                    className: (0, a.default)("content-default text-align-x-start padding-top-xsmall", r[P])
                }, b)), v && l.default.createElement("div", {
                    className: (0, a.default)("flex flex-col", C)
                }, v), "Inset" === m && l.default.createElement("div", {
                    className: "foundation-web-list-item-inset-divider"
                }))),
                I = (0, l.useMemo)(() => ({
                    size: P
                }), [P]);
            return l.default.createElement("li", {
                ref: d,
                style: {
                    listStyle: "none"
                }
            }, l.default.createElement(i.Provider, {
                value: I
            }, M))
        });
    d.displayName = "ListItem";
    let o = (0, l.forwardRef)((e, t) => {
        let {
            children: i,
            className: r,
            as: n = "ul",
            ...s
        } = e;
        return l.default.createElement(n, {
            ref: t,
            className: (0, a.default)("foundation-web-list", r),
            ...s
        }, i)
    });
    o.displayName = "List", e.s(["List", 0, o, "ListItem", 0, d, "useListItemProvider", 0, () => {
        let e = (0, l.useContext)(i);
        if (!e) throw Error("useListItemProvider must be used within a ListItem");
        return e
    }])
}, 459475, e => {
    "use strict";
    var t = e.i(778935),
        a = e.i(941127),
        l = e.i(7284),
        i = e.i(420482);
    let r = {
            XSmall: "Small",
            Small: "Medium",
            Medium: "Medium",
            Large: "Large"
        },
        n = {
            XSmall: "Small",
            Small: "Medium",
            Medium: "Large",
            Large: "Large"
        },
        s = e => {
            let {
                ...l
            } = e, {
                size: n
            } = (0, a.useListItemProvider)();
            return i.default.createElement(t.Icon, {
                ...l,
                size: r[n]
            })
        },
        d = {
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
            size: r
        } = (0, a.useListItemProvider)();
        return i.default.createElement("div", {
            className: (0, l.default)("flex items-center justify-center", d[r])
        }, t)
    }, "ListItemLeadingIcon", 0, e => {
        let {
            ...l
        } = e, {
            size: r
        } = (0, a.useListItemProvider)();
        return i.default.createElement(t.Icon, {
            ...l,
            size: n[r]
        })
    }])
}, 349030, 418945, e => {
    "use strict";
    var t = e.i(309380);
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
        l = {
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

    function r(e, t) {
        let a = l[e] ?? l.Month;
        return 1 === t ? a.singular : a.plural
    }
    e.s(["addBillingPeriod", 0, function(e, a, l) {
        let r = new Date(e);
        switch (l) {
            case t.PeriodType.Week:
                return r.setUTCDate(r.getUTCDate() + 7 * a), r;
            case t.PeriodType.Month:
                let n, s, d, o;
                return n = r.getUTCMonth() + a, s = r.getUTCFullYear() + Math.floor(n / 12), d = (n % 12 + 12) % 12, o = Math.min(r.getUTCDate(), i(s, d)), new Date(Date.UTC(s, d, o, r.getUTCHours(), r.getUTCMinutes(), r.getUTCSeconds(), r.getUTCMilliseconds()));
            case t.PeriodType.Year:
                let u, m, c;
                return u = r.getUTCFullYear() + a, m = r.getUTCMonth(), c = Math.min(r.getUTCDate(), i(u, m)), new Date(Date.UTC(u, m, c, r.getUTCHours(), r.getUTCMinutes(), r.getUTCSeconds(), r.getUTCMilliseconds()));
            default:
                throw Error(`Unsupported period type: ${l}`)
        }
    }, "getFreeTrialDisplay", 0, function(e, a) {
        let l = e?.freeTrialOffer;
        if (!l) return null;
        let {
            duration: i,
            periodType: n
        } = l;
        return n !== t.PeriodType.Week && n !== t.PeriodType.Month && n !== t.PeriodType.Year || !Number.isFinite(i) || i <= 0 ? null : {
            trialDuration: i,
            trialPeriodType: n,
            trialPeriodKey: r(n, i),
            billingPeriodKey: r(a, 1)
        }
    }, "getSubscriptionPeriodTranslationKey", 0, function(e, t) {
        let l = a[e] ?? a.Month;
        return 1 === t ? l.singular : l.plural
    }], 349030);
    var n = e.i(424935);
    e.i(417902);
    var s = e.i(7284),
        d = e.i(420482),
        o = e.i(513443);
    let u = e => {
            let {
                type: t,
                sideSheetSide: a = "right",
                isSideSheetFlush: l = !1,
                centerSheetSize: i = "Medium",
                children: r,
                overlayClassName: n,
                contentClassName: u,
                onOpenAutoFocus: m,
                onCloseAutoFocus: c,
                onPointerDownOutside: f,
                onEscapeKeyDown: p,
                onInteractOutside: g
            } = e;
            return d.default.createElement(o.Portal, null, d.default.createElement(o.Overlay, {
                "data-testid": "fui-base-sheet-overlay",
                "data-type": t,
                "data-side": "sideSheet" === t ? a : void 0,
                "data-flush": "sideSheet" === t ? l : void 0,
                "data-size": "centerSheet" === t ? i : void 0,
                className: (0, s.default)("fui-base-sheet-overlay", "foundation-web-portal-zindex fixed inset-[0] flex", n)
            }, d.default.createElement(o.Content, {
                "data-testid": "fui-base-sheet-content",
                className: (0, s.default)("fui-base-sheet-content relative bg-surface-100 stroke-muted stroke-standard shadow-transient-high", "flex flex-col clip", u),
                onOpenAutoFocus: m,
                onCloseAutoFocus: c,
                onPointerDownOutside: f,
                onEscapeKeyDown: p,
                onInteractOutside: g
            }, r)))
        },
        m = e => {
            let t = e.currentTarget;
            if (!t) return;
            let a = t.querySelectorAll("[data-autofocus-priority]");
            if (0 === a.length) return;
            let l = [];
            a.forEach(e => {
                let t = parseInt(e.getAttribute("data-autofocus-priority") || "", 10);
                !Number.isNaN(t) && e instanceof HTMLElement && l.push({
                    element: e,
                    priority: t
                })
            }), l.sort((e, t) => e.priority - t.priority);
            let i = l.find(e => {
                var t, a;
                return ("function" != typeof(a = t = e.element).checkVisibility || a.checkVisibility()) && !("disabled" in t && t.disabled || "true" === t.getAttribute("aria-disabled"))
            });
            if (i) {
                var r;
                e.preventDefault();
                let t = document.activeElement === i.element;
                i.element.focus(), !t && (r = i.element) instanceof HTMLInputElement && "function" == typeof r.select && r.select()
            }
        };
    var c = e.i(855790),
        f = e.i(806887);
    let p = (0, d.createContext)(null),
        g = () => {
            let e = (0, d.useContext)(p);
            if (!e) throw Error("Sheet components must be used within a Sheet");
            return e
        },
        h = (0, d.forwardRef)((e, t) => {
            let {
                children: a,
                className: l,
                hasPaddingX: i = !0,
                ...r
            } = e, {
                type: n
            } = g();
            return d.default.createElement("div", {
                ref: t,
                className: (0, s.default)("scroll-y", i && "padding-x-xlarge", "sideSheet" === n ? "grow-1" : "", l),
                ...r
            }, a)
        });
    h.displayName = "SheetBody", e.s(["SheetBody", 0, h, "SheetContent", 0, e => {
        let t, {
                children: a,
                centerSheetSize: l = "Medium",
                largeScreenVariant: i = "center",
                closeLabel: r,
                className: n,
                mobilePortraitClassName: o,
                mobileLandscapeClassName: f,
                largeScreenClassName: g,
                onOpenAutoFocus: h,
                onCloseAutoFocus: y,
                onPointerDownOutside: b,
                onEscapeKeyDown: x,
                onInteractOutside: v
            } = e,
            E = (0, c.useMediaQuery)("(orientation: portrait) and (max-width: 600px)"),
            T = (0, c.useMediaQuery)("(orientation: landscape) and (max-height: 600px)");
        t = E ? "bottomSheet" : T || "side" === i ? "sideSheet" : "centerSheet";
        let S = (0, d.useMemo)(() => ({
                centerSheetSize: l,
                largeScreenVariant: i,
                closeLabel: r,
                isPortraitMobile: E,
                isLandscapeMobile: T,
                type: t
            }), [l, i, r, E, T, t]),
            P = (0, s.default)(n, E && o, T && f, !E && !T && g);
        return d.default.createElement(p.Provider, {
            value: S
        }, d.default.createElement(u, {
            type: t,
            sideSheetSide: "right",
            isSideSheetFlush: T,
            centerSheetSize: l,
            contentClassName: P,
            onOpenAutoFocus: h ?? m,
            onCloseAutoFocus: y,
            onPointerDownOutside: b,
            onEscapeKeyDown: x,
            onInteractOutside: v
        }, a))
    }, "SheetRoot", 0, e => {
        let {
            open: t,
            onOpenChange: a,
            defaultOpen: l,
            children: i
        } = e;
        return d.default.createElement(o.Root, {
            open: t,
            onOpenChange: a,
            defaultOpen: l,
            modal: !0
        }, i)
    }, "SheetTitle", 0, e => {
        let {
            className: t,
            children: a,
            navigation: l,
            utilities: i,
            visuallyHideTitleText: r
        } = e, {
            closeLabel: u
        } = g(), m = d.default.createElement(o.Title, {
            className: "text-heading-small margin-none"
        }, a);
        return d.default.createElement("div", {
            className: (0, s.default)(t, l ? "padding-left-medium" : "padding-left-xlarge", "padding-right-small padding-y-small", "flex items-center justify-between")
        }, d.default.createElement("div", {
            className: (0, s.default)("flex items-center", l && "gap-xsmall")
        }, l, r ? d.default.createElement(f.VisuallyHidden, null, m) : m), d.default.createElement("div", {
            className: (0, s.default)("flex items-center", i && "gap-xxsmall")
        }, i, d.default.createElement("div", {
            className: "fui-sheet-close-affordance-container"
        }, d.default.createElement(o.Close, {
            asChild: !0
        }, d.default.createElement(n.IconButton, {
            variant: "Utility",
            size: "Medium",
            icon: "icon-regular-x",
            ariaLabel: u || "",
            "data-autofocus-priority": "1000"
        })))))
    }], 418945)
}, 520250, e => {
    "use strict";
    var t = e.i(420482);
    let a = 0;
    e.s(["default", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "«r",
            l = (0, t.useRef)();
        return l.current || (a += 1, l.current = `${e}${a}`), l.current
    }])
}, 326404, e => {
    "use strict";
    var t = e.i(7284),
        a = e.i(420482),
        l = e.i(919403);
    let i = new Set(["_self", "_parent", "_top"]),
        r = {
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        n = {
            Standard: "content-emphasis",
            Emphasis: "content-emphasis",
            Inverse: "content-inverse-default"
        },
        s = (0, a.forwardRef)((e, s) => {
            var d, o;
            let {
                children: u,
                className: m,
                size: c,
                color: f = "Emphasis",
                variant: p = "Standalone",
                underline: g = "hover",
                isExternal: h,
                asChild: y,
                ...b
            } = e, x = (d = b.as ?? "a", o = "button" === b.as ? void 0 : b.target, void 0 !== h ? h : "button" !== d && void 0 !== o && !i.has(o)), v = (0, t.default)("foundation-web-link", "button" === b.as && "bg-none stroke-none padding-none appearance-none [text-align:inherit]", ("Standalone" === p || x) && "inline-flex items-center gap-xsmall", void 0 !== c && r[c], n[f], "always" === g ? "underline" : "no-underline", "hover" === g && "hover:underline", "motion-safe:transition-opacity", "hover:cursor-pointer hover:[opacity:0.8]", "radius-xsmall focus-visible:[outline-style:solid] focus-visible:[outline-width:var(--stroke-standard)] focus-visible:[outline-color:var(--color-system-emphasis)]", m), E = x ? a.default.createElement("span", {
                "aria-hidden": !0,
                "data-testid": "foundation-web-icon",
                className: (0, t.default)("grow-0 shrink-0 basis-auto icon size-[1em]", "icon-regular-arrow-up-right-from-square")
            }) : null;
            if (y) {
                let {
                    as: e,
                    ...t
                } = b, i = a.default.Children.only(u);
                return a.default.isValidElement(i) ? a.default.createElement(l.Slot, {
                    ref: s,
                    ...t,
                    className: v
                }, a.default.cloneElement(i, {}, a.default.createElement(a.default.Fragment, null, i.props.children, E))) : null
            }
            if ("button" === b.as) {
                let {
                    as: e,
                    type: t,
                    ...l
                } = b;
                return a.default.createElement("button", {
                    ref: s,
                    type: t ?? "button",
                    ...l,
                    className: v
                }, u, E)
            }
            let {
                as: T,
                ...S
            } = b;
            return a.default.createElement("a", {
                ref: s,
                ...S,
                className: v
            }, u, E)
        });
    s.displayName = "Link", e.s(["Link", 0, s])
}, 847749, 495039, 263730, 556010, e => {
    "use strict";
    var t = e.i(778935),
        a = e.i(7284),
        l = e.i(420482);

    function i(e) {
        let {
            className: t
        } = e;
        return l.default.createElement("svg", {
            xmlns: "http://www.w3.org/2000/svg",
            width: "13",
            height: "6",
            viewBox: "0 0 13 6",
            fill: "none",
            className: (0, a.default)("block", t),
            style: {
                marginTop: -1
            }
        }, l.default.createElement("path", {
            d: "M0.249999 0.666628L4.83579 5.25241C5.61683 6.03346 6.88316 6.03346 7.66421 5.25241L12.25 0.666626L0.249999 0.666628Z",
            fill: "currentColor"
        }))
    }
    e.s(["Beak", 0, i], 495039);
    var r = e.i(997004);

    function n(e) {
        let {
            position: t,
            hasBeak: n = !0,
            title: s,
            description: d,
            ariaLabel: o,
            delayDurationMs: u = 500,
            children: m,
            open: c,
            onOpenChange: f,
            contentClassName: p
        } = e, [g, h] = t.split("-"), y = o ?? ("string" == typeof s && null == d ? s : void 0);
        return l.createElement(r.Provider, {
            delayDuration: u
        }, l.createElement(r.Root, {
            open: c,
            onOpenChange: f
        }, m, l.createElement(r.Portal, null, l.createElement(r.Content, {
            side: g,
            align: h,
            "aria-label": y,
            className: (0, a.default)("foundation-web-portal-zindex bg-inverse-surface-0 padding-y-xsmall padding-x-small radius-small shadow-transient-low", p),
            sideOffset: 5
        }, n && l.createElement(r.Arrow, {
            asChild: !0
        }, l.createElement(i, {
            className: "content-[var(--inverse-surface-0)]"
        })), l.createElement("div", {
            className: "flex flex-col text-truncate-split"
        }, l.createElement("div", {
            className: "text-caption-medium content-inverse-default"
        }, s), d && l.createElement("div", {
            className: "text-body-small padding-top-xsmall content-inverse-default max-width-[calc(var(--size-100)*50)]"
        }, d))))))
    }

    function s(e) {
        let {
            children: t,
            asChild: a,
            className: i
        } = e;
        return l.createElement(r.Trigger, {
            asChild: a,
            className: i
        }, t)
    }
    e.s(["Tooltip", 0, n, "TooltipTrigger", 0, s, "tooltipAligns", 0, ["start", "center", "end"], "tooltipSides", 0, ["top", "bottom", "left", "right"]], 263730), e.s(["LabelTooltip", 0, e => {
        let {
            title: a,
            description: i,
            position: r = "top-center"
        } = e;
        return l.default.createElement(n, {
            position: r,
            title: a,
            description: i
        }, l.default.createElement(s, {
            asChild: !0
        }, l.default.createElement("span", {
            role: "button",
            tabIndex: 0,
            "aria-label": a,
            className: "flex items-center content-muted",
            "data-testid": "label-tooltip-trigger"
        }, l.default.createElement(t.Icon, {
            name: "icon-regular-circle-i",
            size: "Small"
        }))))
    }], 847749), e.s(["INPUT_BACKGROUND_BY_VARIANT", 0, {
        Standard: "bg-none",
        Contrast: "bg-shift-200",
        Utility: "bg-none"
    }, "INPUT_STROKE_BY_VARIANT", 0, {
        Standard: "stroke-standard",
        Contrast: "stroke-none",
        Utility: "stroke-none"
    }, "INPUT_VARIANTS", 0, ["Standard", "Contrast", "Utility"]], 556010)
}, 417902, e => {
    "use strict";
    var t = e.i(7284),
        a = e.i(420482);
    let l = (0, a.forwardRef)((e, l) => {
        let {
            className: i,
            style: r,
            orientation: n = "horizontal",
            variant: s = "Standard",
            ...d
        } = e, o = "vertical" === n, u = {};
        return o || "Inset" !== s ? o || "InsetLeft" !== s ? o || "InsetRight" !== s || (u = {
            marginRight: "var(--padding-xlarge)"
        }) : u = {
            marginLeft: "var(--padding-xlarge)"
        } : u = {
            marginLeft: "var(--padding-xlarge)",
            marginRight: "var(--padding-xlarge)"
        }, a.default.createElement("div", {
            ref: l,
            ...d,
            role: "separator",
            "data-orientation": n,
            "aria-orientation": n,
            style: {
                borderRightWidth: 0,
                borderBottomWidth: 0,
                boxSizing: "border-box",
                borderStyle: "solid",
                ...o ? {
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
                ...r
            },
            className: (0, t.default)("stroke-default self-stretch", i)
        })
    });
    l.displayName = "Divider", e.s(["Divider", 0, l])
}, 677810, e => {
    "use strict";
    var t = e.i(986592),
        a = e.i(778935),
        l = e.i(520250),
        i = e.i(847749),
        r = e.i(556010),
        n = e.i(7284),
        s = e.i(420482);
    let d = {
            XSmall: "padding-x-small",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-medium"
        },
        o = {
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
        m = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        c = {
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
                leadingIconNode: x,
                trailingIconNode: v,
                hasError: E,
                error: T,
                helperText: S,
                size: P,
                variant: L = "Standard",
                isRequired: N,
                isDisabled: w,
                className: C,
                style: M,
                inputContainerClassName: I,
                inputContainerClassStyle: k,
                id: U,
                ...R
            } = e, z = (0, l.default)(), A = U || z, _ = `${A}-description`, B = P ?? "Large", D = E || !!T, O = T || S, j = (0, s.useMemo)(() => y ? s.default.createElement(a.Icon, {
                name: y,
                size: B,
                className: "content-emphasis",
                "data-testid": "text-input-leading-icon"
            }) : x, [y, x, B]), W = (0, s.useMemo)(() => b ? s.default.createElement(a.Icon, {
                name: b,
                size: B,
                className: "content-emphasis",
                "data-testid": "text-input-trailing-icon"
            }) : v, [B, b, v]), X = g ? s.default.createElement("label", {
                htmlFor: A,
                className: (0, n.default)(c[B], "content-emphasis")
            }, g, N && s.default.createElement(s.default.Fragment, null, " ", s.default.createElement("span", {
                className: "content-default"
            }, "*"))) : null;
            return s.default.createElement("div", {
                "data-testid": "text-input-wrapper",
                className: (0, n.default)(`flex width-full flex-col gap-small ${C}`, {
                    [t.disabledOpacity]: w
                }),
                style: M
            }, X && (h ? s.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, X, s.default.createElement(i.LabelTooltip, h)) : X), s.default.createElement("div", {
                "data-testid": "text-input-container",
                className: (0, n.default)("foundation-web-input flex items-center width-full", r.INPUT_STROKE_BY_VARIANT[L], r.INPUT_BACKGROUND_BY_VARIANT[L], I, u[B], m[B], d[B], o[B], D ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis"),
                style: k
            }, j, s.default.createElement("input", {
                type: "text",
                id: A,
                ref: p,
                className: (0, n.default)("width-full padding-none bg-none stroke-none outline-none content-emphasis placeholder:content-muted", f[B]),
                style: {
                    appearance: "none"
                },
                "aria-invalid": D,
                "aria-describedby": O ? _ : void 0,
                required: N,
                ...R,
                disabled: w
            }), W), O && s.default.createElement("span", {
                id: _,
                className: (0, n.default)("text-caption-small", {
                    "content-system-alert": D,
                    "content-default": !D
                })
            }, O))
        });
    p.displayName = "TextInput", e.s(["TextInput", 0, p])
}, 836406, 306627, 809510, e => {
    "use strict";
    var t = e.i(19836),
        a = e.i(7284),
        l = e.i(420482);
    let i = {
            XSmall: "size-[var(--icon-size-xsmall)]",
            Small: "size-[var(--icon-size-small)]",
            Medium: "size-[var(--icon-size-medium)]",
            Large: "size-[var(--icon-size-large)]",
            XLarge: "size-[var(--icon-size-xlarge)]",
            XXLarge: "size-[var(--icon-size-xxlarge)]"
        },
        r = l.default.forwardRef((e, t) => {
            let {
                name: r,
                size: n = "Medium",
                className: s,
                children: d,
                ...o
            } = e;
            return l.default.createElement("span", {
                ref: t,
                "aria-hidden": !0,
                "data-testid": "foundation-web-icon",
                className: (0, a.default)("grow-0 shrink-0 basis-auto icon", r, i[n], s),
                ...o
            })
        });
    r.displayName = "Icon", e.s(["Icon", 0, r], 306627), e.s(["default", 0, e => {
        let {
            isVerified: a,
            isRobloxPlus: l,
            isPremium: i,
            isRobloxAdmin: n,
            size: s = "Large",
            plusBadgeAriaLabel: d
        } = e, o = !0 === l, u = !0 === i && !o, m = !0 === a, c = !0 === n;
        return m || o || u || c ? (0, t.jsxs)("span", {
            className: "items-center gap-xxsmall inline-flex shrink-0 [--icon-size-small:1em]",
            children: [m && (0, t.jsxs)("span", {
                className: "relative flex items-center justify-center",
                children: [(0, t.jsx)(r, {
                    name: "icon-filled-verified-backplate",
                    className: "content-system-emphasis",
                    size: s
                }), (0, t.jsx)(r, {
                    name: "icon-filled-verified-check",
                    className: "absolute",
                    style: {
                        color: "white"
                    },
                    size: s
                })]
            }), o && (0, t.jsx)(r, {
                name: "icon-regular-roblox-plus",
                className: "content-system-contrast",
                size: s,
                "aria-label": d
            }), u && (0, t.jsx)(r, {
                name: "icon-filled-premium",
                className: "content-system-contrast",
                size: s
            }), c && (0, t.jsx)(r, {
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
        l = e.i(139047);
    let i = "web-plus-identity-badge";
    e.s(["useIsPlusBadgeEnabled", 0, () => {
        let {
            data: e
        } = (0, a.useQuery)({
            queryKey: [`guac/${i}`],
            queryFn: () => (0, l.callBehaviour)(i),
            staleTime: 1 / 0
        });
        return "object" == typeof e && null !== e && !0 === e.plusIdentityBadgeEnabled
    }], 177326)
}]);

//# debugId=70d05ce0-f3a5-f0f9-954f-d67eaa4d2037
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/0q-syr3pdqy67.js.map
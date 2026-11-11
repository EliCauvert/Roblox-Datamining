;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "b9ef2f28-3c45-7d55-df2d-a3186d70524b")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 69181, e => {
    "use strict";
    var t = e.i(643766),
        a = e.i(950020),
        i = e.i(120297),
        n = e.i(859726),
        r = e.i(517952),
        l = e.i(179510),
        s = e.i(842769),
        o = e.i(546633),
        c = e.i(785517),
        d = "Switch",
        [u, m] = (0, n.c)(d),
        [p, f] = u(d),
        h = t.forwardRef((e, n) => {
            let {
                __scopeSwitch: l,
                name: s,
                checked: u,
                defaultChecked: m,
                required: f,
                disabled: h,
                value: v = "on",
                onCheckedChange: g,
                form: x,
                ...w
            } = e, [I, A] = t.useState(null), S = (0, i.j)(n, e => A(e)), C = t.useRef(!1), T = !I || x || !!I.closest("form"), [D, E] = (0, r.f)({
                prop: u,
                defaultProp: null != m && m,
                onChange: g,
                caller: d
            });
            return (0, c.jsxs)(p, {
                scope: l,
                checked: D,
                disabled: h,
                children: [(0, c.jsx)(o.f.button, {
                    type: "button",
                    role: "switch",
                    "aria-checked": D,
                    "aria-required": f,
                    "data-state": y(D),
                    "data-disabled": h ? "" : void 0,
                    disabled: h,
                    value: v,
                    ...w,
                    ref: S,
                    onClick: (0, a.f)(e.onClick, e => {
                        E(e => !e), T && (C.current = e.isPropagationStopped(), C.current || e.stopPropagation())
                    })
                }), T && (0, c.jsx)(b, {
                    control: I,
                    bubbles: !C.current,
                    name: s,
                    value: v,
                    checked: D,
                    required: f,
                    disabled: h,
                    form: x,
                    style: {
                        transform: "translateX(-100%)"
                    }
                })]
            })
        });
    h.displayName = d;
    var v = "SwitchThumb",
        g = t.forwardRef((e, t) => {
            let {
                __scopeSwitch: a,
                ...i
            } = e, n = f(v, a);
            return (0, c.jsx)(o.f.span, {
                "data-state": y(n.checked),
                "data-disabled": n.disabled ? "" : void 0,
                ...i,
                ref: t
            })
        });
    g.displayName = v;
    var b = t.forwardRef((e, a) => {
        let {
            __scopeSwitch: n,
            control: r,
            checked: o,
            bubbles: d = !0,
            ...u
        } = e, m = t.useRef(null), p = (0, i.j)(m, a), f = (0, l.f)(o), h = (0, s.f)(r);
        return t.useEffect(() => {
            let e = m.current;
            if (!e) return;
            let t = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set;
            if (f !== o && t) {
                let a = new Event("click", {
                    bubbles: d
                });
                t.call(e, o), e.dispatchEvent(a)
            }
        }, [f, o, d]), (0, c.jsx)("input", {
            type: "checkbox",
            "aria-hidden": !0,
            defaultChecked: o,
            ...u,
            tabIndex: -1,
            ref: p,
            style: {
                ...u.style,
                ...h,
                position: "absolute",
                pointerEvents: "none",
                opacity: 0,
                margin: 0
            }
        })
    });

    function y(e) {
        return e ? "checked" : "unchecked"
    }
    b.displayName = "SwitchBubbleInput", e.s(["F", 0, h, "w", 0, g])
}, 711327, e => {
    "use strict";
    var t = e.i(336288);
    e.s(["f", () => t.B])
}, 695746, e => {
    "use strict";
    var t = e.i(335020),
        a = e.i(643766);
    let i = {
            "1:1": "aspect-1-1",
            "5:4": "aspect-5-4",
            "4:5": "aspect-4-5",
            "4:3": "aspect-4-3",
            "16:9": "aspect-16-9",
            "2:1": "aspect-2-1"
        },
        n = (0, a.forwardRef)((e, n) => {
            let {
                className: r,
                aspectRatio: l = "1:1",
                alt: s,
                containerClassName: o,
                ...c
            } = e;
            return a.default.createElement("div", {
                className: (0, t.U)("foundation-web-media clip", i[l], o)
            }, a.default.createElement("img", {
                ref: n,
                className: (0, t.U)("foundation-web-media-image", r),
                alt: s,
                ...c
            }))
        });
    n.displayName = "Media", e.s(["f", 0, n])
}, 878962, e => {
    "use strict";
    var t = e.i(225885),
        a = e.i(198566),
        i = e.i(335020),
        n = e.i(643766),
        r = e.i(257872);
    let l = e => {
            let {
                type: t,
                sideSheetSide: a = "right",
                isSideSheetFlush: l = !1,
                centerSheetSize: s = "Medium",
                children: o,
                overlayClassName: c,
                contentClassName: d,
                onOpenAutoFocus: u,
                onCloseAutoFocus: m,
                onPointerDownOutside: p,
                onEscapeKeyDown: f,
                onInteractOutside: h
            } = e;
            return n.default.createElement(r.z, null, n.default.createElement(r.k, {
                "data-testid": "fui-base-sheet-overlay",
                "data-type": t,
                "data-side": "sideSheet" === t ? a : void 0,
                "data-flush": "sideSheet" === t ? l : void 0,
                "data-size": "centerSheet" === t ? s : void 0,
                className: (0, i.U)("fui-base-sheet-overlay", "foundation-web-portal-zindex fixed inset-[0] flex", c)
            }, n.default.createElement(r.c, {
                "data-testid": "fui-base-sheet-content",
                className: (0, i.U)("fui-base-sheet-content relative bg-surface-100 stroke-muted stroke-standard shadow-transient-high", "flex flex-col clip", d),
                onOpenAutoFocus: u,
                onCloseAutoFocus: m,
                onPointerDownOutside: p,
                onEscapeKeyDown: f,
                onInteractOutside: h
            }, o)))
        },
        s = e => {
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
    var o = e.i(29506),
        c = e.i(225419);
    let d = (0, n.createContext)(null),
        u = () => {
            let e = (0, n.useContext)(d);
            if (!e) throw Error("Sheet components must be used within a Sheet");
            return e
        },
        m = "padding-x-xlarge",
        p = (0, n.forwardRef)((e, t) => {
            let {
                children: a,
                className: r,
                hasPaddingX: l = !0,
                ...s
            } = e, {
                type: o
            } = u();
            return n.default.createElement("div", {
                ref: t,
                className: (0, i.U)("scroll-y", l && m, "sideSheet" === o ? "grow-1" : "", r),
                ...s
            }, a)
        });
    p.displayName = "SheetBody", e.s(["$", 0, e => {
        let {
            children: t,
            className: r,
            ...l
        } = e;
        return n.default.createElement(n.default.Fragment, null, n.default.createElement(a.f, null), n.default.createElement("div", {
            className: (0, i.U)(m, "margin-y-small shrink-0", r),
            ...l
        }, t))
    }, "O", 0, p, "U", 0, e => {
        let t, {
                children: a,
                centerSheetSize: r = "Medium",
                largeScreenVariant: c = "center",
                closeLabel: u,
                className: m,
                mobilePortraitClassName: p,
                mobileLandscapeClassName: f,
                largeScreenClassName: h,
                onOpenAutoFocus: v,
                onCloseAutoFocus: g,
                onPointerDownOutside: b,
                onEscapeKeyDown: y,
                onInteractOutside: x
            } = e,
            w = (0, o.f)("(orientation: portrait) and (max-width: 600px)"),
            I = (0, o.f)("(orientation: landscape) and (max-height: 600px)");
        t = w ? "bottomSheet" : I || "side" === c ? "sideSheet" : "centerSheet";
        let A = (0, n.useMemo)(() => ({
                centerSheetSize: r,
                largeScreenVariant: c,
                closeLabel: u,
                isPortraitMobile: w,
                isLandscapeMobile: I,
                type: t
            }), [r, c, u, w, I, t]),
            S = (0, i.U)(m, w && p, I && f, !w && !I && h);
        return n.default.createElement(d.Provider, {
            value: A
        }, n.default.createElement(l, {
            type: t,
            sideSheetSide: "right",
            isSideSheetFlush: I,
            centerSheetSize: r,
            contentClassName: S,
            onOpenAutoFocus: null != v ? v : s,
            onCloseAutoFocus: g,
            onPointerDownOutside: b,
            onEscapeKeyDown: y,
            onInteractOutside: x
        }, a))
    }, "c", 0, e => n.default.createElement(r.u, {
        asChild: !0,
        ...e
    }), "q", 0, e => {
        let {
            open: t,
            onOpenChange: a,
            defaultOpen: i,
            children: l
        } = e;
        return n.default.createElement(r.F, {
            open: t,
            onOpenChange: a,
            defaultOpen: i,
            modal: !0
        }, l)
    }, "L", 0, e => {
        let {
            className: a,
            children: l,
            navigation: s,
            utilities: o,
            visuallyHideTitleText: d
        } = e, {
            closeLabel: m
        } = u(), p = n.default.createElement(r.Z, {
            className: "text-heading-small margin-none"
        }, l);
        return n.default.createElement("div", {
            className: (0, i.U)(a, s ? "padding-left-medium" : "padding-left-xlarge", "padding-right-small padding-y-small", "flex items-center justify-between")
        }, n.default.createElement("div", {
            className: (0, i.U)("flex items-center", s && "gap-xsmall")
        }, s, d ? n.default.createElement(c.f, null, p) : p), n.default.createElement("div", {
            className: (0, i.U)("flex items-center", o && "gap-xxsmall")
        }, o, n.default.createElement("div", {
            className: "fui-sheet-close-affordance-container"
        }, n.default.createElement(r.K, {
            asChild: !0
        }, n.default.createElement(t.f, {
            variant: "Utility",
            size: "Medium",
            icon: "icon-regular-x",
            ariaLabel: m || "",
            "data-autofocus-priority": "1000"
        })))))
    }, "V", 0, e => n.default.createElement(r.d, {
        asChild: !0,
        ...e
    })], 878962)
}, 214918, e => {
    "use strict";
    var t = e.i(503434),
        a = e.i(524586),
        i = e.i(464627),
        n = e.i(335020),
        r = e.i(643766);
    let l = {
            XSmall: "padding-x-small",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-medium"
        },
        s = {
            XSmall: "padding-y-small",
            Small: "padding-y-small",
            Medium: "padding-y-small",
            Large: "padding-y-small"
        },
        o = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-medium",
            Large: "text-title-large"
        },
        c = {
            XSmall: ["text-body-small", "placeholder:text-body-small"],
            Small: ["text-body-small", "placeholder:text-body-small"],
            Medium: ["text-body-medium", "placeholder:text-body-medium"],
            Large: ["text-body-large", "placeholder:text-body-large"]
        },
        d = r.default.forwardRef((e, d) => {
            let {
                size: u,
                variant: m = "Standard",
                label: p,
                value: f,
                defaultValue: h,
                isDisabled: v,
                hasError: g,
                helperText: b,
                className: y,
                style: x,
                textareaClassName: w,
                textareaStyle: I,
                id: A,
                ...S
            } = e, C = (0, a.f)(), T = A || C, D = "".concat(T, "-description"), E = null != u ? u : "Large";
            return r.default.createElement("div", {
                className: (0, n.U)("flex fill flex-col width-full gap-small", {
                    [t.f]: v
                }, y),
                style: x
            }, p && r.default.createElement("label", {
                htmlFor: T,
                className: (0, n.U)(o[E], "content-emphasis")
            }, p), r.default.createElement("textarea", {
                ref: d,
                id: T,
                "data-testid": "text-area-container",
                style: I,
                className: (0, n.U)("foundation-web-text-area foundation-web-input outline-none", "radius-medium content-emphasis placeholder:content-muted", i.L[m], i.U[m], g ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis", c[E], l[E], s[E], w),
                value: f,
                defaultValue: null == f ? h : void 0,
                disabled: v,
                "aria-describedby": b ? D : void 0,
                ...S
            }), b && r.default.createElement("span", {
                id: D,
                className: (0, n.U)("text-caption-small", {
                    "content-system-alert": g,
                    "content-default": !g
                })
            }, b))
        });
    d.displayName = "TextArea", e.s(["f", 0, d])
}, 90539, e => {
    "use strict";
    var t = e.i(206241),
        a = e.i(503434),
        i = e.i(335020),
        n = e.i(643766),
        r = e.i(69181);
    let l = {
            XSmall: {
                toggleWidth: "width-700",
                toggleHeight: "height-400",
                thumbSize: "size-300",
                textSize: "text-body-small",
                textPadding: null
            },
            Small: {
                toggleWidth: "width-800",
                toggleHeight: "height-500",
                thumbSize: "size-400",
                textSize: "text-body-small",
                textPadding: "padding-top-xxsmall"
            },
            Medium: {
                toggleWidth: "width-1000",
                toggleHeight: "height-600",
                thumbSize: "size-500",
                textSize: "text-body-medium",
                textPadding: "padding-top-xxsmall"
            },
            Large: {
                toggleWidth: "width-1100",
                toggleHeight: "height-600",
                thumbSize: "size-500",
                textSize: "text-body-large",
                textPadding: "padding-top-xxsmall"
            }
        },
        s = n.default.forwardRef((e, s) => {
            let {
                label: o,
                "aria-label": c,
                "aria-labelledby": d,
                className: u,
                isChecked: m,
                isDisabled: p,
                size: f,
                hint: h,
                placement: v,
                onCheckedChange: g,
                ...b
            } = e, {
                toggleWidth: y,
                toggleHeight: x,
                thumbSize: w,
                textSize: I,
                textPadding: A
            } = l[f];
            return n.default.createElement("label", {
                className: (0, i.U)("foundation-web-toggle flex items-start gap-medium", {
                    [a.f]: p,
                    "cursor-pointer": !p,
                    "flex-row": "Start" === v,
                    "flex-row-reverse": "End" === v
                }, u)
            }, n.default.createElement(r.F, {
                "data-slot": "toggle",
                ...b,
                ref: s,
                className: (0, i.U)(t.Y, !p && "cursor-pointer", "grow-0 shrink-0 basis-auto flex items-center padding-xxsmall stroke-none radius-circle transition-colors", y, x, "group/toggle", "data-[state=unchecked]:bg-action-standard", "data-[state=checked]:bg-system-contrast"),
                disabled: p,
                checked: m,
                onCheckedChange: g,
                "aria-label": c,
                "aria-labelledby": d
            }, n.default.createElement(t.v, null), n.default.createElement("span", {
                className: (0, i.U)("motion-safe:transition-[flex-grow] ease-standard-out duration-300", "group-data-[state=unchecked]/toggle:size-0", "group-data-[state=checked]/toggle:fill")
            }), n.default.createElement(r.w, {
                className: (0, i.U)("transition-colors radius-circle flex justify-center items-center", w, "data-[state=unchecked]:bg-[var(--color-content-emphasis)]", "data-[state=checked]:bg-[var(--inverse-content-emphasis)]")
            }, n.default.createElement("span", {
                className: (0, i.U)("icon icon-filled-check transition-opacity", w, "group-data-[state=unchecked]/toggle:opacity-[0]", "group-data-[state=checked]/toggle:opacity-[1] group-data-[state=checked]/toggle:[transition-delay:50ms]")
            })), n.default.createElement("span", {
                className: (0, i.U)("motion-safe:transition-[flex-grow] ease-standard-out duration-300", "group-data-[state=unchecked]/toggle:fill", "group-data-[state=checked]/toggle:size-0")
            })), o ? n.default.createElement("div", {
                className: (0, i.U)("flex flex-col fill", I)
            }, n.default.createElement("span", {
                className: (0, i.U)("content-emphasis", A)
            }, o), h && n.default.createElement("span", {
                className: "content-default"
            }, h)) : null)
        });
    s.displayName = "Toggle", e.s(["f", 0, s])
}, 328678, e => {
    "use strict";
    var t = e.i(179183),
        a = e.i(433659),
        i = e.i(643766),
        n = e.i(365434),
        r = e.i(677484),
        l = e.i(350134),
        s = e.i(785517),
        o = e.i(546538),
        c = e.i(611785),
        d = e.i(144796),
        u = e.i(313660),
        m = e.i(294375),
        p = e.i(268953);

    function f(e) {
        return (0, a.g)("MuiFormGroup", e)
    }(0, r.g)("MuiFormGroup", ["root", "row", "error"]);
    let h = ["className", "row"],
        v = (0, n.s)("div", {
            name: "MuiFormGroup",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: a
                } = e;
                return [t.root, a.row && t.row]
            }
        })(e => {
            let {
                ownerState: a
            } = e;
            return (0, t._)({
                display: "flex",
                flexDirection: "column",
                flexWrap: "wrap"
            }, a.row && {
                flexDirection: "row"
            })
        }),
        g = i.forwardRef(function(e, i) {
            let r = (0, p.u)({
                    props: e,
                    name: "MuiFormGroup"
                }),
                {
                    className: l,
                    row: o = !1
                } = r,
                c = (0, a._)(r, h),
                d = (0, u.u)(),
                g = (0, m.f)({
                    props: r,
                    muiFormControl: d,
                    states: ["error"]
                }),
                b = (0, t._)({}, r, {
                    row: o,
                    error: g.error
                }),
                y = (e => {
                    let {
                        classes: t,
                        row: a,
                        error: i
                    } = e;
                    return (0, n.a)({
                        root: ["root", a && "row", i && "error"]
                    }, f, t)
                })(b);
            return (0, s.jsx)(v, (0, t._)({
                className: (0, n.c)(y.root, l),
                ownerState: b,
                ref: i
            }, c))
        });
    var b = e.i(415014),
        y = e.i(266062),
        x = e.i(924147),
        w = e.i(929960);
    e.i(386856);
    var I = e.i(693043);

    function A(e) {
        return (0, a.g)("MuiRadioGroup", e)
    }(0, r.g)("MuiRadioGroup", ["root", "row", "error"]);
    let S = ["actions", "children", "className", "defaultValue", "name", "onChange", "value"],
        C = i.forwardRef(function(e, r) {
            let {
                actions: u,
                children: m,
                className: p,
                defaultValue: f,
                name: h,
                onChange: v,
                value: b
            } = e, y = (0, a._)(e, S), x = i.useRef(null), w = (e => {
                let {
                    classes: t,
                    row: a,
                    error: i
                } = e;
                return (0, n.a)({
                    root: ["root", a && "row", i && "error"]
                }, A, t)
            })(e), [I, C] = (0, o.u)({
                controlled: b,
                default: f,
                name: "RadioGroup"
            });
            i.useImperativeHandle(u, () => ({
                focus: () => {
                    let e = x.current.querySelector("input:not(:disabled):checked");
                    e || (e = x.current.querySelector("input:not(:disabled)")), e && e.focus()
                }
            }), []);
            let T = (0, c.u)(r, x),
                D = (0, d.u)(h),
                E = i.useMemo(() => ({
                    name: D,
                    onChange(e) {
                        C(e.target.value), v && v(e, e.target.value)
                    },
                    value: I
                }), [D, v, C, I]);
            return (0, s.jsx)(l.R.Provider, {
                value: E,
                children: (0, s.jsx)(g, (0, t._)({
                    role: "radiogroup",
                    ref: T,
                    className: (0, n.c)(w.root, p)
                }, y, {
                    children: m
                }))
            })
        });
    var T = (0, y.c)((0, s.jsx)("path", {
            d: "M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"
        }), "Star"),
        D = (0, y.c)((0, s.jsx)("path", {
            d: "M22 9.24l-7.19-.62L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21 12 17.27 18.18 21l-1.63-7.03L22 9.24zM12 15.4l-3.76 2.27 1-4.28-3.32-2.88 4.38-.38L12 6.1l1.71 4.04 4.38.38-3.32 2.88 1 4.28L12 15.4z"
        }), "StarBorder");

    function E(e) {
        return (0, a.g)("MuiRating", e)
    }
    var k = (0, r.g)("MuiRating", ["root", "sizeSmall", "sizeMedium", "sizeLarge", "readOnly", "disabled", "focusVisible", "visuallyHidden", "pristine", "label", "labelEmptyValueActive", "icon", "iconEmpty", "iconFilled", "iconHover", "iconFocus", "iconActive", "decimal"]);
    let P = ["value"],
        M = ["className", "defaultValue", "disabled", "emptyIcon", "emptyLabelText", "getLabelText", "highlightSelectedOnly", "icon", "IconContainerComponent", "max", "name", "onChange", "onChangeActive", "onMouseLeave", "onMouseMove", "precision", "readOnly", "size", "value"];

    function L(e, t) {
        let a;
        return null == e ? e : Number((Math.round(e / t) * t).toFixed((a = t.toString().split(".")[1]) ? a.length : 0))
    }
    let G = (0, n.s)("span", {
            name: "MuiRating",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: i
                } = e;
                return [{
                    ["& .".concat(k.visuallyHidden)]: t.visuallyHidden
                }, t.root, t["size".concat((0, a.a)(i.size))], i.readOnly && t.readOnly]
            }
        })(e => {
            let {
                theme: a,
                ownerState: i
            } = e;
            return (0, t._)({
                display: "inline-flex",
                position: "relative",
                fontSize: a.typography.pxToRem(24),
                color: "#faaf00",
                cursor: "pointer",
                textAlign: "left",
                width: "min-content",
                WebkitTapHighlightColor: "transparent",
                ["&.".concat(k.disabled)]: {
                    opacity: (a.vars || a).palette.action.disabledOpacity,
                    pointerEvents: "none"
                },
                ["&.".concat(k.focusVisible, " .").concat(k.iconActive)]: {
                    outline: "1px solid #999"
                },
                ["& .".concat(k.visuallyHidden)]: x.v
            }, "small" === i.size && {
                fontSize: a.typography.pxToRem(18)
            }, "large" === i.size && {
                fontSize: a.typography.pxToRem(30)
            }, i.readOnly && {
                pointerEvents: "none"
            })
        }),
        N = (0, n.s)("label", {
            name: "MuiRating",
            slot: "Label",
            overridesResolver: (e, t) => {
                let {
                    ownerState: a
                } = e;
                return [t.label, a.emptyValueFocused && t.labelEmptyValueActive]
            }
        })(e => {
            let {
                ownerState: a
            } = e;
            return (0, t._)({
                cursor: "inherit"
            }, a.emptyValueFocused && {
                top: 0,
                bottom: 0,
                position: "absolute",
                outline: "1px solid #999",
                width: "100%"
            })
        }),
        F = (0, n.s)("span", {
            name: "MuiRating",
            slot: "Icon",
            overridesResolver: (e, t) => {
                let {
                    ownerState: a
                } = e;
                return [t.icon, a.iconEmpty && t.iconEmpty, a.iconFilled && t.iconFilled, a.iconHover && t.iconHover, a.iconFocus && t.iconFocus, a.iconActive && t.iconActive]
            }
        })(e => {
            let {
                theme: a,
                ownerState: i
            } = e;
            return (0, t._)({
                display: "flex",
                transition: a.transitions.create("transform", {
                    duration: a.transitions.duration.shortest
                }),
                pointerEvents: "none"
            }, i.iconActive && {
                transform: "scale(1.2)"
            }, i.iconEmpty && {
                color: (a.vars || a).palette.action.disabled
            })
        }),
        j = (0, n.s)("span", {
            name: "MuiRating",
            slot: "Decimal",
            shouldForwardProp: e => (0, n.b)(e) && "iconActive" !== e,
            overridesResolver: (e, t) => {
                let {
                    iconActive: a
                } = e;
                return [t.decimal, a && t.iconActive]
            }
        })(e => {
            let {
                iconActive: a
            } = e;
            return (0, t._)({
                position: "relative"
            }, a && {
                transform: "scale(1.2)"
            })
        });

    function U(e) {
        let i = (0, a._)(e, P);
        return (0, s.jsx)("span", (0, t._)({}, i))
    }

    function V(e) {
        let {
            classes: a,
            disabled: r,
            emptyIcon: l,
            focus: o,
            getLabelText: c,
            highlightSelectedOnly: u,
            hover: m,
            icon: p,
            IconContainerComponent: f,
            isActive: h,
            itemValue: v,
            labelProps: g,
            name: b,
            onBlur: y,
            onChange: x,
            onClick: w,
            onFocus: I,
            readOnly: A,
            ownerState: S,
            ratingValue: C,
            ratingValueRounded: T
        } = e, D = u ? v === C : v <= C, E = v <= m, k = v <= o, P = v === T, M = (0, d.u)(), L = (0, s.jsx)(F, {
            as: f,
            value: v,
            className: (0, n.c)(a.icon, D ? a.iconFilled : a.iconEmpty, E && a.iconHover, k && a.iconFocus, h && a.iconActive),
            ownerState: (0, t._)({}, S, {
                iconEmpty: !D,
                iconFilled: D,
                iconHover: E,
                iconFocus: k,
                iconActive: h
            }),
            children: l && !D ? l : p
        });
        return A ? (0, s.jsx)("span", (0, t._)({}, g, {
            children: L
        })) : (0, s.jsxs)(i.Fragment, {
            children: [(0, s.jsxs)(N, (0, t._)({
                ownerState: (0, t._)({}, S, {
                    emptyValueFocused: void 0
                }),
                htmlFor: M
            }, g, {
                children: [L, (0, s.jsx)("span", {
                    className: a.visuallyHidden,
                    children: c(v)
                })]
            })), (0, s.jsx)("input", {
                className: a.visuallyHidden,
                onFocus: I,
                onBlur: y,
                onChange: x,
                onClick: w,
                disabled: r,
                value: v,
                id: M,
                type: "radio",
                name: b,
                checked: P
            })]
        })
    }
    let R = (0, s.jsx)(T, {
            fontSize: "inherit"
        }),
        _ = (0, s.jsx)(D, {
            fontSize: "inherit"
        });

    function B(e) {
        return "".concat(e, " Star").concat(1 !== e ? "s" : "")
    }
    i.forwardRef(function(e, r) {
        let l = (0, p.u)({
                name: "MuiRating",
                props: e
            }),
            {
                className: u,
                defaultValue: m = null,
                disabled: f = !1,
                emptyIcon: h = _,
                emptyLabelText: v = "Empty",
                getLabelText: g = B,
                highlightSelectedOnly: y = !1,
                icon: x = R,
                IconContainerComponent: A = U,
                max: S = 5,
                name: C,
                onChange: T,
                onChangeActive: D,
                onMouseLeave: k,
                onMouseMove: P,
                precision: F = 1,
                readOnly: O = !1,
                size: H = "medium",
                value: K
            } = l,
            z = (0, a._)(l, M),
            q = (0, d.u)(C),
            [Q, W] = (0, o.u)({
                controlled: K,
                default: m,
                name: "Rating"
            }),
            Y = L(Q, F),
            X = (0, b.u)(),
            [{
                hover: Z,
                focus: $
            }, J] = i.useState({
                hover: -1,
                focus: -1
            }),
            ee = Y; - 1 !== Z && (ee = Z), -1 !== $ && (ee = $);
        let {
            isFocusVisibleRef: et,
            onBlur: ea,
            onFocus: ei,
            ref: en
        } = (0, w.u)(), [er, el] = i.useState(!1), es = i.useRef(), eo = (0, c.u)(en, es, r), ec = e => {
            let t = "" === e.target.value ? null : parseFloat(e.target.value); - 1 !== Z && (t = Z), W(t), T && T(e, t)
        }, ed = e => {
            0 === e.clientX && 0 === e.clientY || (J({
                hover: -1,
                focus: -1
            }), W(null), T && parseFloat(e.target.value) === Y && T(e, null))
        }, eu = e => {
            ei(e), !0 === et.current && el(!0);
            let t = parseFloat(e.target.value);
            J(e => ({
                hover: e.hover,
                focus: t
            }))
        }, em = e => {
            -1 === Z && (ea(e), !1 === et.current && el(!1), J(e => ({
                hover: e.hover,
                focus: -1
            })))
        }, [ep, ef] = i.useState(!1), eh = (0, t._)({}, l, {
            defaultValue: m,
            disabled: f,
            emptyIcon: h,
            emptyLabelText: v,
            emptyValueFocused: ep,
            focusVisible: er,
            getLabelText: g,
            icon: x,
            IconContainerComponent: A,
            max: S,
            precision: F,
            readOnly: O,
            size: H
        }), ev = (e => {
            let {
                classes: t,
                size: i,
                readOnly: r,
                disabled: l,
                emptyValueFocused: s,
                focusVisible: o
            } = e, c = {
                root: ["root", "size".concat((0, a.a)(i)), l && "disabled", o && "focusVisible", r && "readOnly"],
                label: ["label", "pristine"],
                labelEmptyValue: [s && "labelEmptyValueActive"],
                icon: ["icon"],
                iconEmpty: ["iconEmpty"],
                iconFilled: ["iconFilled"],
                iconHover: ["iconHover"],
                iconFocus: ["iconFocus"],
                iconActive: ["iconActive"],
                decimal: ["decimal"],
                visuallyHidden: ["visuallyHidden"]
            };
            return (0, n.a)(c, E, t)
        })(eh);
        return (0, s.jsxs)(G, (0, t._)({
            ref: eo,
            onMouseMove: e => {
                P && P(e);
                let {
                    right: t,
                    left: a,
                    width: i
                } = es.current.getBoundingClientRect(), n = L(S * (X ? (t - e.clientX) / i : (e.clientX - a) / i) + F / 2, F);
                n = (0, I.c)(n, F, S), J(e => e.hover === n && e.focus === n ? e : {
                    hover: n,
                    focus: n
                }), el(!1), D && Z !== n && D(e, n)
            },
            onMouseLeave: e => {
                k && k(e), J({
                    hover: -1,
                    focus: -1
                }), D && -1 !== Z && D(e, -1)
            },
            className: (0, n.c)(ev.root, u, O && "MuiRating-readOnly"),
            ownerState: eh,
            role: O ? "img" : null,
            "aria-label": O ? g(ee) : null
        }, z, {
            children: [Array.from(Array(S)).map((e, a) => {
                let i = a + 1,
                    r = {
                        classes: ev,
                        disabled: f,
                        emptyIcon: h,
                        focus: $,
                        getLabelText: g,
                        highlightSelectedOnly: y,
                        hover: Z,
                        icon: x,
                        IconContainerComponent: A,
                        name: q,
                        onBlur: em,
                        onChange: ec,
                        onClick: ed,
                        onFocus: eu,
                        ratingValue: ee,
                        ratingValueRounded: Y,
                        readOnly: O,
                        ownerState: eh
                    },
                    l = i === Math.ceil(ee) && (-1 !== Z || -1 !== $);
                if (F < 1) {
                    let e = Array.from(Array(1 / F));
                    return (0, s.jsx)(j, {
                        className: (0, n.c)(ev.decimal, l && ev.iconActive),
                        ownerState: eh,
                        iconActive: l,
                        children: e.map((a, n) => {
                            let l = L(i - 1 + (n + 1) * F, F);
                            return (0, s.jsx)(V, (0, t._)({}, r, {
                                isActive: !1,
                                itemValue: l,
                                labelProps: {
                                    style: e.length - 1 === n ? {} : {
                                        width: l === ee ? (n + 1) * F * 100 + "%" : "0%",
                                        overflow: "hidden",
                                        position: "absolute"
                                    }
                                }
                            }), l)
                        })
                    }, i)
                }
                return (0, s.jsx)(V, (0, t._)({}, r, {
                    isActive: l,
                    itemValue: i
                }), i)
            }), !O && !f && (0, s.jsxs)(N, {
                className: (0, n.c)(ev.label, ev.labelEmptyValue),
                ownerState: eh,
                children: [(0, s.jsx)("input", {
                    className: ev.visuallyHidden,
                    value: "",
                    id: "".concat(q, "-empty"),
                    type: "radio",
                    name: q,
                    checked: null == Y,
                    onFocus: () => ef(!0),
                    onBlur: () => ef(!1),
                    onChange: ec
                }), (0, s.jsx)("span", {
                    className: ev.visuallyHidden,
                    children: v
                })]
            })]
        }))
    }), e.s(["f", 0, C], 328678)
}, 203450, e => {
    "use strict";
    var t = e.i(785517),
        a = e.i(643766),
        i = e.i(441879),
        n = e.i(79187),
        r = e.i(814975),
        l = e.i(156071),
        s = e.i(881670),
        o = e.i(745873),
        c = e.i(338653);
    let d = (0, a.createContext)({
        isAffiliateProgramLoading: !1,
        requiresActionToJoinProgram: void 0,
        compliantWithAllUserRequirements: void 0,
        creatorMetadata: void 0,
        isCurrentUserGroupOwner: void 0,
        isGroupEligible: void 0
    });
    d.displayName = "AffiliateProgram";
    let u = (0, n.K)(e => {
        let {
            children: n
        } = e, {
            user: s
        } = (0, r.f)(), u = (0, o.W)(), [m, p] = (0, a.useState)(void 0), [f, h] = (0, a.useState)(), [v, g] = (0, a.useState)(), [b, y] = (0, a.useState)(), [x, w] = (0, a.useState)(), I = (0, a.useMemo)(() => {
            var e;
            return (null != (e = null == u ? void 0 : u.id) ? e : 0) !== 0
        }, [u]), [A, S] = (0, a.useState)(void 0), C = void 0 === m || void 0 === f || void 0 === v && I, T = (0, a.useCallback)(async () => {
            try {
                if (I && (null == u ? void 0 : u.id)) {
                    let e = await (0, c.R)(u.id);
                    p(e);
                    return
                }
                if (!I && (null == s ? void 0 : s.id)) {
                    let e = await (0, c.e)();
                    p(e);
                    return
                }
            } catch (e) {
                return
            }
            p(null)
        }, [null == u ? void 0 : u.id, I, null == s ? void 0 : s.id]), D = (0, a.useCallback)(async () => {
            if (I && A || !I) try {
                let e = await (0, c.L)();
                h(e.requirements);
                return
            } catch (e) {
                return
            }
            h(null)
        }, [A, I]), E = (0, a.useCallback)(async () => {
            if (I && (null == u ? void 0 : u.id)) try {
                let e = await (0, c.Y)(u.id);
                g(e.isEligible)
            } catch (e) {
                g(!1)
            }
        }, [u, I]);
        (0, a.useEffect)(() => {
            C ? w(void 0) : I && !A ? w(!1) : w(!1 === b)
        }, [I, A, b, C]), (0, a.useEffect)(() => {
            (async () => {
                if (I && (null == u ? void 0 : u.id)) {
                    var e;
                    return null == (e = (await l.U.getGroupInfo(u.id)).owner) ? void 0 : e.userId
                }
            })().then(e => {
                e && s && S(e === s.id)
            })
        }, [null == u ? void 0 : u.id, I, s]), (0, a.useEffect)(() => {
            C || !f || I && !A ? y(void 0) : y((null == f ? void 0 : f.length) === 0 || (null == f ? void 0 : f.length) === 1 && f[0] === i.q.Payable)
        }, [A, I, C, f]), (0, a.useEffect)(() => {
            T()
        }, [T]), (0, a.useEffect)(() => {
            D()
        }, [D]), (0, a.useEffect)(() => {
            E()
        }, [E]);
        let k = (0, a.useMemo)(() => ({
            isAffiliateProgramLoading: C,
            requiresActionToJoinProgram: x,
            compliantWithAllUserRequirements: b,
            creatorMetadata: null != m ? m : void 0,
            requirements: null != f ? f : void 0,
            isCurrentUserGroupOwner: A,
            isGroupEligible: null != v ? v : void 0
        }), [C, x, b, m, f, A, v]);
        return (0, t.jsx)(d.Provider, {
            value: k,
            children: n
        })
    }, [s.f.Organization]);
    e.s(["U", 0, u, "t", 0, function() {
        return (0, a.useContext)(d)
    }])
}, 714039, 540082, e => {
    "use strict";
    var t, a = e.i(785517),
        i = e.i(643766),
        n = e.i(79187),
        r = e.i(563045),
        l = e.i(967677),
        s = e.i(446475),
        o = e.i(47277),
        c = e.i(433285),
        d = e.i(215680),
        u = e.i(828200),
        m = e.i(358763),
        p = e.i(889311),
        f = e.i(823062),
        h = e.i(881670),
        v = e.i(904969),
        g = e.i(906791);
    let b = (0, e.i(67243).f)()(e => ({
        alertContainer: {
            marginBottom: "16px",
            [e.breakpoints.down("Medium")]: {
                flexWrap: "wrap"
            },
            "& .MuiAlert-icon": {
                [e.breakpoints.down("Medium")]: {
                    flexBasis: "10%",
                    marginRight: 0
                }
            },
            "& .MuiAlert-message": {
                [e.breakpoints.down("Medium")]: {
                    flexBasis: "90%"
                }
            },
            "& .MuiAlert-action": {
                padding: "8px 0",
                columnGap: "0.5rem",
                paddingLeft: "0.5rem",
                flexShrink: 0,
                [e.breakpoints.down("Medium")]: {
                    flexBasis: "100%",
                    justifyContent: "end"
                }
            }
        },
        viewDetails: {
            textDecoration: "underline",
            whiteSpace: "nowrap"
        },
        getStarted: {
            backgroundColor: "rgba(255, 255, 255, 0.1)"
        }
    }));
    e.s(["f", 0, b], 540082);
    var y = ((t = {}).Home = "home", t.Creations = "creations", t);
    let x = (0, n.K)(e => {
        let t, h, y, x, {
                trackingPage: w,
                alertRedesignVariant: I
            } = e,
            {
                isBannerVisible: A,
                isHighPriority: S,
                variant: C,
                dismissBanner: T
            } = (0, g.p)(),
            {
                classes: D
            } = b(),
            E = (0, i.useRef)(null),
            {
                unifiedLogger: k
            } = (0, f.X)(),
            {
                translate: P
            } = (0, n.A)(),
            M = (0, i.useCallback)(() => {
                A && k.logImpressionEvent({
                    eventName: p.f.AgeVerificationUpsellBanner,
                    parameters: {
                        page: w,
                        variant: C,
                        ...I && {
                            alertRedesignVariant: I
                        }
                    }
                })
            }, [k, w, C, I, A]);
        (0, m.f)(E, M);
        let L = (0, i.useCallback)(() => {
                k.logClickEvent({
                    eventName: p.f.AgeVerificationUpsellBannerClick,
                    parameters: {
                        page: w,
                        action: "viewDetails",
                        variant: C,
                        ...I && {
                            alertRedesignVariant: I
                        }
                    }
                })
            }, [k, w, C, I]),
            G = (0, i.useCallback)(() => {
                k.logClickEvent({
                    eventName: p.f.AgeVerificationUpsellBannerClick,
                    parameters: {
                        page: w,
                        action: "callToAction",
                        variant: C,
                        ...I && {
                            alertRedesignVariant: I
                        }
                    }
                })
            }, [k, w, C, I]),
            N = (0, i.useCallback)(() => {
                k.logClickEvent({
                    eventName: p.f.AgeVerificationUpsellBannerClick,
                    parameters: {
                        page: w,
                        action: "dismiss",
                        variant: C,
                        ...I && {
                            alertRedesignVariant: I
                        }
                    }
                }), T()
            }, [k, T, w, C, I]);
        return ("establishTrust" === C ? (t = "Title.EstablishTrustBanner", h = "Label.EstablishTrustBanner2", y = v.v, x = v.M) : (t = "Title.AgeVerificationBanner", h = "Label.AgeVerificationBanner", y = v.i, x = v.$), A) ? (0, a.jsx)("div", {
            ref: E,
            children: (0, a.jsxs)(r.f, {
                className: D.alertContainer,
                severity: "ageVerification" === C && S ? "warning" : "info",
                variant: "filled",
                action: [(0, a.jsx)(c.f, {
                    href: y,
                    onClick: G,
                    className: D.getStarted,
                    color: "inherit",
                    size: "small",
                    children: P("Label.AgeVerificationBannerGetStarted")
                }, "getStarted"), (0, a.jsx)(d.f, {
                    color: "inherit",
                    size: "medium",
                    "aria-label": "dismiss",
                    onClick: N,
                    children: (0, a.jsx)(u.f, {})
                }, "dismiss")],
                children: [(0, a.jsx)(l.f, {
                    children: P(t)
                }), (0, a.jsx)(o.f, {
                    variant: "body2",
                    children: P(h)
                }), " ", (0, a.jsx)(s.f, {
                    className: D.viewDetails,
                    href: x,
                    target: "_blank",
                    color: "inherit",
                    onClick: L,
                    children: P("Label.AgeVerificationBannerViewDetails")
                })]
            })
        }) : null
    }, [h.f.Home]);
    e.s(["J", 0, x, "e", () => y], 714039)
}, 384621, e => {
    "use strict";
    var t = e.i(785517),
        a = e.i(643766),
        i = e.i(419652);
    e.s(["f", 0, e => {
        let {
            children: n
        } = e, [r, l] = (0, a.useState)(), s = e => {
            l(e)
        }, o = (0, a.useMemo)(() => ({
            droppedFile: r,
            updateDroppedFile: s
        }), [r]);
        return (0, t.jsx)(i.f.Provider, {
            value: o,
            children: n
        })
    }])
}, 663563, e => {
    e.v({
        buttonRow: "vYyLma_buttonRow",
        heroBanner: "vYyLma_heroBanner",
        heroCoverImage: "vYyLma_heroCoverImage",
        heroTextContent: "vYyLma_heroTextContent"
    })
}, 896852, e => {
    "use strict";
    var t = e.i(785517),
        a = e.i(643766),
        i = e.i(341260),
        n = e.i(396875),
        r = e.i(609305),
        l = e.i(335020),
        s = e.i(79187),
        o = e.i(870999),
        c = e.i(29929),
        d = e.i(889311),
        u = e.i(215955),
        m = e.i(227700),
        p = e.i(881670),
        f = e.i(114209),
        h = e.i(373736),
        v = e.i(917852),
        g = e.i(576069),
        b = e.i(663563);
    let y = "".concat("https://assets.create.roblox.com/dea85e59b76ad172160a6753a6bf9008dac07d11/assets", "/home/publish_eligibility_banner.webp"),
        x = (0, s.K)(e => {
            var x;
            let {
                universeId: w,
                showCallToAction: I = !0
            } = e, A = (0, i.useRouter)(), {
                translateWithNamespace: S
            } = (0, s.A)(), {
                params: C,
                isFetched: T
            } = (0, m.f)(c.f.CreatorHubCreationsPermission), D = C[c.G.EnableAudienceReachGrowthOpportunitiesBanner], {
                gameDetails: E
            } = (0, f.i)(), k = null == E ? void 0 : E.id, P = null != w ? w : k && k > 0 ? k : void 0, {
                data: M,
                isLoading: L,
                isFetching: G
            } = (0, g.C)(), N = (0, a.useRef)(!1), [F, j] = (0, a.useState)(!1), U = (null == M ? void 0 : M.ageBracket) === n.D.Over18, V = (null == M ? void 0 : M.ageBracket) === n.D.Between13And18, R = null != (x = null == M ? void 0 : M.creatorEligibility.includes(n._.IdVerified)) && x, _ = U || V, B = T && D && !(L || G) && !!M && !R;
            (0, a.useEffect)(() => {
                B && !N.current && (N.current = !0, u.f.logImpressionEvent({
                    eventName: d.f.AudienceReachGrowthOpportunitiesBannerImpression,
                    parameters: {
                        page: "audienceReach",
                        ctaType: _ ? "start" : "viewDetails",
                        ctaHidden: String(!I),
                        ...P ? {
                            universeId: String(P)
                        } : {}
                    }
                }))
            }, [B, I, _, P]);
            let O = (0, a.useCallback)(() => {
                if (!B) return;
                let e = _ ? "start" : "viewDetails";
                (u.f.logClickEvent({
                    eventName: d.f.AudienceReachGrowthOpportunitiesBannerClick,
                    parameters: {
                        page: "audienceReach",
                        action: e,
                        ...P ? {
                            universeId: String(P)
                        } : {}
                    }
                }), V) ? j(!0): _ || A.push("/settings/eligibility/publishing-permissions")
            }, [B, V, A, _, P]);
            return B ? (0, t.jsxs)(o.f, {
                item: !0,
                container: !0,
                direction: "row",
                paddingBottom: 4,
                children: [(0, t.jsxs)("div", {
                    className: (0, l.q)(b.default.heroBanner, "relative width-full flex items-center bg-surface-200 radius-large"),
                    children: [(0, t.jsx)("img", {
                        src: y,
                        alt: "",
                        "aria-hidden": !0,
                        className: (0, l.q)("block absolute width-full height-full"),
                        style: {
                            top: 0,
                            left: 0
                        },
                        onError: e => {
                            e.currentTarget.style.display = "none"
                        }
                    }), (0, t.jsxs)("div", {
                        className: (0, l.q)(b.default.heroTextContent, "color-mode-dark relative flex flex-col gap-medium padding-[32px]"),
                        children: [(0, t.jsxs)("div", {
                            children: [(0, t.jsxs)("div", {
                                className: "text-heading-medium content-emphasis",
                                children: [S(p.f.AudienceReach, "Heading.ExpandGrowthOpportunities"), " "]
                            }), (0, t.jsx)("div", {
                                className: "text-body-medium content-emphasis",
                                children: S(p.f.AudienceReach, "Description.ExpandGrowthOpportunities")
                            })]
                        }), (0, t.jsx)("div", {
                            className: (0, l.q)(b.default.buttonRow, "flex gap-small"),
                            children: I ? U ? (0, t.jsx)(r.f, {
                                as: "a",
                                href: v.Y,
                                target: "_blank",
                                rel: "noopener noreferrer",
                                onClick: O,
                                children: (0, t.jsx)("span", {
                                    children: S(p.f.AudienceReach, _ ? "Action.Start" : "Action.ViewDetails")
                                })
                            }) : (0, t.jsx)(r.f, {
                                onClick: O,
                                children: (0, t.jsx)("span", {
                                    children: S(p.f.AudienceReach, _ ? "Action.Start" : "Action.ViewDetails")
                                })
                            }) : null
                        })]
                    })]
                }), V ? (0, t.jsx)(h.f, {
                    open: F,
                    onOpenChange: j,
                    onContinueWithId: () => {
                        window.open(v.Y, "_blank", "noopener,noreferrer"), j(!1)
                    },
                    onAddParent: () => {
                        window.open(v.$, "_blank", "noopener,noreferrer"), j(!1)
                    }
                }) : null]
            }) : null
        }, [p.f.AudienceReach, p.f.PublicPublish]);
    e.s(["f", 0, x])
}, 899441, e => {
    "use strict";
    var t, a, i = e.i(391643),
        n = e.i(272593),
        r = ((t = {}).Animation = "Animation", t.Audio = "Audio", t.Decal = "Decal", t.Image = "Image", t.Mesh = "Mesh", t.MeshPart = "MeshPart", t.Model = "Model", t.Plugin = "Plugin", t.TextDocument = "TextDocument", t.Video = "Video", t),
        l = ((a = {}).Group = "groups", a.User = "users", a);
    let s = new i.a((0, n.f)("creator-inventory-api", "bedev2"));
    e.s(["G", () => r, "c", () => l, "Z", 0, (e, t, a) => (null == t.isArchived && null == t.orderBy ? s : s.withPreMiddleware(async e => {
        let {
            url: a,
            init: i
        } = e;
        return {
            url: ((e, t) => {
                let {
                    isArchived: a,
                    orderBy: i
                } = t;
                if (null == a && null == i) return e;
                let n = e.indexOf("?"),
                    r = -1 === n ? e : e.slice(0, n),
                    l = (-1 === n ? [] : e.slice(n + 1).split("&")).map(e => null != a && e.startsWith("filter=") ? "".concat(e).concat(encodeURIComponent(";isArchived=".concat(a))) : e);
                return null != i && l.push("orderBy=".concat(encodeURIComponent(i))), "".concat(r, "?").concat(l.join("&"))
            })(a, t),
            init: i
        }
    })).creatorInventorySearchCreatorInventoryItems(e, a)])
}, 445550, e => {
    "use strict";
    var t = e.i(805290),
        a = e.i(894432),
        i = e.i(307529),
        n = e.i(272593);
    let r = {
            [i.f.Model]: a.C.Model,
            [i.f.Plugin]: a.C.Plugin
        },
        l = {
            3: i.f.Audio,
            10: i.f.Model,
            13: i.f.Decal,
            38: i.f.Plugin,
            40: i.f.MeshPart,
            62: i.f.Video
        },
        s = new class {
            async getUserSettingsFeatureKey(e) {
                let t = await this.frontendFlagsApi.frontendFlagsGetUserSetting({
                    featureKey: e
                });
                return !!(null == t ? void 0 : t.value)
            }
            async setUserSettingsFeatureKey(e, t) {
                await this.frontendFlagsApi.frontendFlagsSetUserSetting({
                    featureKey: e,
                    updateUserSettingRequest: {
                        value: String(t)
                    }
                })
            }
            async getItemDetails(e) {
                var t;
                return {
                    items: null != (t = (await this.toolboxApi.toolboxGetItemsDetails({
                        assetIds: e.join(",")
                    })).data) ? t : []
                }
            }
            async getCreatorInsightTable(e) {
                return this.toolboxApi.toolboxGetCreatorInsights({
                    assetType: e
                })
            }
            async getCreations(e, t, a, i, n, l, s) {
                return a ? this.toolboxApi.toolboxGetCreationAssets({
                    ownerId: a,
                    assetType: r[t],
                    limit: i,
                    cursor: n,
                    separateModelsAndPackages: l,
                    includeSharedAssets: s
                }) : this.toolboxApi.toolboxGetUserCreationAssets({
                    userId: e,
                    assetType: r[t],
                    limit: i,
                    cursor: n
                })
            }
            async getMarketplaceAssets(e) {
                return this.toolboxApi.toolboxGetMarketplaceAssets(e)
            }
            getFrontendFlagsValues(e) {
                return this.frontendFlagsApi.frontendFlagsGetValues(e)
            }
            constructor() {
                (0, t._)(this, "frontendFlagsApi", void 0), (0, t._)(this, "toolboxApi", void 0);
                let e = (0, n.f)("toolbox-service", "bedev2");
                this.frontendFlagsApi = new a.k(e), this.toolboxApi = new a.e(e)
            }
        };
    e.s(["F", 0, l, "U", 0, s, "a", 0, 30])
}, 131385, e => {
    "use strict";
    var t = e.i(643766),
        a = e.i(780880),
        i = e.i(339544),
        n = e.i(643093),
        r = e.i(130778),
        l = e.i(910272),
        s = e.i(913893),
        o = e.i(711327),
        c = e.i(671376),
        d = e.i(117236);
    let u = function() {
        let e = !(arguments.length > 0) || void 0 === arguments[0] || arguments[0],
            a = (0, l.f)({
                queryKey: ["getTaxonomyCategories", o.f.NUMBER_3],
                queryFn: () => s.f.getItemCategories(o.f.NUMBER_3),
                enabled: e,
                staleTime: 3e5
            }),
            i = (0, l.f)({
                queryKey: ["getAvatarItemsEntryPointAssetTypes"],
                queryFn: d.X,
                enabled: e,
                staleTime: 3e5
            }),
            r = i.data,
            u = (0, t.useMemo)(() => {
                var e, t;
                return {
                    enableMakeupAssets: null != (e = null == r ? void 0 : r.has(c.f.EyeMakeup)) && e,
                    enableAvatarBackgrounds: null != (t = null == r ? void 0 : r.has(c.f.AvatarBackground)) && t
                }
            }, [r]),
            m = (0, t.useMemo)(() => (0, n.w)(a.data, u), [a.data, u]),
            p = (0, t.useMemo)(() => (0, n.D)(m), [m]);
        return {
            response: a.data,
            categories: m,
            l1Options: p,
            isLoading: a.isLoading || i.isLoading,
            isError: a.isError
        }
    };
    e.s(["f", 0, e => {
        var l, s, o;
        let [{
            activeTab: c,
            filterIndex: d
        }] = (0, a.f)(["activeTab", "filterIndex"]), {
            l1Options: m,
            categories: p,
            isLoading: f
        } = u(e), h = (0, r.Y)(c) || (0, r.q)(c) || (0, r.Z)(c) ? void 0 : null != (l = (0, r.C)(c)) ? l : null == (o = m[0]) ? void 0 : o.taxonomyKey, v = (0, t.useMemo)(() => (0, n.a)(p, h), [p, h]), g = (0, t.useMemo)(() => (0, n.R)(v), [v]), b = parseInt(null != (s = null == d ? void 0 : d.toString()) ? s : "", 10), y = (0, i.U)(b, g) ? b : 0, x = (0, t.useMemo)(() => {
            if (v) return g.length > 0 ? g[y] : v.webStableId ? (0, n.W)(v) : void 0
        }, [v, g, y]);
        return {
            l1Options: m,
            activeL1Key: h,
            activeL1Node: v,
            l2Options: g,
            filterIndex: y,
            selection: x,
            isLoading: f
        }
    }], 131385)
}, 638016, e => {
    "use strict";
    var t = e.i(780880),
        a = e.i(723538),
        i = e.i(130778);
    e.s(["f", 0, e => {
        let [{
            activeTab: n
        }] = (0, t.f)(["activeTab"]), r = (0, a.f)(), l = r && (0, i.z)(n), s = r && (0, i.Z)(n);
        return {
            canUseTaxonomy: r && (l || (0, i.L)(e)),
            isTaxonomyMode: l,
            isTaxonomyView: l && !(0, i.Y)(n) && !(0, i.q)(n) && !(0, i.Z)(n),
            isAvatarLooksView: s
        }
    }])
}, 339544, 643093, e => {
    "use strict";
    var t = e.i(671376);
    let a = (e, t) => "".concat(e, "_").concat(t);
    e.s(["d", 0, e => {
        let t = new Map;
        return Object.entries(e).forEach(e => {
            let [i, n] = e;
            n.forEach((e, n) => {
                t.set(a(i, e.nameKey), n)
            })
        }), t
    }, "g", 0, e => e === t.f.TShirt, "U", 0, (e, t) => void 0 !== t && void 0 !== e && e > 0 && e < t.length, "N", 0, a], 339544);
    var i = e.i(266213),
        n = e.i(418162);
    let r = new Set([2, 11, 12]),
        l = new Set([76, 77, 88, 89, 90]),
        s = new Set([92]),
        o = new Set([4]);

    function c(e, t) {
        var a;
        return (null != (a = e.assetTypeIds) ? a : []).some(e => t.has(e))
    }

    function d(e) {
        var t;
        return !0 === e.isPublishable || !!c(e, s) || (null != (t = e.bundleTypeIds) ? t : []).some(e => o.has(e))
    }

    function u(e) {
        var t;
        return {
            nameKey: null != (t = e.name) ? t : "",
            taxonomy: e.webStableId,
            taxonomyAssetTypeIds: e.assetTypeIds,
            skipTranslation: !0
        }
    }

    function m(e) {
        return {
            nameKey: e.name,
            taxonomy: e.webStableId,
            taxonomyKey: e.key,
            taxonomyAssetTypeIds: e.assetTypeIds,
            skipTranslation: !0
        }
    }
    e.s(["D", 0, function(e) {
        return e.map(m)
    }, "R", 0, function(e) {
        var t;
        let a = (null != (t = null == e ? void 0 : e.children) ? t : []).filter(e => e.webStableId).map(u);
        return (null == e ? void 0 : e.isMakeup) && a.push({
            lookType: i.f.Makeup,
            nameKey: "Label.Looks"
        }), a
    }, "W", 0, m, "a", 0, function(e, t) {
        if (t) return e.find(e => e.key === t)
    }, "s", 0, function(e, t) {
        var a;
        return e.skipTranslation ? (0, n.h)(e.nameKey, t) : null != (a = t(e.nameKey)) ? a : e.nameKey
    }, "p", 0, function(e) {
        return void 0 !== e.taxonomy ? e.taxonomy : void 0 !== e.lookType ? "look:".concat(e.lookType) : e.nameKey
    }, "w", 0, function(e, t) {
        var a;
        let i = null != (a = null == e ? void 0 : e.categories) ? a : [],
            n = [],
            o = [];
        return i.forEach(e => {
            var a, i, u;
            let m = null != (a = e.children) ? a : [];
            if (0 === m.length) {
                if (!d(e) || c(e, s) && !t.enableAvatarBackgrounds || !e.webStableId) return;
                o.push({
                    key: e.webStableId,
                    name: null != (u = e.name) ? u : "",
                    webStableId: e.webStableId,
                    assetTypeIds: e.assetTypeIds,
                    children: []
                });
                return
            }
            let p = [],
                f = !1;
            m.forEach(e => {
                if (c(e, l)) {
                    t.enableMakeupAssets && (f = !0, p.push(e));
                    return
                }
                if (d(e)) {
                    if (c(e, r)) return void n.push(e);
                    p.push(e)
                }
            }), 0 !== p.length && e.webStableId && o.push({
                key: e.webStableId,
                name: null != (i = e.name) ? i : "",
                webStableId: e.webStableId,
                assetTypeIds: e.assetTypeIds,
                isMakeup: f,
                children: p
            })
        }), n.length > 0 && o.push({
            key: "classics",
            name: "Classics",
            webStableId: void 0,
            children: n
        }), o
    }], 643093)
}, 130778, e => {
    "use strict";
    var t, a, i, n = e.i(671376),
        r = e.i(692587),
        l = e.i(117236);
    let s = "AvatarItems",
        o = "".concat(s, "-"),
        c = n.f.HairAccessory;

    function d(e) {
        let t = (0, r.d)(e);
        if (void 0 === t || !t.startsWith(o)) return;
        let a = t.slice(o.length);
        return a.length > 0 ? a : void 0
    }
    let u = "looks",
        m = new Set(null != (t = null == (i = l.U.find(e => "Label.AvatarItems" === e.nameKey)) || null == (a = i.submenuItems) ? void 0 : a.map(e => e.type)) ? t : []);

    function p(e) {
        return m.has(e)
    }
    e.s(["X", 0, "all", "a", 0, s, "w", 0, u, "K", 0, c, "c", 0, function(e) {
        return e ? "".concat(o).concat(e) : s
    }, "Y", 0, function(e) {
        return "all" === d(e)
    }, "Z", 0, function(e) {
        return d(e) === u
    }, "q", 0, function(e) {
        return "Recents" === (0, r.d)(e) || "recents" === d(e)
    }, "z", 0, function(e) {
        var t;
        let a = (0, r.d)(e);
        return a === s || null != (t = null == a ? void 0 : a.startsWith(o)) && t
    }, "L", 0, p, "C", 0, d, "r", 0, function(e) {
        let {
            isTaxonomyEnabled: t,
            isChangingSection: a,
            nextAssetType: i
        } = e;
        return t && a && p(i)
    }])
}, 376204, e => {
    "use strict";
    var t = e.i(29929),
        a = e.i(227700);
    e.s(["f", 0, () => {
        let {
            isFetched: e,
            params: i
        } = (0, a.f)(t.f.CreatorHubPublishing, {
            restoreInitialValueFromCache: !0
        }), n = i[t.q.EnableMultiAssetSearch];
        return {
            isEnabled: !0 === n,
            isReady: e || void 0 !== n
        }
    }])
}, 704443, e => {
    "use strict";
    var t = e.i(671376);
    e.s(["f", 0, function(e, a) {
        return e === t.f.UpcomingEvent || e === t.f.PastEvent || e === t.f.DraftEvent ? a[e] : a[t.f.Place]
    }])
}, 211461, e => {
    "use strict";
    var t, a, i, n, r = e.i(391643),
        l = e.i(899441),
        s = e.i(557638),
        o = e.i(671376),
        c = ((t = {}).All = "All", t),
        d = ((a = {}).All = "All", a),
        u = ((i = {}).Archived = "archived", i),
        m = ((n = {}).CreatedNewest = "created_desc", n.CreatedOldest = "created_asc", n.UpdatedNewest = "updated_desc", n.UpdatedOldest = "updated_asc", n);
    let p = ["updated_desc", "updated_asc", "created_desc", "created_asc"],
        f = {
            created_desc: "createTime desc",
            created_asc: "createTime",
            updated_desc: "updateTime desc",
            updated_asc: "updateTime"
        },
        h = {
            created: {
                ascending: "created_asc",
                descending: "created_desc"
            },
            updated: {
                ascending: "updated_asc",
                descending: "updated_desc"
            }
        },
        v = [l.G.Model, l.G.Plugin, l.G.Audio, l.G.Decal, l.G.Image, l.G.Video, l.G.Mesh, l.G.MeshPart, l.G.Animation],
        g = [...v, l.G.TextDocument],
        b = new Set([l.G.Audio, l.G.Decal, l.G.MeshPart, l.G.TextDocument, l.G.Video]),
        y = new Set([...b, l.G.Image]),
        x = new Set(g),
        w = new Set([l.G.TextDocument]),
        I = new Set(["All", s.f.Created, s.f.Purchased, s.f.Shared]),
        A = new Set([o.f.Animation, o.f.Audio, o.f.Decal, o.f.Image, o.f.Mesh, o.f.MeshPart, o.f.Model, o.f.Plugin, o.f.Video]),
        S = {
            [l.G.Animation]: o.f.Animation,
            [l.G.Audio]: o.f.Audio,
            [l.G.Decal]: o.f.Decal,
            [l.G.Image]: o.f.Image,
            [l.G.Mesh]: o.f.Mesh,
            [l.G.MeshPart]: o.f.MeshPart,
            [l.G.Model]: o.f.Model,
            [l.G.Plugin]: o.f.Plugin,
            [l.G.TextDocument]: o.f.TextDocument,
            [l.G.Video]: o.f.Video
        },
        C = {
            [l.G.Animation]: r.s.Animation,
            [l.G.Audio]: r.s.Audio,
            [l.G.Decal]: r.s.Decal,
            [l.G.Image]: r.s.Image,
            [l.G.Mesh]: r.s.Mesh,
            [l.G.MeshPart]: r.s.MeshPart,
            [l.G.Model]: r.s.Model,
            [l.G.Plugin]: r.s.Plugin,
            [l.G.TextDocument]: r.s.TextDocument,
            [l.G.Video]: r.s.Video
        },
        T = {
            3: l.G.Audio,
            10: l.G.Model,
            13: l.G.Decal,
            24: l.G.Animation,
            38: l.G.Plugin,
            40: l.G.MeshPart,
            62: l.G.Video,
            93: l.G.TextDocument,
            ANIMATION: l.G.Animation,
            ASSET_TYPE_ANIMATION: l.G.Animation,
            ASSET_TYPE_AUDIO: l.G.Audio,
            ASSET_TYPE_DECAL: l.G.Decal,
            ASSET_TYPE_IMAGE: l.G.Image,
            ASSET_TYPE_MESH: l.G.Mesh,
            ASSET_TYPE_MESH_PART: l.G.MeshPart,
            ASSET_TYPE_MODEL: l.G.Model,
            ASSET_TYPE_PLUGIN: l.G.Plugin,
            ASSET_TYPE_TEXT_DOCUMENT: l.G.TextDocument,
            ASSET_TYPE_VIDEO: l.G.Video,
            AUDIO: l.G.Audio,
            DECAL: l.G.Decal,
            IMAGE: l.G.Image,
            MESH: l.G.Mesh,
            MESHPART: l.G.MeshPart,
            MODEL: l.G.Model,
            PLUGIN: l.G.Plugin,
            TEXTDOCUMENT: l.G.TextDocument,
            VIDEO: l.G.Video
        },
        D = {
            createdDetails: s.f.Created,
            purchasedDetails: s.f.Purchased,
            sharedDetails: s.f.Shared
        },
        E = {
            [r.A.Active]: "Active",
            [r.A.Archived]: "Archived"
        },
        k = e => !0 === e ? g : v,
        P = e => null != e && y.has(e),
        M = e => {
            if (null == e) return;
            let t = e instanceof Date ? e : new Date(e);
            return Number.isNaN(t.getTime()) ? void 0 : t
        };
    e.s(["Z", 0, "updated_desc", "G", () => d, "g", () => m, "d", () => c, "p", () => u, "w", 0, (e, t) => null != t ? {
        type: l.c.Group,
        id: t
    } : null != e ? {
        type: l.c.User,
        id: e
    } : void 0, "N", 0, (e, t, a) => ({
        ...0 === t.length ? {} : {
            assetTypes: t.map(e => C[e])
        },
        ...e.type === l.c.Group ? {
            groupIds: [e.id]
        } : {
            userIds: [e.id]
        },
        ..."All" === a ? {} : {
            sources: [a]
        }
    }), "Q", 0, e => e.sources.includes(s.f.Created), "X", 0, (e, t) => e.filter(e => t ? "Archived" === e.state : "Archived" !== e.state), "v", 0, (e, t) => t.trim().length > 0 ? void 0 : f[e], "a", 0, e => e ? "All" : s.f.Created, "O", 0, k, "j", 0, (e, t) => e === h[t].ascending ? "ascending" : e === h[t].descending ? "descending" : "none", "x", 0, (e, t) => [e, ...k(t).filter(t => t !== e)], "y", 0, e => S[e], "z", 0, (e, t) => e === h[t].descending ? h[t].ascending : h[t].descending, "L", 0, e => {
        let {
            defaultSource: t,
            query: a,
            showArchived: i,
            source: n
        } = e;
        return a.trim().length > 0 || i || n !== t
    }, "D", 0, e => e !== l.G.TextDocument, "_", 0, e => e !== l.G.TextDocument, "P", 0, P, "c", 0, (e, t) => e === o.f.TextDocument ? !0 === t : A.has(e), "e", 0, e => null != e && b.has(e), "$", 0, e => "All" === e, "o", 0, (e, t) => t || P(1 === e.length ? e[0] : void 0), "h", 0, (e, t) => null != e && !!x.has(e) && (!w.has(e) || !0 === t), "n", 0, e => p.some(t => t === e), "A", 0, e => null != e && I.has(e), "k", 0, e => "grid" === e || "list" === e, "i", 0, e => {
        var t, a, i, n, r, l, s;
        let o, c = null == (i = e.assetItem) ? void 0 : i.asset;
        if (null == c) return;
        let d = "number" == typeof c.assetId ? c.assetId : Number.parseInt(null != (t = c.assetId) ? t : "", 10);
        if (Number.isNaN(d)) return;
        let u = null == (n = c.displayName) ? void 0 : n.trim();
        return {
            id: null != (a = e.path) ? a : d.toString(),
            assetId: d,
            assetType: (e => {
                if (null != e) return T[e.toString().toUpperCase()]
            })(c.assetType),
            created: M(c.createTime),
            isPackage: (null == (r = e.assetItem) ? void 0 : r.isPackage) === !0,
            name: null == u || 0 === u.length ? d.toString() : u,
            sources: (s = null == (l = e.assetItem) ? void 0 : l.sources, o = new Set, null == s || s.forEach(e => {
                Object.entries(e).forEach(e => {
                    let [t, a] = e;
                    if (null == a) return;
                    let i = D[t];
                    null != i && o.add(i)
                })
            }), [...o]),
            state: null == c.state ? void 0 : E[c.state],
            updated: M(c.updateTime)
        }
    }, "b", 0, (e, t, a) => {
        let i = new Set(e.map(e => e.assetId));
        return [...e, ...[...t.values()].filter(e => null != e.assetType && (0 === a.length || a.includes(e.assetType)) && !i.has(e.assetId))]
    }])
}, 725509, e => {
    "use strict";
    var t = e.i(643766),
        a = e.i(79187),
        i = e.i(884213),
        n = e.i(401263),
        r = e.i(730530),
        l = e.i(881670);
    e.s(["f", 0, () => {
        let e = (0, a.A)(),
            {
                translate: s
            } = e,
            {
                tPendingTranslation: o
            } = (0, n.f)(e),
            c = (0, t.useCallback)((e, t, a, n) => {
                let r = o(e, t, a, n);
                return r.length > 0 ? r : (0, i.f)(e, n)
            }, [o]),
            d = (0, t.useCallback)(e => s("Label.AssetIDWithValue", {
                assetId: e.toString()
            }), [s]),
            u = (0, t.useCallback)(e => c("Clear {filterLabel}", "Accessible label for removing an active Development Items filter chip.", (0, r.Q)("Action.DevelopmentItems.ClearFilter", l.f.Creations), {
                filterLabel: e
            }), [c]),
            m = (0, t.useCallback)(e => c("Source: {source}", "Active filter chip describing the selected Development Items source.", (0, r.Q)("Label.DevelopmentItems.InventorySourceFilter", l.f.Creations), {
                source: e
            }), [c]),
            p = (0, t.useCallback)((e, t) => c("{assetTypes}, +{count} more", "Active filter chip listing the first selected Development Items asset types, then how many more are selected.", (0, r.Q)("Label.DevelopmentItems.AssetTypesWithMore", l.f.Creations), {
                assetTypes: e,
                count: t.toString()
            }), [c]),
            f = (0, t.useCallback)((e, t) => c("{query} in {assetType}", "Scoped-search suggestion that searches for a query within a Development Items asset type.", (0, r.Q)("Label.DevelopmentItems.SearchSuggestion", l.f.Creations), {
                assetType: t,
                query: e
            }), [c]);
        return {
            actions: c("Actions", "Development Items table column and accessible label for item actions.", (0, r.Q)("Label.DevelopmentItems.Actions", l.f.Creations)),
            acquiredFromStore: s("Label.CreatorStore"),
            allAssetTypes: c("All types", "Asset type filter option that includes every Development Items asset type.", (0, r.Q)("Label.DevelopmentItems.AllAssetTypes", l.f.Creations)),
            allSources: c("Any", "Source filter option that includes every Development Items source.", (0, r.Q)("Label.DevelopmentItems.AllSources", l.f.Creations)),
            assetId: s("Label.AssetID"),
            assetIdWithValue: d,
            assetTypesWithMore: p,
            assetType: c("Asset type", "Accessible label for the Development Items asset type filter.", (0, r.Q)("Label.DevelopmentItems.AssetType", l.f.Creations)),
            breadcrumbs: c("Breadcrumbs", "Accessible label for the page path shown above the Development Items page.", (0, r.Q)("Label.DevelopmentItems.Breadcrumbs", l.f.Creations)),
            dateCreated: c("Date created", "Development Items table column showing when an asset was created.", (0, r.Q)("Label.DevelopmentItems.DateCreated", l.f.Creations)),
            clearFilter: u,
            clearSearch: c("Clear search", "Accessible label and action for clearing the Development Items search query.", (0, r.Q)("Action.DevelopmentItems.ClearSearch", l.f.Creations)),
            filterBy: s("Label.FilterBy"),
            firstPage: c("First page", "Accessible label for the Development Items pagination first-page button.", (0, r.Q)("Action.DevelopmentItems.FirstPage", l.f.Creations)),
            grid: c("Grid", "Accessible label for the Development Items grid view.", (0, r.Q)("Label.DevelopmentItems.GridView", l.f.Creations)),
            inventorySource: c("Source", "Label for the Development Items source filter and table column.", (0, r.Q)("Label.DevelopmentItems.InventorySource", l.f.Creations)),
            inventorySourceFilter: m,
            lastPage: c("Last page", "Accessible label for the Development Items pagination last-page button.", (0, r.Q)("Action.DevelopmentItems.LastPage", l.f.Creations)),
            lastUpdated: s("Label.LastUpdated"),
            list: c("List", "Accessible label for the Development Items list view.", (0, r.Q)("Label.DevelopmentItems.ListView", l.f.Creations)),
            loading: s("Label.Loading"),
            name: s("Label.Name"),
            nextPage: c("Next page", "Accessible label for the Development Items pagination next-page button.", (0, r.Q)("Action.DevelopmentItems.NextPage", l.f.Creations)),
            noArchivedItemsDescription: c("Items you archive will show up here.", "Guidance shown when the Development Items Archived folder is empty.", (0, r.Q)("Description.DevelopmentItems.NoArchivedItems", l.f.Creations)),
            noArchivedItems: c("No archived items", "Heading shown when the Development Items Archived folder is empty.", (0, r.Q)("Heading.DevelopmentItems.NoArchivedItems", l.f.Creations)),
            noDevelopmentItemsDescription: c("Upload assets to see them here.", "Guidance shown when the creator has no Development Items across all asset types.", (0, r.Q)("Description.DevelopmentItems.NoDevelopmentItems", l.f.Creations)),
            noDevelopmentItems: c("No development items yet", "Heading shown when the creator has no Development Items across all asset types.", (0, r.Q)("Heading.DevelopmentItems.NoDevelopmentItems", l.f.Creations)),
            noItemsDescription: c("Try another search or filter.", "Guidance shown when no Development Items match the current query and filters.", (0, r.Q)("Description.DevelopmentItems.NoItemsFound", l.f.Creations)),
            noItems: c("No items found", "Heading shown when no Development Items match the current query and filters.", (0, r.Q)("Heading.DevelopmentItems.NoItemsFound", l.f.Creations)),
            package: c("Package", "Accessible label for the package indicator on a Development Item thumbnail.", (0, r.Q)("Label.DevelopmentItems.Package", l.f.Creations)),
            previousPage: c("Previous page", "Accessible label for the Development Items pagination previous-page button.", (0, r.Q)("Action.DevelopmentItems.PreviousPage", l.f.Creations)),
            retry: s("Action.Retry"),
            rowsPerPage: s("Label.RowsPerPage"),
            search: s("Label.Search"),
            searchSuggestion: f,
            searchWithinAssetType: c("Search within asset type", "Accessible label for Development Items scoped-search suggestions.", (0, r.Q)("Label.DevelopmentItems.SearchWithinAssetType", l.f.Creations)),
            sortBestMatch: c("Sort by: Best match", "Development Items sort shown while a search query ranks results by relevance.", (0, r.Q)("Label.DevelopmentItems.SortByBestMatch", l.f.Creations)),
            sortBy: c("Sort by", "Accessible label for the Development Items sort selector.", (0, r.Q)("Label.DevelopmentItems.SortBy", l.f.Creations)),
            sortCreatedNewest: c("Sort by: Created (newest first)", "Development Items sort option listing the most recently created assets first.", (0, r.Q)("Label.DevelopmentItems.SortByCreatedNewest", l.f.Creations)),
            sortCreatedOldest: c("Sort by: Created (oldest first)", "Development Items sort option listing the earliest created assets first.", (0, r.Q)("Label.DevelopmentItems.SortByCreatedOldest", l.f.Creations)),
            sortUpdatedNewest: c("Sort by: Updated (newest first)", "Development Items sort option listing the most recently updated assets first.", (0, r.Q)("Label.DevelopmentItems.SortByUpdatedNewest", l.f.Creations)),
            sortUpdatedOldest: c("Sort by: Updated (oldest first)", "Development Items sort option listing the least recently updated assets first.", (0, r.Q)("Label.DevelopmentItems.SortByUpdatedOldest", l.f.Creations)),
            sharedWithMe: c("Shared with me", "Source filter option for Development Items shared with the current creator.", (0, r.Q)("Label.DevelopmentItems.SharedWithMe", l.f.Creations)),
            showHiddenBreadcrumbs: c("Show hidden pages", "Accessible label for the button that expands collapsed pages in the Development Items breadcrumbs.", (0, r.Q)("Action.DevelopmentItems.ShowHiddenBreadcrumbs", l.f.Creations)),
            unavailableDescription: c("Try again in a moment.", "Guidance shown when the Development Items inventory cannot be loaded.", (0, r.Q)("Description.DevelopmentItems.InventoryUnavailable", l.f.Creations)),
            unavailable: c("Inventory is unavailable", "Heading shown when the Development Items inventory cannot be loaded.", (0, r.Q)("Heading.DevelopmentItems.InventoryUnavailable", l.f.Creations)),
            viewSelector: c("Choose grid or list view", "Accessible label for the Development Items view selector.", (0, r.Q)("Label.DevelopmentItems.ViewSelector", l.f.Creations)),
            uploadedByMe: c("Uploaded", "Source filter option for Development Items uploaded by the current creator.", (0, r.Q)("Label.DevelopmentItems.UploadedByMe", l.f.Creations))
        }
    }])
}, 723538, e => {
    "use strict";
    var t = e.i(500758),
        a = e.i(239328);
    e.s(["f", 0, () => {
        let {
            ready: e,
            value: i
        } = (0, t.f)(a.H);
        return e && null != i && i
    }])
}, 100226, e => {
    "use strict";
    var t = e.i(500758),
        a = e.i(239328);
    e.s(["f", 0, () => {
        let {
            ready: e,
            value: i
        } = (0, t.f)(a.Z);
        if (e) return i
    }])
}, 773595, e => {
    "use strict";
    var t = e.i(79187);
    let a = new Map([
            ["id-id", t.v.Indonesian],
            ["de-de", t.v.German],
            ["en-us", t.v.English],
            ["es-es", t.v.Spanish],
            ["fr-fr", t.v.French],
            ["it-it", t.v.Italian],
            ["pl-pl", t.v.Polish],
            ["pt-br", t.v.BrazilPortuguese],
            ["vi-vn", t.v.Vietnamese],
            ["tr-tr", t.v.Turkish],
            ["ar-001", t.v.Arabic],
            ["th-th", t.v.Thai],
            ["zh-cn", t.v.SimplifiedChinese],
            ["zh-tw", t.v.TraditionalChinese],
            ["ja-jp", t.v.Japanese],
            ["ko-kr", t.v.Korean]
        ]),
        i = [t.v.Indonesian, t.v.German, t.v.English, t.v.Spanish, t.v.French, t.v.Italian, t.v.Polish, t.v.BrazilPortuguese, t.v.Vietnamese, t.v.Turkish, t.v.Arabic, t.v.Thai, t.v.SimplifiedChinese, t.v.TraditionalChinese, t.v.Japanese, t.v.Korean];
    e.s(["D", 0, a, "W", 0, i])
}, 321211, e => {
    "use strict";
    var t = e.i(785517),
        a = e.i(643766);
    e.s(["f", 0, e => {
        let {
            className: i,
            onChange: n,
            onDragActiveHandler: r,
            onDragLeaveHandler: l,
            size: s,
            multiple: o,
            children: c,
            accept: d,
            ...u
        } = e, m = (0, a.useRef)(null), p = () => {
            m.current && m.current.click()
        }, f = e => {
            ((e instanceof Event ? e instanceof KeyboardEvent : e.nativeEvent && e.nativeEvent instanceof KeyboardEvent) ? ["Spacebar", " ", "Enter"].includes(e.key) : (console.info("The event passed in is not a keyboard event, are you using the handler in the wrong place?"), !1)) && (e.preventDefault(), p())
        }, h = c ? c(p, f, e => {
            e.preventDefault();
            let {
                dataTransfer: {
                    files: t
                }
            } = e;
            n && n(t)
        }, e => {
            e.preventDefault(), r && r()
        }, e => {
            e.preventDefault(), l && l()
        }) : null;
        return (0, t.jsxs)("div", {
            className: i,
            children: [h, (0, t.jsx)("input", {
                ...u,
                accept: d,
                multiple: o,
                ref: m,
                type: "file",
                size: s,
                onChange: e => {
                    let {
                        target: t
                    } = e;
                    n && n(t.files), m.current && (m.current.value = "")
                },
                style: {
                    display: "none"
                }
            })]
        })
    }], 321211)
}, 137785, e => {
    "use strict";
    var t = e.i(785517),
        a = e.i(643766),
        i = e.i(79187),
        n = e.i(218701),
        r = e.i(47277),
        l = e.i(870999),
        s = e.i(67243),
        o = e.i(522612),
        c = e.i(446475),
        d = e.i(646555),
        u = e.i(442621),
        m = e.i(779767),
        p = e.i(17829),
        f = e.i(384586),
        h = e.i(562506),
        v = e.i(890246),
        g = e.i(805499);
    let b = {
            compact: 32,
            medium: 48,
            large: 64
        },
        y = {
            compact: 12,
            medium: 16,
            large: 20
        },
        x = {
            compact: 32,
            medium: 48,
            large: 64
        },
        w = {
            compact: 4,
            medium: 6,
            large: 8
        },
        I = (0, s.f)()((e, t) => {
            let {
                variant: a
            } = t;
            return {
                container: {
                    minWidth: 0,
                    width: "fit-content"
                },
                avatarContainer: {
                    width: b[a],
                    height: b[a],
                    marginRight: y[a]
                },
                userBorderRadius: {
                    borderRadius: x[a]
                },
                nonUserBorderRadius: {
                    borderRadius: w[a]
                },
                thumbnailItemContainer: {
                    display: "flex",
                    alignItems: "center"
                },
                thumbnailBackground: {
                    background: e.palette.surface[200]
                },
                itemText: {
                    whiteSpace: "nowrap",
                    "& > *:not(:last-child)": {
                        paddingBottom: 4
                    }
                },
                mutedText: {
                    color: e.palette.content.muted
                },
                disabledThumbnail: {
                    filter: "grayscale(100%)"
                },
                textContainer: {
                    display: "block",
                    whiteSpace: "nowrap",
                    overflow: "hidden",
                    textOverflow: "ellipsis",
                    "& > *:not(:first-child)": {
                        display: "block",
                        whiteSpace: "nowrap",
                        overflow: "hidden",
                        textOverflow: "ellipsis"
                    }
                }
            }
        });
    e.s(["f", 0, e => {
        let s, {
                target: y,
                targetType: x,
                displayNameOverride: w,
                adornment: A,
                label: S,
                disabled: C,
                variant: T = "medium",
                disableLink: D = !1,
                obfuscate: E = !1,
                hideThumbnail: k = !1,
                hideSecondaryLabel: P = !1,
                textVariant: M = "primary",
                labelTooltip: L,
                secondaryLabelClassName: G
            } = e,
            {
                classes: {
                    container: N,
                    avatarContainer: F,
                    thumbnailItemContainer: j,
                    thumbnailBackground: U,
                    userBorderRadius: V,
                    nonUserBorderRadius: R,
                    itemText: _,
                    mutedText: B,
                    disabledThumbnail: O,
                    textContainer: H
                },
                cx: K
            } = I({
                variant: T
            }),
            {
                translate: z
            } = (0, i.A)(),
            q = (0, a.useMemo)(() => x === p.f.User ? n.V.avatarHeadshot : x === p.f.Group ? n.V.groupIcon : "Ugc" === x ? n.V.assetThumbnail : n.V.universeThumbnail, [x]),
            Q = (0, a.useMemo)(() => {
                if (!D && y.id && !E) {
                    if (x === p.f.User) return g.f.getUserUrl(y.id);
                    if (x === p.f.Group) return v.f.getGroupUrl(y.id);
                    if ("Experience" === x) {
                        let e = "rootPlaceId" in y ? y.rootPlaceId : void 0;
                        return e ? h.f.getGameDetailsUrl(e) : void 0
                    }
                    if ("Ugc" === x) return f.f.getCatalogUrl(y.id)
                }
            }, [D, y, E, x]);
        w ? s = w : x === p.f.User ? s = "displayName" in y ? y.displayName : void 0 : "Ugc" !== x && (s = "name" in y ? y.name : void 0);
        let W = !w && (x === p.f.User && !("displayName" in y && y.displayName) || "Ugc" === x),
            Y = (0, a.useMemo)(() => {
                let e;
                return (0, t.jsxs)(l.f, {
                    container: !0,
                    direction: "row",
                    alignItems: "center",
                    wrap: "wrap",
                    children: [W ? (0, t.jsx)(d.f, {
                        animate: !0,
                        variant: "text",
                        width: 192,
                        height: 22
                    }) : (0, t.jsxs)(l.f, {
                        container: !0,
                        direction: "row",
                        alignItems: "center",
                        wrap: "wrap",
                        columnGap: 1,
                        children: [(0, t.jsx)(r.f, {
                            className: H,
                            variant: "secondary" === M ? "body1" : "compact" === T ? "captionHeader" : "large" === T ? "h2" : "h5",
                            color: C ? "disabled" : "inherit",
                            children: E ? z("Label.Other") : s
                        }), S && S.length > 0 && (0, t.jsx)(m.f, {
                            arrow: !0,
                            title: L,
                            placement: "right",
                            enterTouchDelay: 0,
                            leaveTouchDelay: 3e3,
                            children: (0, t.jsx)(u.f, {
                                color: "secondary",
                                label: S,
                                size: "small",
                                variant: "filled"
                            })
                        })]
                    }), !P && (0, t.jsxs)(t.Fragment, {
                        children: [x === p.f.User && (0, t.jsx)(t.Fragment, {
                            children: "name" in y && !y.name ? (0, t.jsx)(d.f, {
                                animate: !0,
                                variant: "text",
                                width: 192,
                                height: 20
                            }) : (0, t.jsx)(r.f, {
                                variant: "secondary" === M ? "body2" : "captionBody",
                                className: K(H, {
                                    [B]: void 0 === G && ("secondary" === M || "compact" === T)
                                }),
                                color: C ? "disabled" : "inherit",
                                children: (e = E ? z("Label.Other") : "@".concat("name" in y ? y.name : ""), G ? (0, t.jsx)("span", {
                                    className: G,
                                    children: e
                                }) : e)
                            })
                        }), (x === p.f.Group || "Experience" === x) && (0, t.jsx)(r.f, {
                            variant: "captionBody",
                            className: K(H, {
                                [B]: void 0 === G && ("secondary" === M || "compact" === T)
                            }),
                            color: C ? "disabled" : "inherit",
                            children: G ? (0, t.jsx)("span", {
                                className: G,
                                children: E ? z("Label.Other") : y.id
                            }) : E ? z("Label.Other") : y.id
                        })]
                    })]
                })
            }, [W, s, x, y, H, C, E, z, S, P, K, B, M, T, L, G]);
        return (0, t.jsx)(l.f, {
            container: !0,
            direction: "row",
            alignItems: "center",
            wrap: "nowrap",
            justifyContent: "space-between",
            className: N,
            children: (null == y ? void 0 : y.id) === void 0 ? (0, t.jsx)(d.f, {
                animate: !0,
                variant: "rectangular",
                width: "100%",
                height: b[T]
            }) : (0, t.jsxs)(t.Fragment, {
                children: [(0, t.jsxs)(l.f, {
                    container: !0,
                    wrap: "nowrap",
                    children: [!k && (0, t.jsx)(l.f, {
                        item: !0,
                        className: j,
                        children: (0, t.jsx)(o.f, {
                            variant: "rounded",
                            alt: "avatar",
                            className: K(F, {
                                [V]: x === p.f.User,
                                [R]: x !== p.f.User,
                                [O]: C
                            }),
                            children: (0, t.jsx)(n.x, {
                                targetId: y.id,
                                type: q,
                                imgClassName: U,
                                alt: "thumbnail",
                                returnPolicy: n.X.PlaceHolder,
                                includeBackground: !1
                            })
                        })
                    }), (0, t.jsx)(l.f, {
                        container: !0,
                        direction: "column",
                        className: N,
                        children: (0, t.jsx)(l.f, {
                            item: !0,
                            children: D || E ? Y : (0, t.jsx)(c.f, {
                                href: Q,
                                className: _,
                                color: "inherit",
                                children: Y
                            })
                        })
                    })]
                }), A]
            })
        })
    }])
}, 227700, e => {
    "use strict";
    var t = e.i(60373);
    e.s(["f", () => t.f])
}, 384586, e => {
    "use strict";
    var t = e.i(191685);
    e.s(["f", 0, t])
}, 562506, e => {
    "use strict";
    var t = e.i(191685);
    e.s(["f", 0, t])
}, 890246, e => {
    "use strict";
    var t = e.i(191685);
    e.s(["f", 0, t])
}, 805499, e => {
    "use strict";
    var t = e.i(191685);
    e.s(["f", 0, t])
}, 211388, e => {
    "use strict";
    var t = e.i(336964);
    let a = t.w.close;
    e.s(["r", 0, a, "G", 0, e => {
        if ("content" in e) t.w.open(e.content, e.options);
        else {
            var a;
            t.w.open({
                Component: e.component,
                props: null != (a = e.props) ? a : {}
            }, e.options)
        }
    }])
}, 83560, e => {
    "use strict";
    var t = e.i(209534);
    let a = t.f.enqueue;
    e.s(["c", 0, a, "J", 0, function() {
        return {
            enqueue: t.f.enqueue
        }
    }])
}, 125677, 20227, e => {
    "use strict";
    var t = e.i(643766);
    e.s(["f", 0, function(e, a) {
        let {
            page: i,
            rowsPerPage: n,
            hasNextPage: r,
            fetchNextPage: l,
            fetchLimit: s = n
        } = a, o = (0, t.useMemo)(() => {
            let t = i * n;
            return e.slice(t, t + n)
        }, [e, i, n]), c = (i + 1) * s >= e.length;
        return (0, t.useEffect)(() => {
            c && r && (null == l || l())
        }, [c, r, l]), {
            currentPage: o
        }
    }], 125677), e.s(["f", 0, function(e) {
        let {
            count: a,
            initialRowsPerPage: i = 50,
            resetKey: n
        } = e, [r, l] = (0, t.useState)(0), [s, o] = (0, t.useState)(i), [c, d] = (0, t.useState)(n);
        n !== c && (d(n), l(0));
        let u = Math.max(0, Math.ceil(a / s) - 1),
            m = Math.min(r, u);
        return {
            page: m,
            rowsPerPage: s,
            onPageChange: (0, t.useCallback)((e, t) => {
                l(Math.max(0, Math.min(t, u)))
            }, [u]),
            onRowsPerPageChange: (0, t.useCallback)(e => {
                o("number" == typeof e ? e : parseInt(e.target.value, 10)), l(0)
            }, [])
        }
    }], 20227)
}, 134817, e => {
    "use strict";
    var t = e.i(643766);
    e.s(["f", 0, function(e) {
        let {
            hasNextPage: a,
            fetchNextPage: i,
            disabled: n,
            intervalMs: r = 1e3
        } = e, l = (0, t.useRef)(i);
        l.current = i, (0, t.useEffect)(() => {
            if (!a || n) return;
            l.current();
            let e = setInterval(() => {
                l.current()
            }, r);
            return () => clearInterval(e)
        }, [a, n, r])
    }])
}, 85057, e => {
    "use strict";
    var t = e.i(785517),
        a = e.i(602635),
        i = e.i(79187),
        n = e.i(47277),
        r = e.i(870999),
        l = e.i(67243),
        s = e.i(563947);
    let o = (0, l.f)()(e => ({
            container: {
                display: "flex",
                flexDirection: "column",
                gap: 8
            },
            headerContainer: {
                display: "flex",
                flexDirection: "row",
                alignItems: "center",
                minWidth: 0
            },
            header: {
                display: "flex",
                alignItems: "center",
                flex: "1 1 auto",
                height: 40,
                minHeight: 40,
                paddingLeft: 12,
                minWidth: 0,
                overflow: "hidden",
                color: "var(--color-content-emphasis)",
                textOverflow: "ellipsis",
                whiteSpace: "nowrap",
                fontFamily: 'var(--Config-Text-Font, "Builder Sans")',
                fontSize: 16,
                fontStyle: "normal",
                fontWeight: 700,
                lineHeight: "140%"
            },
            headerText: {
                overflow: "hidden",
                textOverflow: "ellipsis",
                whiteSpace: "nowrap"
            },
            headerAction: {
                display: "flex",
                flexShrink: 0,
                alignItems: "center",
                marginLeft: "auto"
            },
            divider: {
                borderColor: e.palette.components.divider
            },
            icon: {
                height: 32,
                width: 32,
                minWidth: 32,
                minHeight: 32,
                flexShrink: 0,
                overflow: "hidden",
                borderRadius: 8,
                color: "var(--color-content-emphasis)",
                "& img, & canvas, & > *": {
                    width: "100%",
                    height: "100%",
                    maxWidth: "100%",
                    maxHeight: "100%",
                    objectFit: "cover",
                    display: "block"
                }
            }
        })),
        c = e => {
            var i;
            let {
                item: n,
                isTopLevel: r = !1
            } = e;
            return (0, t.jsx)(a.q, {
                label: n.label,
                nodeId: n.key,
                href: n.href,
                adornment: n.adornment,
                variant: r ? "smallLabel2" : "smallLabel1",
                onClick: n.onClick,
                children: null == (i = n.subItems) ? void 0 : i.map(e => (0, t.jsx)(c, {
                    item: e
                }, e.key))
            })
        };
    e.s(["f", 0, e => {
        let {
            header: l,
            items: d,
            icon: u,
            activeKey: m,
            defaultExpanded: p,
            headerAction: f
        } = e, {
            classes: h
        } = o(), {
            ready: v
        } = (0, i.A)();
        return v ? (0, t.jsxs)(r.f, {
            classes: {
                root: h.container
            },
            children: [l && (0, t.jsxs)(t.Fragment, {
                children: [(0, t.jsxs)(r.f, {
                    classes: {
                        root: h.headerContainer
                    },
                    children: [u && (0, t.jsx)(r.f, {
                        classes: {
                            root: h.icon
                        },
                        children: u
                    }), (0, t.jsx)(n.f, {
                        variant: "largeLabel2",
                        classes: {
                            root: h.header
                        },
                        children: (0, t.jsx)("span", {
                            className: h.headerText,
                            children: l
                        })
                    }), f && (0, t.jsx)(r.f, {
                        classes: {
                            root: h.headerAction
                        },
                        children: f
                    })]
                }), (0, t.jsx)(s.f, {
                    classes: {
                        root: h.divider
                    }
                })]
            }), d.length > 0 && (0, t.jsx)(a.K, {
                selected: m,
                defaultExpanded: p,
                children: d.map(e => (0, t.jsx)(c, {
                    item: e,
                    isTopLevel: !0
                }, e.key))
            })]
        }) : null
    }])
}, 373736, e => {
    "use strict";
    var t = e.i(785517),
        a = e.i(609305),
        i = e.i(41242),
        n = e.i(79187),
        r = e.i(47277);
    e.s(["f", 0, e => {
        let {
            open: l,
            onOpenChange: s,
            onContinueWithId: o,
            onAddParent: c
        } = e, {
            translate: d
        } = (0, n.A)();
        return (0, t.jsx)(i.N, {
            open: l,
            onOpenChange: s,
            size: "Small",
            isModal: !0,
            hasCloseAffordance: !0,
            closeLabel: d("Action.Close"),
            children: (0, t.jsxs)(i.d, {
                children: [(0, t.jsxs)(i.K, {
                    className: "flex flex-col gap-medium",
                    children: [(0, t.jsx)(i.F, {
                        className: "text-heading-medium margin-y-none",
                        children: d("Label.IdVerification")
                    }), (0, t.jsx)(r.f, {
                        className: "text-body-medium",
                        children: d("Description.IdVerifiedDialog")
                    }), (0, t.jsx)(r.f, {
                        className: "text-body-medium",
                        children: d("Description.IdVerifiedDialogReverify")
                    })]
                }), (0, t.jsxs)(i.c, {
                    className: "flex flex-col gap-xsmall",
                    children: [(0, t.jsx)(a.f, {
                        variant: "Emphasis",
                        className: "fill",
                        onClick: o,
                        children: d("Action.ContinueWithId")
                    }), (0, t.jsx)(a.f, {
                        variant: "Standard",
                        className: "fill",
                        onClick: c,
                        children: d("Action.AddAParent")
                    })]
                })]
            })
        })
    }])
}, 917852, e => {
    "use strict";
    e.s(["W", 0, "https://".concat("roblox.com", "/my/account?ageVerification#!/info"), "Y", 0, "https://".concat("roblox.com", "/my/account?idVerification#!/info"), "$", 0, "https://".concat("roblox.com", "/my/account?addParent#!/parental-controls"), "l", 0, "https://".concat("roblox.com", "/my/account#!/info"), "j", 0, "https://".concat("roblox.com", "/my/account#!/security")])
}, 576069, e => {
    "use strict";
    var t = e.i(910272),
        a = e.i(814975),
        i = e.i(605050);
    let n = ["creatorEligibility"];
    e.s(["r", 0, n, "C", 0, function() {
        let {
            overrideUserId: e,
            isReady: r = !0,
            refetchInterval: l = !1
        } = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {}, {
            user: s
        } = (0, a.f)(), o = null == s ? void 0 : s.id, c = null != e ? e : o;
        return (0, t.f)({
            queryKey: [...n, null != c ? c : null],
            queryFn: async () => i.f.coreContentGetCreatorEligibility({
                userId: c
            }),
            enabled: r && !!c,
            refetchInterval: l,
            refetchIntervalInBackground: !0
        })
    }])
}, 868505, e => {
    "use strict";
    var t = e.i(910272),
        a = e.i(814975),
        i = e.i(605050);
    e.s(["f", 0, function() {
        let {
            overrideUserId: e,
            isReady: n = !0
        } = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {}, {
            user: r
        } = (0, a.f)(), l = null == r ? void 0 : r.id, s = null != e ? e : l;
        return (0, t.f)({
            queryKey: ["publishPermissions", null != s ? s : null],
            queryFn: async () => i.f.coreContentGetCreatorPublishPermissions({
                userId: s
            }),
            enabled: n && !!s
        })
    }])
}, 561098, e => {
    "use strict";
    var t = e.i(396875),
        a = e.i(917852);
    let i = {
            [t.T.Private]: "Label.TierStarter",
            [t.T.Trusted]: "Label.TierCommunity",
            [t.T.Everyone]: "Label.TierProfessional"
        },
        n = {
            [t.T.Private]: "Description.TierStarter",
            [t.T.Trusted]: "Description.TierCommunity",
            [t.T.Everyone]: "Description.TierProfessional"
        },
        r = {
            [t.T.Private]: "Label.TierVietnamLocal",
            [t.T.Trusted]: "Label.TierWorldwideTrusted",
            [t.T.Everyone]: "Label.TierWorldwideAllAges"
        },
        l = {
            [t.T.Private]: "Description.TierContentMaturity",
            [t.T.Trusted]: "Description.TierContentMaturity",
            [t.T.Everyone]: "Description.TierContentMaturity"
        },
        s = {
            [t.T.Trusted]: "Message.ApprovedForTrustedFriends",
            [t.T.Everyone]: "Message.ApprovedForAllAges"
        },
        o = e => e === t.T.Private || e === t.T.Trusted || e === t.T.Everyone;
    e.s(["l", 0, (e, t) => e.tierRequirements.some(e => e.tier === t && e.isRequired), "D", 0, e => {
        let c = "VN" === e.countryCode,
            d = new Set(e.notices.map(e => e.key)),
            u = d.has(t.V.CurrentTierAllowlisted),
            m = e.requirements.flatMap(i => {
                let n = ((e, i, n) => {
                    if ("VN" === n) {
                        if (e === t._.PhoneVerified) return {
                            labelKey: "Label.PhoneVerification",
                            descriptionKey: "Description.PhoneVerification",
                            actionUrl: a.l
                        };
                        if (e === t._.IdVerified) return {
                            labelKey: "Label.IdVerification",
                            descriptionKey: "Description.IdVerificationGovtIdOrParental",
                            actionUrl: a.Y
                        }
                    }
                    return e === t._.ModerationStatusOk ? {
                        labelKey: "Label.AccountInGoodStanding",
                        descriptionKey: "Description.AccountInGoodStanding"
                    } : e === t._.IdVerified ? i === t.D.Under13 ? {
                        labelKey: "Label.U13IdVerification",
                        descriptionKey: "Description.U13IdVerification",
                        actionUrl: a.$
                    } : i === t.D.Between13And18 ? {
                        labelKey: "Label.IdVerification",
                        descriptionKey: "Description.B13To18IdVerification"
                    } : {
                        labelKey: "Label.IdVerification",
                        descriptionKey: "Description.IdVerification",
                        actionUrl: a.Y
                    } : e === t._.AgeEstimationVerified ? {
                        labelKey: "Label.AgeCheck",
                        descriptionKey: "Description.AgeCheck",
                        actionUrl: a.W
                    } : e === t._.Has2SvEnabled ? {
                        labelKey: "Label.TwoStepVerification",
                        descriptionKey: "Description.TwoStepVerification",
                        actionUrl: a.j
                    } : void 0
                })(i.id, e.ageBracket, e.countryCode);
                return n ? [{
                    ...i,
                    labelKey: n.labelKey,
                    descriptionKey: n.descriptionKey,
                    actionUrl: n.actionUrl
                }] : []
            });
        return {
            currentTier: e.currentTier,
            ageBracket: e.ageBracket,
            tierOrder: e.tierOrder.filter(o),
            tierLabelKeys: c ? r : i,
            tierDescriptionKeys: c ? l : n,
            requirements: m,
            approvalBannerKey: u ? s[e.currentTier] : void 0,
            showPlusEligibilityBanner: d.has(t.V.PlusEligibility),
            showParentLinkExpirationBanner: d.has(t.V.ParentLinkExpiration),
            noticeKeys: d
        }
    }], 561098)
}, 57798, e => {
    "use strict";
    var t = e.i(785517),
        a = e.i(643766),
        i = e.i(396875),
        n = e.i(177610),
        r = e.i(79187),
        l = e.i(533414),
        s = e.i(814975),
        o = e.i(881670),
        c = e.i(868505),
        d = e.i(561098);
    let u = e => e === i.V.PlusGrantEndingSoon || e === i.V.PlusGrantGracePeriod || e === i.V.PlusGrantExpired,
        m = e => {
            let {
                phase: a,
                onDismiss: l
            } = e, {
                translateWithNamespace: s
            } = (0, r.A)(), c = {
                [i.V.PlusGrantEndingSoon]: s(o.f.Home, "Description.PlusGrantLapseEnds"),
                [i.V.PlusGrantGracePeriod]: s(o.f.Home, "Description.PlusGrantLapseGrace"),
                [i.V.PlusGrantExpired]: s(o.f.Home, "Description.PlusGrantLapseEnded")
            } [a];
            return (0, t.jsx)(n.f, {
                variant: "Feedback",
                severity: a === i.V.PlusGrantExpired ? "Warning" : "Info",
                primaryActionLabel: s(o.f.Home, "Action.GetPlus"),
                primaryActionHref: a === i.V.PlusGrantEndingSoon ? "https://devforum.roblox.com/t/introducing-roblox-plus/4567894" : "https://".concat("roblox.com", "/plus"),
                closeLabel: s(o.f.Creations, "Action.Dismiss"),
                onDismiss: l,
                children: (0, t.jsx)("span", {
                    children: c
                })
            })
        },
        p = e => {
            var i;
            let {
                phase: n
            } = e, {
                user: r
            } = (0, s.f)(), [o, c] = (0, l.j)("plusGrantLapseBanner.".concat(n, ".").concat(null != (i = null == r ? void 0 : r.id) ? i : "anonymous"), !1), d = (0, a.useCallback)(() => c(!0), [c]);
            return o ? null : (0, t.jsx)("div", {
                className: "margin-bottom-[var(--gap-large)]",
                children: (0, t.jsx)(m, {
                    phase: n,
                    onDismiss: d
                })
            })
        },
        f = (0, r.K)(() => {
            let {
                data: e,
                isPending: a,
                isError: i
            } = (0, c.f)();
            if (a || i || !e) return null;
            let {
                noticeKeys: n
            } = (0, d.D)(e), r = [...n].find(u);
            return r ? (0, t.jsx)(p, {
                phase: r
            }, r) : null
        }, [o.f.Home, o.f.Creations]);
    e.s(["f", 0, f])
}, 845592, 448005, e => {
    "use strict";
    var t, a = e.i(785517),
        i = e.i(643766),
        n = e.i(445550),
        r = ((t = {}).FrontendFlagEnableNonPluginDistributionRestrictions = "PublicFrontendMDR", t.FrontendFlagEnableModelPricingTransition = "PublicFrontendEMPT", t.FrontendFlagEnableSocialLinkCustomTitles = "PublicFrontendSLCT", t.FrontendFlagEnableAudioWavUpload = "PublicFrontendAWU", t.FrontendFlagEnableAudioFlacUpload = "PublicFrontendAFU", t.FrontendFlagEnableCreatorInsightsPage = "PublicFrontendCIP", t.FrontendFlagEnableTryAssetSocialLink = "PublicFrontendETIR", t.FrontendFlagEnableTryAssetDefaultExperience = "PublicFrontendETADE", t.FrontendFlagEnablePaidModelDependenciesModal = "PublicFrontendPMDM", t.FrontendFlagTaxonomyExperiment = "PublicFrontendTE", t.FrontendFlagUniverseBansManagerLabelUpdate = "PublicFrontendUBMLU", t.FrontendFlagEnableHiddenFromSearchVisibilityAlert = "PublicFrontendHFS", t);
    let l = Object.values(r),
        s = (e => {
            let t = {};
            for (let a of l) t[a] = e(a);
            if (!l.every(e => Object.hasOwn(t, e))) throw Error("Failed to build frontend flags.");
            return t
        })(() => !1);
    e.s(["o", 0, s, "m", 0, l, "Q", () => r], 448005);
    let o = (0, i.createContext)(null);
    e.s(["U", 0, e => {
        let {
            children: t
        } = e, [r, c] = (0, i.useState)(s), [d, u] = (0, i.useState)(!1), m = (0, i.useCallback)(async e => {
            try {
                let t = await n.U.getFrontendFlagsValues(e),
                    a = Object.assign({}, ...l.map(e => {
                        var a, i;
                        return {
                            [e]: null != (a = null == t || null == (i = t.data) ? void 0 : i[e]) && a
                        }
                    }));
                c(a)
            } catch (e) {}
        }, []);
        (0, i.useEffect)(() => {
            let e = !0,
                t = {
                    flags: [...l]
                };
            return u(!0), (async () => {
                await m(t), e && u(!1)
            })(), () => {
                e = !1
            }
        }, [m]);
        let p = (0, i.useMemo)(() => ({
            frontendFlags: r,
            getFrontendFlags: m,
            loadingFrontendFlags: d
        }), [r, m, d]);
        return (0, a.jsx)(o.Provider, {
            value: p,
            children: t
        })
    }, "L", 0, function() {
        let e = (0, i.useContext)(o);
        if (null === e) throw Error("useToolboxServiceApiProvider must be used within a ToolboxServiceApiProvider");
        return e
    }], 845592)
}, 796266, e => {
    "use strict";
    var t = e.i(643766),
        a = e.i(341260),
        i = e.i(745873);
    let n = e => {
        let t = Array.isArray(e) ? e[0] : e;
        if (!t) return null;
        let a = Number(t);
        return Number.isInteger(a) && a > 0 ? a : null
    };
    e.s(["f", 0, function() {
        let e = (0, a.useRouter)(),
            {
                groups: r,
                isFetched: l,
                currentGroup: s,
                setCurrentGroup: o
            } = (0, i._)(),
            c = (0, t.useRef)(!1),
            d = (0, t.useRef)(!1),
            u = (0, t.useMemo)(() => {
                if (!e.isReady) return null;
                let t = n(e.query.groupId),
                    a = n(e.query.userId);
                return null !== t && null !== a ? null : null !== a ? {
                    kind: "user"
                } : null !== t ? {
                    kind: "group",
                    id: t
                } : null
            }, [e.isReady, e.query.groupId, e.query.userId]),
            m = (null == u ? void 0 : u.kind) === "group" && (null != r ? r : []).some(e => {
                let {
                    id: t
                } = e;
                return t === u.id
            });
        (0, t.useEffect)(() => {
            !c.current && null !== u && l && (c.current = !0, "user" === u.kind ? null !== s && o(null) : m && (null == s ? void 0 : s.id) !== u.id && o(u.id))
        }, [u, l, m, s, o]);
        let p = !e.isReady;
        return p || null === u || (p = "group" === u.kind ? !l || m && (null == s ? void 0 : s.id) !== u.id : !l || null !== s), (0, t.useEffect)(() => {
            if (d.current || !e.isReady || p || void 0 === e.query.groupId && void 0 === e.query.userId) return;
            d.current = !0;
            let t = {
                ...e.query
            };
            delete t.groupId, delete t.userId, e.replace({
                query: t
            }, void 0, {
                shallow: !0
            })
        }, [e, p]), {
            isResolving: p
        }
    }])
}]);

//# debugId=b9ef2f28-3c45-7d55-df2d-a3186d70524b
//# sourceMappingURL=03vo_cwu54y9_.js.map
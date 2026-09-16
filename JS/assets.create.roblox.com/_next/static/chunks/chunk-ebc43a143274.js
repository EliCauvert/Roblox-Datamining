;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "15dd4b1b-bcc3-803f-3b55-90b9c64b3656")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 614761, e => {
    "use strict";
    let t, a, l;
    var n = e.i(721281),
        r = e.i(416340),
        i = e.i(79187),
        s = e.i(237401),
        o = e.i(706442),
        u = e.i(199834),
        d = e.i(982234),
        c = e.i(417410),
        m = e.i(565907),
        f = e.i(935606),
        p = e.i(169722),
        g = e.i(54369),
        y = e.i(728397),
        E = e.i(235684),
        v = e.i(854705),
        b = e.i(44161),
        h = e.i(734306),
        x = e.i(731693),
        S = e.i(835163),
        T = e.i(529390),
        C = e.i(397810),
        w = e.i(872204),
        N = e.i(291037),
        I = e.i(899819),
        A = e.i(777004),
        k = e.i(186214),
        R = e.i(35298),
        M = e.i(904090),
        D = e.i(242788),
        L = e.i(196945),
        _ = e.i(423107),
        O = e.i(514455),
        B = e.i(35159),
        q = e.i(523943),
        P = e.i(438295),
        F = e.i(257115),
        U = e.i(973336),
        G = e.i(649319),
        Q = e.i(208215),
        z = e.i(464782),
        H = e.i(620068),
        V = e.i(431346),
        W = e.i(795621),
        j = e.i(157310),
        K = e.i(711367),
        Y = e.i(182012),
        X = e.i(260022),
        J = e.i(616420),
        $ = e.i(782262),
        Z = e.i(197649),
        ee = e.i(170702);
    let et = (0, r.createContext)({
            size: "Medium",
            variant: "Contained",
            fitBehavior: "Fill"
        }),
        ea = {
            XSmall: ["text-label-small", "height-700"],
            Small: ["text-label-small", "height-800"],
            Medium: ["text-label-medium", "height-1000"],
            Large: ["text-label-medium", "height-1200"]
        },
        el = {
            XSmall: "padding-x-small",
            Small: "padding-x-small",
            Medium: "padding-x-medium",
            Large: "padding-x-large"
        },
        en = {
            XSmall: {
                Inlined: "",
                Contained: "padding-top-small"
            },
            Small: {
                Inlined: "",
                Contained: "padding-top-small"
            },
            Medium: {
                Inlined: "padding-top-xsmall",
                Contained: "padding-top-medium"
            },
            Large: {
                Inlined: "padding-top-xsmall",
                Contained: "padding-top-xlarge"
            }
        },
        er = {
            XSmall: "padding-bottom-small",
            Small: "padding-bottom-small",
            Medium: "padding-bottom-medium",
            Large: "padding-bottom-xlarge"
        },
        ei = (0, r.forwardRef)((e, t) => {
            let {
                children: a,
                className: l,
                size: n,
                variant: i,
                fitBehavior: s,
                ...o
            } = e, u = (0, r.useMemo)(() => ({
                size: n || "Large",
                variant: i || "Contained",
                fitBehavior: s || "Fill"
            }), [n, i, s]);
            return r.default.createElement(et.Provider, {
                value: u
            }, r.default.createElement(ee.Root, {
                ref: t,
                ...o,
                className: (0, Z.default)("foundation-web-tabs", "flex flex-col", l)
            }, a))
        }),
        es = (0, r.forwardRef)((e, t) => {
            let {
                children: a,
                className: l,
                ...n
            } = e, {
                fitBehavior: i
            } = (0, r.useContext)(et), s = (0, r.useRef)(null), [o, u] = (0, r.useState)({
                width: 0,
                left: 0,
                opacity: 0
            }), d = r.default.useCallback(e => {
                s.current = e, "function" == typeof t ? t(e) : t && "current" in t && (t.current = e)
            }, [t]);
            return (0, r.useEffect)(() => {
                let e, t = () => {
                    let e = s.current;
                    if (!e) return;
                    let t = e.querySelector('[data-state="active"]');
                    if (t) {
                        let a = e.getBoundingClientRect(),
                            l = t.getBoundingClientRect();
                        u({
                            width: l.width,
                            left: l.left - a.left,
                            opacity: 1
                        })
                    }
                };
                t();
                let a = new MutationObserver(() => {
                        cancelAnimationFrame(e), e = requestAnimationFrame(t)
                    }),
                    l = "u" > typeof ResizeObserver ? new ResizeObserver(t) : null,
                    n = s.current;
                return n && (a.observe(n, {
                    subtree: !0,
                    attributes: !0,
                    attributeFilter: ["data-state"]
                }), null == l || l.observe(n)), window.addEventListener("resize", t), () => {
                    cancelAnimationFrame(e), a.disconnect(), null == l || l.disconnect(), window.removeEventListener("resize", t)
                }
            }, [a]), r.default.createElement("div", {
                className: (0, Z.default)("relative scroll-x", l),
                style: {
                    scrollbarWidth: "none",
                    msOverflowStyle: "none"
                }
            }, r.default.createElement(ee.List, {
                ref: d,
                ...n,
                className: (0, Z.default)("flex items-stretch bg-none border-0 stroke-none")
            }, a), "Fit" === i && r.default.createElement("div", {
                "aria-hidden": "true",
                className: "absolute bottom-[0px] left-[0px] right-[0px] height-[var(--stroke-thick)] bg-[var(--color-stroke-muted)] [z-index:0]"
            }), r.default.createElement("div", {
                className: "absolute bottom-[0px] bg-system-contrast transition-all duration-200 ease-standard-out",
                style: {
                    height: "var(--stroke-thick)",
                    zIndex: 1,
                    width: "".concat(o.width, "px"),
                    left: "".concat(o.left, "px"),
                    opacity: o.opacity
                }
            }))
        }),
        eo = (0, r.forwardRef)((e, t) => {
            let {
                children: a,
                className: l,
                isDisabled: n = !1,
                ...i
            } = e, {
                size: s,
                variant: o,
                fitBehavior: u
            } = (0, r.useContext)(et);
            return r.default.createElement(ee.Trigger, {
                ref: t,
                ...i,
                disabled: n,
                style: {
                    borderBottom: "var(--stroke-thick) solid var(--color-stroke-muted)",
                    borderTop: "none",
                    borderLeft: "none",
                    borderRight: "none"
                },
                className: (0, Z.default)("relative flex items-center justify-center cursor-pointer bg-none shrink-0", $.interactable, ea[s], "Fill" === u ? "grow-1 ".concat(el[s]) : "", en[s][o], er[s], n && "opacity-[0.5]", l)
            }, r.default.createElement($.StateLayer, null), r.default.createElement("div", {
                className: "flex items-center justify-center height-600 relative"
            }, a))
        }),
        eu = (0, r.forwardRef)((e, t) => {
            let {
                children: a,
                className: l,
                ...n
            } = e;
            return r.default.createElement(ee.Content, {
                ref: t,
                ...n,
                className: (0, Z.default)("padding-top-large", "outline-none", l)
            }, a)
        });
    var ed = e.i(656879),
        ec = e.i(836157);
    let em = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-600"
        },
        ef = {
            XSmall: "",
            Small: "",
            Medium: "",
            Large: "padding-y-xxsmall"
        },
        ep = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        eg = {
            XSmall: "",
            Small: "padding-top-xxsmall",
            Medium: "padding-top-xxsmall",
            Large: "padding-top-xxsmall"
        },
        ey = e => {
            let {
                label: t,
                className: a,
                isChecked: l,
                isDisabled: n,
                size: i,
                hint: s,
                placement: o,
                onCheckedChange: u,
                id: d,
                ...c
            } = e, m = (0, ed.default)(), f = d || m, p = t && r.default.createElement("label", {
                htmlFor: f,
                className: (0, Z.default)("flex flex-col grow-1 gap-xsmall", !n && "cursor-pointer")
            }, r.default.createElement("span", {
                className: (0, Z.default)(ep[i], eg[i], "content-emphasis")
            }, t), s && r.default.createElement("span", {
                className: "text-body-medium content-default"
            }, s));
            return r.default.createElement("div", {
                className: (0, Z.default)("foundation-web-checkbox flex gap-medium", n && "opacity-[0.5]", !n && "cursor-pointer", a)
            }, "End" === o && p, r.default.createElement("div", {
                className: (0, Z.default)(ef[i])
            }, r.default.createElement(ec.Root, {
                "data-slot": "checkbox",
                className: (0, Z.default)(em[i], $.interactable, !n && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
                id: f,
                checked: l,
                disabled: n,
                onCheckedChange: u,
                "aria-label": t,
                ...c
            }, r.default.createElement($.StateLayer, null), r.default.createElement(ec.Indicator, {
                "data-slot": "checkbox-indicator",
                className: (0, Z.default)(em[i], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
            }))), "Start" === o && p)
        };
    var eE = e.i(780087),
        ev = e.i(16537),
        eb = e.i(757432);
    let eh = "Medium",
        ex = "Start",
        eS = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-600"
        },
        eT = {
            XSmall: "size-150",
            Small: "size-200",
            Medium: "size-250",
            Large: "size-250"
        },
        eC = {
            XSmall: "gap-medium",
            Small: "gap-medium",
            Medium: "gap-medium",
            Large: "gap-large"
        },
        ew = {
            XSmall: "gap-medium",
            Small: "gap-large",
            Medium: "gap-large"
        },
        eN = {
            XSmall: "gap-small",
            Small: "gap-medium",
            Medium: "gap-medium"
        },
        eI = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-medium"
        },
        eA = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        ek = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        eR = (0, r.createContext)({
            size: eh,
            placement: ex
        }),
        eM = r.default.forwardRef((e, t) => {
            let {
                groupLabel: a,
                labelTooltip: l,
                size: n,
                placement: i,
                isDisabled: s,
                className: o,
                children: u,
                id: d,
                ...c
            } = e, m = (0, ed.default)(), f = d || m, p = null != n ? n : eh, g = null != i ? i : ex, y = (0, r.useMemo)(() => ({
                size: p,
                placement: g,
                disabled: null != s && s
            }), [p, g, s]), E = a ? r.default.createElement("label", {
                htmlFor: f,
                className: (0, Z.default)("foundation-web-radio-group-label", eI[p], "content-default", !l && "padding-bottom-small")
            }, a) : null, v = E && l ? r.default.createElement("div", {
                className: "flex items-center gap-xsmall padding-bottom-small"
            }, E, r.default.createElement(ev.LabelTooltip, l)) : E;
            return r.default.createElement(eR.Provider, {
                value: y
            }, r.default.createElement("div", {
                className: (0, Z.default)("flex fill flex-col", ew[p])
            }, v, r.default.createElement(eb.RadioGroup, {
                ref: t,
                id: f,
                className: (0, Z.default)("foundation-web-radio-group", "flex flex-col", eN[p], o),
                ...c
            }, u)))
        });
    eM.displayName = "RadioGroup";
    let eD = r.default.forwardRef((e, t) => {
        let {
            className: a,
            value: l,
            isDisabled: n,
            label: i,
            "aria-label": s,
            "aria-labelledby": o,
            hint: u,
            id: d,
            size: c,
            placement: m,
            ...f
        } = e, p = (0, r.useRef)(null), g = (0, r.useRef)(null), [y, E] = (0, r.useState)(!1), {
            size: v,
            placement: b,
            disabled: h
        } = (() => {
            let e = (0, r.useContext)(eR);
            if (!e) throw Error("Radio must be used within a RadioGroup");
            return e
        })(), x = null != c ? c : v, S = null != m ? m : b, T = (0, ed.default)(), C = d || T, w = void 0 !== i && "" !== i, N = "".concat(C, "Label"), I = w ? N : o, A = !!u, k = n || h;
        return (0, r.useEffect)(() => {
            let e = new ResizeObserver(() => {
                let e = p.current,
                    t = g.current,
                    a = e => {
                        if (!e) return !1;
                        let t = parseFloat(getComputedStyle(e).lineHeight);
                        return Math.round(e.scrollHeight / t) > 1
                    };
                E(a(e) || a(t))
            });
            return p.current && e.observe(p.current), g.current && e.observe(g.current), () => e.disconnect()
        }, [A, w]), r.default.createElement("div", {
            className: (0, Z.default)("flex gap-medium", {
                [eE.disabledOpacity]: k,
                "cursor-pointer": !k,
                "flex-row": "Start" === S,
                "flex-row-reverse": "End" === S
            })
        }, r.default.createElement(eb.RadioGroupItem, {
            ref: t,
            className: (0, Z.default)("foundation-web-radio", $.interactable, !k && "cursor-pointer", "padding-none shrink-0 grow-0 basis-auto flex items-center justify-center bg-none data-[state=checked]:bg-action-sub-emphasis radius-circle stroke-contrast-alpha stroke-standard", eC[x], eS[x], a),
            disabled: k,
            value: l,
            id: C,
            "aria-describedby": A ? "".concat(C, "Hint") : void 0,
            "aria-label": s,
            "aria-labelledby": I,
            ...f
        }, r.default.createElement($.StateLayer, null), r.default.createElement(eb.RadioGroupIndicator, {
            className: (0, Z.default)("radius-circle bg-inverse-action-sub-emphasis", eT[x])
        })), r.default.createElement("div", {
            className: (0, Z.default)("flex fill flex-col width-full", {
                "gap-xsmall": y,
                "gap-none": !y,
                "padding-top-xxsmall": "XSmall" !== x
            })
        }, w && r.default.createElement("label", {
            ref: p,
            id: N,
            htmlFor: C,
            "aria-describedby": A ? "".concat(C, "Hint") : void 0,
            className: (0, Z.default)(eA[x], "content-emphasis", !k && "cursor-pointer")
        }, i), A && r.default.createElement("div", {
            ref: g,
            id: "".concat(C, "Hint"),
            className: (0, Z.default)(ek[x], "content-default")
        }, u)))
    });
    eD.displayName = "Radio";
    var eL = e.i(874286);
    let e_ = {
            Medium: {
                width: "30px",
                height: "30px"
            },
            Small: {
                width: "24px",
                height: "24px"
            },
            XSmall: {
                width: "24px",
                height: "24px"
            }
        },
        eO = {
            inset: "16.67%"
        },
        eB = {
            Medium: "gap-small",
            Small: "gap-small",
            XSmall: "gap-xsmall"
        },
        eq = {
            Medium: "padding-y-medium",
            Small: "padding-y-small",
            XSmall: "padding-y-xsmall"
        },
        eP = {
            Medium: "text-title-medium",
            Small: "text-title-small",
            XSmall: "text-title-small"
        },
        eF = {
            Medium: "text-body-medium",
            Small: "text-body-small",
            XSmall: "text-body-small"
        },
        eU = {
            Medium: "text-body-medium",
            Small: "text-body-small",
            XSmall: "text-body-small"
        },
        eG = {
            Medium: "text-label-medium",
            Small: "text-label-small",
            XSmall: "text-caption-small"
        },
        eQ = {
            Medium: "text-body-medium",
            Small: "text-body-small",
            XSmall: "text-caption-small"
        },
        ez = {
            Medium: "Medium",
            Small: "Small",
            XSmall: "Small"
        },
        eH = e => {
            let {
                steps: t,
                currentStepIndex: a = 0,
                size: l = "Medium",
                borderPosition: n = "Bottom",
                isCompact: i,
                showDescription: s = !0,
                className: o,
                "aria-label": u
            } = e, d = (0, r.useRef)(null), c = (0, r.useRef)([]), m = t.length, f = a >= m, p = m <= 0 || a < 0 ? 0 : a >= m ? m - 1 : a;
            if ((0, r.useLayoutEffect)(() => {
                    if (0 === m || i) return;
                    let e = c.current[p];
                    e && e.scrollIntoView({
                        behavior: "smooth",
                        inline: "center",
                        block: "nearest",
                        container: "nearest"
                    })
                }, [i, p, m]), 0 === m) return null;
            let g = t.map((e, t) => {
                let a;
                return a = e.state ? e.state : f || t < p ? "complete" : t === p ? "current" : "upcoming", {
                    ...e,
                    state: a
                }
            });
            if (c.current.length = m, i) {
                let e = g[p],
                    t = null != u ? u : "Step ".concat(p + 1, " of ").concat(m).concat((null == e ? void 0 : e.label) ? ": ".concat(e.label) : "");
                return r.default.createElement("div", {
                    key: "compact",
                    className: (0, Z.default)("flex items-center gap-xsmall", eG[l], "content-default", o),
                    role: "status",
                    "aria-live": "polite",
                    "aria-label": t
                }, r.default.createElement("span", {
                    className: "content-default"
                }, "Step"), r.default.createElement("div", {
                    className: "flex items-center gap-xxsmall content-default"
                }, r.default.createElement("span", null, p + 1), r.default.createElement("span", null, "/"), r.default.createElement("span", null, m)), s && (null == e ? void 0 : e.description) && r.default.createElement("span", {
                    className: (0, Z.default)(eQ[l], "content-muted text-truncate-end")
                }, e.description))
            }
            return r.default.createElement("div", {
                key: "full",
                ref: d,
                className: (0, Z.default)("flex width-full items-stretch scroll-x no-wrap", o),
                style: {
                    scrollbarWidth: "none",
                    msOverflowStyle: "none"
                },
                role: "list",
                "aria-label": u
            }, g.map((e, t) => {
                var a, i;
                let s, o, u = e.state,
                    d = "disabled" === u,
                    f = "current" === u,
                    p = ((e, t, a) => {
                        let l = "Top" === e ? "top left" : "bottom left",
                            n = "var(--stroke-standard)",
                            r = "var(--color-stroke-default)",
                            i = "linear-gradient(".concat(r, ", ").concat(r, ")");
                        if ("current" !== t) return {
                            backgroundImage: i,
                            backgroundRepeat: "no-repeat",
                            backgroundSize: "100% ".concat(n),
                            backgroundPosition: l
                        };
                        let s = "var(--fui-future-alpha-color-system-progress)";
                        return {
                            backgroundImage: "linear-gradient(".concat(s, ", ").concat(s, "), ").concat(i),
                            backgroundRepeat: "no-repeat",
                            backgroundSize: "100% ".concat("XSmall" === a ? "var(--stroke-thick)" : "var(--stroke-thicker)", ", 100% ").concat(n),
                            backgroundPosition: "".concat(l, ", ").concat(l)
                        }
                    })(n, u, l),
                    g = "".concat(t + 1, " of ").concat(m, ": ").concat(e.label).concat(e.description ? " - ".concat(e.description) : "").concat(d ? " (disabled)" : ""),
                    y = null != (a = e.id) ? a : "".concat(t, "-").concat(e.label, "-").concat(null != (i = e.description) ? i : "step");
                return r.default.createElement("div", {
                    key: y,
                    ref: e => {
                        c.current[t] = e
                    },
                    role: "listitem",
                    "aria-current": f ? "step" : void 0,
                    "aria-setsize": m,
                    "aria-posinset": t + 1,
                    "aria-label": g,
                    className: (0, Z.default)("flex grow items-center", eB[l], eq[l], "stroke-default", {
                        [eE.disabledOpacity]: d
                    }),
                    style: p
                }, (s = "relative shrink-0", o = "absolute radius-circle flex items-center justify-center", "complete" === u ? r.default.createElement("div", {
                    className: s,
                    style: e_[l]
                }, r.default.createElement("div", {
                    className: (0, Z.default)(o, "bg-system-contrast"),
                    style: eO
                }, r.default.createElement(eL.Icon, {
                    name: "icon-filled-check",
                    size: ez[l],
                    className: "content-inverse-emphasis"
                }))) : "current" === u ? r.default.createElement("div", {
                    className: s,
                    style: e_[l]
                }, r.default.createElement("div", {
                    className: (0, Z.default)(o, "bg-none stroke-system-contrast stroke-standard"),
                    style: eO
                }, r.default.createElement("span", {
                    className: (0, Z.default)(eU[l], "content-emphasis leading-none")
                }, t + 1))) : r.default.createElement("div", {
                    className: s,
                    style: e_[l]
                }, r.default.createElement("div", {
                    className: (0, Z.default)(o, "bg-shift-300"),
                    style: eO
                }, r.default.createElement("span", {
                    className: (0, Z.default)(eU[l], "content-default leading-none")
                }, t + 1)))), r.default.createElement("div", {
                    className: "flex flex-col min-width-0 max-width-[250px] grow padding-right-medium"
                }, r.default.createElement("span", {
                    className: (0, Z.default)(eP[l], f ? "content-emphasis" : "content-default", "text-no-wrap", "text-truncate-end")
                }, e.label), e.description && r.default.createElement("span", {
                    className: (0, Z.default)(eF[l], f ? "content-emphasis" : "content-default", "text-no-wrap", "text-truncate-end")
                }, e.description)))
            }))
        };
    var eV = e.i(324201),
        eW = e.i(23342);
    let ej = new Set(["_self", "_parent", "_top"]),
        eK = {
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        eY = {
            Standard: "content-emphasis",
            Emphasis: "content-emphasis",
            Inverse: "content-inverse-default"
        },
        eX = (0, r.forwardRef)((e, t) => {
            var a, l, n;
            let {
                children: i,
                className: s,
                size: o,
                color: u = "Emphasis",
                variant: d = "Standalone",
                underline: c = "hover",
                isExternal: m,
                asChild: f,
                ...p
            } = e, g = (l = null != (a = p.as) ? a : "a", n = "button" === p.as ? void 0 : p.target, void 0 !== m ? m : "button" !== l && void 0 !== n && !ej.has(n)), y = (0, Z.default)("foundation-web-link", "button" === p.as && "bg-none stroke-none padding-none appearance-none [text-align:inherit]", ("Standalone" === d || g) && "inline-flex items-center gap-xsmall", void 0 !== o && eK[o], eY[u], "always" === c ? "underline" : "no-underline", "hover" === c && "hover:underline", "motion-safe:transition-opacity", "hover:cursor-pointer hover:[opacity:0.8]", "radius-xsmall focus-visible:[outline-style:solid] focus-visible:[outline-width:var(--stroke-standard)] focus-visible:[outline-color:var(--color-system-emphasis)]", s), E = g ? r.default.createElement("span", {
                "aria-hidden": !0,
                "data-testid": "foundation-web-icon",
                className: (0, Z.default)("grow-0 shrink-0 basis-auto icon size-[1em]", "icon-regular-arrow-up-right-from-square")
            }) : null;
            if (f) {
                let {
                    as: e,
                    ...a
                } = p, l = r.default.Children.only(i);
                return r.default.isValidElement(l) ? r.default.createElement(eW.Slot, {
                    ref: t,
                    ...a,
                    className: y
                }, r.default.cloneElement(l, {}, r.default.createElement(r.default.Fragment, null, l.props.children, E))) : null
            }
            if ("button" === p.as) {
                let {
                    as: e,
                    type: a,
                    ...l
                } = p;
                return r.default.createElement("button", {
                    ref: t,
                    type: null != a ? a : "button",
                    ...l,
                    className: y
                }, i, E)
            }
            let {
                as: v,
                ...b
            } = p;
            return r.default.createElement("a", {
                ref: t,
                ...b,
                className: y
            }, i, E)
        });
    eX.displayName = "Link";
    let eJ = {
            Neutral: "bg-shift-200",
            Standard: "bg-shift-200",
            Contrast: "bg-system-contrast",
            Emphasis: "bg-system-emphasis",
            Success: "bg-[rgb(from_var(--color-system-success)_r_g_b_/_0.2)]",
            Warning: "bg-[rgb(from_var(--color-system-warning)_r_g_b_/_0.2)]",
            Alert: "bg-[rgb(from_var(--color-system-alert)_r_g_b_/_0.2)]",
            OverMedia: "bg-over-media-0"
        },
        e$ = {
            Neutral: "content-emphasis",
            Standard: "content-emphasis",
            Contrast: "content-inverse-emphasis",
            Emphasis: "content-[var(--dark-mode-content-emphasis)]",
            Success: "content-emphasis",
            Warning: "content-emphasis",
            Alert: "content-emphasis",
            OverMedia: "content-emphasis"
        },
        eZ = {
            Neutral: "content-emphasis",
            Standard: "content-emphasis",
            Contrast: "content-inverse-emphasis",
            Emphasis: "content-[var(--dark-mode-content-emphasis)]",
            Success: "content-system-success",
            Warning: "content-system-warning",
            Alert: "content-system-alert",
            OverMedia: "content-emphasis"
        },
        e0 = {
            Neutral: "stroke-none",
            Standard: "stroke-none",
            Contrast: "stroke-none",
            Emphasis: "stroke-none",
            Success: "stroke-none",
            Warning: "stroke-none",
            Alert: "stroke-none",
            OverMedia: "stroke-none"
        },
        e1 = {
            Small: "height-600",
            XSmall: "height-400"
        },
        e2 = {
            Small: "padding-x-small",
            XSmall: "padding-x-xsmall"
        },
        e4 = {
            Small: "width-600",
            XSmall: "width-400"
        },
        e3 = {
            Small: "text-label-small",
            XSmall: "text-caption-small"
        },
        e5 = {
            Small: "padding-y-xsmall",
            XSmall: "padding-y-none"
        },
        e6 = {
            Small: "XSmall",
            XSmall: "XSmall"
        },
        e7 = {
            Pill: "radius-circle",
            Box: "radius-small"
        },
        e8 = r.default.forwardRef((e, t) => {
            let {
                className: a,
                label: l,
                variant: n = "Standard",
                icon: i,
                iconPosition: s = "Leading",
                size: o = "Small",
                shape: u = "Pill",
                ...d
            } = e, c = i && !l, m = "padding-x-xxsmall";
            i && (m = "Leading" === s ? "padding-right-xxsmall" : "padding-left-xxsmall");
            let f = i && r.default.createElement(eL.Icon, {
                name: i,
                size: e6[o],
                className: eZ[n]
            });
            return r.default.createElement("div", {
                ref: t,
                ...d,
                className: (0, Z.default)("foundation-web-badge flex items-center select-none gap-[var(--size-150)]", e7[u], e1[o], c ? [e4[o], "justify-center"] : ["width-[fit-content]", e2[o]], eJ[n], e$[n], e0[n], a)
            }, "Leading" === s && f, l && r.default.createElement("span", {
                className: (0, Z.default)("text-no-wrap text-truncate-split", e3[o], e5[o], m, e$[n])
            }, l), "Trailing" === s && f)
        });
    e8.displayName = "Badge";
    var e9 = e.i(220747);
    let te = {
            Info: "rgb(from var(--color-system-emphasis) r g b / ".concat(.05, ")"),
            Warning: "rgb(from var(--color-system-warning) r g b / ".concat(.05, ")"),
            Success: "rgb(from var(--color-system-success) r g b / ".concat(.05, ")"),
            Error: "rgb(from var(--color-system-alert) r g b / ".concat(.05, ")")
        },
        tt = {
            Info: "stroke-system-emphasis",
            Warning: "stroke-system-warning",
            Success: "stroke-system-success",
            Error: "stroke-system-alert"
        },
        ta = {
            Info: "icon-filled-circle-i",
            Warning: "icon-filled-triangle-exclamation",
            Success: "icon-filled-circle-check",
            Error: "icon-filled-circle-x"
        },
        tl = {
            Info: "var(--inverse-system-emphasis)",
            Warning: "var(--inverse-system-warning)",
            Success: "var(--inverse-system-success)",
            Error: "var(--inverse-system-alert)"
        },
        tn = {
            Info: "bg-action-standard",
            Warning: "bg-inverse-action-standard",
            Success: "bg-inverse-action-standard",
            Error: "bg-action-standard"
        },
        tr = (0, r.forwardRef)((e, t) => {
            let {
                title: a,
                description: l,
                linkLabel: n,
                linkHref: i,
                onLinkClick: s,
                showIcon: o = !0,
                infoIconOverride: u,
                layout: d = "Inline",
                variant: c = "Standard",
                severity: m = "Info",
                primaryActionLabel: f,
                onPrimaryAction: p,
                secondaryActionLabel: g,
                onSecondaryAction: y,
                actions: E,
                onDismiss: v,
                dismissIconAriaLabel: b = "Dismiss banner",
                className: h,
                style: x,
                ...S
            } = e, T = te[m], C = "Emphasis" === c ? tn[m] : "", w = "Info" === m && u ? u : ta[m], N = "Stacked" === d, I = !!E || !!(f && p) || !!(g && y), A = n && r.default.createElement("span", {
                className: (0, Z.default)("text-body-medium underline content-default block text-no-wrap")
            }, n), k = A && r.default.createElement(r.default.Fragment, null, r.default.createElement("span", null, " · "), r.default.createElement("a", {
                className: "shrink-0",
                href: i,
                onClick: s
            }, A)), R = null != E ? E : f && p || g && y ? r.default.createElement("div", {
                className: "flex items-center gap-small"
            }, f && p && r.default.createElement(eV.Button, {
                size: "Small",
                variant: "Standard",
                onClick: p,
                className: (0, Z.default)("content-emphasis label-small", C)
            }, f), g && y && r.default.createElement(eV.Button, {
                size: "Small",
                variant: "Utility",
                onClick: y,
                className: (0, Z.default)("content-emphasis label-small")
            }, g)) : null, M = v && r.default.createElement(e9.CloseAffordance, {
                variant: "Utility",
                size: "Small",
                isCircular: !0,
                className: "content-emphasis",
                "aria-label": b,
                onClick: v
            });
            return r.default.createElement("div", {
                ref: t,
                role: "Warning" === m || "Error" === m ? "alert" : "status",
                className: (0, Z.default)("foundation-web-feedback-banner flex flex-col gap-small radius-medium padding-large stroke-standard", "Standard" === c ? "bg-shift-100" : void 0, "Standard" === c ? "stroke-default" : tt[m], h),
                style: {
                    backgroundColor: "Emphasis" === c ? T : void 0,
                    ...x
                },
                ...S
            }, r.default.createElement("div", {
                className: (0, Z.default)("flex width-full gap-medium", N ? "items-start" : "items-center flex-wrap")
            }, r.default.createElement("div", {
                className: (0, Z.default)("flex grow-1 min-width-0", N ? "flex-col gap-medium basis-0" : "items-center gap-xsmall")
            }, r.default.createElement("div", {
                className: (0, Z.default)("flex min-width-0", N ? "gap-medium flex-col grow-1 basis-0" : "gap-xsmall items-center")
            }, r.default.createElement("div", {
                className: (0, Z.default)("flex items-center gap-xsmall min-width-0")
            }, r.default.createElement("div", {
                className: (0, Z.default)("flex items-center gap-medium min-width-0")
            }, o && w && r.default.createElement(eL.Icon, {
                name: w,
                size: "Large",
                className: "shrink-0",
                style: {
                    color: tl[m]
                }
            }), r.default.createElement("span", {
                className: (0, Z.default)("text-label-medium content-emphasis", N ? "" : "block padding-y-xsmall text-truncate-end text-no-wrap min-width-0 grow-1 basis-0")
            }, a)), N && k), l && (N ? r.default.createElement("div", {
                className: (0, Z.default)("text-body-medium text-truncate-split content-default width-full")
            }, l) : r.default.createElement(r.default.Fragment, null, r.default.createElement("span", {
                className: "text-body-medium text-truncate-end content-default block text-no-wrap min-width-0 fill"
            }, l), r.default.createElement("span", {
                className: "flex items-center gap-xsmall"
            }, k))), !N && !l && k && r.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, k)), N && I && R), !N && (I || v) && r.default.createElement("div", {
                className: "flex items-center justify-end gap-small shrink-0"
            }, I && R, M), N && M && r.default.createElement("div", {
                className: "shrink-0"
            }, M)))
        }),
        ti = (0, r.createContext)(null),
        ts = e => {
            let {
                icon: t,
                className: a
            } = e;
            return r.default.createElement("div", {
                className: (0, Z.default)("flex flex-col items-center gap-y-xsmall shrink-0 grow-0 width-50", a)
            }, r.default.createElement("span", {
                className: "grow-1 stroke-standard stroke-default group-first/timeline-item:invisible"
            }), r.default.createElement(eL.Icon, {
                name: null != t ? t : "icon-regular-diamond-simplified",
                size: "Medium",
                className: "shrink-0 content-emphasis"
            }), r.default.createElement("span", {
                className: "grow-1 stroke-standard stroke-default group-last/timeline-item:invisible"
            }))
        },
        to = (0, r.forwardRef)((e, t) => {
            let {
                title: a,
                description: l,
                link: n,
                icon: i,
                children: s,
                className: o,
                ...u
            } = e, {
                placement: d
            } = (() => {
                let e = (0, r.useContext)(ti);
                if (!e) throw Error("Timeline subcomponents must be used within a Timeline component");
                return e
            })(), c = "Start" === d, m = c ? "flex-row" : "flex-row-reverse", f = !!(l || n || s);
            return r.default.createElement("li", {
                ref: t,
                className: (0, Z.default)("flex flex-col relative padding-x-medium group/timeline-item", o),
                style: {
                    listStyle: "none"
                },
                ...u
            }, r.default.createElement("div", {
                className: (0, Z.default)("flex gap-medium", m)
            }, r.default.createElement(ts, {
                icon: i
            }), r.default.createElement("div", {
                className: (0, Z.default)("fill padding-y-small", !c && "text-align-x-end")
            }, r.default.createElement("div", {
                className: (0, Z.default)("flex items-center gap-none", !c && "justify-end")
            }, r.default.createElement("div", {
                className: "text-title-medium content-emphasis"
            }, a)))), f && r.default.createElement("div", {
                className: (0, Z.default)("flex gap-medium", m)
            }, r.default.createElement("div", {
                className: "flex flex-col items-center shrink-0 grow-0 width-50"
            }, r.default.createElement("span", {
                className: "grow-1 stroke-standard stroke-default group-last/timeline-item:invisible"
            })), r.default.createElement("div", {
                className: (0, Z.default)("fill padding-bottom-small", !c && "text-align-x-end")
            }, l && r.default.createElement("div", {
                className: "text-body-medium content-default"
            }, l), n && r.default.createElement("div", {
                className: "padding-top-xsmall"
            }, n), s && r.default.createElement("div", {
                className: "padding-top-small"
            }, s))))
        });
    to.displayName = "TimelineItem";
    let tu = (0, r.forwardRef)((e, t) => {
        let {
            placement: a = "Start",
            children: l,
            className: n,
            ...i
        } = e, s = (0, r.useMemo)(() => ({
            placement: a
        }), [a]);
        return r.default.createElement(ti.Provider, {
            value: s
        }, r.default.createElement("ul", {
            ref: t,
            className: (0, Z.default)("flex flex-col padding-none", n),
            style: {
                listStyle: "none"
            },
            ...i
        }, l))
    });
    tu.displayName = "Timeline";
    let td = {
            Standard: {
                Info: "bg-shift-200",
                Warning: "bg-shift-200",
                Success: "bg-shift-200",
                Error: "bg-shift-200"
            },
            Emphasis: {
                Info: "bg-system-emphasis",
                Warning: "bg-system-warning",
                Success: "bg-system-success",
                Error: "bg-system-alert"
            }
        },
        tc = {
            Info: "var(--dark-mode-content-default)",
            Warning: "var(--light-mode-content-default)",
            Success: "var(--light-mode-content-default)",
            Error: "var(--dark-mode-content-default)"
        },
        tm = {
            Info: "var(--light-mode-system-emphasis)",
            Warning: "var(--light-mode-system-warning)",
            Success: "var(--light-mode-system-success)",
            Error: "var(--light-mode-system-alert)"
        },
        tf = {
            Info: "icon-filled-circle-i",
            Warning: "icon-filled-triangle-exclamation",
            Success: "icon-filled-circle-check",
            Error: "icon-filled-circle-x"
        },
        tp = {
            Info: "bg-action-standard",
            Warning: "bg-inverse-action-standard",
            Success: "bg-inverse-action-standard",
            Error: "bg-action-standard"
        },
        tg = {
            Info: "var(--dark-mode-content-emphasis)",
            Warning: "var(--light-mode-content-emphasis)",
            Success: "var(--light-mode-content-emphasis)",
            Error: "var(--dark-mode-content-emphasis)"
        },
        ty = (0, r.forwardRef)((e, t) => {
            let {
                title: a,
                description: l,
                showIcon: n = !0,
                infoIconOverride: i,
                variant: s = "Standard",
                severity: o = "Info",
                primaryActionLabel: u,
                onPrimaryAction: d,
                actions: c,
                onDismiss: m,
                dismissIconAriaLabel: f = "Dismiss banner",
                className: p,
                ...g
            } = e, y = td[s][o], E = tg[o], v = tc[o], b = tm[o], h = "Emphasis" === s ? tp[o] : "", x = "Emphasis" === s ? tg[o] : "";
            return r.default.createElement("div", {
                ref: t,
                role: "Warning" === o || "Error" === o ? "alert" : "status",
                className: (0, Z.default)("foundation-web-system-banner w-full flex items-center gap-medium radius-medium stroke-none padding-y-medium padding-x-large", y, p),
                ...g
            }, r.default.createElement("div", {
                className: "flex items-center gap-medium grow-1 basis-0"
            }, n && r.default.createElement(eL.Icon, {
                name: "Info" === o && i ? i : tf[o],
                size: "Large",
                className: (0, Z.default)("shrink-0"),
                style: {
                    color: "Standard" === s ? b : x
                }
            }), r.default.createElement("div", {
                className: "flex flex-col gap-xsmall grow-1 basis-0"
            }, r.default.createElement("div", {
                className: (0, Z.default)("text-title-medium text-truncate-end", "Standard" === s ? "content-emphasis" : ""),
                style: {
                    color: "Emphasis" === s ? E : void 0
                }
            }, a), l && r.default.createElement("div", {
                className: (0, Z.default)("text-body-medium text-truncate-split", "Standard" === s ? "content-default" : ""),
                style: {
                    color: "Emphasis" === s ? v : void 0
                }
            }, l))), (u || c || m) && r.default.createElement("div", {
                className: "flex items-center justify-end gap-small shrink-0"
            }, null != c ? c : u && d && r.default.createElement(eV.Button, {
                size: "Small",
                variant: "Standard",
                onClick: d,
                className: (0, Z.default)(h),
                style: {
                    color: x
                }
            }, u), m && r.default.createElement(e9.CloseAffordance, {
                variant: "Utility",
                size: "Small",
                isCircular: !0,
                style: {
                    color: x || void 0
                },
                "aria-label": f,
                onClick: m
            })))
        });
    var tE = e.i(157924);
    e.i(668833);
    var tv = e.i(425353);
    let tb = e => {
            let {
                type: t,
                sideSheetSide: a = "right",
                isSideSheetFlush: l = !1,
                centerSheetSize: n = "Medium",
                children: i,
                overlayClassName: s,
                contentClassName: o,
                onOpenAutoFocus: u,
                onCloseAutoFocus: d,
                onPointerDownOutside: c,
                onEscapeKeyDown: m,
                onInteractOutside: f
            } = e;
            return r.default.createElement(tv.Portal, null, r.default.createElement(tv.Overlay, {
                "data-testid": "fui-base-sheet-overlay",
                "data-type": t,
                "data-side": "sideSheet" === t ? a : void 0,
                "data-flush": "sideSheet" === t ? l : void 0,
                "data-size": "centerSheet" === t ? n : void 0,
                className: (0, Z.default)("fui-base-sheet-overlay", "foundation-web-portal-zindex fixed inset-[0] flex", s)
            }, r.default.createElement(tv.Content, {
                "data-testid": "fui-base-sheet-content",
                className: (0, Z.default)("fui-base-sheet-content relative bg-surface-100 stroke-muted stroke-standard shadow-transient-high", "flex flex-col clip", o),
                onOpenAutoFocus: u,
                onCloseAutoFocus: d,
                onPointerDownOutside: c,
                onEscapeKeyDown: m,
                onInteractOutside: f
            }, i)))
        },
        th = e => {
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
            let n = l.find(e => {
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
    var tx = e.i(199512),
        tS = e.i(167878);
    let tT = (0, r.createContext)(null),
        tC = () => {
            let e = (0, r.useContext)(tT);
            if (!e) throw Error("Sheet components must be used within a Sheet");
            return e
        },
        tw = e => {
            let {
                open: t,
                onOpenChange: a,
                defaultOpen: l,
                children: n
            } = e;
            return r.default.createElement(tv.Root, {
                open: t,
                onOpenChange: a,
                defaultOpen: l,
                modal: !0
            }, n)
        },
        tN = e => {
            let t, {
                    children: a,
                    centerSheetSize: l = "Medium",
                    largeScreenVariant: n = "center",
                    closeLabel: i,
                    className: s,
                    mobilePortraitClassName: o,
                    mobileLandscapeClassName: u,
                    largeScreenClassName: d,
                    onOpenAutoFocus: c,
                    onCloseAutoFocus: m,
                    onPointerDownOutside: f,
                    onEscapeKeyDown: p,
                    onInteractOutside: g
                } = e,
                y = (0, tS.useMediaQuery)("(orientation: portrait) and (max-width: 600px)"),
                E = (0, tS.useMediaQuery)("(orientation: landscape) and (max-height: 600px)");
            t = y ? "bottomSheet" : E || "side" === n ? "sideSheet" : "centerSheet";
            let v = (0, r.useMemo)(() => ({
                    centerSheetSize: l,
                    largeScreenVariant: n,
                    closeLabel: i,
                    isPortraitMobile: y,
                    isLandscapeMobile: E,
                    type: t
                }), [l, n, i, y, E, t]),
                b = (0, Z.default)(s, y && o, E && u, !y && !E && d);
            return r.default.createElement(tT.Provider, {
                value: v
            }, r.default.createElement(tb, {
                type: t,
                sideSheetSide: "right",
                isSideSheetFlush: E,
                centerSheetSize: l,
                contentClassName: b,
                onOpenAutoFocus: null != c ? c : th,
                onCloseAutoFocus: m,
                onPointerDownOutside: f,
                onEscapeKeyDown: p,
                onInteractOutside: g
            }, a))
        },
        tI = (0, r.forwardRef)((e, t) => {
            let {
                children: a,
                className: l,
                hasPaddingX: n = !0,
                ...i
            } = e, {
                type: s
            } = tC();
            return r.default.createElement("div", {
                ref: t,
                className: (0, Z.default)("scroll-y", n && "padding-x-xlarge", "sideSheet" === s ? "grow-1" : "", l),
                ...i
            }, a)
        });
    tI.displayName = "SheetBody";
    let tA = e => {
        let {
            className: t,
            children: a,
            navigation: l,
            utilities: n,
            visuallyHideTitleText: i
        } = e, {
            closeLabel: s
        } = tC(), o = r.default.createElement(tv.Title, {
            className: "text-heading-small margin-none"
        }, a);
        return r.default.createElement("div", {
            className: (0, Z.default)(t, l ? "padding-left-medium" : "padding-left-xlarge", "padding-right-small padding-y-small", "flex items-center justify-between")
        }, r.default.createElement("div", {
            className: (0, Z.default)("flex items-center", l && "gap-xsmall")
        }, l, i ? r.default.createElement(tx.VisuallyHidden, null, o) : o), r.default.createElement("div", {
            className: (0, Z.default)("flex items-center", n && "gap-xxsmall")
        }, n, r.default.createElement("div", {
            className: "fui-sheet-close-affordance-container"
        }, r.default.createElement(tv.Close, {
            asChild: !0
        }, r.default.createElement(tE.IconButton, {
            variant: "Utility",
            size: "Medium",
            icon: "icon-regular-x",
            ariaLabel: s || "",
            "data-autofocus-priority": "1000"
        })))))
    };
    var tk = e.i(710319),
        tR = e.i(976544),
        tM = e.i(21290),
        tD = e.i(677753),
        tL = e.i(640694),
        t_ = e.i(252842),
        tO = e.i(892438),
        tB = e.i(823062),
        tq = e.i(127792),
        tP = e.i(858517),
        tF = e.i(921394),
        tU = e.i(149285);
    let tG = e => e.split("-").reduce((e, t) => {
            var a;
            return e + (null != (a = t[0]) ? a : "").toUpperCase() + t.slice(1)
        }, ""),
        tQ = (0, o.makeStyles)()((e, t) => {
            let {
                gap: a
            } = t;
            return {
                gap: {
                    gap: a
                },
                flex: {
                    display: "flex"
                },
                justifyContentCenter: {
                    justifyContent: "center"
                },
                justifyContentFlexStart: {
                    justifyContent: "flex-start"
                },
                justifyContentFlexEnd: {
                    justifyContent: "flex-end"
                },
                justifyContentSpaceBetween: {
                    justifyContent: "space-between"
                },
                justifyContentSpaceAround: {
                    justifyContent: "space-around"
                },
                justifyContentSpaceEvenly: {
                    justifyContent: "space-evenly"
                },
                alignItemsCenter: {
                    alignItems: "center"
                },
                alignItemsFlexStart: {
                    alignItems: "flex-start"
                },
                alignItemsFlexEnd: {
                    alignItems: "flex-end"
                },
                flexDirectionRow: {
                    flexDirection: "row"
                },
                flexDirectionRowReverse: {
                    flexDirection: "row-reverse"
                },
                flexDirectionColumn: {
                    flexDirection: "column"
                },
                flexDirectionColumnReverse: {
                    flexDirection: "column-reverse"
                },
                flexWrapWrap: {
                    flexWrap: "wrap"
                },
                flexWrapWrapReverse: {
                    flexWrap: "wrap-reverse"
                },
                flexWrapNoWrap: {
                    flexWrap: "nowrap"
                }
            }
        }),
        tz = (0, r.forwardRef)((e, t) => {
            let {
                id: a,
                className: l,
                classes: n,
                flexDirection: i,
                flexWrap: s,
                justifyContent: o,
                alignItems: u,
                gap: d = 0,
                children: c
            } = e, {
                classes: {
                    flex: m,
                    ...f
                },
                cx: p
            } = tQ({
                gap: d
            });
            return r.default.createElement("div", {
                ref: t,
                id: a,
                className: p(m, f.gap, l, null == n ? void 0 : n.root, f["flexDirection".concat(tG(null != i ? i : ""))], f["flexWrap".concat(tG(null != s ? s : ""))], f["alignItems".concat(tG(null != u ? u : ""))], f["justifyContent".concat(tG(null != o ? o : ""))])
            }, c)
        });
    tz.displayName = "Flex";
    var tH, tV, tW, tj = ((tV = {}).Navigation = "CreatorDashboard.Navigation", tV.Error = "CreatorDashboard.Error", tV.Controls = "CreatorDashboard.Controls", tV.DeveloperQuestionnaire = "CreatorDashboard.DeveloperQuestionnaire", tV.CommonUIControls = "CommonUI.Controls", tV);
    let tK = (0, o.makeStyles)()({
        headerFour: {
            marginBottom: "16px"
        },
        unorderedList: {
            margin: "0px"
        },
        orderedList: {
            margin: "0px",
            paddingLeft: "24px"
        }
    });

    function tY() {
        let {
            classes: {
                headerFour: e,
                unorderedList: t,
                orderedList: a
            }
        } = tK(), l = 0, n = () => l += 1;

        function i(e) {
            return e.startsWith("[") ? 1 : e.startsWith("####") ? 2 : e.startsWith("* ") ? 3 : /^\d+\.\s/.test(e) ? 6 : e.startsWith("|") ? 5 : 4
        }

        function s(e) {
            let t = [],
                a = /\[([^\]]+)\]\(([^)]+)\)/g,
                l = 0,
                i = a.exec(e);
            for (; null !== i;) i.index > l && t.push(e.slice(l, i.index)),
                function(e) {
                    try {
                        let {
                            hostname: t
                        } = new URL(e);
                        return "roblox.com" === t || t.endsWith(".roblox.com")
                    } catch (e) {
                        return !1
                    }
                }(i[2]) ? t.push(r.default.createElement(d.Link, {
                    href: i[2],
                    target: "_blank",
                    underline: "always",
                    key: n()
                }, i[1])) : t.push(i[1]), l = i.index + i[0].length, i = a.exec(e);
            return l < e.length && t.push(e.slice(l)), t
        }

        function o(e, t) {
            let a = e.split("**");
            return r.default.createElement(u.Typography, {
                variant: t ? "largeLabel2" : "body1",
                component: "span",
                color: "secondary",
                key: n()
            }, a.map((e, t, a) => t % 2 == 0 ? r.default.createElement(r.Fragment, {
                key: n()
            }, s(e)) : t % 2 == 1 && a.length % 2 == 1 || t % 2 == 1 && a.length % 2 == 0 && t < a.length - 2 ? r.default.createElement("b", {
                key: n()
            }, e) : (a.length % 2 == 0 && a.length, r.default.createElement(r.Fragment, {
                key: n()
            }, s(e)))))
        }

        function c(e) {
            return e.trim().replaceAll(/^\||\|$/g, "").split("|").map(e => e.trim())
        }

        function m(e) {
            if (0 === e.length) return null;
            let t = e.filter(e => !/^\|[\s\-:|]+\|$/.test(e.trim()));
            if (0 === t.length) return null;
            let a = c(t[0]),
                l = t.slice(1);
            return r.default.createElement("table", {
                key: n(),
                className: "margin-top-[8px] margin-bottom-[8px] width-full",
                style: {
                    borderCollapse: "collapse"
                }
            }, r.default.createElement("thead", null, r.default.createElement("tr", null, a.map(e => r.default.createElement("th", {
                className: "stroke-standard stroke-default text-align-x-left padding-small",
                key: n()
            }, o(e, !0))))), r.default.createElement("tbody", null, l.map(e => {
                let t = c(e);
                return r.default.createElement("tr", {
                    key: n()
                }, t.map(e => r.default.createElement("td", {
                    key: n(),
                    className: "stroke-standard stroke-default text-align-x-left padding-small"
                }, o(e))))
            })))
        }

        function f(e) {
            return 3 === e || 6 === e
        }

        function p(e, t) {
            return e === t.length - 1
        }
        return {
            parseText: (0, r.useCallback)((l, s) => {
                var c;
                let g, y = null == (c = null == s ? void 0 : s.includeLineBreaks) || c;
                if (0 === l.trim().length) return r.default.createElement(r.default.Fragment, null, null);
                let E = ((g = l.split("\n")).filter(e => e.length > 0), g.map(e => e.trim())),
                    v = [],
                    b = [],
                    h = !1,
                    x = !1,
                    S = [],
                    T = !1;

                function C(e) {
                    for (let t = e + 1; t < E.length; t += 1)
                        if (E[t].length > 0) return i(E[t]);
                    return null
                }
                let w = 0;

                function N() {
                    for (let e = 0; e < w; e += 1) b.push(r.default.createElement("br", {
                        key: n()
                    }));
                    w = 0
                }

                function I() {
                    ! function() {
                        if (0 === b.length) return;
                        let e = x ? r.default.createElement("ol", {
                            className: a,
                            key: n()
                        }, b.map(e => e)) : r.default.createElement("ul", {
                            className: t,
                            key: n()
                        }, b.map(e => e));
                        v.push(e), b = [], h = !1, x = !1
                    }(), w = 0
                }
                if (E.forEach((t, a) => {
                        if (0 === t.length && T) return;
                        if (0 === t.length && h) {
                            w += 1;
                            return
                        }
                        let l = i(t),
                            s = function(e, t) {
                                switch (t) {
                                    case 1:
                                        let a, l, i;
                                        return l = (a = e.slice(1, -1).split("]("))[1], i = a[0], r.default.createElement(u.Typography, {
                                            variant: "body1",
                                            component: "span",
                                            key: n()
                                        }, r.default.createElement(d.Link, {
                                            href: l,
                                            target: "_blank",
                                            underline: "always"
                                        }, i));
                                    case 3:
                                        let s;
                                        return s = e.replace(/(\*\s*)/, ""), r.default.createElement("li", {
                                            key: n()
                                        }, o(s));
                                    case 6:
                                        let c;
                                        return c = e.replace(/^\d+\.\s*/, ""), r.default.createElement("li", {
                                            key: n()
                                        }, o(c));
                                    case 2:
                                        let m;
                                        return m = e.replace(/(####\s*)/, ""), r.default.createElement(u.Typography, {
                                            variant: "subtitle2",
                                            key: n()
                                        }, m);
                                    case 4:
                                        return o(e);
                                    case 5:
                                        return r.default.createElement(r.Fragment, {
                                            key: n()
                                        }, e);
                                    default:
                                        throw Error("Unexpected markdown type: ".concat(t.toString()))
                                }
                            }(t, l);
                        if (5 === l) {
                            if (T || (T = !0), S.push(t), 5 === l && p(a, E)) {
                                T = !1;
                                let e = m(S);
                                e && v.push(e), S = []
                            }
                        } else if (5 !== l && T) {
                            T = !1;
                            let t = m(S);
                            if (t && v.push(t), S = [], f(l)) h || (h = !0, x = 6 === l), N(), b.push(s);
                            else if (2 === l) v.push(r.default.createElement("div", {
                                className: e
                            }, s));
                            else {
                                v.push(s);
                                let e = C(a);
                                y && null !== e && !f(e) && 5 !== e && 2 !== e && v.push(r.default.createElement("br", null))
                            }
                        } else if (f(l)) h || (h = !0, x = 6 === l), N(), b.push(s), p(a, E) && I();
                        else if (!f(l) && h) I(), v.push(s);
                        else if (2 === l) v.push(r.default.createElement("div", {
                            className: e
                        }, s));
                        else {
                            v.push(s);
                            let e = C(a);
                            y && null !== e && !f(e) && 5 !== e && 2 !== e && v.push(r.default.createElement("br", null))
                        }
                    }), h && I(), T && S.length > 0) {
                    let e = m(S);
                    e && v.push(e)
                }
                return r.default.createElement(r.default.Fragment, null, v.map((e, t) => r.default.createElement("span", {
                    key: t
                }, e)))
            }, [])
        }
    }
    let tX = "RadioButtonQuestion",
        tJ = "CheckBoxQuestion",
        t$ = "TextBoxQuestion",
        tZ = "Title.MissingQuestionnaireId",
        t0 = "Message.MissingQuestionnaireId",
        t1 = "Title.ChangedQuestionnaireId",
        t2 = "Message.ChangedQuestionnaireId",
        t4 = {
            titleKey: "Title.GuidelinesInProgress",
            messageKey: "Message.GuidelinesInProgress",
            buttonKey: "Button.Resume"
        },
        t3 = {
            titleKey: "Title.GuidelinesNotStarted",
            messageKey: "Message.GuidelinesNotStarted",
            buttonKey: "Button.Start"
        },
        t5 = {
            titleKey: "Title.GuidelinesSubmittedOldVersion",
            messageKey: "Message.GuidelinesSubmittedOldVersion",
            buttonKey: "Button.Update"
        },
        t6 = {
            titleKey: "Title.GuidelinesSubmittedNewVersion",
            messageKey: "Message.GuidelinesSubmittedNewVersion",
            buttonKey: "Button.Restart"
        },
        t7 = {
            titleKey: "Title.GuidelinesSubmittedNewVersionInProgress",
            messageKey: "Message.GuidelinesSubmittedNewVersionInProgress",
            buttonKey: "Button.Resume"
        },
        t8 = {
            titleKey: "Title.GuidelinesInProgress",
            messageKey: "Message.ContentMaturityInProgress",
            buttonKey: "Button.Resume"
        },
        t9 = {
            titleKey: "Title.GuidelinesNotStarted",
            messageKey: "Message.ContentMaturityNotStarted",
            buttonKey: "Button.Start"
        },
        ae = {
            titleKey: "Title.GuidelinesSubmittedOldVersion",
            messageKey: "Message.ContentMaturitySubmittedOldVersion",
            buttonKey: "Button.Update"
        },
        at = {
            titleKey: "Title.GuidelinesSubmittedNewVersion",
            messageKey: "Message.ContentMaturitySubmittedNewVersion",
            buttonKey: "Button.Restart"
        },
        aa = {
            titleKey: "Title.GuidelinesSubmittedNewVersionInProgress",
            messageKey: "Message.ContentMaturitySubmittedNewVersionInProgress",
            buttonKey: "Button.Resume"
        },
        al = "started",
        an = "".concat((0, X.getProductionCreatorHubUrl)("global"), "/docs/reference/engine/classes/PolicyService"),
        ar = "".concat((0, X.getProductionCreatorHubUrl)("global"), "/docs/production/promotion/experience-guidelines"),
        ai = (e, t) => {
            let a = t.reduce((e, t) => {
                let {
                    questionId: a,
                    value: l
                } = t;
                return {
                    ...e,
                    [a]: JSON.parse(l)
                }
            }, {});

            function l(e) {
                return e.reduce((e, t) => {
                    var a;
                    return [...e, ...null != (a = t.childSections) ? a : []]
                }, [])
            }
            return e.questions.every(function e(t) {
                let n = a[t.id];
                if (void 0 === n) return !1;
                if (t.type === tJ) {
                    let a = Array.isArray(n) ? n : [];
                    if (0 === a.length) return !1;
                    let r = t.options.filter(e => {
                            let {
                                id: t
                            } = e;
                            return a.includes(null != t ? t : "")
                        }),
                        i = r.reduce((e, t) => {
                            var a;
                            return [...e, ...null != (a = t.childQuestions) ? a : []]
                        }, []),
                        s = l(r),
                        o = 0 === i.length || i.every(e),
                        u = 0 === s.length || s.every(t => t.questions.every(e));
                    return o && u
                }
                if (t.type === tX) {
                    let a = t.options.find(e => e.id === n);
                    if (a) {
                        var r;
                        let t = null != (r = a.childQuestions) ? r : [],
                            n = l([a]),
                            i = 0 === t.length || t.every(e),
                            s = 0 === n.length || n.every(t => t.questions.every(e));
                        return i && s
                    }
                }
                return !0
            })
        },
        as = e => {
            var t, a;
            let {
                sections: l,
                currentIndex: n,
                answers: r,
                violatedSectionIds: i
            } = e, s = l.slice(n + 1);
            if (null == i ? void 0 : i.size) {
                let e = s.find(e => i.has(e.id));
                if (e) return e
            }
            let o = e => !ai(e, r);
            return null != (t = null != (a = s.find(o)) ? a : l.slice(0, n).find(o)) ? t : null
        },
        ao = (e, t) => {
            var a;
            return e ? e.find(e => e.id === t) || (null != (a = e.filter(e => "options" in e && !!e.options).flatMap(e => e.options.filter(e => e.childQuestions)).map(e => ao(e.childQuestions, t)).find(e => null !== e)) ? a : null) : null
        },
        au = (e, t, a, l) => [...e.filter(e => e.questionId !== t).filter(e => !l.includes(e.questionId)), {
            questionId: t,
            value: a
        }],
        ad = e => {
            let {
                section: t,
                priorAnswers: a,
                newAnswers: l,
                questionId: n
            } = e;
            if (!t) return !1;
            let r = ai(t, a),
                i = ai(t, l),
                s = ao(t.questions, n);
            return !r && i && null != s && s.type !== tJ
        },
        ac = (0, r.createContext)({}),
        am = (0, r.createContext)(!0),
        af = e => {
            let {
                children: t,
                value: a
            } = e;
            return r.default.createElement(ac.Provider, {
                value: a
            }, t)
        },
        ap = e => {
            let {
                children: t,
                isActive: a
            } = e;
            return r.default.createElement(am.Provider, {
                value: a
            }, t)
        },
        ag = (e, t) => {
            let a = (0, r.useRef)(t),
                l = (0, r.useRef)(null);
            (0, r.useEffect)(() => {
                a.current = t
            }, [t]);
            let n = (0, r.useCallback)(() => {
                    if (!a.current || l.current) return;
                    let e = Date.now();
                    l.current = {
                        iso: new Date(e).toISOString(),
                        milliseconds: e
                    }
                }, []),
                i = (0, r.useCallback)(() => {
                    var e;
                    let t = l.current;
                    t && (l.current = null, null == (e = a.current) || e.call(a, {
                        clientTimestamp: t.iso,
                        durationMs: Date.now() - t.milliseconds
                    }))
                }, []);
            (0, r.useEffect)(() => {
                e ? n() : i()
            }, [i, e, n]), (0, r.useEffect)(() => {
                let t = () => i(),
                    a = () => {
                        "hidden" === document.visibilityState ? i() : e && n()
                    };
                return window.addEventListener("pagehide", t), document.addEventListener("visibilitychange", a), () => {
                    window.removeEventListener("pagehide", t), document.removeEventListener("visibilitychange", a), i()
                }
            }, [i, e, n])
        },
        ay = {
            width: "100%",
            height: "100%"
        },
        aE = (0, o.makeStyles)()(e => ({
            sectionStyle: {
                ...ay,
                maxWidth: "700px"
            },
            sectionQuestion: {
                marginTop: e.spacing(1)
            },
            sectionSubQuestion: {
                marginTop: "20px"
            },
            container: {
                ...ay
            },
            navigationButtonsContainer: {
                display: "flex",
                flexFlow: "row wrap",
                marginTop: e.spacing(1)
            },
            navigationButtons: {
                marginRight: "16px",
                marginTop: e.spacing(1)
            },
            warningTextContainer: {
                margin: "".concat(e.spacing(4), " 0"),
                fontStyle: "italic"
            }
        }));
    var av = (0, r.forwardRef)((e, t) => {
        let {
            isSubQuestion: a,
            children: l
        } = e, {
            classes: {
                sectionQuestion: n,
                sectionSubQuestion: i
            }
        } = aE();
        return r.default.createElement("section", {
            ref: t,
            className: a ? i : n
        }, l)
    });
    let ab = e => {
            let t = [];
            return e ? e.reduce((e, t) => {
                var a, l;
                return t.id && t.name && t.questions ? [...e, {
                    id: t.id,
                    name: t.name,
                    description: null != (a = t.description) ? a : null,
                    questions: t.questions,
                    metadata: null != (l = t.metadata) ? l : {}
                }] : e
            }, t) : t
        },
        ah = e => e.reduce((e, t) => t.questionId && t.value ? [...e, {
            questionId: t.questionId,
            value: t.value
        }] : e, []),
        ax = e => e ? e.reduce((e, t) => {
            if (t.id && t.text) {
                if (t.type === tX || t.type === tJ) return [...e, {
                    id: t.id,
                    options: t.options,
                    metadata: t.metadata,
                    helpInfo: t.helpInfo,
                    text: t.text,
                    type: t.type
                }];
                if (t.type === t$) return [...e, {
                    id: t.id,
                    validationType: t.validationType,
                    maxInputLength: t.maxInputLength,
                    metadata: t.metadata,
                    helpInfo: t.helpInfo,
                    text: t.text,
                    type: t.type
                }]
            }
            return e
        }, []) : [],
        aS = e => {
            if (e.id && e.name && e.sections && e.description) {
                var t;
                let a;
                return {
                    id: e.id,
                    name: e.name,
                    description: e.description,
                    sections: (t = e.sections, a = [], t ? t.reduce((e, t) => {
                        var a, l;
                        return t.id && t.name && t.questions ? [...e, {
                            id: t.id,
                            name: t.name,
                            description: null != (a = t.description) ? a : null,
                            questions: ax(t.questions),
                            metadata: null != (l = t.metadata) ? l : {}
                        }] : e
                    }, a) : a)
                }
            }
            return null
        },
        aT = e => {
            let {
                validatedAnswers: t,
                errors: a,
                section: l,
                updateAnswer: n,
                depth: i = 0,
                questionComponent: s
            } = e, [o, d] = (0, r.useState)([]);
            return (0, r.useEffect)(() => {
                d(ax(l.questions))
            }, [l]), r.default.createElement(c.Step, null, r.default.createElement(m.StepLabel, null, r.default.createElement(u.Typography, {
                variant: "h1"
            }, l.name)), 0 === o.length ? r.default.createElement(f.CircularProgress, null) : o.map(e => r.default.createElement(s, {
                key: e.id,
                question: e,
                updateAnswer: n,
                validatedAnswers: t,
                errors: a,
                depth: i
            })))
        },
        aC = e => {
            let {
                validatedAnswers: t,
                errors: a,
                section: l,
                updateAnswer: n,
                depth: i = 0,
                questionComponent: s
            } = e, o = (0, r.useMemo)(() => ax(l.questions), [l.questions]);
            return r.default.createElement(c.Step, {
                className: "margin-top-medium"
            }, r.default.createElement(m.StepLabel, null, r.default.createElement(u.Typography, {
                variant: "h6"
            }, l.name)), o.map(e => r.default.createElement(s, {
                key: e.id,
                question: e,
                updateAnswer: n,
                validatedAnswers: t,
                errors: a,
                depth: i
            })))
        },
        aw = {
            isSectionStepperEnabled: !1,
            isFetched: !0
        },
        aN = e => {
            let {
                children: t
            } = e;
            return r.default.createElement(r.default.Fragment, null, t(aw))
        },
        aI = {
            scrollContainerId: "applayout-scroll-container",
            isHostReady: !0,
            questionnaireVersion: {
                shouldUseV2: !0,
                isFetched: !0
            },
            sectionStepper: {
                isExperimentReady: !0,
                isExperimentEnabled: !1,
                Enrollment: aN,
                Cache: aN
            }
        },
        aA = (0, r.createContext)(aI),
        ak = () => (0, r.useContext)(aA);

    function aR() {
        let e, t;
        return e = a => a.id ? a.type === tX || a.type === tJ ? [a.id, ...a.options ? a.options.reduce((a, l) => {
            let n = [];
            return l.childQuestions && (n = [...l.childQuestions.reduce((t, a) => [...t, ...e(a)], [])]), l.childSections && (n = [...n, ...l.childSections.reduce((e, a) => [...e, ...t(a)], [])]), [...a, ...n]
        }, []) : []] : a.type === t$ ? [a.id, ...(e => {
            throw Error("TextBox Questions are not supported for cleaning answers. Question ID: ".concat(e.id))
        })(a)] : [a.id] : [], t = t => t.questions ? t.questions.reduce((t, a) => [...t, ...e(a)], []) : [], {
            traverseQuestionsForQuestionIds: (0, r.useCallback)(t => 0 === t.length ? [] : t.reduce((t, a) => [...t, ...e(a)], []), [e]),
            traverseSectionsForQuestionIds: (0, r.useCallback)(e => 0 === e.length ? [] : e.reduce((e, a) => [...e, ...t(a)], []), [t])
        }
    }
    let aM = e => {
            var t, a;
            let {
                open: l,
                onClose: n,
                helpInfo: i
            } = e, {
                parseText: s
            } = tY(), [o, u] = (0, r.useState)("example-0"), d = i.examples && i.examples.length > 0;
            (0, r.useEffect)(() => {
                l && u("example-0")
            }, [l]);
            let c = r.default.useMemo(() => {
                    let e = [];
                    return i.images && i.images.forEach(t => {
                        t.url && e.push({
                            type: "image",
                            url: t.url,
                            altText: t.altText
                        })
                    }), i.videos && i.videos.forEach(t => {
                        t.url && e.push({
                            type: "video",
                            url: t.url,
                            altText: t.altText
                        })
                    }), e
                }, [i]),
                m = e => 0 === e.length ? null : r.default.createElement("div", {
                    className: "flex wrap gap-medium justify-center width-full"
                }, e.map(e => {
                    let t, a;
                    return r.default.createElement("div", {
                        key: "".concat(e.type, "-").concat(e.url),
                        className: "radius-medium max-width-[280px]",
                        style: {
                            flex: "1 1 300px",
                            boxSizing: "border-box"
                        }
                    }, "image" === e.type && r.default.createElement("img", {
                        src: e.url,
                        alt: e.altText || "Help image",
                        className: "width-full radius-medium max-height-[300px]",
                        style: {
                            height: "auto",
                            display: "block",
                            objectFit: "contain"
                        }
                    }), "video" === e.type && (t = e.url, /youtube\.com\/(embed|watch)|youtu\.be\//.test(t)) && r.default.createElement("iframe", {
                        src: e.url.replace("youtube.com", "youtube-nocookie.com"),
                        title: e.altText || "YouTube video",
                        className: "width-full radius-medium",
                        style: {
                            aspectRatio: "16 / 9",
                            display: "block",
                            border: "none"
                        },
                        allow: "accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture",
                        allowFullScreen: !0
                    }), "video" === e.type && (a = e.url, !/youtube\.com\/(embed|watch)|youtu\.be\//.test(a)) && r.default.createElement("video", {
                        controls: !0,
                        className: "width-full radius-medium",
                        style: {
                            height: "auto",
                            display: "block",
                            maxHeight: "300px"
                        },
                        "aria-label": e.altText || "Help video"
                    }, r.default.createElement("source", {
                        src: e.url
                    }), r.default.createElement("track", {
                        kind: "captions"
                    })))
                }));
            return r.default.createElement(J.Dialog, {
                open: l,
                onOpenChange: e => {
                    e || n()
                },
                size: "Large",
                isModal: !0,
                hasCloseAffordance: !0,
                closeLabel: "close"
            }, r.default.createElement(J.DialogContent, {
                className: "flex flex-col",
                style: {
                    maxHeight: "90vh",
                    maxWidth: "min(720px, 90vw)"
                }
            }, r.default.createElement(J.DialogBody, {
                className: "flex flex-col gap-large scroll-y min-height-[0px]"
            }, r.default.createElement(J.DialogTitle, {
                className: "text-heading-medium margin-none"
            }, i.title || "Help Information"), i.text && r.default.createElement("div", {
                className: "text-body-medium",
                style: {
                    wordWrap: "break-word",
                    overflowWrap: "break-word"
                }
            }, s(i.text)), d && r.default.createElement(ei, {
                value: o,
                onValueChange: u
            }, r.default.createElement(es, {
                className: "width-full"
            }, null == (t = i.examples) ? void 0 : t.map((e, t) => {
                let a = "example-".concat(t);
                return r.default.createElement(eo, {
                    key: a,
                    value: a
                }, e.title || "Example ".concat(t + 1))
            })), null == (a = i.examples) ? void 0 : a.map((e, t) => {
                let a = "example-".concat(t);
                return r.default.createElement(eu, {
                    key: a,
                    value: a,
                    className: "padding-y-medium"
                }, (e => {
                    var t;
                    let a, l = null == (t = i.examples) ? void 0 : t[e];
                    if (!l) return null;
                    let n = (a = [], l.images && l.images.forEach(e => {
                        e.url && a.push({
                            type: "image",
                            url: e.url,
                            altText: e.altText
                        })
                    }), l.videos && l.videos.forEach(e => {
                        e.url && a.push({
                            type: "video",
                            url: e.url,
                            altText: e.altText
                        })
                    }), a);
                    return r.default.createElement("div", {
                        className: "flex flex-col gap-medium",
                        style: {
                            wordWrap: "break-word",
                            overflowWrap: "break-word"
                        }
                    }, l.title && r.default.createElement("h2", {
                        className: "text-title-large"
                    }, l.title), l.text && r.default.createElement("div", {
                        className: "text-body-medium"
                    }, s(l.text)), m(n))
                })(t))
            })), m(c))))
        },
        aD = e => {
            let {
                helpInfo: t
            } = e, {
                translate: a
            } = (0, i.useTranslation)(), [l, n] = (0, r.useState)(!1);
            return t.title || t.text || t.examples && t.examples.length > 0 ? r.default.createElement(r.default.Fragment, null, r.default.createElement("button", {
                className: "text-body-medium content-default cursor-pointer padding-[0px]",
                style: {
                    background: "none",
                    border: "none",
                    textDecoration: "underline",
                    marginLeft: "calc(var(--size-600) + var(--gap-medium))"
                },
                onClick: e => {
                    e.preventDefault(), n(!0)
                },
                type: "button"
            }, a("Label.ViewDetails")), r.default.createElement(aM, {
                open: l,
                onClose: () => n(!1),
                helpInfo: t
            })) : null
        },
        aL = (0, o.makeStyles)()(() => ({
            questionText: {
                display: "inline",
                "& p": {
                    display: "inline",
                    margin: 0
                }
            }
        })),
        a_ = e => {
            let {
                questionText: t,
                helpInfo: a,
                children: l
            } = e, {
                translate: n
            } = (0, i.useTranslation)(), {
                parseText: s
            } = tY(), {
                classes: o
            } = aL(), [u, d] = (0, r.useState)(!1), {
                shouldUseV2: c
            } = ak().questionnaireVersion, m = c && a && (a.title || a.text || a.examples && a.examples.length > 0);
            return r.default.createElement(r.default.Fragment, null, r.default.createElement(p.Grid, {
                item: !0
            }, r.default.createElement("div", {
                className: "inline-flex items-center flex-wrap gap-[4px]"
            }, r.default.createElement("span", {
                className: o.questionText
            }, s(t.trim(), {
                includeLineBreaks: !0
            }), m && r.default.createElement("button", {
                className: "margin-left-[4px] text-body-medium content-default cursor-pointer",
                style: {
                    background: "none",
                    border: "none",
                    padding: 0,
                    textDecoration: "underline"
                },
                onClick: e => {
                    e.preventDefault(), d(!0)
                },
                type: "button"
            }, n("Label.ViewDetails")))), l), m && a && r.default.createElement(aM, {
                open: u,
                onClose: () => {
                    d(!1)
                },
                helpInfo: a
            }))
        },
        aO = e => {
            let {
                translationKey: t
            } = e, {
                translate: a
            } = (0, i.useTranslation)();
            return r.default.createElement(u.Typography, {
                variant: "body2",
                color: "error",
                display: "block"
            }, a(t))
        },
        aB = e => {
            let {
                validatedAnswers: t,
                errors: a,
                question: l,
                updateAnswer: n,
                depth: i = 0,
                questionComponent: s
            } = e, {
                shouldUseV2: o
            } = ak().questionnaireVersion, {
                traverseQuestionsForQuestionIds: d,
                traverseSectionsForQuestionIds: c
            } = aR(), m = t.find(e => e.questionId === l.id), f = (e => {
                if (e) {
                    let t = JSON.parse(e);
                    if (t && Array.isArray(t)) return t
                }
                return []
            })(null == m ? void 0 : m.value), E = !!a[l.id], v = l.options.filter(e => {
                var t;
                return f.includes(null != (t = e.id) ? t : "")
            }), b = ax(v.reduce((e, t) => {
                var a;
                return [...e, ...null != (a = t.childQuestions) ? a : []]
            }, [])), h = ab(v.reduce((e, t) => {
                var a;
                return [...e, ...null != (a = t.childSections) ? a : []]
            }, [])), x = (e, t) => {
                let a = f.filter(e => !t.includes(e)),
                    r = l.options.filter(e => {
                        var t;
                        return a.includes(null != (t = e.id) ? t : "")
                    }),
                    i = ax(r.reduce((e, t) => {
                        var a;
                        return [...e, ...null != (a = t.childQuestions) ? a : []]
                    }, [])),
                    s = ab(r.reduce((e, t) => {
                        var a;
                        return [...e, ...null != (a = t.childSections) ? a : []]
                    }, [])),
                    o = d(i),
                    u = c(s);
                n(e, JSON.stringify(t), [...o, ...u])
            }, S = e => {
                e.target.checked ? x(l.id, [...f, e.target.name]) : x(l.id, f.filter(t => t !== e.target.name))
            };
            return o ? r.default.createElement("section", null, r.default.createElement(p.Grid, {
                container: !0,
                direction: "column"
            }, r.default.createElement(a_, {
                questionText: l.text,
                helpInfo: l.helpInfo
            }, E && r.default.createElement(aO, {
                translationKey: "Message.MustChooseOption"
            })), r.default.createElement("div", {
                className: "flex flex-col gap-small margin-top-small"
            }, l.options.map(e => {
                var t;
                return r.default.createElement("div", {
                    key: e.id
                }, r.default.createElement(ey, {
                    label: null != (t = e.text) ? t : "",
                    size: "Medium",
                    placement: "Start",
                    isChecked: !!f && !!e.id && f.includes(e.id),
                    onCheckedChange: t => {
                        var a;
                        t ? x(l.id, [...f, null != (a = e.id) ? a : ""]) : x(l.id, f.filter(t => t !== e.id))
                    }
                }), e.helpInfo && r.default.createElement(aD, {
                    helpInfo: e.helpInfo
                }))
            }))), b.length > 0 && b.map(e => r.default.createElement(s, {
                key: e.id,
                validatedAnswers: t,
                errors: a,
                question: e,
                updateAnswer: n,
                depth: i + 1,
                isSubQuestion: !0
            })), h.length > 0 && h.map(e => r.default.createElement(aC, {
                validatedAnswers: t,
                errors: a,
                updateAnswer: n,
                section: e,
                depth: i + 1,
                key: e.id,
                questionComponent: s
            }))) : r.default.createElement("section", null, r.default.createElement(p.Grid, {
                container: !0,
                direction: "column"
            }, r.default.createElement(a_, {
                questionText: l.text,
                helpInfo: l.helpInfo
            }, E && r.default.createElement(aO, {
                translationKey: "Message.MustChooseOption"
            })), l.options.map(e => r.default.createElement(g.FormControlLabel, {
                key: e.id,
                value: e.id,
                control: r.default.createElement(y.Checkbox, {
                    checked: !!f && !!e.id && f.includes(e.id),
                    onChange: S,
                    name: e.id
                }),
                label: r.default.createElement(u.Typography, {
                    variant: "body1",
                    color: "primary"
                }, e.text)
            }))), b.length > 0 && b.map(e => r.default.createElement(s, {
                key: e.id,
                validatedAnswers: t,
                errors: a,
                question: e,
                updateAnswer: n,
                depth: i + 1,
                isSubQuestion: !0
            })), h.length > 0 && h.map(e => r.default.createElement(aT, {
                validatedAnswers: t,
                errors: a,
                updateAnswer: n,
                section: e,
                depth: i + 1,
                key: e.id,
                questionComponent: s
            })))
        },
        aq = (0, o.makeStyles)()(() => ({
            radioGroupContainer: {
                margin: "var(--gap-medium) 0"
            }
        })),
        aP = e => {
            let {
                validatedAnswers: t,
                question: a,
                updateAnswer: l,
                errors: n,
                depth: i = 0,
                questionComponent: s
            } = e, {
                shouldUseV2: o
            } = ak().questionnaireVersion, {
                traverseQuestionsForQuestionIds: d,
                traverseSectionsForQuestionIds: c
            } = aR(), m = t.find(e => e.questionId === a.id), f = null == m ? null : JSON.parse(m.value), y = !!n[a.id], b = a.options.find(e => e.id === f), h = ax(null == b ? void 0 : b.childQuestions), x = ab(null == b ? void 0 : b.childSections), {
                classes: {
                    radioGroupContainer: S
                }
            } = aq();
            return o ? r.default.createElement("section", null, r.default.createElement(p.Grid, {
                container: !0,
                direction: "column"
            }, r.default.createElement(a_, {
                questionText: a.text,
                helpInfo: a.helpInfo
            }, y && r.default.createElement(aO, {
                translationKey: "Message.MustChooseOption"
            })), r.default.createElement(p.Grid, {
                className: S,
                item: !0
            }, r.default.createElement(eM, {
                value: null != f ? f : void 0,
                onValueChange: e => {
                    let t = d(h),
                        n = c(x);
                    l(a.id, JSON.stringify(e), [...t, ...n])
                },
                size: "Medium",
                placement: "Start",
                className: "gap-small"
            }, a.options.map(e => {
                var t, a;
                return r.default.createElement("div", {
                    key: e.id
                }, r.default.createElement(eD, {
                    value: null != (t = e.id) ? t : "",
                    label: null != (a = e.text) ? a : ""
                }), e.helpInfo && r.default.createElement(aD, {
                    helpInfo: e.helpInfo
                }))
            })))), h.length > 0 && h.map(e => r.default.createElement(s, {
                key: e.id,
                validatedAnswers: t,
                errors: n,
                question: e,
                updateAnswer: l,
                depth: i + 1,
                isSubQuestion: !0
            })), x.length > 0 && x.map(e => r.default.createElement(aC, {
                validatedAnswers: t,
                errors: n,
                updateAnswer: l,
                section: e,
                depth: i + 1,
                key: e.id,
                questionComponent: s
            }))) : r.default.createElement("section", null, r.default.createElement(p.Grid, {
                container: !0,
                direction: "column"
            }, r.default.createElement(a_, {
                questionText: a.text,
                helpInfo: a.helpInfo
            }, y && r.default.createElement(aO, {
                translationKey: "Message.MustChooseOption"
            })), r.default.createElement(p.Grid, {
                className: S,
                item: !0
            }, r.default.createElement(E.RadioGroup, {
                name: "overview",
                value: f,
                onChange: e => {
                    let t = d(h),
                        n = c(x);
                    l(a.id, JSON.stringify(e.target.value), [...t, ...n])
                }
            }, a.options.map(e => {
                var t;
                return r.default.createElement(g.FormControlLabel, {
                    key: e.id,
                    value: e.id,
                    control: r.default.createElement(v.Radio, {
                        "aria-label": null != (t = e.text) ? t : "Error"
                    }),
                    label: r.default.createElement(u.Typography, {
                        variant: "body1",
                        color: "primary"
                    }, e.text)
                })
            })))), h.length > 0 && h.map(e => r.default.createElement(s, {
                key: e.id,
                validatedAnswers: t,
                errors: n,
                question: e,
                updateAnswer: l,
                depth: i + 1,
                isSubQuestion: !0
            })), x.length > 0 && x.map(e => r.default.createElement(aT, {
                validatedAnswers: t,
                errors: n,
                updateAnswer: l,
                section: e,
                depth: i + 1,
                key: e.id,
                questionComponent: s
            })))
        };

    function aF(e, a, l) {
        let n = "".concat("https://apis.roblox.com", "/").concat(e),
            r = t;
        return new tD.Configuration({
            robloxSiteDomain: "roblox.com",
            basePath: n,
            credentials: "include",
            enableMrRouter: !0,
            ...r && {
                unifiedLogger: r
            },
            ...null == l ? void 0 : l.middleware,
            ...(null == l ? void 0 : l.enableBoundAuthToken) !== void 0,
            ...(null == l ? void 0 : l.boundAuthTokenLoadTimeout) !== void 0,
            ...(null == l ? void 0 : l.boundAuthTokenDataTimeout) !== void 0
        })
    }
    let aU = () => {
            if (!a) {
                let e = aF("experience-questionnaire");
                a = {
                    questionnaireApi: new tM.QuestionnairesApi(e),
                    responseApi: new tM.ResponsesApi(e),
                    eligibilityApi: new tM.EligibilityApi(e),
                    metadataApi: new tM.MetadataApi(e),
                    questionnairesApiV2: new tR.QuestionnairesApi(e),
                    responsesApiV2: new tR.ResponsesApi(e)
                }
            }
            return a
        },
        aG = {
            getUniverseEligibility: e => aU().eligibilityApi.eligibilityGetUniverseEligibility({
                universeId: e
            }),
            getQuestionnaireStatus: () => aU().questionnaireApi.questionnairesGetQuestionnaireStatusForUser(),
            getLatestQuestionnaireIdForUniverse: e => aU().questionnaireApi.questionnairesGetLatestQuestionnaireIdForUniverse({
                universeId: e
            }),
            getSubmissionLatest: e => aU().responseApi.responsesGetLatestSubmission({
                universeId: e
            }),
            getQuestionnaireById: (e, t) => aU().questionnaireApi.questionnairesGetQuestionnaireById({
                questionnaireId: e,
                localeCode: t
            }),
            getAnswersByUniverseId: e => aU().responseApi.responsesGetActiveResponse({
                universeId: e
            }),
            async saveResponseByUniverseId(e, t, a) {
                await aU().responseApi.responsesSaveActiveResponse({
                    saveActiveResponseRequestBody: {
                        questionnaireId: t,
                        response: a
                    },
                    universeId: e
                })
            },
            validateResponse: async (e, t) => aU().responseApi.responsesValidateResponse({
                validateResponseRequestBody: {
                    questionnaireId: e,
                    response: t
                }
            }),
            getSubmissionPreview: async (e, t, a, l) => aU().responseApi.responsesPreviewDescriptors({
                previewSubmissionRequestBody: {
                    universeId: e,
                    questionnaireId: t,
                    response: a
                },
                localeCode: l
            }),
            submitResponseByUniverseId: (e, t, a) => aU().responseApi.responsesSubmitResponse({
                submitResponseRequestBody: {
                    questionnaireId: t,
                    response: a
                },
                universeId: e
            }),
            getMetadataStatus: e => aU().metadataApi.metadataGetUniverseMetadataStatus({
                universeId: e
            }),
            getQuestionnairePublishStatusList: e => aU().responseApi.responsesGetQuestionnairePublishStatusList({
                universeId: e
            })
        },
        aQ = e => {
            var t, a;
            let {
                validatedAnswers: l,
                question: n,
                updateAnswer: s,
                errors: o
            } = e, {
                translate: d
            } = (0, i.useTranslation)(), c = null != (t = null == (a = l.find(e => e.questionId === n.id)) ? void 0 : a.value) ? t : "", m = !!o[n.id];
            return r.default.createElement("section", null, r.default.createElement(p.Grid, {
                container: !0,
                direction: "column"
            }, r.default.createElement(a_, {
                questionText: n.text,
                helpInfo: n.helpInfo
            }, m && 0 === c.length && r.default.createElement(aO, {
                translationKey: "Message.TextBoxNotEmpty"
            }), m && n.validationType === tM.TextBoxValidationType.Email && r.default.createElement(aO, {
                translationKey: "Message.TextBoxNotValidEmail"
            })), r.default.createElement(p.Grid, {
                item: !0
            }, r.default.createElement(b.Input, {
                id: n.id,
                value: c,
                onChange: e => {
                    if (null === n.maxInputLength || e.target.value.length <= n.maxInputLength) throw Error("TextBox Questions are not currently supported")
                },
                error: m
            })), n.maxInputLength && c.length >= n.maxInputLength && r.default.createElement(p.Grid, {
                item: !0
            }, r.default.createElement(u.Typography, {
                variant: "body2",
                color: "secondary"
            }, d("Message.MaxLengthTextInput", {
                length: n.maxInputLength.toString()
            })))))
        },
        az = e => {
            let {
                validatedAnswers: t,
                errors: a,
                question: l,
                updateAnswer: n,
                depth: i = 0,
                questionComponent: s
            } = e;
            return r.default.createElement(r.default.Fragment, null, l.type === tX && r.default.createElement(aP, {
                validatedAnswers: t,
                updateAnswer: n,
                question: l,
                errors: a,
                depth: i,
                questionComponent: s
            }), l.type === tJ && r.default.createElement(aB, {
                validatedAnswers: t,
                updateAnswer: n,
                question: l,
                errors: a,
                depth: i,
                questionComponent: s
            }), l.type === t$ && r.default.createElement(aQ, {
                validatedAnswers: t,
                updateAnswer: n,
                question: l,
                errors: a
            }))
        },
        aH = e => {
            let {
                validatedAnswers: t,
                errors: a,
                question: l,
                updateAnswer: n,
                isSubQuestion: i,
                depth: s = 0
            } = e, o = (0, r.useRef)(null), [u, d] = (0, r.useState)(!1), c = (0, r.useContext)(am), {
                onQuestionViewed: m
            } = (0, r.useContext)(ac);
            (0, r.useEffect)(() => {
                let e = o.current;
                if (!e || !m || !c || "u" < typeof IntersectionObserver) return;
                let t = new IntersectionObserver(e => {
                    var t;
                    let [a] = e;
                    return d(null != (t = null == a ? void 0 : a.isIntersecting) && t)
                }, {
                    threshold: 0
                });
                return t.observe(e), () => {
                    t.disconnect(), d(!1)
                }
            }, [c, m]);
            let f = (0, r.useCallback)(e => {
                null == m || m(l.id, e)
            }, [m, l.id]);
            return ag(c && !!m && ("u" < typeof IntersectionObserver || u), f), r.default.createElement(av, {
                ref: o,
                isSubQuestion: i
            }, r.default.createElement(az, {
                validatedAnswers: t,
                errors: a,
                question: l,
                updateAnswer: n,
                depth: s,
                questionComponent: aH
            }))
        },
        aV = (0, o.makeStyles)()(e => ({
            accordionRoot: {
                border: "unset",
                borderBottom: "1px solid ".concat(e.palette.components.divider),
                "&.Mui-expanded": {
                    margin: 0
                },
                "::before": {
                    content: "none"
                }
            },
            accordionSummaryContent: {
                justifyContent: "space-between",
                alignItems: "center",
                paddingRight: "var(--padding-small)"
            }
        })),
        aW = e => {
            let {
                questions: t,
                id: a,
                name: l,
                answers: n,
                errors: i,
                children: s,
                onChange: o,
                updateAnswer: d,
                expanded: c = !1,
                completed: m = !1,
                violated: f = !1
            } = e, {
                onSectionViewed: p
            } = (0, r.useContext)(ac), g = r.default.useCallback(e => {
                null == p || p(a, e)
            }, [a, p]);
            ag(c && !!p, g);
            let {
                classes: {
                    accordionRoot: y,
                    accordionSummaryContent: E
                }
            } = aV();
            return r.default.createElement(h.Accordion, {
                square: !0,
                variant: "outlined",
                expanded: c,
                onChange: () => o(a),
                classes: {
                    root: y
                }
            }, r.default.createElement(x.AccordionSummary, {
                classes: {
                    content: E
                },
                id: a,
                "data-testid": "".concat(a, "-summary")
            }, r.default.createElement(u.Typography, {
                variant: "h5"
            }, l), f && r.default.createElement(S.ErrorOutlineOutlinedIcon, {
                color: "error"
            }), !f && m && r.default.createElement(T.CheckCircleOutlineIcon, {
                color: "success"
            })), r.default.createElement(C.AccordionDetails, null, r.default.createElement(ap, {
                isActive: c
            }, t.map(e => r.default.createElement(aH, {
                errors: i,
                validatedAnswers: n,
                key: e.id,
                question: e,
                updateAnswer: d
            })), r.default.createElement(tz, {
                gap: 10
            }, s))))
        },
        aj = e => {
            setTimeout(() => {
                let t = document.getElementById(e);
                if (!t) return;
                let a = t.parentElement;
                for (; a;) {
                    let {
                        overflowY: e
                    } = window.getComputedStyle(a);
                    if ("auto" === e || "scroll" === e) break;
                    a = a.parentElement
                }
                if (!a) return void t.scrollIntoView({
                    block: "start",
                    behavior: "smooth"
                });
                let l = a.getBoundingClientRect(),
                    n = 0;
                a.querySelectorAll(".sticky").forEach(e => {
                    let t = window.getComputedStyle(e),
                        a = parseFloat(t.top);
                    "sticky" === t.position && a <= 0 && (n = Math.max(n, e.offsetHeight))
                });
                let r = t.getBoundingClientRect();
                a.scrollTo({
                    top: a.scrollTop + r.top - l.top - n,
                    behavior: "smooth"
                })
            }, 300)
        };
    var aK = (0, i.withTranslation)(e => {
        var t;
        let {
            questionnaire: a,
            answers: l,
            errors: n,
            isSaving: s,
            setAnswers: o,
            send: d,
            save: c,
            goToLanding: m,
            omitActionBar: f,
            onExpandedSectionChange: p,
            violatedSectionIds: g
        } = e, y = a.sections.length, {
            parseText: E
        } = tY(), {
            translate: v
        } = (0, i.useTranslation)(), b = null == (t = a.sections[0]) ? void 0 : t.description, h = (0, r.useMemo)(() => a.sections.map(e => {
            let {
                id: t
            } = e;
            return t
        }), [a.sections]), [x, S] = (0, r.useState)(() => {
            var e;
            return null != (e = h[0]) ? e : null
        });
        (0, r.useEffect)(() => {
            !h.length || null !== x && (x && h.includes(x) || S(h[0]))
        }, [x, h]), (0, r.useEffect)(() => {
            null == p || p(x)
        }, [x, p]), (0, r.useLayoutEffect)(() => {
            if (!(null == g ? void 0 : g.size)) return;
            let e = h.find(e => g.has(e));
            e && (S(e), aj(e))
        }, [g, h]);
        let T = (0, r.useCallback)(e => {
                let t = null != e ? e : l,
                    {
                        sections: n
                    } = a,
                    r = n.findIndex(e => e.id === x),
                    i = as({
                        sections: n,
                        currentIndex: r,
                        answers: t,
                        violatedSectionIds: g
                    });
                i ? (S(i.id), aj(i.id)) : S(null)
            }, [x, l, a, g]),
            C = (0, r.useCallback)((e, t, n, r) => {
                let i = a.sections.find(t => t.id === e),
                    s = au(l, t, n, r);
                o(t, s), c(s), ad({
                    section: i,
                    priorAnswers: l,
                    newAnswers: s,
                    questionId: t
                }) && T(s)
            }, [l, T, a.sections, c, o]),
            N = (0, W.useQueryClient)(),
            I = (0, r.useCallback)(async () => {
                await c(), await N.invalidateQueries({
                    queryKey: ["experienceQuestionnaire"]
                }), m()
            }, [m, N, c]),
            {
                completedSectionsMap: A,
                completedSectionsCount: k
            } = (0, r.useMemo)(() => {
                let e = {},
                    t = 0;
                return a.sections.forEach(a => {
                    let n = ai(a, l);
                    e[a.id] = n, n && (t += 1)
                }), {
                    completedSectionsMap: e,
                    completedSectionsCount: t
                }
            }, [l, a.sections]);
        return y ? r.default.createElement(r.default.Fragment, null, r.default.createElement(u.Typography, null, v("Label.SectionsCompleted", {
            completed: k.toString(),
            total: y.toString()
        })), b && r.default.createElement("div", null, E(b)), r.default.createElement("div", null, a.sections.map(e => {
            let {
                id: t,
                name: a,
                questions: i
            } = e;
            return r.default.createElement(aW, {
                key: t,
                id: t,
                name: a,
                errors: n,
                answers: l,
                completed: A[t],
                violated: null == g ? void 0 : g.has(t),
                questions: i,
                expanded: x === t,
                onChange: e => {
                    S(t => t === e ? null : e)
                },
                updateAnswer: (e, a, l) => {
                    C(t, e, a, l)
                }
            })
        })), !f && r.default.createElement(tz, {
            gap: 12
        }, r.default.createElement(w.Button, {
            disabled: k !== y || s,
            variant: "contained",
            color: "primaryBrand",
            loading: s,
            onClick: d
        }, v("Button.Continue")), r.default.createElement(w.Button, {
            disabled: s,
            loading: s,
            variant: "contained",
            color: "secondary",
            onClick: I
        }, v("Action.SaveDraft")))) : null
    }, [tj.DeveloperQuestionnaire, tj.CommonUIControls, tj.Controls]);
    let aY = {
            width: "100%",
            height: "100%"
        },
        aX = (0, o.makeStyles)()(e => ({
            mainGrid: {
                ...aY,
                maxWidth: "700px",
                minWidth: 0,
                marginTop: e.spacing(1),
                display: "flex",
                flexDirection: "column"
            },
            sectionLabel: {
                fontWeight: "bold",
                marginBottom: e.spacing(2)
            },
            complianceText: {
                width: "50%",
                marginBottom: e.spacing(2)
            },
            table: {
                marginBottom: e.spacing(3)
            },
            restrictionsTable: {
                tableLayout: "fixed"
            },
            tableContainer: {
                width: "100%",
                maxWidth: "100%",
                minWidth: 0,
                overflowX: "auto"
            },
            restrictionsFirstColumnHeader: {
                width: "40%"
            },
            restrictionsHeaderText: {
                minWidth: 0,
                overflowWrap: "anywhere"
            },
            cell: {
                width: "50%"
            },
            cellIncreaseMaturity: {
                display: "flex",
                justifyContent: "space-between",
                alignItems: "center"
            },
            firstColumnHeader: {
                width: "50%"
            },
            tooltip: {
                display: "flex",
                alignItems: "center",
                minWidth: 0
            },
            tooltipIcon: {
                marginLeft: "8px",
                flexShrink: 0
            },
            boldText: {
                fontWeight: 450
            },
            unorderedList: {
                margin: "0px"
            },
            commonTextDiv: {
                marginTop: "24px"
            },
            guidelinesImpact: {
                marginTop: "16px"
            }
        }));
    async function aJ(e) {
        try {
            return await e()
        } catch (a) {
            let t = function(e) {
                if (e && "object" == typeof e && "status" in e) {
                    let {
                        status: t
                    } = e;
                    return "number" == typeof t ? t : void 0
                }
            }(a);
            if (t === t_.StatusCodes.BAD_GATEWAY || t === t_.StatusCodes.GATEWAY_TIMEOUT || t === t_.StatusCodes.REQUEST_TIMEOUT || t === t_.StatusCodes.INTERNAL_SERVER_ERROR || t === t_.StatusCodes.SERVICE_UNAVAILABLE) return await e();
            throw a
        }
    }
    let a$ = new class {
            getApi() {
                if (!this.experienceGuidelinesServiceApi) {
                    let e = aF("experience-guidelines-service");
                    this.experienceGuidelinesServiceApi = new tL.ExperienceGuidelinesServiceAPIApi(e)
                }
                return this.experienceGuidelinesServiceApi
            }
            getDetailedGuidelines(e) {
                return this.getApi().v1beta1DetailedGuidelinesPost({
                    v1Beta1GetDetailedGuidelinesRequest: {
                        universeId: e
                    }
                })
            }
            getDetailedGuidelinesV2(e) {
                return this.getApi().v2beta1DetailedGuidelinesPost({
                    v2Beta1GetDetailedGuidelinesRequest: {
                        universeId: e
                    }
                })
            }
            saveCreatorOverrides(e, t) {
                return this.getApi().v1beta1CreatorOverridesPost({
                    v1Beta1SaveCreatorOverridesRequest: {
                        universeId: e,
                        creatorOverrides: t
                    }
                })
            }
            async multiGetAgeRecommendations(e) {
                let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                    a = {
                        v1Beta1MultiGetAgeRecommendationRequest: {
                            universeIds: e
                        }
                    };
                return t ? aJ(() => this.getApi().v1beta1MultiAgeRecommendationPost(a)) : this.getApi().v1beta1MultiAgeRecommendationPost(a)
            }
            async multiGetCreatorEligibility(e, t, a) {
                let l = arguments.length > 3 && void 0 !== arguments[3] && arguments[3],
                    n = {
                        v1Beta1MultiGetCreatorEligibilityRequest: {
                            universeId: e,
                            userIds: t,
                            action: a
                        }
                    };
                return l ? aJ(() => this.getApi().v1beta1MultiCreatorEligibilityPost(n)) : this.getApi().v1beta1MultiCreatorEligibilityPost(n)
            }
            getCreatorControlsAgeRestriction(e) {
                return this.getApi().v1beta1CreatorControlsAgeRestrictionUniverseIdGet({
                    universeId: e
                })
            }
            saveCreatorControlsAgeRestriction(e, t) {
                return this.getApi().v1beta1CreatorControlsAgeRestrictionUniverseIdPost({
                    universeId: e,
                    v1Beta1SaveCreatorControlsAgeRestrictionRequest: {
                        universeId: e,
                        ageRestriction: t
                    }
                })
            }
            getCreatorControlsGeoRestriction(e) {
                return this.getApi().v1beta1CreatorControlsGeoRestrictionUniverseIdGet({
                    universeId: e
                })
            }
            saveCreatorControlsGeoRestriction(e, t) {
                return this.getApi().v1beta1CreatorControlsGeoRestrictionUniverseIdPost({
                    universeId: e,
                    v1Beta1SaveCreatorControlsGeoRestrictionRequest: {
                        universeId: e,
                        geoRestriction: t
                    }
                })
            }
            getAllCountries() {
                let e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
                return e ? aJ(() => this.getApi().v1beta1CountriesGet()) : this.getApi().v1beta1CountriesGet()
            }
            constructor() {
                (0, n._)(this, "experienceGuidelinesServiceApi", void 0)
            }
        },
        aZ = e => {
            let {
                disabled: t,
                tooltipMsg: a,
                onClick: l
            } = e, {
                translate: n
            } = (0, i.useTranslation)(), s = r.default.createElement(w.Button, {
                size: "small",
                color: "secondary",
                variant: "contained",
                disabled: t,
                onClick: l
            }, n("Title.IncreaseMaturity") || "Increase maturity");
            return void 0 !== a && t && (s = r.default.createElement(M.Tooltip, {
                "data-testid": "button-toolTip",
                title: a,
                arrow: !0
            }, r.default.createElement("span", null, s))), s
        },
        a0 = e => {
            var t;
            let {
                open: a,
                creatorOverrides: l,
                onCancel: n,
                onSubmit: s,
                isSubmitting: o,
                onSelectionChange: d,
                selected: c
            } = e, {
                translate: m
            } = (0, i.useTranslation)();
            return r.default.createElement(N.Dialog, {
                open: a,
                maxWidth: "Medium",
                onClose: n
            }, r.default.createElement(I.DialogTitle, null, m("Title.IncreaseMaturityDialog") || "Please indicate your preferred Content Maturity"), r.default.createElement(A.DialogContent, null, r.default.createElement(k.DialogContentText, {
                id: "dialog-content-text-describe-id"
            }, r.default.createElement(u.Typography, {
                align: "center"
            }, m("Message.IncreaseMaturityDialog") || "The content maturity label displayed for your experience will always be the higher label between the questionnaire result and the content maturity label selected here.")), r.default.createElement(E.RadioGroup, {
                value: c,
                onChange: d
            }, (null == l ? void 0 : l.allowedCreatorOverratedAgeRecommendations) && (null == l || null == (t = l.allowedCreatorOverratedAgeRecommendations) ? void 0 : t.map(e => r.default.createElement(g.FormControlLabel, {
                key: e.displayName,
                value: e.minimumAge,
                label: r.default.createElement(u.Typography, {
                    variant: "body1",
                    color: "primary"
                }, e.displayName),
                control: r.default.createElement(v.Radio, {
                    "aria-label": e.displayName
                })
            }))), r.default.createElement(g.FormControlLabel, {
                value: "-1",
                label: r.default.createElement(u.Typography, {
                    variant: "body1",
                    color: "primary"
                }, "Use questionnaire result"),
                control: r.default.createElement(v.Radio, {
                    "aria-label": "Use questionnaire result"
                })
            }))), r.default.createElement(R.DialogActions, null, r.default.createElement(w.Button, {
                size: "large",
                variant: "contained",
                "aria-label": "Cancel",
                color: "secondary",
                onClick: n
            }, "Cancel"), r.default.createElement(w.Button, {
                size: "large",
                variant: "contained",
                "aria-label": m("Button.Submit"),
                color: "primaryBrand",
                loading: o,
                onClick: s
            }, m("Button.Submit"))))
        },
        a1 = e => {
            let {
                translationKey: t
            } = e, {
                translate: a
            } = (0, i.useTranslation)(), {
                classes: {
                    tooltipIcon: l
                }
            } = aX();
            return r.default.createElement(M.Tooltip, {
                arrow: !0,
                title: a(t),
                placement: "bottom"
            }, r.default.createElement(D.InfoOutlinedIcon, {
                fontSize: "small",
                className: l
            }))
        };

    function a2() {
        let {
            enqueue: e,
            close: t
        } = (0, L.useSnackbar)(), {
            translate: a
        } = (0, i.useTranslation)();
        return {
            showToastNetworkError: (0, r.useCallback)(l => {
                a && e({
                    anchorOrigin: {
                        vertical: "top",
                        horizontal: "center"
                    },
                    children: r.default.createElement(_.Alert, {
                        severity: "error"
                    }, r.default.createElement(O.AlertTitle, null, a("Title.NetworkError")), a("Message.NetworkError", {
                        status: "".concat(l)
                    })),
                    autoHide: !0,
                    onClose: t
                })
            }, [t, e, a]),
            showToastUserError: (0, r.useCallback)((l, n) => {
                a && e({
                    anchorOrigin: {
                        vertical: "top",
                        horizontal: "center"
                    },
                    children: r.default.createElement(_.Alert, {
                        severity: "error"
                    }, r.default.createElement(O.AlertTitle, null, a(l)), a(n)),
                    autoHide: !0,
                    onClose: t
                })
            }, [t, e, a]),
            showToastSuccess: (0, r.useCallback)(l => {
                a && e({
                    anchorOrigin: {
                        vertical: "top",
                        horizontal: "center"
                    },
                    children: r.default.createElement(_.Alert, {
                        severity: "success"
                    }, r.default.createElement(O.AlertTitle, null, a("Title.SubmitSuccess")), a(l ? "Message.SubmitSuccess" : "Message.SaveSuccess")),
                    autoHide: !0,
                    onClose: t
                })
            }, [t, e, a])
        }
    }

    function a4(e) {
        return e && "object" == typeof e && "response" in e ? e.response : e && "object" == typeof e && "json" in e ? e : null
    }
    let a3 = {
            async attemptNetworkRequestWithRetry(e) {
                try {
                    return await e()
                } catch (l) {
                    var t;
                    let a = null == (t = a4(l)) ? void 0 : t.status;
                    if (a === t_.StatusCodes.BAD_GATEWAY || a === t_.StatusCodes.GATEWAY_TIMEOUT) return await e();
                    throw l
                }
            },
            handleNetworkRequestFailure(e, t, a) {
                var l;
                let n = null == (l = a4(e)) ? void 0 : l.status;
                if (!n) return void t("Error.UnknownError", "Message.PleaseTryAgain");
                let r = e && "object" == typeof e && "body" in e;
                n === t_.StatusCodes.BAD_REQUEST && r || t_.StatusCodes.NOT_FOUND, a(n)
            }
        },
        a5 = e => {
            var t, a;
            let {
                universeId: l,
                contentDescriptors: n,
                displayName: o,
                creatorOverrides: d,
                isContentMaturityEnabled: c,
                isIncreaseMaturityEnabled: m
            } = e, {
                translate: f
            } = (0, i.useTranslation)(), {
                classes: {
                    table: p,
                    cell: g,
                    cellIncreaseMaturity: y,
                    firstColumnHeader: E,
                    tooltip: v
                }
            } = aX(), {
                showToastNetworkError: b,
                showToastUserError: h
            } = a2(), x = (0, s.useRouter)(), [S, T] = (0, r.useState)(!1), [C, w] = (0, r.useState)((null != (t = null == d || null == (a = d.creatorOverratedAgeRecommendation) ? void 0 : a.minimumAge) ? t : -1).toString()), N = (0, r.useCallback)(() => {
                var e, t;
                w((null != (e = null == d || null == (t = d.creatorOverratedAgeRecommendation) ? void 0 : t.minimumAge) ? e : -1).toString()), T(!0)
            }, [d]), I = (0, r.useCallback)(() => {
                var e, t;
                T(!1), w((null != (e = null == d || null == (t = d.creatorOverratedAgeRecommendation) ? void 0 : t.minimumAge) ? e : -1).toString())
            }, [d]), A = (0, r.useCallback)(async () => {
                try {
                    await a3.attemptNetworkRequestWithRetry(() => a$.saveCreatorOverrides(l, (0, tL.V1Beta1CreatorOverridesFromJSON)({
                        creatorOverratedAgeRecommendation: {
                            minimumAge: Number(C)
                        }
                    })))
                } catch (e) {
                    a3.handleNetworkRequestFailure(e, h, b)
                }
            }, [l, b, h, C]), [k, R] = (0, r.useState)(!1), M = (0, r.useCallback)(() => {
                (async function() {
                    R(!0);
                    try {
                        await A()
                    } finally {
                        R(!1)
                    }
                })().then(() => {
                    T(!1), x.reload()
                })
            }, [A]);
            return r.default.createElement(B.Table, {
                "aria-label": f("Title.ComplianceTable"),
                className: p
            }, r.default.createElement(q.TableHead, null, r.default.createElement(P.TableRow, null, r.default.createElement(F.TableCell, {
                className: E
            }, r.default.createElement("div", {
                className: v
            }, r.default.createElement(u.Typography, {
                variant: "tableHead",
                display: "inline"
            }, f(c ? "Title.ContentMaturityBracket" : "Title.AgeRecommendationBracket")), r.default.createElement(a1, {
                translationKey: c ? "Tooltip.ContentMaturityLabelRestrictionHeader" : "Tooltip.AgeRecommendationRestrictionHeader"
            }))), r.default.createElement(F.TableCell, {
                className: g
            }, r.default.createElement("div", {
                className: v
            }, r.default.createElement(u.Typography, {
                variant: "tableHead"
            }, f("TableHead.Descriptors")), r.default.createElement(a1, {
                translationKey: "Tooltip.ContentDescriptorRestrictionHeader"
            }))))), r.default.createElement(U.TableBody, null, r.default.createElement(P.TableRow, null, r.default.createElement(F.TableCell, {
                className: g
            }, r.default.createElement("div", {
                className: y
            }, r.default.createElement(u.Typography, {
                variant: "body2"
            }, null != o ? o : f("Guidelines.UnratedDisplayName")), m && d && r.default.createElement(aZ, {
                disabled: (null == d ? void 0 : d.allowedCreatorOverratedAgeRecommendations) == null || (null == d ? void 0 : d.allowedCreatorOverratedAgeRecommendations.length) <= 0,
                tooltipMsg: o ? f("Tooltip.CannotIncreaseMaturity") || "Your experience’s maturity level cannot be increased further" : f("Tooltip.RetakeQuestionnaireToIncreaseMaturity") || "Please submit your answers again before increasing the maturity level",
                onClick: N
            }))), r.default.createElement(F.TableCell, {
                className: g
            }, n.length > 0 ? r.default.createElement(u.Typography, {
                variant: "body2"
            }, n.map(e => r.default.createElement("div", {
                key: e.name
            }, e.displayName))) : r.default.createElement(u.Typography, {
                variant: "body2"
            }, f("Message.NoFeatures"))))), r.default.createElement(a0, {
                open: S,
                creatorOverrides: d,
                onCancel: I,
                onSubmit: M,
                isSubmitting: k,
                onSelectionChange: (e, t) => {
                    w(t)
                },
                selected: C
            }))
        },
        a6 = e => {
            let {
                restrictedCountries: t,
                isContentMaturityEnabled: a
            } = e, {
                translate: l
            } = (0, i.useTranslation)(), {
                classes: {
                    table: n,
                    restrictionsTable: s,
                    tableContainer: o,
                    restrictionsFirstColumnHeader: d,
                    restrictionsHeaderText: c,
                    tooltip: m
                }
            } = aX();
            return r.default.createElement("div", {
                className: o
            }, r.default.createElement(B.Table, {
                "aria-label": l("Title.ComplianceTable"),
                className: "".concat(n, " ").concat(s)
            }, r.default.createElement(q.TableHead, null, r.default.createElement(P.TableRow, null, r.default.createElement(F.TableCell, {
                className: d
            }, r.default.createElement("div", {
                className: m
            }, r.default.createElement(u.Typography, {
                className: c,
                variant: "tableHead"
            }, l("Title.GuidelinesRestrictedCountries")), r.default.createElement(a1, {
                translationKey: a ? "Tooltip.MaturityNonCompliantRegionRestrictionHeader" : "Tooltip.NonCompliantRegionRestrictionHeader"
            }))), r.default.createElement(F.TableCell, null, r.default.createElement("div", {
                className: m
            }, r.default.createElement(u.Typography, {
                className: c,
                variant: "tableHead"
            }, l("TableHead.Descriptors")), r.default.createElement(a1, {
                translationKey: "Tooltip.ContentDescriptorRestrictionHeader"
            }))), r.default.createElement(F.TableCell, null, r.default.createElement("div", {
                className: m
            }, r.default.createElement(u.Typography, {
                className: c,
                variant: "tableHead"
            }, l("Title.GuidelinesAgeRestriction")), r.default.createElement(a1, {
                translationKey: "Tooltip.AgeRestrictionHeader"
            }))))), r.default.createElement(U.TableBody, null, t.length > 0 ? t.sort((e, t) => e.countryCode.localeCompare(t.countryCode)).map(e => r.default.createElement(P.TableRow, {
                key: "".concat(e.countryCode, "-").concat(e.displayDescriptorName)
            }, r.default.createElement(F.TableCell, null, r.default.createElement(u.Typography, {
                variant: "body2"
            }, e.displayCountryName)), r.default.createElement(F.TableCell, null, r.default.createElement(u.Typography, {
                variant: "body2"
            }, r.default.createElement("div", null, e.displayDescriptorName))), r.default.createElement(F.TableCell, null, r.default.createElement(u.Typography, {
                variant: "body2"
            }, r.default.createElement("div", null, e.displayAgeRangeName))))) : r.default.createElement(P.TableRow, null, r.default.createElement(F.TableCell, null, r.default.createElement(u.Typography, {
                variant: "body2"
            }, l("Message.NoRestrictedCountries"))), r.default.createElement(F.TableCell, null, r.default.createElement(u.Typography, {
                variant: "body2"
            }, l("Message.NoFeatures"))), r.default.createElement(F.TableCell, null, r.default.createElement(u.Typography, {
                variant: "body2"
            }))))))
        },
        a7 = e => {
            let {
                universeId: t,
                restrictedCountries: a,
                ageDisplay: l,
                ageContentDescriptors: n,
                creatorOverrides: i,
                isContentMaturityEnabled: s,
                isIncreaseMaturityEnabled: o
            } = e;
            return r.default.createElement(r.default.Fragment, null, r.default.createElement(a5, {
                universeId: t,
                contentDescriptors: n,
                displayName: l,
                creatorOverrides: i,
                isContentMaturityEnabled: s,
                isIncreaseMaturityEnabled: o
            }), r.default.createElement(a6, {
                restrictedCountries: a,
                isContentMaturityEnabled: s
            }))
        },
        a8 = () => (l || (l = new tO.IarcActivityServiceAPIApi(aF("iarc-activity-service"))), l),
        a9 = [t_.StatusCodes.BAD_GATEWAY, t_.StatusCodes.GATEWAY_TIMEOUT],
        le = (e, t) => {
            var a;
            if (e > 1) return !1;
            let l = null == (a = a4(t)) ? void 0 : a.status;
            return void 0 !== l && a9.includes(l)
        },
        lt = e => (0, j.useQuery)({
            queryKey: ["experienceQuestionnaire", "getLatestQuestionnaireIdForUniverse", e],
            queryFn: () => aG.getLatestQuestionnaireIdForUniverse(e),
            retry: le
        }),
        la = (e, t) => {
            let a = async e => {
                let a = await aG.getQuestionnaireById(e, t);
                return a.questionnaire ? aS(a.questionnaire) : null
            };
            return (0, j.useQuery)({
                queryKey: ["experienceQuestionnaire", "getQuestionnaireById", e],
                queryFn: void 0 === e ? K.skipToken : () => a(e),
                retry: le
            })
        },
        ll = e => (0, j.useQuery)({
            queryKey: ["experienceQuestionnaire", "getAnswersByUniverseId", e],
            queryFn: async () => {
                var t, a, l;
                try {
                    let l = await aG.getAnswersByUniverseId(e);
                    if (null == (t = l.response) ? void 0 : t.answers) return ah((null == (a = l.response) ? void 0 : a.answers) || [])
                } catch (e) {
                    if (404 !== (null == (l = a4(e)) ? void 0 : l.status)) throw e
                }
                return []
            },
            retry: le,
            gcTime: 0,
            refetchOnMount: "always"
        }),
        ln = e => (0, j.useQuery)({
            queryKey: ["experienceQuestionnaire", "getSubmissionLatest", e],
            queryFn: async () => {
                try {
                    return await aG.getSubmissionLatest(e)
                } catch (e) {
                    var t;
                    if (404 === (null == (t = a4(e)) ? void 0 : t.status)) return null;
                    throw e
                }
            },
            retry: le
        }),
        lr = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return (0, Y.useMutation)({
                mutationKey: ["experienceQuestionnaire", "saveResponseByUniverseId"],
                mutationFn: t => {
                    let {
                        questionnaireId: a,
                        answers: l
                    } = t;
                    return aG.saveResponseByUniverseId(e, a, {
                        answers: l
                    })
                },
                ...t
            })
        },
        li = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return (0, Y.useMutation)({
                mutationKey: ["experienceQuestionnaireV2", "submitAdditionalResponse", e],
                mutationFn: t => {
                    let a, {
                        questionnaireId: l,
                        answers: n
                    } = t;
                    return a = {
                        questionnaireId: l,
                        response: {
                            answers: n
                        }
                    }, aU().responsesApiV2.responsesSubmitResponse({
                        universeId: e,
                        submitResponseRequestBody: a
                    })
                },
                ...t
            })
        },
        ls = e => (0, j.useQuery)({
            queryKey: ["experienceGuidelinesService", "getDetailedGuidelines", e],
            queryFn: async () => {
                try {
                    return await a$.getDetailedGuidelines(e)
                } catch (e) {
                    var t;
                    if (404 === (null == (t = a4(e)) ? void 0 : t.status)) return null;
                    throw e
                }
            },
            retry: le
        }),
        lo = e => (0, j.useQuery)({
            queryKey: ["experienceGuidelinesService", "getDetailedGuidelinesV2", e],
            queryFn: async () => {
                try {
                    return await a$.getDetailedGuidelinesV2(e)
                } catch (e) {
                    var t;
                    if (404 === (null == (t = a4(e)) ? void 0 : t.status)) return null;
                    throw e
                }
            },
            retry: le
        }),
        lu = e => (0, j.useQuery)({
            queryKey: ["experienceQuestionnaire", "getQuestionnairePublishStatusList", e],
            queryFn: async () => {
                try {
                    return await aG.getQuestionnairePublishStatusList(e)
                } catch (e) {
                    var t;
                    if (404 === (null == (t = a4(e)) ? void 0 : t.status)) return null;
                    throw e
                }
            },
            retry: le
        }),
        ld = e => (0, j.useQuery)({
            queryKey: ["experienceQuestionnaire", "getMetadataStatus", e],
            queryFn: () => aG.getMetadataStatus(e),
            retry: le
        }),
        lc = e => {
            switch (e) {
                case "IARC_ACTIVITY_TYPE_QUESTIONNAIRE_SUBMITTED":
                    return "Questionnaire submitted";
                case "IARC_ACTIVITY_TYPE_LIVE_RATINGS_NOTICE":
                    return "Ratings assigned";
                case "IARC_ACTIVITY_TYPE_RATINGS_CHECK_REVIEW_RECEIVED":
                    return "Ratings check review received";
                case "IARC_ACTIVITY_TYPE_GRAC_REFUSE_CLASSIFICATION":
                    return "GRAC refused classification";
                case "IARC_ACTIVITY_TYPE_RATING_CHANGE_NOTICE":
                    return "Rating change notice";
                case "IARC_ACTIVITY_TYPE_RATING_AUTHORITY_CUSTOM_EMAIL":
                    return "Rating authority custom email";
                case "IARC_ACTIVITY_TYPE_ROBLOX_MODERATION_REJECTION":
                    return "Ratings rejected";
                default:
                    return "Activity"
            }
        },
        lm = e => void 0 === e || "" === e ? "IARC_ACTIVITY_TYPE_INVALID" : e,
        lf = (0, X.resolveUrl)("robloxCommunityStandardsUrl", "production", "global"),
        lp = {
            width: "100%",
            height: "100%"
        },
        lg = (0, o.makeStyles)()(e => ({
            title: {
                marginBottom: e.spacing(1)
            },
            message: {
                marginBottom: e.spacing(1)
            },
            button: {
                marginBottom: e.spacing(0)
            },
            mainGridMargin: {
                ...lp,
                marginTop: e.spacing(5),
                display: "flex",
                flexDirection: "column"
            },
            boldText: {
                fontWeight: "bold"
            }
        })),
        ly = e => {
            var t, a;
            let {
                header: l,
                creatorUsage: n,
                moderatorUsage: s,
                moderatorReasoning: o
            } = e, {
                translate: d
            } = (0, i.useTranslation)(), {
                classes: {
                    boldText: c
                }
            } = lg(), m = (null == n ? void 0 : n.contains) ? null == n || null == (t = n.experienceDescriptor) ? void 0 : t.displayName : d("Message.NotPresentDescriptorUsage"), f = (null == s ? void 0 : s.contains) ? null == s || null == (a = s.experienceDescriptor) ? void 0 : a.displayName : d("Message.NotPresentDescriptorUsage");
            return m !== f && m && f ? r.default.createElement("li", null, r.default.createElement(u.Typography, {
                variant: "body1",
                className: c
            }, l), r.default.createElement("ul", null, r.default.createElement("li", null, r.default.createElement(u.Typography, {
                variant: "body1"
            }, d("Message.YourSubmissionModeration"), ": ", m)), r.default.createElement("li", null, r.default.createElement(u.Typography, {
                variant: "body1"
            }, d("Message.ModeratorFeedbackModeration"), ": ", f)), o && r.default.createElement("li", null, r.default.createElement(u.Typography, {
                variant: "body1"
            }, "Feedback reasoning: ", o)))) : null
        },
        lE = e => {
            var t;
            let {
                moderation: a,
                isContentMaturityEnabled: l,
                submitBy: n
            } = e, {
                translate: s,
                translateHTML: o
            } = (0, i.useTranslation)(), {
                classes: {
                    boldText: c
                }
            } = lg();
            if (!a.creatorUsages || !a.moderatorUsages) return null;
            let m = n ? (0, t_.getFormattedDateTime)(new Date(n)) : null;
            return r.default.createElement("div", null, m && r.default.createElement(r.default.Fragment, null, r.default.createElement(u.Typography, null, r.default.createElement("b", null, s("Label.RetakeTime", {
                retakeDeadline: m
            }))), r.default.createElement("br", null)), r.default.createElement(u.Typography, null, s("Message.UponReviewModerationText")), r.default.createElement("ul", null, a.moderatorUsages.items && a.moderatorUsages.items.length > 0 && (null == (t = a.moderatorUsages.items) ? void 0 : t.map(e => {
                var t, l, n, i, s;
                let o = null == (n = a.creatorUsages) || null == (l = n.items) ? void 0 : l.find(t => {
                        var a, l;
                        return (null == (a = t.name) ? void 0 : a.toLowerCase()) === (null == (l = e.name) ? void 0 : l.toLowerCase())
                    }),
                    u = null == (i = a.moderatorReasoning) ? void 0 : i.find(t => {
                        var a, l;
                        return (null == (a = t.descriptorName) ? void 0 : a.toLowerCase()) === (null == (l = e.name) ? void 0 : l.toLowerCase())
                    }),
                    d = null != (t = null == (s = e.descriptorDisplayName) ? void 0 : s.replaceAll(/\s\(.*\)/g, "")) ? t : "Unknown Descriptor";
                return r.default.createElement(ly, {
                    header: d,
                    creatorUsage: o,
                    moderatorUsage: e,
                    moderatorReasoning: null == u ? void 0 : u.reasoning,
                    key: e.name
                })
            }))), r.default.createElement(u.Typography, null, o("Description.ModerationRejectionAppeal", [{
                opening: "violationsAppealsLinkStart",
                closing: "violationsAppealsLinkEnd",
                content: e => r.default.createElement(d.Link, {
                    href: "https://www.".concat("roblox.com", "/report-appeals#"),
                    target: "_blank",
                    underline: "always"
                }, e)
            }])), r.default.createElement("div", {
                className: "margin-top-medium"
            }, r.default.createElement(u.Typography, {
                className: c
            }, s("Title.NextStepsModeration")), r.default.createElement("ul", null, r.default.createElement("li", null, r.default.createElement(u.Typography, null, s(l ? "Message.NextStepsModerationMaturity" : "Message.NextStepsModeration"))))))
        },
        lv = e => {
            let {
                messageKey: t,
                isContentMaturityEnabled: a
            } = e, {
                classes: {
                    boldText: l,
                    commonTextDiv: n,
                    guidelinesImpact: s,
                    unorderedList: o
                }
            } = aX(), {
                translate: c,
                translateHTML: m
            } = (0, i.useTranslation)();
            return r.default.createElement(r.default.Fragment, null, r.default.createElement(u.Typography, {
                variant: "body1"
            }, m(t, [{
                opening: "experienceGuidelinesLinkStart",
                closing: "experienceGuidelinesLinkEnd",
                content: e => r.default.createElement(d.Link, {
                    href: ar,
                    target: "_blank",
                    underline: "always"
                }, e)
            }])), r.default.createElement("div", {
                className: n
            }, r.default.createElement(u.Typography, {
                variant: "body1",
                className: l
            }, c("Title.ImportantNote")), r.default.createElement("ul", {
                className: o
            }, r.default.createElement("li", null, r.default.createElement(u.Typography, {
                variant: "body1"
            }, m("Message.ImportantNoteRegenerateGuidelines", [{
                opening: "boldStart",
                closing: "boldEnd",
                content: e => r.default.createElement("span", {
                    className: l
                }, e)
            }]))), r.default.createElement("li", null, r.default.createElement(u.Typography, {
                variant: "body1"
            }, m("Message.ImportantNoteAnswersChanged", [{
                opening: "boldStart",
                closing: "boldEnd",
                content: e => r.default.createElement("span", {
                    className: l
                }, e)
            }])))), r.default.createElement("div", {
                className: s
            }, r.default.createElement(u.Typography, {
                variant: "body1",
                className: l
            }, c("Title.ImpactOfGuidelines")), r.default.createElement("br", null), r.default.createElement(u.Typography, {
                variant: "body1"
            }, c(a ? "Message.ImpactOfContentMaturity" : "Message.ImpactOfGuidelines")), r.default.createElement("ul", {
                className: o
            }, r.default.createElement("li", null, r.default.createElement(u.Typography, {
                variant: "body1"
            }, m(a ? "Message.ImpactOfContentMaturityLabel" : "Message.ImpactOfGuidelinesAgeRecommendation", [{
                opening: "boldStart",
                closing: "boldEnd",
                content: e => r.default.createElement("span", {
                    className: l
                }, e)
            }]))), r.default.createElement("li", null, r.default.createElement(u.Typography, {
                variant: "body1"
            }, m(a ? "Message.ImpactOfContentMaturityRegionalCompliance" : "Message.ImpactOfGuidelinesRegionalCompliance", [{
                opening: "boldStart",
                closing: "boldEnd",
                content: e => r.default.createElement("span", {
                    className: l
                }, e)
            }]))))), r.default.createElement("div", {
                className: s
            }, r.default.createElement(u.Typography, {
                variant: "body1"
            }, m("Message.LearnMoreAboutExperienceGuideline", [{
                opening: "linkStart",
                closing: "linkEnd",
                content: e => r.default.createElement(d.Link, {
                    href: an,
                    target: "_blank",
                    underline: "always"
                }, e)
            }])))))
        };
    var lb = ((tW = lb || {})[tW.Unknown = 0] = "Unknown", tW[tW.SubmittedOldVersion = 1] = "SubmittedOldVersion", tW[tW.SubmittedCurrentVersion = 2] = "SubmittedCurrentVersion", tW[tW.SubmittedNone = 3] = "SubmittedNone", tW),
        lh = (0, i.withTranslation)(e => {
            var t, a, l;
            let {
                onClick: n,
                universeId: s,
                progressState: o,
                submissionState: d,
                isContentMaturityEnabled: c,
                isIncreaseMaturityEnabled: m
            } = e, {
                translate: f,
                translateHTML: g
            } = (0, i.useTranslation)(), {
                classes: {
                    title: y,
                    message: E,
                    button: v
                }
            } = lg(), {
                classes: {
                    mainGrid: b
                }
            } = aX(), {
                data: h,
                error: x
            } = ls(s);
            (e => {
                let {
                    showToastNetworkError: t,
                    showToastUserError: a
                } = a2(), l = (0, r.useRef)(null);
                (0, r.useEffect)(() => {
                    null != e && l.current !== e && (l.current = e, a3.handleNetworkRequestFailure(e, a, t))
                }, [e, t, a])
            })(x);
            let S = null != (t = null == h ? void 0 : h.creatorOverrides) ? t : null,
                T = null != (a = null == h ? void 0 : h.submitBy) ? a : null,
                C = null != (l = null == h ? void 0 : h.moderation) ? l : null,
                {
                    ageDisplay: N,
                    ageContentDescriptors: I,
                    restrictedCountries: A
                } = (0, r.useMemo)(() => {
                    var e, t, a, l, n, r;
                    let i, s = null != (e = null == h ? void 0 : h.ageRecommendationDetails) ? e : null;
                    return {
                        ageDisplay: (null == s || null == (l = s.ageRecommendationSummary) || null == (a = l.ageRecommendation) ? void 0 : a.displayName) || null,
                        ageContentDescriptors: (null == s || null == (n = s.experienceDescriptorUsages) ? void 0 : n.items) == null ? [] : s.experienceDescriptorUsages.items.filter(e => {
                            var t;
                            return null != e.experienceDescriptor && !(null == (t = e.experienceDescriptorDimensionUsages) ? void 0 : t.some(e => "regionalcompliance" === e.dimensionName))
                        }).map(e => e.experienceDescriptor),
                        restrictedCountries: (r = null != (t = null == h ? void 0 : h.restrictedCountries) ? t : [], i = [], r.forEach(e => {
                            var t;
                            let a = [];
                            null == (t = e.experienceDescriptorUsages) || t.forEach(t => {
                                var l;
                                let n = {
                                    countryCode: e.countryCode || "",
                                    reasons: a,
                                    displayCountryName: e.countryDisplayName || "",
                                    displayDescriptorName: t.descriptorDisplayName || "",
                                    displayAgeRangeName: t.ageRangeDisplayName || ""
                                };
                                i.push(n), a.push((null == (l = t.experienceDescriptor) ? void 0 : l.displayName) || "")
                            })
                        }), i)
                    }
                }, [h]),
                k = c ? o === al ? d === lb.SubmittedCurrentVersion ? {
                    ...aa
                } : {
                    ...t8
                } : d === lb.SubmittedNone ? {
                    ...t9
                } : d === lb.SubmittedOldVersion ? {
                    ...ae
                } : {
                    ...at
                } : o === al ? d === lb.SubmittedCurrentVersion ? {
                    ...t7
                } : {
                    ...t4
                } : d === lb.SubmittedNone ? {
                    ...t3
                } : d === lb.SubmittedOldVersion ? {
                    ...t5
                } : {
                    ...t6
                };
            return r.default.createElement("section", null, r.default.createElement(p.Grid, {
                container: !0,
                direction: "column",
                className: b
            }, r.default.createElement(p.Grid, {
                item: !0,
                className: y
            }, r.default.createElement(u.Typography, {
                variant: "h2"
            }, (null == C ? void 0 : C.moderationStatus) === tL.V1Beta1ModerationStatus.Rejected ? g("Title.GuidelinesSubmittedModeratorRejected", [{
                opening: "redColorStart",
                closing: "redColorEnd",
                content: e => r.default.createElement(u.Typography, {
                    variant: "h2",
                    color: "error"
                }, e)
            }]) : f(k.titleKey))), (null == C ? void 0 : C.moderationStatus) === tL.V1Beta1ModerationStatus.Rejected && r.default.createElement(p.Grid, {
                item: !0,
                className: E
            }, r.default.createElement(lE, {
                submitBy: null != T ? T : "",
                moderation: C,
                isContentMaturityEnabled: c
            })), r.default.createElement(p.Grid, {
                item: !0,
                className: E
            }, r.default.createElement(lv, {
                messageKey: k.messageKey,
                isContentMaturityEnabled: c
            })), r.default.createElement(a7, {
                universeId: s,
                restrictedCountries: A,
                ageDisplay: N,
                ageContentDescriptors: I,
                creatorOverrides: S,
                isContentMaturityEnabled: c,
                isIncreaseMaturityEnabled: m
            }), r.default.createElement(p.Grid, {
                item: !0,
                className: v
            }, r.default.createElement(w.Button, {
                onClick: n,
                variant: "contained",
                color: "primaryBrand",
                size: "large"
            }, f(k.buttonKey)))))
        }, [tj.DeveloperQuestionnaire]);
    let lx = e => {
        let {
            section: t,
            answers: a,
            errors: l,
            updateAnswer: n
        } = e, {
            onSectionViewed: i
        } = (0, r.useContext)(ac), s = (0, r.useCallback)(e => {
            null == i || i(t.id, e)
        }, [t.id, i]);
        return ag(!!i, s), r.default.createElement(ap, {
            isActive: !0
        }, t.questions.map(e => r.default.createElement(aH, {
            key: e.id,
            errors: l,
            validatedAnswers: a,
            question: e,
            updateAnswer: n
        })))
    };
    var lS = (0, i.withTranslation)(e => {
        var t;
        let {
            questionnaire: a,
            answers: l,
            errors: n,
            isSaving: s,
            setAnswers: o,
            send: d,
            save: c,
            goToLanding: m
        } = e, {
            translate: f
        } = (0, i.useTranslation)(), {
            parseText: p
        } = tY(), g = (0, W.useQueryClient)(), {
            sections: y
        } = a, E = y.length, v = null == (t = y[0]) ? void 0 : t.description, [b, h] = (0, r.useState)(() => {
            if (!y.length) return 0;
            let e = y.findIndex(e => !ai(e, l));
            return e >= 0 ? e : y.length - 1
        }), x = Math.min(b, Math.max(E - 1, 0)), S = y[x], T = x === E - 1, C = !!S && ai(S, l), {
            steps: N,
            completedSectionsCount: I
        } = (0, r.useMemo)(() => {
            let e = y.map(e => ai(e, l));
            return {
                steps: y.map((t, a) => ({
                    id: t.id,
                    label: t.name,
                    state: a === x ? "current" : e[a] ? "complete" : "upcoming"
                })),
                completedSectionsCount: e.filter(Boolean).length
            }
        }, [y, l, x]), A = (0, r.useCallback)(e => {
            let t = as({
                sections: y,
                currentIndex: x,
                answers: e
            });
            if (t) {
                let e = y.findIndex(e => e.id === t.id);
                e >= 0 && h(e);
                return
            }
            x < E - 1 && h(e => Math.min(e + 1, E - 1))
        }, [x, y, E]), k = (0, r.useCallback)((e, t, a) => {
            let n = y[x],
                r = au(l, e, t, a);
            o(e, r), c(r), ad({
                section: n,
                priorAnswers: l,
                newAnswers: r,
                questionId: e
            }) && A(r)
        }, [l, x, A, c, y, o]), R = (0, r.useCallback)(async () => {
            await c(), await g.invalidateQueries({
                queryKey: ["experienceQuestionnaire"]
            }), m()
        }, [m, g, c]);
        return E && S ? r.default.createElement(r.default.Fragment, null, r.default.createElement(u.Typography, null, f("Label.SectionsCompleted", {
            completed: I.toString(),
            total: E.toString()
        })), v && r.default.createElement("div", null, p(v)), r.default.createElement(eH, {
            steps: N,
            currentStepIndex: x,
            size: "Medium"
        }), r.default.createElement(lx, {
            key: S.id,
            section: S,
            answers: l,
            errors: n,
            updateAnswer: k
        }), r.default.createElement("div", {
            className: "flex gap-small"
        }, r.default.createElement(w.Button, {
            disabled: 0 === x || s,
            variant: "outlined",
            color: "secondary",
            onClick: () => h(e => Math.max(e - 1, 0))
        }, f("Button.Back")), !T && r.default.createElement(w.Button, {
            disabled: !C || s,
            variant: "contained",
            color: "primaryBrand",
            onClick: () => h(e => Math.min(e + 1, E - 1))
        }, f("Button.Next")), T && r.default.createElement(w.Button, {
            disabled: I !== E || s,
            variant: "contained",
            color: "primaryBrand",
            loading: s,
            onClick: d
        }, f("Button.Continue")), r.default.createElement(w.Button, {
            disabled: s,
            loading: s,
            variant: "contained",
            color: "secondary",
            onClick: R
        }, f("Action.SaveDraft")))) : null
    }, [tj.DeveloperQuestionnaire, tj.CommonUIControls, tj.Controls, tj.Navigation]);
    let lT = (0, o.makeStyles)()({
            root: {
                flexGrow: 1,
                width: "100%",
                height: "100%",
                minHeight: 200
            }
        }),
        lC = () => {
            let {
                classes: {
                    root: e
                }
            } = lT();
            return r.default.createElement(p.Grid, {
                classes: {
                    root: e
                },
                container: !0,
                justifyContent: "center",
                alignItems: "center"
            }, r.default.createElement(f.CircularProgress, null))
        },
        lw = "unknown",
        lN = (e, t) => "creator-hub:questionnaire-attempt:".concat(e, ":").concat(t),
        lI = (e, t) => "".concat(lN(e, t), ":active-ms"),
        lA = (e, t) => "".concat(lN(e, t), ":active-since"),
        lk = e => {
            let t = Number(window.localStorage.getItem(e));
            return Number.isFinite(t) && t > 0 ? t : 0
        },
        lR = (e, t) => {
            var a;
            return {
                attempt_id: e.attemptId,
                entry_point: e.entryPoint,
                event_timestamp: t,
                locale: null != (a = e.locale) ? a : lw,
                platform: "web",
                questionnaire_id: e.questionnaireId,
                questionnaire_version: e.questionnaireId,
                universe_id: String(e.universeId)
            }
        },
        lM = (e, t, a) => {
            let l = (0, r.useCallback)(() => {
                    t && ((e, t) => {
                        try {
                            let a = lA(e, t);
                            if (lk(a) > 0) return;
                            window.localStorage.setItem(a, String(Date.now()))
                        } catch (e) {}
                    })(e, t)
                }, [t, e]),
                n = (0, r.useCallback)(() => {
                    t && ((e, t) => {
                        try {
                            let a = lA(e, t),
                                l = lk(a);
                            if (0 === l) return;
                            let n = lI(e, t),
                                r = lk(n) + Math.max(Date.now() - l, 0);
                            window.localStorage.setItem(n, String(r)), window.localStorage.removeItem(a)
                        } catch (e) {}
                    })(e, t)
                }, [t, e]);
            (0, r.useEffect)(() => {
                a ? l() : n()
            }, [a, n, l]), (0, r.useEffect)(() => {
                let e = () => n(),
                    t = () => {
                        "hidden" === document.visibilityState ? n() : a && l()
                    };
                return window.addEventListener("pagehide", e), document.addEventListener("visibilitychange", t), () => {
                    window.removeEventListener("pagehide", e), document.removeEventListener("visibilitychange", t), n()
                }
            }, [a, n, l])
        },
        lD = {
            logImpressionEvent: () => {}
        },
        lL = () => {
            let e = (0, tB.useOptionalUnifiedLoggerProvider)();
            return (0, r.useMemo)(() => {
                var a, l;
                return null != (a = null != (l = null == e ? void 0 : e.unifiedLogger) ? l : t) ? a : lD
            }, [e])
        },
        l_ = e => {
            let {
                explicitEntryPoint: t,
                locale: a,
                questionnaireId: l,
                universeId: n
            } = e, i = lL(), [s, o] = (0, r.useState)(""), [u, d] = (0, r.useState)(""), c = (0, r.useCallback)(e => {
                var r, s;
                if (!l) return !1;
                let u = ((e, t) => {
                        let a = lN(e, t);
                        try {
                            let e = window.localStorage.getItem(a);
                            if (e) return e
                        } catch (e) {}
                        let l = t_.uuidService.generateRandomUuid();
                        try {
                            window.localStorage.setItem(a, l)
                        } catch (e) {}
                        return l
                    })(n, l),
                    c = function(e) {
                        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "u" < typeof document ? "" : document.referrer;
                        if (e) return e;
                        if (!t) return "direct";
                        try {
                            let e = new URL(t);
                            if (e.origin === window.location.origin) return e.pathname;
                            return e.hostname || lw
                        } catch (e) {
                            return lw
                        }
                    }(t);
                return o(u), d(c), s = {
                    attemptId: u,
                    entryPoint: c,
                    locale: a,
                    questionnaireId: l,
                    universeId: n
                }, i.logImpressionEvent({
                    eventName: "QuestionnaireStarted",
                    parameters: lR(s, new Date().toISOString())
                }), null == e || null == (r = e.onStarted) || r.call(e), !0
            }, [t, a, l, i, n]), m = (0, r.useCallback)(() => {
                if (l) {
                    var e;
                    let t;
                    t = ((e, t) => {
                        try {
                            let a = lI(e, t),
                                l = lA(e, t);
                            if (null === window.localStorage.getItem(a) && null === window.localStorage.getItem(l)) return null;
                            let n = lk(l),
                                r = 0 === n ? 0 : Math.max(Date.now() - n, 0);
                            return lk(a) + r
                        } catch (e) {
                            return null
                        }
                    })((e = {
                        attemptId: s,
                        entryPoint: u,
                        locale: a,
                        questionnaireId: l,
                        universeId: n
                    }).universeId, e.questionnaireId), i.logImpressionEvent({
                        eventName: "QuestionnaireCompleted",
                        parameters: {
                            ...lR(e, new Date().toISOString()),
                            ...null === t ? {} : {
                                attempt_duration_ms: String(t)
                            }
                        }
                    });
                    try {
                        window.localStorage.removeItem(lN(n, l)), window.localStorage.removeItem(lI(n, l)), window.localStorage.removeItem(lA(n, l))
                    } catch (e) {}
                }
                o("")
            }, [s, u, a, l, i, n]);
            return {
                attemptId: s,
                completeAttempt: m,
                entryPoint: u,
                startAttempt: c
            }
        },
        lO = e => {
            let {
                attemptId: t,
                entryPoint: a,
                locale: l,
                questionnaireId: n,
                universeId: i
            } = e, s = lL(), o = (0, r.useCallback)((e, r) => {
                n && s.logImpressionEvent({
                    eventName: "SectionViewed",
                    parameters: {
                        ...lR({
                            attemptId: t,
                            entryPoint: a,
                            locale: l,
                            questionnaireId: n,
                            universeId: i
                        }, r.clientTimestamp),
                        duration_ms: String(Math.max(Math.round(r.durationMs), 0)),
                        section_id: e
                    }
                })
            }, [t, a, l, n, s, i]), u = (0, r.useCallback)((e, r) => {
                n && s.logImpressionEvent({
                    eventName: "QuestionViewed",
                    parameters: {
                        ...lR({
                            attemptId: t,
                            entryPoint: a,
                            locale: l,
                            questionnaireId: n,
                            universeId: i
                        }, r.clientTimestamp),
                        duration_ms: String(Math.max(Math.round(r.durationMs), 0)),
                        question_id: e
                    }
                })
            }, [t, a, l, n, s, i]);
            return (0, r.useMemo)(() => ({
                onQuestionViewed: u,
                onSectionViewed: o
            }), [u, o])
        },
        lB = e => e ? e.toLowerCase().replaceAll("-", "_") : null,
        lq = e => {
            let {
                classes: {
                    boldText: t,
                    commonTextDiv: a,
                    guidelinesImpact: l,
                    unorderedList: n
                }
            } = aX(), {
                translate: s,
                translateHTML: o
            } = (0, i.useTranslation)();
            return r.default.createElement("div", {
                className: a
            }, r.default.createElement(u.Typography, {
                variant: "body1"
            }, o(e ? "Message.ImpactOfContentMaturityPreview" : "Message.ImpactOfGuidelinesPreview", [{
                opening: "experienceGuidelinesLinkStart",
                closing: "experienceGuidelinesLinkEnd",
                content: e => r.default.createElement(d.Link, {
                    href: ar,
                    target: "_blank",
                    underline: "always"
                }, e)
            }])), r.default.createElement("ul", {
                className: n
            }, r.default.createElement("li", null, r.default.createElement(u.Typography, {
                variant: "body1"
            }, o(e ? "Message.ImpactOfContentMaturityLabelPreview" : "Message.ImpactOfGuidelinesAgeRecommendationPreview", [{
                opening: "boldStart",
                closing: "boldEnd",
                content: e => r.default.createElement("span", {
                    className: t
                }, e)
            }]))), r.default.createElement("li", null, r.default.createElement(u.Typography, {
                variant: "body1"
            }, o(e ? "Message.ImpactOfMaturityRegionalCompliancePreview" : "Message.ImpactOfGuidelinesRegionalCompliancePreview", [{
                opening: "boldStart",
                closing: "boldEnd",
                content: e => r.default.createElement("span", {
                    className: t
                }, e)
            }])))), r.default.createElement("div", {
                className: l
            }, r.default.createElement(u.Typography, {
                variant: "body1"
            }, o("Message.LearnMoreAboutExperienceGuideline", [{
                opening: "linkStart",
                closing: "linkEnd",
                content: e => r.default.createElement(d.Link, {
                    href: an,
                    target: "_blank",
                    underline: "always"
                }, e)
            }]))))
        },
        lP = e => {
            let {
                translate: t
            } = (0, i.useTranslation)();
            return r.default.createElement(u.Typography, {
                variant: "caption",
                color: "secondary",
                display: "block"
            }, e ? t("Message.RestrictedMaturityDisabledCountries") : "17+ experiences are currently unplayable in Korea, Saudi Arabia, and Turkey.")
        },
        lF = e => {
            let {
                universeId: t,
                questionnaireId: a,
                questionnaireResponse: l,
                onEdit: n,
                attemptSubmit: s,
                isSaving: o,
                moveBackAScreen: d,
                isContentMaturityEnabled: c,
                isIncreaseMaturityEnabled: m
            } = e, {
                parseText: f
            } = tY(), {
                translate: g
            } = (0, i.useTranslation)(), {
                classes: {
                    navigationButtons: y,
                    navigationButtonsContainer: E
                }
            } = aE(), {
                classes: {
                    sectionLabel: v,
                    mainGrid: b
                }
            } = aX(), {
                classes: {
                    message: h
                }
            } = lg(), {
                showToastNetworkError: x,
                showToastUserError: S
            } = a2(), {
                locale: T
            } = (0, i.useLocalization)(), [C, I] = (0, r.useState)(!0), [A, k] = (0, r.useState)(!1), [R, M] = (0, r.useState)(), [D, L] = (0, r.useState)(), [O, B] = (0, r.useState)(), [q, P] = (0, r.useState)([]), [F, U] = (0, r.useState)(null), [Q, z] = (0, r.useState)(null), [H, V] = (0, r.useState)(null), [W, j] = (0, r.useState)([]), [K, Y] = (0, r.useState)(!1), [X, J] = (0, r.useState)(null), $ = (0, r.useCallback)(async () => {
                try {
                    var e, a, l, n, r;
                    let i = await a3.attemptNetworkRequestWithRetry(() => a$.getDetailedGuidelines(t));
                    V(null != (e = null == (r = i.ageRecommendationDetails) || null == (n = r.ageRecommendationSummary) || null == (l = n.ageRecommendation) ? void 0 : l.minimumAge) ? e : null), J(null != (a = i.creatorOverrides) ? a : null)
                } catch (e) {
                    throw Error("Unable to get current guidelines, defaulting to null which will trigger confirmation.")
                }
            }, [t]), Z = (0, r.useCallback)(async e => {
                try {
                    var l, n, r, i, s, o, u;
                    let d, c = lB(T),
                        m = await a3.attemptNetworkRequestWithRetry(() => aG.getSubmissionPreview(t, a, e, c));
                    j(null != (l = null == m ? void 0 : m.restrictedCountries) ? l : []);
                    let f = null != (n = m.ageRecommendationDetails) ? n : null;
                    P((d = [], (null == f ? void 0 : f.descriptorUsages) != null && f.descriptorUsages.forEach(e => {
                        null != e.descriptor && d.push(e.descriptor)
                    }), d)), U((null == f || null == (s = f.summary) || null == (i = s.ageRecommendation) ? void 0 : i.displayName) || null), z(null != (r = null == f || null == (u = f.summary) || null == (o = u.ageRecommendation) ? void 0 : o.minimumAge) ? r : null), await $(), m.userErrorMessage && B(m.userErrorMessage), m.userWarningMessage && L(m.userWarningMessage), m.userInfoMessage && M(m.userInfoMessage), m.disableSubmitButton && k(!0)
                } catch (e) {
                    d(), a3.handleNetworkRequestFailure(e, S, x)
                }
            }, [t, a, $, x, S]), ee = (0, r.useCallback)(e => {
                e && e.preventDefault(), 18 === Q && 18 !== H ? Y(!K) : s()
            }, [s, H, K, Q]), et = (0, r.useCallback)(e => {
                e && e.preventDefault(), s(), Y(!K)
            }, [s, K]);
            return ((0, r.useEffect)(() => {
                async function e() {
                    I(!0), await Z(l), I(!1)
                }
                o || e()
            }, [JSON.stringify(l), Z]), C) ? r.default.createElement(lC, null) : r.default.createElement("section", null, r.default.createElement(p.Grid, {
                container: !0,
                direction: "column",
                className: b
            }, r.default.createElement(p.Grid, {
                item: !0,
                className: h
            }, r.default.createElement(r.default.Fragment, null, r.default.createElement(u.Typography, {
                variant: "h2",
                className: v
            }, g("Title.GuidelinesPreview")), r.default.createElement(lq, {
                isContentMaturityEnabled: c
            }), R && r.default.createElement(p.Grid, {
                item: !0,
                className: h
            }, r.default.createElement(_.Alert, {
                severity: "info",
                variant: "standard"
            }, r.default.createElement(u.Typography, null, f(R)))), r.default.createElement(a7, {
                universeId: t,
                restrictedCountries: W,
                ageDisplay: F,
                ageContentDescriptors: q,
                creatorOverrides: X,
                isContentMaturityEnabled: c,
                isIncreaseMaturityEnabled: m
            }))), 18 === Q && r.default.createElement(p.Grid, {
                item: !0,
                className: h
            }, r.default.createElement(lP, {
                isContentMaturityEnabled: c
            })), O && r.default.createElement(p.Grid, {
                item: !0,
                className: h
            }, r.default.createElement(_.Alert, {
                severity: "error",
                variant: "standard"
            }, r.default.createElement(u.Typography, null, f(O)))), D && r.default.createElement(p.Grid, {
                item: !0,
                className: h
            }, r.default.createElement(_.Alert, {
                severity: "warning",
                variant: "standard"
            }, r.default.createElement(u.Typography, null, f(D)))), r.default.createElement(p.Grid, {
                container: !0,
                direction: "row",
                className: E
            }, r.default.createElement(p.Grid, {
                item: !0,
                className: y
            }, r.default.createElement(w.Button, {
                disabled: A,
                onClick: e => ee(e),
                variant: "contained",
                color: "primaryBrand",
                size: "large",
                loading: o
            }, g("Button.Submit"))), r.default.createElement(p.Grid, {
                item: !0,
                className: y
            }, r.default.createElement(w.Button, {
                onClick: n,
                variant: "contained",
                color: "primary",
                size: "large"
            }, g("Button.Edit")))), r.default.createElement(N.Dialog, {
                onClose: () => ee(),
                open: K
            }, r.default.createElement(G.DialogTemplate, {
                cancelText: "Cancel",
                color: "primaryBrand",
                confirmText: c ? g("Message.ConfirmRestrictedLabel") : "Yes, make experience ages 17+",
                content: c ? g("Message.RestrictedLabelWarningAge18Plus") : "This experience will become accessible to only age-verified 17+ users. The age recommendation of “Ages 17+” cannot be removed.",
                onCancel: e => ee(e),
                onConfirm: e => et(e),
                title: c ? g("Title.ConfirmRestrictedLabel") : "Make experience Ages 17+?",
                variant: "alert"
            }))))
        };
    var lU = (0, i.withTranslation)(e => {
        let {
            universeId: t
        } = e, a = (0, s.useRouter)(), {
            showToastNetworkError: l,
            showToastUserError: n,
            showToastSuccess: o
        } = a2(), [u, d] = (0, r.useState)({}), [c, m] = (0, r.useState)(!1), [f, g] = (0, r.useState)(null), [y, E] = (0, r.useState)(0), [v, b] = (0, r.useState)(!1), [h, x] = (0, r.useState)(!1), S = (0, r.useRef)(y), {
            locale: T
        } = (0, i.useLocalization)(), C = lB(T), w = "string" == typeof a.query.entryPoint ? a.query.entryPoint : void 0, N = ak(), I = N.sectionStepper.isExperimentReady, A = N.sectionStepper.isExperimentEnabled, k = I && A, R = (0, r.useCallback)((e, t) => {
            if (g(t), u[e]) {
                let t = {
                    ...u
                };
                delete t[e], d(t)
            }
        }, [u]), {
            data: M,
            refetch: D,
            isLoading: L
        } = lt(t), _ = null == M ? void 0 : M.questionnaireId, {
            attemptId: O,
            completeAttempt: B,
            entryPoint: q,
            startAttempt: P
        } = l_({
            explicitEntryPoint: w,
            locale: T,
            questionnaireId: _,
            universeId: t
        }), {
            data: F,
            isLoading: U
        } = la(_, C), G = (0, r.useCallback)(async () => {
            var e;
            return null == (e = (await D()).data) ? void 0 : e.questionnaireId
        }, [D]), {
            data: Q,
            isLoading: z
        } = ll(t), H = (0, r.useMemo)(() => {
            var e;
            return null != (e = null != f ? f : Q) ? e : []
        }, [f, Q]);
        (0, r.useLayoutEffect)(() => {
            1 === y && 1 !== S.current && (b(H.length > 0), x(2 === S.current)), S.current = y
        }, [y, H]);
        let {
            data: V,
            isLoading: j
        } = ln(t), {
            isLoading: K
        } = ls(t), {
            submissionState: X,
            progressState: J
        } = (0, r.useMemo)(() => {
            var e;
            let t = (null != (e = null == Q ? void 0 : Q.length) ? e : 0) > 0;
            return (null == V ? void 0 : V.submission) == null ? {
                submissionState: lb.SubmittedNone,
                progressState: t ? "started" : "not_started"
            } : _ === V.questionnaireId ? {
                submissionState: lb.SubmittedCurrentVersion,
                progressState: t ? "started" : "submitted"
            } : {
                submissionState: lb.SubmittedOldVersion,
                progressState: t ? "started" : "submitted"
            }
        }, [null == Q ? void 0 : Q.length, _, V]), {
            mutateAsync: $
        } = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                a = (0, W.useQueryClient)();
            return (0, Y.useMutation)({
                mutationKey: ["experienceQuestionnaire", "saveResponseByUniverseId"],
                mutationFn: t => {
                    let {
                        questionnaireId: a,
                        answers: l
                    } = t;
                    return aG.submitResponseByUniverseId(e, a, {
                        answers: l
                    })
                },
                onSuccess: () => a.invalidateQueries({
                    queryKey: ["experienceQuestionnaire"]
                }),
                ...t
            })
        }(t), {
            mutateAsync: Z
        } = lr(t), {
            mutateAsync: ee
        } = function() {
            let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
            return (0, Y.useMutation)({
                mutationKey: ["experienceQuestionnaire", "validateResponse"],
                mutationFn: e => {
                    let {
                        questionnaireId: t,
                        answers: a
                    } = e;
                    return aG.validateResponse(t, {
                        answers: a
                    })
                },
                ...e
            })
        }();
        lM(t, _, 1 === y || 2 === y);
        let et = lO({
                attemptId: O,
                entryPoint: q,
                locale: T,
                questionnaireId: _,
                universeId: t
            }),
            ea = (0, r.useCallback)(async e => {
                if (await G() !== _) return n(t1, t2), !1;
                if (!_) return n(tZ, t0), !1;
                try {
                    return m(!0), await Z({
                        questionnaireId: _,
                        answers: null != e ? e : H
                    }), !0
                } catch (e) {
                    return a3.handleNetworkRequestFailure(e, n, l), !1
                } finally {
                    m(!1)
                }
            }, [G, _, n, Z, H, l]),
            el = (0, r.useCallback)(async () => {
                if (!_) return n(tZ, t0), !1;
                try {
                    m(!0);
                    let e = await ee({
                        questionnaireId: _,
                        answers: H
                    });
                    if (!0 !== e.isValid) {
                        if (null != e.failures) {
                            let t = {};
                            e.failures.forEach(e => {
                                null != e.questionId && (t[e.questionId] = !0)
                            }), d(t), n("Title.ValidationFailed", "Message.ValidationFailed")
                        }
                        return !1
                    }
                    return E(2), !0
                } catch (e) {
                    return a3.handleNetworkRequestFailure(e, n, l), !1
                } finally {
                    m(!1)
                }
            }, [_, n, ee, H, l]),
            en = (0, r.useCallback)(() => {
                var e;
                E(1), null == (e = document.getElementById(N.scrollContainerId)) || e.scrollTo(0, 0)
            }, [N.scrollContainerId]),
            er = (0, r.useCallback)(() => {
                E(0)
            }, []),
            ei = (0, r.useCallback)(() => {
                P({
                    onStarted: en
                })
            }, [en, P]),
            es = async () => {
                if (await G() !== _) return void n(t1, t2);
                if (!_) return void n(tZ, t0);
                try {
                    m(!0), await $({
                        questionnaireId: _,
                        answers: H
                    }), B(), g(null), o(!0), E(0)
                } catch (e) {
                    a3.handleNetworkRequestFailure(e, n, l)
                } finally {
                    m(!1)
                }
            }, eo = async () => {
                await G() !== _ ? n(t1, t2) : en()
            }, eu = (0, r.useMemo)(() => ({
                answers: H,
                errors: u,
                isSaving: c,
                setAnswers: R,
                send: el,
                save: ea,
                goToLanding: er
            }), [H, u, c, R, el, ea, er]), ed = (e, a) => r.default.createElement(p.Grid, {
                container: !0,
                flexDirection: "column",
                gap: "var(--gap-xxlarge)",
                maxWidth: "700px"
            }, 0 === y && r.default.createElement(lh, {
                onClick: ei,
                universeId: t,
                progressState: J,
                submissionState: X,
                isContentMaturityEnabled: !0,
                isIncreaseMaturityEnabled: !0
            }), 1 === y && F && (!k || v || a ? r.default.createElement(af, {
                value: et
            }, k && !h && a && e ? r.default.createElement(lS, {
                questionnaire: F,
                ...eu
            }) : r.default.createElement(aK, {
                questionnaire: F,
                ...eu
            })) : r.default.createElement(lC, null)), 2 === y && _ && r.default.createElement(lF, {
                universeId: t,
                questionnaireId: _,
                questionnaireResponse: {
                    answers: H
                },
                onEdit: eo,
                attemptSubmit: es,
                isSaving: c,
                moveBackAScreen: en,
                isContentMaturityEnabled: !0,
                isIncreaseMaturityEnabled: !1
            }));
        if (L || z || j || U || K || !I) return r.default.createElement(lC, null);
        let ec = k && 1 === y && !v,
            em = k && 1 === y && v,
            {
                Enrollment: ef,
                Cache: ep
            } = N.sectionStepper;
        return ec ? r.default.createElement(ef, null, e => {
            let {
                isSectionStepperEnabled: t,
                isFetched: a
            } = e;
            return ed(t, a)
        }) : em ? r.default.createElement(ep, null, e => {
            let {
                isSectionStepperEnabled: t,
                isFetched: a
            } = e;
            return ed(t, a)
        }) : ed(!1, !0)
    }, [tj.Navigation, tj.DeveloperQuestionnaire, tj.Error]);
    let lG = e => {
        let {
            lightSrc: t,
            darkSrc: a,
            alt: l,
            ...n
        } = e, {
            themeMode: i
        } = (0, tF.useThemeMode)();
        return r.default.createElement("img", {
            src: "dark" === i && null != a ? a : t,
            alt: l,
            ...n
        })
    };
    var lQ = (0, i.withTranslation)(e => {
        let {
            title: t,
            message: a,
            buttonText: l,
            onReload: n,
            className: s
        } = e, {
            translate: o
        } = (0, i.useTranslation)();
        return r.default.createElement("div", {
            className: (0, Z.clsx)("flex flex-col justify-center items-center size-full", s)
        }, r.default.createElement(lG, {
            lightSrc: tP.default,
            darkSrc: tq.default,
            alt: "failure"
        }), r.default.createElement("div", {
            className: "flex flex-col text-align-x-center gap-small margin-bottom-medium"
        }, r.default.createElement("h2", {
            className: "text-heading-small content-emphasis margin-none"
        }, null != t ? t : o("Heading.GenericError")), r.default.createElement("span", {
            className: "text-body-medium content-default"
        }, a)), n && r.default.createElement(eV.Button, {
            variant: "Standard",
            size: "Medium",
            onClick: n
        }, null != l ? l : o("Action.FailedToLoadPage")))
    }, [tj.Error]);
    let lz = e => {
            let {
                href: t,
                ...a
            } = e;
            return r.default.createElement(d.Link, {
                href: null != t ? t : "/",
                ...a
            })
        },
        lH = (0, o.makeStyles)()(e => ({
            borderedTable: {
                width: "100%",
                tableLayout: "fixed",
                border: "1px solid ".concat(e.palette.components.divider),
                borderCollapse: "separate",
                borderSpacing: 0,
                borderRadius: e.border.radius.medium.borderRadius,
                "& thead tr:first-of-type th": {
                    "&:first-of-type": {
                        borderTopLeftRadius: e.border.radius.medium.borderRadius
                    },
                    "&:last-of-type": {
                        borderTopRightRadius: e.border.radius.medium.borderRadius
                    }
                },
                "& tbody tr:last-of-type td": {
                    borderBottom: "none",
                    "&:first-of-type": {
                        borderBottomLeftRadius: e.border.radius.medium.borderRadius
                    },
                    "&:last-of-type": {
                        borderBottomRightRadius: e.border.radius.medium.borderRadius
                    }
                },
                "& th, & td": {
                    border: "none",
                    borderBottom: "1px solid ".concat(e.palette.components.divider)
                }
            }
        })),
        lV = e => {
            let {
                open: t,
                onClose: a,
                moderation: l
            } = e, {
                translate: n
            } = (0, i.useTranslation)(), {
                classes: {
                    borderedTable: s
                }
            } = lH(), o = (0, r.useMemo)(() => {
                var e, t, a, r, i;
                let s = null != (e = l.moderatorReasoning) ? e : [],
                    o = null != (t = null == (r = l.creatorUsages) ? void 0 : r.items) ? t : [],
                    u = null != (a = null == (i = l.moderatorUsages) ? void 0 : i.items) ? a : [],
                    d = n("Message.NotPresentDescriptorUsage"),
                    c = e => {
                        var t, a, l;
                        return e ? e.contains ? null != (t = null != (a = e.descriptorDisplayName) ? a : null == (l = e.experienceDescriptor) ? void 0 : l.displayName) ? t : "—" : d : "—"
                    };
                return s.map(e => {
                    var t, a, l, n, r, i;
                    let s = o.find(t => t.name === e.descriptorName),
                        d = u.find(t => t.name === e.descriptorName),
                        m = null != (t = null != (a = null != (l = null == s || null == (r = s.experienceDescriptor) ? void 0 : r.displayName) ? l : null == d || null == (i = d.experienceDescriptor) ? void 0 : i.displayName) ? a : e.descriptorName) ? t : "";
                    return {
                        descriptorName: null != (n = e.descriptorName) ? n : "",
                        descriptorLabel: m,
                        creatorDisplayName: c(s),
                        moderatorDisplayName: c(d),
                        reasoning: e.reasoning
                    }
                })
            }, [l, n]);
            return r.default.createElement(J.Dialog, {
                open: t,
                onOpenChange: e => {
                    e || a()
                },
                size: "Large",
                isModal: !0,
                hasCloseAffordance: !0,
                closeLabel: n("Action.Close")
            }, r.default.createElement(J.DialogContent, {
                className: "flex flex-col",
                style: {
                    maxHeight: "80vh",
                    maxWidth: "min(720px, 90vw)"
                }
            }, r.default.createElement(J.DialogBody, {
                className: "flex flex-col gap-large min-height-[0px]"
            }, r.default.createElement(J.DialogTitle, {
                className: "text-heading-small margin-none"
            }, n("Title.YourModerationFeedback")), r.default.createElement("span", {
                className: "text-body-medium content-default"
            }, n("Description.ModerationFeedbackInaccurate")), r.default.createElement("div", {
                style: {
                    overflowY: "auto",
                    minHeight: 0
                }
            }, r.default.createElement(B.Table, {
                className: "".concat(s, " radius-medium clip")
            }, r.default.createElement(q.TableHead, null, r.default.createElement(P.TableRow, null, r.default.createElement(F.TableCell, null, r.default.createElement("span", {
                className: "text-label-medium"
            }, n("TableHead.YourResponse"))), r.default.createElement(F.TableCell, null, r.default.createElement("span", {
                className: "text-label-medium"
            }, n("TableHead.ModeratorFeedback"))))), r.default.createElement(U.TableBody, null, o.length > 0 ? o.map(e => r.default.createElement(P.TableRow, {
                key: e.descriptorName
            }, r.default.createElement(F.TableCell, null, r.default.createElement("div", {
                className: "flex flex-col"
            }, r.default.createElement("span", {
                className: "text-label-medium"
            }, e.descriptorLabel), r.default.createElement("span", {
                className: "text-body-medium"
            }, e.creatorDisplayName))), r.default.createElement(F.TableCell, null, r.default.createElement("div", {
                className: "flex flex-col"
            }, r.default.createElement("span", {
                className: "text-label-medium"
            }, e.descriptorLabel), r.default.createElement("span", {
                className: "text-body-medium"
            }, e.moderatorDisplayName), e.reasoning && r.default.createElement("span", {
                className: "text-body-small content-default"
            }, e.reasoning))))) : r.default.createElement(P.TableRow, null, r.default.createElement(F.TableCell, null, r.default.createElement("span", {
                className: "text-body-medium"
            }, "—")), r.default.createElement(F.TableCell, null, r.default.createElement("span", {
                className: "text-body-medium"
            }, "—"))))))), r.default.createElement(J.DialogFooter, {
                className: "flex items-center justify-end gap-small"
            }, r.default.createElement(eV.Button, {
                as: "a",
                href: "https://www.roblox.com/report-appeals#/",
                target: "_blank",
                rel: "noopener",
                variant: "Standard",
                size: "Medium"
            }, n("Action.AppealDecision")))))
        },
        lW = e => {
            let {
                description: t,
                linkLabel: a,
                linkHref: l
            } = e;
            return r.default.createElement("div", {
                className: "flex items-center gap-small padding-medium radius-medium bg-surface-200"
            }, r.default.createElement(eL.Icon, {
                name: "icon-regular-circle-i",
                size: "Medium",
                className: "shrink-0"
            }), r.default.createElement("span", {
                className: "text-body-medium content-default grow-1"
            }, t), a && l && r.default.createElement(eX, {
                href: l,
                target: "_blank",
                color: "Standard",
                underline: "always",
                isExternal: !1,
                className: "shrink-0"
            }, a))
        },
        lj = e => {
            switch (e) {
                case "Assigned":
                    return "Success";
                case "Pending":
                case "NotStarted":
                default:
                    return "Neutral";
                case "Rejected":
                    return "Alert"
            }
        },
        lK = (0, o.makeStyles)()(e => ({
            accordionRoot: {
                border: "unset",
                borderBottom: "1px solid ".concat(e.palette.components.divider),
                "&.Mui-expanded": {
                    margin: 0
                },
                "::before": {
                    content: "none"
                }
            },
            accordionSummaryContent: {
                justifyContent: "space-between",
                alignItems: "center",
                paddingRight: "var(--padding-small)",
                display: "flex",
                gap: "var(--gap-medium)"
            }
        })),
        lY = e => {
            var t, a, l, n, s, o, u, d, c;
            let {
                ratingsStatus: m,
                nonCompliantRegionStatus: f,
                detailedGuidelines: p,
                isOverEighteenQuestionnaire: g
            } = e, {
                classes: {
                    accordionRoot: y,
                    accordionSummaryContent: E
                }
            } = lK(), {
                classes: {
                    borderedTable: v
                }
            } = lH(), {
                translate: b,
                translateHTML: S,
                translateWithNamespace: T
            } = (0, i.useTranslation)(), w = null != (t = null == p || null == (o = p.ageRecommendationDetails) || null == (s = o.experienceDescriptorUsages) ? void 0 : s.items) ? t : [], N = null == p || null == (d = p.ageRecommendationDetails) || null == (u = d.ageRecommendationSummary) ? void 0 : u.ageRecommendation, I = null != (a = null == p ? void 0 : p.restrictedCountries) ? a : [], A = null != (l = null == p ? void 0 : p.robloxProducts) ? l : [], k = w.map(e => e.descriptorDisplayName).filter(Boolean), R = null == N ? void 0 : N.contentMaturity, M = !R || "unrated" === R, D = M ? "—" : null != (n = null == N ? void 0 : N.displayName) ? n : "—", L = (null == p || null == (c = p.moderation) ? void 0 : c.moderationStatus) === tL.V2Beta1ModerationStatus.Rejected ? "Rejected" : M ? "NotStarted" : "Assigned", _ = A.flatMap(e => {
                var t, a;
                return (null != (t = null == (a = e.iarcProduct) ? void 0 : a.ratingList) ? t : []).map(t => ({
                    product: e,
                    rating: t
                }))
            }).sort((e, t) => {
                var a, l;
                return (null != (a = e.rating.ratingAuthorityShortText) ? a : "").localeCompare(null != (l = t.rating.ratingAuthorityShortText) ? l : "")
            }), O = _.length > 0 ? "Assigned" : "Assigned" === m ? "NotStarted" : m, G = I.length > 0 ? "Assigned" : f, z = !g;
            return r.default.createElement("div", {
                className: "flex flex-col gap-medium"
            }, z && 0 === _.length && r.default.createElement(lW, {
                description: T(tj.DeveloperQuestionnaire, "Description.U18NoRatings")
            }), r.default.createElement(h.Accordion, {
                square: !0,
                variant: "outlined",
                classes: {
                    root: y
                }
            }, r.default.createElement(x.AccordionSummary, {
                expandIcon: r.default.createElement(Q.ExpandMoreIcon, null),
                classes: {
                    content: E
                }
            }, r.default.createElement("span", {
                className: "text-heading-small"
            }, b("Title.RobloxMaturityLabelV2")), r.default.createElement(e8, {
                label: b("Label.".concat(L)),
                variant: lj(L)
            })), r.default.createElement(C.AccordionDetails, null, r.default.createElement("div", {
                className: "flex flex-col gap-medium"
            }, r.default.createElement(B.Table, {
                className: "".concat(v, " radius-medium clip")
            }, r.default.createElement(q.TableHead, null, r.default.createElement(P.TableRow, null, r.default.createElement(F.TableCell, null, r.default.createElement("div", {
                className: "flex items-center gap-small"
            }, r.default.createElement("span", {
                className: "text-label-medium"
            }, b("Label.Rating")))), r.default.createElement(F.TableCell, null, r.default.createElement("div", {
                className: "flex items-center gap-small"
            }, r.default.createElement("span", {
                className: "text-label-medium"
            }, b("TableHead.Descriptors")))))), r.default.createElement(U.TableBody, null, r.default.createElement(P.TableRow, null, r.default.createElement(F.TableCell, null, r.default.createElement("span", {
                className: "text-body-medium"
            }, D || "—")), r.default.createElement(F.TableCell, null, r.default.createElement("div", {
                className: "flex flex-col"
            }, w.map(e => {
                var t;
                return null == (t = e.experienceDescriptor) ? void 0 : t.displayName
            }).filter(Boolean).map(e => r.default.createElement("span", {
                key: e,
                className: "text-body-medium"
            }, e)), 0 === w.length && r.default.createElement("span", {
                className: "text-body-medium"
            }, "—"))))))))), r.default.createElement(h.Accordion, {
                square: !0,
                variant: "outlined",
                classes: {
                    root: y
                }
            }, r.default.createElement(x.AccordionSummary, {
                expandIcon: r.default.createElement(Q.ExpandMoreIcon, null),
                classes: {
                    content: E
                }
            }, r.default.createElement("span", {
                className: "text-heading-small"
            }, b("Title.MoreContentRatings")), r.default.createElement(e8, {
                label: b("Label.".concat(O)),
                variant: lj(O)
            })), r.default.createElement(C.AccordionDetails, null, r.default.createElement("div", {
                className: "flex flex-col gap-medium"
            }, r.default.createElement("span", {
                className: "text-body-medium content-default"
            }, b("Description.MoreContentRatings")), "Pending" === m && (z ? r.default.createElement(lW, {
                description: T(tj.DeveloperQuestionnaire, "Description.U18PendingRatings")
            }) : r.default.createElement(tr, {
                title: "",
                description: b("Description.PendingRatingsAutoUpdate"),
                layout: "Inline",
                variant: "Standard",
                severity: "Info"
            })), r.default.createElement(B.Table, {
                className: "".concat(v, " radius-medium clip")
            }, r.default.createElement(q.TableHead, null, r.default.createElement(P.TableRow, null, r.default.createElement(F.TableCell, null, r.default.createElement("div", {
                className: "flex items-center gap-small"
            }, r.default.createElement("span", {
                className: "text-label-medium"
            }, b("Label.RatingSystem")))), r.default.createElement(F.TableCell, null, r.default.createElement("div", {
                className: "flex items-center gap-small"
            }, r.default.createElement("span", {
                className: "text-label-medium"
            }, b("Label.Rating")))), r.default.createElement(F.TableCell, null, r.default.createElement("div", {
                className: "flex items-center gap-small"
            }, r.default.createElement("span", {
                className: "text-label-medium"
            }, b("Label.InteractiveElements")))), r.default.createElement(F.TableCell, null, r.default.createElement("div", {
                className: "flex items-center gap-small"
            }, r.default.createElement("span", {
                className: "text-label-medium"
            }, b("Label.IARCDescriptors")))), r.default.createElement(F.TableCell, null, r.default.createElement("div", {
                className: "flex items-center gap-small"
            }, r.default.createElement("span", {
                className: "text-label-medium"
            }, b("Label.RobloxDescriptors")))))), r.default.createElement(U.TableBody, null, _.length > 0 ? _.map(e => {
                var t, a, l, n, i, s, o, u, d, c;
                let {
                    product: m,
                    rating: f
                } = e;
                return r.default.createElement(P.TableRow, {
                    key: "".concat(null != (t = m.productId) ? t : "", "-").concat(null != (a = f.ratingAuthorityID) ? a : "", "-").concat(null != (l = f.ageRatingID) ? l : "")
                }, r.default.createElement(F.TableCell, null, r.default.createElement("div", {
                    className: "flex flex-col gap-xsmall"
                }, r.default.createElement("span", {
                    className: "text-body-medium"
                }, null != (n = f.ratingAuthorityShortText) ? n : "—"), f.localizedRegionText && r.default.createElement("span", {
                    className: "text-body-small content-muted"
                }, f.localizedRegionText))), r.default.createElement(F.TableCell, null, r.default.createElement("div", {
                    className: "flex items-center gap-small"
                }, f.ageRatingIconUrl && r.default.createElement("img", {
                    src: f.ageRatingIconUrl,
                    alt: null != (i = f.localizedDisplayText) ? i : "",
                    className: "height-[32px] width-[32px] radius-small"
                }), r.default.createElement("span", {
                    className: "text-body-medium"
                }, null != (s = f.localizedDisplayText) ? s : "—"))), r.default.createElement(F.TableCell, null, r.default.createElement("div", {
                    className: "flex flex-col"
                }, (null != (o = f.interactiveElementList) ? o : []).map(e => {
                    var t;
                    return null != (t = e.localizedDisplayText) ? t : e.interactiveElementText
                }).filter(Boolean).map(e => r.default.createElement("span", {
                    key: e,
                    className: "text-body-medium"
                }, e)), !(null == (d = f.interactiveElementList) ? void 0 : d.length) && r.default.createElement("span", {
                    className: "text-body-medium"
                }, "—"))), r.default.createElement(F.TableCell, null, r.default.createElement("span", {
                    className: "text-body-medium"
                }, null != (u = null == (c = f.descriptorList) ? void 0 : c.map(e => {
                    var t;
                    return null != (t = e.localizedDisplayText) ? t : e.descriptorText
                }).join(", ")) ? u : "—")), r.default.createElement(F.TableCell, null, r.default.createElement("div", {
                    className: "flex flex-col"
                }, k.map(e => r.default.createElement("span", {
                    key: e,
                    className: "text-body-medium"
                }, e)), 0 === k.length && r.default.createElement("span", {
                    className: "text-body-medium"
                }, "—"))))
            }) : r.default.createElement(P.TableRow, null, r.default.createElement(F.TableCell, null, r.default.createElement("span", {
                className: "text-body-medium"
            }, "—")), r.default.createElement(F.TableCell, null, r.default.createElement("span", {
                className: "text-body-medium"
            }, "—")), r.default.createElement(F.TableCell, null, r.default.createElement("span", {
                className: "text-body-medium"
            }, "—")), r.default.createElement(F.TableCell, null, r.default.createElement("span", {
                className: "text-body-medium"
            }, "—")), r.default.createElement(F.TableCell, null, r.default.createElement("span", {
                className: "text-body-medium"
            }, "—")))))))), r.default.createElement(h.Accordion, {
                square: !0,
                variant: "outlined",
                classes: {
                    root: y
                }
            }, r.default.createElement(x.AccordionSummary, {
                expandIcon: r.default.createElement(Q.ExpandMoreIcon, null),
                classes: {
                    content: E
                }
            }, r.default.createElement("span", {
                className: "text-heading-small"
            }, b("Title.NonCompliantRegions")), r.default.createElement(e8, {
                label: b("Label.".concat(G)),
                variant: lj(G)
            })), r.default.createElement(C.AccordionDetails, null, r.default.createElement("div", {
                className: "flex flex-col gap-medium"
            }, r.default.createElement("span", {
                className: "text-body-medium content-default"
            }, S("Description.NonCompliantRegions", [{
                opening: "policyApisLinkStart",
                closing: "policyApisLinkEnd",
                content: e => r.default.createElement(lz, {
                    href: "https://create.roblox.com/docs/reference/engine/classes/PolicyService",
                    target: "_blank"
                }, e)
            }])), r.default.createElement(B.Table, {
                className: "".concat(v, " radius-medium clip")
            }, r.default.createElement(q.TableHead, null, r.default.createElement(P.TableRow, null, r.default.createElement(F.TableCell, null, r.default.createElement("div", {
                className: "flex items-center gap-small"
            }, r.default.createElement("span", {
                className: "text-label-medium"
            }, b("Title.Location")))), r.default.createElement(F.TableCell, null, r.default.createElement("div", {
                className: "flex items-center gap-small"
            }, r.default.createElement("span", {
                className: "text-label-medium"
            }, b("TableHead.Descriptors")))), r.default.createElement(F.TableCell, null, r.default.createElement("div", {
                className: "flex items-center gap-small"
            }, r.default.createElement("span", {
                className: "text-label-medium"
            }, b("Title.GuidelinesAgeRestriction")))))), r.default.createElement(U.TableBody, null, I.length > 0 ? I.map((e, t) => {
                var a, l, n, i, s, o;
                return r.default.createElement(P.TableRow, {
                    key: null != (a = e.countryCode) ? a : t
                }, r.default.createElement(F.TableCell, null, r.default.createElement("span", {
                    className: "text-body-medium"
                }, null != (l = e.countryDisplayName) ? l : "—")), r.default.createElement(F.TableCell, null, r.default.createElement("span", {
                    className: "text-body-medium"
                }, null != (n = null == (s = e.experienceDescriptorUsages) ? void 0 : s.map(e => e.descriptorDisplayName).filter(Boolean).join(", ")) ? n : "—")), r.default.createElement(F.TableCell, null, r.default.createElement("span", {
                    className: "text-body-medium"
                }, null != (i = null == (o = e.experienceDescriptorUsages) ? void 0 : o.map(e => e.ageRangeDisplayName).filter(Boolean).join(", ")) ? i : "—")))
            }) : r.default.createElement(P.TableRow, null, r.default.createElement(F.TableCell, null, r.default.createElement("span", {
                className: "text-body-medium"
            }, "—")), r.default.createElement(F.TableCell, null, r.default.createElement("span", {
                className: "text-body-medium"
            }, "—")), r.default.createElement(F.TableCell, null, r.default.createElement("span", {
                className: "text-body-medium"
            }, "—")))))))))
        };

    function lX(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var a = 0, l = Array(t); a < t; a++) l[a] = e[a];
        return l
    }
    let lJ = Object.entries,
        l$ = Object.setPrototypeOf,
        lZ = Object.isFrozen,
        l0 = Object.getPrototypeOf,
        l1 = Object.getOwnPropertyDescriptor,
        l2 = Object.freeze,
        l4 = Object.seal,
        l3 = Object.create,
        l5 = "u" > typeof Reflect && Reflect,
        l6 = l5.apply,
        l7 = l5.construct;
    l2 || (l2 = function(e) {
        return e
    }), l4 || (l4 = function(e) {
        return e
    }), l6 || (l6 = function(e, t) {
        for (var a = arguments.length, l = Array(a > 2 ? a - 2 : 0), n = 2; n < a; n++) l[n - 2] = arguments[n];
        return e.apply(t, l)
    }), l7 || (l7 = function(e) {
        for (var t = arguments.length, a = Array(t > 1 ? t - 1 : 0), l = 1; l < t; l++) a[l - 1] = arguments[l];
        return new e(...a)
    });
    let l8 = nv(Array.prototype.forEach),
        l9 = nv(Array.prototype.lastIndexOf),
        ne = nv(Array.prototype.pop),
        nt = nv(Array.prototype.push),
        na = nv(Array.prototype.splice),
        nl = Array.isArray,
        nn = nv(String.prototype.toLowerCase),
        nr = nv(String.prototype.toString),
        ni = nv(String.prototype.match),
        ns = nv(String.prototype.replace),
        no = nv(String.prototype.indexOf),
        nu = nv(String.prototype.trim),
        nd = nv(Number.prototype.toString),
        nc = nv(Boolean.prototype.toString),
        nm = "u" < typeof BigInt ? null : nv(BigInt.prototype.toString),
        nf = "u" < typeof Symbol ? null : nv(Symbol.prototype.toString),
        np = nv(Object.prototype.hasOwnProperty),
        ng = nv(Object.prototype.toString),
        ny = nv(RegExp.prototype.test),
        nE = (tH = TypeError, function() {
            for (var e = arguments.length, t = Array(e), a = 0; a < e; a++) t[a] = arguments[a];
            return l7(tH, t)
        });

    function nv(e) {
        return function(t) {
            t instanceof RegExp && (t.lastIndex = 0);
            for (var a = arguments.length, l = Array(a > 1 ? a - 1 : 0), n = 1; n < a; n++) l[n - 1] = arguments[n];
            return l6(e, t, l)
        }
    }

    function nb(e, t) {
        let a = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : nn;
        if (l$ && l$(e, null), !nl(t)) return e;
        let l = t.length;
        for (; l--;) {
            let n = t[l];
            if ("string" == typeof n) {
                let e = a(n);
                e !== n && (lZ(t) || (t[l] = e), n = e)
            }
            e[n] = !0
        }
        return e
    }

    function nh(e) {
        let t = l3(null);
        for (let l of lJ(e)) {
            var a = function(e) {
                if (Array.isArray(e)) return e
            }(l) || function(e) {
                var t = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                if (null != t) {
                    var a, l, n, r, i = [],
                        s = !0,
                        o = !1;
                    try {
                        for (n = (t = t.call(e)).next; !(s = (a = n.call(t)).done) && (i.push(a.value), 2 !== i.length); s = !0);
                    } catch (e) {
                        o = !0, l = e
                    } finally {
                        try {
                            if (!s && null != t.return && (r = t.return(), Object(r) !== r)) return
                        } finally {
                            if (o) throw l
                        }
                    }
                    return i
                }
            }(l) || function(e) {
                if (e) {
                    if ("string" == typeof e) return lX(e, 2);
                    var t = ({}).toString.call(e).slice(8, -1);
                    return "Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t ? Array.from(e) : "Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t) ? lX(e, 2) : void 0
                }
            }(l) || function() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }();
            let n = a[0],
                r = a[1];
            np(e, n) && (nl(r) ? t[n] = function(e) {
                for (let t = 0; t < e.length; t++) np(e, t) || (e[t] = null);
                return e
            }(r) : r && "object" == typeof r && r.constructor === Object ? t[n] = nh(r) : t[n] = r)
        }
        return t
    }

    function nx(e, t) {
        for (; null !== e;) {
            let a = l1(e, t);
            if (a) {
                if (a.get) return nv(a.get);
                if ("function" == typeof a.value) return nv(a.value)
            }
            e = l0(e)
        }
        return function() {
            return null
        }
    }
    let nS = l2(["a", "abbr", "acronym", "address", "area", "article", "aside", "audio", "b", "bdi", "bdo", "big", "blink", "blockquote", "body", "br", "button", "canvas", "caption", "center", "cite", "code", "col", "colgroup", "content", "data", "datalist", "dd", "decorator", "del", "details", "dfn", "dialog", "dir", "div", "dl", "dt", "element", "em", "fieldset", "figcaption", "figure", "font", "footer", "form", "h1", "h2", "h3", "h4", "h5", "h6", "head", "header", "hgroup", "hr", "html", "i", "img", "input", "ins", "kbd", "label", "legend", "li", "main", "map", "mark", "marquee", "menu", "menuitem", "meter", "nav", "nobr", "ol", "optgroup", "option", "output", "p", "picture", "pre", "progress", "q", "rp", "rt", "ruby", "s", "samp", "search", "section", "select", "shadow", "slot", "small", "source", "spacer", "span", "strike", "strong", "style", "sub", "summary", "sup", "table", "tbody", "td", "template", "textarea", "tfoot", "th", "thead", "time", "tr", "track", "tt", "u", "ul", "var", "video", "wbr"]),
        nT = l2(["svg", "a", "altglyph", "altglyphdef", "altglyphitem", "animatecolor", "animatemotion", "animatetransform", "circle", "clippath", "defs", "desc", "ellipse", "enterkeyhint", "exportparts", "filter", "font", "g", "glyph", "glyphref", "hkern", "image", "inputmode", "line", "lineargradient", "marker", "mask", "metadata", "mpath", "part", "path", "pattern", "polygon", "polyline", "radialgradient", "rect", "stop", "style", "switch", "symbol", "text", "textpath", "title", "tref", "tspan", "view", "vkern"]),
        nC = l2(["feBlend", "feColorMatrix", "feComponentTransfer", "feComposite", "feConvolveMatrix", "feDiffuseLighting", "feDisplacementMap", "feDistantLight", "feDropShadow", "feFlood", "feFuncA", "feFuncB", "feFuncG", "feFuncR", "feGaussianBlur", "feImage", "feMerge", "feMergeNode", "feMorphology", "feOffset", "fePointLight", "feSpecularLighting", "feSpotLight", "feTile", "feTurbulence"]),
        nw = l2(["animate", "color-profile", "cursor", "discard", "font-face", "font-face-format", "font-face-name", "font-face-src", "font-face-uri", "foreignobject", "hatch", "hatchpath", "mesh", "meshgradient", "meshpatch", "meshrow", "missing-glyph", "script", "set", "solidcolor", "unknown", "use"]),
        nN = l2(["math", "menclose", "merror", "mfenced", "mfrac", "mglyph", "mi", "mlabeledtr", "mmultiscripts", "mn", "mo", "mover", "mpadded", "mphantom", "mroot", "mrow", "ms", "mspace", "msqrt", "mstyle", "msub", "msup", "msubsup", "mtable", "mtd", "mtext", "mtr", "munder", "munderover", "mprescripts"]),
        nI = l2(["maction", "maligngroup", "malignmark", "mlongdiv", "mscarries", "mscarry", "msgroup", "mstack", "msline", "msrow", "semantics", "annotation", "annotation-xml", "mprescripts", "none"]),
        nA = l2(["#text"]),
        nk = l2(["accept", "action", "align", "alt", "autocapitalize", "autocomplete", "autopictureinpicture", "autoplay", "background", "bgcolor", "border", "capture", "cellpadding", "cellspacing", "checked", "cite", "class", "clear", "color", "cols", "colspan", "command", "commandfor", "controls", "controlslist", "coords", "crossorigin", "datetime", "decoding", "default", "dir", "disabled", "disablepictureinpicture", "disableremoteplayback", "download", "draggable", "enctype", "enterkeyhint", "exportparts", "face", "for", "headers", "height", "hidden", "high", "href", "hreflang", "id", "inert", "inputmode", "integrity", "ismap", "kind", "label", "lang", "list", "loading", "loop", "low", "max", "maxlength", "media", "method", "min", "minlength", "multiple", "muted", "name", "nonce", "noshade", "novalidate", "nowrap", "open", "optimum", "part", "pattern", "placeholder", "playsinline", "popover", "popovertarget", "popovertargetaction", "poster", "preload", "pubdate", "radiogroup", "readonly", "rel", "required", "rev", "reversed", "role", "rows", "rowspan", "spellcheck", "scope", "selected", "shape", "size", "sizes", "slot", "span", "srclang", "start", "src", "srcset", "step", "style", "summary", "tabindex", "title", "translate", "type", "usemap", "valign", "value", "width", "wrap", "xmlns"]),
        nR = l2(["accent-height", "accumulate", "additive", "alignment-baseline", "amplitude", "ascent", "attributename", "attributetype", "azimuth", "basefrequency", "baseline-shift", "begin", "bias", "by", "class", "clip", "clippathunits", "clip-path", "clip-rule", "color", "color-interpolation", "color-interpolation-filters", "color-profile", "color-rendering", "cx", "cy", "d", "dx", "dy", "diffuseconstant", "direction", "display", "divisor", "dur", "edgemode", "elevation", "end", "exponent", "fill", "fill-opacity", "fill-rule", "filter", "filterunits", "flood-color", "flood-opacity", "font-family", "font-size", "font-size-adjust", "font-stretch", "font-style", "font-variant", "font-weight", "fx", "fy", "g1", "g2", "glyph-name", "glyphref", "gradientunits", "gradienttransform", "height", "href", "id", "image-rendering", "in", "in2", "intercept", "k", "k1", "k2", "k3", "k4", "kerning", "keypoints", "keysplines", "keytimes", "lang", "lengthadjust", "letter-spacing", "kernelmatrix", "kernelunitlength", "lighting-color", "local", "marker-end", "marker-mid", "marker-start", "markerheight", "markerunits", "markerwidth", "maskcontentunits", "maskunits", "max", "mask", "mask-type", "media", "method", "mode", "min", "name", "numoctaves", "offset", "operator", "opacity", "order", "orient", "orientation", "origin", "overflow", "paint-order", "path", "pathlength", "patterncontentunits", "patterntransform", "patternunits", "points", "preservealpha", "preserveaspectratio", "primitiveunits", "r", "rx", "ry", "radius", "refx", "refy", "repeatcount", "repeatdur", "restart", "result", "rotate", "scale", "seed", "shape-rendering", "slope", "specularconstant", "specularexponent", "spreadmethod", "startoffset", "stddeviation", "stitchtiles", "stop-color", "stop-opacity", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke", "stroke-width", "style", "surfacescale", "systemlanguage", "tabindex", "tablevalues", "targetx", "targety", "transform", "transform-origin", "text-anchor", "text-decoration", "text-rendering", "textlength", "type", "u1", "u2", "unicode", "values", "viewbox", "visibility", "version", "vert-adv-y", "vert-origin-x", "vert-origin-y", "width", "word-spacing", "wrap", "writing-mode", "xchannelselector", "ychannelselector", "x", "x1", "x2", "xmlns", "y", "y1", "y2", "z", "zoomandpan"]),
        nM = l2(["accent", "accentunder", "align", "bevelled", "close", "columnalign", "columnlines", "columnspacing", "columnspan", "denomalign", "depth", "dir", "display", "displaystyle", "encoding", "fence", "frame", "height", "href", "id", "largeop", "length", "linethickness", "lquote", "lspace", "mathbackground", "mathcolor", "mathsize", "mathvariant", "maxsize", "minsize", "movablelimits", "notation", "numalign", "open", "rowalign", "rowlines", "rowspacing", "rowspan", "rspace", "rquote", "scriptlevel", "scriptminsize", "scriptsizemultiplier", "selection", "separator", "separators", "stretchy", "subscriptshift", "supscriptshift", "symmetric", "voffset", "width", "xmlns"]),
        nD = l2(["xlink:href", "xml:id", "xlink:title", "xml:space", "xmlns:xlink"]),
        nL = l4(/{{[\w\W]*|^[\w\W]*}}/g),
        n_ = l4(/<%[\w\W]*|^[\w\W]*%>/g),
        nO = l4(/\${[\w\W]*/g),
        nB = l4(/^data-[\-\w.\u00B7-\uFFFF]+$/),
        nq = l4(/^aria-[\-\w]+$/),
        nP = l4(/^(?:(?:(?:f|ht)tps?|mailto|tel|callto|sms|cid|xmpp|matrix):|[^a-z]|[a-z+.\-]+(?:[^a-z+.\-:]|$))/i),
        nF = l4(/^(?:\w+script|data):/i),
        nU = l4(/[\u0000-\u0020\u00A0\u1680\u180E\u2000-\u2029\u205F\u3000]/g),
        nG = l4(/^html$/i),
        nQ = l4(/^[a-z][.\w]*(-[.\w]+)+$/i),
        nz = function(e, t) {
            if ("object" != typeof e || "function" != typeof e.createPolicy) return null;
            let a = null,
                l = "data-tt-policy-suffix";
            t && t.hasAttribute(l) && (a = t.getAttribute(l));
            let n = "dompurify" + (a ? "#" + a : "");
            try {
                return e.createPolicy(n, {
                    createHTML: e => e,
                    createScriptURL: e => e
                })
            } catch (e) {
                return console.warn("TrustedTypes policy " + n + " could not be created."), null
            }
        },
        nH = function() {
            return {
                afterSanitizeAttributes: [],
                afterSanitizeElements: [],
                afterSanitizeShadowDOM: [],
                beforeSanitizeAttributes: [],
                beforeSanitizeElements: [],
                beforeSanitizeShadowDOM: [],
                uponSanitizeAttribute: [],
                uponSanitizeElement: [],
                uponSanitizeShadowNode: []
            }
        };
    var nV = function e() {
        let t, a = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : window,
            l = t => e(t);
        if (l.version = "3.4.5", l.removed = [], !a || !a.document || 9 !== a.document.nodeType || !a.Element) return l.isSupported = !1, l;
        let n = a.document,
            r = n,
            i = r.currentScript,
            s = a.DocumentFragment,
            o = a.HTMLTemplateElement,
            u = a.Node,
            d = a.Element,
            c = a.NodeFilter,
            m = a.NamedNodeMap,
            f = void 0 === m ? a.NamedNodeMap || a.MozNamedAttrMap : m,
            p = a.HTMLFormElement,
            g = a.DOMParser,
            y = a.trustedTypes,
            E = d.prototype,
            v = nx(E, "cloneNode"),
            b = nx(E, "remove"),
            h = nx(E, "nextSibling"),
            x = nx(E, "childNodes"),
            S = nx(E, "parentNode"),
            T = u && u.prototype ? nx(u.prototype, "nodeType") : null;
        if ("function" == typeof o) {
            let e = n.createElement("template");
            e.content && e.content.ownerDocument && (n = e.content.ownerDocument)
        }
        let C = "",
            w = n,
            N = w.implementation,
            I = w.createNodeIterator,
            A = w.createDocumentFragment,
            k = w.getElementsByTagName,
            R = r.importNode,
            M = nH();
        l.isSupported = "function" == typeof lJ && "function" == typeof S && N && void 0 !== N.createHTMLDocument;
        let D = nP,
            L = null,
            _ = nb({}, [...nS, ...nT, ...nC, ...nN, ...nA]),
            O = null,
            B = nb({}, [...nk, ...nR, ...nM, ...nD]),
            q = Object.seal(l3(null, {
                tagNameCheck: {
                    writable: !0,
                    configurable: !1,
                    enumerable: !0,
                    value: null
                },
                attributeNameCheck: {
                    writable: !0,
                    configurable: !1,
                    enumerable: !0,
                    value: null
                },
                allowCustomizedBuiltInElements: {
                    writable: !0,
                    configurable: !1,
                    enumerable: !0,
                    value: !1
                }
            })),
            P = null,
            F = null,
            U = Object.seal(l3(null, {
                tagCheck: {
                    writable: !0,
                    configurable: !1,
                    enumerable: !0,
                    value: null
                },
                attributeCheck: {
                    writable: !0,
                    configurable: !1,
                    enumerable: !0,
                    value: null
                }
            })),
            G = !0,
            Q = !0,
            z = !1,
            H = !0,
            V = !1,
            W = !0,
            j = !1,
            K = !1,
            Y = !1,
            X = !1,
            J = !1,
            $ = !1,
            Z = !0,
            ee = !1,
            et = "user-content-",
            ea = !0,
            el = !1,
            en = {},
            er = null,
            ei = nb({}, ["annotation-xml", "audio", "colgroup", "desc", "foreignobject", "head", "iframe", "math", "mi", "mn", "mo", "ms", "mtext", "noembed", "noframes", "noscript", "plaintext", "script", "style", "svg", "template", "thead", "title", "video", "xmp"]),
            es = null,
            eo = nb({}, ["audio", "video", "img", "source", "image", "track"]),
            eu = null,
            ed = nb({}, ["alt", "class", "for", "id", "label", "name", "pattern", "placeholder", "role", "summary", "title", "value", "style", "xmlns"]),
            ec = "http://www.w3.org/1998/Math/MathML",
            em = "http://www.w3.org/2000/svg",
            ef = "http://www.w3.org/1999/xhtml",
            ep = ef,
            eg = !1,
            ey = null,
            eE = nb({}, [ec, em, ef], nr),
            ev = nb({}, ["mi", "mo", "mn", "ms", "mtext"]),
            eb = nb({}, ["annotation-xml"]),
            eh = nb({}, ["title", "style", "font", "a", "script"]),
            ex = null,
            eS = ["application/xhtml+xml", "text/html"],
            eT = null,
            eC = null,
            ew = n.createElement("form"),
            eN = function(e) {
                return e instanceof RegExp || e instanceof Function
            },
            eI = function() {
                let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                if (eC && eC === e) return;
                e && "object" == typeof e || (e = {}), e = nh(e), eT = "application/xhtml+xml" === (ex = -1 === eS.indexOf(e.PARSER_MEDIA_TYPE) ? "text/html" : e.PARSER_MEDIA_TYPE) ? nr : nn, L = np(e, "ALLOWED_TAGS") && nl(e.ALLOWED_TAGS) ? nb({}, e.ALLOWED_TAGS, eT) : _, O = np(e, "ALLOWED_ATTR") && nl(e.ALLOWED_ATTR) ? nb({}, e.ALLOWED_ATTR, eT) : B, ey = np(e, "ALLOWED_NAMESPACES") && nl(e.ALLOWED_NAMESPACES) ? nb({}, e.ALLOWED_NAMESPACES, nr) : eE, eu = np(e, "ADD_URI_SAFE_ATTR") && nl(e.ADD_URI_SAFE_ATTR) ? nb(nh(ed), e.ADD_URI_SAFE_ATTR, eT) : ed, es = np(e, "ADD_DATA_URI_TAGS") && nl(e.ADD_DATA_URI_TAGS) ? nb(nh(eo), e.ADD_DATA_URI_TAGS, eT) : eo, er = np(e, "FORBID_CONTENTS") && nl(e.FORBID_CONTENTS) ? nb({}, e.FORBID_CONTENTS, eT) : ei, P = np(e, "FORBID_TAGS") && nl(e.FORBID_TAGS) ? nb({}, e.FORBID_TAGS, eT) : nh({}), F = np(e, "FORBID_ATTR") && nl(e.FORBID_ATTR) ? nb({}, e.FORBID_ATTR, eT) : nh({}), en = !!np(e, "USE_PROFILES") && (e.USE_PROFILES && "object" == typeof e.USE_PROFILES ? nh(e.USE_PROFILES) : e.USE_PROFILES), G = !1 !== e.ALLOW_ARIA_ATTR, Q = !1 !== e.ALLOW_DATA_ATTR, z = e.ALLOW_UNKNOWN_PROTOCOLS || !1, H = !1 !== e.ALLOW_SELF_CLOSE_IN_ATTR, V = e.SAFE_FOR_TEMPLATES || !1, W = !1 !== e.SAFE_FOR_XML, j = e.WHOLE_DOCUMENT || !1, X = e.RETURN_DOM || !1, J = e.RETURN_DOM_FRAGMENT || !1, $ = e.RETURN_TRUSTED_TYPE || !1, Y = e.FORCE_BODY || !1, Z = !1 !== e.SANITIZE_DOM, ee = e.SANITIZE_NAMED_PROPS || !1, ea = !1 !== e.KEEP_CONTENT, el = e.IN_PLACE || !1, D = ! function(e) {
                    try {
                        return ny(e, ""), !0
                    } catch (e) {
                        return !1
                    }
                }(e.ALLOWED_URI_REGEXP) ? nP : e.ALLOWED_URI_REGEXP, ep = "string" == typeof e.NAMESPACE ? e.NAMESPACE : ef, ev = np(e, "MATHML_TEXT_INTEGRATION_POINTS") && e.MATHML_TEXT_INTEGRATION_POINTS && "object" == typeof e.MATHML_TEXT_INTEGRATION_POINTS ? nh(e.MATHML_TEXT_INTEGRATION_POINTS) : nb({}, ["mi", "mo", "mn", "ms", "mtext"]), eb = np(e, "HTML_INTEGRATION_POINTS") && e.HTML_INTEGRATION_POINTS && "object" == typeof e.HTML_INTEGRATION_POINTS ? nh(e.HTML_INTEGRATION_POINTS) : nb({}, ["annotation-xml"]);
                let a = np(e, "CUSTOM_ELEMENT_HANDLING") && e.CUSTOM_ELEMENT_HANDLING && "object" == typeof e.CUSTOM_ELEMENT_HANDLING ? nh(e.CUSTOM_ELEMENT_HANDLING) : l3(null);
                if (q = l3(null), np(a, "tagNameCheck") && eN(a.tagNameCheck) && (q.tagNameCheck = a.tagNameCheck), np(a, "attributeNameCheck") && eN(a.attributeNameCheck) && (q.attributeNameCheck = a.attributeNameCheck), np(a, "allowCustomizedBuiltInElements") && "boolean" == typeof a.allowCustomizedBuiltInElements && (q.allowCustomizedBuiltInElements = a.allowCustomizedBuiltInElements), V && (Q = !1), J && (X = !0), en && (L = nb({}, nA), O = l3(null), !0 === en.html && (nb(L, nS), nb(O, nk)), !0 === en.svg && (nb(L, nT), nb(O, nR), nb(O, nD)), !0 === en.svgFilters && (nb(L, nC), nb(O, nR), nb(O, nD)), !0 === en.mathMl && (nb(L, nN), nb(O, nM), nb(O, nD))), U.tagCheck = null, U.attributeCheck = null, np(e, "ADD_TAGS") && ("function" == typeof e.ADD_TAGS ? U.tagCheck = e.ADD_TAGS : nl(e.ADD_TAGS) && (L === _ && (L = nh(L)), nb(L, e.ADD_TAGS, eT))), np(e, "ADD_ATTR") && ("function" == typeof e.ADD_ATTR ? U.attributeCheck = e.ADD_ATTR : nl(e.ADD_ATTR) && (O === B && (O = nh(O)), nb(O, e.ADD_ATTR, eT))), np(e, "ADD_URI_SAFE_ATTR") && nl(e.ADD_URI_SAFE_ATTR) && nb(eu, e.ADD_URI_SAFE_ATTR, eT), np(e, "FORBID_CONTENTS") && nl(e.FORBID_CONTENTS) && (er === ei && (er = nh(er)), nb(er, e.FORBID_CONTENTS, eT)), np(e, "ADD_FORBID_CONTENTS") && nl(e.ADD_FORBID_CONTENTS) && (er === ei && (er = nh(er)), nb(er, e.ADD_FORBID_CONTENTS, eT)), ea && (L["#text"] = !0), j && nb(L, ["html", "head", "body"]), L.table && (nb(L, ["tbody"]), delete P.tbody), e.TRUSTED_TYPES_POLICY) {
                    if ("function" != typeof e.TRUSTED_TYPES_POLICY.createHTML) throw nE('TRUSTED_TYPES_POLICY configuration option must provide a "createHTML" hook.');
                    if ("function" != typeof e.TRUSTED_TYPES_POLICY.createScriptURL) throw nE('TRUSTED_TYPES_POLICY configuration option must provide a "createScriptURL" hook.');
                    C = (t = e.TRUSTED_TYPES_POLICY).createHTML("")
                } else void 0 === t && (t = nz(y, i)), null !== t && "string" == typeof C && (C = t.createHTML(""));
                l2 && l2(e), eC = e
            },
            eA = nb({}, [...nT, ...nC, ...nw]),
            ek = nb({}, [...nN, ...nI]),
            eR = function(e) {
                let t = S(e);
                t && t.tagName || (t = {
                    namespaceURI: ep,
                    tagName: "template"
                });
                let a = nn(e.tagName),
                    l = nn(t.tagName);
                return !!ey[e.namespaceURI] && (e.namespaceURI === em ? t.namespaceURI === ef ? "svg" === a : t.namespaceURI === ec ? "svg" === a && ("annotation-xml" === l || ev[l]) : !!eA[a] : e.namespaceURI === ec ? t.namespaceURI === ef ? "math" === a : t.namespaceURI === em ? "math" === a && eb[l] : !!ek[a] : e.namespaceURI === ef ? (t.namespaceURI !== em || !!eb[l]) && (t.namespaceURI !== ec || !!ev[l]) && !ek[a] && (eh[a] || !eA[a]) : "application/xhtml+xml" === ex && !!ey[e.namespaceURI])
            },
            eM = function(e) {
                nt(l.removed, {
                    element: e
                });
                try {
                    S(e).removeChild(e)
                } catch (t) {
                    b(e)
                }
            },
            eD = function(e, t) {
                try {
                    nt(l.removed, {
                        attribute: t.getAttributeNode(e),
                        from: t
                    })
                } catch (e) {
                    nt(l.removed, {
                        attribute: null,
                        from: t
                    })
                }
                if (t.removeAttribute(e), "is" === e)
                    if (X || J) try {
                        eM(t)
                    } catch (e) {} else try {
                        t.setAttribute(e, "")
                    } catch (e) {}
            },
            eL = function(e) {
                let a = null,
                    l = null;
                if (Y) e = "<remove></remove>" + e;
                else {
                    let t = ni(e, /^[\r\n\t ]+/);
                    l = t && t[0]
                }
                "application/xhtml+xml" === ex && ep === ef && (e = '<html xmlns="http://www.w3.org/1999/xhtml"><head></head><body>' + e + "</body></html>");
                let r = t ? t.createHTML(e) : e;
                if (ep === ef) try {
                    a = new g().parseFromString(r, ex)
                } catch (e) {}
                if (!a || !a.documentElement) {
                    a = N.createDocument(ep, "template", null);
                    try {
                        a.documentElement.innerHTML = eg ? C : r
                    } catch (e) {}
                }
                let i = a.body || a.documentElement;
                return (e && l && i.insertBefore(n.createTextNode(l), i.childNodes[0] || null), ep === ef) ? k.call(a, j ? "html" : "body")[0] : j ? a.documentElement : i
            },
            e_ = function(e) {
                return I.call(e.ownerDocument || e, e, c.SHOW_ELEMENT | c.SHOW_COMMENT | c.SHOW_TEXT | c.SHOW_PROCESSING_INSTRUCTION | c.SHOW_CDATA_SECTION, null)
            },
            eO = function(e) {
                e.normalize();
                let t = I.call(e.ownerDocument || e, e, c.SHOW_TEXT | c.SHOW_COMMENT | c.SHOW_CDATA_SECTION | c.SHOW_PROCESSING_INSTRUCTION, null),
                    a = t.nextNode();
                for (; a;) {
                    let e = a.data;
                    l8([nL, n_, nO], t => {
                        e = ns(e, t, " ")
                    }), a.data = e, a = t.nextNode()
                }
            },
            eB = function(e) {
                return e instanceof p && ("string" != typeof e.nodeName || "string" != typeof e.textContent || "function" != typeof e.removeChild || !(e.attributes instanceof f) || "function" != typeof e.removeAttribute || "function" != typeof e.setAttribute || "string" != typeof e.namespaceURI || "function" != typeof e.insertBefore || "function" != typeof e.hasChildNodes)
            },
            eq = function(e) {
                if (!T || "object" != typeof e || null === e) return !1;
                try {
                    return "number" == typeof T(e)
                } catch (e) {
                    return !1
                }
            };

        function eP(e, t, a) {
            l8(e, e => {
                e.call(l, t, a, eC)
            })
        }
        let eF = function(e) {
                let t = null;
                if (eP(M.beforeSanitizeElements, e, null), eB(e)) return eM(e), !0;
                let a = eT(e.nodeName);
                if (eP(M.uponSanitizeElement, e, {
                        tagName: a,
                        allowedTags: L
                    }), W && e.hasChildNodes() && !eq(e.firstElementChild) && ny(/<[/\w!]/g, e.innerHTML) && ny(/<[/\w!]/g, e.textContent) || W && e.namespaceURI === ef && "style" === a && eq(e.firstElementChild) || 7 === e.nodeType || W && 8 === e.nodeType && ny(/<[/\w]/g, e.data)) return eM(e), !0;
                if (P[a] || !(U.tagCheck instanceof Function && U.tagCheck(a)) && !L[a]) {
                    if (!P[a] && eQ(a) && (q.tagNameCheck instanceof RegExp && ny(q.tagNameCheck, a) || q.tagNameCheck instanceof Function && q.tagNameCheck(a))) return !1;
                    if (ea && !er[a]) {
                        let t = S(e) || e.parentNode,
                            a = x(e) || e.childNodes;
                        if (a && t) {
                            let l = a.length;
                            for (let n = l - 1; n >= 0; --n) {
                                let l = v(a[n], !0);
                                t.insertBefore(l, h(e))
                            }
                        }
                    }
                    return eM(e), !0
                }
                return e instanceof d && !eR(e) || ("noscript" === a || "noembed" === a || "noframes" === a) && ny(/<\/no(script|embed|frames)/i, e.innerHTML) ? (eM(e), !0) : (V && 3 === e.nodeType && (t = e.textContent, l8([nL, n_, nO], e => {
                    t = ns(t, e, " ")
                }), e.textContent !== t && (nt(l.removed, {
                    element: e.cloneNode()
                }), e.textContent = t)), eP(M.afterSanitizeElements, e, null), !1)
            },
            eU = function(e, t, a) {
                if (F[t] || Z && ("id" === t || "name" === t) && (a in n || a in ew)) return !1;
                let l = O[t] || U.attributeCheck instanceof Function && U.attributeCheck(t, e);
                if (Q && !F[t] && ny(nB, t));
                else if (G && ny(nq, t));
                else if (!l || F[t]) {
                    if (!(eQ(e) && (q.tagNameCheck instanceof RegExp && ny(q.tagNameCheck, e) || q.tagNameCheck instanceof Function && q.tagNameCheck(e)) && (q.attributeNameCheck instanceof RegExp && ny(q.attributeNameCheck, t) || q.attributeNameCheck instanceof Function && q.attributeNameCheck(t, e)) || "is" === t && q.allowCustomizedBuiltInElements && (q.tagNameCheck instanceof RegExp && ny(q.tagNameCheck, a) || q.tagNameCheck instanceof Function && q.tagNameCheck(a)))) return !1
                } else if (eu[t]);
                else if (ny(D, ns(a, nU, "")));
                else if (("src" === t || "xlink:href" === t || "href" === t) && "script" !== e && 0 === no(a, "data:") && es[e]);
                else if (z && !ny(nF, ns(a, nU, "")));
                else if (a) return !1;
                return !0
            },
            eG = nb({}, ["annotation-xml", "color-profile", "font-face", "font-face-format", "font-face-name", "font-face-src", "font-face-uri", "missing-glyph"]),
            eQ = function(e) {
                return !eG[nn(e)] && ny(nQ, e)
            },
            ez = function(e) {
                eP(M.beforeSanitizeAttributes, e, null);
                let a = e.attributes;
                if (!a || eB(e)) return;
                let n = {
                        attrName: "",
                        attrValue: "",
                        keepAttr: !0,
                        allowedAttributes: O,
                        forceKeepAttr: void 0
                    },
                    r = a.length;
                for (; r--;) {
                    let i = a[r],
                        s = i.name,
                        o = i.namespaceURI,
                        u = i.value,
                        d = eT(s),
                        c = "value" === s ? u : nu(u);
                    if (n.attrName = d, n.attrValue = c, n.keepAttr = !0, n.forceKeepAttr = void 0, eP(M.uponSanitizeAttribute, e, n), c = n.attrValue, ee && ("id" === d || "name" === d) && 0 !== no(c, et) && (eD(s, e), c = et + c), W && ny(/((--!?|])>)|<\/(style|script|title|xmp|textarea|noscript|iframe|noembed|noframes)/i, c) || "attributename" === d && ni(c, "href")) {
                        eD(s, e);
                        continue
                    }
                    if (n.forceKeepAttr) continue;
                    if (!n.keepAttr || !H && ny(/\/>/i, c)) {
                        eD(s, e);
                        continue
                    }
                    V && l8([nL, n_, nO], e => {
                        c = ns(c, e, " ")
                    });
                    let m = eT(e.nodeName);
                    if (!eU(m, d, c)) {
                        eD(s, e);
                        continue
                    }
                    if (t && "object" == typeof y && "function" == typeof y.getAttributeType)
                        if (o);
                        else switch (y.getAttributeType(m, d)) {
                            case "TrustedHTML":
                                c = t.createHTML(c);
                                break;
                            case "TrustedScriptURL":
                                c = t.createScriptURL(c)
                        }
                    if (c !== u) try {
                        o ? e.setAttributeNS(o, s, c) : e.setAttribute(s, c), eB(e) ? eM(e) : ne(l.removed)
                    } catch (t) {
                        eD(s, e)
                    }
                }
                eP(M.afterSanitizeAttributes, e, null)
            },
            eH = function(e) {
                let t = null,
                    a = e_(e);
                for (eP(M.beforeSanitizeShadowDOM, e, null); t = a.nextNode();) eP(M.uponSanitizeShadowNode, t, null), eF(t), ez(t), t.content instanceof s && eH(t.content);
                eP(M.afterSanitizeShadowDOM, e, null)
            },
            eV = function(e) {
                if (1 === e.nodeType && e.shadowRoot instanceof s) {
                    let t = e.shadowRoot;
                    eV(t), eH(t)
                }
                let t = e.childNodes;
                if (!t) return;
                let a = [];
                for (let e of (l8(t, e => {
                        nt(a, e)
                    }), a)) eV(e)
            };
        return l.sanitize = function(e) {
            let a = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                n = null,
                i = null,
                o = null,
                u = null;
            if ((eg = !e) && (e = "<!-->"), "string" != typeof e && !eq(e) && "string" != typeof(e = function(e) {
                    switch (typeof e) {
                        case "string":
                            return e;
                        case "number":
                            return nd(e);
                        case "boolean":
                            return nc(e);
                        case "bigint":
                            return nm ? nm(e) : "0";
                        case "symbol":
                            return nf ? nf(e) : "Symbol()";
                        case "undefined":
                        default:
                            return ng(e);
                        case "function":
                        case "object": {
                            if (null === e) return ng(e);
                            let t = nx(e, "toString");
                            if ("function" == typeof t) {
                                let a = t(e);
                                return "string" == typeof a ? a : ng(a)
                            }
                            return ng(e)
                        }
                    }
                }(e))) throw nE("dirty is not a string, aborting");
            if (!l.isSupported) return e;
            if (K || eI(a), l.removed = [], "string" == typeof e && (el = !1), el) {
                let t = e.nodeName;
                if ("string" == typeof t) {
                    let e = eT(t);
                    if (!L[e] || P[e]) throw nE("root node is forbidden and cannot be sanitized in-place")
                }
                eV(e)
            } else if (eq(e)) 1 === (i = (n = eL("<!---->")).ownerDocument.importNode(e, !0)).nodeType && "BODY" === i.nodeName || "HTML" === i.nodeName ? n = i : n.appendChild(i), eV(i);
            else {
                if (!X && !V && !j && -1 === e.indexOf("<")) return t && $ ? t.createHTML(e) : e;
                if (!(n = eL(e))) return X ? null : $ ? C : ""
            }
            n && Y && eM(n.firstChild);
            let d = e_(el ? e : n);
            for (; o = d.nextNode();) eF(o), ez(o), o.content instanceof s && eH(o.content);
            if (el) return V && eO(e), e;
            if (X) {
                if (V && eO(n), J)
                    for (u = A.call(n.ownerDocument); n.firstChild;) u.appendChild(n.firstChild);
                else u = n;
                return (O.shadowroot || O.shadowrootmode) && (u = R.call(r, u, !0)), u
            }
            let c = j ? n.outerHTML : n.innerHTML;
            return j && L["!doctype"] && n.ownerDocument && n.ownerDocument.doctype && n.ownerDocument.doctype.name && ny(nG, n.ownerDocument.doctype.name) && (c = "<!DOCTYPE " + n.ownerDocument.doctype.name + ">\n" + c), V && l8([nL, n_, nO], e => {
                c = ns(c, e, " ")
            }), t && $ ? t.createHTML(c) : c
        }, l.setConfig = function() {
            let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
            eI(e), K = !0
        }, l.clearConfig = function() {
            eC = null, K = !1
        }, l.isValidAttribute = function(e, t, a) {
            return eC || eI({}), eU(eT(e), eT(t), a)
        }, l.addHook = function(e, t) {
            "function" == typeof t && nt(M[e], t)
        }, l.removeHook = function(e, t) {
            if (void 0 !== t) {
                let a = l9(M[e], t);
                return -1 === a ? void 0 : na(M[e], a, 1)[0]
            }
            return ne(M[e])
        }, l.removeHooks = function(e) {
            M[e] = []
        }, l.removeAllHooks = function() {
            M = nH()
        }, l
    }();
    let nW = null;
    var nj = (0, i.withTranslation)(e => {
            let {
                events: t,
                initialSelectedEvent: a,
                onSelectedEventChange: l
            } = e, {
                translate: n
            } = (0, i.useTranslation)(), {
                locale: s
            } = (0, i.useLocalization)(), [o, u] = (0, r.useState)(null), d = e => {
                let t = new Date(e);
                return Number.isNaN(t.getTime()) ? e : new Intl.DateTimeFormat(null != s ? s : void 0, {
                    dateStyle: "medium",
                    timeStyle: "short"
                }).format(t)
            }, c = e => {
                u(e), null == l || l(e)
            };
            return ((0, r.useEffect)(() => {
                a && (u(a), null == l || l(a))
            }, [a]), t && 0 !== t.length) ? r.default.createElement(r.default.Fragment, null, r.default.createElement(tu, null, t.map(e => r.default.createElement(to, {
                key: e.id,
                title: e.title,
                description: d(e.createTime),
                link: e.details ? r.default.createElement("span", {
                    role: "button",
                    tabIndex: 0,
                    className: "text-body-medium content-link cursor-pointer",
                    onClick: () => c(e),
                    onKeyDown: t => {
                        ("Enter" === t.key || " " === t.key) && c(e)
                    }
                }, "View") : void 0
            }))), r.default.createElement(J.Dialog, {
                open: null !== o,
                onOpenChange: e => {
                    e || c(null)
                },
                size: "Large",
                isModal: !0,
                hasCloseAffordance: !0,
                closeLabel: "Close"
            }, r.default.createElement(J.DialogContent, null, r.default.createElement(J.DialogBody, {
                className: "flex flex-col gap-y-xsmall scroll-y max-height-[70vh]"
            }, r.default.createElement(J.DialogTitle, {
                className: "text-heading-small margin-none"
            }, null == o ? void 0 : o.title), r.default.createElement("div", {
                className: "flex flex-col gap-y-xxlarge"
            }, r.default.createElement("div", {
                className: "flex flex-col"
            }, r.default.createElement("span", {
                className: "text-title-large"
            }, "Date"), r.default.createElement("span", {
                className: "text-body-large"
            }, o ? d(o.createTime) : "")), (null == o ? void 0 : o.details) && r.default.createElement("div", {
                className: "flex flex-col"
            }, r.default.createElement("span", {
                className: "text-title-large"
            }, "Details"), r.default.createElement("div", {
                className: "text-body-large",
                dangerouslySetInnerHTML: {
                    __html: (!nW && (nW = nV(window)).addHook("afterSanitizeAttributes", e => {
                        "a" === e.tagName.toLowerCase() && (e.setAttribute("target", "_blank"), e.setAttribute("rel", "noopener noreferrer"))
                    }), nW).sanitize(o.details, {
                        ALLOWED_TAGS: ["b", "i", "u", "s", "br", "p", "ol", "li", "strong", "a", "em"],
                        ALLOWED_ATTR: ["href", "target", "rel"]
                    })
                }
            })))), r.default.createElement(J.DialogFooter, {
                className: "flex gap-x-small"
            }, r.default.createElement(eV.Button, {
                variant: "Standard",
                size: "Medium",
                className: "fill basis-0",
                onClick: () => c(null)
            }, "Close"))))) : r.default.createElement("div", {
                className: "flex flex-col items-center justify-center padding-xlarge"
            }, r.default.createElement("span", {
                className: "text-body-medium content-muted"
            }, n("Description.NoActivity")))
        }, [tj.Navigation, tj.DeveloperQuestionnaire, tj.Error]),
        nK = (0, i.withTranslation)(e => {
            let {
                universeId: t,
                onStartQuestionnaire: a,
                showSubmissionSuccessAlert: l,
                onDismissSubmissionSuccessAlert: n,
                isOverEighteenQuestionnaire: o
            } = e, {
                translate: u,
                translateHTML: d
            } = (0, i.useTranslation)(), {
                locale: c
            } = (0, i.useLocalization)(), m = (0, s.useRouter)(), [f, p] = (0, r.useState)("ratings"), [g, y] = (0, r.useState)(!0), [E, v] = (0, r.useState)(!0), [b, h] = (0, r.useState)(!1), x = (0, r.useRef)(!1), [S, T] = (0, r.useState)(null), C = "string" == typeof m.query.activityLogId ? m.query.activityLogId : void 0, {
                data: w = []
            } = (0, j.useQuery)({
                queryKey: ["iarcActivityService", "listIarcActivities", t],
                queryFn: async () => {
                    var e, a;
                    try {
                        return (null != (e = (await a8().v1UniversesUniverseIdIarcActivitiesGet({
                            universeId: t,
                            pageSize: void 0,
                            pageToken: void 0
                        })).iarcActivities) ? e : []).map((e, t) => {
                            var a, l;
                            let n;
                            return {
                                id: "".concat(e.universeId, "-").concat(t),
                                type: lm(e.type),
                                title: lc(e.type),
                                details: null != (a = e.details) ? a : "",
                                createTime: null != (l = e.createTime) ? l : "",
                                user: (n = e.type, "IARC_ACTIVITY_TYPE_QUESTIONNAIRE_SUBMITTED" !== n) ? "System" : "You"
                            }
                        })
                    } catch (e) {
                        if (404 === (null == (a = a4(e)) ? void 0 : a.status)) return [];
                        throw e
                    }
                },
                retry: le
            }), {
                data: N
            } = (0, j.useQuery)({
                queryKey: ["iarcActivityService", "getIarcActivity", t, C],
                queryFn: void 0 === C ? K.skipToken : async () => {
                    var e, a, l;
                    try {
                        let l, n = (await a8().v1UniversesUniverseIdIarcActivitiesIdGet({
                            universeId: t,
                            id: C
                        })).iarcActivity;
                        if (!n) return null;
                        return {
                            id: C,
                            type: lm(n.type),
                            title: lc(n.type),
                            details: null != (e = n.details) ? e : "",
                            createTime: null != (a = n.createTime) ? a : "",
                            user: (l = n.type, "IARC_ACTIVITY_TYPE_QUESTIONNAIRE_SUBMITTED" !== l) ? "System" : "You"
                        }
                    } catch (e) {
                        if (404 === (null == (l = a4(e)) ? void 0 : l.status)) return null;
                        throw e
                    }
                },
                retry: le
            });
            (0, r.useEffect)(() => {
                !x.current && C && N && (x.current = !0, p("activity"), T(N))
            }, [C, N]);
            let I = (0, r.useCallback)(async e => {
                    let {
                        activityLogId: t,
                        ...a
                    } = m.query;
                    await m.replace({
                        pathname: m.pathname,
                        query: e ? {
                            ...a,
                            activityLogId: e.id
                        } : a
                    }, void 0, {
                        shallow: !0
                    })
                }, [m]),
                {
                    data: A
                } = lo(t),
                {
                    data: k
                } = ld(t),
                {
                    data: R,
                    isLoading: M
                } = lu(t),
                {
                    ratingsStatus: D,
                    nonCompliantRegionStatus: L
                } = (0, r.useMemo)(() => {
                    var e;
                    let t = null == R ? void 0 : R.statuses;
                    if (!t || 0 === t.length) return {
                        ratingsStatus: "NotStarted",
                        nonCompliantRegionStatus: "NotStarted"
                    };
                    let a = null == (e = t[0].externalState) ? void 0 : e.toLowerCase(),
                        l = "NotStarted";
                    return "assigned" === a ? l = "Assigned" : "pending" === a ? l = "Pending" : "rejected" === a && (l = "Rejected"), {
                        ratingsStatus: l,
                        nonCompliantRegionStatus: l
                    }
                }, [R]),
                _ = (null == k ? void 0 : k.status) === tM.MetadataStatus.Incomplete,
                O = null == A ? void 0 : A.moderation,
                B = (null == O ? void 0 : O.moderationStatus) === tL.V2Beta1ModerationStatus.Rejected;
            return r.default.createElement("div", {
                className: "flex flex-col gap-xxlarge"
            }, l && r.default.createElement(tr, {
                title: u("Alert.QuestionnaireSubmittedTitle"),
                description: u("Alert.QuestionnaireSubmittedResponse"),
                layout: "Inline",
                variant: "Standard",
                severity: "Success",
                onDismiss: n
            }), g && r.default.createElement(tr, {
                title: "",
                description: u("Description.IARCQuestionnaireOverviewBannerMarch"),
                layout: "Inline",
                variant: "Emphasis",
                severity: "Info",
                primaryActionLabel: u("Action.ViewDetails"),
                onPrimaryAction: () => window.open("https://create.roblox.com/docs/production/publishing/content-ratings", "_blank"),
                onDismiss: () => y(!1)
            }), B && E && r.default.createElement(tr, {
                title: "",
                description: (null == A ? void 0 : A.submitBy) ? u("Description.ModerationBannerWillBeUnrated", {
                    moderationGracePeriodEnd: new Intl.DateTimeFormat(null != c ? c : void 0, {
                        dateStyle: "medium",
                        timeStyle: "short"
                    }).format(new Date(A.submitBy))
                }) : u("Description.ModerationBannerUnrated"),
                layout: "Inline",
                variant: "Emphasis",
                severity: "Warning",
                primaryActionLabel: u("Action.LearnMore"),
                onPrimaryAction: () => window.open("https://create.roblox.com/docs/production/publishing/content-ratings", "_blank"),
                onDismiss: () => v(!1)
            }), _ && r.default.createElement(ty, {
                title: u("Alert.QuestionnaireMetadataIncompleteTitle"),
                description: u("Alert.QuestionnaireMetadataIncompleteMessage"),
                variant: "Standard",
                severity: "Warning",
                primaryActionLabel: u("Action.AddNow"),
                onPrimaryAction: () => window.open("/dashboard/creations/experiences/".concat(t, "/configure"), "_blank")
            }), r.default.createElement("h1", {
                className: "text-heading-large margin-none"
            }, u("Heading.MaturityAndComplianceQuestionnaireV2")), r.default.createElement("div", null, r.default.createElement("span", {
                className: "text-body-medium"
            }, d("Description.IARCQuestionnaireOverviewMarch", [{
                opening: "maturityRatingLinkStart",
                closing: "maturityRatingLinkEnd",
                content: e => r.default.createElement(lz, {
                    href: "https://create.roblox.com/docs/production/publishing/content-ratings",
                    target: "_blank"
                }, e)
            }]))), r.default.createElement("div", {
                className: "flex gap-small items-center"
            }, r.default.createElement(eV.Button, {
                onClick: a,
                size: "Medium",
                variant: "Emphasis",
                isDisabled: _,
                isLoading: M
            }, u("NotStarted" === D ? "Action.GetRating" : "Action.GetANewRating")), B && r.default.createElement(eV.Button, {
                onClick: () => h(!0),
                size: "Medium",
                variant: "Standard"
            }, u("Action.ReviewModeratorFeedback"))), B && O && r.default.createElement(lV, {
                open: b,
                onClose: () => h(!1),
                moderation: O
            }), r.default.createElement(ei, {
                value: f,
                onValueChange: p,
                size: "Large",
                variant: "Contained",
                fitBehavior: "Fit"
            }, r.default.createElement(es, null, r.default.createElement(eo, {
                value: "ratings"
            }, u("Tab.Ratings")), r.default.createElement(eo, {
                value: "activity"
            }, u("Tab.Activity"))), r.default.createElement(eu, {
                value: "ratings"
            }, r.default.createElement(lY, {
                ratingsStatus: D,
                nonCompliantRegionStatus: L,
                detailedGuidelines: null != A ? A : void 0,
                isOverEighteenQuestionnaire: o
            })), r.default.createElement(eu, {
                value: "activity"
            }, r.default.createElement(nj, {
                events: w,
                initialSelectedEvent: S,
                onSelectedEventChange: I
            }))))
        }, [tj.Navigation, tj.DeveloperQuestionnaire, tj.Error]);

    function nY(e, t) {
        return new Set(e.filter(e => t.some(t => (function e(t, a) {
            return t.some(t => {
                var l;
                return t.id === a || (null != (l = t.options) ? l : []).some(t => {
                    var l;
                    return t.childQuestions && e(t.childQuestions, a) || (null != (l = t.childSections) ? l : []).some(t => {
                        var l;
                        return e(null != (l = t.questions) ? l : [], a)
                    })
                })
            })
        })(e.questions, t))).map(e => e.id))
    }
    let nX = () => {};
    var nJ = (0, i.withTranslation)(e => {
        var t;
        let {
            attemptId: a,
            entryPoint: l,
            universeId: n,
            onComplete: s,
            onBack: o,
            onCancel: u,
            onViolation: d,
            actionBarContainer: c
        } = e, m, f, {
            locale: g
        } = (0, i.useLocalization)(), {
            translate: y
        } = (0, i.useTranslation)(), {
            showToastNetworkError: E,
            showToastUserError: v
        } = a2(), [b, h] = (0, r.useState)({}), [x, S] = (0, r.useState)(!1), [T, C] = (0, r.useState)(null), [w, N] = (0, r.useState)([]), [I, A] = (0, r.useState)(new Set), {
            data: k
        } = lt(n), R = null == k ? void 0 : k.questionnaireId, {
            data: M,
            isLoading: D
        } = (m = async e => {
            if (!e) return null;
            let t = await aU().questionnairesApiV2.questionnairesGetAdditionalQuestionnaire({
                universeId: n,
                localeCode: g
            });
            return t.questionnaire ? aS(t.questionnaire) : null
        }, (0, j.useQuery)({
            queryKey: ["experienceQuestionnaireV2", "getAdditionalQuestionnaire", R, n],
            queryFn: void 0 === R ? K.skipToken : () => m(R),
            retry: le
        })), L = null == M ? void 0 : M.id, _ = lO({
            attemptId: a,
            entryPoint: l,
            locale: g,
            questionnaireId: L,
            universeId: n
        }), {
            data: O,
            isLoading: B,
            isFetching: q
        } = (f = async e => {
            var t, a;
            return e ? ah(null != (t = null == (a = (await aU().responsesApiV2.responsesGetActiveAdditionalResponse({
                universeId: n
            })).response) ? void 0 : a.answers) ? t : []) : []
        }, (0, j.useQuery)({
            queryKey: ["experienceQuestionnaireV2", "getAdditionalQuestionnaireAnswers", R, n],
            queryFn: void 0 === R ? K.skipToken : () => f(R),
            retry: le,
            gcTime: 0,
            refetchOnMount: "always"
        })), {
            mutateAsync: P
        } = lr(n), {
            mutateAsync: F
        } = li(n);
        (0, r.useEffect)(() => {
            null === T && O && N(O)
        }, [O, T]);
        let U = (0, r.useCallback)((e, t) => {
                if (N(t), C("unsaved"), b[e]) {
                    let {
                        [e]: t, ...a
                    } = b;
                    h(a)
                }
            }, [b]),
            G = (0, r.useCallback)(async e => {
                if (!L) return v(tZ, t0), !1;
                try {
                    return S(!0), await P({
                        questionnaireId: L,
                        answers: null != e ? e : w
                    }), C("saved"), !0
                } catch (e) {
                    return a3.handleNetworkRequestFailure(e, v, E), !1
                } finally {
                    S(!1)
                }
            }, [L, v, P, w, E]),
            Q = (0, r.useCallback)(async () => {
                if (!L) return void v(tZ, t0);
                try {
                    S(!0);
                    let a = await F({
                        questionnaireId: L,
                        answers: w
                    });
                    if (!1 === a.isValid) {
                        var e, t;
                        let l = (null != (e = a.failures) ? e : []).map(e => e.questionId).filter(e => !!e),
                            n = nY(null != (t = null == M ? void 0 : M.sections) ? t : [], l);
                        A(n), null == d || d(!0, n);
                        return
                    }
                    s(L)
                } catch (e) {
                    a3.handleNetworkRequestFailure(e, v, E)
                } finally {
                    S(!1)
                }
            }, [L, v, F, w, E, s, M, d]),
            H = (0, r.useMemo)(() => !!M && M.sections.every(e => ai(e, w)), [M, w]),
            V = (0, r.useMemo)(() => M ? M.sections.filter(e => ai(e, w)).length : 0, [M, w]),
            W = null != (t = null == M ? void 0 : M.sections.length) ? t : 0,
            Y = B || null === T && q;
        return D || Y || !M ? r.default.createElement(lC, null) : r.default.createElement(p.Grid, {
            container: !0,
            flexDirection: "column",
            gap: "var(--gap-xxlarge)"
        }, y("Progress.SectionsCompleted", {
            completed: V.toString(),
            total: W.toString()
        }), r.default.createElement(af, {
            value: _
        }, r.default.createElement(aK, {
            questionnaire: M,
            answers: w,
            errors: b,
            isSaving: x,
            setAnswers: U,
            omitActionBar: !0,
            send: nX,
            save: G,
            goToLanding: nX,
            violatedSectionIds: I
        })), c && (0, tU.createPortal)(r.default.createElement("div", {
            className: "flex justify-between items-center gap-medium padding-top-medium"
        }, r.default.createElement("div", {
            className: "flex items-center gap-medium"
        }, r.default.createElement(eV.Button, {
            variant: "Utility",
            size: "Medium",
            onClick: u
        }, y("Button.Cancel")), x && r.default.createElement("span", {
            className: "text-body-small content-muted"
        }, y("Progress.Saving")), !x && "saved" === T && r.default.createElement("span", {
            className: "flex items-center gap-xsmall text-body-small content-muted"
        }, r.default.createElement(z.CheckIcon, {
            fontSize: "small"
        }), y("Label.Saved")), !x && "unsaved" === T && r.default.createElement("span", {
            className: "text-body-small content-muted"
        }, y("Label.UnsavedChanges"))), r.default.createElement("div", {
            className: "flex gap-small"
        }, r.default.createElement(eV.Button, {
            variant: "Utility",
            size: "Medium",
            onClick: o
        }, y("Button.Back")), r.default.createElement(eV.Button, {
            variant: "Emphasis",
            size: "Medium",
            onClick: Q,
            isDisabled: !H || x,
            isLoading: x
        }, y("Button.Continue")))), c))
    }, [tj.Navigation, tj.DeveloperQuestionnaire, tj.Error]);
    let n$ = e => {
            var t, a;
            let {
                open: l = !0,
                onClose: n,
                robloxGuidance: s,
                showViolationWarning: o = !1,
                onDismissWarning: u,
                actionBarContainer: d
            } = e, {
                translate: c,
                translateHTML: m
            } = (0, i.useTranslation)(), {
                parseText: f
            } = tY(), p = (0, H.useMediaQuery)("(max-width: 600px)"), g = (0, r.useMemo)(() => f(s), [f, s]), y = (0, r.useMemo)(() => m("Description.GuidanceViolatingWarning", [{
                opening: "warningBoldStart",
                closing: "warningBoldEnd",
                content: e => r.default.createElement("b", null, e)
            }, {
                opening: "communityStandardsLinkStart",
                closing: "communityStandardsLinkEnd",
                content: e => r.default.createElement(lz, {
                    href: lf,
                    target: "_blank"
                }, e)
            }]), [m]), E = () => o ? r.default.createElement("div", {
                className: "flex flex-col fill items-center justify-center padding-x-xlarge gap-large"
            }, r.default.createElement("span", {
                className: "text-body-large content-default text-center"
            }, y), r.default.createElement(eV.Button, {
                variant: "Standard",
                size: "Medium",
                onClick: u
            }, c("Action.Ok"))) : null, v = (0, r.useRef)(null), b = (0, r.useRef)(null);
            return ((0, r.useEffect)(() => {
                var e;
                if (p) return;
                let t = null == (e = v.current) ? void 0 : e.lastElementChild;
                t && (t.scrollTop = 0)
            }, [s, p]), (0, r.useEffect)(() => {
                let e = v.current,
                    t = b.current;
                if (!e || !t || p) return;
                let a = function(e) {
                        let t = e.parentElement;
                        for (; t;) {
                            let {
                                overflowY: e
                            } = window.getComputedStyle(t);
                            if ("auto" === e || "scroll" === e) return t;
                            t = t.parentElement
                        }
                        return null
                    }(t),
                    l = 0,
                    n = () => {
                        var l;
                        let n = null != (l = null == a ? void 0 : a.getBoundingClientRect().top) ? l : 0,
                            r = d ? d.getBoundingClientRect().top : window.innerHeight,
                            i = t.getBoundingClientRect();
                        e.style.top = "".concat(Math.max(n, 0), "px"), e.style.bottom = "".concat(Math.max(window.innerHeight - r, 0), "px"), e.style.left = "".concat(i.left, "px"), e.style.width = "".concat(i.width, "px")
                    },
                    r = () => {
                        cancelAnimationFrame(l), l = requestAnimationFrame(n)
                    };
                n();
                let i = new ResizeObserver(r);
                a && i.observe(a), d && i.observe(d);
                let s = null == d ? void 0 : d.parentElement;
                return s && i.observe(s), a && a.addEventListener("scroll", r, {
                    passive: !0
                }), window.addEventListener("resize", r, {
                    passive: !0
                }), () => {
                    cancelAnimationFrame(l), i.disconnect(), a && a.removeEventListener("scroll", r), window.removeEventListener("resize", r)
                }
            }, [p, d, s, o]), p) ? r.default.createElement(tw, {
                open: l,
                onOpenChange: e => {
                    e || n()
                }
            }, r.default.createElement(tN, {
                closeLabel: "Close guidance panel",
                "aria-describedby": void 0
            }, r.default.createElement(tA, null, c("Label.RobloxGuidance")), r.default.createElement(tI, {
                className: "flex flex-col gap-xlarge padding-bottom-xlarge fill"
            }, null != (t = E()) ? t : g))) : r.default.createElement(r.default.Fragment, null, r.default.createElement("div", {
                ref: b,
                className: "shrink-0 width-[360px] min-width-[320px]"
            }), r.default.createElement("div", {
                ref: v,
                className: "fixed flex flex-col bg-surface-100 radius-large clip",
                style: {
                    zIndex: 20
                }
            }, r.default.createElement("div", {
                className: "flex items-center justify-between padding-x-xlarge padding-y-small shrink-0"
            }, r.default.createElement("span", {
                className: "text-heading-small content-emphasis"
            }, c("Label.RobloxGuidance")), r.default.createElement(tE.IconButton, {
                icon: "icon-regular-x-small",
                ariaLabel: "Close guidance panel",
                variant: "Utility",
                size: "Large",
                onClick: n
            })), r.default.createElement("div", {
                className: "flex flex-col gap-xlarge padding-x-xlarge padding-bottom-xlarge scroll-y fill min-height-0",
                style: {
                    overscrollBehaviorY: "contain"
                }
            }, null != (a = E()) ? a : g)))
        },
        nZ = e => {
            let {
                onClick: t
            } = e, {
                translate: a
            } = (0, i.useTranslation)();
            return r.default.createElement(tk.Tooltip, {
                position: "left-center",
                title: a("Label.ViewGuidance"),
                delayDurationMs: 200
            }, r.default.createElement(tk.TooltipTrigger, {
                asChild: !0
            }, r.default.createElement(tE.IconButton, {
                className: "bg-surface-100",
                icon: "icon-regular-book-open",
                ariaLabel: "Open Roblox guidance",
                variant: "Standard",
                size: "Large",
                isCircular: !0,
                onClick: t
            })))
        },
        n0 = e => {
            let {
                onClick: t,
                actionBarContainer: a
            } = e, l = (0, H.useMediaQuery)("(max-width: 600px)"), [n, i] = (0, r.useState)(0);
            return ((0, r.useEffect)(() => {
                if (!a) return;
                let e = () => i(a.offsetHeight);
                e();
                let t = new ResizeObserver(e);
                return t.observe(a), () => t.disconnect()
            }, [a]), l) ? r.default.createElement("div", {
                className: "fixed right-[24px]",
                style: {
                    zIndex: 1e3,
                    bottom: n + 24
                }
            }, r.default.createElement(nZ, {
                onClick: t
            })) : r.default.createElement("div", {
                className: "shrink-0 flex flex-col radius-large",
                style: {
                    marginTop: -48,
                    alignSelf: "stretch"
                }
            }, r.default.createElement("div", {
                className: "sticky flex items-center justify-center",
                style: {
                    bottom: n + 16,
                    marginTop: "auto"
                }
            }, r.default.createElement(nZ, {
                onClick: t
            })))
        },
        n1 = () => {},
        n2 = e => {
            let t = JSON.parse(e);
            return "string" == typeof t ? [t] : Array.isArray(t) ? t.filter(e => "string" == typeof e) : []
        };
    var n4 = (0, i.withTranslation)(e => {
        var t, a, l, n, s, o, u, d;
        let {
            attemptId: c,
            entryPoint: m,
            universeId: f,
            activeStep: g,
            onNext: y,
            onBack: E,
            onCancel: v,
            onComplete: b,
            onActiveSectionChange: h,
            onViolation: x,
            actionBarContainer: S
        } = e, {
            translate: T
        } = (0, i.useTranslation)(), {
            showToastNetworkError: C,
            showToastUserError: w
        } = a2(), [N, I] = (0, r.useState)({}), [A, k] = (0, r.useState)(!1), [R, M] = (0, r.useState)(null), [D, L] = (0, r.useState)([]), [_, O] = (0, r.useState)(new Set), {
            locale: B
        } = (0, i.useLocalization)(), q = lB(B), {
            data: P
        } = lt(f), F = null == P ? void 0 : P.questionnaireId, U = lO({
            attemptId: c,
            entryPoint: m,
            locale: B,
            questionnaireId: F,
            universeId: f
        }), {
            data: G,
            isLoading: Q
        } = la(F, q), {
            data: H,
            isLoading: V,
            isFetching: W
        } = ll(f), {
            mutateAsync: j
        } = lr(f), {
            mutateAsync: K
        } = li(f), {
            traverseQuestionsForQuestionIds: Y,
            traverseSectionsForQuestionIds: X
        } = aR(), J = (null != (t = null == G || null == (l = G.sections) ? void 0 : l.length) ? t : 0) === 1, $ = J && 0 === g, Z = J ? 1 === g : 0 === g, ee = J ? null == G || null == (o = G.sections) || null == (s = o[0]) || null == (n = s.questions) ? void 0 : n[0] : null, et = null == G || null == (d = G.sections) || null == (u = d[0]) ? void 0 : u.id, ea = (0, r.useCallback)(e => {
            var t;
            et && (null == (t = U.onSectionViewed) || t.call(U, et, e))
        }, [et, U]);
        ag($ && !!et, ea);
        let el = (0, r.useCallback)(e => {
            var t;
            ee && (null == (t = U.onQuestionViewed) || t.call(U, ee.id, e))
        }, [ee, U]);
        ag($ && !!ee, el);
        let en = (0, r.useMemo)(() => {
                var e;
                if (!ee || !("options" in ee)) return null != ee ? ee : null;
                let t = (null != (e = ee.options) ? e : []).map(e => ({
                    ...e,
                    childSections: [],
                    childQuestions: []
                }));
                return {
                    ...ee,
                    options: t
                }
            }, [ee]),
            er = (0, r.useMemo)(() => {
                var e;
                if (!ee) return null;
                let t = D.find(e => e.questionId === ee.id);
                return t && null != (e = n2(t.value)[0]) ? e : null
            }, [ee, D]),
            ei = (0, r.useMemo)(() => {
                var e;
                let t;
                if (!J || !ee || !("options" in ee)) return null;
                let a = ee.options.find(e => e.id === er);
                return (null == a ? void 0 : a.childSections) ? (e = a.childSections, t = [], e.forEach(e => {
                    var a, l;
                    e.id && e.name && e.questions && t.push({
                        id: e.id,
                        name: e.name,
                        description: null != (a = e.description) ? a : null,
                        questions: ax(e.questions),
                        metadata: null != (l = e.metadata) ? l : {}
                    })
                }), t) : null
            }, [ee, er, J]),
            es = (0, r.useMemo)(() => {
                if (!G) return null;
                if (!J) return G;
                let e = G.sections.slice(1),
                    t = null != ei ? ei : e;
                return {
                    ...G,
                    sections: t
                }
            }, [G, ei, J]);
        (0, r.useEffect)(() => {
            null === R && H && L(H)
        }, [H, R]);
        let eo = (0, r.useCallback)((e, t) => {
                if (L(t), M("unsaved"), N[e]) {
                    let {
                        [e]: t, ...a
                    } = N;
                    I(a)
                }
            }, [N]),
            eu = (0, r.useCallback)(async e => {
                if (!F) return w(tZ, t0), !1;
                try {
                    return k(!0), await j({
                        questionnaireId: F,
                        answers: null != e ? e : D
                    }), M("saved"), !0
                } catch (e) {
                    return a3.handleNetworkRequestFailure(e, w, C), !1
                } finally {
                    k(!1)
                }
            }, [F, w, j, D, C]),
            ed = (0, r.useCallback)(async () => {
                if (!F) return void w(tZ, t0);
                try {
                    k(!0);
                    let a = await K({
                        questionnaireId: F,
                        answers: D
                    });
                    if (!1 === a.isValid) {
                        var e, t;
                        let l = (null != (e = a.failures) ? e : []).map(e => e.questionId).filter(e => !!e),
                            n = nY(null != (t = null == es ? void 0 : es.sections) ? t : [], l);
                        O(n), null == x || x(!0, n);
                        return
                    }
                    b(F)
                } catch (e) {
                    a3.handleNetworkRequestFailure(e, w, C)
                } finally {
                    k(!1)
                }
            }, [F, w, D, C, K, b, es, x]),
            ec = !!ee && D.some(e => e.questionId === ee.id),
            em = (0, r.useMemo)(() => !!es && es.sections.every(e => ai(e, D)), [es, D]),
            ef = (0, r.useMemo)(() => es ? es.sections.filter(e => ai(e, D)).length : 0, [es, D]),
            ep = null != (a = null == es ? void 0 : es.sections.length) ? a : 0,
            eg = A ? T("Progress.Saving") : "saved" === R ? T("Label.Saved") : "unsaved" === R ? T("Label.UnsavedChanges") : null,
            ey = e => S ? (0, tU.createPortal)(r.default.createElement("div", {
                className: "flex justify-between items-center gap-medium padding-top-medium"
            }, r.default.createElement("div", {
                className: "flex items-center gap-medium"
            }, r.default.createElement(eV.Button, {
                variant: "Utility",
                size: "Medium",
                onClick: v
            }, T("Button.Cancel")), eg && r.default.createElement("span", {
                className: "flex items-center gap-xsmall text-body-small content-muted"
            }, "saved" === R && r.default.createElement(z.CheckIcon, {
                fontSize: "small"
            }), eg)), r.default.createElement("div", {
                className: "flex gap-small"
            }, e)), S) : null,
            eE = V || null === R && W;
        return Q || eE || !G || !es ? r.default.createElement(lC, null) : r.default.createElement(p.Grid, {
            container: !0,
            flexDirection: "column",
            gap: "var(--gap-xxlarge)"
        }, $ && ee && r.default.createElement(r.default.Fragment, null, r.default.createElement(aH, {
            validatedAnswers: D,
            errors: N,
            question: null != en ? en : ee,
            updateAnswer: async (e, t) => {
                let a = D.find(t => t.questionId === e),
                    l = a ? n2(a.value) : [],
                    n = n2(t),
                    r = l.filter(e => !n.includes(e)),
                    i = ee && "options" in ee ? ee.options.filter(e => {
                        var t;
                        return r.includes(null != (t = e.id) ? t : "")
                    }) : [],
                    s = ax(i.flatMap(e => {
                        var t;
                        return null != (t = e.childQuestions) ? t : []
                    })),
                    o = ab(i.flatMap(e => {
                        var t;
                        return null != (t = e.childSections) ? t : []
                    })),
                    u = [...Y(s), ...X(o)],
                    d = [...D.filter(t => t.questionId !== e).filter(e => !u.includes(e.questionId)), {
                        questionId: e,
                        value: t
                    }];
                eo(e, d), await eu(d)
            }
        }), ey(r.default.createElement(eV.Button, {
            variant: "Emphasis",
            size: "Medium",
            onClick: y,
            isDisabled: !ec || A
        }, T("Button.Continue")))), Z && r.default.createElement(r.default.Fragment, null, T("Progress.SectionsCompleted", {
            completed: ef.toString(),
            total: ep.toString()
        }), r.default.createElement(af, {
            value: U
        }, r.default.createElement(aK, {
            questionnaire: es,
            answers: D,
            errors: N,
            isSaving: A,
            setAnswers: eo,
            send: n1,
            save: eu,
            goToLanding: n1,
            omitActionBar: !0,
            onExpandedSectionChange: h,
            violatedSectionIds: _
        })), ey(r.default.createElement(r.default.Fragment, null, r.default.createElement(eV.Button, {
            variant: "Utility",
            size: "Medium",
            onClick: E
        }, T("Button.Back")), r.default.createElement(eV.Button, {
            variant: "Emphasis",
            size: "Medium",
            onClick: ed,
            isDisabled: !em || A,
            isLoading: A
        }, T("Button.Continue"))))))
    }, [tj.Navigation, tj.DeveloperQuestionnaire, tj.Error]);
    let n3 = {
            display: "grid",
            gridTemplateColumns: "minmax(0, 1fr)",
            gap: "var(--gap-large)"
        },
        n5 = {
            overflowX: "auto",
            maxWidth: "100%"
        },
        n6 = e => {
            let {
                children: t
            } = e;
            return r.default.createElement(F.TableCell, null, r.default.createElement("div", {
                className: "flex items-center gap-small"
            }, r.default.createElement("span", {
                className: "text-label-medium"
            }, t)))
        },
        n7 = e => {
            let {
                children: t,
                className: a
            } = e;
            return r.default.createElement("div", {
                style: n5
            }, r.default.createElement(B.Table, {
                className: a
            }, t))
        },
        n8 = (0, o.makeStyles)()(e => ({
            accordionRoot: {
                border: "unset",
                borderBottom: "1px solid ".concat(e.palette.components.divider),
                "&.Mui-expanded": {
                    margin: 0
                },
                "::before": {
                    content: "none"
                }
            },
            accordionSummaryContent: {
                justifyContent: "space-between",
                alignItems: "center",
                paddingRight: "var(--padding-small)",
                display: "flex",
                gap: "var(--gap-medium)"
            }
        }));
    var n9 = (0, i.withTranslation)(e => {
            var t, a, l, n, s, o, d, c, m, f, g, y, E, v;
            let {
                universeId: b,
                mainQuestionnaireId: S,
                additionalQuestionnaireId: T,
                onPublish: w,
                onBack: N,
                onCancel: I,
                actionBarContainer: A,
                isOverEighteenQuestionnaire: k
            } = e, [R, M] = (0, r.useState)(0), {
                showToastNetworkError: D
            } = a2(), {
                locale: L
            } = (0, i.useLocalization)(), {
                translate: _,
                translateHTML: O,
                translateWithNamespace: B
            } = (0, i.useTranslation)(), {
                mutateAsync: G,
                data: z,
                isPending: H,
                isError: V
            } = function(e) {
                let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                return (0, Y.useMutation)({
                    mutationKey: ["experienceQuestionnaireV2", "previewMultiQuestionnaire", e],
                    mutationFn: t => {
                        let a, l, {
                            questionnaireIds: n,
                            localeCode: r
                        } = t;
                        return a = {
                            universeId: e,
                            questionnaireIds: n
                        }, l = null != r ? r : null, aU().responsesApiV2.responsesPreviewMultiQuestionnaire({
                            previewSubmissionsRequestBody: a,
                            localeCode: l
                        })
                    },
                    ...t
                })
            }(b), W = (0, r.useRef)(!1);
            (0, r.useEffect)(() => {
                S && T && !W.current && (W.current = !0, G({
                    questionnaireIds: [S, T],
                    localeCode: L
                }).catch(() => {
                    D(500)
                }))
            }, [L, G, S, T, D]);
            let j = null != (t = null == z || null == (c = z.referencedContentDescriptors) ? void 0 : c.filter(e => e.complianceApiSupported).map(e => {
                    var t, a;
                    return {
                        id: null != (t = e.displayName) ? t : "",
                        label: null != (a = e.displayName) ? a : ""
                    }
                })) ? t : [],
                K = (e => {
                    let t = e.length,
                        a = 2 ** t,
                        l = [];
                    for (let t = 0; t < a; t += 1) {
                        let a = {};
                        e.forEach((e, l) => {
                            let n = Math.floor(t / 2 ** l) % 2;
                            a[e.id] = 1 === n
                        }), l.push(a)
                    }
                    return l
                })(j),
                X = null != (a = null == z || null == (m = z.ageRecommendationDetails) ? void 0 : m.descriptorUsages) ? a : [],
                J = null == z || null == (g = z.ageRecommendationDetails) || null == (f = g.summary) ? void 0 : f.ageRecommendation,
                $ = null != (l = null == J ? void 0 : J.displayName) ? l : "",
                Z = (null != (n = null == J ? void 0 : J.minimumAge) ? n : 0) >= 18,
                ee = null != (s = null == z ? void 0 : z.restrictedCountries) ? s : [],
                et = null != (o = null == z || null == (E = z.ageRecommendationDetails) || null == (y = E.descriptorUsages) ? void 0 : y.map(e => {
                    var t;
                    return null == (t = e.descriptor) ? void 0 : t.displayName
                }).filter(e => !!e)) ? o : [],
                ea = [...null != (d = null == z || null == (v = z.robloxProducts) ? void 0 : v.flatMap(e => {
                    var t, a, l;
                    return null != (t = null == (l = e.iarcProduct) || null == (a = l.ratingList) ? void 0 : a.map(e => {
                        var t, a, l, n, r, i, s, o, u, d;
                        let c = null != (t = null == (u = e.interactiveElementList) ? void 0 : u.map(e => e.localizedDisplayText).filter(Boolean).join(", ")) ? t : "",
                            m = null != (a = null == (d = e.descriptorList) ? void 0 : d.map(e => e.localizedDisplayText).filter(Boolean).join(", ")) ? a : "";
                        return {
                            systemName: null != (l = e.ratingAuthorityShortText) ? l : "",
                            systemLabel: null != (n = e.ratingAuthorityShortText) ? n : "",
                            regionName: null != (r = e.localizedRegionText) ? r : "",
                            ratingCode: null != (i = e.ageRatingShortText) ? i : "",
                            ratingLabel: null != (s = e.localizedDisplayText) ? s : "",
                            ageRatingIconUrl: null != (o = e.ageRatingIconUrl) ? o : "",
                            interactiveElements: c,
                            iarcDescriptors: m,
                            robloxDescriptors: et
                        }
                    })) ? t : []
                })) ? d : []].sort((e, t) => e.systemName.localeCompare(t.systemName)),
                {
                    mutateAsync: el,
                    isPending: en
                } = function(e) {
                    let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                    return (0, Y.useMutation)({
                        mutationKey: ["experienceQuestionnaireV2", "publishQuestionnaires", e],
                        mutationFn: t => {
                            let a;
                            return a = {
                                universeId: e,
                                questionnaireIds: [t.mainQuestionnaireId, t.additionalQuestionnaireId]
                            }, aU().responsesApiV2.responsesPublish({
                                publishRequestBody: a,
                                localeCode: null
                            })
                        },
                        ...t
                    })
                }(b),
                {
                    classes: {
                        accordionRoot: er,
                        accordionSummaryContent: ei
                    }
                } = n8(),
                {
                    classes: {
                        borderedTable: es
                    }
                } = lH(),
                eo = async () => {
                    if (!S || !T) return void D(500);
                    try {
                        await el({
                            mainQuestionnaireId: S,
                            additionalQuestionnaireId: T
                        }), w()
                    } catch (e) {
                        D(500)
                    }
                }, eu = j.length > 0, ed = eu && 0 === R;
            if (H) return r.default.createElement(lC, null);
            if (V) return r.default.createElement(lQ, {
                message: _("Message.FailedToLoadPage"),
                onReload: () => window.location.reload()
            });
            let ec = r.default.createElement("div", {
                className: "flex justify-between items-center gap-medium padding-top-medium"
            }, r.default.createElement("div", {
                className: "flex items-center gap-medium"
            }, r.default.createElement(eV.Button, {
                variant: "Utility",
                size: "Medium",
                onClick: I
            }, _("Button.Cancel")), !ed && en && r.default.createElement("span", {
                className: "text-body-small content-muted"
            }, _("Progress.Publishing"))), r.default.createElement("div", {
                className: "flex gap-small"
            }, ed ? r.default.createElement(r.default.Fragment, null, r.default.createElement(eV.Button, {
                variant: "Utility",
                size: "Medium",
                onClick: N
            }, _("Button.Back")), r.default.createElement(eV.Button, {
                variant: "Emphasis",
                size: "Medium",
                onClick: () => {
                    M(1)
                }
            }, _("Button.Continue"))) : r.default.createElement(r.default.Fragment, null, r.default.createElement(eV.Button, {
                variant: "Utility",
                size: "Medium",
                onClick: eu ? () => {
                    M(0)
                } : N
            }, _("Button.Back")), r.default.createElement(eV.Button, {
                variant: "Emphasis",
                size: "Medium",
                onClick: eo,
                isDisabled: en || !!(null == z ? void 0 : z.disableSubmitButton),
                isLoading: en
            }, _("Action.Send")))));
            return r.default.createElement(r.default.Fragment, null, r.default.createElement(p.Grid, {
                container: !0,
                flexDirection: "column",
                gap: "var(--gap-xxlarge)",
                style: {
                    minWidth: 0,
                    overflow: "hidden"
                }
            }, ed ? r.default.createElement(r.default.Fragment, null, r.default.createElement("div", {
                style: n3
            }, r.default.createElement(u.Typography, {
                variant: "h5"
            }, _("Title.ReviewQuestionnaireVersionsMarch")), r.default.createElement(u.Typography, {
                className: "content-muted"
            }, _("Description.ReviewQuestionnaireVersionsMarch"))), r.default.createElement(n7, {
                className: "".concat(es, " radius-medium clip")
            }, r.default.createElement(q.TableHead, null, r.default.createElement(P.TableRow, null, r.default.createElement(n6, null, _("Label.QuestionnaireVersionColumn")), j.map(e => r.default.createElement(n6, {
                key: e.id
            }, e.label)))), r.default.createElement(U.TableBody, null, K.map((e, t) => {
                let a = "version-".concat(t, "-").concat(j.map(t => e[t.id] ? "1" : "0").join(""));
                return r.default.createElement(P.TableRow, {
                    key: a
                }, r.default.createElement(F.TableCell, null, r.default.createElement("span", {
                    className: "text-body-medium"
                }, "".concat(t + 1))), j.map(t => r.default.createElement(F.TableCell, {
                    key: t.id
                }, r.default.createElement("span", {
                    className: "text-body-medium"
                }, e[t.id] ? _("Label.On") : _("Label.Off")))))
            })))) : r.default.createElement("div", {
                className: "flex flex-col gap-medium"
            }, Z && r.default.createElement(ty, {
                title: "",
                description: _("Description.RestrictedContentPreview"),
                variant: "Standard",
                severity: "Info",
                primaryActionLabel: _("Action.LearnMore"),
                onPrimaryAction: () => window.open("https://en.help.roblox.com/hc/en-us/articles/15869919570708-Restricted-Content-Policy", "_blank")
            }), r.default.createElement(h.Accordion, {
                square: !0,
                variant: "outlined",
                classes: {
                    root: er
                },
                defaultExpanded: !0
            }, r.default.createElement(x.AccordionSummary, {
                expandIcon: r.default.createElement(Q.ExpandMoreIcon, null),
                classes: {
                    content: ei
                }
            }, r.default.createElement("span", {
                className: "text-heading-small"
            }, _("Title.PreviewContentMaturityRatings"))), r.default.createElement(C.AccordionDetails, null, r.default.createElement("div", {
                style: n3
            }, r.default.createElement(u.Typography, {
                className: "content-muted"
            }, _("Description.RobloxMaturityLabel")), r.default.createElement(n7, {
                className: "".concat(es, " radius-medium clip")
            }, r.default.createElement(q.TableHead, null, r.default.createElement(P.TableRow, null, r.default.createElement(n6, null, _("Label.Rating")), r.default.createElement(n6, null, _("TableHead.Descriptors")))), r.default.createElement(U.TableBody, null, r.default.createElement(P.TableRow, null, r.default.createElement(F.TableCell, null, r.default.createElement("span", {
                className: "text-body-medium"
            }, $ || "—")), r.default.createElement(F.TableCell, null, r.default.createElement("div", {
                className: "flex flex-col"
            }, X.map(e => {
                var t;
                return null == (t = e.descriptor) ? void 0 : t.displayName
            }).filter(Boolean).map(e => r.default.createElement("span", {
                key: e,
                className: "text-body-medium"
            }, e)), 0 === X.length && r.default.createElement("span", {
                className: "text-body-medium"
            }, "—"))))))))), r.default.createElement(h.Accordion, {
                square: !0,
                variant: "outlined",
                classes: {
                    root: er
                },
                defaultExpanded: !0
            }, r.default.createElement(x.AccordionSummary, {
                expandIcon: r.default.createElement(Q.ExpandMoreIcon, null),
                classes: {
                    content: ei
                }
            }, r.default.createElement("span", {
                className: "text-heading-small"
            }, _("Title.PreviewIARCRatings"))), r.default.createElement(C.AccordionDetails, null, r.default.createElement("div", {
                style: n3
            }, r.default.createElement(u.Typography, {
                className: "content-muted"
            }, O("Description.ReviewRatingsMarch", [{
                opening: "PolicyServiceApiLinkStart",
                closing: "PolicyServiceApiLinkEnd",
                content: e => r.default.createElement(lz, {
                    href: an,
                    target: "_blank"
                }, e)
            }])), !k && r.default.createElement(lW, {
                description: B(tj.DeveloperQuestionnaire, "Description.U18IARCUnsupported"),
                linkLabel: _("Action.LearnMore"),
                linkHref: "https://en.help.roblox.com/hc/en-us/articles/15869919570708-Restricted-Content-Policy"
            }), r.default.createElement(n7, {
                className: "".concat(es, " radius-medium clip")
            }, r.default.createElement(q.TableHead, null, r.default.createElement(P.TableRow, null, r.default.createElement(n6, null, _("Label.RatingSystem")), r.default.createElement(n6, null, _("Label.Rating")), r.default.createElement(n6, null, _("Label.InteractiveElements")), r.default.createElement(n6, null, _("Label.IARCDescriptors")), r.default.createElement(n6, null, _("Label.RobloxDescriptors")))), r.default.createElement(U.TableBody, null, ea.length > 0 ? ea.map(e => r.default.createElement(P.TableRow, {
                key: "".concat(e.systemName, "-").concat(e.ratingCode)
            }, r.default.createElement(F.TableCell, null, r.default.createElement("div", {
                className: "flex flex-col gap-xsmall"
            }, r.default.createElement("span", {
                className: "text-body-medium"
            }, e.systemName), e.regionName && r.default.createElement("span", {
                className: "text-body-small content-muted"
            }, e.regionName))), r.default.createElement(F.TableCell, null, r.default.createElement("div", {
                className: "flex items-center gap-small"
            }, e.ageRatingIconUrl && r.default.createElement("img", {
                src: e.ageRatingIconUrl,
                alt: e.ratingCode,
                className: "height-[32px] width-[32px] radius-small"
            }), r.default.createElement("span", {
                className: "text-body-medium"
            }, e.ratingLabel))), r.default.createElement(F.TableCell, null, r.default.createElement("span", {
                className: "text-body-medium"
            }, e.interactiveElements)), r.default.createElement(F.TableCell, null, r.default.createElement("span", {
                className: "text-body-medium"
            }, e.iarcDescriptors)), r.default.createElement(F.TableCell, null, r.default.createElement("div", {
                className: "flex flex-col"
            }, e.robloxDescriptors.map(e => r.default.createElement("span", {
                key: e,
                className: "text-body-medium"
            }, e)), 0 === e.robloxDescriptors.length && r.default.createElement("span", {
                className: "text-body-medium"
            }, "—"))))) : r.default.createElement(P.TableRow, null, r.default.createElement(F.TableCell, null, r.default.createElement("span", {
                className: "text-body-medium"
            }, "—")), r.default.createElement(F.TableCell, null, r.default.createElement("span", {
                className: "text-body-medium"
            }, "—")), r.default.createElement(F.TableCell, null, r.default.createElement("span", {
                className: "text-body-medium"
            }, "—")), r.default.createElement(F.TableCell, null, r.default.createElement("span", {
                className: "text-body-medium"
            }, "—")), r.default.createElement(F.TableCell, null, r.default.createElement("span", {
                className: "text-body-medium"
            }, "—")))))))), r.default.createElement(h.Accordion, {
                square: !0,
                variant: "outlined",
                classes: {
                    root: er
                },
                defaultExpanded: !0
            }, r.default.createElement(x.AccordionSummary, {
                expandIcon: r.default.createElement(Q.ExpandMoreIcon, null),
                classes: {
                    content: ei
                }
            }, r.default.createElement("span", {
                className: "text-heading-small"
            }, _("Title.PreviewRegionalLimitations"))), r.default.createElement(C.AccordionDetails, null, r.default.createElement("div", {
                style: n3
            }, r.default.createElement(u.Typography, {
                className: "content-muted"
            }, O("Description.NonCompliantRegions", [{
                opening: "policyApisLinkStart",
                closing: "policyApisLinkEnd",
                content: e => r.default.createElement(lz, {
                    href: "https://create.roblox.com/docs/reference/engine/classes/PolicyService",
                    target: "_blank"
                }, e)
            }])), r.default.createElement(n7, {
                className: "".concat(es, " radius-medium clip")
            }, r.default.createElement(q.TableHead, null, r.default.createElement(P.TableRow, null, r.default.createElement(n6, null, _("Title.Location")), r.default.createElement(n6, null, _("TableHead.Descriptors")), r.default.createElement(n6, null, _("Title.GuidelinesAgeRestriction")))), r.default.createElement(U.TableBody, null, ee.length > 0 ? ee.map((e, t) => {
                var a, l, n, i;
                return r.default.createElement(P.TableRow, {
                    key: null != (a = e.countryCode) ? a : t
                }, r.default.createElement(F.TableCell, null, r.default.createElement("span", {
                    className: "text-body-medium"
                }, null != (l = e.displayCountryName) ? l : "—")), r.default.createElement(F.TableCell, null, r.default.createElement("span", {
                    className: "text-body-medium"
                }, null != (n = e.displayDescriptorName) ? n : "—")), r.default.createElement(F.TableCell, null, r.default.createElement("span", {
                    className: "text-body-medium"
                }, null != (i = e.displayAgeRangeName) ? i : "—")))
            }) : r.default.createElement(P.TableRow, null, r.default.createElement(F.TableCell, null, r.default.createElement("span", {
                className: "text-body-medium"
            }, "—")), r.default.createElement(F.TableCell, null, r.default.createElement("span", {
                className: "text-body-medium"
            }, "—")), r.default.createElement(F.TableCell, null, r.default.createElement("span", {
                className: "text-body-medium"
            }, "—")))))))))), A && (0, tU.createPortal)(ec, A))
        }, [tj.Navigation, tj.DeveloperQuestionnaire, tj.Error]),
        re = (0, i.withTranslation)(e => {
            var t, a, l, n, s, o, u;
            let {
                attemptId: d,
                entryPoint: c,
                universeId: m,
                onComplete: f,
                onCancel: p
            } = e, {
                locale: g
            } = (0, i.useLocalization)(), {
                translate: y
            } = (0, i.useTranslation)(), E = ak(), v = lB(g), {
                data: b,
                isLoading: h,
                isError: x
            } = lt(m), S = null == b ? void 0 : b.questionnaireId, T = null == (t = null == b ? void 0 : b.isOverEighteenQuestionnaire) || t, {
                data: C,
                isLoading: w,
                isError: N
            } = la(S, v), I = (null != (a = null == C || null == (s = C.sections) ? void 0 : s.length) ? a : 0) === 1, A = T ? y("Stepper.IARCQuestions") : y("Stepper.ContentQuestions"), k = (0, r.useMemo)(() => I ? [{
                label: y("Stepper.AppType")
            }, {
                label: A
            }, {
                label: y("Stepper.RobloxQuestions")
            }, {
                label: y("Stepper.Preview")
            }] : [{
                label: A
            }, {
                label: y("Stepper.RobloxQuestions")
            }, {
                label: y("Stepper.Preview")
            }], [I, y, A]), R = I ? 2 : 1, M = I ? 3 : 2, [D, L] = (0, r.useState)(0), [_, O] = (0, r.useState)(null), [B, q] = (0, r.useState)(null), P = (0, H.useMediaQuery)("(max-width: 600px)"), F = (0, V.useTheme)(), [U, G] = (0, r.useState)(!P), [Q, z] = (0, r.useState)(null), [W, j] = (0, r.useState)(null), [K, Y] = (0, r.useState)(!1), [X, J] = (0, r.useState)(new Set), [$, Z] = (0, r.useState)(!1), ee = (0, r.useRef)(null);
            (0, r.useEffect)(() => {
                let e = ee.current;
                if (!e) return;
                let t = function(e) {
                    let t = e.parentElement;
                    for (; t;) {
                        let {
                            overflowY: e
                        } = window.getComputedStyle(t);
                        if ("auto" === e || "scroll" === e) return t;
                        t = t.parentElement
                    }
                    return null
                }(e);
                if (!t) return;
                let a = () => {
                    let a = t.getBoundingClientRect(),
                        l = e.getBoundingClientRect().top - a.top + t.scrollTop;
                    e.style.minHeight = "".concat(t.clientHeight - l, "px")
                };
                a();
                let l = new ResizeObserver(a);
                return l.observe(t), () => l.disconnect()
            }, []);
            let et = (0, r.useCallback)(e => {
                    var t;
                    L(e), z(null), Y(!1), J(new Set), Z(!1), null == (t = document.getElementById(E.scrollContainerId)) || t.scrollTo(0, 0)
                }, [E.scrollContainerId]),
                ea = (0, r.useMemo)(() => {
                    let e = {};
                    if (!(null == C ? void 0 : C.sections)) return e;
                    let t = a => {
                        a.forEach(a => {
                            var l;
                            a.id && (null == (l = a.metadata) ? void 0 : l.RobloxGuidanceFormatted) && (e[a.id] = a.metadata.RobloxGuidanceFormatted), a.questions && a.questions.forEach(e => {
                                "options" in e && Array.isArray(e.options) && e.options.forEach(e => {
                                    e.childSections && t(e.childSections)
                                })
                            })
                        })
                    };
                    return t(C.sections), e
                }, [C]),
                el = null != (l = null == C || null == (u = C.sections) || null == (o = u[0]) ? void 0 : o.id) ? l : null,
                en = null != Q ? Q : I && 0 === D ? el : null,
                er = en && null != (n = ea[en]) ? n : "",
                ei = (0, r.useCallback)(e => {
                    z(e), Z(!1)
                }, []),
                es = (0, r.useCallback)((e, t) => {
                    Y(e), J(null != t ? t : new Set), Z(!1), e && G(!0)
                }, []),
                eo = K && !!en && X.has(en) && !$,
                eu = (0, r.useCallback)(() => {
                    Z(!0)
                }, []),
                ed = D < R && !!er;
            return ((0, r.useEffect)(() => {
                ed ? G(!P) : G(!1)
            }, [en, P, ed]), x || N) ? r.default.createElement(lQ, {
                message: y("Message.FailedToLoadPage"),
                onReload: () => window.location.reload()
            }) : h || w || !C ? r.default.createElement(lC, null) : r.default.createElement("div", {
                ref: ee,
                className: "flex flex-col"
            }, r.default.createElement("div", {
                className: "flex gap-xlarge fill",
                style: {
                    alignItems: "flex-start"
                }
            }, r.default.createElement("div", {
                className: "flex flex-col gap-xlarge min-width-[0px] fill"
            }, r.default.createElement("div", {
                className: "sticky top-[0px] padding-y-medium",
                style: {
                    zIndex: 10,
                    backgroundColor: F.palette.navigation.default,
                    overflow: "hidden"
                }
            }, r.default.createElement(eH, {
                steps: k,
                currentStepIndex: D,
                size: "Medium"
            })), D < R && r.default.createElement(n4, {
                universeId: m,
                attemptId: d,
                entryPoint: c,
                activeStep: D,
                onNext: () => et(e => e + 1),
                onBack: () => et(e => e <= 0 ? (p(), 0) : e - 1),
                onCancel: p,
                onComplete: e => {
                    O(e), et(R)
                },
                onActiveSectionChange: ei,
                onViolation: es,
                actionBarContainer: W
            }), D === R && r.default.createElement(nJ, {
                universeId: m,
                attemptId: d,
                entryPoint: c,
                onComplete: e => {
                    q(e), et(M)
                },
                onBack: () => et(R - 1),
                onCancel: p,
                onViolation: es,
                actionBarContainer: W
            }), D === M && r.default.createElement(n9, {
                universeId: m,
                mainQuestionnaireId: null != _ ? _ : "",
                additionalQuestionnaireId: null != B ? B : "",
                onPublish: () => {
                    f()
                },
                onBack: () => et(R),
                onCancel: p,
                actionBarContainer: W,
                isOverEighteenQuestionnaire: T
            })), ed && U && !P && r.default.createElement(n$, {
                onClose: () => G(!1),
                robloxGuidance: er,
                showViolationWarning: eo,
                onDismissWarning: eu,
                actionBarContainer: W
            }), ed && P && r.default.createElement(n$, {
                open: U,
                onClose: () => G(!1),
                robloxGuidance: er,
                showViolationWarning: eo,
                onDismissWarning: eu,
                actionBarContainer: W
            }), ed && !U && r.default.createElement(n0, {
                onClick: () => G(!0),
                actionBarContainer: W
            })), r.default.createElement("div", {
                ref: e => {
                    j(e)
                },
                className: "sticky bottom-[0px] padding-y-large",
                style: {
                    zIndex: 10,
                    backgroundColor: F.palette.navigation.default
                }
            }))
        }, [tj.Navigation, tj.DeveloperQuestionnaire, tj.Error]),
        rt = (0, i.withTranslation)(e => {
            var t;
            let {
                universeId: a
            } = e, l = (0, s.useRouter)(), [n, o] = (0, r.useState)(0), [u, d] = (0, r.useState)(!1), {
                translate: c
            } = (0, i.useTranslation)(), m = ak(), {
                locale: f
            } = (0, i.useLocalization)(), p = "string" == typeof l.query.entryPoint ? l.query.entryPoint : void 0, {
                data: g,
                isLoading: y,
                isError: E
            } = lt(a), v = null == g ? void 0 : g.questionnaireId, b = null == (t = null == g ? void 0 : g.isOverEighteenQuestionnaire) || t, {
                attemptId: h,
                completeAttempt: x,
                entryPoint: S,
                startAttempt: T
            } = l_({
                explicitEntryPoint: p,
                locale: f,
                questionnaireId: v,
                universeId: a
            }), {
                isLoading: C,
                isError: w
            } = la(v, f), {
                isLoading: N
            } = ll(a), {
                isLoading: I
            } = ln(a);
            lM(a, v, 1 === n);
            let {
                isLoading: A
            } = lo(a), {
                isLoading: k
            } = ld(a), {
                isLoading: R
            } = lu(a), M = (0, r.useCallback)(() => {
                T({
                    onStarted: () => {
                        var e;
                        d(!1), o(1), null == (e = document.getElementById(m.scrollContainerId)) || e.scrollTo(0, 0)
                    }
                })
            }, [T, m.scrollContainerId]);
            return y || N || I || C || A || k || R || !m.isHostReady ? r.default.createElement(lC, null) : E || w ? r.default.createElement(lQ, {
                message: c("Message.FailedToLoadPage"),
                onReload: () => window.location.reload()
            }) : 1 === n ? r.default.createElement(re, {
                universeId: a,
                attemptId: h,
                entryPoint: S,
                onComplete: () => {
                    x(), o(0), d(!0)
                },
                onCancel: () => {
                    o(0), d(!1)
                }
            }) : r.default.createElement(nK, {
                universeId: a,
                onStartQuestionnaire: M,
                showSubmissionSuccessAlert: u,
                onDismissSubmissionSuccessAlert: () => d(!1),
                isOverEighteenQuestionnaire: b
            })
        }, [tj.Navigation, tj.DeveloperQuestionnaire, tj.Error]);
    e.s(["QuestionnaireContainer", 0, lU, "QuestionnaireContainerV2", 0, rt, "QuestionnaireHostProvider", 0, e => {
        let {
            children: t,
            ...a
        } = e, l = (0, r.useMemo)(() => ({
            ...aI,
            ...a,
            questionnaireVersion: {
                ...aI.questionnaireVersion,
                ...a.questionnaireVersion
            },
            sectionStepper: {
                ...aI.sectionStepper,
                ...a.sectionStepper
            }
        }), [a]);
        return r.default.createElement(aA.Provider, {
            value: l
        }, t)
    }, "configureQuestionnaireClients", 0, e => {
        t = e.unifiedLogger
    }], 614761)
}]);

//# debugId=15dd4b1b-bcc3-803f-3b55-90b9c64b3656
//# sourceMappingURL=1u_tvt2rklc47.js.map
;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "bdcaf898-06ef-e9c4-0ade-82626eea6cae")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 634130, e => {
    "use strict";
    var t = e.i(643766),
        a = e.i(120297),
        c = e.i(859726),
        r = e.i(950020),
        s = e.i(517952),
        i = e.i(179510),
        n = e.i(842769),
        o = e.i(989308),
        l = e.i(546633),
        d = e.i(785517),
        u = "Checkbox",
        [f, m] = (0, c.c)(u),
        [p, h] = f(u);

    function v(e) {
        let {
            __scopeCheckbox: a,
            checked: c,
            children: r,
            defaultChecked: i,
            disabled: n,
            form: o,
            name: l,
            onCheckedChange: f,
            required: m,
            value: h = "on",
            internal_do_not_use_render: v
        } = e, [g, b] = (0, s.f)({
            prop: c,
            defaultProp: null != i && i,
            onChange: f,
            caller: u
        }), [_, x] = t.useState(null), [y, k] = t.useState(null), w = t.useRef(!1), S = !_ || !!o || !!_.closest("form"), P = {
            checked: g,
            disabled: n,
            setChecked: b,
            control: _,
            setControl: x,
            name: l,
            form: o,
            value: h,
            hasConsumerStoppedPropagationRef: w,
            required: m,
            defaultChecked: !q(i) && i,
            isFormControl: S,
            bubbleInput: y,
            setBubbleInput: k
        };
        return (0, d.jsx)(p, {
            scope: a,
            ...P,
            children: "function" == typeof v ? v(P) : r
        })
    }
    var g = "CheckboxTrigger",
        b = t.forwardRef((e, c) => {
            let {
                __scopeCheckbox: s,
                onKeyDown: i,
                onClick: n,
                ...o
            } = e, {
                control: u,
                value: f,
                disabled: m,
                checked: p,
                required: v,
                setControl: b,
                setChecked: _,
                hasConsumerStoppedPropagationRef: x,
                isFormControl: y,
                bubbleInput: k
            } = h(g, s), w = (0, a.j)(c, b), P = t.useRef(p);
            return t.useEffect(() => {
                let e = null == u ? void 0 : u.form;
                if (e) {
                    let t = () => _(P.current);
                    return e.addEventListener("reset", t), () => e.removeEventListener("reset", t)
                }
            }, [u, _]), (0, d.jsx)(l.f.button, {
                type: "button",
                role: "checkbox",
                "aria-checked": q(p) ? "mixed" : p,
                "aria-required": v,
                "data-state": S(p),
                "data-disabled": m ? "" : void 0,
                disabled: m,
                value: f,
                ...o,
                ref: w,
                onKeyDown: (0, r.f)(i, e => {
                    "Enter" === e.key && e.preventDefault()
                }),
                onClick: (0, r.f)(n, e => {
                    _(e => !!q(e) || !e), k && y && (x.current = e.isPropagationStopped(), x.current || e.stopPropagation())
                })
            })
        });
    b.displayName = g;
    var _ = t.forwardRef((e, t) => {
        let {
            __scopeCheckbox: a,
            name: c,
            checked: r,
            defaultChecked: s,
            required: i,
            disabled: n,
            value: o,
            onCheckedChange: l,
            form: u,
            ...f
        } = e;
        return (0, d.jsx)(v, {
            __scopeCheckbox: a,
            checked: r,
            defaultChecked: s,
            disabled: n,
            required: i,
            onCheckedChange: l,
            name: c,
            form: u,
            value: o,
            internal_do_not_use_render: e => {
                let {
                    isFormControl: c
                } = e;
                return (0, d.jsxs)(d.Fragment, {
                    children: [(0, d.jsx)(b, {
                        ...f,
                        ref: t,
                        __scopeCheckbox: a
                    }), c && (0, d.jsx)(w, {
                        __scopeCheckbox: a
                    })]
                })
            }
        })
    });
    _.displayName = u;
    var x = "CheckboxIndicator",
        y = t.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                forceMount: c,
                ...r
            } = e, s = h(x, a);
            return (0, d.jsx)(o.f, {
                present: c || q(s.checked) || !0 === s.checked,
                children: (0, d.jsx)(l.f.span, {
                    "data-state": S(s.checked),
                    "data-disabled": s.disabled ? "" : void 0,
                    ...r,
                    ref: t,
                    style: {
                        pointerEvents: "none",
                        ...e.style
                    }
                })
            })
        });
    y.displayName = x;
    var k = "CheckboxBubbleInput",
        w = t.forwardRef((e, c) => {
            let {
                __scopeCheckbox: r,
                ...s
            } = e, {
                control: o,
                hasConsumerStoppedPropagationRef: u,
                checked: f,
                defaultChecked: m,
                required: p,
                disabled: v,
                name: g,
                value: b,
                form: _,
                bubbleInput: x,
                setBubbleInput: y
            } = h(k, r), w = (0, a.j)(c, y), S = (0, i.f)(f), P = (0, n.f)(o);
            t.useEffect(() => {
                if (!x) return;
                let e = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set,
                    t = !u.current;
                if (S !== f && e) {
                    let a = new Event("click", {
                        bubbles: t
                    });
                    x.indeterminate = q(f), e.call(x, !q(f) && f), x.dispatchEvent(a)
                }
            }, [x, S, f, u]);
            let T = t.useRef(!q(f) && f);
            return (0, d.jsx)(l.f.input, {
                type: "checkbox",
                "aria-hidden": !0,
                defaultChecked: null != m ? m : T.current,
                required: p,
                disabled: v,
                name: g,
                value: b,
                form: _,
                ...s,
                tabIndex: -1,
                ref: w,
                style: {
                    ...s.style,
                    ...P,
                    position: "absolute",
                    pointerEvents: "none",
                    opacity: 0,
                    margin: 0,
                    transform: "translateX(-100%)"
                }
            })
        });

    function q(e) {
        return "indeterminate" === e
    }

    function S(e) {
        return q(e) ? "indeterminate" : e ? "checked" : "unchecked"
    }
    w.displayName = k, e.s(["S", 0, y, "F", 0, _])
}, 989308, e => {
    "use strict";
    var t = e.i(643766),
        a = e.i(120297),
        c = e.i(206350),
        r = e => {
            var r, i, n;
            let o, l, {
                    present: d,
                    children: u
                } = e,
                f = function(e) {
                    var a, r;
                    let [i, n] = t.useState(), o = t.useRef(null), l = t.useRef(e), d = t.useRef("none"), [u, f] = (a = e ? "mounted" : "unmounted", r = {
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
                    }, t.useReducer((e, t) => {
                        let a = r[e][t];
                        return null != a ? a : e
                    }, a));
                    return t.useEffect(() => {
                        let e = s(o.current);
                        d.current = "mounted" === u ? e : "none"
                    }, [u]), (0, c.f)(() => {
                        let t = o.current,
                            a = l.current;
                        if (a !== e) {
                            let c = d.current,
                                r = s(t);
                            e ? f("MOUNT") : "none" === r || (null == t ? void 0 : t.display) === "none" ? f("UNMOUNT") : a && c !== r ? f("ANIMATION_OUT") : f("UNMOUNT"), l.current = e
                        }
                    }, [e, f]), (0, c.f)(() => {
                        if (i) {
                            var e;
                            let t, a = null != (e = i.ownerDocument.defaultView) ? e : window,
                                c = e => {
                                    let c = s(o.current).includes(CSS.escape(e.animationName));
                                    if (e.target === i && c && (f("ANIMATION_END"), !l.current)) {
                                        let e = i.style.animationFillMode;
                                        i.style.animationFillMode = "forwards", t = a.setTimeout(() => {
                                            "forwards" === i.style.animationFillMode && (i.style.animationFillMode = e)
                                        })
                                    }
                                },
                                r = e => {
                                    e.target === i && (d.current = s(o.current))
                                };
                            return i.addEventListener("animationstart", r), i.addEventListener("animationcancel", c), i.addEventListener("animationend", c), () => {
                                a.clearTimeout(t), i.removeEventListener("animationstart", r), i.removeEventListener("animationcancel", c), i.removeEventListener("animationend", c)
                            }
                        }
                        f("ANIMATION_END")
                    }, [i, f]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(u),
                        ref: t.useCallback(e => {
                            o.current = e ? getComputedStyle(e) : null, n(e)
                        }, [])
                    }
                }(d),
                m = "function" == typeof u ? u({
                    present: f.isPresent
                }) : t.Children.only(u),
                p = (0, a.j)(f.ref, (l = (o = null == (i = Object.getOwnPropertyDescriptor((r = m).props, "ref")) ? void 0 : i.get) && "isReactWarning" in o && o.isReactWarning) ? r.ref : (l = (o = null == (n = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : n.get) && "isReactWarning" in o && o.isReactWarning) ? r.props.ref : r.props.ref || r.ref);
            return "function" == typeof u || f.isPresent ? t.cloneElement(m, {
                ref: p
            }) : null
        };

    function s(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }
    r.displayName = "Presence", e.s(["f", 0, r])
}, 687459, e => {
    "use strict";
    var t = e.i(311857);
    e.s(["f", () => t.f])
}, 695841, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/alert_dark.1spa8ixzmujxs.svg")
}, 659509, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/alert_light.3o6_fob3g_8zu.svg")
}, 124703, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/api_key_dark.1k1v6y4zm3j28.svg")
}, 932203, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/api_key_light.06t4q4202-77s.svg")
}, 759655, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/audio_dark.16razgllw2ska.svg")
}, 375920, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/audio_light.3ra073_18pbj-.svg")
}, 440714, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/avatar_setup_dark.0orjsl7i089hc.svg")
}, 174503, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/avatar_setup_light.32r86q54d7kuh.svg")
}, 968539, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/badge_dark.3m45r-3favo3f.svg")
}, 310022, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/badge_light.3fxfvj8ub7utb.svg")
}, 764454, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/bar_graph_dark.01vf9sty52re2.svg")
}, 137932, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/bar_graph_light.1iiixo_d8ur81.svg")
}, 529281, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/collaborators_dark.30gxkwssilacj.svg")
}, 483202, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/collaborators_light.3x7fovqhay1x5.svg")
}, 537904, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/decals_dark.2jpntsljojhzc.svg")
}, 247792, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/decals_light.16_gp3tnuc5p_.svg")
}, 791162, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/envelope_dark.2-ouf9shuihi4.svg")
}, 452524, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/envelope_light.1me9hqye66z7w.svg")
}, 724929, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/event_calendar_dark.3lx4_kse68by8.svg")
}, 214077, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/event_calendar_light.1pq-t84d90ty1.svg")
}, 695620, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/find_people_dark.220q6_cs04hcq.svg")
}, 89188, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/find_people_light.1gkb3pmwc8s2n.svg")
}, 56026, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/image_dark.2giew28wx4z86.svg")
}, 110349, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/image_light.0ouq8tcgpznz7.svg")
}, 521248, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/leaderboard_dark.301ypg94lbxpv.svg")
}, 617940, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/leaderboard_light.43sjz_ibwkiq_.svg")
}, 667467, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/line_chart_dark.0k7qf3mhepo6s.svg")
}, 39121, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/line_chart_light.049gcvvmai0ax.svg")
}, 72248, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/localization_dark.1ia7wat2mwyfi.svg")
}, 75514, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/localization_light.2jss_xvx2fuq0.svg")
}, 999561, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/lockSecrets_dark.0na6naigcbnkj.svg")
}, 960945, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/lockSecrets_light.0rzix2i1i13lt.svg")
}, 604913, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/makeup_look_dark.26-5-yn8598c9.svg")
}, 300847, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/makeup_look_light.0rc05t5n5al4m.svg")
}, 10871, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/managed_pricing_dark.2zdkf2-ctboa2.svg")
}, 739058, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/managed_pricing_light.0sioq_hruq1qp.svg")
}, 383875, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/meshes_dark.2tlm50ns1pq5o.svg")
}, 581511, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/meshes_light.36wh96flp2o3r.svg")
}, 340541, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/models_dark.30suu5lj5-ua5.svg")
}, 5471, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/models_light.0kiw6k3ejw-rn.svg")
}, 747665, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/models_plugins_parts_dark.3jp6jislnsqf8.svg")
}, 561654, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/models_plugins_parts_light.2nj1xhv0bfg_u.svg")
}, 87087, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/notifications_dark.2l_rf34_xo6o8.svg")
}, 250923, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/notifications_light.3p-b4rzvwwfmj.svg")
}, 887525, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/oauth_dark.42jv8--11_1i0.svg")
}, 938203, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/oauth_light.17vwiebwrn8ox.svg")
}, 619309, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/rights_manager_dark.0m7ca17sdbgim.svg")
}, 86276, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/rights_manager_light.1moaenz1cbft0.svg")
}, 245129, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/robux_dark.0adh_znay53ig.svg")
}, 852371, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/robux_light.0r27xddcy2n6m.svg")
}, 908291, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/run_dark.1sun4tvxh_arh.svg")
}, 416054, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/run_light.29f-3jyw910_v.svg")
}, 570305, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/shareLinks_dark.1l5fwuv6cgzmy.svg")
}, 147426, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/shareLinks_light.116igf-ldibmu.svg")
}, 8071, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/signin_dark.1k_gzn1-5q0ca.svg")
}, 633185, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/signin_light.1o1-jng_ct0y2.svg")
}, 45635, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/token_dark.2qy4jy9ffjhax.svg")
}, 936037, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/token_light.2xc00j5zp1q8_.svg")
}, 810710, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/trial_dark.2llr5mlhjq5fa.svg")
}, 960838, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/trial_gamepass_dark.35rtv5i112_gt.svg")
}, 963448, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/trial_gamepass_light.2wpn1oa2gkp7h.svg")
}, 46580, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/trial_light.13hip-hiizhla.svg")
}, 167478, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/video_dark.2-gdpodjtsjj3.svg")
}, 403990, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/video_game_dark.0tuxtkttj8gcu.svg")
}, 45779, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/video_game_light.3l155817mjupj.svg")
}, 795445, e => {
    e.q("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/_next/static/media/video_light.1fum3vlxctp7w.svg")
}, 128834, e => {
    "use strict";
    var t = e.i(515961),
        a = e.i(600937),
        c = e.i(511532),
        r = e.i(335020),
        s = e.i(643766),
        i = e.i(634130);
    let n = {
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
        l = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        d = {
            XSmall: "",
            Small: "padding-top-xxsmall",
            Medium: "padding-top-xxsmall",
            Large: "padding-top-xxsmall"
        };
    e.s(["f", 0, e => {
        var u, f, m, p;
        let {
            label: h,
            className: v,
            isChecked: g,
            isDisabled: b,
            size: _,
            hint: x,
            placement: y,
            onCheckedChange: k,
            id: w,
            "aria-describedby": q,
            ...S
        } = e, P = (0, s.useContext)(c.i), T = null != (u = null != (f = null == P ? void 0 : P.size) ? f : _) ? u : "Medium", j = null != (m = null != (p = null == P ? void 0 : P.placement) ? p : y) ? m : "Start", E = b || (null == P ? void 0 : P.isDisabled), L = (0, a.f)(), R = w || L, A = P && h && x ? "".concat(R, "Hint") : void 0, N = h && s.default.createElement("label", {
            htmlFor: R,
            className: (0, r.U)("flex flex-col grow-1 gap-xsmall", !E && "cursor-pointer")
        }, s.default.createElement("span", {
            className: (0, r.U)(l[T], d[T], "content-emphasis")
        }, h), x && s.default.createElement("span", {
            id: A,
            className: (0, r.U)(P ? l[T] : "text-body-medium", "content-default")
        }, x));
        return s.default.createElement("div", {
            className: (0, r.U)("foundation-web-checkbox flex gap-medium", E && "opacity-[0.5]", !E && "cursor-pointer", v)
        }, "End" === j && N, s.default.createElement("div", {
            className: (0, r.U)(o[T])
        }, s.default.createElement(i.F, {
            "data-slot": "checkbox",
            className: (0, r.U)(n[T], t.Y, !E && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
            id: R,
            checked: g,
            disabled: E,
            onCheckedChange: k,
            "aria-label": h,
            "aria-describedby": [q, A].filter(Boolean).join(" ") || void 0,
            ...S
        }, s.default.createElement(t.v, null), s.default.createElement(i.S, {
            "data-slot": "checkbox-indicator",
            className: (0, r.U)(n[T], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
        }))), "Start" === j && N)
    }])
}, 798251, e => {
    "use strict";
    var t = e.i(335020),
        a = e.i(643766),
        c = e.i(637068);
    let r = new Set(["_self", "_parent", "_top"]),
        s = {
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        i = {
            Standard: "content-emphasis",
            Emphasis: "content-emphasis",
            Inverse: "content-inverse-default"
        },
        n = (0, a.forwardRef)((e, n) => {
            var o, l, d;
            let {
                children: u,
                className: f,
                size: m,
                color: p = "Emphasis",
                variant: h = "Standalone",
                underline: v = "hover",
                isExternal: g,
                asChild: b,
                ..._
            } = e, x = (l = null != (o = _.as) ? o : "a", d = "button" === _.as ? void 0 : _.target, void 0 !== g ? g : "button" !== l && void 0 !== d && !r.has(d)), y = (0, t.U)("foundation-web-link", "button" === _.as && "bg-none stroke-none padding-none appearance-none [text-align:inherit]", ("Standalone" === h || x) && "inline-flex items-center gap-xsmall", void 0 !== m && s[m], i[p], "always" === v ? "underline" : "no-underline", "hover" === v && "hover:underline", "motion-safe:transition-opacity", "hover:cursor-pointer hover:[opacity:0.8]", "radius-xsmall focus-visible:[outline-style:solid] focus-visible:[outline-width:var(--stroke-standard)] focus-visible:[outline-color:var(--color-system-emphasis)]", f), k = x ? a.default.createElement("span", {
                "aria-hidden": !0,
                "data-testid": "foundation-web-icon",
                className: (0, t.U)("grow-0 shrink-0 basis-auto icon size-[1em]", "icon-regular-arrow-up-right-from-square")
            }) : null;
            if (b) {
                let {
                    as: e,
                    ...t
                } = _, r = a.default.Children.only(u);
                return a.default.isValidElement(r) ? a.default.createElement(c.M, {
                    ref: n,
                    ...t,
                    className: y
                }, a.default.cloneElement(r, {}, a.default.createElement(a.default.Fragment, null, r.props.children, k))) : null
            }
            if ("button" === _.as) {
                let {
                    as: e,
                    type: t,
                    ...c
                } = _;
                return a.default.createElement("button", {
                    ref: n,
                    type: null != t ? t : "button",
                    ...c,
                    className: y
                }, u, k)
            }
            let {
                as: w,
                ...q
            } = _;
            return a.default.createElement("a", {
                ref: n,
                ...q,
                className: y
            }, u, k)
        });
    n.displayName = "Link", e.s(["f", 0, n])
}, 511532, e => {
    "use strict";
    var t = e.i(643766);
    let a = (0, t.createContext)(null),
        c = (0, t.createContext)(null),
        r = (0, t.createContext)(null);
    e.s(["i", 0, a, "f", 0, r, "U", 0, c])
}, 719392, e => {
    "use strict";
    var t = e.i(463146);

    function a(e, t) {
        let {
            pages: a,
            pageParams: c
        } = t, r = a.length - 1;
        return a.length > 0 ? e.getNextPageParam(a[r], a, c[r], c) : void 0
    }

    function c(e, t) {
        var a;
        let {
            pages: c,
            pageParams: r
        } = t;
        return c.length > 0 ? null == (a = e.getPreviousPageParam) ? void 0 : a.call(e, c[0], c, r[0], r) : void 0
    }
    e.s(["B", 0, function(e, t) {
        return !!t && null != a(e, t)
    }, "u", 0, function(e, t) {
        return !!t && !!e.getPreviousPageParam && null != c(e, t)
    }, "T", 0, function(e) {
        return {
            onFetch: (r, s) => {
                var i, n, o, l, d;
                let u = r.options,
                    f = null == (o = r.fetchOptions) || null == (n = o.meta) || null == (i = n.fetchMore) ? void 0 : i.direction,
                    m = (null == (l = r.state.data) ? void 0 : l.pages) || [],
                    p = (null == (d = r.state.data) ? void 0 : d.pageParams) || [],
                    h = {
                        pages: [],
                        pageParams: []
                    },
                    v = 0,
                    g = async () => {
                        let s = !1,
                            i = (0, t.W)(r.options, r.fetchOptions),
                            n = async (e, a, c) => {
                                let n;
                                if (s) return Promise.reject();
                                if (null == a && e.pages.length) return Promise.resolve(e);
                                let o = (Object.defineProperty(n = {
                                        client: r.client,
                                        queryKey: r.queryKey,
                                        pageParam: a,
                                        direction: c ? "backward" : "forward",
                                        meta: r.options.meta
                                    }, "signal", {
                                        enumerable: !0,
                                        get: () => (r.signal.aborted ? s = !0 : r.signal.addEventListener("abort", () => {
                                            s = !0
                                        }), r.signal)
                                    }), n),
                                    l = await i(o),
                                    {
                                        maxPages: d
                                    } = r.options,
                                    u = c ? t.R : t.E;
                                return {
                                    pages: u(e.pages, l, d),
                                    pageParams: u(e.pageParams, a, d)
                                }
                            };
                        if (f && m.length) {
                            let e = "backward" === f,
                                t = {
                                    pages: m,
                                    pageParams: p
                                },
                                r = (e ? c : a)(u, t);
                            h = await n(t, r, e)
                        } else {
                            let t = null != e ? e : m.length;
                            do {
                                var o;
                                let e = 0 === v ? null != (o = p[0]) ? o : u.initialPageParam : a(u, h);
                                if (v > 0 && null == e) break;
                                h = await n(h, e), v++
                            } while (v < t)
                        }
                        return h
                    };
                r.options.persister ? r.fetchFn = () => {
                    var e, t;
                    return null == (e = (t = r.options).persister) ? void 0 : e.call(t, g, {
                        client: r.client,
                        queryKey: r.queryKey,
                        meta: r.options.meta,
                        signal: r.signal
                    }, s)
                } : r.fetchFn = g
            }
        }
    }])
}, 900496, e => {
    "use strict";
    var t = e.i(230699),
        a = e.i(719392),
        c = class extends t.f {
            bindMethods() {
                super.bindMethods(), this.fetchNextPage = this.fetchNextPage.bind(this), this.fetchPreviousPage = this.fetchPreviousPage.bind(this)
            }
            setOptions(e) {
                super.setOptions({
                    ...e,
                    behavior: (0, a.T)()
                })
            }
            getOptimisticResult(e) {
                return e.behavior = (0, a.T)(), super.getOptimisticResult(e)
            }
            fetchNextPage(e) {
                return this.fetch({
                    ...e,
                    meta: {
                        fetchMore: {
                            direction: "forward"
                        }
                    }
                })
            }
            fetchPreviousPage(e) {
                return this.fetch({
                    ...e,
                    meta: {
                        fetchMore: {
                            direction: "backward"
                        }
                    }
                })
            }
            createResult(e, t) {
                var c, r;
                let {
                    state: s
                } = e, i = super.createResult(e, t), {
                    isFetching: n,
                    isRefetching: o,
                    isError: l,
                    isRefetchError: d
                } = i, u = null == (r = s.fetchMeta) || null == (c = r.fetchMore) ? void 0 : c.direction, f = l && "forward" === u, m = n && "forward" === u, p = l && "backward" === u, h = n && "backward" === u;
                return {
                    ...i,
                    fetchNextPage: this.fetchNextPage,
                    fetchPreviousPage: this.fetchPreviousPage,
                    hasNextPage: (0, a.B)(t, s.data),
                    hasPreviousPage: (0, a.u)(t, s.data),
                    isFetchNextPageError: f,
                    isFetchingNextPage: m,
                    isFetchPreviousPageError: p,
                    isFetchingPreviousPage: h,
                    isRefetchError: d && !f && !p,
                    isRefetching: o && !m && !h
                }
            }
            constructor(e, t) {
                super(e, t)
            }
        },
        r = e.i(154152);
    e.s(["f", 0, function(e, t) {
        return (0, r.f)(e, c, t)
    }], 900496)
}, 406407, e => {
    "use strict";
    let t = (0, e.i(157700).e)({
        namespace: "advertiser-publisher-experience",
        name: "adsActivityAnnotationsEnabled",
        defaultValue: !1
    });
    e.s(["f", 0, t])
}, 886525, e => {
    "use strict";
    let t = (0, e.i(157700).e)({
        namespace: "game-engine-streaming",
        name: "enableExperienceLaunchTimeChart",
        defaultValue: !1
    });
    e.s(["f", 0, t])
}, 28850, e => {
    "use strict";
    var t = e.i(805290),
        a = e.i(415858),
        c = function(e, t) {
            return (c = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var a in t) Object.prototype.hasOwnProperty.call(t, a) && (e[a] = t[a])
            })(e, t)
        },
        r = function() {
            return (r = Object.assign || function(e) {
                for (var t, a = 1, c = arguments.length; a < c; a++)
                    for (var r in t = arguments[a]) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r]);
                return e
            }).apply(this, arguments)
        };

    function s(e, t, a, c) {
        return new(a || (a = Promise))(function(r, s) {
            function i(e) {
                try {
                    o(c.next(e))
                } catch (e) {
                    s(e)
                }
            }

            function n(e) {
                try {
                    o(c.throw(e))
                } catch (e) {
                    s(e)
                }
            }

            function o(e) {
                var t;
                e.done ? r(e.value) : ((t = e.value) instanceof a ? t : new a(function(e) {
                    e(t)
                })).then(i, n)
            }
            o((c = c.apply(e, t || [])).next())
        })
    }

    function i(e, t) {
        var a, c, r, s = {
                label: 0,
                sent: function() {
                    if (1 & r[0]) throw r[1];
                    return r[1]
                },
                trys: [],
                ops: []
            },
            i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return i.next = n(0), i.throw = n(1), i.return = n(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
            return this
        }), i;

        function n(n) {
            return function(o) {
                var l = [n, o];
                if (a) throw TypeError("Generator is already executing.");
                for (; i && (i = 0, l[0] && (s = 0)), s;) try {
                    if (a = 1, c && (r = 2 & l[0] ? c.return : l[0] ? c.throw || ((r = c.return) && r.call(c), 0) : c.next) && !(r = r.call(c, l[1])).done) return r;
                    switch (c = 0, r && (l = [2 & l[0], r.value]), l[0]) {
                        case 0:
                        case 1:
                            r = l;
                            break;
                        case 4:
                            return s.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            s.label++, c = l[1], l = [0];
                            continue;
                        case 7:
                            l = s.ops.pop(), s.trys.pop();
                            continue;
                        default:
                            if (!(r = (r = s.trys).length > 0 && r[r.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                s = 0;
                                continue
                            }
                            if (3 === l[0] && (!r || l[1] > r[0] && l[1] < r[3])) {
                                s.label = l[1];
                                break
                            }
                            if (6 === l[0] && s.label < r[1]) {
                                s.label = r[1], r = l;
                                break
                            }
                            if (r && s.label < r[2]) {
                                s.label = r[2], s.ops.push(l);
                                break
                            }
                            r[2] && s.ops.pop(), s.trys.pop();
                            continue
                    }
                    l = t.call(e, s)
                } catch (e) {
                    l = [6, e], c = 0
                } finally {
                    a = r = 0
                }
                if (5 & l[0]) throw l[1];
                return {
                    value: l[0] ? l[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function n(e) {
        var t;
        return null == (t = e) ? t : {
            createdAt: (0, a.u)(t, "created_at") ? new Date(t.created_at) : void 0,
            expiresAt: (0, a.u)(t, "expires_at") ? new Date(t.expires_at) : void 0,
            id: (0, a.u)(t, "id") ? t.id : void 0,
            universeId: (0, a.u)(t, "universe_id") ? t.universe_id : void 0,
            values: (0, a.u)(t, "values") ? function(e) {
                if (null == e) return e;
                if ("SelectGracePeriod" === e.type) return r(r({}, null == e ? e : {
                    decisionEventId: e.decision_event_id,
                    type: e.type,
                    version: e.version
                }), {
                    type: "SelectGracePeriod"
                });
                throw Error("No variant of CreatorAcknowledgmentValues exists with 'type=".concat(e.type, "'"))
            }(t.values) : void 0,
            visible: (0, a.u)(t, "visible") ? t.visible : void 0
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function o(e, t) {
        return null == e ? e : {
            items: (0, a.u)(e, "items") ? e.items.map(n) : void 0,
            nextCursor: (0, a.u)(e, "next_cursor") ? e.next_cursor : void 0
        }
    }

    function l(e) {
        var t;
        return null == (t = e) ? t : {
            createdAt: (0, a.u)(t, "created_at") ? new Date(t.created_at) : void 0,
            id: (0, a.u)(t, "id") ? t.id : void 0,
            policy: (0, a.u)(t, "policy") ? t.policy : void 0,
            policyLabelKey: (0, a.u)(t, "policy_label_key") ? t.policy_label_key : void 0
        }
    }
    var d = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return function(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

                function a() {
                    this.constructor = e
                }
                c(e, t), e.prototype = null === t ? Object.create(t) : (a.prototype = t.prototype, new a)
            }(t, e), t.prototype.creatorTransparencyServiceGetCreatorAcknowledgmentRaw = function(e, t) {
                return s(this, void 0, void 0, function() {
                    var c, r, s;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.id || void 0 === e.id) throw new a.w("id", "Required parameter requestParameters.id was null or undefined when calling creatorTransparencyServiceGetCreatorAcknowledgment.");
                                return c = {}, r = {}, [4, this.request({
                                    path: "/v1/creator-acknowledgments/{id}".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                    schemaPath: "/v1/creator-acknowledgments/{id}",
                                    method: "GET",
                                    headers: r,
                                    query: c
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new a.H(s, function(e) {
                                    return n(e)
                                })]
                        }
                    })
                })
            }, t.prototype.creatorTransparencyServiceGetCreatorAcknowledgment = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return i(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return [4, this.creatorTransparencyServiceGetCreatorAcknowledgmentRaw(e, t)];
                            case 1:
                                return [4, a.sent().value()];
                            case 2:
                                return [2, a.sent()]
                        }
                    })
                })
            }, t.prototype.creatorTransparencyServiceGetRestrictionRaw = function(e, t) {
                return s(this, void 0, void 0, function() {
                    var c, r, s;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.contentId || void 0 === e.contentId) throw new a.w("contentId", "Required parameter requestParameters.contentId was null or undefined when calling creatorTransparencyServiceGetRestriction.");
                                if (null === e.contentType || void 0 === e.contentType) throw new a.w("contentType", "Required parameter requestParameters.contentType was null or undefined when calling creatorTransparencyServiceGetRestriction.");
                                return c = {}, void 0 !== e.contentId && (c.content_id = e.contentId), void 0 !== e.contentType && (c.content_type = e.contentType), r = {}, [4, this.request({
                                    path: "/v1/restriction",
                                    schemaPath: "/v1/restriction",
                                    method: "GET",
                                    headers: r,
                                    query: c
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new a.H(s, function(e) {
                                    return null == e ? e : {
                                        isRestricted: (0, a.u)(e, "is_restricted") ? e.is_restricted : void 0,
                                        restrictionMessage: (0, a.u)(e, "restriction_message") ? e.restriction_message : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.creatorTransparencyServiceGetRestriction = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return i(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return [4, this.creatorTransparencyServiceGetRestrictionRaw(e, t)];
                            case 1:
                                return [4, a.sent().value()];
                            case 2:
                                return [2, a.sent()]
                        }
                    })
                })
            }, t.prototype.creatorTransparencyServiceListCreatorAcknowledgmentsRaw = function(e, t) {
                return s(this, void 0, void 0, function() {
                    var c, r, s;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return c = {}, void 0 !== e.cursor && (c.cursor = e.cursor), void 0 !== e.limit && (c.limit = e.limit), r = {}, [4, this.request({
                                    path: "/v1/creator-acknowledgments",
                                    schemaPath: "/v1/creator-acknowledgments",
                                    method: "GET",
                                    headers: r,
                                    query: c
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new a.H(s, function(e) {
                                    return o(e)
                                })]
                        }
                    })
                })
            }, t.prototype.creatorTransparencyServiceListCreatorAcknowledgments = function() {
                return s(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), i(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return [4, this.creatorTransparencyServiceListCreatorAcknowledgmentsRaw(e, t)];
                            case 1:
                                return [4, a.sent().value()];
                            case 2:
                                return [2, a.sent()]
                        }
                    })
                })
            }, t.prototype.creatorTransparencyServiceListUniverseCreatorAcknowledgmentsRaw = function(e, t) {
                return s(this, void 0, void 0, function() {
                    var c, r, s;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new a.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling creatorTransparencyServiceListUniverseCreatorAcknowledgments.");
                                return c = {}, void 0 !== e.cursor && (c.cursor = e.cursor), void 0 !== e.limit && (c.limit = e.limit), r = {}, [4, this.request({
                                    path: "/v1/universes/{universe_id}/creator-acknowledgments".replace("{".concat("universe_id", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universe_id}/creator-acknowledgments",
                                    method: "GET",
                                    headers: r,
                                    query: c
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new a.H(s, function(e) {
                                    return o(e)
                                })]
                        }
                    })
                })
            }, t.prototype.creatorTransparencyServiceListUniverseCreatorAcknowledgments = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return i(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return [4, this.creatorTransparencyServiceListUniverseCreatorAcknowledgmentsRaw(e, t)];
                            case 1:
                                return [4, a.sent().value()];
                            case 2:
                                return [2, a.sent()]
                        }
                    })
                })
            }, t.prototype.creatorTransparencyServiceListUniverseViolationsRaw = function(e, t) {
                return s(this, void 0, void 0, function() {
                    var c, r, s;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new a.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling creatorTransparencyServiceListUniverseViolations.");
                                return c = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universe_id}/violations".replace("{".concat("universe_id", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universe_id}/violations",
                                    method: "GET",
                                    headers: r,
                                    query: c
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new a.H(s, function(e) {
                                    return null == e ? e : {
                                        items: (0, a.u)(e, "items") ? e.items.map(l) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.creatorTransparencyServiceListUniverseViolations = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return i(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return [4, this.creatorTransparencyServiceListUniverseViolationsRaw(e, t)];
                            case 1:
                                return [4, a.sent().value()];
                            case 2:
                                return [2, a.sent()]
                        }
                    })
                })
            }, t
        }(a._),
        u = a,
        f = e.i(272593);
    class m extends u._ {
        async getRestriction(e, t, a) {
            return this.api.creatorTransparencyServiceGetRestriction({
                contentId: e,
                contentType: t
            }, a)
        }
        async listCreatorAcknowledgments(e, t, a) {
            return this.api.creatorTransparencyServiceListCreatorAcknowledgments({
                cursor: e,
                limit: t
            }, a)
        }
        async listUniverseCreatorAcknowledgments(e, t, a, c) {
            return this.api.creatorTransparencyServiceListUniverseCreatorAcknowledgments({
                universeId: e,
                cursor: t,
                limit: a
            }, c)
        }
        async listUniverseViolations(e, t) {
            return this.api.creatorTransparencyServiceListUniverseViolations({
                universeId: e
            }, t)
        }
        async getUniverseViolation(e, t) {
            let a = await this.request({
                path: "/v1/universes/".concat(e, "/violations/").concat(encodeURIComponent(t)),
                schemaPath: "/v1/universes/{universe_id}/violations/{violation_id}",
                method: "GET",
                headers: {}
            });
            return new u.H(a, e => ({
                ...l(e),
                appealBy: void 0 === e.appeal_by ? void 0 : new Date(e.appeal_by),
                canAppeal: e.can_appeal,
                appeals: e.appeals.map(e => ({
                    state: e.state,
                    createdAt: new Date(e.created_at),
                    decidedAt: void 0 === e.decided_at ? void 0 : new Date(e.decided_at),
                    submitterUserId: e.submitter_user_id,
                    message: e.message
                })),
                moderatorNote: e.moderator_note
            })).value()
        }
        async createUniverseViolationAppeal(e, t, a) {
            let c = await this.request({
                path: "/v1/universes/".concat(e, "/violations/").concat(encodeURIComponent(t), "/appeals"),
                schemaPath: "/v1/universes/{universe_id}/violations/{violation_id}/appeals",
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: {
                    message: a
                }
            });
            return new u.H(c, e => ({
                state: e.state,
                createdAt: new Date(e.created_at),
                message: e.message
            })).value()
        }
        constructor() {
            let e = (0, f.f)("creator-transparency-service", "bedev2");
            super(e), (0, t._)(this, "api", void 0), this.api = new d(e)
        }
    }
    let p = new m;
    e.s(["f", 0, p], 28850)
}, 998683, e => {
    "use strict";
    var t = e.i(805290),
        a = e.i(658867),
        c = e.i(272593);
    let r = new class {
        async getLocale(e) {
            return this.localeApi.v1LocalesGet(e)
        }
        async getUserLocalizationLocusSupportedLocales() {
            return this.localeApi.v1LocalesUserLocalizationLocusSupportedLocalesGet()
        }
        async getSupportedLocalesForCreators(e) {
            return this.localeApi.v1LocalesSupportedLocalesForCreatorsGet(e)
        }
        async getSupportedLocalesForFeature(e) {
            return this.localeApi.v1LocalesSupportedLocalesForFeatureGet(e)
        }
        constructor() {
            (0, t._)(this, "localeApi", void 0), this.localeApi = new a.J((0, c.f)("locale", "bedev1"))
        }
    };
    e.s(["f", 0, r])
}, 493924, 938429, 321623, e => {
    "use strict";
    var t = e.i(785517),
        a = e.i(47277),
        c = e.i(67243),
        r = e.i(776344),
        s = e.i(462863),
        i = e.i(124703),
        n = e.i(932203),
        o = e.i(759655),
        l = e.i(375920),
        d = e.i(440714),
        u = e.i(174503),
        f = e.i(968539),
        m = e.i(310022),
        p = e.i(764454),
        h = e.i(137932),
        v = e.i(529281),
        g = e.i(483202),
        b = e.i(537904),
        _ = e.i(247792),
        x = e.i(791162),
        y = e.i(452524),
        k = e.i(724929),
        w = e.i(214077),
        q = e.i(695620),
        S = e.i(89188),
        P = e.i(56026),
        T = e.i(110349),
        j = e.i(521248),
        E = e.i(617940),
        L = e.i(667467),
        R = e.i(39121),
        A = e.i(72248),
        N = e.i(75514),
        U = e.i(999561),
        C = e.i(960945),
        I = e.i(604913),
        O = e.i(300847),
        z = e.i(10871),
        M = e.i(739058),
        G = e.i(383875),
        D = e.i(581511),
        F = e.i(340541),
        V = e.i(5471),
        K = e.i(747665),
        B = e.i(561654),
        H = e.i(87087),
        W = e.i(250923),
        X = e.i(887525),
        J = e.i(938203),
        Y = e.i(619309),
        Q = e.i(86276),
        Z = e.i(245129),
        $ = e.i(852371),
        ee = e.i(908291),
        et = e.i(416054),
        ea = e.i(570305),
        ec = e.i(147426),
        er = e.i(8071),
        es = e.i(633185),
        ei = e.i(45635),
        en = e.i(936037),
        eo = e.i(810710),
        el = e.i(960838),
        ed = e.i(963448),
        eu = e.i(46580),
        ef = e.i(167478),
        em = e.i(403990),
        ep = e.i(45779),
        eh = e.i(795445);
    let ev = {
        secrets: {
            light: C.default,
            dark: U.default
        },
        noPermissions: {
            light: C.default,
            dark: U.default
        },
        notifications: {
            light: W.default,
            dark: H.default
        },
        experiences: {
            light: ep.default,
            dark: em.default
        },
        shareLinks: {
            light: ec.default,
            dark: ea.default
        },
        eventsAndUpdates: {
            light: w.default,
            dark: k.default
        },
        avatarItem: {
            light: u.default,
            dark: d.default
        },
        models: {
            light: V.default,
            dark: F.default
        },
        plugins: {
            light: B.default,
            dark: K.default
        },
        audio: {
            light: l.default,
            dark: o.default
        },
        decals: {
            light: _.default,
            dark: b.default
        },
        images: {
            light: T.default,
            dark: P.default
        },
        videos: {
            light: eh.default,
            dark: ef.default
        },
        meshes: {
            light: D.default,
            dark: G.default
        },
        animations: {
            light: et.default,
            dark: ee.default
        },
        textDocuments: {
            light: y.default,
            dark: x.default
        },
        noUsers: {
            light: g.default,
            dark: v.default
        },
        localization: {
            light: N.default,
            dark: A.default
        },
        rightsManager: {
            light: Q.default,
            dark: Y.default
        },
        tokens: {
            light: en.default,
            dark: ei.default
        },
        chart: {
            light: R.default,
            dark: L.default
        },
        badge: {
            light: m.default,
            dark: f.default
        },
        apiKeys: {
            light: n.default,
            dark: i.default
        },
        signin: {
            light: es.default,
            dark: er.default
        },
        oAuthApps: {
            light: J.default,
            dark: X.default
        },
        makeupLooks: {
            light: O.default,
            dark: I.default
        },
        barGraph: {
            light: h.default,
            dark: p.default
        },
        leaderboard: {
            light: E.default,
            dark: j.default
        },
        findPeople: {
            light: S.default,
            dark: q.default
        },
        managedPricing: {
            light: M.default,
            dark: z.default
        },
        robux: {
            light: $.default,
            dark: Z.default
        },
        trial: {
            light: eu.default,
            dark: eo.default
        },
        trialGamepass: {
            light: ed.default,
            dark: el.default
        }
    };
    e.s(["f", 0, ev], 938429);
    let eg = "".concat("https://assets.create.roblox.com/fcc50966a28a954bf154c1dae0fcaccbde4c275c/assets", "/spot_illustrations"),
        eb = {
            small: {
                analytics: "".concat(eg, "/small/analytics.svg"),
                animations: "".concat(eg, "/small/animations.svg"),
                audio: "".concat(eg, "/small/audio.svg"),
                audioLight: "".concat(eg, "/small/audio_light.svg"),
                audioDark: "".concat(eg, "/small/audio_dark.svg"),
                avatarItem: "".concat(eg, "/small/avatar_item.svg"),
                beginSearch: "".concat(eg, "/small/beginSearch.svg"),
                creatorStore: "".concat(eg, "/small/creator_store.svg"),
                decals: "".concat(eg, "/small/decals.svg"),
                events: "".concat(eg, "/small/events.svg"),
                experiences: "".concat(eg, "/small/experiences.svg"),
                images: "".concat(eg, "/small/images.svg"),
                meshes: "".concat(eg, "/small/meshes.svg"),
                models: "".concat(eg, "/small/models.svg"),
                plugins: "".concat(eg, "/small/plugins.svg"),
                script: "".concat(eg, "/small/script.svg"),
                song: "".concat(eg, "/small/song.svg"),
                musicNote: "".concat(eg, "/small/audio_music_note.svg"),
                noUsers: "".concat(eg, "/small/no_users.svg"),
                user: "".concat(eg, "/small/user.svg"),
                users: "".concat(eg, "/small/users.svg"),
                videos: "".concat(eg, "/small/videos.svg"),
                search: "".concat(eg, "/small/search.svg"),
                oof: "".concat(eg, "/small/oof.svg"),
                download: "".concat(eg, "/small/download.svg"),
                attributes: "".concat(eg, "/small/attributes.svg"),
                matchmakingSimulation: "".concat(eg, "/small/matchmaking_simulation.svg")
            },
            large: {
                apiKeys: "".concat(eg, "/large/api_keys.svg"),
                localization: "".concat(eg, "/large/localization.svg"),
                noPermissions: "".concat(eg, "/large/no_permissions.svg"),
                oAuthApps: "".concat(eg, "/large/oauth_apps.svg"),
                rights: "".concat(eg, "/large/rights.svg"),
                secrets: "".concat(eg, "/large/secrets.svg"),
                shareLinks: "".concat(eg, "/large/share_links.svg"),
                configurations: "".concat(eg, "/large/configurations.svg"),
                experienceConfigs: "".concat(eg, "/large/experience_configs.svg"),
                emptyExperiments: "".concat(eg, "/large/empty_experiments.svg")
            }
        };
    e.s(["f", 0, eb], 321623);
    let e_ = (0, c.f)()(() => ({
            smallContainer: {
                margin: "48px 0",
                padding: "0 24px",
                width: "100%"
            },
            largeContainer: {
                margin: "100px 0",
                width: "100%"
            },
            smallText: {
                gap: 6,
                maxWidth: 510,
                marginBottom: 16
            },
            largeText: {
                gap: 6,
                maxWidth: 480,
                marginBottom: 24
            }
        })),
        ex = e => {
            let {
                illustration: a,
                size: c = "large"
            } = e, r = a && ev[a];
            if (r) return (0, t.jsx)(s.f, {
                lightSrc: r.light,
                darkSrc: r.dark,
                alt: a
            });
            let i = a ? eb[c][a] : null;
            return i && (0, t.jsx)("img", {
                height: "large" === c ? 240 : 96,
                width: "large" === c ? 320 : 96,
                src: i,
                alt: a
            })
        },
        ey = e => {
            let {
                children: c,
                title: s,
                description: i,
                size: n = "large",
                illustration: o
            } = e, {
                classes: {
                    smallContainer: l,
                    largeContainer: d,
                    smallText: u,
                    largeText: f
                },
                cx: m
            } = e_();
            return (0, t.jsxs)(r.U, {
                classes: {
                    root: m({
                        [l]: "small" === n,
                        [d]: "large" === n
                    })
                },
                flexDirection: "column",
                alignItems: "center",
                children: [(0, t.jsx)(ex, {
                    illustration: o,
                    size: n
                }), (0, t.jsxs)(r.U, {
                    classes: {
                        root: m({
                            [u]: "small" === n,
                            [f]: "large" === n
                        })
                    },
                    flexDirection: "column",
                    alignItems: "center",
                    children: [(0, t.jsx)(a.f, {
                        textAlign: "center",
                        variant: "h4",
                        color: "primary",
                        children: s
                    }), i && (0, t.jsx)(a.f, {
                        textAlign: "center",
                        color: "secondary",
                        children: i
                    })]
                }), c]
            })
        };
    ey.displayName = "EmptyState", e.s(["C", 0, ex, "U", 0, ey], 493924)
}]);

//# debugId=bdcaf898-06ef-e9c4-0ade-82626eea6cae
//# sourceMappingURL=42qxetujhi8x9.js.map
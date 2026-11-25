;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "d39f59b2-1ee0-b92f-cdf8-58242da377b1")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 634130, e => {
    "use strict";
    var t = e.i(643766),
        a = e.i(120297),
        r = e.i(859726),
        s = e.i(950020),
        i = e.i(517952),
        n = e.i(179510),
        o = e.i(842769),
        c = e.i(989308),
        l = e.i(546633),
        d = e.i(785517),
        u = "Checkbox",
        [m, p] = (0, r.c)(u),
        [f, h] = m(u);

    function v(e) {
        let {
            __scopeCheckbox: a,
            checked: r,
            children: s,
            defaultChecked: n,
            disabled: o,
            form: c,
            name: l,
            onCheckedChange: m,
            required: p,
            value: h = "on",
            internal_do_not_use_render: v
        } = e, [g, b] = (0, i.f)({
            prop: r,
            defaultProp: null != n && n,
            onChange: m,
            caller: u
        }), [_, x] = t.useState(null), [y, k] = t.useState(null), w = t.useRef(!1), S = !_ || !!c || !!_.closest("form"), P = {
            checked: g,
            disabled: o,
            setChecked: b,
            control: _,
            setControl: x,
            name: l,
            form: c,
            value: h,
            hasConsumerStoppedPropagationRef: w,
            required: p,
            defaultChecked: !q(n) && n,
            isFormControl: S,
            bubbleInput: y,
            setBubbleInput: k
        };
        return (0, d.jsx)(f, {
            scope: a,
            ...P,
            children: "function" == typeof v ? v(P) : s
        })
    }
    var g = "CheckboxTrigger",
        b = t.forwardRef((e, r) => {
            let {
                __scopeCheckbox: i,
                onKeyDown: n,
                onClick: o,
                ...c
            } = e, {
                control: u,
                value: m,
                disabled: p,
                checked: f,
                required: v,
                setControl: b,
                setChecked: _,
                hasConsumerStoppedPropagationRef: x,
                isFormControl: y,
                bubbleInput: k
            } = h(g, i), w = (0, a.j)(r, b), P = t.useRef(f);
            return t.useEffect(() => {
                let e = null == u ? void 0 : u.form;
                if (e) {
                    let t = () => _(P.current);
                    return e.addEventListener("reset", t), () => e.removeEventListener("reset", t)
                }
            }, [u, _]), (0, d.jsx)(l.f.button, {
                type: "button",
                role: "checkbox",
                "aria-checked": q(f) ? "mixed" : f,
                "aria-required": v,
                "data-state": S(f),
                "data-disabled": p ? "" : void 0,
                disabled: p,
                value: m,
                ...c,
                ref: w,
                onKeyDown: (0, s.f)(n, e => {
                    "Enter" === e.key && e.preventDefault()
                }),
                onClick: (0, s.f)(o, e => {
                    _(e => !!q(e) || !e), k && y && (x.current = e.isPropagationStopped(), x.current || e.stopPropagation())
                })
            })
        });
    b.displayName = g;
    var _ = t.forwardRef((e, t) => {
        let {
            __scopeCheckbox: a,
            name: r,
            checked: s,
            defaultChecked: i,
            required: n,
            disabled: o,
            value: c,
            onCheckedChange: l,
            form: u,
            ...m
        } = e;
        return (0, d.jsx)(v, {
            __scopeCheckbox: a,
            checked: s,
            defaultChecked: i,
            disabled: o,
            required: n,
            onCheckedChange: l,
            name: r,
            form: u,
            value: c,
            internal_do_not_use_render: e => {
                let {
                    isFormControl: r
                } = e;
                return (0, d.jsxs)(d.Fragment, {
                    children: [(0, d.jsx)(b, {
                        ...m,
                        ref: t,
                        __scopeCheckbox: a
                    }), r && (0, d.jsx)(w, {
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
                forceMount: r,
                ...s
            } = e, i = h(x, a);
            return (0, d.jsx)(c.f, {
                present: r || q(i.checked) || !0 === i.checked,
                children: (0, d.jsx)(l.f.span, {
                    "data-state": S(i.checked),
                    "data-disabled": i.disabled ? "" : void 0,
                    ...s,
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
        w = t.forwardRef((e, r) => {
            let {
                __scopeCheckbox: s,
                ...i
            } = e, {
                control: c,
                hasConsumerStoppedPropagationRef: u,
                checked: m,
                defaultChecked: p,
                required: f,
                disabled: v,
                name: g,
                value: b,
                form: _,
                bubbleInput: x,
                setBubbleInput: y
            } = h(k, s), w = (0, a.j)(r, y), S = (0, n.f)(m), P = (0, o.f)(c);
            t.useEffect(() => {
                if (!x) return;
                let e = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set,
                    t = !u.current;
                if (S !== m && e) {
                    let a = new Event("click", {
                        bubbles: t
                    });
                    x.indeterminate = q(m), e.call(x, !q(m) && m), x.dispatchEvent(a)
                }
            }, [x, S, m, u]);
            let T = t.useRef(!q(m) && m);
            return (0, d.jsx)(l.f.input, {
                type: "checkbox",
                "aria-hidden": !0,
                defaultChecked: null != p ? p : T.current,
                required: f,
                disabled: v,
                name: g,
                value: b,
                form: _,
                ...i,
                tabIndex: -1,
                ref: w,
                style: {
                    ...i.style,
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
        r = e.i(206350),
        s = e => {
            var s, n, o;
            let c, l, {
                    present: d,
                    children: u
                } = e,
                m = function(e) {
                    var a, s;
                    let [n, o] = t.useState(), c = t.useRef(null), l = t.useRef(e), d = t.useRef("none"), [u, m] = (a = e ? "mounted" : "unmounted", s = {
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
                        let a = s[e][t];
                        return null != a ? a : e
                    }, a));
                    return t.useEffect(() => {
                        let e = i(c.current);
                        d.current = "mounted" === u ? e : "none"
                    }, [u]), (0, r.f)(() => {
                        let t = c.current,
                            a = l.current;
                        if (a !== e) {
                            let r = d.current,
                                s = i(t);
                            e ? m("MOUNT") : "none" === s || (null == t ? void 0 : t.display) === "none" ? m("UNMOUNT") : a && r !== s ? m("ANIMATION_OUT") : m("UNMOUNT"), l.current = e
                        }
                    }, [e, m]), (0, r.f)(() => {
                        if (n) {
                            var e;
                            let t, a = null != (e = n.ownerDocument.defaultView) ? e : window,
                                r = e => {
                                    let r = i(c.current).includes(CSS.escape(e.animationName));
                                    if (e.target === n && r && (m("ANIMATION_END"), !l.current)) {
                                        let e = n.style.animationFillMode;
                                        n.style.animationFillMode = "forwards", t = a.setTimeout(() => {
                                            "forwards" === n.style.animationFillMode && (n.style.animationFillMode = e)
                                        })
                                    }
                                },
                                s = e => {
                                    e.target === n && (d.current = i(c.current))
                                };
                            return n.addEventListener("animationstart", s), n.addEventListener("animationcancel", r), n.addEventListener("animationend", r), () => {
                                a.clearTimeout(t), n.removeEventListener("animationstart", s), n.removeEventListener("animationcancel", r), n.removeEventListener("animationend", r)
                            }
                        }
                        m("ANIMATION_END")
                    }, [n, m]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(u),
                        ref: t.useCallback(e => {
                            c.current = e ? getComputedStyle(e) : null, o(e)
                        }, [])
                    }
                }(d),
                p = "function" == typeof u ? u({
                    present: m.isPresent
                }) : t.Children.only(u),
                f = (0, a.j)(m.ref, (l = (c = null == (n = Object.getOwnPropertyDescriptor((s = p).props, "ref")) ? void 0 : n.get) && "isReactWarning" in c && c.isReactWarning) ? s.ref : (l = (c = null == (o = Object.getOwnPropertyDescriptor(s, "ref")) ? void 0 : o.get) && "isReactWarning" in c && c.isReactWarning) ? s.props.ref : s.props.ref || s.ref);
            return "function" == typeof u || m.isPresent ? t.cloneElement(p, {
                ref: f
            }) : null
        };

    function i(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }
    s.displayName = "Presence", e.s(["f", 0, s])
}, 687459, e => {
    "use strict";
    var t = e.i(311857);
    e.s(["f", () => t.f])
}, 695841, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/alert_dark.1spa8ixzmujxs.svg")
}, 659509, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/alert_light.3o6_fob3g_8zu.svg")
}, 124703, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/api_key_dark.1k1v6y4zm3j28.svg")
}, 932203, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/api_key_light.06t4q4202-77s.svg")
}, 759655, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/audio_dark.16razgllw2ska.svg")
}, 375920, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/audio_light.3ra073_18pbj-.svg")
}, 440714, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/avatar_setup_dark.0orjsl7i089hc.svg")
}, 174503, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/avatar_setup_light.32r86q54d7kuh.svg")
}, 968539, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/badge_dark.3m45r-3favo3f.svg")
}, 310022, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/badge_light.3fxfvj8ub7utb.svg")
}, 764454, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/bar_graph_dark.01vf9sty52re2.svg")
}, 137932, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/bar_graph_light.1iiixo_d8ur81.svg")
}, 529281, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/collaborators_dark.30gxkwssilacj.svg")
}, 483202, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/collaborators_light.3x7fovqhay1x5.svg")
}, 537904, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/decals_dark.2jpntsljojhzc.svg")
}, 247792, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/decals_light.16_gp3tnuc5p_.svg")
}, 791162, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/envelope_dark.2-ouf9shuihi4.svg")
}, 452524, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/envelope_light.1me9hqye66z7w.svg")
}, 724929, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/event_calendar_dark.3lx4_kse68by8.svg")
}, 214077, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/event_calendar_light.1pq-t84d90ty1.svg")
}, 695620, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/find_people_dark.220q6_cs04hcq.svg")
}, 89188, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/find_people_light.1gkb3pmwc8s2n.svg")
}, 56026, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/image_dark.2giew28wx4z86.svg")
}, 110349, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/image_light.0ouq8tcgpznz7.svg")
}, 521248, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/leaderboard_dark.301ypg94lbxpv.svg")
}, 617940, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/leaderboard_light.43sjz_ibwkiq_.svg")
}, 667467, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/line_chart_dark.0k7qf3mhepo6s.svg")
}, 39121, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/line_chart_light.049gcvvmai0ax.svg")
}, 72248, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/localization_dark.1ia7wat2mwyfi.svg")
}, 75514, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/localization_light.2jss_xvx2fuq0.svg")
}, 999561, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/lockSecrets_dark.0na6naigcbnkj.svg")
}, 960945, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/lockSecrets_light.0rzix2i1i13lt.svg")
}, 604913, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/makeup_look_dark.26-5-yn8598c9.svg")
}, 300847, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/makeup_look_light.0rc05t5n5al4m.svg")
}, 10871, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/managed_pricing_dark.2zdkf2-ctboa2.svg")
}, 739058, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/managed_pricing_light.0sioq_hruq1qp.svg")
}, 383875, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/meshes_dark.2tlm50ns1pq5o.svg")
}, 581511, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/meshes_light.36wh96flp2o3r.svg")
}, 340541, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/models_dark.30suu5lj5-ua5.svg")
}, 5471, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/models_light.0kiw6k3ejw-rn.svg")
}, 747665, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/models_plugins_parts_dark.3jp6jislnsqf8.svg")
}, 561654, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/models_plugins_parts_light.2nj1xhv0bfg_u.svg")
}, 87087, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/notifications_dark.2l_rf34_xo6o8.svg")
}, 250923, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/notifications_light.3p-b4rzvwwfmj.svg")
}, 887525, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/oauth_dark.42jv8--11_1i0.svg")
}, 938203, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/oauth_light.17vwiebwrn8ox.svg")
}, 619309, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/rights_manager_dark.0m7ca17sdbgim.svg")
}, 86276, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/rights_manager_light.1moaenz1cbft0.svg")
}, 245129, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/robux_dark.0adh_znay53ig.svg")
}, 852371, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/robux_light.0r27xddcy2n6m.svg")
}, 908291, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/run_dark.1sun4tvxh_arh.svg")
}, 416054, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/run_light.29f-3jyw910_v.svg")
}, 570305, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/shareLinks_dark.1l5fwuv6cgzmy.svg")
}, 147426, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/shareLinks_light.116igf-ldibmu.svg")
}, 8071, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/signin_dark.1k_gzn1-5q0ca.svg")
}, 633185, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/signin_light.1o1-jng_ct0y2.svg")
}, 45635, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/token_dark.2qy4jy9ffjhax.svg")
}, 936037, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/token_light.2xc00j5zp1q8_.svg")
}, 810710, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/trial_dark.2llr5mlhjq5fa.svg")
}, 960838, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/trial_gamepass_dark.35rtv5i112_gt.svg")
}, 963448, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/trial_gamepass_light.2wpn1oa2gkp7h.svg")
}, 46580, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/trial_light.13hip-hiizhla.svg")
}, 167478, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/video_dark.2-gdpodjtsjj3.svg")
}, 403990, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/video_game_dark.0tuxtkttj8gcu.svg")
}, 45779, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/video_game_light.3l155817mjupj.svg")
}, 795445, e => {
    e.q("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/_next/static/media/video_light.1fum3vlxctp7w.svg")
}, 128834, e => {
    "use strict";
    var t = e.i(515961),
        a = e.i(600937),
        r = e.i(511532),
        s = e.i(335020),
        i = e.i(643766),
        n = e.i(634130);
    let o = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-600"
        },
        c = {
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
        var u, m, p, f;
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
        } = e, P = (0, i.useContext)(r.i), T = null != (u = null != (m = null == P ? void 0 : P.size) ? m : _) ? u : "Medium", j = null != (p = null != (f = null == P ? void 0 : P.placement) ? f : y) ? p : "Start", E = b || (null == P ? void 0 : P.isDisabled), L = (0, a.f)(), R = w || L, A = P && h && x ? "".concat(R, "Hint") : void 0, N = h && i.default.createElement("label", {
            htmlFor: R,
            className: (0, s.U)("flex flex-col grow-1 gap-xsmall", !E && "cursor-pointer")
        }, i.default.createElement("span", {
            className: (0, s.U)(l[T], d[T], "content-emphasis")
        }, h), x && i.default.createElement("span", {
            id: A,
            className: (0, s.U)(P ? l[T] : "text-body-medium", "content-default")
        }, x));
        return i.default.createElement("div", {
            className: (0, s.U)("foundation-web-checkbox flex gap-medium", E && "opacity-[0.5]", !E && "cursor-pointer", v)
        }, "End" === j && N, i.default.createElement("div", {
            className: (0, s.U)(c[T])
        }, i.default.createElement(n.F, {
            "data-slot": "checkbox",
            className: (0, s.U)(o[T], t.Y, !E && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
            id: R,
            checked: g,
            disabled: E,
            onCheckedChange: k,
            "aria-label": h,
            "aria-describedby": [q, A].filter(Boolean).join(" ") || void 0,
            ...S
        }, i.default.createElement(t.v, null), i.default.createElement(n.S, {
            "data-slot": "checkbox-indicator",
            className: (0, s.U)(o[T], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
        }))), "Start" === j && N)
    }])
}, 798251, e => {
    "use strict";
    var t = e.i(335020),
        a = e.i(643766),
        r = e.i(637068);
    let s = new Set(["_self", "_parent", "_top"]),
        i = {
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        n = {
            Standard: "content-emphasis",
            Emphasis: "content-emphasis",
            Inverse: "content-inverse-default"
        },
        o = (0, a.forwardRef)((e, o) => {
            var c, l, d;
            let {
                children: u,
                className: m,
                size: p,
                color: f = "Emphasis",
                variant: h = "Standalone",
                underline: v = "hover",
                isExternal: g,
                asChild: b,
                ..._
            } = e, x = (l = null != (c = _.as) ? c : "a", d = "button" === _.as ? void 0 : _.target, void 0 !== g ? g : "button" !== l && void 0 !== d && !s.has(d)), y = (0, t.U)("foundation-web-link", "button" === _.as && "bg-none stroke-none padding-none appearance-none [text-align:inherit]", ("Standalone" === h || x) && "inline-flex items-center gap-xsmall", void 0 !== p && i[p], n[f], "always" === v ? "underline" : "no-underline", "hover" === v && "hover:underline", "motion-safe:transition-opacity", "hover:cursor-pointer hover:[opacity:0.8]", "radius-xsmall focus-visible:[outline-style:solid] focus-visible:[outline-width:var(--stroke-standard)] focus-visible:[outline-color:var(--color-system-emphasis)]", m), k = x ? a.default.createElement("span", {
                "aria-hidden": !0,
                "data-testid": "foundation-web-icon",
                className: (0, t.U)("grow-0 shrink-0 basis-auto icon size-[1em]", "icon-regular-arrow-up-right-from-square")
            }) : null;
            if (b) {
                let {
                    as: e,
                    ...t
                } = _, s = a.default.Children.only(u);
                return a.default.isValidElement(s) ? a.default.createElement(r.M, {
                    ref: o,
                    ...t,
                    className: y
                }, a.default.cloneElement(s, {}, a.default.createElement(a.default.Fragment, null, s.props.children, k))) : null
            }
            if ("button" === _.as) {
                let {
                    as: e,
                    type: t,
                    ...r
                } = _;
                return a.default.createElement("button", {
                    ref: o,
                    type: null != t ? t : "button",
                    ...r,
                    className: y
                }, u, k)
            }
            let {
                as: w,
                ...q
            } = _;
            return a.default.createElement("a", {
                ref: o,
                ...q,
                className: y
            }, u, k)
        });
    o.displayName = "Link", e.s(["f", 0, o])
}, 511532, e => {
    "use strict";
    var t = e.i(643766);
    let a = (0, t.createContext)(null),
        r = (0, t.createContext)(null),
        s = (0, t.createContext)(null);
    e.s(["i", 0, a, "f", 0, s, "U", 0, r])
}, 719392, e => {
    "use strict";
    var t = e.i(463146);

    function a(e, t) {
        let {
            pages: a,
            pageParams: r
        } = t, s = a.length - 1;
        return a.length > 0 ? e.getNextPageParam(a[s], a, r[s], r) : void 0
    }

    function r(e, t) {
        var a;
        let {
            pages: r,
            pageParams: s
        } = t;
        return r.length > 0 ? null == (a = e.getPreviousPageParam) ? void 0 : a.call(e, r[0], r, s[0], s) : void 0
    }
    e.s(["B", 0, function(e, t) {
        return !!t && null != a(e, t)
    }, "u", 0, function(e, t) {
        return !!t && !!e.getPreviousPageParam && null != r(e, t)
    }, "T", 0, function(e) {
        return {
            onFetch: (s, i) => {
                var n, o, c, l, d;
                let u = s.options,
                    m = null == (c = s.fetchOptions) || null == (o = c.meta) || null == (n = o.fetchMore) ? void 0 : n.direction,
                    p = (null == (l = s.state.data) ? void 0 : l.pages) || [],
                    f = (null == (d = s.state.data) ? void 0 : d.pageParams) || [],
                    h = {
                        pages: [],
                        pageParams: []
                    },
                    v = 0,
                    g = async () => {
                        let i = !1,
                            n = (0, t.W)(s.options, s.fetchOptions),
                            o = async (e, a, r) => {
                                let o;
                                if (i) return Promise.reject();
                                if (null == a && e.pages.length) return Promise.resolve(e);
                                let c = (Object.defineProperty(o = {
                                        client: s.client,
                                        queryKey: s.queryKey,
                                        pageParam: a,
                                        direction: r ? "backward" : "forward",
                                        meta: s.options.meta
                                    }, "signal", {
                                        enumerable: !0,
                                        get: () => (s.signal.aborted ? i = !0 : s.signal.addEventListener("abort", () => {
                                            i = !0
                                        }), s.signal)
                                    }), o),
                                    l = await n(c),
                                    {
                                        maxPages: d
                                    } = s.options,
                                    u = r ? t.R : t.E;
                                return {
                                    pages: u(e.pages, l, d),
                                    pageParams: u(e.pageParams, a, d)
                                }
                            };
                        if (m && p.length) {
                            let e = "backward" === m,
                                t = {
                                    pages: p,
                                    pageParams: f
                                },
                                s = (e ? r : a)(u, t);
                            h = await o(t, s, e)
                        } else {
                            let t = null != e ? e : p.length;
                            do {
                                var c;
                                let e = 0 === v ? null != (c = f[0]) ? c : u.initialPageParam : a(u, h);
                                if (v > 0 && null == e) break;
                                h = await o(h, e), v++
                            } while (v < t)
                        }
                        return h
                    };
                s.options.persister ? s.fetchFn = () => {
                    var e, t;
                    return null == (e = (t = s.options).persister) ? void 0 : e.call(t, g, {
                        client: s.client,
                        queryKey: s.queryKey,
                        meta: s.options.meta,
                        signal: s.signal
                    }, i)
                } : s.fetchFn = g
            }
        }
    }])
}, 900496, e => {
    "use strict";
    var t = e.i(230699),
        a = e.i(719392),
        r = class extends t.f {
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
                var r, s;
                let {
                    state: i
                } = e, n = super.createResult(e, t), {
                    isFetching: o,
                    isRefetching: c,
                    isError: l,
                    isRefetchError: d
                } = n, u = null == (s = i.fetchMeta) || null == (r = s.fetchMore) ? void 0 : r.direction, m = l && "forward" === u, p = o && "forward" === u, f = l && "backward" === u, h = o && "backward" === u;
                return {
                    ...n,
                    fetchNextPage: this.fetchNextPage,
                    fetchPreviousPage: this.fetchPreviousPage,
                    hasNextPage: (0, a.B)(t, i.data),
                    hasPreviousPage: (0, a.u)(t, i.data),
                    isFetchNextPageError: m,
                    isFetchingNextPage: p,
                    isFetchPreviousPageError: f,
                    isFetchingPreviousPage: h,
                    isRefetchError: d && !m && !f,
                    isRefetching: c && !p && !h
                }
            }
            constructor(e, t) {
                super(e, t)
            }
        },
        s = e.i(154152);
    e.s(["f", 0, function(e, t) {
        return (0, s.f)(e, r, t)
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
        r = function(e, t) {
            return (r = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var a in t) Object.prototype.hasOwnProperty.call(t, a) && (e[a] = t[a])
            })(e, t)
        },
        s = function() {
            return (s = Object.assign || function(e) {
                for (var t, a = 1, r = arguments.length; a < r; a++)
                    for (var s in t = arguments[a]) Object.prototype.hasOwnProperty.call(t, s) && (e[s] = t[s]);
                return e
            }).apply(this, arguments)
        };

    function i(e, t, a, r) {
        return new(a || (a = Promise))(function(s, i) {
            function n(e) {
                try {
                    c(r.next(e))
                } catch (e) {
                    i(e)
                }
            }

            function o(e) {
                try {
                    c(r.throw(e))
                } catch (e) {
                    i(e)
                }
            }

            function c(e) {
                var t;
                e.done ? s(e.value) : ((t = e.value) instanceof a ? t : new a(function(e) {
                    e(t)
                })).then(n, o)
            }
            c((r = r.apply(e, t || [])).next())
        })
    }

    function n(e, t) {
        var a, r, s, i = {
                label: 0,
                sent: function() {
                    if (1 & s[0]) throw s[1];
                    return s[1]
                },
                trys: [],
                ops: []
            },
            n = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return n.next = o(0), n.throw = o(1), n.return = o(2), "function" == typeof Symbol && (n[Symbol.iterator] = function() {
            return this
        }), n;

        function o(o) {
            return function(c) {
                var l = [o, c];
                if (a) throw TypeError("Generator is already executing.");
                for (; n && (n = 0, l[0] && (i = 0)), i;) try {
                    if (a = 1, r && (s = 2 & l[0] ? r.return : l[0] ? r.throw || ((s = r.return) && s.call(r), 0) : r.next) && !(s = s.call(r, l[1])).done) return s;
                    switch (r = 0, s && (l = [2 & l[0], s.value]), l[0]) {
                        case 0:
                        case 1:
                            s = l;
                            break;
                        case 4:
                            return i.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            i.label++, r = l[1], l = [0];
                            continue;
                        case 7:
                            l = i.ops.pop(), i.trys.pop();
                            continue;
                        default:
                            if (!(s = (s = i.trys).length > 0 && s[s.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                i = 0;
                                continue
                            }
                            if (3 === l[0] && (!s || l[1] > s[0] && l[1] < s[3])) {
                                i.label = l[1];
                                break
                            }
                            if (6 === l[0] && i.label < s[1]) {
                                i.label = s[1], s = l;
                                break
                            }
                            if (s && i.label < s[2]) {
                                i.label = s[2], i.ops.push(l);
                                break
                            }
                            s[2] && i.ops.pop(), i.trys.pop();
                            continue
                    }
                    l = t.call(e, i)
                } catch (e) {
                    l = [6, e], r = 0
                } finally {
                    a = s = 0
                }
                if (5 & l[0]) throw l[1];
                return {
                    value: l[0] ? l[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function o(e) {
        var t;
        return null == (t = e) ? t : {
            createdAt: (0, a.u)(t, "created_at") ? new Date(t.created_at) : void 0,
            expiresAt: (0, a.u)(t, "expires_at") ? new Date(t.expires_at) : void 0,
            id: (0, a.u)(t, "id") ? t.id : void 0,
            universeId: (0, a.u)(t, "universe_id") ? t.universe_id : void 0,
            values: (0, a.u)(t, "values") ? function(e) {
                if (null == e) return e;
                if ("SelectGracePeriod" === e.type) return s(s({}, null == e ? e : {
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

    function c(e, t) {
        return null == e ? e : {
            items: (0, a.u)(e, "items") ? e.items.map(o) : void 0,
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
                r(e, t), e.prototype = null === t ? Object.create(t) : (a.prototype = t.prototype, new a)
            }(t, e), t.prototype.creatorTransparencyServiceGetCreatorAcknowledgmentRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var r, s, i;
                    return n(this, function(n) {
                        switch (n.label) {
                            case 0:
                                if (null === e.id || void 0 === e.id) throw new a.w("id", "Required parameter requestParameters.id was null or undefined when calling creatorTransparencyServiceGetCreatorAcknowledgment.");
                                return r = {}, s = {}, [4, this.request({
                                    path: "/v1/creator-acknowledgments/{id}".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                    schemaPath: "/v1/creator-acknowledgments/{id}",
                                    method: "GET",
                                    headers: s,
                                    query: r
                                }, t)];
                            case 1:
                                return i = n.sent(), [2, new a.H(i, function(e) {
                                    return o(e)
                                })]
                        }
                    })
                })
            }, t.prototype.creatorTransparencyServiceGetCreatorAcknowledgment = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return n(this, function(a) {
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
                return i(this, void 0, void 0, function() {
                    var r, s, i;
                    return n(this, function(n) {
                        switch (n.label) {
                            case 0:
                                if (null === e.contentId || void 0 === e.contentId) throw new a.w("contentId", "Required parameter requestParameters.contentId was null or undefined when calling creatorTransparencyServiceGetRestriction.");
                                if (null === e.contentType || void 0 === e.contentType) throw new a.w("contentType", "Required parameter requestParameters.contentType was null or undefined when calling creatorTransparencyServiceGetRestriction.");
                                return r = {}, void 0 !== e.contentId && (r.content_id = e.contentId), void 0 !== e.contentType && (r.content_type = e.contentType), s = {}, [4, this.request({
                                    path: "/v1/restriction",
                                    schemaPath: "/v1/restriction",
                                    method: "GET",
                                    headers: s,
                                    query: r
                                }, t)];
                            case 1:
                                return i = n.sent(), [2, new a.H(i, function(e) {
                                    return null == e ? e : {
                                        isRestricted: (0, a.u)(e, "is_restricted") ? e.is_restricted : void 0,
                                        restrictionMessage: (0, a.u)(e, "restriction_message") ? e.restriction_message : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.creatorTransparencyServiceGetRestriction = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return n(this, function(a) {
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
                return i(this, void 0, void 0, function() {
                    var r, s, i;
                    return n(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return r = {}, void 0 !== e.cursor && (r.cursor = e.cursor), void 0 !== e.limit && (r.limit = e.limit), s = {}, [4, this.request({
                                    path: "/v1/creator-acknowledgments",
                                    schemaPath: "/v1/creator-acknowledgments",
                                    method: "GET",
                                    headers: s,
                                    query: r
                                }, t)];
                            case 1:
                                return i = n.sent(), [2, new a.H(i, function(e) {
                                    return c(e)
                                })]
                        }
                    })
                })
            }, t.prototype.creatorTransparencyServiceListCreatorAcknowledgments = function() {
                return i(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), n(this, function(a) {
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
                return i(this, void 0, void 0, function() {
                    var r, s, i;
                    return n(this, function(n) {
                        switch (n.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new a.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling creatorTransparencyServiceListUniverseCreatorAcknowledgments.");
                                return r = {}, void 0 !== e.cursor && (r.cursor = e.cursor), void 0 !== e.limit && (r.limit = e.limit), s = {}, [4, this.request({
                                    path: "/v1/universes/{universe_id}/creator-acknowledgments".replace("{".concat("universe_id", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universe_id}/creator-acknowledgments",
                                    method: "GET",
                                    headers: s,
                                    query: r
                                }, t)];
                            case 1:
                                return i = n.sent(), [2, new a.H(i, function(e) {
                                    return c(e)
                                })]
                        }
                    })
                })
            }, t.prototype.creatorTransparencyServiceListUniverseCreatorAcknowledgments = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return n(this, function(a) {
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
                return i(this, void 0, void 0, function() {
                    var r, s, i;
                    return n(this, function(n) {
                        switch (n.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new a.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling creatorTransparencyServiceListUniverseViolations.");
                                return r = {}, s = {}, [4, this.request({
                                    path: "/v1/universes/{universe_id}/violations".replace("{".concat("universe_id", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universe_id}/violations",
                                    method: "GET",
                                    headers: s,
                                    query: r
                                }, t)];
                            case 1:
                                return i = n.sent(), [2, new a.H(i, function(e) {
                                    return null == e ? e : {
                                        items: (0, a.u)(e, "items") ? e.items.map(l) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.creatorTransparencyServiceListUniverseViolations = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return n(this, function(a) {
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
        m = e.i(272593);
    class p extends u._ {
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
        async listUniverseCreatorAcknowledgments(e, t, a, r) {
            return this.api.creatorTransparencyServiceListUniverseCreatorAcknowledgments({
                universeId: e,
                cursor: t,
                limit: a
            }, r)
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
            let r = await this.request({
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
            return new u.H(r, e => ({
                state: e.state,
                createdAt: new Date(e.created_at),
                message: e.message
            })).value()
        }
        constructor() {
            let e = (0, m.f)("creator-transparency-service", "bedev2");
            super(e), (0, t._)(this, "api", void 0), this.api = new d(e)
        }
    }
    let f = new p;
    e.s(["f", 0, f], 28850)
}, 998683, e => {
    "use strict";
    var t = e.i(805290),
        a = e.i(658867),
        r = e.i(272593);
    let s = new class {
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
            (0, t._)(this, "localeApi", void 0), this.localeApi = new a.J((0, r.f)("locale", "bedev1"))
        }
    };
    e.s(["f", 0, s])
}, 493924, 938429, 321623, e => {
    "use strict";
    var t = e.i(785517),
        a = e.i(47277),
        r = e.i(67243),
        s = e.i(776344),
        i = e.i(462863),
        n = e.i(124703),
        o = e.i(932203),
        c = e.i(759655),
        l = e.i(375920),
        d = e.i(440714),
        u = e.i(174503),
        m = e.i(968539),
        p = e.i(310022),
        f = e.i(764454),
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
        er = e.i(147426),
        es = e.i(8071),
        ei = e.i(633185),
        en = e.i(45635),
        eo = e.i(936037),
        ec = e.i(810710),
        el = e.i(960838),
        ed = e.i(963448),
        eu = e.i(46580),
        em = e.i(167478),
        ep = e.i(403990),
        ef = e.i(45779),
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
            light: ef.default,
            dark: ep.default
        },
        shareLinks: {
            light: er.default,
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
            dark: c.default
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
            dark: em.default
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
            light: eo.default,
            dark: en.default
        },
        chart: {
            light: R.default,
            dark: L.default
        },
        badge: {
            light: p.default,
            dark: m.default
        },
        apiKeys: {
            light: o.default,
            dark: n.default
        },
        signin: {
            light: ei.default,
            dark: es.default
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
            dark: f.default
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
            dark: ec.default
        },
        trialGamepass: {
            light: ed.default,
            dark: el.default
        }
    };
    e.s(["f", 0, ev], 938429);
    let eg = "".concat("https://assets.create.roblox.com/4f839de515ce588b1721160782638bc40273d227/assets", "/spot_illustrations"),
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
    let e_ = (0, r.f)()(() => ({
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
                size: r = "large"
            } = e, s = a && ev[a];
            if (s) return (0, t.jsx)(i.f, {
                lightSrc: s.light,
                darkSrc: s.dark,
                alt: a
            });
            let n = a ? eb[r][a] : null;
            return n && (0, t.jsx)("img", {
                height: "large" === r ? 240 : 96,
                width: "large" === r ? 320 : 96,
                src: n,
                alt: a
            })
        },
        ey = e => {
            let {
                children: r,
                title: i,
                description: n,
                size: o = "large",
                illustration: c
            } = e, {
                classes: {
                    smallContainer: l,
                    largeContainer: d,
                    smallText: u,
                    largeText: m
                },
                cx: p
            } = e_();
            return (0, t.jsxs)(s.U, {
                classes: {
                    root: p({
                        [l]: "small" === o,
                        [d]: "large" === o
                    })
                },
                flexDirection: "column",
                alignItems: "center",
                children: [(0, t.jsx)(ex, {
                    illustration: c,
                    size: o
                }), (0, t.jsxs)(s.U, {
                    classes: {
                        root: p({
                            [u]: "small" === o,
                            [m]: "large" === o
                        })
                    },
                    flexDirection: "column",
                    alignItems: "center",
                    children: [(0, t.jsx)(a.f, {
                        textAlign: "center",
                        variant: "h4",
                        color: "primary",
                        children: i
                    }), n && (0, t.jsx)(a.f, {
                        textAlign: "center",
                        color: "secondary",
                        children: n
                    })]
                }), r]
            })
        };
    ey.displayName = "EmptyState", e.s(["C", 0, ex, "U", 0, ey], 493924)
}]);

//# debugId=d39f59b2-1ee0-b92f-cdf8-58242da377b1
//# sourceMappingURL=2w8lzg9clgg5h.js.map
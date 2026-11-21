;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "703654b4-2f68-3049-3595-f807df376d84")
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
        c = e.i(842769),
        o = e.i(989308),
        d = e.i(546633),
        l = e.i(785517),
        f = "Checkbox",
        [u, m] = (0, r.c)(f),
        [p, h] = u(f);

    function v(e) {
        let {
            __scopeCheckbox: a,
            checked: r,
            children: s,
            defaultChecked: n,
            disabled: c,
            form: o,
            name: d,
            onCheckedChange: u,
            required: m,
            value: h = "on",
            internal_do_not_use_render: v
        } = e, [g, b] = (0, i.f)({
            prop: r,
            defaultProp: null != n && n,
            onChange: u,
            caller: f
        }), [_, x] = t.useState(null), [y, k] = t.useState(null), w = t.useRef(!1), S = !_ || !!o || !!_.closest("form"), P = {
            checked: g,
            disabled: c,
            setChecked: b,
            control: _,
            setControl: x,
            name: d,
            form: o,
            value: h,
            hasConsumerStoppedPropagationRef: w,
            required: m,
            defaultChecked: !q(n) && n,
            isFormControl: S,
            bubbleInput: y,
            setBubbleInput: k
        };
        return (0, l.jsx)(p, {
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
                onClick: c,
                ...o
            } = e, {
                control: f,
                value: u,
                disabled: m,
                checked: p,
                required: v,
                setControl: b,
                setChecked: _,
                hasConsumerStoppedPropagationRef: x,
                isFormControl: y,
                bubbleInput: k
            } = h(g, i), w = (0, a.j)(r, b), P = t.useRef(p);
            return t.useEffect(() => {
                let e = null == f ? void 0 : f.form;
                if (e) {
                    let t = () => _(P.current);
                    return e.addEventListener("reset", t), () => e.removeEventListener("reset", t)
                }
            }, [f, _]), (0, l.jsx)(d.f.button, {
                type: "button",
                role: "checkbox",
                "aria-checked": q(p) ? "mixed" : p,
                "aria-required": v,
                "data-state": S(p),
                "data-disabled": m ? "" : void 0,
                disabled: m,
                value: u,
                ...o,
                ref: w,
                onKeyDown: (0, s.f)(n, e => {
                    "Enter" === e.key && e.preventDefault()
                }),
                onClick: (0, s.f)(c, e => {
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
            disabled: c,
            value: o,
            onCheckedChange: d,
            form: f,
            ...u
        } = e;
        return (0, l.jsx)(v, {
            __scopeCheckbox: a,
            checked: s,
            defaultChecked: i,
            disabled: c,
            required: n,
            onCheckedChange: d,
            name: r,
            form: f,
            value: o,
            internal_do_not_use_render: e => {
                let {
                    isFormControl: r
                } = e;
                return (0, l.jsxs)(l.Fragment, {
                    children: [(0, l.jsx)(b, {
                        ...u,
                        ref: t,
                        __scopeCheckbox: a
                    }), r && (0, l.jsx)(w, {
                        __scopeCheckbox: a
                    })]
                })
            }
        })
    });
    _.displayName = f;
    var x = "CheckboxIndicator",
        y = t.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                forceMount: r,
                ...s
            } = e, i = h(x, a);
            return (0, l.jsx)(o.f, {
                present: r || q(i.checked) || !0 === i.checked,
                children: (0, l.jsx)(d.f.span, {
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
                control: o,
                hasConsumerStoppedPropagationRef: f,
                checked: u,
                defaultChecked: m,
                required: p,
                disabled: v,
                name: g,
                value: b,
                form: _,
                bubbleInput: x,
                setBubbleInput: y
            } = h(k, s), w = (0, a.j)(r, y), S = (0, n.f)(u), P = (0, c.f)(o);
            t.useEffect(() => {
                if (!x) return;
                let e = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set,
                    t = !f.current;
                if (S !== u && e) {
                    let a = new Event("click", {
                        bubbles: t
                    });
                    x.indeterminate = q(u), e.call(x, !q(u) && u), x.dispatchEvent(a)
                }
            }, [x, S, u, f]);
            let T = t.useRef(!q(u) && u);
            return (0, l.jsx)(d.f.input, {
                type: "checkbox",
                "aria-hidden": !0,
                defaultChecked: null != m ? m : T.current,
                required: p,
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
            var s, n, c;
            let o, d, {
                    present: l,
                    children: f
                } = e,
                u = function(e) {
                    var a, s;
                    let [n, c] = t.useState(), o = t.useRef(null), d = t.useRef(e), l = t.useRef("none"), [f, u] = (a = e ? "mounted" : "unmounted", s = {
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
                        let e = i(o.current);
                        l.current = "mounted" === f ? e : "none"
                    }, [f]), (0, r.f)(() => {
                        let t = o.current,
                            a = d.current;
                        if (a !== e) {
                            let r = l.current,
                                s = i(t);
                            e ? u("MOUNT") : "none" === s || (null == t ? void 0 : t.display) === "none" ? u("UNMOUNT") : a && r !== s ? u("ANIMATION_OUT") : u("UNMOUNT"), d.current = e
                        }
                    }, [e, u]), (0, r.f)(() => {
                        if (n) {
                            var e;
                            let t, a = null != (e = n.ownerDocument.defaultView) ? e : window,
                                r = e => {
                                    let r = i(o.current).includes(CSS.escape(e.animationName));
                                    if (e.target === n && r && (u("ANIMATION_END"), !d.current)) {
                                        let e = n.style.animationFillMode;
                                        n.style.animationFillMode = "forwards", t = a.setTimeout(() => {
                                            "forwards" === n.style.animationFillMode && (n.style.animationFillMode = e)
                                        })
                                    }
                                },
                                s = e => {
                                    e.target === n && (l.current = i(o.current))
                                };
                            return n.addEventListener("animationstart", s), n.addEventListener("animationcancel", r), n.addEventListener("animationend", r), () => {
                                a.clearTimeout(t), n.removeEventListener("animationstart", s), n.removeEventListener("animationcancel", r), n.removeEventListener("animationend", r)
                            }
                        }
                        u("ANIMATION_END")
                    }, [n, u]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(f),
                        ref: t.useCallback(e => {
                            o.current = e ? getComputedStyle(e) : null, c(e)
                        }, [])
                    }
                }(l),
                m = "function" == typeof f ? f({
                    present: u.isPresent
                }) : t.Children.only(f),
                p = (0, a.j)(u.ref, (d = (o = null == (n = Object.getOwnPropertyDescriptor((s = m).props, "ref")) ? void 0 : n.get) && "isReactWarning" in o && o.isReactWarning) ? s.ref : (d = (o = null == (c = Object.getOwnPropertyDescriptor(s, "ref")) ? void 0 : c.get) && "isReactWarning" in o && o.isReactWarning) ? s.props.ref : s.props.ref || s.ref);
            return "function" == typeof f || u.isPresent ? t.cloneElement(m, {
                ref: p
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
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/alert_dark.1spa8ixzmujxs.svg")
}, 659509, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/alert_light.3o6_fob3g_8zu.svg")
}, 124703, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/api_key_dark.1k1v6y4zm3j28.svg")
}, 932203, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/api_key_light.06t4q4202-77s.svg")
}, 759655, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/audio_dark.16razgllw2ska.svg")
}, 375920, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/audio_light.3ra073_18pbj-.svg")
}, 440714, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/avatar_setup_dark.0orjsl7i089hc.svg")
}, 174503, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/avatar_setup_light.32r86q54d7kuh.svg")
}, 968539, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/badge_dark.3m45r-3favo3f.svg")
}, 310022, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/badge_light.3fxfvj8ub7utb.svg")
}, 764454, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/bar_graph_dark.01vf9sty52re2.svg")
}, 137932, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/bar_graph_light.1iiixo_d8ur81.svg")
}, 529281, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/collaborators_dark.30gxkwssilacj.svg")
}, 483202, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/collaborators_light.3x7fovqhay1x5.svg")
}, 537904, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/decals_dark.2jpntsljojhzc.svg")
}, 247792, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/decals_light.16_gp3tnuc5p_.svg")
}, 791162, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/envelope_dark.2-ouf9shuihi4.svg")
}, 452524, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/envelope_light.1me9hqye66z7w.svg")
}, 724929, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/event_calendar_dark.3lx4_kse68by8.svg")
}, 214077, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/event_calendar_light.1pq-t84d90ty1.svg")
}, 695620, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/find_people_dark.220q6_cs04hcq.svg")
}, 89188, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/find_people_light.1gkb3pmwc8s2n.svg")
}, 56026, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/image_dark.2giew28wx4z86.svg")
}, 110349, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/image_light.0ouq8tcgpznz7.svg")
}, 521248, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/leaderboard_dark.301ypg94lbxpv.svg")
}, 617940, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/leaderboard_light.43sjz_ibwkiq_.svg")
}, 667467, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/line_chart_dark.0k7qf3mhepo6s.svg")
}, 39121, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/line_chart_light.049gcvvmai0ax.svg")
}, 72248, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/localization_dark.1ia7wat2mwyfi.svg")
}, 75514, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/localization_light.2jss_xvx2fuq0.svg")
}, 999561, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/lockSecrets_dark.0na6naigcbnkj.svg")
}, 960945, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/lockSecrets_light.0rzix2i1i13lt.svg")
}, 604913, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/makeup_look_dark.26-5-yn8598c9.svg")
}, 300847, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/makeup_look_light.0rc05t5n5al4m.svg")
}, 10871, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/managed_pricing_dark.2zdkf2-ctboa2.svg")
}, 739058, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/managed_pricing_light.0sioq_hruq1qp.svg")
}, 383875, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/meshes_dark.2tlm50ns1pq5o.svg")
}, 581511, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/meshes_light.36wh96flp2o3r.svg")
}, 340541, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/models_dark.30suu5lj5-ua5.svg")
}, 5471, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/models_light.0kiw6k3ejw-rn.svg")
}, 747665, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/models_plugins_parts_dark.3jp6jislnsqf8.svg")
}, 561654, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/models_plugins_parts_light.2nj1xhv0bfg_u.svg")
}, 87087, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/notifications_dark.2l_rf34_xo6o8.svg")
}, 250923, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/notifications_light.3p-b4rzvwwfmj.svg")
}, 887525, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/oauth_dark.42jv8--11_1i0.svg")
}, 938203, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/oauth_light.17vwiebwrn8ox.svg")
}, 619309, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/rights_manager_dark.0m7ca17sdbgim.svg")
}, 86276, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/rights_manager_light.1moaenz1cbft0.svg")
}, 245129, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/robux_dark.0adh_znay53ig.svg")
}, 852371, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/robux_light.0r27xddcy2n6m.svg")
}, 908291, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/run_dark.1sun4tvxh_arh.svg")
}, 416054, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/run_light.29f-3jyw910_v.svg")
}, 570305, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/shareLinks_dark.1l5fwuv6cgzmy.svg")
}, 147426, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/shareLinks_light.116igf-ldibmu.svg")
}, 8071, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/signin_dark.1k_gzn1-5q0ca.svg")
}, 633185, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/signin_light.1o1-jng_ct0y2.svg")
}, 45635, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/token_dark.2qy4jy9ffjhax.svg")
}, 936037, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/token_light.2xc00j5zp1q8_.svg")
}, 810710, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/trial_dark.2llr5mlhjq5fa.svg")
}, 960838, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/trial_gamepass_dark.35rtv5i112_gt.svg")
}, 963448, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/trial_gamepass_light.2wpn1oa2gkp7h.svg")
}, 46580, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/trial_light.13hip-hiizhla.svg")
}, 167478, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/video_dark.2-gdpodjtsjj3.svg")
}, 403990, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/video_game_dark.0tuxtkttj8gcu.svg")
}, 45779, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/video_game_light.3l155817mjupj.svg")
}, 795445, e => {
    e.q("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/static/media/video_light.1fum3vlxctp7w.svg")
}, 128834, e => {
    "use strict";
    var t = e.i(515961),
        a = e.i(600937),
        r = e.i(511532),
        s = e.i(335020),
        i = e.i(643766),
        n = e.i(634130);
    let c = {
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
        l = {
            XSmall: "",
            Small: "padding-top-xxsmall",
            Medium: "padding-top-xxsmall",
            Large: "padding-top-xxsmall"
        };
    e.s(["f", 0, e => {
        var f, u, m, p;
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
        } = e, P = (0, i.useContext)(r.i), T = null != (f = null != (u = null == P ? void 0 : P.size) ? u : _) ? f : "Medium", j = null != (m = null != (p = null == P ? void 0 : P.placement) ? p : y) ? m : "Start", E = b || (null == P ? void 0 : P.isDisabled), L = (0, a.f)(), R = w || L, A = P && h && x ? "".concat(R, "Hint") : void 0, N = h && i.default.createElement("label", {
            htmlFor: R,
            className: (0, s.U)("flex flex-col grow-1 gap-xsmall", !E && "cursor-pointer")
        }, i.default.createElement("span", {
            className: (0, s.U)(d[T], l[T], "content-emphasis")
        }, h), x && i.default.createElement("span", {
            id: A,
            className: (0, s.U)(P ? d[T] : "text-body-medium", "content-default")
        }, x));
        return i.default.createElement("div", {
            className: (0, s.U)("foundation-web-checkbox flex gap-medium", E && "opacity-[0.5]", !E && "cursor-pointer", v)
        }, "End" === j && N, i.default.createElement("div", {
            className: (0, s.U)(o[T])
        }, i.default.createElement(n.F, {
            "data-slot": "checkbox",
            className: (0, s.U)(c[T], t.Y, !E && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
            id: R,
            checked: g,
            disabled: E,
            onCheckedChange: k,
            "aria-label": h,
            "aria-describedby": [q, A].filter(Boolean).join(" ") || void 0,
            ...S
        }, i.default.createElement(t.v, null), i.default.createElement(n.S, {
            "data-slot": "checkbox-indicator",
            className: (0, s.U)(c[T], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
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
        c = (0, a.forwardRef)((e, c) => {
            var o, d, l;
            let {
                children: f,
                className: u,
                size: m,
                color: p = "Emphasis",
                variant: h = "Standalone",
                underline: v = "hover",
                isExternal: g,
                asChild: b,
                ..._
            } = e, x = (d = null != (o = _.as) ? o : "a", l = "button" === _.as ? void 0 : _.target, void 0 !== g ? g : "button" !== d && void 0 !== l && !s.has(l)), y = (0, t.U)("foundation-web-link", "button" === _.as && "bg-none stroke-none padding-none appearance-none [text-align:inherit]", ("Standalone" === h || x) && "inline-flex items-center gap-xsmall", void 0 !== m && i[m], n[p], "always" === v ? "underline" : "no-underline", "hover" === v && "hover:underline", "motion-safe:transition-opacity", "hover:cursor-pointer hover:[opacity:0.8]", "radius-xsmall focus-visible:[outline-style:solid] focus-visible:[outline-width:var(--stroke-standard)] focus-visible:[outline-color:var(--color-system-emphasis)]", u), k = x ? a.default.createElement("span", {
                "aria-hidden": !0,
                "data-testid": "foundation-web-icon",
                className: (0, t.U)("grow-0 shrink-0 basis-auto icon size-[1em]", "icon-regular-arrow-up-right-from-square")
            }) : null;
            if (b) {
                let {
                    as: e,
                    ...t
                } = _, s = a.default.Children.only(f);
                return a.default.isValidElement(s) ? a.default.createElement(r.M, {
                    ref: c,
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
                    ref: c,
                    type: null != t ? t : "button",
                    ...r,
                    className: y
                }, f, k)
            }
            let {
                as: w,
                ...q
            } = _;
            return a.default.createElement("a", {
                ref: c,
                ...q,
                className: y
            }, f, k)
        });
    c.displayName = "Link", e.s(["f", 0, c])
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
                var n, c, o, d, l;
                let f = s.options,
                    u = null == (o = s.fetchOptions) || null == (c = o.meta) || null == (n = c.fetchMore) ? void 0 : n.direction,
                    m = (null == (d = s.state.data) ? void 0 : d.pages) || [],
                    p = (null == (l = s.state.data) ? void 0 : l.pageParams) || [],
                    h = {
                        pages: [],
                        pageParams: []
                    },
                    v = 0,
                    g = async () => {
                        let i = !1,
                            n = (0, t.W)(s.options, s.fetchOptions),
                            c = async (e, a, r) => {
                                let c;
                                if (i) return Promise.reject();
                                if (null == a && e.pages.length) return Promise.resolve(e);
                                let o = (Object.defineProperty(c = {
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
                                    }), c),
                                    d = await n(o),
                                    {
                                        maxPages: l
                                    } = s.options,
                                    f = r ? t.R : t.E;
                                return {
                                    pages: f(e.pages, d, l),
                                    pageParams: f(e.pageParams, a, l)
                                }
                            };
                        if (u && m.length) {
                            let e = "backward" === u,
                                t = {
                                    pages: m,
                                    pageParams: p
                                },
                                s = (e ? r : a)(f, t);
                            h = await c(t, s, e)
                        } else {
                            let t = null != e ? e : m.length;
                            do {
                                var o;
                                let e = 0 === v ? null != (o = p[0]) ? o : f.initialPageParam : a(f, h);
                                if (v > 0 && null == e) break;
                                h = await c(h, e), v++
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
                    isFetching: c,
                    isRefetching: o,
                    isError: d,
                    isRefetchError: l
                } = n, f = null == (s = i.fetchMeta) || null == (r = s.fetchMore) ? void 0 : r.direction, u = d && "forward" === f, m = c && "forward" === f, p = d && "backward" === f, h = c && "backward" === f;
                return {
                    ...n,
                    fetchNextPage: this.fetchNextPage,
                    fetchPreviousPage: this.fetchPreviousPage,
                    hasNextPage: (0, a.B)(t, i.data),
                    hasPreviousPage: (0, a.u)(t, i.data),
                    isFetchNextPageError: u,
                    isFetchingNextPage: m,
                    isFetchPreviousPageError: p,
                    isFetchingPreviousPage: h,
                    isRefetchError: l && !u && !p,
                    isRefetching: o && !m && !h
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
                    o(r.next(e))
                } catch (e) {
                    i(e)
                }
            }

            function c(e) {
                try {
                    o(r.throw(e))
                } catch (e) {
                    i(e)
                }
            }

            function o(e) {
                var t;
                e.done ? s(e.value) : ((t = e.value) instanceof a ? t : new a(function(e) {
                    e(t)
                })).then(n, c)
            }
            o((r = r.apply(e, t || [])).next())
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
        return n.next = c(0), n.throw = c(1), n.return = c(2), "function" == typeof Symbol && (n[Symbol.iterator] = function() {
            return this
        }), n;

        function c(c) {
            return function(o) {
                var d = [c, o];
                if (a) throw TypeError("Generator is already executing.");
                for (; n && (n = 0, d[0] && (i = 0)), i;) try {
                    if (a = 1, r && (s = 2 & d[0] ? r.return : d[0] ? r.throw || ((s = r.return) && s.call(r), 0) : r.next) && !(s = s.call(r, d[1])).done) return s;
                    switch (r = 0, s && (d = [2 & d[0], s.value]), d[0]) {
                        case 0:
                        case 1:
                            s = d;
                            break;
                        case 4:
                            return i.label++, {
                                value: d[1],
                                done: !1
                            };
                        case 5:
                            i.label++, r = d[1], d = [0];
                            continue;
                        case 7:
                            d = i.ops.pop(), i.trys.pop();
                            continue;
                        default:
                            if (!(s = (s = i.trys).length > 0 && s[s.length - 1]) && (6 === d[0] || 2 === d[0])) {
                                i = 0;
                                continue
                            }
                            if (3 === d[0] && (!s || d[1] > s[0] && d[1] < s[3])) {
                                i.label = d[1];
                                break
                            }
                            if (6 === d[0] && i.label < s[1]) {
                                i.label = s[1], s = d;
                                break
                            }
                            if (s && i.label < s[2]) {
                                i.label = s[2], i.ops.push(d);
                                break
                            }
                            s[2] && i.ops.pop(), i.trys.pop();
                            continue
                    }
                    d = t.call(e, i)
                } catch (e) {
                    d = [6, e], r = 0
                } finally {
                    a = s = 0
                }
                if (5 & d[0]) throw d[1];
                return {
                    value: d[0] ? d[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function c(e) {
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

    function o(e, t) {
        return null == e ? e : {
            items: (0, a.u)(e, "items") ? e.items.map(c) : void 0,
            nextCursor: (0, a.u)(e, "next_cursor") ? e.next_cursor : void 0
        }
    }

    function d(e) {
        var t;
        return null == (t = e) ? t : {
            createdAt: (0, a.u)(t, "created_at") ? new Date(t.created_at) : void 0,
            id: (0, a.u)(t, "id") ? t.id : void 0,
            policy: (0, a.u)(t, "policy") ? t.policy : void 0,
            policyLabelKey: (0, a.u)(t, "policy_label_key") ? t.policy_label_key : void 0
        }
    }
    var l = function(e) {
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
                                    return c(e)
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
                                    return o(e)
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
                                    return o(e)
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
                                        items: (0, a.u)(e, "items") ? e.items.map(d) : void 0
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
        f = a,
        u = e.i(272593);
    class m extends f._ {
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
            return new f.H(a, e => ({
                ...d(e),
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
            return new f.H(r, e => ({
                state: e.state,
                createdAt: new Date(e.created_at),
                message: e.message
            })).value()
        }
        constructor() {
            let e = (0, u.f)("creator-transparency-service", "bedev2");
            super(e), (0, t._)(this, "api", void 0), this.api = new l(e)
        }
    }
    let p = new m;
    e.s(["f", 0, p], 28850)
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
        c = e.i(932203),
        o = e.i(759655),
        d = e.i(375920),
        l = e.i(440714),
        f = e.i(174503),
        u = e.i(968539),
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
        er = e.i(147426),
        es = e.i(8071),
        ei = e.i(633185),
        en = e.i(45635),
        ec = e.i(936037),
        eo = e.i(810710),
        ed = e.i(960838),
        el = e.i(963448),
        ef = e.i(46580),
        eu = e.i(167478),
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
            light: er.default,
            dark: ea.default
        },
        eventsAndUpdates: {
            light: w.default,
            dark: k.default
        },
        avatarItem: {
            light: f.default,
            dark: l.default
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
            light: d.default,
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
            dark: eu.default
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
            light: ec.default,
            dark: en.default
        },
        chart: {
            light: R.default,
            dark: L.default
        },
        badge: {
            light: m.default,
            dark: u.default
        },
        apiKeys: {
            light: c.default,
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
            light: ef.default,
            dark: eo.default
        },
        trialGamepass: {
            light: el.default,
            dark: ed.default
        }
    };
    e.s(["f", 0, ev], 938429);
    let eg = "".concat("https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/assets", "/spot_illustrations"),
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
                size: c = "large",
                illustration: o
            } = e, {
                classes: {
                    smallContainer: d,
                    largeContainer: l,
                    smallText: f,
                    largeText: u
                },
                cx: m
            } = e_();
            return (0, t.jsxs)(s.U, {
                classes: {
                    root: m({
                        [d]: "small" === c,
                        [l]: "large" === c
                    })
                },
                flexDirection: "column",
                alignItems: "center",
                children: [(0, t.jsx)(ex, {
                    illustration: o,
                    size: c
                }), (0, t.jsxs)(s.U, {
                    classes: {
                        root: m({
                            [f]: "small" === c,
                            [u]: "large" === c
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

//# debugId=703654b4-2f68-3049-3595-f807df376d84
//# sourceMappingURL=2uupubprhkpb2.js.map
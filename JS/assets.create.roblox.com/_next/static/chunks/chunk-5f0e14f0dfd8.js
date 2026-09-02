;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "79569ffa-6af1-f827-2cdb-851441dd48c3")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 493924, 938429, 321623, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(199834),
        d = e.i(706442),
        s = e.i(776344),
        l = e.i(462863),
        i = e.i(210436),
        r = e.i(872378),
        n = e.i(909935),
        o = e.i(587608),
        c = e.i(648550),
        f = e.i(879556),
        m = e.i(156676),
        u = e.i(732097),
        g = e.i(149209),
        p = e.i(152382),
        h = e.i(323377),
        x = e.i(212940),
        v = e.i(581403),
        _ = e.i(527781),
        b = e.i(492581),
        k = e.i(572165),
        y = e.i(977079),
        S = e.i(402440),
        q = e.i(620094),
        w = e.i(721267),
        N = e.i(788618),
        j = e.i(11730),
        E = e.i(334912),
        z = e.i(315072),
        M = e.i(319700),
        C = e.i(397367),
        R = e.i(339295),
        L = e.i(26168),
        I = e.i(761562),
        T = e.i(174990),
        P = e.i(226572),
        O = e.i(41024),
        A = e.i(318682),
        U = e.i(902904),
        D = e.i(973248),
        B = e.i(699904),
        X = e.i(861406),
        F = e.i(659373),
        K = e.i(871908),
        W = e.i(712369),
        V = e.i(761170),
        H = e.i(69008),
        G = e.i(610419),
        Y = e.i(6938),
        Z = e.i(931008),
        J = e.i(132917),
        Q = e.i(999544),
        $ = e.i(370502),
        ee = e.i(779375),
        et = e.i(179677),
        ea = e.i(761534),
        ed = e.i(935295),
        es = e.i(930283),
        el = e.i(892316),
        ei = e.i(667509),
        er = e.i(285253),
        en = e.i(987596),
        eo = e.i(969915);
    let ec = {
        secrets: {
            light: T.default,
            dark: I.default
        },
        noPermissions: {
            light: T.default,
            dark: I.default
        },
        notifications: {
            light: H.default,
            dark: V.default
        },
        experiences: {
            light: en.default,
            dark: er.default
        },
        shareLinks: {
            light: et.default,
            dark: ee.default
        },
        eventsAndUpdates: {
            light: S.default,
            dark: y.default
        },
        avatarItem: {
            light: f.default,
            dark: c.default
        },
        models: {
            light: F.default,
            dark: X.default
        },
        plugins: {
            light: W.default,
            dark: K.default
        },
        audio: {
            light: o.default,
            dark: n.default
        },
        decals: {
            light: _.default,
            dark: v.default
        },
        images: {
            light: j.default,
            dark: N.default
        },
        videos: {
            light: eo.default,
            dark: ei.default
        },
        meshes: {
            light: B.default,
            dark: D.default
        },
        animations: {
            light: $.default,
            dark: Q.default
        },
        textDocuments: {
            light: k.default,
            dark: b.default
        },
        noUsers: {
            light: x.default,
            dark: h.default
        },
        localization: {
            light: L.default,
            dark: R.default
        },
        rightsManager: {
            light: J.default,
            dark: Z.default
        },
        tokens: {
            light: el.default,
            dark: es.default
        },
        chart: {
            light: C.default,
            dark: M.default
        },
        badge: {
            light: u.default,
            dark: m.default
        },
        apiKeys: {
            light: r.default,
            dark: i.default
        },
        signin: {
            light: ed.default,
            dark: ea.default
        },
        oAuthApps: {
            light: Y.default,
            dark: G.default
        },
        makeupLooks: {
            light: O.default,
            dark: P.default
        },
        barGraph: {
            light: p.default,
            dark: g.default
        },
        leaderboard: {
            light: z.default,
            dark: E.default
        },
        findPeople: {
            light: w.default,
            dark: q.default
        },
        managedPricing: {
            light: U.default,
            dark: A.default
        }
    };
    e.s(["default", 0, ec], 938429);
    let ef = "".concat("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/assets", "/spot_illustrations"),
        em = {
            small: {
                analytics: "".concat(ef, "/small/analytics.svg"),
                animations: "".concat(ef, "/small/animations.svg"),
                audio: "".concat(ef, "/small/audio.svg"),
                audioLight: "".concat(ef, "/small/audio_light.svg"),
                audioDark: "".concat(ef, "/small/audio_dark.svg"),
                avatarItem: "".concat(ef, "/small/avatar_item.svg"),
                beginSearch: "".concat(ef, "/small/beginSearch.svg"),
                creatorStore: "".concat(ef, "/small/creator_store.svg"),
                decals: "".concat(ef, "/small/decals.svg"),
                events: "".concat(ef, "/small/events.svg"),
                experiences: "".concat(ef, "/small/experiences.svg"),
                images: "".concat(ef, "/small/images.svg"),
                meshes: "".concat(ef, "/small/meshes.svg"),
                models: "".concat(ef, "/small/models.svg"),
                plugins: "".concat(ef, "/small/plugins.svg"),
                script: "".concat(ef, "/small/script.svg"),
                song: "".concat(ef, "/small/song.svg"),
                musicNote: "".concat(ef, "/small/audio_music_note.svg"),
                noUsers: "".concat(ef, "/small/no_users.svg"),
                user: "".concat(ef, "/small/user.svg"),
                users: "".concat(ef, "/small/users.svg"),
                videos: "".concat(ef, "/small/videos.svg"),
                search: "".concat(ef, "/small/search.svg"),
                oof: "".concat(ef, "/small/oof.svg"),
                download: "".concat(ef, "/small/download.svg"),
                attributes: "".concat(ef, "/small/attributes.svg"),
                matchmakingSimulation: "".concat(ef, "/small/matchmaking_simulation.svg")
            },
            large: {
                apiKeys: "".concat(ef, "/large/api_keys.svg"),
                localization: "".concat(ef, "/large/localization.svg"),
                noPermissions: "".concat(ef, "/large/no_permissions.svg"),
                oAuthApps: "".concat(ef, "/large/oauth_apps.svg"),
                rights: "".concat(ef, "/large/rights.svg"),
                secrets: "".concat(ef, "/large/secrets.svg"),
                shareLinks: "".concat(ef, "/large/share_links.svg"),
                configurations: "".concat(ef, "/large/configurations.svg"),
                experienceConfigs: "".concat(ef, "/large/experience_configs.svg"),
                emptyExperiments: "".concat(ef, "/large/empty_experiments.svg")
            }
        };
    e.s(["default", 0, em], 321623);
    let eu = (0, d.makeStyles)()(() => ({
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
        eg = e => {
            let {
                illustration: a,
                size: d = "large"
            } = e, s = a && ec[a];
            if (s) return (0, t.jsx)(l.default, {
                lightSrc: s.light,
                darkSrc: s.dark,
                alt: a
            });
            let i = a ? em[d][a] : null;
            return i && (0, t.jsx)("img", {
                height: "large" === d ? 240 : 96,
                width: "large" === d ? 320 : 96,
                src: i,
                alt: a
            })
        },
        ep = e => {
            let {
                children: d,
                title: l,
                description: i,
                size: r = "large",
                illustration: n
            } = e, {
                classes: {
                    smallContainer: o,
                    largeContainer: c,
                    smallText: f,
                    largeText: m
                },
                cx: u
            } = eu();
            return (0, t.jsxs)(s.default, {
                classes: {
                    root: u({
                        [o]: "small" === r,
                        [c]: "large" === r
                    })
                },
                flexDirection: "column",
                alignItems: "center",
                children: [(0, t.jsx)(eg, {
                    illustration: n,
                    size: r
                }), (0, t.jsxs)(s.default, {
                    classes: {
                        root: u({
                            [f]: "small" === r,
                            [m]: "large" === r
                        })
                    },
                    flexDirection: "column",
                    alignItems: "center",
                    children: [(0, t.jsx)(a.Typography, {
                        textAlign: "center",
                        variant: "h4",
                        color: "primary",
                        children: l
                    }), i && (0, t.jsx)(a.Typography, {
                        textAlign: "center",
                        color: "secondary",
                        children: i
                    })]
                }), d]
            })
        };
    ep.displayName = "EmptyState", e.s(["EmptyStateIllustration", 0, eg, "default", 0, ep], 493924)
}, 169525, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(78892),
        d = e.i(723570),
        s = e => {
            var s, i, r;
            let n, o, {
                    present: c,
                    children: f
                } = e,
                m = function(e) {
                    var a, s;
                    let [i, r] = t.useState(), n = t.useRef(null), o = t.useRef(e), c = t.useRef("none"), [f, m] = (a = e ? "mounted" : "unmounted", s = {
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
                        let e = l(n.current);
                        c.current = "mounted" === f ? e : "none"
                    }, [f]), (0, d.useLayoutEffect)(() => {
                        let t = n.current,
                            a = o.current;
                        if (a !== e) {
                            let d = c.current,
                                s = l(t);
                            e ? m("MOUNT") : "none" === s || (null == t ? void 0 : t.display) === "none" ? m("UNMOUNT") : a && d !== s ? m("ANIMATION_OUT") : m("UNMOUNT"), o.current = e
                        }
                    }, [e, m]), (0, d.useLayoutEffect)(() => {
                        if (i) {
                            var e;
                            let t, a = null != (e = i.ownerDocument.defaultView) ? e : window,
                                d = e => {
                                    let d = l(n.current).includes(CSS.escape(e.animationName));
                                    if (e.target === i && d && (m("ANIMATION_END"), !o.current)) {
                                        let e = i.style.animationFillMode;
                                        i.style.animationFillMode = "forwards", t = a.setTimeout(() => {
                                            "forwards" === i.style.animationFillMode && (i.style.animationFillMode = e)
                                        })
                                    }
                                },
                                s = e => {
                                    e.target === i && (c.current = l(n.current))
                                };
                            return i.addEventListener("animationstart", s), i.addEventListener("animationcancel", d), i.addEventListener("animationend", d), () => {
                                a.clearTimeout(t), i.removeEventListener("animationstart", s), i.removeEventListener("animationcancel", d), i.removeEventListener("animationend", d)
                            }
                        }
                        m("ANIMATION_END")
                    }, [i, m]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(f),
                        ref: t.useCallback(e => {
                            n.current = e ? getComputedStyle(e) : null, r(e)
                        }, [])
                    }
                }(c),
                u = "function" == typeof f ? f({
                    present: m.isPresent
                }) : t.Children.only(f),
                g = (0, a.useComposedRefs)(m.ref, (o = (n = null == (i = Object.getOwnPropertyDescriptor((s = u).props, "ref")) ? void 0 : i.get) && "isReactWarning" in n && n.isReactWarning) ? s.ref : (o = (n = null == (r = Object.getOwnPropertyDescriptor(s, "ref")) ? void 0 : r.get) && "isReactWarning" in n && n.isReactWarning) ? s.props.ref : s.props.ref || s.ref);
            return "function" == typeof f || m.isPresent ? t.cloneElement(u, {
                ref: g
            }) : null
        };

    function l(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }
    s.displayName = "Presence", e.s(["Presence", 0, s])
}, 666554, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/alert_dark.1spa8ixzmujxs.svg")
}, 318974, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/alert_light.3o6_fob3g_8zu.svg")
}, 210436, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/api_key_dark.1k1v6y4zm3j28.svg")
}, 872378, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/api_key_light.06t4q4202-77s.svg")
}, 909935, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/audio_dark.16razgllw2ska.svg")
}, 587608, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/audio_light.3ra073_18pbj-.svg")
}, 648550, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/avatar_setup_dark.0orjsl7i089hc.svg")
}, 879556, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/avatar_setup_light.32r86q54d7kuh.svg")
}, 156676, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/badge_dark.3m45r-3favo3f.svg")
}, 732097, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/badge_light.3fxfvj8ub7utb.svg")
}, 149209, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/bar_graph_dark.01vf9sty52re2.svg")
}, 152382, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/bar_graph_light.1iiixo_d8ur81.svg")
}, 323377, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/collaborators_dark.30gxkwssilacj.svg")
}, 212940, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/collaborators_light.3x7fovqhay1x5.svg")
}, 581403, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/decals_dark.2jpntsljojhzc.svg")
}, 527781, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/decals_light.16_gp3tnuc5p_.svg")
}, 492581, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/envelope_dark.2-ouf9shuihi4.svg")
}, 572165, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/envelope_light.1me9hqye66z7w.svg")
}, 977079, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/event_calendar_dark.3lx4_kse68by8.svg")
}, 402440, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/event_calendar_light.1pq-t84d90ty1.svg")
}, 620094, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/find_people_dark.220q6_cs04hcq.svg")
}, 721267, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/find_people_light.1gkb3pmwc8s2n.svg")
}, 788618, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/image_dark.2giew28wx4z86.svg")
}, 11730, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/image_light.0ouq8tcgpznz7.svg")
}, 334912, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/leaderboard_dark.301ypg94lbxpv.svg")
}, 315072, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/leaderboard_light.43sjz_ibwkiq_.svg")
}, 319700, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/line_chart_dark.0k7qf3mhepo6s.svg")
}, 397367, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/line_chart_light.049gcvvmai0ax.svg")
}, 339295, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/localization_dark.1ia7wat2mwyfi.svg")
}, 26168, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/localization_light.2jss_xvx2fuq0.svg")
}, 761562, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/lockSecrets_dark.0na6naigcbnkj.svg")
}, 174990, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/lockSecrets_light.0rzix2i1i13lt.svg")
}, 226572, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/makeup_look_dark.26-5-yn8598c9.svg")
}, 41024, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/makeup_look_light.0rc05t5n5al4m.svg")
}, 318682, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/managed_pricing_dark.2zdkf2-ctboa2.svg")
}, 902904, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/managed_pricing_light.0sioq_hruq1qp.svg")
}, 973248, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/meshes_dark.2tlm50ns1pq5o.svg")
}, 699904, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/meshes_light.36wh96flp2o3r.svg")
}, 861406, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/models_dark.30suu5lj5-ua5.svg")
}, 659373, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/models_light.0kiw6k3ejw-rn.svg")
}, 871908, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/models_plugins_parts_dark.3jp6jislnsqf8.svg")
}, 712369, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/models_plugins_parts_light.2nj1xhv0bfg_u.svg")
}, 761170, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/notifications_dark.2l_rf34_xo6o8.svg")
}, 69008, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/notifications_light.3p-b4rzvwwfmj.svg")
}, 610419, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/oauth_dark.42jv8--11_1i0.svg")
}, 6938, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/oauth_light.17vwiebwrn8ox.svg")
}, 931008, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/rights_manager_dark.0m7ca17sdbgim.svg")
}, 132917, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/rights_manager_light.1moaenz1cbft0.svg")
}, 999544, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/run_dark.1sun4tvxh_arh.svg")
}, 370502, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/run_light.29f-3jyw910_v.svg")
}, 779375, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/shareLinks_dark.1l5fwuv6cgzmy.svg")
}, 179677, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/shareLinks_light.116igf-ldibmu.svg")
}, 761534, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/signin_dark.1k_gzn1-5q0ca.svg")
}, 935295, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/signin_light.1o1-jng_ct0y2.svg")
}, 930283, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/token_dark.2qy4jy9ffjhax.svg")
}, 892316, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/token_light.2xc00j5zp1q8_.svg")
}, 667509, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/video_dark.2-gdpodjtsjj3.svg")
}, 285253, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/video_game_dark.0tuxtkttj8gcu.svg")
}, 987596, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/video_game_light.3l155817mjupj.svg")
}, 969915, e => {
    e.q("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/static/media/video_light.1fum3vlxctp7w.svg")
}, 919448, e => {
    "use strict";
    var t = e.i(472536),
        a = e.i(579325),
        d = e.i(197649),
        s = e.i(416340),
        l = e.i(78892),
        i = e.i(608652),
        r = e.i(174617),
        n = e.i(199786),
        o = e.i(300792),
        c = e.i(692166),
        f = e.i(169525),
        m = e.i(600317),
        u = e.i(221628),
        g = "Checkbox",
        [p, h] = (0, i.createContextScope)(g),
        [x, v] = p(g);

    function _(e) {
        let {
            __scopeCheckbox: t,
            checked: a,
            children: d,
            defaultChecked: l,
            disabled: i,
            form: r,
            name: o,
            onCheckedChange: c,
            required: f,
            value: m = "on",
            internal_do_not_use_render: p
        } = e, [h, v] = (0, n.useControllableState)({
            prop: a,
            defaultProp: null != l && l,
            onChange: c,
            caller: g
        }), [_, b] = s.useState(null), [k, y] = s.useState(null), S = s.useRef(!1), q = !_ || !!r || !!_.closest("form"), w = {
            checked: h,
            disabled: i,
            setChecked: v,
            control: _,
            setControl: b,
            name: o,
            form: r,
            value: m,
            hasConsumerStoppedPropagationRef: S,
            required: f,
            defaultChecked: !j(l) && l,
            isFormControl: q,
            bubbleInput: k,
            setBubbleInput: y
        };
        return (0, u.jsx)(x, {
            scope: t,
            ...w,
            children: "function" == typeof p ? p(w) : d
        })
    }
    var b = "CheckboxTrigger",
        k = s.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                onKeyDown: d,
                onClick: i,
                ...n
            } = e, {
                control: o,
                value: c,
                disabled: f,
                checked: g,
                required: p,
                setControl: h,
                setChecked: x,
                hasConsumerStoppedPropagationRef: _,
                isFormControl: k,
                bubbleInput: y
            } = v(b, a), S = (0, l.useComposedRefs)(t, h), q = s.useRef(g);
            return s.useEffect(() => {
                let e = null == o ? void 0 : o.form;
                if (e) {
                    let t = () => x(q.current);
                    return e.addEventListener("reset", t), () => e.removeEventListener("reset", t)
                }
            }, [o, x]), (0, u.jsx)(m.Primitive.button, {
                type: "button",
                role: "checkbox",
                "aria-checked": j(g) ? "mixed" : g,
                "aria-required": p,
                "data-state": E(g),
                "data-disabled": f ? "" : void 0,
                disabled: f,
                value: c,
                ...n,
                ref: S,
                onKeyDown: (0, r.composeEventHandlers)(d, e => {
                    "Enter" === e.key && e.preventDefault()
                }),
                onClick: (0, r.composeEventHandlers)(i, e => {
                    x(e => !!j(e) || !e), y && k && (_.current = e.isPropagationStopped(), _.current || e.stopPropagation())
                })
            })
        });
    k.displayName = b;
    var y = s.forwardRef((e, t) => {
        let {
            __scopeCheckbox: a,
            name: d,
            checked: s,
            defaultChecked: l,
            required: i,
            disabled: r,
            value: n,
            onCheckedChange: o,
            form: c,
            ...f
        } = e;
        return (0, u.jsx)(_, {
            __scopeCheckbox: a,
            checked: s,
            defaultChecked: l,
            disabled: r,
            required: i,
            onCheckedChange: o,
            name: d,
            form: c,
            value: n,
            internal_do_not_use_render: e => {
                let {
                    isFormControl: d
                } = e;
                return (0, u.jsxs)(u.Fragment, {
                    children: [(0, u.jsx)(k, {
                        ...f,
                        ref: t,
                        __scopeCheckbox: a
                    }), d && (0, u.jsx)(N, {
                        __scopeCheckbox: a
                    })]
                })
            }
        })
    });
    y.displayName = g;
    var S = "CheckboxIndicator",
        q = s.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                forceMount: d,
                ...s
            } = e, l = v(S, a);
            return (0, u.jsx)(f.Presence, {
                present: d || j(l.checked) || !0 === l.checked,
                children: (0, u.jsx)(m.Primitive.span, {
                    "data-state": E(l.checked),
                    "data-disabled": l.disabled ? "" : void 0,
                    ...s,
                    ref: t,
                    style: {
                        pointerEvents: "none",
                        ...e.style
                    }
                })
            })
        });
    q.displayName = S;
    var w = "CheckboxBubbleInput",
        N = s.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                ...d
            } = e, {
                control: i,
                hasConsumerStoppedPropagationRef: r,
                checked: n,
                defaultChecked: f,
                required: g,
                disabled: p,
                name: h,
                value: x,
                form: _,
                bubbleInput: b,
                setBubbleInput: k
            } = v(w, a), y = (0, l.useComposedRefs)(t, k), S = (0, o.usePrevious)(n), q = (0, c.useSize)(i);
            s.useEffect(() => {
                if (!b) return;
                let e = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set,
                    t = !r.current;
                if (S !== n && e) {
                    let a = new Event("click", {
                        bubbles: t
                    });
                    b.indeterminate = j(n), e.call(b, !j(n) && n), b.dispatchEvent(a)
                }
            }, [b, S, n, r]);
            let N = s.useRef(!j(n) && n);
            return (0, u.jsx)(m.Primitive.input, {
                type: "checkbox",
                "aria-hidden": !0,
                defaultChecked: null != f ? f : N.current,
                required: g,
                disabled: p,
                name: h,
                value: x,
                form: _,
                ...d,
                tabIndex: -1,
                ref: y,
                style: {
                    ...d.style,
                    ...q,
                    position: "absolute",
                    pointerEvents: "none",
                    opacity: 0,
                    margin: 0,
                    transform: "translateX(-100%)"
                }
            })
        });

    function j(e) {
        return "indeterminate" === e
    }

    function E(e) {
        return j(e) ? "indeterminate" : e ? "checked" : "unchecked"
    }
    N.displayName = w;
    let z = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-600"
        },
        M = {
            XSmall: "",
            Small: "",
            Medium: "",
            Large: "padding-y-xxsmall"
        },
        C = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        R = {
            XSmall: "",
            Small: "padding-top-xxsmall",
            Medium: "padding-top-xxsmall",
            Large: "padding-top-xxsmall"
        };
    e.s(["Checkbox", 0, e => {
        let {
            label: l,
            className: i,
            isChecked: r,
            isDisabled: n,
            size: o,
            hint: c,
            placement: f,
            onCheckedChange: m,
            id: u,
            ...g
        } = e, p = (0, a.default)(), h = u || p, x = l && s.default.createElement("label", {
            htmlFor: h,
            className: (0, d.default)("flex flex-col grow-1 gap-xsmall", !n && "cursor-pointer")
        }, s.default.createElement("span", {
            className: (0, d.default)(C[o], R[o], "content-emphasis")
        }, l), c && s.default.createElement("span", {
            className: "text-body-medium content-default"
        }, c));
        return s.default.createElement("div", {
            className: (0, d.default)("foundation-web-checkbox flex gap-medium", n && "opacity-[0.5]", !n && "cursor-pointer", i)
        }, "End" === f && x, s.default.createElement("div", {
            className: (0, d.default)(M[o])
        }, s.default.createElement(y, {
            "data-slot": "checkbox",
            className: (0, d.default)(z[o], t.interactable, !n && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
            id: h,
            checked: r,
            disabled: n,
            onCheckedChange: m,
            "aria-label": l,
            ...g
        }, s.default.createElement(t.StateLayer, null), s.default.createElement(q, {
            "data-slot": "checkbox-indicator",
            className: (0, d.default)(z[o], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
        }))), "Start" === f && x)
    }], 919448)
}, 691468, e => {
    "use strict";
    var t = e.i(472536),
        a = e.i(922834),
        d = e.i(725074),
        s = e.i(197649),
        l = e.i(416340);
    let i = {
            Small: "XSmall",
            Medium: "Small",
            Large: "Medium"
        },
        r = {
            Small: ["height-600", "text-label-small"],
            Medium: ["height-800", "text-label-medium"],
            Large: ["height-1000", "text-label-medium"]
        },
        n = {
            Small: "padding-left-small",
            Medium: "padding-left-medium",
            Large: "padding-left-large"
        },
        o = {
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
        m = {
            Small: "padding-left-xsmall",
            Medium: "padding-left-[var(--size-150)]",
            Large: "padding-left-small"
        },
        u = {
            Small: "padding-right-[var(--size-150)]",
            Medium: "padding-right-small",
            Large: "padding-right-[var(--size-250)]"
        },
        g = {
            Standard: "bg-shift-300",
            Utility: "bg-none"
        },
        p = {
            Small: "size-[var(--icon-size-xsmall)]",
            Medium: "size-[var(--icon-size-small)]",
            Large: "size-[var(--icon-size-medium)]"
        },
        h = e => {
            let {
                iconName: t,
                node: a,
                size: r
            } = e;
            return null != t ? l.default.createElement(d.Icon, {
                name: t,
                size: i[r]
            }) : null != a ? l.default.createElement("span", {
                className: (0, s.default)("inline-flex items-center justify-center shrink-0", p[r])
            }, a) : null
        },
        x = (0, l.forwardRef)((e, d) => {
            let {
                className: i,
                style: p,
                text: x,
                isDisabled: v = !1,
                size: _ = "Medium",
                variant: b = "Standard",
                leadingIconName: k,
                leadingIconNode: y,
                trailingIconName: S,
                trailingIconNode: q,
                ...w
            } = e, N = null != k || null != y, j = null != S || null != q, E = (0, s.default)(v ? a.disabledOpacity : [t.interactable, "cursor-pointer"], "relative flex justify-center items-center radius-circle stroke-none", N ? o[_] : n[_], j ? f[_] : c[_], r[_], i), z = l.default.createElement(l.default.Fragment, null, l.default.createElement(t.StateLayer, null), l.default.createElement(h, {
                iconName: k,
                node: y,
                size: _
            }), l.default.createElement("span", {
                className: (0, s.default)("padding-y-xsmall text-no-wrap text-truncate-end", N && m[_], j && u[_])
            }, x), l.default.createElement(h, {
                iconName: S,
                node: q,
                size: _
            })), M = {
                textDecoration: "none",
                ...p
            };
            if ("a" === w.as) {
                let {
                    as: e,
                    href: t,
                    ...a
                } = w;
                return l.default.createElement("a", {
                    ref: d,
                    ...a,
                    "aria-disabled": v,
                    href: v ? void 0 : t,
                    className: (0, s.default)(E, g[b], "content-action-utility"),
                    style: M
                }, z)
            }
            let {
                as: C,
                isChecked: R,
                onCheckedChange: L,
                ...I
            } = w;
            return l.default.createElement("button", {
                ref: d,
                type: "button",
                ...I,
                className: (0, s.default)(R ? "bg-inverse-surface-0" : g[b], R ? "content-inverse-emphasis" : "content-action-utility", E),
                style: M,
                "aria-pressed": R,
                disabled: v,
                onClick: null == L ? void 0 : () => L(!R)
            }, z)
        });
    e.s(["Chip", 0, x])
}, 233693, e => {
    "use strict";
    var t = e.i(922834),
        a = e.i(725074),
        d = e.i(579325),
        s = e.i(663932),
        l = e.i(618691),
        i = e.i(197649),
        r = e.i(416340);
    let n = {
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
        c = {
            XSmall: "height-600",
            Small: "height-800",
            Medium: "height-1000",
            Large: "height-1200"
        },
        f = {
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
        u = {
            XSmall: ["text-body-small", "placeholder:text-body-small"],
            Small: ["text-body-small", "placeholder:text-body-small"],
            Medium: ["text-body-medium", "placeholder:text-body-medium"],
            Large: ["text-body-large", "placeholder:text-body-large"]
        },
        g = (0, r.forwardRef)((e, g) => {
            let {
                label: p,
                labelTooltip: h,
                leadingIconName: x,
                trailingIconName: v,
                leadingIconNode: _,
                trailingIconNode: b,
                hasError: k,
                error: y,
                helperText: S,
                size: q,
                variant: w = "Standard",
                isRequired: N,
                isDisabled: j,
                className: E,
                style: z,
                inputContainerClassName: M,
                inputContainerClassStyle: C,
                id: R,
                ...L
            } = e, I = (0, d.default)(), T = R || I, P = "".concat(T, "-description"), O = null != q ? q : "Large", A = k || !!y, U = y || S, D = (0, r.useMemo)(() => x ? r.default.createElement(a.Icon, {
                name: x,
                size: O,
                className: "content-emphasis",
                "data-testid": "text-input-leading-icon"
            }) : _, [x, _, O]), B = (0, r.useMemo)(() => v ? r.default.createElement(a.Icon, {
                name: v,
                size: O,
                className: "content-emphasis",
                "data-testid": "text-input-trailing-icon"
            }) : b, [O, v, b]), X = p ? r.default.createElement("label", {
                htmlFor: T,
                className: (0, i.default)(m[O], "content-emphasis")
            }, p, N && r.default.createElement(r.default.Fragment, null, " ", r.default.createElement("span", {
                className: "content-default"
            }, "*"))) : null;
            return r.default.createElement("div", {
                "data-testid": "text-input-wrapper",
                className: (0, i.default)("flex width-full flex-col gap-small ".concat(E), {
                    [t.disabledOpacity]: j
                }),
                style: z
            }, X && (h ? r.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, X, r.default.createElement(s.LabelTooltip, h)) : X), r.default.createElement("div", {
                "data-testid": "text-input-container",
                className: (0, i.default)("foundation-web-input flex items-center width-full", l.INPUT_STROKE_BY_VARIANT[w], l.INPUT_BACKGROUND_BY_VARIANT[w], M, c[O], f[O], n[O], o[O], A ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis"),
                style: C
            }, D, r.default.createElement("input", {
                type: "text",
                id: T,
                ref: g,
                className: (0, i.default)("width-full padding-none bg-none stroke-none outline-none content-emphasis placeholder:content-muted", u[O]),
                style: {
                    appearance: "none"
                },
                "aria-invalid": A,
                "aria-describedby": U ? P : void 0,
                required: N,
                ...L,
                disabled: j
            }), B), U && r.default.createElement("span", {
                id: P,
                className: (0, i.default)("text-caption-small", {
                    "content-system-alert": A,
                    "content-default": !A
                })
            }, U))
        });
    g.displayName = "TextInput", e.s(["TextInput", 0, g])
}, 854705, e => {
    "use strict";
    var t = e.i(865800),
        a = e.i(416340),
        d = e.i(614515),
        s = e.i(993807),
        l = e.i(696180),
        i = e.i(273589),
        r = e.i(962560),
        n = e.i(42569),
        o = e.i(576881),
        c = e.i(751498),
        f = e.i(221628),
        m = e.i(219224),
        u = e.i(963320),
        g = e.i(275966);
    e.i(197094);
    var p = (0, c.c)((0, f.jsx)("path", {
            d: "M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8z"
        }), "RadioButtonUnchecked"),
        h = (0, c.c)((0, f.jsx)("path", {
            d: "M8.465 8.465C9.37 7.56 10.62 7 12 7C14.76 7 17 9.24 17 12C17 13.38 16.44 14.63 15.535 15.535C14.63 16.44 13.38 17 12 17C9.24 17 7 14.76 7 12C7 10.62 7.56 9.37 8.465 8.465Z"
        }), "RadioButtonChecked");
    let x = (0, n.s)("span", {
            name: "MuiRadioButtonIcon",
            shouldForwardProp: n.r
        })({
            position: "relative",
            display: "flex"
        }),
        v = (0, n.s)(p, {
            name: "MuiRadioButtonIcon"
        })({
            transform: "scale(1)"
        }),
        _ = (0, n.s)(h, {
            name: "MuiRadioButtonIcon"
        })(e => {
            let {
                theme: t,
                ownerState: a
            } = e;
            return (0, r._)({
                left: 0,
                position: "absolute",
                transform: "scale(0)",
                transition: t.transitions.create("transform", {
                    easing: t.transitions.easing.easeIn,
                    duration: t.transitions.duration.shortest
                })
            }, a.checked && {
                transform: "scale(1)",
                transition: t.transitions.create("transform", {
                    easing: t.transitions.easing.easeOut,
                    duration: t.transitions.duration.shortest
                })
            })
        });

    function b(e) {
        let {
            checked: t = !1,
            classes: a = {},
            fontSize: d
        } = e, s = (0, r._)({}, e, {
            checked: t
        });
        return (0, f.jsxs)(x, {
            className: a.root,
            ownerState: s,
            children: [(0, f.jsx)(v, {
                fontSize: d,
                className: a.background,
                ownerState: s
            }), (0, f.jsx)(_, {
                fontSize: d,
                className: a.dot,
                ownerState: s
            })]
        })
    }

    function k(e) {
        return (0, i.g)("MuiRadio", e)
    }
    var y = (0, l.g)("MuiRadio", ["root", "checked", "disabled", "colorPrimary", "colorSecondary", "sizeSmall"]);
    let S = ["checked", "checkedIcon", "color", "icon", "name", "onChange", "size", "className"],
        q = (0, n.s)(o.S, {
            shouldForwardProp: e => (0, n.r)(e) || "classes" === e,
            name: "MuiRadio",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: a
                } = e;
                return [t.root, "medium" !== a.size && t["size".concat((0, i.a)(a.size))], t["color".concat((0, i.a)(a.color))]]
            }
        })(e => {
            let {
                theme: t,
                ownerState: a
            } = e;
            return (0, r._)({
                color: (t.vars || t).palette.text.secondary
            }, !a.disableRipple && {
                "&:hover": {
                    backgroundColor: t.vars ? "rgba(".concat("default" === a.color ? t.vars.palette.action.activeChannel : t.vars.palette[a.color].mainChannel, " / ").concat(t.vars.palette.action.hoverOpacity, ")") : (0, i.b)("default" === a.color ? t.palette.action.active : t.palette[a.color].main, t.palette.action.hoverOpacity),
                    "@media (hover: none)": {
                        backgroundColor: "transparent"
                    }
                }
            }, "default" !== a.color && {
                ["&.".concat(y.checked)]: {
                    color: (t.vars || t).palette[a.color].main
                }
            }, {
                ["&.".concat(y.disabled)]: {
                    color: (t.vars || t).palette.action.disabled
                }
            })
        }),
        w = (0, f.jsx)(b, {
            checked: !0
        }),
        N = (0, f.jsx)(b, {}),
        j = a.forwardRef(function(e, t) {
            var d, s, l, o;
            let c = (0, u.u)({
                    props: e,
                    name: "MuiRadio"
                }),
                {
                    checked: p,
                    checkedIcon: h = w,
                    color: x = "primary",
                    icon: v = N,
                    name: _,
                    onChange: b,
                    size: y = "medium",
                    className: j
                } = c,
                E = (0, i._)(c, S),
                z = (0, r._)({}, c, {
                    color: x,
                    size: y
                }),
                M = (e => {
                    let {
                        classes: t,
                        color: a,
                        size: d
                    } = e, s = {
                        root: ["root", "color".concat((0, i.a)(a)), "medium" !== d && "size".concat((0, i.a)(d))]
                    };
                    return (0, r._)({}, t, (0, n.a)(s, k, t))
                })(z),
                C = a.useContext(m.R),
                R = p,
                L = (0, g.c)(b, C && C.onChange),
                I = _;
            return C && (void 0 === R && (l = C.value, R = "object" == typeof(o = c.value) && null !== o ? l === o : String(l) === String(o)), void 0 === I && (I = C.name)), (0, f.jsx)(q, (0, r._)({
                type: "radio",
                icon: a.cloneElement(v, {
                    fontSize: null != (d = N.props.fontSize) ? d : y
                }),
                checkedIcon: a.cloneElement(h, {
                    fontSize: null != (s = w.props.fontSize) ? s : y
                }),
                ownerState: z,
                classes: M,
                name: I,
                checked: R,
                onChange: L,
                ref: t,
                className: (0, n.c)(M.root, j)
            }, E))
        });
    var E = (0, d.default)({
            name: "Radio"
        })(function(e) {
            var t, a;
            return {
                root: {
                    color: e.palette.states.active
                },
                colorPrimary: ((t = {
                    color: e.palette.content.muted
                })["&.".concat(y.checked)] = {
                    color: e.palette.actionV2.primaryBrand.fill
                }, t),
                colorSecondary: {
                    color: e.palette.actionV2.primary.fill
                },
                disabled: ((a = {
                    color: e.palette.states.disabled
                })["&.".concat(y.colorPrimary, ".").concat(y.checked)] = {
                    color: e.palette.states.disabled
                }, a)
            }
        }),
        z = (0, a.forwardRef)(function(e, d) {
            var l = e.classes,
                i = e.color,
                r = e.inputProps,
                n = e["aria-label"],
                o = e.className,
                c = (0, t.a)(e, ["classes", "color", "inputProps", "aria-label", "className"]),
                f = E(void 0, {
                    props: {
                        classes: (0, s.default)(l, o)
                    }
                });
            return a.default.createElement(j, (0, t._)({}, c, {
                classes: f.classes,
                color: void 0 === i ? "primary" : i,
                ref: d,
                inputProps: (0, t._)({
                    "aria-label": n
                }, r)
            }))
        });
    e.s(["Radio", 0, z], 854705)
}, 219224, e => {
    "use strict";
    let t = e.i(416340).createContext(void 0);
    e.s(["R", 0, t])
}, 169923, e => {
    "use strict";
    e.s(["v", 0, {
        border: 0,
        clip: "rect(0 0 0 0)",
        height: "1px",
        margin: "-1px",
        overflow: "hidden",
        padding: 0,
        position: "absolute",
        whiteSpace: "nowrap",
        width: "1px"
    }])
}]);

//# debugId=79569ffa-6af1-f827-2cdb-851441dd48c3
//# sourceMappingURL=178cx1oizr06m.js.map
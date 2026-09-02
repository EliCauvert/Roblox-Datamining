;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "cf330a43-44c1-7ada-c26c-58eee7a6c881")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 493924, 938429, 321623, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(199834),
        s = e.i(706442),
        l = e.i(776344),
        i = e.i(462863),
        d = e.i(210436),
        r = e.i(872378),
        n = e.i(909935),
        o = e.i(587608),
        c = e.i(648550),
        m = e.i(879556),
        u = e.i(156676),
        g = e.i(732097),
        p = e.i(149209),
        h = e.i(152382),
        b = e.i(323377),
        f = e.i(212940),
        x = e.i(581403),
        v = e.i(527781),
        _ = e.i(492581),
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
        es = e.i(935295),
        el = e.i(930283),
        ei = e.i(892316),
        ed = e.i(667509),
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
            light: m.default,
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
            light: v.default,
            dark: x.default
        },
        images: {
            light: j.default,
            dark: N.default
        },
        videos: {
            light: eo.default,
            dark: ed.default
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
            dark: _.default
        },
        noUsers: {
            light: f.default,
            dark: b.default
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
            light: ei.default,
            dark: el.default
        },
        chart: {
            light: C.default,
            dark: M.default
        },
        badge: {
            light: g.default,
            dark: u.default
        },
        apiKeys: {
            light: r.default,
            dark: d.default
        },
        signin: {
            light: es.default,
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
            light: h.default,
            dark: p.default
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
    let em = "".concat("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/assets", "/spot_illustrations"),
        eu = {
            small: {
                analytics: "".concat(em, "/small/analytics.svg"),
                animations: "".concat(em, "/small/animations.svg"),
                audio: "".concat(em, "/small/audio.svg"),
                audioLight: "".concat(em, "/small/audio_light.svg"),
                audioDark: "".concat(em, "/small/audio_dark.svg"),
                avatarItem: "".concat(em, "/small/avatar_item.svg"),
                beginSearch: "".concat(em, "/small/beginSearch.svg"),
                creatorStore: "".concat(em, "/small/creator_store.svg"),
                decals: "".concat(em, "/small/decals.svg"),
                events: "".concat(em, "/small/events.svg"),
                experiences: "".concat(em, "/small/experiences.svg"),
                images: "".concat(em, "/small/images.svg"),
                meshes: "".concat(em, "/small/meshes.svg"),
                models: "".concat(em, "/small/models.svg"),
                plugins: "".concat(em, "/small/plugins.svg"),
                script: "".concat(em, "/small/script.svg"),
                song: "".concat(em, "/small/song.svg"),
                musicNote: "".concat(em, "/small/audio_music_note.svg"),
                noUsers: "".concat(em, "/small/no_users.svg"),
                user: "".concat(em, "/small/user.svg"),
                users: "".concat(em, "/small/users.svg"),
                videos: "".concat(em, "/small/videos.svg"),
                search: "".concat(em, "/small/search.svg"),
                oof: "".concat(em, "/small/oof.svg"),
                download: "".concat(em, "/small/download.svg"),
                attributes: "".concat(em, "/small/attributes.svg"),
                matchmakingSimulation: "".concat(em, "/small/matchmaking_simulation.svg")
            },
            large: {
                apiKeys: "".concat(em, "/large/api_keys.svg"),
                localization: "".concat(em, "/large/localization.svg"),
                noPermissions: "".concat(em, "/large/no_permissions.svg"),
                oAuthApps: "".concat(em, "/large/oauth_apps.svg"),
                rights: "".concat(em, "/large/rights.svg"),
                secrets: "".concat(em, "/large/secrets.svg"),
                shareLinks: "".concat(em, "/large/share_links.svg"),
                configurations: "".concat(em, "/large/configurations.svg"),
                experienceConfigs: "".concat(em, "/large/experience_configs.svg"),
                emptyExperiments: "".concat(em, "/large/empty_experiments.svg")
            }
        };
    e.s(["default", 0, eu], 321623);
    let eg = (0, s.makeStyles)()(() => ({
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
        ep = e => {
            let {
                illustration: a,
                size: s = "large"
            } = e, l = a && ec[a];
            if (l) return (0, t.jsx)(i.default, {
                lightSrc: l.light,
                darkSrc: l.dark,
                alt: a
            });
            let d = a ? eu[s][a] : null;
            return d && (0, t.jsx)("img", {
                height: "large" === s ? 240 : 96,
                width: "large" === s ? 320 : 96,
                src: d,
                alt: a
            })
        },
        eh = e => {
            let {
                children: s,
                title: i,
                description: d,
                size: r = "large",
                illustration: n
            } = e, {
                classes: {
                    smallContainer: o,
                    largeContainer: c,
                    smallText: m,
                    largeText: u
                },
                cx: g
            } = eg();
            return (0, t.jsxs)(l.default, {
                classes: {
                    root: g({
                        [o]: "small" === r,
                        [c]: "large" === r
                    })
                },
                flexDirection: "column",
                alignItems: "center",
                children: [(0, t.jsx)(ep, {
                    illustration: n,
                    size: r
                }), (0, t.jsxs)(l.default, {
                    classes: {
                        root: g({
                            [m]: "small" === r,
                            [u]: "large" === r
                        })
                    },
                    flexDirection: "column",
                    alignItems: "center",
                    children: [(0, t.jsx)(a.Typography, {
                        textAlign: "center",
                        variant: "h4",
                        color: "primary",
                        children: i
                    }), d && (0, t.jsx)(a.Typography, {
                        textAlign: "center",
                        color: "secondary",
                        children: d
                    })]
                }), s]
            })
        };
    eh.displayName = "EmptyState", e.s(["EmptyStateIllustration", 0, ep, "default", 0, eh], 493924)
}, 169525, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(78892),
        s = e.i(723570),
        l = e => {
            var l, d, r;
            let n, o, {
                    present: c,
                    children: m
                } = e,
                u = function(e) {
                    var a, l;
                    let [d, r] = t.useState(), n = t.useRef(null), o = t.useRef(e), c = t.useRef("none"), [m, u] = (a = e ? "mounted" : "unmounted", l = {
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
                        let a = l[e][t];
                        return null != a ? a : e
                    }, a));
                    return t.useEffect(() => {
                        let e = i(n.current);
                        c.current = "mounted" === m ? e : "none"
                    }, [m]), (0, s.useLayoutEffect)(() => {
                        let t = n.current,
                            a = o.current;
                        if (a !== e) {
                            let s = c.current,
                                l = i(t);
                            e ? u("MOUNT") : "none" === l || (null == t ? void 0 : t.display) === "none" ? u("UNMOUNT") : a && s !== l ? u("ANIMATION_OUT") : u("UNMOUNT"), o.current = e
                        }
                    }, [e, u]), (0, s.useLayoutEffect)(() => {
                        if (d) {
                            var e;
                            let t, a = null != (e = d.ownerDocument.defaultView) ? e : window,
                                s = e => {
                                    let s = i(n.current).includes(CSS.escape(e.animationName));
                                    if (e.target === d && s && (u("ANIMATION_END"), !o.current)) {
                                        let e = d.style.animationFillMode;
                                        d.style.animationFillMode = "forwards", t = a.setTimeout(() => {
                                            "forwards" === d.style.animationFillMode && (d.style.animationFillMode = e)
                                        })
                                    }
                                },
                                l = e => {
                                    e.target === d && (c.current = i(n.current))
                                };
                            return d.addEventListener("animationstart", l), d.addEventListener("animationcancel", s), d.addEventListener("animationend", s), () => {
                                a.clearTimeout(t), d.removeEventListener("animationstart", l), d.removeEventListener("animationcancel", s), d.removeEventListener("animationend", s)
                            }
                        }
                        u("ANIMATION_END")
                    }, [d, u]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(m),
                        ref: t.useCallback(e => {
                            n.current = e ? getComputedStyle(e) : null, r(e)
                        }, [])
                    }
                }(c),
                g = "function" == typeof m ? m({
                    present: u.isPresent
                }) : t.Children.only(m),
                p = (0, a.useComposedRefs)(u.ref, (o = (n = null == (d = Object.getOwnPropertyDescriptor((l = g).props, "ref")) ? void 0 : d.get) && "isReactWarning" in n && n.isReactWarning) ? l.ref : (o = (n = null == (r = Object.getOwnPropertyDescriptor(l, "ref")) ? void 0 : r.get) && "isReactWarning" in n && n.isReactWarning) ? l.props.ref : l.props.ref || l.ref);
            return "function" == typeof m || u.isPresent ? t.cloneElement(g, {
                ref: p
            }) : null
        };

    function i(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }
    l.displayName = "Presence", e.s(["Presence", 0, l])
}, 666554, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/alert_dark.1spa8ixzmujxs.svg")
}, 318974, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/alert_light.3o6_fob3g_8zu.svg")
}, 210436, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/api_key_dark.1k1v6y4zm3j28.svg")
}, 872378, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/api_key_light.06t4q4202-77s.svg")
}, 909935, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/audio_dark.16razgllw2ska.svg")
}, 587608, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/audio_light.3ra073_18pbj-.svg")
}, 648550, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/avatar_setup_dark.0orjsl7i089hc.svg")
}, 879556, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/avatar_setup_light.32r86q54d7kuh.svg")
}, 156676, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/badge_dark.3m45r-3favo3f.svg")
}, 732097, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/badge_light.3fxfvj8ub7utb.svg")
}, 149209, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/bar_graph_dark.01vf9sty52re2.svg")
}, 152382, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/bar_graph_light.1iiixo_d8ur81.svg")
}, 323377, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/collaborators_dark.30gxkwssilacj.svg")
}, 212940, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/collaborators_light.3x7fovqhay1x5.svg")
}, 581403, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/decals_dark.2jpntsljojhzc.svg")
}, 527781, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/decals_light.16_gp3tnuc5p_.svg")
}, 492581, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/envelope_dark.2-ouf9shuihi4.svg")
}, 572165, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/envelope_light.1me9hqye66z7w.svg")
}, 977079, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/event_calendar_dark.3lx4_kse68by8.svg")
}, 402440, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/event_calendar_light.1pq-t84d90ty1.svg")
}, 620094, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/find_people_dark.220q6_cs04hcq.svg")
}, 721267, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/find_people_light.1gkb3pmwc8s2n.svg")
}, 788618, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/image_dark.2giew28wx4z86.svg")
}, 11730, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/image_light.0ouq8tcgpznz7.svg")
}, 334912, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/leaderboard_dark.301ypg94lbxpv.svg")
}, 315072, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/leaderboard_light.43sjz_ibwkiq_.svg")
}, 319700, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/line_chart_dark.0k7qf3mhepo6s.svg")
}, 397367, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/line_chart_light.049gcvvmai0ax.svg")
}, 339295, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/localization_dark.1ia7wat2mwyfi.svg")
}, 26168, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/localization_light.2jss_xvx2fuq0.svg")
}, 761562, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/lockSecrets_dark.0na6naigcbnkj.svg")
}, 174990, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/lockSecrets_light.0rzix2i1i13lt.svg")
}, 226572, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/makeup_look_dark.26-5-yn8598c9.svg")
}, 41024, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/makeup_look_light.0rc05t5n5al4m.svg")
}, 318682, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/managed_pricing_dark.2zdkf2-ctboa2.svg")
}, 902904, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/managed_pricing_light.0sioq_hruq1qp.svg")
}, 973248, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/meshes_dark.2tlm50ns1pq5o.svg")
}, 699904, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/meshes_light.36wh96flp2o3r.svg")
}, 861406, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/models_dark.30suu5lj5-ua5.svg")
}, 659373, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/models_light.0kiw6k3ejw-rn.svg")
}, 871908, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/models_plugins_parts_dark.3jp6jislnsqf8.svg")
}, 712369, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/models_plugins_parts_light.2nj1xhv0bfg_u.svg")
}, 761170, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/notifications_dark.2l_rf34_xo6o8.svg")
}, 69008, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/notifications_light.3p-b4rzvwwfmj.svg")
}, 610419, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/oauth_dark.42jv8--11_1i0.svg")
}, 6938, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/oauth_light.17vwiebwrn8ox.svg")
}, 931008, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/rights_manager_dark.0m7ca17sdbgim.svg")
}, 132917, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/rights_manager_light.1moaenz1cbft0.svg")
}, 999544, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/run_dark.1sun4tvxh_arh.svg")
}, 370502, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/run_light.29f-3jyw910_v.svg")
}, 779375, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/shareLinks_dark.1l5fwuv6cgzmy.svg")
}, 179677, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/shareLinks_light.116igf-ldibmu.svg")
}, 761534, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/signin_dark.1k_gzn1-5q0ca.svg")
}, 935295, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/signin_light.1o1-jng_ct0y2.svg")
}, 930283, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/token_dark.2qy4jy9ffjhax.svg")
}, 892316, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/token_light.2xc00j5zp1q8_.svg")
}, 667509, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/video_dark.2-gdpodjtsjj3.svg")
}, 285253, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/video_game_dark.0tuxtkttj8gcu.svg")
}, 987596, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/video_game_light.3l155817mjupj.svg")
}, 969915, e => {
    e.q("https://assets.create.roblox.com/92ed60d6289a8d60223be2e0842b716c5398330a/_next/static/media/video_light.1fum3vlxctp7w.svg")
}, 919448, e => {
    "use strict";
    var t = e.i(472536),
        a = e.i(579325),
        s = e.i(197649),
        l = e.i(416340),
        i = e.i(78892),
        d = e.i(608652),
        r = e.i(174617),
        n = e.i(199786),
        o = e.i(300792),
        c = e.i(692166),
        m = e.i(169525),
        u = e.i(600317),
        g = e.i(221628),
        p = "Checkbox",
        [h, b] = (0, d.createContextScope)(p),
        [f, x] = h(p);

    function v(e) {
        let {
            __scopeCheckbox: t,
            checked: a,
            children: s,
            defaultChecked: i,
            disabled: d,
            form: r,
            name: o,
            onCheckedChange: c,
            required: m,
            value: u = "on",
            internal_do_not_use_render: h
        } = e, [b, x] = (0, n.useControllableState)({
            prop: a,
            defaultProp: null != i && i,
            onChange: c,
            caller: p
        }), [v, _] = l.useState(null), [k, y] = l.useState(null), S = l.useRef(!1), q = !v || !!r || !!v.closest("form"), w = {
            checked: b,
            disabled: d,
            setChecked: x,
            control: v,
            setControl: _,
            name: o,
            form: r,
            value: u,
            hasConsumerStoppedPropagationRef: S,
            required: m,
            defaultChecked: !j(i) && i,
            isFormControl: q,
            bubbleInput: k,
            setBubbleInput: y
        };
        return (0, g.jsx)(f, {
            scope: t,
            ...w,
            children: "function" == typeof h ? h(w) : s
        })
    }
    var _ = "CheckboxTrigger",
        k = l.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                onKeyDown: s,
                onClick: d,
                ...n
            } = e, {
                control: o,
                value: c,
                disabled: m,
                checked: p,
                required: h,
                setControl: b,
                setChecked: f,
                hasConsumerStoppedPropagationRef: v,
                isFormControl: k,
                bubbleInput: y
            } = x(_, a), S = (0, i.useComposedRefs)(t, b), q = l.useRef(p);
            return l.useEffect(() => {
                let e = null == o ? void 0 : o.form;
                if (e) {
                    let t = () => f(q.current);
                    return e.addEventListener("reset", t), () => e.removeEventListener("reset", t)
                }
            }, [o, f]), (0, g.jsx)(u.Primitive.button, {
                type: "button",
                role: "checkbox",
                "aria-checked": j(p) ? "mixed" : p,
                "aria-required": h,
                "data-state": E(p),
                "data-disabled": m ? "" : void 0,
                disabled: m,
                value: c,
                ...n,
                ref: S,
                onKeyDown: (0, r.composeEventHandlers)(s, e => {
                    "Enter" === e.key && e.preventDefault()
                }),
                onClick: (0, r.composeEventHandlers)(d, e => {
                    f(e => !!j(e) || !e), y && k && (v.current = e.isPropagationStopped(), v.current || e.stopPropagation())
                })
            })
        });
    k.displayName = _;
    var y = l.forwardRef((e, t) => {
        let {
            __scopeCheckbox: a,
            name: s,
            checked: l,
            defaultChecked: i,
            required: d,
            disabled: r,
            value: n,
            onCheckedChange: o,
            form: c,
            ...m
        } = e;
        return (0, g.jsx)(v, {
            __scopeCheckbox: a,
            checked: l,
            defaultChecked: i,
            disabled: r,
            required: d,
            onCheckedChange: o,
            name: s,
            form: c,
            value: n,
            internal_do_not_use_render: e => {
                let {
                    isFormControl: s
                } = e;
                return (0, g.jsxs)(g.Fragment, {
                    children: [(0, g.jsx)(k, {
                        ...m,
                        ref: t,
                        __scopeCheckbox: a
                    }), s && (0, g.jsx)(N, {
                        __scopeCheckbox: a
                    })]
                })
            }
        })
    });
    y.displayName = p;
    var S = "CheckboxIndicator",
        q = l.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                forceMount: s,
                ...l
            } = e, i = x(S, a);
            return (0, g.jsx)(m.Presence, {
                present: s || j(i.checked) || !0 === i.checked,
                children: (0, g.jsx)(u.Primitive.span, {
                    "data-state": E(i.checked),
                    "data-disabled": i.disabled ? "" : void 0,
                    ...l,
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
        N = l.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                ...s
            } = e, {
                control: d,
                hasConsumerStoppedPropagationRef: r,
                checked: n,
                defaultChecked: m,
                required: p,
                disabled: h,
                name: b,
                value: f,
                form: v,
                bubbleInput: _,
                setBubbleInput: k
            } = x(w, a), y = (0, i.useComposedRefs)(t, k), S = (0, o.usePrevious)(n), q = (0, c.useSize)(d);
            l.useEffect(() => {
                if (!_) return;
                let e = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set,
                    t = !r.current;
                if (S !== n && e) {
                    let a = new Event("click", {
                        bubbles: t
                    });
                    _.indeterminate = j(n), e.call(_, !j(n) && n), _.dispatchEvent(a)
                }
            }, [_, S, n, r]);
            let N = l.useRef(!j(n) && n);
            return (0, g.jsx)(u.Primitive.input, {
                type: "checkbox",
                "aria-hidden": !0,
                defaultChecked: null != m ? m : N.current,
                required: p,
                disabled: h,
                name: b,
                value: f,
                form: v,
                ...s,
                tabIndex: -1,
                ref: y,
                style: {
                    ...s.style,
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
            label: i,
            className: d,
            isChecked: r,
            isDisabled: n,
            size: o,
            hint: c,
            placement: m,
            onCheckedChange: u,
            id: g,
            ...p
        } = e, h = (0, a.default)(), b = g || h, f = i && l.default.createElement("label", {
            htmlFor: b,
            className: (0, s.default)("flex flex-col grow-1 gap-xsmall", !n && "cursor-pointer")
        }, l.default.createElement("span", {
            className: (0, s.default)(C[o], R[o], "content-emphasis")
        }, i), c && l.default.createElement("span", {
            className: "text-body-medium content-default"
        }, c));
        return l.default.createElement("div", {
            className: (0, s.default)("foundation-web-checkbox flex gap-medium", n && "opacity-[0.5]", !n && "cursor-pointer", d)
        }, "End" === m && f, l.default.createElement("div", {
            className: (0, s.default)(M[o])
        }, l.default.createElement(y, {
            "data-slot": "checkbox",
            className: (0, s.default)(z[o], t.interactable, !n && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
            id: b,
            checked: r,
            disabled: n,
            onCheckedChange: u,
            "aria-label": i,
            ...p
        }, l.default.createElement(t.StateLayer, null), l.default.createElement(q, {
            "data-slot": "checkbox-indicator",
            className: (0, s.default)(z[o], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
        }))), "Start" === m && f)
    }], 919448)
}, 691468, e => {
    "use strict";
    var t = e.i(472536),
        a = e.i(922834),
        s = e.i(725074),
        l = e.i(197649),
        i = e.i(416340);
    let d = {
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
        m = {
            Small: "padding-right-small",
            Medium: "padding-right-medium",
            Large: "padding-right-medium"
        },
        u = {
            Small: "padding-left-xsmall",
            Medium: "padding-left-[var(--size-150)]",
            Large: "padding-left-small"
        },
        g = {
            Small: "padding-right-[var(--size-150)]",
            Medium: "padding-right-small",
            Large: "padding-right-[var(--size-250)]"
        },
        p = {
            Standard: "bg-shift-300",
            Utility: "bg-none"
        },
        h = {
            Small: "size-[var(--icon-size-xsmall)]",
            Medium: "size-[var(--icon-size-small)]",
            Large: "size-[var(--icon-size-medium)]"
        },
        b = e => {
            let {
                iconName: t,
                node: a,
                size: r
            } = e;
            return null != t ? i.default.createElement(s.Icon, {
                name: t,
                size: d[r]
            }) : null != a ? i.default.createElement("span", {
                className: (0, l.default)("inline-flex items-center justify-center shrink-0", h[r])
            }, a) : null
        },
        f = (0, i.forwardRef)((e, s) => {
            let {
                className: d,
                style: h,
                text: f,
                isDisabled: x = !1,
                size: v = "Medium",
                variant: _ = "Standard",
                leadingIconName: k,
                leadingIconNode: y,
                trailingIconName: S,
                trailingIconNode: q,
                ...w
            } = e, N = null != k || null != y, j = null != S || null != q, E = (0, l.default)(x ? a.disabledOpacity : [t.interactable, "cursor-pointer"], "relative flex justify-center items-center radius-circle stroke-none", N ? o[v] : n[v], j ? m[v] : c[v], r[v], d), z = i.default.createElement(i.default.Fragment, null, i.default.createElement(t.StateLayer, null), i.default.createElement(b, {
                iconName: k,
                node: y,
                size: v
            }), i.default.createElement("span", {
                className: (0, l.default)("padding-y-xsmall text-no-wrap text-truncate-end", N && u[v], j && g[v])
            }, f), i.default.createElement(b, {
                iconName: S,
                node: q,
                size: v
            })), M = {
                textDecoration: "none",
                ...h
            };
            if ("a" === w.as) {
                let {
                    as: e,
                    href: t,
                    ...a
                } = w;
                return i.default.createElement("a", {
                    ref: s,
                    ...a,
                    "aria-disabled": x,
                    href: x ? void 0 : t,
                    className: (0, l.default)(E, p[_], "content-action-utility"),
                    style: M
                }, z)
            }
            let {
                as: C,
                isChecked: R,
                onCheckedChange: L,
                ...I
            } = w;
            return i.default.createElement("button", {
                ref: s,
                type: "button",
                ...I,
                className: (0, l.default)(R ? "bg-inverse-surface-0" : p[_], R ? "content-inverse-emphasis" : "content-action-utility", E),
                style: M,
                "aria-pressed": R,
                disabled: x,
                onClick: null == L ? void 0 : () => L(!R)
            }, z)
        });
    e.s(["Chip", 0, f])
}, 233693, e => {
    "use strict";
    var t = e.i(922834),
        a = e.i(725074),
        s = e.i(579325),
        l = e.i(663932),
        i = e.i(618691),
        d = e.i(197649),
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
        m = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        u = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-medium",
            Large: "text-title-large"
        },
        g = {
            XSmall: ["text-body-small", "placeholder:text-body-small"],
            Small: ["text-body-small", "placeholder:text-body-small"],
            Medium: ["text-body-medium", "placeholder:text-body-medium"],
            Large: ["text-body-large", "placeholder:text-body-large"]
        },
        p = (0, r.forwardRef)((e, p) => {
            let {
                label: h,
                labelTooltip: b,
                leadingIconName: f,
                trailingIconName: x,
                leadingIconNode: v,
                trailingIconNode: _,
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
            } = e, I = (0, s.default)(), T = R || I, P = "".concat(T, "-description"), O = null != q ? q : "Large", A = k || !!y, U = y || S, D = (0, r.useMemo)(() => f ? r.default.createElement(a.Icon, {
                name: f,
                size: O,
                className: "content-emphasis",
                "data-testid": "text-input-leading-icon"
            }) : v, [f, v, O]), B = (0, r.useMemo)(() => x ? r.default.createElement(a.Icon, {
                name: x,
                size: O,
                className: "content-emphasis",
                "data-testid": "text-input-trailing-icon"
            }) : _, [O, x, _]), X = h ? r.default.createElement("label", {
                htmlFor: T,
                className: (0, d.default)(u[O], "content-emphasis")
            }, h, N && r.default.createElement(r.default.Fragment, null, " ", r.default.createElement("span", {
                className: "content-default"
            }, "*"))) : null;
            return r.default.createElement("div", {
                "data-testid": "text-input-wrapper",
                className: (0, d.default)("flex width-full flex-col gap-small ".concat(E), {
                    [t.disabledOpacity]: j
                }),
                style: z
            }, X && (b ? r.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, X, r.default.createElement(l.LabelTooltip, b)) : X), r.default.createElement("div", {
                "data-testid": "text-input-container",
                className: (0, d.default)("foundation-web-input flex items-center width-full", i.INPUT_STROKE_BY_VARIANT[w], i.INPUT_BACKGROUND_BY_VARIANT[w], M, c[O], m[O], n[O], o[O], A ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis"),
                style: C
            }, D, r.default.createElement("input", {
                type: "text",
                id: T,
                ref: p,
                className: (0, d.default)("width-full padding-none bg-none stroke-none outline-none content-emphasis placeholder:content-muted", g[O]),
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
                className: (0, d.default)("text-caption-small", {
                    "content-system-alert": A,
                    "content-default": !A
                })
            }, U))
        });
    p.displayName = "TextInput", e.s(["TextInput", 0, p])
}, 854705, e => {
    "use strict";
    var t = e.i(865800),
        a = e.i(416340),
        s = e.i(614515),
        l = e.i(993807),
        i = e.i(696180),
        d = e.i(273589),
        r = e.i(962560),
        n = e.i(42569),
        o = e.i(576881),
        c = e.i(751498),
        m = e.i(221628),
        u = e.i(219224),
        g = e.i(963320),
        p = e.i(275966);
    e.i(197094);
    var h = (0, c.c)((0, m.jsx)("path", {
            d: "M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8z"
        }), "RadioButtonUnchecked"),
        b = (0, c.c)((0, m.jsx)("path", {
            d: "M8.465 8.465C9.37 7.56 10.62 7 12 7C14.76 7 17 9.24 17 12C17 13.38 16.44 14.63 15.535 15.535C14.63 16.44 13.38 17 12 17C9.24 17 7 14.76 7 12C7 10.62 7.56 9.37 8.465 8.465Z"
        }), "RadioButtonChecked");
    let f = (0, n.s)("span", {
            name: "MuiRadioButtonIcon",
            shouldForwardProp: n.r
        })({
            position: "relative",
            display: "flex"
        }),
        x = (0, n.s)(h, {
            name: "MuiRadioButtonIcon"
        })({
            transform: "scale(1)"
        }),
        v = (0, n.s)(b, {
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

    function _(e) {
        let {
            checked: t = !1,
            classes: a = {},
            fontSize: s
        } = e, l = (0, r._)({}, e, {
            checked: t
        });
        return (0, m.jsxs)(f, {
            className: a.root,
            ownerState: l,
            children: [(0, m.jsx)(x, {
                fontSize: s,
                className: a.background,
                ownerState: l
            }), (0, m.jsx)(v, {
                fontSize: s,
                className: a.dot,
                ownerState: l
            })]
        })
    }

    function k(e) {
        return (0, d.g)("MuiRadio", e)
    }
    var y = (0, i.g)("MuiRadio", ["root", "checked", "disabled", "colorPrimary", "colorSecondary", "sizeSmall"]);
    let S = ["checked", "checkedIcon", "color", "icon", "name", "onChange", "size", "className"],
        q = (0, n.s)(o.S, {
            shouldForwardProp: e => (0, n.r)(e) || "classes" === e,
            name: "MuiRadio",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: a
                } = e;
                return [t.root, "medium" !== a.size && t["size".concat((0, d.a)(a.size))], t["color".concat((0, d.a)(a.color))]]
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
                    backgroundColor: t.vars ? "rgba(".concat("default" === a.color ? t.vars.palette.action.activeChannel : t.vars.palette[a.color].mainChannel, " / ").concat(t.vars.palette.action.hoverOpacity, ")") : (0, d.b)("default" === a.color ? t.palette.action.active : t.palette[a.color].main, t.palette.action.hoverOpacity),
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
        w = (0, m.jsx)(_, {
            checked: !0
        }),
        N = (0, m.jsx)(_, {}),
        j = a.forwardRef(function(e, t) {
            var s, l, i, o;
            let c = (0, g.u)({
                    props: e,
                    name: "MuiRadio"
                }),
                {
                    checked: h,
                    checkedIcon: b = w,
                    color: f = "primary",
                    icon: x = N,
                    name: v,
                    onChange: _,
                    size: y = "medium",
                    className: j
                } = c,
                E = (0, d._)(c, S),
                z = (0, r._)({}, c, {
                    color: f,
                    size: y
                }),
                M = (e => {
                    let {
                        classes: t,
                        color: a,
                        size: s
                    } = e, l = {
                        root: ["root", "color".concat((0, d.a)(a)), "medium" !== s && "size".concat((0, d.a)(s))]
                    };
                    return (0, r._)({}, t, (0, n.a)(l, k, t))
                })(z),
                C = a.useContext(u.R),
                R = h,
                L = (0, p.c)(_, C && C.onChange),
                I = v;
            return C && (void 0 === R && (i = C.value, R = "object" == typeof(o = c.value) && null !== o ? i === o : String(i) === String(o)), void 0 === I && (I = C.name)), (0, m.jsx)(q, (0, r._)({
                type: "radio",
                icon: a.cloneElement(x, {
                    fontSize: null != (s = N.props.fontSize) ? s : y
                }),
                checkedIcon: a.cloneElement(b, {
                    fontSize: null != (l = w.props.fontSize) ? l : y
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
    var E = (0, s.default)({
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
        z = (0, a.forwardRef)(function(e, s) {
            var i = e.classes,
                d = e.color,
                r = e.inputProps,
                n = e["aria-label"],
                o = e.className,
                c = (0, t.a)(e, ["classes", "color", "inputProps", "aria-label", "className"]),
                m = E(void 0, {
                    props: {
                        classes: (0, l.default)(i, o)
                    }
                });
            return a.default.createElement(j, (0, t._)({}, c, {
                classes: m.classes,
                color: void 0 === d ? "primary" : d,
                ref: s,
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

//# debugId=cf330a43-44c1-7ada-c26c-58eee7a6c881
//# sourceMappingURL=3e4lx_g9c0ye_.js.map
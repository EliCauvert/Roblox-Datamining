;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "3ef9f4d0-d331-8cae-9038-43f3ae1f4b41")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 493924, 938429, 321623, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(199834),
        s = e.i(706442),
        i = e.i(776344),
        c = e.i(462863),
        r = e.i(210436),
        l = e.i(872378),
        o = e.i(909935),
        d = e.i(587608),
        n = e.i(648550),
        m = e.i(879556),
        f = e.i(156676),
        u = e.i(732097),
        g = e.i(149209),
        h = e.i(152382),
        b = e.i(323377),
        p = e.i(212940),
        v = e.i(581403),
        x = e.i(527781),
        _ = e.i(492581),
        k = e.i(572165),
        y = e.i(977079),
        q = e.i(402440),
        S = e.i(620094),
        z = e.i(721267),
        j = e.i(788618),
        w = e.i(11730),
        E = e.i(334912),
        C = e.i(315072),
        M = e.i(319700),
        R = e.i(397367),
        L = e.i(339295),
        N = e.i(26168),
        I = e.i(761562),
        P = e.i(174990),
        A = e.i(226572),
        O = e.i(41024),
        T = e.i(318682),
        U = e.i(902904),
        B = e.i(973248),
        D = e.i(699904),
        W = e.i(861406),
        X = e.i(659373),
        F = e.i(871908),
        K = e.i(712369),
        H = e.i(761170),
        V = e.i(69008),
        G = e.i(610419),
        Z = e.i(6938),
        J = e.i(931008),
        Q = e.i(132917),
        Y = e.i(999544),
        $ = e.i(370502),
        ee = e.i(779375),
        et = e.i(179677),
        ea = e.i(761534),
        es = e.i(935295),
        ei = e.i(930283),
        ec = e.i(892316),
        er = e.i(667509),
        el = e.i(285253),
        eo = e.i(987596),
        ed = e.i(969915);
    let en = {
        secrets: {
            light: P.default,
            dark: I.default
        },
        noPermissions: {
            light: P.default,
            dark: I.default
        },
        notifications: {
            light: V.default,
            dark: H.default
        },
        experiences: {
            light: eo.default,
            dark: el.default
        },
        shareLinks: {
            light: et.default,
            dark: ee.default
        },
        eventsAndUpdates: {
            light: q.default,
            dark: y.default
        },
        avatarItem: {
            light: m.default,
            dark: n.default
        },
        models: {
            light: X.default,
            dark: W.default
        },
        plugins: {
            light: K.default,
            dark: F.default
        },
        audio: {
            light: d.default,
            dark: o.default
        },
        decals: {
            light: x.default,
            dark: v.default
        },
        images: {
            light: w.default,
            dark: j.default
        },
        videos: {
            light: ed.default,
            dark: er.default
        },
        meshes: {
            light: D.default,
            dark: B.default
        },
        animations: {
            light: $.default,
            dark: Y.default
        },
        textDocuments: {
            light: k.default,
            dark: _.default
        },
        noUsers: {
            light: p.default,
            dark: b.default
        },
        localization: {
            light: N.default,
            dark: L.default
        },
        rightsManager: {
            light: Q.default,
            dark: J.default
        },
        tokens: {
            light: ec.default,
            dark: ei.default
        },
        chart: {
            light: R.default,
            dark: M.default
        },
        badge: {
            light: u.default,
            dark: f.default
        },
        apiKeys: {
            light: l.default,
            dark: r.default
        },
        signin: {
            light: es.default,
            dark: ea.default
        },
        oAuthApps: {
            light: Z.default,
            dark: G.default
        },
        makeupLooks: {
            light: O.default,
            dark: A.default
        },
        barGraph: {
            light: h.default,
            dark: g.default
        },
        leaderboard: {
            light: C.default,
            dark: E.default
        },
        findPeople: {
            light: z.default,
            dark: S.default
        },
        managedPricing: {
            light: U.default,
            dark: T.default
        }
    };
    e.s(["default", 0, en], 938429);
    let em = "".concat("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/assets", "/spot_illustrations"),
        ef = {
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
    e.s(["default", 0, ef], 321623);
    let eu = (0, s.makeStyles)()(() => ({
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
                size: s = "large"
            } = e, i = a && en[a];
            if (i) return (0, t.jsx)(c.default, {
                lightSrc: i.light,
                darkSrc: i.dark,
                alt: a
            });
            let r = a ? ef[s][a] : null;
            return r && (0, t.jsx)("img", {
                height: "large" === s ? 240 : 96,
                width: "large" === s ? 320 : 96,
                src: r,
                alt: a
            })
        },
        eh = e => {
            let {
                children: s,
                title: c,
                description: r,
                size: l = "large",
                illustration: o
            } = e, {
                classes: {
                    smallContainer: d,
                    largeContainer: n,
                    smallText: m,
                    largeText: f
                },
                cx: u
            } = eu();
            return (0, t.jsxs)(i.default, {
                classes: {
                    root: u({
                        [d]: "small" === l,
                        [n]: "large" === l
                    })
                },
                flexDirection: "column",
                alignItems: "center",
                children: [(0, t.jsx)(eg, {
                    illustration: o,
                    size: l
                }), (0, t.jsxs)(i.default, {
                    classes: {
                        root: u({
                            [m]: "small" === l,
                            [f]: "large" === l
                        })
                    },
                    flexDirection: "column",
                    alignItems: "center",
                    children: [(0, t.jsx)(a.Typography, {
                        textAlign: "center",
                        variant: "h4",
                        color: "primary",
                        children: c
                    }), r && (0, t.jsx)(a.Typography, {
                        textAlign: "center",
                        color: "secondary",
                        children: r
                    })]
                }), s]
            })
        };
    eh.displayName = "EmptyState", e.s(["EmptyStateIllustration", 0, eg, "default", 0, eh], 493924)
}, 666554, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/alert_dark.1spa8ixzmujxs.svg")
}, 318974, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/alert_light.3o6_fob3g_8zu.svg")
}, 210436, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/api_key_dark.1k1v6y4zm3j28.svg")
}, 872378, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/api_key_light.06t4q4202-77s.svg")
}, 909935, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/audio_dark.16razgllw2ska.svg")
}, 587608, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/audio_light.3ra073_18pbj-.svg")
}, 648550, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/avatar_setup_dark.0orjsl7i089hc.svg")
}, 879556, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/avatar_setup_light.32r86q54d7kuh.svg")
}, 156676, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/badge_dark.3m45r-3favo3f.svg")
}, 732097, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/badge_light.3fxfvj8ub7utb.svg")
}, 149209, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/bar_graph_dark.01vf9sty52re2.svg")
}, 152382, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/bar_graph_light.1iiixo_d8ur81.svg")
}, 323377, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/collaborators_dark.30gxkwssilacj.svg")
}, 212940, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/collaborators_light.3x7fovqhay1x5.svg")
}, 581403, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/decals_dark.2jpntsljojhzc.svg")
}, 527781, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/decals_light.16_gp3tnuc5p_.svg")
}, 492581, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/envelope_dark.2-ouf9shuihi4.svg")
}, 572165, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/envelope_light.1me9hqye66z7w.svg")
}, 977079, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/event_calendar_dark.3lx4_kse68by8.svg")
}, 402440, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/event_calendar_light.1pq-t84d90ty1.svg")
}, 620094, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/find_people_dark.220q6_cs04hcq.svg")
}, 721267, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/find_people_light.1gkb3pmwc8s2n.svg")
}, 788618, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/image_dark.2giew28wx4z86.svg")
}, 11730, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/image_light.0ouq8tcgpznz7.svg")
}, 334912, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/leaderboard_dark.301ypg94lbxpv.svg")
}, 315072, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/leaderboard_light.43sjz_ibwkiq_.svg")
}, 319700, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/line_chart_dark.0k7qf3mhepo6s.svg")
}, 397367, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/line_chart_light.049gcvvmai0ax.svg")
}, 339295, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/localization_dark.1ia7wat2mwyfi.svg")
}, 26168, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/localization_light.2jss_xvx2fuq0.svg")
}, 761562, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/lockSecrets_dark.0na6naigcbnkj.svg")
}, 174990, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/lockSecrets_light.0rzix2i1i13lt.svg")
}, 226572, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/makeup_look_dark.26-5-yn8598c9.svg")
}, 41024, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/makeup_look_light.0rc05t5n5al4m.svg")
}, 318682, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/managed_pricing_dark.2zdkf2-ctboa2.svg")
}, 902904, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/managed_pricing_light.0sioq_hruq1qp.svg")
}, 973248, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/meshes_dark.2tlm50ns1pq5o.svg")
}, 699904, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/meshes_light.36wh96flp2o3r.svg")
}, 861406, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/models_dark.30suu5lj5-ua5.svg")
}, 659373, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/models_light.0kiw6k3ejw-rn.svg")
}, 871908, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/models_plugins_parts_dark.3jp6jislnsqf8.svg")
}, 712369, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/models_plugins_parts_light.2nj1xhv0bfg_u.svg")
}, 761170, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/notifications_dark.2l_rf34_xo6o8.svg")
}, 69008, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/notifications_light.3p-b4rzvwwfmj.svg")
}, 610419, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/oauth_dark.42jv8--11_1i0.svg")
}, 6938, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/oauth_light.17vwiebwrn8ox.svg")
}, 931008, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/rights_manager_dark.0m7ca17sdbgim.svg")
}, 132917, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/rights_manager_light.1moaenz1cbft0.svg")
}, 999544, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/run_dark.1sun4tvxh_arh.svg")
}, 370502, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/run_light.29f-3jyw910_v.svg")
}, 779375, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/shareLinks_dark.1l5fwuv6cgzmy.svg")
}, 179677, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/shareLinks_light.116igf-ldibmu.svg")
}, 761534, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/signin_dark.1k_gzn1-5q0ca.svg")
}, 935295, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/signin_light.1o1-jng_ct0y2.svg")
}, 930283, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/token_dark.2qy4jy9ffjhax.svg")
}, 892316, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/token_light.2xc00j5zp1q8_.svg")
}, 667509, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/video_dark.2-gdpodjtsjj3.svg")
}, 285253, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/video_game_dark.0tuxtkttj8gcu.svg")
}, 987596, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/video_game_light.3l155817mjupj.svg")
}, 969915, e => {
    e.q("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/_next/static/media/video_light.1fum3vlxctp7w.svg")
}, 685245, e => {
    "use strict";
    var t = e.i(253923),
        a = e.i(454778),
        s = e.i(197649),
        i = e.i(416340),
        c = e.i(78892),
        r = e.i(608652),
        l = e.i(174617),
        o = e.i(199786),
        d = e.i(300792),
        n = e.i(692166),
        m = e.i(169525),
        f = e.i(600317),
        u = e.i(221628),
        g = "Checkbox",
        [h, b] = (0, r.createContextScope)(g),
        [p, v] = h(g);

    function x(e) {
        let {
            __scopeCheckbox: t,
            checked: a,
            children: s,
            defaultChecked: c,
            disabled: r,
            form: l,
            name: d,
            onCheckedChange: n,
            required: m,
            value: f = "on",
            internal_do_not_use_render: h
        } = e, [b, v] = (0, o.useControllableState)({
            prop: a,
            defaultProp: null != c && c,
            onChange: n,
            caller: g
        }), [x, _] = i.useState(null), [k, y] = i.useState(null), q = i.useRef(!1), S = !x || !!l || !!x.closest("form"), z = {
            checked: b,
            disabled: r,
            setChecked: v,
            control: x,
            setControl: _,
            name: d,
            form: l,
            value: f,
            hasConsumerStoppedPropagationRef: q,
            required: m,
            defaultChecked: !w(c) && c,
            isFormControl: S,
            bubbleInput: k,
            setBubbleInput: y
        };
        return (0, u.jsx)(p, {
            scope: t,
            ...z,
            children: "function" == typeof h ? h(z) : s
        })
    }
    var _ = "CheckboxTrigger",
        k = i.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                onKeyDown: s,
                onClick: r,
                ...o
            } = e, {
                control: d,
                value: n,
                disabled: m,
                checked: g,
                required: h,
                setControl: b,
                setChecked: p,
                hasConsumerStoppedPropagationRef: x,
                isFormControl: k,
                bubbleInput: y
            } = v(_, a), q = (0, c.useComposedRefs)(t, b), S = i.useRef(g);
            return i.useEffect(() => {
                let e = null == d ? void 0 : d.form;
                if (e) {
                    let t = () => p(S.current);
                    return e.addEventListener("reset", t), () => e.removeEventListener("reset", t)
                }
            }, [d, p]), (0, u.jsx)(f.Primitive.button, {
                type: "button",
                role: "checkbox",
                "aria-checked": w(g) ? "mixed" : g,
                "aria-required": h,
                "data-state": E(g),
                "data-disabled": m ? "" : void 0,
                disabled: m,
                value: n,
                ...o,
                ref: q,
                onKeyDown: (0, l.composeEventHandlers)(s, e => {
                    "Enter" === e.key && e.preventDefault()
                }),
                onClick: (0, l.composeEventHandlers)(r, e => {
                    p(e => !!w(e) || !e), y && k && (x.current = e.isPropagationStopped(), x.current || e.stopPropagation())
                })
            })
        });
    k.displayName = _;
    var y = i.forwardRef((e, t) => {
        let {
            __scopeCheckbox: a,
            name: s,
            checked: i,
            defaultChecked: c,
            required: r,
            disabled: l,
            value: o,
            onCheckedChange: d,
            form: n,
            ...m
        } = e;
        return (0, u.jsx)(x, {
            __scopeCheckbox: a,
            checked: i,
            defaultChecked: c,
            disabled: l,
            required: r,
            onCheckedChange: d,
            name: s,
            form: n,
            value: o,
            internal_do_not_use_render: e => {
                let {
                    isFormControl: s
                } = e;
                return (0, u.jsxs)(u.Fragment, {
                    children: [(0, u.jsx)(k, {
                        ...m,
                        ref: t,
                        __scopeCheckbox: a
                    }), s && (0, u.jsx)(j, {
                        __scopeCheckbox: a
                    })]
                })
            }
        })
    });
    y.displayName = g;
    var q = "CheckboxIndicator",
        S = i.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                forceMount: s,
                ...i
            } = e, c = v(q, a);
            return (0, u.jsx)(m.Presence, {
                present: s || w(c.checked) || !0 === c.checked,
                children: (0, u.jsx)(f.Primitive.span, {
                    "data-state": E(c.checked),
                    "data-disabled": c.disabled ? "" : void 0,
                    ...i,
                    ref: t,
                    style: {
                        pointerEvents: "none",
                        ...e.style
                    }
                })
            })
        });
    S.displayName = q;
    var z = "CheckboxBubbleInput",
        j = i.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                ...s
            } = e, {
                control: r,
                hasConsumerStoppedPropagationRef: l,
                checked: o,
                defaultChecked: m,
                required: g,
                disabled: h,
                name: b,
                value: p,
                form: x,
                bubbleInput: _,
                setBubbleInput: k
            } = v(z, a), y = (0, c.useComposedRefs)(t, k), q = (0, d.usePrevious)(o), S = (0, n.useSize)(r);
            i.useEffect(() => {
                if (!_) return;
                let e = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set,
                    t = !l.current;
                if (q !== o && e) {
                    let a = new Event("click", {
                        bubbles: t
                    });
                    _.indeterminate = w(o), e.call(_, !w(o) && o), _.dispatchEvent(a)
                }
            }, [_, q, o, l]);
            let j = i.useRef(!w(o) && o);
            return (0, u.jsx)(f.Primitive.input, {
                type: "checkbox",
                "aria-hidden": !0,
                defaultChecked: null != m ? m : j.current,
                required: g,
                disabled: h,
                name: b,
                value: p,
                form: x,
                ...s,
                tabIndex: -1,
                ref: y,
                style: {
                    ...s.style,
                    ...S,
                    position: "absolute",
                    pointerEvents: "none",
                    opacity: 0,
                    margin: 0,
                    transform: "translateX(-100%)"
                }
            })
        });

    function w(e) {
        return "indeterminate" === e
    }

    function E(e) {
        return w(e) ? "indeterminate" : e ? "checked" : "unchecked"
    }
    j.displayName = z;
    let C = {
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
        R = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        L = {
            XSmall: "",
            Small: "padding-top-xxsmall",
            Medium: "padding-top-xxsmall",
            Large: "padding-top-xxsmall"
        };
    e.s(["Checkbox", 0, e => {
        let {
            label: c,
            className: r,
            isChecked: l,
            isDisabled: o,
            size: d,
            hint: n,
            placement: m,
            onCheckedChange: f,
            id: u,
            ...g
        } = e, h = (0, a.default)(), b = u || h, p = c && i.default.createElement("label", {
            htmlFor: b,
            className: (0, s.default)("flex flex-col grow-1 gap-xsmall", !o && "cursor-pointer")
        }, i.default.createElement("span", {
            className: (0, s.default)(R[d], L[d], "content-emphasis")
        }, c), n && i.default.createElement("span", {
            className: "text-body-medium content-default"
        }, n));
        return i.default.createElement("div", {
            className: (0, s.default)("foundation-web-checkbox flex gap-medium", o && "opacity-[0.5]", !o && "cursor-pointer", r)
        }, "End" === m && p, i.default.createElement("div", {
            className: (0, s.default)(M[d])
        }, i.default.createElement(y, {
            "data-slot": "checkbox",
            className: (0, s.default)(C[d], t.interactable, !o && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
            id: b,
            checked: l,
            disabled: o,
            onCheckedChange: f,
            "aria-label": c,
            ...g
        }, i.default.createElement(t.StateLayer, null), i.default.createElement(S, {
            "data-slot": "checkbox-indicator",
            className: (0, s.default)(C[d], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
        }))), "Start" === m && p)
    }], 685245)
}, 368313, e => {
    "use strict";
    var t = e.i(253923),
        a = e.i(106077),
        s = e.i(605836),
        i = e.i(197649),
        c = e.i(416340);
    let r = {
            Small: "XSmall",
            Medium: "Small",
            Large: "Medium"
        },
        l = {
            Small: ["height-600", "text-label-small"],
            Medium: ["height-800", "text-label-medium"],
            Large: ["height-1000", "text-label-medium"]
        },
        o = {
            Small: "padding-left-small",
            Medium: "padding-left-medium",
            Large: "padding-left-large"
        },
        d = {
            Small: "padding-left-small",
            Medium: "padding-left-medium",
            Large: "padding-left-medium"
        },
        n = {
            Small: "padding-right-small",
            Medium: "padding-right-medium",
            Large: "padding-right-large"
        },
        m = {
            Small: "padding-right-small",
            Medium: "padding-right-medium",
            Large: "padding-right-medium"
        },
        f = {
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
        h = {
            Small: "size-[var(--icon-size-xsmall)]",
            Medium: "size-[var(--icon-size-small)]",
            Large: "size-[var(--icon-size-medium)]"
        },
        b = e => {
            let {
                iconName: t,
                node: a,
                size: l
            } = e;
            return null != t ? c.default.createElement(s.Icon, {
                name: t,
                size: r[l]
            }) : null != a ? c.default.createElement("span", {
                className: (0, i.default)("inline-flex items-center justify-center shrink-0", h[l])
            }, a) : null
        },
        p = (0, c.forwardRef)((e, s) => {
            let {
                className: r,
                style: h,
                text: p,
                isDisabled: v = !1,
                size: x = "Medium",
                variant: _ = "Standard",
                leadingIconName: k,
                leadingIconNode: y,
                trailingIconName: q,
                trailingIconNode: S,
                ...z
            } = e, j = null != k || null != y, w = null != q || null != S, E = (0, i.default)(v ? a.disabledOpacity : [t.interactable, "cursor-pointer"], "relative flex justify-center items-center radius-circle stroke-none", j ? d[x] : o[x], w ? m[x] : n[x], l[x], r), C = c.default.createElement(c.default.Fragment, null, c.default.createElement(t.StateLayer, null), c.default.createElement(b, {
                iconName: k,
                node: y,
                size: x
            }), c.default.createElement("span", {
                className: (0, i.default)("padding-y-xsmall text-no-wrap text-truncate-end", j && f[x], w && u[x])
            }, p), c.default.createElement(b, {
                iconName: q,
                node: S,
                size: x
            })), M = {
                textDecoration: "none",
                ...h
            };
            if ("a" === z.as) {
                let {
                    as: e,
                    href: t,
                    ...a
                } = z;
                return c.default.createElement("a", {
                    ref: s,
                    ...a,
                    "aria-disabled": v,
                    href: v ? void 0 : t,
                    className: (0, i.default)(E, g[_], "content-action-utility"),
                    style: M
                }, C)
            }
            let {
                as: R,
                isChecked: L,
                onCheckedChange: N,
                ...I
            } = z;
            return c.default.createElement("button", {
                ref: s,
                type: "button",
                ...I,
                className: (0, i.default)(L ? "bg-inverse-surface-0" : g[_], L ? "content-inverse-emphasis" : "content-action-utility", E),
                style: M,
                "aria-pressed": L,
                disabled: v,
                onClick: null == N ? void 0 : () => N(!L)
            }, C)
        });
    e.s(["Chip", 0, p])
}, 256539, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340);
    let s = (0, a.forwardRef)((e, s) => {
        let {
            className: i,
            style: c,
            orientation: r = "horizontal",
            variant: l = "Standard",
            ...o
        } = e, d = "vertical" === r, n = {};
        return d || "Inset" !== l ? d || "InsetLeft" !== l ? d || "InsetRight" !== l || (n = {
            marginRight: "var(--padding-xlarge)"
        }) : n = {
            marginLeft: "var(--padding-xlarge)"
        } : n = {
            marginLeft: "var(--padding-xlarge)",
            marginRight: "var(--padding-xlarge)"
        }, a.default.createElement("div", {
            ref: s,
            ...o,
            role: "separator",
            "data-orientation": r,
            "aria-orientation": r,
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
                } : "Thick" === l ? {
                    height: "var(--size-250)",
                    borderTop: "var(--stroke-standard)",
                    borderLeftWidth: 0,
                    background: "var(--color-common-heavydivider, rgba(0, 0, 0, 0.50))"
                } : {
                    height: 0,
                    borderTopWidth: "var(--stroke-standard)",
                    borderLeftWidth: 0
                },
                ...n,
                ...c
            },
            className: (0, t.default)("stroke-default self-stretch", i)
        })
    });
    s.displayName = "Divider", e.s(["Divider", 0, s])
}, 708064, e => {
    "use strict";
    var t = e.i(253923),
        a = e.i(106077),
        s = e.i(197649),
        i = e.i(416340),
        c = e.i(23342);
    let r = {
            Large: "size-1200",
            Medium: "size-1000",
            Small: "size-800",
            XSmall: "size-600"
        },
        l = {
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
        n = {
            Emphasis: "bg-action-standard",
            Standard: "bg-action-standard",
            Alert: "bg-action-standard",
            Utility: "bg-action-link",
            OverMedia: "bg-over-media-0"
        },
        m = {
            Emphasis: "bg-action-emphasis",
            Standard: "bg-action-standard",
            Alert: "bg-action-standard",
            Utility: "bg-shift-300",
            OverMedia: "bg-over-media-0"
        },
        f = {
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
        u = {
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
        g = (0, i.forwardRef)((e, g) => {
            let h, {
                className: b,
                icon: p,
                ariaLabel: v,
                isDisabled: x = !1,
                isCircular: _ = !1,
                isSelected: k = !1,
                size: y = "Large",
                variant: q = "Emphasis",
                iconColor: S = "Default",
                asChild: z,
                children: j,
                ...w
            } = e;
            h = x ? n[q] : k ? m[q] : d[q];
            let E = (0, s.default)("foundation-web-icon-button", x ? a.disabledOpacity : [t.interactable, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", r[y], o[y][_ ? "circular" : "square"], h, b),
                C = i.default.createElement(i.default.Fragment, null, i.default.createElement(t.StateLayer, null), i.default.createElement("span", {
                    className: (0, s.default)("icon", p, l[y], x ? u[S][q] : f[S][q])
                }));
            if (z) {
                let {
                    as: e,
                    ...t
                } = w, a = i.default.Children.only(j);
                return i.default.createElement(c.Slot, {
                    ref: g,
                    ...t,
                    className: E,
                    "aria-label": v,
                    "aria-disabled": x || void 0
                }, i.default.cloneElement(a, {}, C))
            }
            if ("a" === w.as) {
                let {
                    as: e,
                    href: t,
                    ...a
                } = w;
                return i.default.createElement("a", {
                    ref: g,
                    ...a,
                    "aria-label": v,
                    "aria-disabled": x,
                    href: x ? void 0 : t,
                    className: E
                }, C)
            }
            let {
                as: M,
                ...R
            } = w;
            return i.default.createElement("button", {
                ref: g,
                type: "button",
                ...R,
                "aria-label": v,
                disabled: x,
                className: E
            }, C)
        });
    e.s(["IconButton", 0, g])
}, 854705, e => {
    "use strict";
    var t = e.i(865800),
        a = e.i(416340),
        s = e.i(614515),
        i = e.i(993807),
        c = e.i(696180),
        r = e.i(273589),
        l = e.i(962560),
        o = e.i(42569),
        d = e.i(576881),
        n = e.i(751498),
        m = e.i(221628),
        f = e.i(219224),
        u = e.i(963320),
        g = e.i(275966);
    e.i(197094);
    var h = (0, n.c)((0, m.jsx)("path", {
            d: "M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8z"
        }), "RadioButtonUnchecked"),
        b = (0, n.c)((0, m.jsx)("path", {
            d: "M8.465 8.465C9.37 7.56 10.62 7 12 7C14.76 7 17 9.24 17 12C17 13.38 16.44 14.63 15.535 15.535C14.63 16.44 13.38 17 12 17C9.24 17 7 14.76 7 12C7 10.62 7.56 9.37 8.465 8.465Z"
        }), "RadioButtonChecked");
    let p = (0, o.s)("span", {
            name: "MuiRadioButtonIcon",
            shouldForwardProp: o.r
        })({
            position: "relative",
            display: "flex"
        }),
        v = (0, o.s)(h, {
            name: "MuiRadioButtonIcon"
        })({
            transform: "scale(1)"
        }),
        x = (0, o.s)(b, {
            name: "MuiRadioButtonIcon"
        })(e => {
            let {
                theme: t,
                ownerState: a
            } = e;
            return (0, l._)({
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
        } = e, i = (0, l._)({}, e, {
            checked: t
        });
        return (0, m.jsxs)(p, {
            className: a.root,
            ownerState: i,
            children: [(0, m.jsx)(v, {
                fontSize: s,
                className: a.background,
                ownerState: i
            }), (0, m.jsx)(x, {
                fontSize: s,
                className: a.dot,
                ownerState: i
            })]
        })
    }

    function k(e) {
        return (0, r.g)("MuiRadio", e)
    }
    var y = (0, c.g)("MuiRadio", ["root", "checked", "disabled", "colorPrimary", "colorSecondary", "sizeSmall"]);
    let q = ["checked", "checkedIcon", "color", "icon", "name", "onChange", "size", "className"],
        S = (0, o.s)(d.S, {
            shouldForwardProp: e => (0, o.r)(e) || "classes" === e,
            name: "MuiRadio",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: a
                } = e;
                return [t.root, "medium" !== a.size && t["size".concat((0, r.a)(a.size))], t["color".concat((0, r.a)(a.color))]]
            }
        })(e => {
            let {
                theme: t,
                ownerState: a
            } = e;
            return (0, l._)({
                color: (t.vars || t).palette.text.secondary
            }, !a.disableRipple && {
                "&:hover": {
                    backgroundColor: t.vars ? "rgba(".concat("default" === a.color ? t.vars.palette.action.activeChannel : t.vars.palette[a.color].mainChannel, " / ").concat(t.vars.palette.action.hoverOpacity, ")") : (0, r.b)("default" === a.color ? t.palette.action.active : t.palette[a.color].main, t.palette.action.hoverOpacity),
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
        z = (0, m.jsx)(_, {
            checked: !0
        }),
        j = (0, m.jsx)(_, {}),
        w = a.forwardRef(function(e, t) {
            var s, i, c, d;
            let n = (0, u.u)({
                    props: e,
                    name: "MuiRadio"
                }),
                {
                    checked: h,
                    checkedIcon: b = z,
                    color: p = "primary",
                    icon: v = j,
                    name: x,
                    onChange: _,
                    size: y = "medium",
                    className: w
                } = n,
                E = (0, r._)(n, q),
                C = (0, l._)({}, n, {
                    color: p,
                    size: y
                }),
                M = (e => {
                    let {
                        classes: t,
                        color: a,
                        size: s
                    } = e, i = {
                        root: ["root", "color".concat((0, r.a)(a)), "medium" !== s && "size".concat((0, r.a)(s))]
                    };
                    return (0, l._)({}, t, (0, o.a)(i, k, t))
                })(C),
                R = a.useContext(f.R),
                L = h,
                N = (0, g.c)(_, R && R.onChange),
                I = x;
            return R && (void 0 === L && (c = R.value, L = "object" == typeof(d = n.value) && null !== d ? c === d : String(c) === String(d)), void 0 === I && (I = R.name)), (0, m.jsx)(S, (0, l._)({
                type: "radio",
                icon: a.cloneElement(v, {
                    fontSize: null != (s = j.props.fontSize) ? s : y
                }),
                checkedIcon: a.cloneElement(b, {
                    fontSize: null != (i = z.props.fontSize) ? i : y
                }),
                ownerState: C,
                classes: M,
                name: I,
                checked: L,
                onChange: N,
                ref: t,
                className: (0, o.c)(M.root, w)
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
        C = (0, a.forwardRef)(function(e, s) {
            var c = e.classes,
                r = e.color,
                l = e.inputProps,
                o = e["aria-label"],
                d = e.className,
                n = (0, t.a)(e, ["classes", "color", "inputProps", "aria-label", "className"]),
                m = E(void 0, {
                    props: {
                        classes: (0, i.default)(c, d)
                    }
                });
            return a.default.createElement(w, (0, t._)({}, n, {
                classes: m.classes,
                color: void 0 === r ? "primary" : r,
                ref: s,
                inputProps: (0, t._)({
                    "aria-label": o
                }, l)
            }))
        });
    e.s(["Radio", 0, C], 854705)
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

//# debugId=3ef9f4d0-d331-8cae-9038-43f3ae1f4b41
//# sourceMappingURL=3kojct1vhh0_u.js.map
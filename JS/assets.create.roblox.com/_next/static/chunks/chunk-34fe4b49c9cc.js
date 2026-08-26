;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "e9ddaabe-2fa4-055b-10fa-64c75e759925")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 493924, 938429, 321623, e => {
    "use strict";
    var a = e.i(221628),
        t = e.i(199834),
        s = e.i(706442),
        i = e.i(776344),
        c = e.i(462863),
        r = e.i(210436),
        l = e.i(872378),
        o = e.i(909935),
        d = e.i(587608),
        n = e.i(648550),
        m = e.i(879556),
        u = e.i(156676),
        g = e.i(732097),
        b = e.i(149209),
        h = e.i(152382),
        p = e.i(323377),
        f = e.i(212940),
        v = e.i(581403),
        x = e.i(527781),
        _ = e.i(977079),
        k = e.i(402440),
        y = e.i(620094),
        q = e.i(721267),
        S = e.i(788618),
        z = e.i(11730),
        j = e.i(334912),
        w = e.i(315072),
        E = e.i(319700),
        C = e.i(397367),
        M = e.i(339295),
        R = e.i(26168),
        L = e.i(761562),
        N = e.i(174990),
        I = e.i(226572),
        P = e.i(41024),
        A = e.i(318682),
        O = e.i(902904),
        T = e.i(973248),
        U = e.i(699904),
        B = e.i(861406),
        D = e.i(659373),
        W = e.i(871908),
        X = e.i(712369),
        F = e.i(761170),
        K = e.i(69008),
        H = e.i(610419),
        V = e.i(6938),
        G = e.i(931008),
        Z = e.i(132917),
        J = e.i(999544),
        Q = e.i(370502),
        Y = e.i(779375),
        $ = e.i(179677),
        ee = e.i(761534),
        ea = e.i(935295),
        et = e.i(930283),
        es = e.i(892316),
        ei = e.i(667509),
        ec = e.i(285253),
        er = e.i(987596),
        el = e.i(969915);
    let eo = {
        secrets: {
            light: N.default,
            dark: L.default
        },
        noPermissions: {
            light: N.default,
            dark: L.default
        },
        notifications: {
            light: K.default,
            dark: F.default
        },
        experiences: {
            light: er.default,
            dark: ec.default
        },
        shareLinks: {
            light: $.default,
            dark: Y.default
        },
        eventsAndUpdates: {
            light: k.default,
            dark: _.default
        },
        avatarItem: {
            light: m.default,
            dark: n.default
        },
        models: {
            light: D.default,
            dark: B.default
        },
        plugins: {
            light: X.default,
            dark: W.default
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
            light: z.default,
            dark: S.default
        },
        videos: {
            light: el.default,
            dark: ei.default
        },
        meshes: {
            light: U.default,
            dark: T.default
        },
        animations: {
            light: Q.default,
            dark: J.default
        },
        noUsers: {
            light: f.default,
            dark: p.default
        },
        localization: {
            light: R.default,
            dark: M.default
        },
        rightsManager: {
            light: Z.default,
            dark: G.default
        },
        tokens: {
            light: es.default,
            dark: et.default
        },
        chart: {
            light: C.default,
            dark: E.default
        },
        badge: {
            light: g.default,
            dark: u.default
        },
        apiKeys: {
            light: l.default,
            dark: r.default
        },
        signin: {
            light: ea.default,
            dark: ee.default
        },
        oAuthApps: {
            light: V.default,
            dark: H.default
        },
        makeupLooks: {
            light: P.default,
            dark: I.default
        },
        barGraph: {
            light: h.default,
            dark: b.default
        },
        leaderboard: {
            light: w.default,
            dark: j.default
        },
        findPeople: {
            light: q.default,
            dark: y.default
        },
        managedPricing: {
            light: O.default,
            dark: A.default
        }
    };
    e.s(["default", 0, eo], 938429);
    let ed = "".concat("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/assets", "/spot_illustrations"),
        en = {
            small: {
                analytics: "".concat(ed, "/small/analytics.svg"),
                animations: "".concat(ed, "/small/animations.svg"),
                audio: "".concat(ed, "/small/audio.svg"),
                audioLight: "".concat(ed, "/small/audio_light.svg"),
                audioDark: "".concat(ed, "/small/audio_dark.svg"),
                avatarItem: "".concat(ed, "/small/avatar_item.svg"),
                beginSearch: "".concat(ed, "/small/beginSearch.svg"),
                creatorStore: "".concat(ed, "/small/creator_store.svg"),
                decals: "".concat(ed, "/small/decals.svg"),
                events: "".concat(ed, "/small/events.svg"),
                experiences: "".concat(ed, "/small/experiences.svg"),
                images: "".concat(ed, "/small/images.svg"),
                meshes: "".concat(ed, "/small/meshes.svg"),
                models: "".concat(ed, "/small/models.svg"),
                plugins: "".concat(ed, "/small/plugins.svg"),
                script: "".concat(ed, "/small/script.svg"),
                song: "".concat(ed, "/small/song.svg"),
                musicNote: "".concat(ed, "/small/audio_music_note.svg"),
                noUsers: "".concat(ed, "/small/no_users.svg"),
                user: "".concat(ed, "/small/user.svg"),
                users: "".concat(ed, "/small/users.svg"),
                videos: "".concat(ed, "/small/videos.svg"),
                search: "".concat(ed, "/small/search.svg"),
                oof: "".concat(ed, "/small/oof.svg"),
                download: "".concat(ed, "/small/download.svg"),
                attributes: "".concat(ed, "/small/attributes.svg"),
                matchmakingSimulation: "".concat(ed, "/small/matchmaking_simulation.svg")
            },
            large: {
                apiKeys: "".concat(ed, "/large/api_keys.svg"),
                localization: "".concat(ed, "/large/localization.svg"),
                noPermissions: "".concat(ed, "/large/no_permissions.svg"),
                oAuthApps: "".concat(ed, "/large/oauth_apps.svg"),
                rights: "".concat(ed, "/large/rights.svg"),
                secrets: "".concat(ed, "/large/secrets.svg"),
                shareLinks: "".concat(ed, "/large/share_links.svg"),
                configurations: "".concat(ed, "/large/configurations.svg"),
                experienceConfigs: "".concat(ed, "/large/experience_configs.svg"),
                emptyExperiments: "".concat(ed, "/large/empty_experiments.svg")
            }
        };
    e.s(["default", 0, en], 321623);
    let em = (0, s.makeStyles)()(() => ({
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
        eu = e => {
            let {
                illustration: t,
                size: s = "large"
            } = e, i = t && eo[t];
            if (i) return (0, a.jsx)(c.default, {
                lightSrc: i.light,
                darkSrc: i.dark,
                alt: t
            });
            let r = t ? en[s][t] : null;
            return r && (0, a.jsx)("img", {
                height: "large" === s ? 240 : 96,
                width: "large" === s ? 320 : 96,
                src: r,
                alt: t
            })
        },
        eg = e => {
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
                    largeText: u
                },
                cx: g
            } = em();
            return (0, a.jsxs)(i.default, {
                classes: {
                    root: g({
                        [d]: "small" === l,
                        [n]: "large" === l
                    })
                },
                flexDirection: "column",
                alignItems: "center",
                children: [(0, a.jsx)(eu, {
                    illustration: o,
                    size: l
                }), (0, a.jsxs)(i.default, {
                    classes: {
                        root: g({
                            [m]: "small" === l,
                            [u]: "large" === l
                        })
                    },
                    flexDirection: "column",
                    alignItems: "center",
                    children: [(0, a.jsx)(t.Typography, {
                        textAlign: "center",
                        variant: "h4",
                        color: "primary",
                        children: c
                    }), r && (0, a.jsx)(t.Typography, {
                        textAlign: "center",
                        color: "secondary",
                        children: r
                    })]
                }), s]
            })
        };
    eg.displayName = "EmptyState", e.s(["EmptyStateIllustration", 0, eu, "default", 0, eg], 493924)
}, 666554, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/alert_dark.1spa8ixzmujxs.svg")
}, 318974, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/alert_light.3o6_fob3g_8zu.svg")
}, 210436, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/api_key_dark.1k1v6y4zm3j28.svg")
}, 872378, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/api_key_light.06t4q4202-77s.svg")
}, 909935, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/audio_dark.16razgllw2ska.svg")
}, 587608, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/audio_light.3ra073_18pbj-.svg")
}, 648550, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/avatar_setup_dark.0orjsl7i089hc.svg")
}, 879556, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/avatar_setup_light.32r86q54d7kuh.svg")
}, 156676, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/badge_dark.3m45r-3favo3f.svg")
}, 732097, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/badge_light.3fxfvj8ub7utb.svg")
}, 149209, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/bar_graph_dark.01vf9sty52re2.svg")
}, 152382, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/bar_graph_light.1iiixo_d8ur81.svg")
}, 323377, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/collaborators_dark.30gxkwssilacj.svg")
}, 212940, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/collaborators_light.3x7fovqhay1x5.svg")
}, 581403, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/decals_dark.2jpntsljojhzc.svg")
}, 527781, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/decals_light.16_gp3tnuc5p_.svg")
}, 977079, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/event_calendar_dark.3lx4_kse68by8.svg")
}, 402440, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/event_calendar_light.1pq-t84d90ty1.svg")
}, 620094, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/find_people_dark.220q6_cs04hcq.svg")
}, 721267, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/find_people_light.1gkb3pmwc8s2n.svg")
}, 788618, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/image_dark.2giew28wx4z86.svg")
}, 11730, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/image_light.0ouq8tcgpznz7.svg")
}, 334912, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/leaderboard_dark.301ypg94lbxpv.svg")
}, 315072, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/leaderboard_light.43sjz_ibwkiq_.svg")
}, 319700, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/line_chart_dark.0k7qf3mhepo6s.svg")
}, 397367, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/line_chart_light.049gcvvmai0ax.svg")
}, 339295, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/localization_dark.1ia7wat2mwyfi.svg")
}, 26168, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/localization_light.2jss_xvx2fuq0.svg")
}, 761562, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/lockSecrets_dark.0na6naigcbnkj.svg")
}, 174990, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/lockSecrets_light.0rzix2i1i13lt.svg")
}, 226572, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/makeup_look_dark.26-5-yn8598c9.svg")
}, 41024, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/makeup_look_light.0rc05t5n5al4m.svg")
}, 318682, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/managed_pricing_dark.2zdkf2-ctboa2.svg")
}, 902904, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/managed_pricing_light.0sioq_hruq1qp.svg")
}, 973248, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/meshes_dark.2tlm50ns1pq5o.svg")
}, 699904, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/meshes_light.36wh96flp2o3r.svg")
}, 861406, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/models_dark.30suu5lj5-ua5.svg")
}, 659373, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/models_light.0kiw6k3ejw-rn.svg")
}, 871908, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/models_plugins_parts_dark.3jp6jislnsqf8.svg")
}, 712369, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/models_plugins_parts_light.2nj1xhv0bfg_u.svg")
}, 761170, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/notifications_dark.2l_rf34_xo6o8.svg")
}, 69008, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/notifications_light.3p-b4rzvwwfmj.svg")
}, 610419, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/oauth_dark.42jv8--11_1i0.svg")
}, 6938, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/oauth_light.17vwiebwrn8ox.svg")
}, 931008, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/rights_manager_dark.0m7ca17sdbgim.svg")
}, 132917, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/rights_manager_light.1moaenz1cbft0.svg")
}, 999544, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/run_dark.1sun4tvxh_arh.svg")
}, 370502, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/run_light.29f-3jyw910_v.svg")
}, 779375, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/shareLinks_dark.1l5fwuv6cgzmy.svg")
}, 179677, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/shareLinks_light.116igf-ldibmu.svg")
}, 761534, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/signin_dark.1k_gzn1-5q0ca.svg")
}, 935295, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/signin_light.1o1-jng_ct0y2.svg")
}, 930283, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/token_dark.2qy4jy9ffjhax.svg")
}, 892316, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/token_light.2xc00j5zp1q8_.svg")
}, 667509, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/video_dark.2-gdpodjtsjj3.svg")
}, 285253, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/video_game_dark.0tuxtkttj8gcu.svg")
}, 987596, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/video_game_light.3l155817mjupj.svg")
}, 969915, e => {
    e.q("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/_next/static/media/video_light.1fum3vlxctp7w.svg")
}, 685245, e => {
    "use strict";
    var a = e.i(253923),
        t = e.i(454778),
        s = e.i(197649),
        i = e.i(416340),
        c = e.i(78892),
        r = e.i(608652),
        l = e.i(174617),
        o = e.i(199786),
        d = e.i(300792),
        n = e.i(692166),
        m = e.i(169525),
        u = e.i(600317),
        g = e.i(221628),
        b = "Checkbox",
        [h, p] = (0, r.createContextScope)(b),
        [f, v] = h(b);

    function x(e) {
        let {
            __scopeCheckbox: a,
            checked: t,
            children: s,
            defaultChecked: c,
            disabled: r,
            form: l,
            name: d,
            onCheckedChange: n,
            required: m,
            value: u = "on",
            internal_do_not_use_render: h
        } = e, [p, v] = (0, o.useControllableState)({
            prop: t,
            defaultProp: null != c && c,
            onChange: n,
            caller: b
        }), [x, _] = i.useState(null), [k, y] = i.useState(null), q = i.useRef(!1), S = !x || !!l || !!x.closest("form"), z = {
            checked: p,
            disabled: r,
            setChecked: v,
            control: x,
            setControl: _,
            name: d,
            form: l,
            value: u,
            hasConsumerStoppedPropagationRef: q,
            required: m,
            defaultChecked: !w(c) && c,
            isFormControl: S,
            bubbleInput: k,
            setBubbleInput: y
        };
        return (0, g.jsx)(f, {
            scope: a,
            ...z,
            children: "function" == typeof h ? h(z) : s
        })
    }
    var _ = "CheckboxTrigger",
        k = i.forwardRef((e, a) => {
            let {
                __scopeCheckbox: t,
                onKeyDown: s,
                onClick: r,
                ...o
            } = e, {
                control: d,
                value: n,
                disabled: m,
                checked: b,
                required: h,
                setControl: p,
                setChecked: f,
                hasConsumerStoppedPropagationRef: x,
                isFormControl: k,
                bubbleInput: y
            } = v(_, t), q = (0, c.useComposedRefs)(a, p), S = i.useRef(b);
            return i.useEffect(() => {
                let e = null == d ? void 0 : d.form;
                if (e) {
                    let a = () => f(S.current);
                    return e.addEventListener("reset", a), () => e.removeEventListener("reset", a)
                }
            }, [d, f]), (0, g.jsx)(u.Primitive.button, {
                type: "button",
                role: "checkbox",
                "aria-checked": w(b) ? "mixed" : b,
                "aria-required": h,
                "data-state": E(b),
                "data-disabled": m ? "" : void 0,
                disabled: m,
                value: n,
                ...o,
                ref: q,
                onKeyDown: (0, l.composeEventHandlers)(s, e => {
                    "Enter" === e.key && e.preventDefault()
                }),
                onClick: (0, l.composeEventHandlers)(r, e => {
                    f(e => !!w(e) || !e), y && k && (x.current = e.isPropagationStopped(), x.current || e.stopPropagation())
                })
            })
        });
    k.displayName = _;
    var y = i.forwardRef((e, a) => {
        let {
            __scopeCheckbox: t,
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
        return (0, g.jsx)(x, {
            __scopeCheckbox: t,
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
                return (0, g.jsxs)(g.Fragment, {
                    children: [(0, g.jsx)(k, {
                        ...m,
                        ref: a,
                        __scopeCheckbox: t
                    }), s && (0, g.jsx)(j, {
                        __scopeCheckbox: t
                    })]
                })
            }
        })
    });
    y.displayName = b;
    var q = "CheckboxIndicator",
        S = i.forwardRef((e, a) => {
            let {
                __scopeCheckbox: t,
                forceMount: s,
                ...i
            } = e, c = v(q, t);
            return (0, g.jsx)(m.Presence, {
                present: s || w(c.checked) || !0 === c.checked,
                children: (0, g.jsx)(u.Primitive.span, {
                    "data-state": E(c.checked),
                    "data-disabled": c.disabled ? "" : void 0,
                    ...i,
                    ref: a,
                    style: {
                        pointerEvents: "none",
                        ...e.style
                    }
                })
            })
        });
    S.displayName = q;
    var z = "CheckboxBubbleInput",
        j = i.forwardRef((e, a) => {
            let {
                __scopeCheckbox: t,
                ...s
            } = e, {
                control: r,
                hasConsumerStoppedPropagationRef: l,
                checked: o,
                defaultChecked: m,
                required: b,
                disabled: h,
                name: p,
                value: f,
                form: x,
                bubbleInput: _,
                setBubbleInput: k
            } = v(z, t), y = (0, c.useComposedRefs)(a, k), q = (0, d.usePrevious)(o), S = (0, n.useSize)(r);
            i.useEffect(() => {
                if (!_) return;
                let e = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set,
                    a = !l.current;
                if (q !== o && e) {
                    let t = new Event("click", {
                        bubbles: a
                    });
                    _.indeterminate = w(o), e.call(_, !w(o) && o), _.dispatchEvent(t)
                }
            }, [_, q, o, l]);
            let j = i.useRef(!w(o) && o);
            return (0, g.jsx)(u.Primitive.input, {
                type: "checkbox",
                "aria-hidden": !0,
                defaultChecked: null != m ? m : j.current,
                required: b,
                disabled: h,
                name: p,
                value: f,
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
            onCheckedChange: u,
            id: g,
            ...b
        } = e, h = (0, t.default)(), p = g || h, f = c && i.default.createElement("label", {
            htmlFor: p,
            className: (0, s.default)("flex flex-col grow-1 gap-xsmall", !o && "cursor-pointer")
        }, i.default.createElement("span", {
            className: (0, s.default)(R[d], L[d], "content-emphasis")
        }, c), n && i.default.createElement("span", {
            className: "text-body-medium content-default"
        }, n));
        return i.default.createElement("div", {
            className: (0, s.default)("foundation-web-checkbox flex gap-medium", o && "opacity-[0.5]", !o && "cursor-pointer", r)
        }, "End" === m && f, i.default.createElement("div", {
            className: (0, s.default)(M[d])
        }, i.default.createElement(y, {
            "data-slot": "checkbox",
            className: (0, s.default)(C[d], a.interactable, !o && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
            id: p,
            checked: l,
            disabled: o,
            onCheckedChange: u,
            "aria-label": c,
            ...b
        }, i.default.createElement(a.StateLayer, null), i.default.createElement(S, {
            "data-slot": "checkbox-indicator",
            className: (0, s.default)(C[d], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
        }))), "Start" === m && f)
    }], 685245)
}, 368313, e => {
    "use strict";
    var a = e.i(253923),
        t = e.i(106077),
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
        b = {
            Standard: "bg-shift-300",
            Utility: "bg-none"
        },
        h = {
            Small: "size-[var(--icon-size-xsmall)]",
            Medium: "size-[var(--icon-size-small)]",
            Large: "size-[var(--icon-size-medium)]"
        },
        p = e => {
            let {
                iconName: a,
                node: t,
                size: l
            } = e;
            return null != a ? c.default.createElement(s.Icon, {
                name: a,
                size: r[l]
            }) : null != t ? c.default.createElement("span", {
                className: (0, i.default)("inline-flex items-center justify-center shrink-0", h[l])
            }, t) : null
        },
        f = (0, c.forwardRef)((e, s) => {
            let {
                className: r,
                style: h,
                text: f,
                isDisabled: v = !1,
                size: x = "Medium",
                variant: _ = "Standard",
                leadingIconName: k,
                leadingIconNode: y,
                trailingIconName: q,
                trailingIconNode: S,
                ...z
            } = e, j = null != k || null != y, w = null != q || null != S, E = (0, i.default)(v ? t.disabledOpacity : [a.interactable, "cursor-pointer"], "relative flex justify-center items-center radius-circle stroke-none", j ? d[x] : o[x], w ? m[x] : n[x], l[x], r), C = c.default.createElement(c.default.Fragment, null, c.default.createElement(a.StateLayer, null), c.default.createElement(p, {
                iconName: k,
                node: y,
                size: x
            }), c.default.createElement("span", {
                className: (0, i.default)("padding-y-xsmall text-no-wrap text-truncate-end", j && u[x], w && g[x])
            }, f), c.default.createElement(p, {
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
                    href: a,
                    ...t
                } = z;
                return c.default.createElement("a", {
                    ref: s,
                    ...t,
                    "aria-disabled": v,
                    href: v ? void 0 : a,
                    className: (0, i.default)(E, b[_], "content-action-utility"),
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
                className: (0, i.default)(L ? "bg-inverse-surface-0" : b[_], L ? "content-inverse-emphasis" : "content-action-utility", E),
                style: M,
                "aria-pressed": L,
                disabled: v,
                onClick: null == N ? void 0 : () => N(!L)
            }, C)
        });
    e.s(["Chip", 0, f])
}, 256539, e => {
    "use strict";
    var a = e.i(197649),
        t = e.i(416340);
    let s = (0, t.forwardRef)((e, s) => {
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
        }, t.default.createElement("div", {
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
            className: (0, a.default)("stroke-default self-stretch", i)
        })
    });
    s.displayName = "Divider", e.s(["Divider", 0, s])
}, 708064, e => {
    "use strict";
    var a = e.i(253923),
        t = e.i(106077),
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
        u = {
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
        g = {
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
        b = (0, i.forwardRef)((e, b) => {
            let h, {
                className: p,
                icon: f,
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
            let E = (0, s.default)("foundation-web-icon-button", x ? t.disabledOpacity : [a.interactable, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", r[y], o[y][_ ? "circular" : "square"], h, p),
                C = i.default.createElement(i.default.Fragment, null, i.default.createElement(a.StateLayer, null), i.default.createElement("span", {
                    className: (0, s.default)("icon", f, l[y], x ? g[S][q] : u[S][q])
                }));
            if (z) {
                let {
                    as: e,
                    ...a
                } = w, t = i.default.Children.only(j);
                return i.default.createElement(c.Slot, {
                    ref: b,
                    ...a,
                    className: E,
                    "aria-label": v,
                    "aria-disabled": x || void 0
                }, i.default.cloneElement(t, {}, C))
            }
            if ("a" === w.as) {
                let {
                    as: e,
                    href: a,
                    ...t
                } = w;
                return i.default.createElement("a", {
                    ref: b,
                    ...t,
                    "aria-label": v,
                    "aria-disabled": x,
                    href: x ? void 0 : a,
                    className: E
                }, C)
            }
            let {
                as: M,
                ...R
            } = w;
            return i.default.createElement("button", {
                ref: b,
                type: "button",
                ...R,
                "aria-label": v,
                disabled: x,
                className: E
            }, C)
        });
    e.s(["IconButton", 0, b])
}, 854705, e => {
    "use strict";
    var a = e.i(865800),
        t = e.i(416340),
        s = e.i(614515),
        i = e.i(993807),
        c = e.i(696180),
        r = e.i(273589),
        l = e.i(962560),
        o = e.i(42569),
        d = e.i(576881),
        n = e.i(751498),
        m = e.i(221628),
        u = e.i(219224),
        g = e.i(963320),
        b = e.i(275966);
    e.i(197094);
    var h = (0, n.c)((0, m.jsx)("path", {
            d: "M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8z"
        }), "RadioButtonUnchecked"),
        p = (0, n.c)((0, m.jsx)("path", {
            d: "M8.465 8.465C9.37 7.56 10.62 7 12 7C14.76 7 17 9.24 17 12C17 13.38 16.44 14.63 15.535 15.535C14.63 16.44 13.38 17 12 17C9.24 17 7 14.76 7 12C7 10.62 7.56 9.37 8.465 8.465Z"
        }), "RadioButtonChecked");
    let f = (0, o.s)("span", {
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
        x = (0, o.s)(p, {
            name: "MuiRadioButtonIcon"
        })(e => {
            let {
                theme: a,
                ownerState: t
            } = e;
            return (0, l._)({
                left: 0,
                position: "absolute",
                transform: "scale(0)",
                transition: a.transitions.create("transform", {
                    easing: a.transitions.easing.easeIn,
                    duration: a.transitions.duration.shortest
                })
            }, t.checked && {
                transform: "scale(1)",
                transition: a.transitions.create("transform", {
                    easing: a.transitions.easing.easeOut,
                    duration: a.transitions.duration.shortest
                })
            })
        });

    function _(e) {
        let {
            checked: a = !1,
            classes: t = {},
            fontSize: s
        } = e, i = (0, l._)({}, e, {
            checked: a
        });
        return (0, m.jsxs)(f, {
            className: t.root,
            ownerState: i,
            children: [(0, m.jsx)(v, {
                fontSize: s,
                className: t.background,
                ownerState: i
            }), (0, m.jsx)(x, {
                fontSize: s,
                className: t.dot,
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
            overridesResolver: (e, a) => {
                let {
                    ownerState: t
                } = e;
                return [a.root, "medium" !== t.size && a["size".concat((0, r.a)(t.size))], a["color".concat((0, r.a)(t.color))]]
            }
        })(e => {
            let {
                theme: a,
                ownerState: t
            } = e;
            return (0, l._)({
                color: (a.vars || a).palette.text.secondary
            }, !t.disableRipple && {
                "&:hover": {
                    backgroundColor: a.vars ? "rgba(".concat("default" === t.color ? a.vars.palette.action.activeChannel : a.vars.palette[t.color].mainChannel, " / ").concat(a.vars.palette.action.hoverOpacity, ")") : (0, r.b)("default" === t.color ? a.palette.action.active : a.palette[t.color].main, a.palette.action.hoverOpacity),
                    "@media (hover: none)": {
                        backgroundColor: "transparent"
                    }
                }
            }, "default" !== t.color && {
                ["&.".concat(y.checked)]: {
                    color: (a.vars || a).palette[t.color].main
                }
            }, {
                ["&.".concat(y.disabled)]: {
                    color: (a.vars || a).palette.action.disabled
                }
            })
        }),
        z = (0, m.jsx)(_, {
            checked: !0
        }),
        j = (0, m.jsx)(_, {}),
        w = t.forwardRef(function(e, a) {
            var s, i, c, d;
            let n = (0, g.u)({
                    props: e,
                    name: "MuiRadio"
                }),
                {
                    checked: h,
                    checkedIcon: p = z,
                    color: f = "primary",
                    icon: v = j,
                    name: x,
                    onChange: _,
                    size: y = "medium",
                    className: w
                } = n,
                E = (0, r._)(n, q),
                C = (0, l._)({}, n, {
                    color: f,
                    size: y
                }),
                M = (e => {
                    let {
                        classes: a,
                        color: t,
                        size: s
                    } = e, i = {
                        root: ["root", "color".concat((0, r.a)(t)), "medium" !== s && "size".concat((0, r.a)(s))]
                    };
                    return (0, l._)({}, a, (0, o.a)(i, k, a))
                })(C),
                R = t.useContext(u.R),
                L = h,
                N = (0, b.c)(_, R && R.onChange),
                I = x;
            return R && (void 0 === L && (c = R.value, L = "object" == typeof(d = n.value) && null !== d ? c === d : String(c) === String(d)), void 0 === I && (I = R.name)), (0, m.jsx)(S, (0, l._)({
                type: "radio",
                icon: t.cloneElement(v, {
                    fontSize: null != (s = j.props.fontSize) ? s : y
                }),
                checkedIcon: t.cloneElement(p, {
                    fontSize: null != (i = z.props.fontSize) ? i : y
                }),
                ownerState: C,
                classes: M,
                name: I,
                checked: L,
                onChange: N,
                ref: a,
                className: (0, o.c)(M.root, w)
            }, E))
        });
    var E = (0, s.default)({
            name: "Radio"
        })(function(e) {
            var a, t;
            return {
                root: {
                    color: e.palette.states.active
                },
                colorPrimary: ((a = {
                    color: e.palette.content.muted
                })["&.".concat(y.checked)] = {
                    color: e.palette.actionV2.primaryBrand.fill
                }, a),
                colorSecondary: {
                    color: e.palette.actionV2.primary.fill
                },
                disabled: ((t = {
                    color: e.palette.states.disabled
                })["&.".concat(y.colorPrimary, ".").concat(y.checked)] = {
                    color: e.palette.states.disabled
                }, t)
            }
        }),
        C = (0, t.forwardRef)(function(e, s) {
            var c = e.classes,
                r = e.color,
                l = e.inputProps,
                o = e["aria-label"],
                d = e.className,
                n = (0, a.a)(e, ["classes", "color", "inputProps", "aria-label", "className"]),
                m = E(void 0, {
                    props: {
                        classes: (0, i.default)(c, d)
                    }
                });
            return t.default.createElement(w, (0, a._)({}, n, {
                classes: m.classes,
                color: void 0 === r ? "primary" : r,
                ref: s,
                inputProps: (0, a._)({
                    "aria-label": o
                }, l)
            }))
        });
    e.s(["Radio", 0, C], 854705)
}, 219224, e => {
    "use strict";
    let a = e.i(416340).createContext(void 0);
    e.s(["R", 0, a])
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

//# debugId=e9ddaabe-2fa4-055b-10fa-64c75e759925
//# sourceMappingURL=0u3q4d1rv3anf.js.map
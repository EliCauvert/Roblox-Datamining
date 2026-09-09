;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "70867429-13b9-228e-dc22-547ad8fd49c5")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 203450, a => {
    "use strict";
    var e = a.i(221628),
        t = a.i(416340),
        s = a.i(540459),
        i = a.i(79187),
        r = a.i(814975),
        l = a.i(156071),
        o = a.i(881670),
        c = a.i(745873),
        n = a.i(361975);
    let d = (0, t.createContext)({
        isAffiliateProgramLoading: !1,
        requiresActionToJoinProgram: void 0,
        compliantWithAllUserRequirements: void 0,
        creatorMetadata: void 0,
        isCurrentUserGroupOwner: void 0,
        isGroupEligible: void 0
    });
    d.displayName = "AffiliateProgram";
    let u = (0, i.withTranslation)(a => {
        let {
            children: i
        } = a, {
            user: o
        } = (0, r.useAuthentication)(), u = (0, c.useCurrentGroup)(), [m, f] = (0, t.useState)(void 0), [g, b] = (0, t.useState)(), [h, p] = (0, t.useState)(), [v, x] = (0, t.useState)(), [_, k] = (0, t.useState)(), y = (0, t.useMemo)(() => {
            var a;
            return (null != (a = null == u ? void 0 : u.id) ? a : 0) !== 0
        }, [u]), [q, S] = (0, t.useState)(void 0), w = void 0 === m || void 0 === g || void 0 === h && y, z = (0, t.useCallback)(async () => {
            try {
                if (y && (null == u ? void 0 : u.id)) {
                    let a = await (0, n.getGroupCreatorMetadata)(u.id);
                    f(a);
                    return
                }
                if (!y && (null == o ? void 0 : o.id)) {
                    let a = await (0, n.getUserCreatorMetadata)();
                    f(a);
                    return
                }
            } catch (a) {
                return
            }
            f(null)
        }, [null == u ? void 0 : u.id, y, null == o ? void 0 : o.id]), j = (0, t.useCallback)(async () => {
            if (y && q || !y) try {
                let a = await (0, n.getRequirements)();
                b(a.requirements);
                return
            } catch (a) {
                return
            }
            b(null)
        }, [q, y]), E = (0, t.useCallback)(async () => {
            if (y && (null == u ? void 0 : u.id)) try {
                let a = await (0, n.getGroupEligibility)(u.id);
                p(a.isEligible)
            } catch (a) {
                p(!1)
            }
        }, [u, y]);
        (0, t.useEffect)(() => {
            w ? k(void 0) : y && !q ? k(!1) : k(!1 === v)
        }, [y, q, v, w]), (0, t.useEffect)(() => {
            (async () => {
                if (y && (null == u ? void 0 : u.id)) {
                    var a;
                    return null == (a = (await l.default.getGroupInfo(u.id)).owner) ? void 0 : a.userId
                }
            })().then(a => {
                a && o && S(a === o.id)
            })
        }, [null == u ? void 0 : u.id, y, o]), (0, t.useEffect)(() => {
            w || !g || y && !q ? x(void 0) : x((null == g ? void 0 : g.length) === 0 || (null == g ? void 0 : g.length) === 1 && g[0] === s.Requirements.Payable)
        }, [q, y, w, g]), (0, t.useEffect)(() => {
            z()
        }, [z]), (0, t.useEffect)(() => {
            j()
        }, [j]), (0, t.useEffect)(() => {
            E()
        }, [E]);
        let M = (0, t.useMemo)(() => ({
            isAffiliateProgramLoading: w,
            requiresActionToJoinProgram: _,
            compliantWithAllUserRequirements: v,
            creatorMetadata: null != m ? m : void 0,
            requirements: null != g ? g : void 0,
            isCurrentUserGroupOwner: q,
            isGroupEligible: null != h ? h : void 0
        }), [w, _, v, m, g, q, h]);
        return (0, e.jsx)(d.Provider, {
            value: M,
            children: i
        })
    }, [o.TranslationNamespace.Organization]);
    a.s(["default", 0, u, "useAffiliateProgram", 0, function() {
        return (0, t.useContext)(d)
    }])
}, 358763, a => {
    "use strict";
    var e = a.i(416340),
        t = a.i(296380);
    let s = () => {};
    a.s(["default", 0, function(a, i) {
        let {
            debounceDelay: r,
            intersectionObserverThreshold: l,
            resetOncePer: o
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {}, c = (0, e.useRef)(!1), n = (0, e.useCallback)(a => {
            !a || c.current || (c.current = !0, i())
        }, [i]), [d] = (0, t.default)(n, null != r ? r : 250), u = (0, e.useCallback)(a => {
            let [e] = a;
            d(e.isIntersecting)
        }, [d]), m = null != o ? o : "instance";
        (0, e.useMemo)(() => {
            "callback" === m && (c.current = !1)
        }, [i]), (0, e.useEffect)(() => {
            if (!a.current) return s;
            let e = new IntersectionObserver(u, {
                threshold: null != l ? l : .5
            });
            return e.observe(a.current), () => {
                e.disconnect()
            }
        }, [a, l, u])
    }])
}, 493924, 938429, 321623, a => {
    "use strict";
    var e = a.i(221628),
        t = a.i(199834),
        s = a.i(706442),
        i = a.i(776344),
        r = a.i(462863),
        l = a.i(343885),
        o = a.i(609794),
        c = a.i(57561),
        n = a.i(509747),
        d = a.i(475555),
        u = a.i(538302),
        m = a.i(387707),
        f = a.i(262135),
        g = a.i(240731),
        b = a.i(956923),
        h = a.i(84362),
        p = a.i(214665),
        v = a.i(455506),
        x = a.i(918290),
        _ = a.i(716933),
        k = a.i(347319),
        y = a.i(543657),
        q = a.i(850412),
        S = a.i(103329),
        w = a.i(692706),
        z = a.i(405654),
        j = a.i(891409),
        E = a.i(758060),
        M = a.i(710005),
        C = a.i(495550),
        R = a.i(320429),
        A = a.i(106017),
        N = a.i(821978),
        L = a.i(766389),
        I = a.i(374717),
        T = a.i(756733),
        P = a.i(251697),
        U = a.i(411118),
        O = a.i(839596),
        B = a.i(729733),
        D = a.i(66217),
        W = a.i(148865),
        G = a.i(45512),
        F = a.i(706478),
        K = a.i(166181),
        X = a.i(37474),
        V = a.i(147189),
        J = a.i(105897),
        Q = a.i(123524),
        Z = a.i(752739),
        H = a.i(331105),
        Y = a.i(564908),
        $ = a.i(663412),
        aa = a.i(215887),
        ae = a.i(962803),
        at = a.i(914865),
        as = a.i(818392),
        ai = a.i(173034),
        ar = a.i(780078),
        al = a.i(756885),
        ao = a.i(260123),
        ac = a.i(507792),
        an = a.i(850994);
    let ad = {
        secrets: {
            light: I.default,
            dark: L.default
        },
        noPermissions: {
            light: I.default,
            dark: L.default
        },
        notifications: {
            light: V.default,
            dark: X.default
        },
        experiences: {
            light: ac.default,
            dark: ao.default
        },
        shareLinks: {
            light: ae.default,
            dark: aa.default
        },
        eventsAndUpdates: {
            light: q.default,
            dark: y.default
        },
        avatarItem: {
            light: u.default,
            dark: d.default
        },
        models: {
            light: G.default,
            dark: W.default
        },
        plugins: {
            light: K.default,
            dark: F.default
        },
        audio: {
            light: n.default,
            dark: c.default
        },
        decals: {
            light: x.default,
            dark: v.default
        },
        images: {
            light: j.default,
            dark: z.default
        },
        videos: {
            light: an.default,
            dark: al.default
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
            dark: h.default
        },
        localization: {
            light: N.default,
            dark: A.default
        },
        rightsManager: {
            light: H.default,
            dark: Z.default
        },
        tokens: {
            light: ar.default,
            dark: ai.default
        },
        chart: {
            light: R.default,
            dark: C.default
        },
        badge: {
            light: f.default,
            dark: m.default
        },
        apiKeys: {
            light: o.default,
            dark: l.default
        },
        signin: {
            light: as.default,
            dark: at.default
        },
        oAuthApps: {
            light: Q.default,
            dark: J.default
        },
        makeupLooks: {
            light: P.default,
            dark: T.default
        },
        barGraph: {
            light: b.default,
            dark: g.default
        },
        leaderboard: {
            light: M.default,
            dark: E.default
        },
        findPeople: {
            light: w.default,
            dark: S.default
        },
        managedPricing: {
            light: O.default,
            dark: U.default
        }
    };
    a.s(["default", 0, ad], 938429);
    let au = "".concat("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/assets", "/spot_illustrations"),
        am = {
            small: {
                analytics: "".concat(au, "/small/analytics.svg"),
                animations: "".concat(au, "/small/animations.svg"),
                audio: "".concat(au, "/small/audio.svg"),
                audioLight: "".concat(au, "/small/audio_light.svg"),
                audioDark: "".concat(au, "/small/audio_dark.svg"),
                avatarItem: "".concat(au, "/small/avatar_item.svg"),
                beginSearch: "".concat(au, "/small/beginSearch.svg"),
                creatorStore: "".concat(au, "/small/creator_store.svg"),
                decals: "".concat(au, "/small/decals.svg"),
                events: "".concat(au, "/small/events.svg"),
                experiences: "".concat(au, "/small/experiences.svg"),
                images: "".concat(au, "/small/images.svg"),
                meshes: "".concat(au, "/small/meshes.svg"),
                models: "".concat(au, "/small/models.svg"),
                plugins: "".concat(au, "/small/plugins.svg"),
                script: "".concat(au, "/small/script.svg"),
                song: "".concat(au, "/small/song.svg"),
                musicNote: "".concat(au, "/small/audio_music_note.svg"),
                noUsers: "".concat(au, "/small/no_users.svg"),
                user: "".concat(au, "/small/user.svg"),
                users: "".concat(au, "/small/users.svg"),
                videos: "".concat(au, "/small/videos.svg"),
                search: "".concat(au, "/small/search.svg"),
                oof: "".concat(au, "/small/oof.svg"),
                download: "".concat(au, "/small/download.svg"),
                attributes: "".concat(au, "/small/attributes.svg"),
                matchmakingSimulation: "".concat(au, "/small/matchmaking_simulation.svg")
            },
            large: {
                apiKeys: "".concat(au, "/large/api_keys.svg"),
                localization: "".concat(au, "/large/localization.svg"),
                noPermissions: "".concat(au, "/large/no_permissions.svg"),
                oAuthApps: "".concat(au, "/large/oauth_apps.svg"),
                rights: "".concat(au, "/large/rights.svg"),
                secrets: "".concat(au, "/large/secrets.svg"),
                shareLinks: "".concat(au, "/large/share_links.svg"),
                configurations: "".concat(au, "/large/configurations.svg"),
                experienceConfigs: "".concat(au, "/large/experience_configs.svg"),
                emptyExperiments: "".concat(au, "/large/empty_experiments.svg")
            }
        };
    a.s(["default", 0, am], 321623);
    let af = (0, s.makeStyles)()(() => ({
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
        ag = a => {
            let {
                illustration: t,
                size: s = "large"
            } = a, i = t && ad[t];
            if (i) return (0, e.jsx)(r.default, {
                lightSrc: i.light,
                darkSrc: i.dark,
                alt: t
            });
            let l = t ? am[s][t] : null;
            return l && (0, e.jsx)("img", {
                height: "large" === s ? 240 : 96,
                width: "large" === s ? 320 : 96,
                src: l,
                alt: t
            })
        },
        ab = a => {
            let {
                children: s,
                title: r,
                description: l,
                size: o = "large",
                illustration: c
            } = a, {
                classes: {
                    smallContainer: n,
                    largeContainer: d,
                    smallText: u,
                    largeText: m
                },
                cx: f
            } = af();
            return (0, e.jsxs)(i.default, {
                classes: {
                    root: f({
                        [n]: "small" === o,
                        [d]: "large" === o
                    })
                },
                flexDirection: "column",
                alignItems: "center",
                children: [(0, e.jsx)(ag, {
                    illustration: c,
                    size: o
                }), (0, e.jsxs)(i.default, {
                    classes: {
                        root: f({
                            [u]: "small" === o,
                            [m]: "large" === o
                        })
                    },
                    flexDirection: "column",
                    alignItems: "center",
                    children: [(0, e.jsx)(t.Typography, {
                        textAlign: "center",
                        variant: "h4",
                        color: "primary",
                        children: r
                    }), l && (0, e.jsx)(t.Typography, {
                        textAlign: "center",
                        color: "secondary",
                        children: l
                    })]
                }), s]
            })
        };
    ab.displayName = "EmptyState", a.s(["EmptyStateIllustration", 0, ag, "default", 0, ab], 493924)
}, 756568, a => {
    "use strict";
    var e = a.i(776344);
    a.s(["Flex", () => e.default])
}, 296380, a => {
    "use strict";
    var e = a.i(416340);
    let t = (a, t) => {
        let s = (0, e.useRef)(null),
            i = (0, e.useCallback)(() => {
                null !== s.current && (clearTimeout(s.current), s.current = null)
            }, [s]);
        return [(0, e.useCallback)(function() {
            for (var e = arguments.length, r = Array(e), l = 0; l < e; l++) r[l] = arguments[l];
            i(), s.current = window.setTimeout(() => {
                a(...r), s.current = null
            }, t)
        }, [a, t, i]), i, s]
    };
    a.s(["default", 0, t, "useDebouncedFunction", 0, t])
}, 780880, a => {
    "use strict";
    var e = a.i(198528);
    a.s(["useQueryParams", () => e.default])
}, 127792, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/alert_dark.1spa8ixzmujxs.svg")
}, 858517, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/alert_light.3o6_fob3g_8zu.svg")
}, 343885, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/api_key_dark.1k1v6y4zm3j28.svg")
}, 609794, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/api_key_light.06t4q4202-77s.svg")
}, 57561, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/audio_dark.16razgllw2ska.svg")
}, 509747, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/audio_light.3ra073_18pbj-.svg")
}, 475555, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/avatar_setup_dark.0orjsl7i089hc.svg")
}, 538302, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/avatar_setup_light.32r86q54d7kuh.svg")
}, 387707, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/badge_dark.3m45r-3favo3f.svg")
}, 262135, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/badge_light.3fxfvj8ub7utb.svg")
}, 240731, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/bar_graph_dark.01vf9sty52re2.svg")
}, 956923, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/bar_graph_light.1iiixo_d8ur81.svg")
}, 84362, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/collaborators_dark.30gxkwssilacj.svg")
}, 214665, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/collaborators_light.3x7fovqhay1x5.svg")
}, 455506, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/decals_dark.2jpntsljojhzc.svg")
}, 918290, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/decals_light.16_gp3tnuc5p_.svg")
}, 716933, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/envelope_dark.2-ouf9shuihi4.svg")
}, 347319, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/envelope_light.1me9hqye66z7w.svg")
}, 543657, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/event_calendar_dark.3lx4_kse68by8.svg")
}, 850412, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/event_calendar_light.1pq-t84d90ty1.svg")
}, 103329, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/find_people_dark.220q6_cs04hcq.svg")
}, 692706, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/find_people_light.1gkb3pmwc8s2n.svg")
}, 405654, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/image_dark.2giew28wx4z86.svg")
}, 891409, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/image_light.0ouq8tcgpznz7.svg")
}, 758060, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/leaderboard_dark.301ypg94lbxpv.svg")
}, 710005, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/leaderboard_light.43sjz_ibwkiq_.svg")
}, 495550, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/line_chart_dark.0k7qf3mhepo6s.svg")
}, 320429, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/line_chart_light.049gcvvmai0ax.svg")
}, 106017, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/localization_dark.1ia7wat2mwyfi.svg")
}, 821978, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/localization_light.2jss_xvx2fuq0.svg")
}, 766389, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/lockSecrets_dark.0na6naigcbnkj.svg")
}, 374717, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/lockSecrets_light.0rzix2i1i13lt.svg")
}, 756733, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/makeup_look_dark.26-5-yn8598c9.svg")
}, 251697, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/makeup_look_light.0rc05t5n5al4m.svg")
}, 411118, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/managed_pricing_dark.2zdkf2-ctboa2.svg")
}, 839596, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/managed_pricing_light.0sioq_hruq1qp.svg")
}, 729733, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/meshes_dark.2tlm50ns1pq5o.svg")
}, 66217, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/meshes_light.36wh96flp2o3r.svg")
}, 148865, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/models_dark.30suu5lj5-ua5.svg")
}, 45512, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/models_light.0kiw6k3ejw-rn.svg")
}, 706478, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/models_plugins_parts_dark.3jp6jislnsqf8.svg")
}, 166181, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/models_plugins_parts_light.2nj1xhv0bfg_u.svg")
}, 37474, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/notifications_dark.2l_rf34_xo6o8.svg")
}, 147189, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/notifications_light.3p-b4rzvwwfmj.svg")
}, 105897, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/oauth_dark.42jv8--11_1i0.svg")
}, 123524, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/oauth_light.17vwiebwrn8ox.svg")
}, 752739, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/rights_manager_dark.0m7ca17sdbgim.svg")
}, 331105, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/rights_manager_light.1moaenz1cbft0.svg")
}, 564908, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/run_dark.1sun4tvxh_arh.svg")
}, 663412, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/run_light.29f-3jyw910_v.svg")
}, 215887, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/shareLinks_dark.1l5fwuv6cgzmy.svg")
}, 962803, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/shareLinks_light.116igf-ldibmu.svg")
}, 914865, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/signin_dark.1k_gzn1-5q0ca.svg")
}, 818392, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/signin_light.1o1-jng_ct0y2.svg")
}, 173034, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/token_dark.2qy4jy9ffjhax.svg")
}, 780078, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/token_light.2xc00j5zp1q8_.svg")
}, 756885, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/video_dark.2-gdpodjtsjj3.svg")
}, 260123, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/video_game_dark.0tuxtkttj8gcu.svg")
}, 507792, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/video_game_light.3l155817mjupj.svg")
}, 850994, a => {
    a.q("https://assets.create.roblox.com/616b16189e4877a581f10847d3bbf4a74caf129a/_next/static/media/video_light.1fum3vlxctp7w.svg")
}, 270092, a => {
    "use strict";
    var e = a.i(18046),
        t = a.i(823981),
        s = a.i(688702),
        i = a.i(197649),
        r = a.i(416340);
    let l = {
            Small: "XSmall",
            Medium: "Small",
            Large: "Medium"
        },
        o = {
            Small: ["height-600", "text-label-small"],
            Medium: ["height-800", "text-label-medium"],
            Large: ["height-1000", "text-label-medium"]
        },
        c = {
            Small: "padding-left-small",
            Medium: "padding-left-medium",
            Large: "padding-left-large"
        },
        n = {
            Small: "padding-left-small",
            Medium: "padding-left-medium",
            Large: "padding-left-medium"
        },
        d = {
            Small: "padding-right-small",
            Medium: "padding-right-medium",
            Large: "padding-right-large"
        },
        u = {
            Small: "padding-right-small",
            Medium: "padding-right-medium",
            Large: "padding-right-medium"
        },
        m = {
            Small: "padding-left-xsmall",
            Medium: "padding-left-[var(--size-150)]",
            Large: "padding-left-small"
        },
        f = {
            Small: "padding-right-[var(--size-150)]",
            Medium: "padding-right-small",
            Large: "padding-right-[var(--size-250)]"
        },
        g = {
            Standard: "bg-shift-300",
            Utility: "bg-none"
        },
        b = {
            Small: "size-[var(--icon-size-xsmall)]",
            Medium: "size-[var(--icon-size-small)]",
            Large: "size-[var(--icon-size-medium)]"
        },
        h = a => {
            let {
                iconName: e,
                node: t,
                size: o
            } = a;
            return null != e ? r.default.createElement(s.Icon, {
                name: e,
                size: l[o]
            }) : null != t ? r.default.createElement("span", {
                className: (0, i.default)("inline-flex items-center justify-center shrink-0", b[o])
            }, t) : null
        },
        p = (0, r.forwardRef)((a, s) => {
            let {
                className: l,
                style: b,
                text: p,
                isDisabled: v = !1,
                size: x = "Medium",
                variant: _ = "Standard",
                leadingIconName: k,
                leadingIconNode: y,
                trailingIconName: q,
                trailingIconNode: S,
                ...w
            } = a, z = null != k || null != y, j = null != q || null != S, E = (0, i.default)(v ? t.disabledOpacity : [e.interactable, "cursor-pointer"], "relative flex justify-center items-center radius-circle stroke-none", z ? n[x] : c[x], j ? u[x] : d[x], o[x], l), M = r.default.createElement(r.default.Fragment, null, r.default.createElement(e.StateLayer, null), r.default.createElement(h, {
                iconName: k,
                node: y,
                size: x
            }), r.default.createElement("span", {
                className: (0, i.default)("padding-y-xsmall text-no-wrap text-truncate-end", z && m[x], j && f[x])
            }, p), r.default.createElement(h, {
                iconName: q,
                node: S,
                size: x
            })), C = {
                textDecoration: "none",
                ...b
            };
            if ("a" === w.as) {
                let {
                    as: a,
                    href: e,
                    ...t
                } = w;
                return r.default.createElement("a", {
                    ref: s,
                    ...t,
                    "aria-disabled": v,
                    href: v ? void 0 : e,
                    className: (0, i.default)(E, g[_], "content-action-utility"),
                    style: C
                }, M)
            }
            let {
                as: R,
                isChecked: A,
                onCheckedChange: N,
                ...L
            } = w;
            return r.default.createElement("button", {
                ref: s,
                type: "button",
                ...L,
                className: (0, i.default)(A ? "bg-inverse-surface-0" : g[_], A ? "content-inverse-emphasis" : "content-action-utility", E),
                style: C,
                "aria-pressed": A,
                disabled: v,
                onClick: null == N ? void 0 : () => N(!A)
            }, M)
        });
    a.s(["Chip", 0, p])
}, 942625, a => {
    "use strict";
    var e = a.i(197649),
        t = a.i(416340);
    let s = (0, t.forwardRef)((a, s) => {
        let {
            className: i,
            style: r,
            orientation: l = "horizontal",
            variant: o = "Standard",
            ...c
        } = a, n = "vertical" === l, d = {};
        return n || "Inset" !== o ? n || "InsetLeft" !== o ? n || "InsetRight" !== o || (d = {
            marginRight: "var(--padding-xlarge)"
        }) : d = {
            marginLeft: "var(--padding-xlarge)"
        } : d = {
            marginLeft: "var(--padding-xlarge)",
            marginRight: "var(--padding-xlarge)"
        }, t.default.createElement("div", {
            ref: s,
            ...c,
            role: "separator",
            "data-orientation": l,
            "aria-orientation": l,
            style: {
                borderRightWidth: 0,
                borderBottomWidth: 0,
                boxSizing: "border-box",
                borderStyle: "solid",
                ...n ? {
                    height: "100%",
                    width: 0,
                    borderLeftWidth: "var(--stroke-standard)",
                    borderTopWidth: 0
                } : "Thick" === o ? {
                    height: "var(--size-250)",
                    borderTop: "var(--stroke-standard)",
                    borderLeftWidth: 0,
                    background: "var(--color-common-heavydivider, rgba(0, 0, 0, 0.50))"
                } : {
                    height: 0,
                    borderTopWidth: "var(--stroke-standard)",
                    borderLeftWidth: 0
                },
                ...d,
                ...r
            },
            className: (0, e.default)("stroke-default self-stretch", i)
        })
    });
    s.displayName = "Divider", a.s(["Divider", 0, s])
}, 631719, a => {
    "use strict";
    var e = a.i(18046),
        t = a.i(823981),
        s = a.i(197649),
        i = a.i(416340),
        r = a.i(23342);
    let l = {
            Large: "size-1200",
            Medium: "size-1000",
            Small: "size-800",
            XSmall: "size-600"
        },
        o = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-700"
        },
        c = {
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
        n = {
            Emphasis: "bg-action-emphasis",
            Standard: "bg-action-standard",
            Alert: "bg-action-alert",
            Utility: "bg-action-link",
            OverMedia: "bg-over-media-0"
        },
        d = {
            Emphasis: "bg-action-standard",
            Standard: "bg-action-standard",
            Alert: "bg-action-standard",
            Utility: "bg-action-link",
            OverMedia: "bg-over-media-0"
        },
        u = {
            Emphasis: "bg-action-emphasis",
            Standard: "bg-action-standard",
            Alert: "bg-action-standard",
            Utility: "bg-shift-300",
            OverMedia: "bg-over-media-0"
        },
        m = {
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
        f = {
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
        g = (0, i.forwardRef)((a, g) => {
            let b, {
                className: h,
                icon: p,
                ariaLabel: v,
                isDisabled: x = !1,
                isCircular: _ = !1,
                isSelected: k = !1,
                size: y = "Large",
                variant: q = "Emphasis",
                iconColor: S = "Default",
                asChild: w,
                children: z,
                ...j
            } = a;
            b = x ? d[q] : k ? u[q] : n[q];
            let E = (0, s.default)("foundation-web-icon-button", x ? t.disabledOpacity : [e.interactable, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", l[y], c[y][_ ? "circular" : "square"], b, h),
                M = i.default.createElement(i.default.Fragment, null, i.default.createElement(e.StateLayer, null), i.default.createElement("span", {
                    className: (0, s.default)("icon", p, o[y], x ? f[S][q] : m[S][q])
                }));
            if (w) {
                let {
                    as: a,
                    ...e
                } = j, t = i.default.Children.only(z);
                return i.default.createElement(r.Slot, {
                    ref: g,
                    ...e,
                    className: E,
                    "aria-label": v,
                    "aria-disabled": x || void 0
                }, i.default.cloneElement(t, {}, M))
            }
            if ("a" === j.as) {
                let {
                    as: a,
                    href: e,
                    ...t
                } = j;
                return i.default.createElement("a", {
                    ref: g,
                    ...t,
                    "aria-label": v,
                    "aria-disabled": x,
                    href: x ? void 0 : e,
                    className: E
                }, M)
            }
            let {
                as: C,
                ...R
            } = j;
            return i.default.createElement("button", {
                ref: g,
                type: "button",
                ...R,
                "aria-label": v,
                disabled: x,
                className: E
            }, M)
        });
    a.s(["IconButton", 0, g])
}, 514455, a => {
    "use strict";
    var e = a.i(865800),
        t = a.i(416340),
        s = a.i(614515),
        i = a.i(993807),
        r = a.i(962560),
        l = a.i(273589),
        o = a.i(42569),
        c = a.i(696180),
        n = a.i(221628),
        d = a.i(972455),
        u = a.i(963320);

    function m(a) {
        return (0, l.g)("MuiAlertTitle", a)
    }(0, c.g)("MuiAlertTitle", ["root"]);
    let f = ["className"],
        g = (0, o.s)(d.T, {
            name: "MuiAlertTitle",
            slot: "Root",
            overridesResolver: (a, e) => e.root
        })(a => {
            let {
                theme: e
            } = a;
            return {
                fontWeight: e.typography.fontWeightMedium,
                marginTop: -2
            }
        }),
        b = t.forwardRef(function(a, e) {
            let t = (0, u.u)({
                    props: a,
                    name: "MuiAlertTitle"
                }),
                {
                    className: s
                } = t,
                i = (0, l._)(t, f),
                c = (a => {
                    let {
                        classes: e
                    } = a;
                    return (0, o.a)({
                        root: ["root"]
                    }, m, e)
                })(t);
            return (0, n.jsx)(g, (0, r._)({
                gutterBottom: !0,
                component: "div",
                ownerState: t,
                ref: e,
                className: (0, o.c)(c.root, s)
            }, i))
        });
    var h = (0, s.default)({
            name: "AlertTitle"
        })(function(a) {
            return {
                root: (0, e._)((0, e._)({}, a.typography.alertTitle), {
                    margin: "-1px 0"
                })
            }
        }),
        p = (0, t.forwardRef)(function(a, s) {
            var r = a.classes,
                l = a.className,
                o = (0, e.a)(a, ["classes", "className"]),
                c = h(void 0, {
                    props: {
                        classes: (0, i.default)(r, l)
                    }
                });
            return t.default.createElement(b, (0, e._)({}, o, {
                classes: c.classes,
                ref: s
            }))
        });
    a.s(["AlertTitle", 0, p], 514455)
}, 27281, a => {
    "use strict";
    var e = a.i(437272);
    a.s(["NavigateNextIcon", () => e.N])
}, 854705, a => {
    "use strict";
    var e = a.i(865800),
        t = a.i(416340),
        s = a.i(614515),
        i = a.i(993807),
        r = a.i(696180),
        l = a.i(273589),
        o = a.i(962560),
        c = a.i(42569),
        n = a.i(576881),
        d = a.i(751498),
        u = a.i(221628),
        m = a.i(219224),
        f = a.i(963320),
        g = a.i(275966);
    a.i(197094);
    var b = (0, d.c)((0, u.jsx)("path", {
            d: "M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8z"
        }), "RadioButtonUnchecked"),
        h = (0, d.c)((0, u.jsx)("path", {
            d: "M8.465 8.465C9.37 7.56 10.62 7 12 7C14.76 7 17 9.24 17 12C17 13.38 16.44 14.63 15.535 15.535C14.63 16.44 13.38 17 12 17C9.24 17 7 14.76 7 12C7 10.62 7.56 9.37 8.465 8.465Z"
        }), "RadioButtonChecked");
    let p = (0, c.s)("span", {
            name: "MuiRadioButtonIcon",
            shouldForwardProp: c.r
        })({
            position: "relative",
            display: "flex"
        }),
        v = (0, c.s)(b, {
            name: "MuiRadioButtonIcon"
        })({
            transform: "scale(1)"
        }),
        x = (0, c.s)(h, {
            name: "MuiRadioButtonIcon"
        })(a => {
            let {
                theme: e,
                ownerState: t
            } = a;
            return (0, o._)({
                left: 0,
                position: "absolute",
                transform: "scale(0)",
                transition: e.transitions.create("transform", {
                    easing: e.transitions.easing.easeIn,
                    duration: e.transitions.duration.shortest
                })
            }, t.checked && {
                transform: "scale(1)",
                transition: e.transitions.create("transform", {
                    easing: e.transitions.easing.easeOut,
                    duration: e.transitions.duration.shortest
                })
            })
        });

    function _(a) {
        let {
            checked: e = !1,
            classes: t = {},
            fontSize: s
        } = a, i = (0, o._)({}, a, {
            checked: e
        });
        return (0, u.jsxs)(p, {
            className: t.root,
            ownerState: i,
            children: [(0, u.jsx)(v, {
                fontSize: s,
                className: t.background,
                ownerState: i
            }), (0, u.jsx)(x, {
                fontSize: s,
                className: t.dot,
                ownerState: i
            })]
        })
    }

    function k(a) {
        return (0, l.g)("MuiRadio", a)
    }
    var y = (0, r.g)("MuiRadio", ["root", "checked", "disabled", "colorPrimary", "colorSecondary", "sizeSmall"]);
    let q = ["checked", "checkedIcon", "color", "icon", "name", "onChange", "size", "className"],
        S = (0, c.s)(n.S, {
            shouldForwardProp: a => (0, c.r)(a) || "classes" === a,
            name: "MuiRadio",
            slot: "Root",
            overridesResolver: (a, e) => {
                let {
                    ownerState: t
                } = a;
                return [e.root, "medium" !== t.size && e["size".concat((0, l.a)(t.size))], e["color".concat((0, l.a)(t.color))]]
            }
        })(a => {
            let {
                theme: e,
                ownerState: t
            } = a;
            return (0, o._)({
                color: (e.vars || e).palette.text.secondary
            }, !t.disableRipple && {
                "&:hover": {
                    backgroundColor: e.vars ? "rgba(".concat("default" === t.color ? e.vars.palette.action.activeChannel : e.vars.palette[t.color].mainChannel, " / ").concat(e.vars.palette.action.hoverOpacity, ")") : (0, l.b)("default" === t.color ? e.palette.action.active : e.palette[t.color].main, e.palette.action.hoverOpacity),
                    "@media (hover: none)": {
                        backgroundColor: "transparent"
                    }
                }
            }, "default" !== t.color && {
                ["&.".concat(y.checked)]: {
                    color: (e.vars || e).palette[t.color].main
                }
            }, {
                ["&.".concat(y.disabled)]: {
                    color: (e.vars || e).palette.action.disabled
                }
            })
        }),
        w = (0, u.jsx)(_, {
            checked: !0
        }),
        z = (0, u.jsx)(_, {}),
        j = t.forwardRef(function(a, e) {
            var s, i, r, n;
            let d = (0, f.u)({
                    props: a,
                    name: "MuiRadio"
                }),
                {
                    checked: b,
                    checkedIcon: h = w,
                    color: p = "primary",
                    icon: v = z,
                    name: x,
                    onChange: _,
                    size: y = "medium",
                    className: j
                } = d,
                E = (0, l._)(d, q),
                M = (0, o._)({}, d, {
                    color: p,
                    size: y
                }),
                C = (a => {
                    let {
                        classes: e,
                        color: t,
                        size: s
                    } = a, i = {
                        root: ["root", "color".concat((0, l.a)(t)), "medium" !== s && "size".concat((0, l.a)(s))]
                    };
                    return (0, o._)({}, e, (0, c.a)(i, k, e))
                })(M),
                R = t.useContext(m.R),
                A = b,
                N = (0, g.c)(_, R && R.onChange),
                L = x;
            return R && (void 0 === A && (r = R.value, A = "object" == typeof(n = d.value) && null !== n ? r === n : String(r) === String(n)), void 0 === L && (L = R.name)), (0, u.jsx)(S, (0, o._)({
                type: "radio",
                icon: t.cloneElement(v, {
                    fontSize: null != (s = z.props.fontSize) ? s : y
                }),
                checkedIcon: t.cloneElement(h, {
                    fontSize: null != (i = w.props.fontSize) ? i : y
                }),
                ownerState: M,
                classes: C,
                name: L,
                checked: A,
                onChange: N,
                ref: e,
                className: (0, c.c)(C.root, j)
            }, E))
        });
    var E = (0, s.default)({
            name: "Radio"
        })(function(a) {
            var e, t;
            return {
                root: {
                    color: a.palette.states.active
                },
                colorPrimary: ((e = {
                    color: a.palette.content.muted
                })["&.".concat(y.checked)] = {
                    color: a.palette.actionV2.primaryBrand.fill
                }, e),
                colorSecondary: {
                    color: a.palette.actionV2.primary.fill
                },
                disabled: ((t = {
                    color: a.palette.states.disabled
                })["&.".concat(y.colorPrimary, ".").concat(y.checked)] = {
                    color: a.palette.states.disabled
                }, t)
            }
        }),
        M = (0, t.forwardRef)(function(a, s) {
            var r = a.classes,
                l = a.color,
                o = a.inputProps,
                c = a["aria-label"],
                n = a.className,
                d = (0, e.a)(a, ["classes", "color", "inputProps", "aria-label", "className"]),
                u = E(void 0, {
                    props: {
                        classes: (0, i.default)(r, n)
                    }
                });
            return t.default.createElement(j, (0, e._)({}, d, {
                classes: u.classes,
                color: void 0 === l ? "primary" : l,
                ref: s,
                inputProps: (0, e._)({
                    "aria-label": c
                }, o)
            }))
        });
    a.s(["Radio", 0, M], 854705)
}, 219224, a => {
    "use strict";
    let e = a.i(416340).createContext(void 0);
    a.s(["R", 0, e])
}, 774807, a => {
    "use strict";
    var e = a.i(833172);
    a.s(["ArrowDownwardIcon", () => e.ArrowDownward])
}, 558826, a => {
    "use strict";
    var e = a.i(833172);
    a.s(["ArrowUpwardIcon", () => e.ArrowUpward])
}, 93235, a => {
    "use strict";
    var e = a.i(833172);
    a.s(["NavigateBeforeIcon", () => e.NavigateBefore])
}, 169923, a => {
    "use strict";
    a.s(["v", 0, {
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

//# debugId=70867429-13b9-228e-dc22-547ad8fd49c5
//# sourceMappingURL=1u5i_yqh-abkv.js.map
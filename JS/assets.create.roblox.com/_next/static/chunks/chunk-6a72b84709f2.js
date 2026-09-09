;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "f5def763-a2ce-64aa-8615-c77ff5291040")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 203450, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        s = e.i(540459),
        i = e.i(79187),
        c = e.i(814975),
        d = e.i(156071),
        r = e.i(881670),
        l = e.i(745873),
        o = e.i(361975);
    let n = (0, a.createContext)({
        isAffiliateProgramLoading: !1,
        requiresActionToJoinProgram: void 0,
        compliantWithAllUserRequirements: void 0,
        creatorMetadata: void 0,
        isCurrentUserGroupOwner: void 0,
        isGroupEligible: void 0
    });
    n.displayName = "AffiliateProgram";
    let u = (0, i.withTranslation)(e => {
        let {
            children: i
        } = e, {
            user: r
        } = (0, c.useAuthentication)(), u = (0, l.useCurrentGroup)(), [m, g] = (0, a.useState)(void 0), [b, f] = (0, a.useState)(), [h, p] = (0, a.useState)(), [v, x] = (0, a.useState)(), [_, k] = (0, a.useState)(), y = (0, a.useMemo)(() => {
            var e;
            return (null != (e = null == u ? void 0 : u.id) ? e : 0) !== 0
        }, [u]), [q, S] = (0, a.useState)(void 0), w = void 0 === m || void 0 === b || void 0 === h && y, z = (0, a.useCallback)(async () => {
            try {
                if (y && (null == u ? void 0 : u.id)) {
                    let e = await (0, o.getGroupCreatorMetadata)(u.id);
                    g(e);
                    return
                }
                if (!y && (null == r ? void 0 : r.id)) {
                    let e = await (0, o.getUserCreatorMetadata)();
                    g(e);
                    return
                }
            } catch (e) {
                return
            }
            g(null)
        }, [null == u ? void 0 : u.id, y, null == r ? void 0 : r.id]), j = (0, a.useCallback)(async () => {
            if (y && q || !y) try {
                let e = await (0, o.getRequirements)();
                f(e.requirements);
                return
            } catch (e) {
                return
            }
            f(null)
        }, [q, y]), E = (0, a.useCallback)(async () => {
            if (y && (null == u ? void 0 : u.id)) try {
                let e = await (0, o.getGroupEligibility)(u.id);
                p(e.isEligible)
            } catch (e) {
                p(!1)
            }
        }, [u, y]);
        (0, a.useEffect)(() => {
            w ? k(void 0) : y && !q ? k(!1) : k(!1 === v)
        }, [y, q, v, w]), (0, a.useEffect)(() => {
            (async () => {
                if (y && (null == u ? void 0 : u.id)) {
                    var e;
                    return null == (e = (await d.default.getGroupInfo(u.id)).owner) ? void 0 : e.userId
                }
            })().then(e => {
                e && r && S(e === r.id)
            })
        }, [null == u ? void 0 : u.id, y, r]), (0, a.useEffect)(() => {
            w || !b || y && !q ? x(void 0) : x((null == b ? void 0 : b.length) === 0 || (null == b ? void 0 : b.length) === 1 && b[0] === s.Requirements.Payable)
        }, [q, y, w, b]), (0, a.useEffect)(() => {
            z()
        }, [z]), (0, a.useEffect)(() => {
            j()
        }, [j]), (0, a.useEffect)(() => {
            E()
        }, [E]);
        let M = (0, a.useMemo)(() => ({
            isAffiliateProgramLoading: w,
            requiresActionToJoinProgram: _,
            compliantWithAllUserRequirements: v,
            creatorMetadata: null != m ? m : void 0,
            requirements: null != b ? b : void 0,
            isCurrentUserGroupOwner: q,
            isGroupEligible: null != h ? h : void 0
        }), [w, _, v, m, b, q, h]);
        return (0, t.jsx)(n.Provider, {
            value: M,
            children: i
        })
    }, [r.TranslationNamespace.Organization]);
    e.s(["default", 0, u, "useAffiliateProgram", 0, function() {
        return (0, a.useContext)(n)
    }])
}, 358763, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(296380);
    let s = () => {};
    e.s(["default", 0, function(e, i) {
        let {
            debounceDelay: c,
            intersectionObserverThreshold: d,
            resetOncePer: r
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {}, l = (0, t.useRef)(!1), o = (0, t.useCallback)(e => {
            !e || l.current || (l.current = !0, i())
        }, [i]), [n] = (0, a.default)(o, null != c ? c : 250), u = (0, t.useCallback)(e => {
            let [t] = e;
            n(t.isIntersecting)
        }, [n]), m = null != r ? r : "instance";
        (0, t.useMemo)(() => {
            "callback" === m && (l.current = !1)
        }, [i]), (0, t.useEffect)(() => {
            if (!e.current) return s;
            let t = new IntersectionObserver(u, {
                threshold: null != d ? d : .5
            });
            return t.observe(e.current), () => {
                t.disconnect()
            }
        }, [e, d, u])
    }])
}, 493924, 938429, 321623, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(199834),
        s = e.i(706442),
        i = e.i(776344),
        c = e.i(462863),
        d = e.i(343885),
        r = e.i(609794),
        l = e.i(57561),
        o = e.i(509747),
        n = e.i(475555),
        u = e.i(538302),
        m = e.i(387707),
        g = e.i(262135),
        b = e.i(240731),
        f = e.i(956923),
        h = e.i(84362),
        p = e.i(214665),
        v = e.i(455506),
        x = e.i(918290),
        _ = e.i(716933),
        k = e.i(347319),
        y = e.i(543657),
        q = e.i(850412),
        S = e.i(103329),
        w = e.i(692706),
        z = e.i(405654),
        j = e.i(891409),
        E = e.i(758060),
        M = e.i(710005),
        C = e.i(495550),
        R = e.i(320429),
        A = e.i(106017),
        N = e.i(821978),
        L = e.i(766389),
        I = e.i(374717),
        T = e.i(756733),
        P = e.i(251697),
        U = e.i(411118),
        O = e.i(839596),
        B = e.i(729733),
        D = e.i(66217),
        W = e.i(148865),
        G = e.i(45512),
        F = e.i(706478),
        K = e.i(166181),
        X = e.i(37474),
        V = e.i(147189),
        J = e.i(105897),
        Q = e.i(123524),
        Z = e.i(752739),
        H = e.i(331105),
        Y = e.i(564908),
        $ = e.i(663412),
        ee = e.i(215887),
        et = e.i(962803),
        ea = e.i(914865),
        es = e.i(818392),
        ei = e.i(173034),
        ec = e.i(780078),
        ed = e.i(756885),
        er = e.i(260123),
        el = e.i(507792),
        eo = e.i(850994);
    let en = {
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
            light: el.default,
            dark: er.default
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
            light: u.default,
            dark: n.default
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
            light: o.default,
            dark: l.default
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
            light: eo.default,
            dark: ed.default
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
            light: ec.default,
            dark: ei.default
        },
        chart: {
            light: R.default,
            dark: C.default
        },
        badge: {
            light: g.default,
            dark: m.default
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
            light: Q.default,
            dark: J.default
        },
        makeupLooks: {
            light: P.default,
            dark: T.default
        },
        barGraph: {
            light: f.default,
            dark: b.default
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
    e.s(["default", 0, en], 938429);
    let eu = "".concat("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/assets", "/spot_illustrations"),
        em = {
            small: {
                analytics: "".concat(eu, "/small/analytics.svg"),
                animations: "".concat(eu, "/small/animations.svg"),
                audio: "".concat(eu, "/small/audio.svg"),
                audioLight: "".concat(eu, "/small/audio_light.svg"),
                audioDark: "".concat(eu, "/small/audio_dark.svg"),
                avatarItem: "".concat(eu, "/small/avatar_item.svg"),
                beginSearch: "".concat(eu, "/small/beginSearch.svg"),
                creatorStore: "".concat(eu, "/small/creator_store.svg"),
                decals: "".concat(eu, "/small/decals.svg"),
                events: "".concat(eu, "/small/events.svg"),
                experiences: "".concat(eu, "/small/experiences.svg"),
                images: "".concat(eu, "/small/images.svg"),
                meshes: "".concat(eu, "/small/meshes.svg"),
                models: "".concat(eu, "/small/models.svg"),
                plugins: "".concat(eu, "/small/plugins.svg"),
                script: "".concat(eu, "/small/script.svg"),
                song: "".concat(eu, "/small/song.svg"),
                musicNote: "".concat(eu, "/small/audio_music_note.svg"),
                noUsers: "".concat(eu, "/small/no_users.svg"),
                user: "".concat(eu, "/small/user.svg"),
                users: "".concat(eu, "/small/users.svg"),
                videos: "".concat(eu, "/small/videos.svg"),
                search: "".concat(eu, "/small/search.svg"),
                oof: "".concat(eu, "/small/oof.svg"),
                download: "".concat(eu, "/small/download.svg"),
                attributes: "".concat(eu, "/small/attributes.svg"),
                matchmakingSimulation: "".concat(eu, "/small/matchmaking_simulation.svg")
            },
            large: {
                apiKeys: "".concat(eu, "/large/api_keys.svg"),
                localization: "".concat(eu, "/large/localization.svg"),
                noPermissions: "".concat(eu, "/large/no_permissions.svg"),
                oAuthApps: "".concat(eu, "/large/oauth_apps.svg"),
                rights: "".concat(eu, "/large/rights.svg"),
                secrets: "".concat(eu, "/large/secrets.svg"),
                shareLinks: "".concat(eu, "/large/share_links.svg"),
                configurations: "".concat(eu, "/large/configurations.svg"),
                experienceConfigs: "".concat(eu, "/large/experience_configs.svg"),
                emptyExperiments: "".concat(eu, "/large/empty_experiments.svg")
            }
        };
    e.s(["default", 0, em], 321623);
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
        eb = e => {
            let {
                illustration: a,
                size: s = "large"
            } = e, i = a && en[a];
            if (i) return (0, t.jsx)(c.default, {
                lightSrc: i.light,
                darkSrc: i.dark,
                alt: a
            });
            let d = a ? em[s][a] : null;
            return d && (0, t.jsx)("img", {
                height: "large" === s ? 240 : 96,
                width: "large" === s ? 320 : 96,
                src: d,
                alt: a
            })
        },
        ef = e => {
            let {
                children: s,
                title: c,
                description: d,
                size: r = "large",
                illustration: l
            } = e, {
                classes: {
                    smallContainer: o,
                    largeContainer: n,
                    smallText: u,
                    largeText: m
                },
                cx: g
            } = eg();
            return (0, t.jsxs)(i.default, {
                classes: {
                    root: g({
                        [o]: "small" === r,
                        [n]: "large" === r
                    })
                },
                flexDirection: "column",
                alignItems: "center",
                children: [(0, t.jsx)(eb, {
                    illustration: l,
                    size: r
                }), (0, t.jsxs)(i.default, {
                    classes: {
                        root: g({
                            [u]: "small" === r,
                            [m]: "large" === r
                        })
                    },
                    flexDirection: "column",
                    alignItems: "center",
                    children: [(0, t.jsx)(a.Typography, {
                        textAlign: "center",
                        variant: "h4",
                        color: "primary",
                        children: c
                    }), d && (0, t.jsx)(a.Typography, {
                        textAlign: "center",
                        color: "secondary",
                        children: d
                    })]
                }), s]
            })
        };
    ef.displayName = "EmptyState", e.s(["EmptyStateIllustration", 0, eb, "default", 0, ef], 493924)
}, 756568, e => {
    "use strict";
    var t = e.i(776344);
    e.s(["Flex", () => t.default])
}, 296380, e => {
    "use strict";
    var t = e.i(416340);
    let a = (e, a) => {
        let s = (0, t.useRef)(null),
            i = (0, t.useCallback)(() => {
                null !== s.current && (clearTimeout(s.current), s.current = null)
            }, [s]);
        return [(0, t.useCallback)(function() {
            for (var t = arguments.length, c = Array(t), d = 0; d < t; d++) c[d] = arguments[d];
            i(), s.current = window.setTimeout(() => {
                e(...c), s.current = null
            }, a)
        }, [e, a, i]), i, s]
    };
    e.s(["default", 0, a, "useDebouncedFunction", 0, a])
}, 780880, e => {
    "use strict";
    var t = e.i(198528);
    e.s(["useQueryParams", () => t.default])
}, 127792, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/alert_dark.1spa8ixzmujxs.svg")
}, 858517, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/alert_light.3o6_fob3g_8zu.svg")
}, 343885, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/api_key_dark.1k1v6y4zm3j28.svg")
}, 609794, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/api_key_light.06t4q4202-77s.svg")
}, 57561, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/audio_dark.16razgllw2ska.svg")
}, 509747, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/audio_light.3ra073_18pbj-.svg")
}, 475555, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/avatar_setup_dark.0orjsl7i089hc.svg")
}, 538302, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/avatar_setup_light.32r86q54d7kuh.svg")
}, 387707, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/badge_dark.3m45r-3favo3f.svg")
}, 262135, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/badge_light.3fxfvj8ub7utb.svg")
}, 240731, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/bar_graph_dark.01vf9sty52re2.svg")
}, 956923, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/bar_graph_light.1iiixo_d8ur81.svg")
}, 84362, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/collaborators_dark.30gxkwssilacj.svg")
}, 214665, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/collaborators_light.3x7fovqhay1x5.svg")
}, 455506, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/decals_dark.2jpntsljojhzc.svg")
}, 918290, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/decals_light.16_gp3tnuc5p_.svg")
}, 716933, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/envelope_dark.2-ouf9shuihi4.svg")
}, 347319, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/envelope_light.1me9hqye66z7w.svg")
}, 543657, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/event_calendar_dark.3lx4_kse68by8.svg")
}, 850412, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/event_calendar_light.1pq-t84d90ty1.svg")
}, 103329, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/find_people_dark.220q6_cs04hcq.svg")
}, 692706, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/find_people_light.1gkb3pmwc8s2n.svg")
}, 405654, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/image_dark.2giew28wx4z86.svg")
}, 891409, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/image_light.0ouq8tcgpznz7.svg")
}, 758060, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/leaderboard_dark.301ypg94lbxpv.svg")
}, 710005, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/leaderboard_light.43sjz_ibwkiq_.svg")
}, 495550, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/line_chart_dark.0k7qf3mhepo6s.svg")
}, 320429, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/line_chart_light.049gcvvmai0ax.svg")
}, 106017, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/localization_dark.1ia7wat2mwyfi.svg")
}, 821978, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/localization_light.2jss_xvx2fuq0.svg")
}, 766389, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/lockSecrets_dark.0na6naigcbnkj.svg")
}, 374717, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/lockSecrets_light.0rzix2i1i13lt.svg")
}, 756733, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/makeup_look_dark.26-5-yn8598c9.svg")
}, 251697, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/makeup_look_light.0rc05t5n5al4m.svg")
}, 411118, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/managed_pricing_dark.2zdkf2-ctboa2.svg")
}, 839596, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/managed_pricing_light.0sioq_hruq1qp.svg")
}, 729733, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/meshes_dark.2tlm50ns1pq5o.svg")
}, 66217, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/meshes_light.36wh96flp2o3r.svg")
}, 148865, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/models_dark.30suu5lj5-ua5.svg")
}, 45512, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/models_light.0kiw6k3ejw-rn.svg")
}, 706478, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/models_plugins_parts_dark.3jp6jislnsqf8.svg")
}, 166181, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/models_plugins_parts_light.2nj1xhv0bfg_u.svg")
}, 37474, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/notifications_dark.2l_rf34_xo6o8.svg")
}, 147189, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/notifications_light.3p-b4rzvwwfmj.svg")
}, 105897, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/oauth_dark.42jv8--11_1i0.svg")
}, 123524, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/oauth_light.17vwiebwrn8ox.svg")
}, 752739, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/rights_manager_dark.0m7ca17sdbgim.svg")
}, 331105, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/rights_manager_light.1moaenz1cbft0.svg")
}, 564908, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/run_dark.1sun4tvxh_arh.svg")
}, 663412, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/run_light.29f-3jyw910_v.svg")
}, 215887, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/shareLinks_dark.1l5fwuv6cgzmy.svg")
}, 962803, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/shareLinks_light.116igf-ldibmu.svg")
}, 914865, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/signin_dark.1k_gzn1-5q0ca.svg")
}, 818392, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/signin_light.1o1-jng_ct0y2.svg")
}, 173034, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/token_dark.2qy4jy9ffjhax.svg")
}, 780078, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/token_light.2xc00j5zp1q8_.svg")
}, 756885, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/video_dark.2-gdpodjtsjj3.svg")
}, 260123, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/video_game_dark.0tuxtkttj8gcu.svg")
}, 507792, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/video_game_light.3l155817mjupj.svg")
}, 850994, e => {
    e.q("https://assets.create.roblox.com/428c92a1cac2dcbdeb15453700deb05dc8dd145f/_next/static/media/video_light.1fum3vlxctp7w.svg")
}, 270092, e => {
    "use strict";
    var t = e.i(18046),
        a = e.i(823981),
        s = e.i(688702),
        i = e.i(197649),
        c = e.i(416340);
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
        l = {
            Small: "padding-left-small",
            Medium: "padding-left-medium",
            Large: "padding-left-large"
        },
        o = {
            Small: "padding-left-small",
            Medium: "padding-left-medium",
            Large: "padding-left-medium"
        },
        n = {
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
        g = {
            Small: "padding-right-[var(--size-150)]",
            Medium: "padding-right-small",
            Large: "padding-right-[var(--size-250)]"
        },
        b = {
            Standard: "bg-shift-300",
            Utility: "bg-none"
        },
        f = {
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
            return null != t ? c.default.createElement(s.Icon, {
                name: t,
                size: d[r]
            }) : null != a ? c.default.createElement("span", {
                className: (0, i.default)("inline-flex items-center justify-center shrink-0", f[r])
            }, a) : null
        },
        p = (0, c.forwardRef)((e, s) => {
            let {
                className: d,
                style: f,
                text: p,
                isDisabled: v = !1,
                size: x = "Medium",
                variant: _ = "Standard",
                leadingIconName: k,
                leadingIconNode: y,
                trailingIconName: q,
                trailingIconNode: S,
                ...w
            } = e, z = null != k || null != y, j = null != q || null != S, E = (0, i.default)(v ? a.disabledOpacity : [t.interactable, "cursor-pointer"], "relative flex justify-center items-center radius-circle stroke-none", z ? o[x] : l[x], j ? u[x] : n[x], r[x], d), M = c.default.createElement(c.default.Fragment, null, c.default.createElement(t.StateLayer, null), c.default.createElement(h, {
                iconName: k,
                node: y,
                size: x
            }), c.default.createElement("span", {
                className: (0, i.default)("padding-y-xsmall text-no-wrap text-truncate-end", z && m[x], j && g[x])
            }, p), c.default.createElement(h, {
                iconName: q,
                node: S,
                size: x
            })), C = {
                textDecoration: "none",
                ...f
            };
            if ("a" === w.as) {
                let {
                    as: e,
                    href: t,
                    ...a
                } = w;
                return c.default.createElement("a", {
                    ref: s,
                    ...a,
                    "aria-disabled": v,
                    href: v ? void 0 : t,
                    className: (0, i.default)(E, b[_], "content-action-utility"),
                    style: C
                }, M)
            }
            let {
                as: R,
                isChecked: A,
                onCheckedChange: N,
                ...L
            } = w;
            return c.default.createElement("button", {
                ref: s,
                type: "button",
                ...L,
                className: (0, i.default)(A ? "bg-inverse-surface-0" : b[_], A ? "content-inverse-emphasis" : "content-action-utility", E),
                style: C,
                "aria-pressed": A,
                disabled: v,
                onClick: null == N ? void 0 : () => N(!A)
            }, M)
        });
    e.s(["Chip", 0, p])
}, 942625, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340);
    let s = (0, a.forwardRef)((e, s) => {
        let {
            className: i,
            style: c,
            orientation: d = "horizontal",
            variant: r = "Standard",
            ...l
        } = e, o = "vertical" === d, n = {};
        return o || "Inset" !== r ? o || "InsetLeft" !== r ? o || "InsetRight" !== r || (n = {
            marginRight: "var(--padding-xlarge)"
        }) : n = {
            marginLeft: "var(--padding-xlarge)"
        } : n = {
            marginLeft: "var(--padding-xlarge)",
            marginRight: "var(--padding-xlarge)"
        }, a.default.createElement("div", {
            ref: s,
            ...l,
            role: "separator",
            "data-orientation": d,
            "aria-orientation": d,
            style: {
                borderRightWidth: 0,
                borderBottomWidth: 0,
                boxSizing: "border-box",
                borderStyle: "solid",
                ...o ? {
                    height: "100%",
                    width: 0,
                    borderLeftWidth: "var(--stroke-standard)",
                    borderTopWidth: 0
                } : "Thick" === r ? {
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
}, 631719, e => {
    "use strict";
    var t = e.i(18046),
        a = e.i(823981),
        s = e.i(197649),
        i = e.i(416340),
        c = e.i(23342);
    let d = {
            Large: "size-1200",
            Medium: "size-1000",
            Small: "size-800",
            XSmall: "size-600"
        },
        r = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-700"
        },
        l = {
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
        o = {
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
            let f, {
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
            } = e;
            f = x ? n[q] : k ? u[q] : o[q];
            let E = (0, s.default)("foundation-web-icon-button", x ? a.disabledOpacity : [t.interactable, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", d[y], l[y][_ ? "circular" : "square"], f, h),
                M = i.default.createElement(i.default.Fragment, null, i.default.createElement(t.StateLayer, null), i.default.createElement("span", {
                    className: (0, s.default)("icon", p, r[y], x ? g[S][q] : m[S][q])
                }));
            if (w) {
                let {
                    as: e,
                    ...t
                } = j, a = i.default.Children.only(z);
                return i.default.createElement(c.Slot, {
                    ref: b,
                    ...t,
                    className: E,
                    "aria-label": v,
                    "aria-disabled": x || void 0
                }, i.default.cloneElement(a, {}, M))
            }
            if ("a" === j.as) {
                let {
                    as: e,
                    href: t,
                    ...a
                } = j;
                return i.default.createElement("a", {
                    ref: b,
                    ...a,
                    "aria-label": v,
                    "aria-disabled": x,
                    href: x ? void 0 : t,
                    className: E
                }, M)
            }
            let {
                as: C,
                ...R
            } = j;
            return i.default.createElement("button", {
                ref: b,
                type: "button",
                ...R,
                "aria-label": v,
                disabled: x,
                className: E
            }, M)
        });
    e.s(["IconButton", 0, b])
}, 514455, e => {
    "use strict";
    var t = e.i(865800),
        a = e.i(416340),
        s = e.i(614515),
        i = e.i(993807),
        c = e.i(962560),
        d = e.i(273589),
        r = e.i(42569),
        l = e.i(696180),
        o = e.i(221628),
        n = e.i(972455),
        u = e.i(963320);

    function m(e) {
        return (0, d.g)("MuiAlertTitle", e)
    }(0, l.g)("MuiAlertTitle", ["root"]);
    let g = ["className"],
        b = (0, r.s)(n.T, {
            name: "MuiAlertTitle",
            slot: "Root",
            overridesResolver: (e, t) => t.root
        })(e => {
            let {
                theme: t
            } = e;
            return {
                fontWeight: t.typography.fontWeightMedium,
                marginTop: -2
            }
        }),
        f = a.forwardRef(function(e, t) {
            let a = (0, u.u)({
                    props: e,
                    name: "MuiAlertTitle"
                }),
                {
                    className: s
                } = a,
                i = (0, d._)(a, g),
                l = (e => {
                    let {
                        classes: t
                    } = e;
                    return (0, r.a)({
                        root: ["root"]
                    }, m, t)
                })(a);
            return (0, o.jsx)(b, (0, c._)({
                gutterBottom: !0,
                component: "div",
                ownerState: a,
                ref: t,
                className: (0, r.c)(l.root, s)
            }, i))
        });
    var h = (0, s.default)({
            name: "AlertTitle"
        })(function(e) {
            return {
                root: (0, t._)((0, t._)({}, e.typography.alertTitle), {
                    margin: "-1px 0"
                })
            }
        }),
        p = (0, a.forwardRef)(function(e, s) {
            var c = e.classes,
                d = e.className,
                r = (0, t.a)(e, ["classes", "className"]),
                l = h(void 0, {
                    props: {
                        classes: (0, i.default)(c, d)
                    }
                });
            return a.default.createElement(f, (0, t._)({}, r, {
                classes: l.classes,
                ref: s
            }))
        });
    e.s(["AlertTitle", 0, p], 514455)
}, 27281, e => {
    "use strict";
    var t = e.i(437272);
    e.s(["NavigateNextIcon", () => t.N])
}, 854705, e => {
    "use strict";
    var t = e.i(865800),
        a = e.i(416340),
        s = e.i(614515),
        i = e.i(993807),
        c = e.i(696180),
        d = e.i(273589),
        r = e.i(962560),
        l = e.i(42569),
        o = e.i(576881),
        n = e.i(751498),
        u = e.i(221628),
        m = e.i(219224),
        g = e.i(963320),
        b = e.i(275966);
    e.i(197094);
    var f = (0, n.c)((0, u.jsx)("path", {
            d: "M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8z"
        }), "RadioButtonUnchecked"),
        h = (0, n.c)((0, u.jsx)("path", {
            d: "M8.465 8.465C9.37 7.56 10.62 7 12 7C14.76 7 17 9.24 17 12C17 13.38 16.44 14.63 15.535 15.535C14.63 16.44 13.38 17 12 17C9.24 17 7 14.76 7 12C7 10.62 7.56 9.37 8.465 8.465Z"
        }), "RadioButtonChecked");
    let p = (0, l.s)("span", {
            name: "MuiRadioButtonIcon",
            shouldForwardProp: l.r
        })({
            position: "relative",
            display: "flex"
        }),
        v = (0, l.s)(f, {
            name: "MuiRadioButtonIcon"
        })({
            transform: "scale(1)"
        }),
        x = (0, l.s)(h, {
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
        } = e, i = (0, r._)({}, e, {
            checked: t
        });
        return (0, u.jsxs)(p, {
            className: a.root,
            ownerState: i,
            children: [(0, u.jsx)(v, {
                fontSize: s,
                className: a.background,
                ownerState: i
            }), (0, u.jsx)(x, {
                fontSize: s,
                className: a.dot,
                ownerState: i
            })]
        })
    }

    function k(e) {
        return (0, d.g)("MuiRadio", e)
    }
    var y = (0, c.g)("MuiRadio", ["root", "checked", "disabled", "colorPrimary", "colorSecondary", "sizeSmall"]);
    let q = ["checked", "checkedIcon", "color", "icon", "name", "onChange", "size", "className"],
        S = (0, l.s)(o.S, {
            shouldForwardProp: e => (0, l.r)(e) || "classes" === e,
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
        w = (0, u.jsx)(_, {
            checked: !0
        }),
        z = (0, u.jsx)(_, {}),
        j = a.forwardRef(function(e, t) {
            var s, i, c, o;
            let n = (0, g.u)({
                    props: e,
                    name: "MuiRadio"
                }),
                {
                    checked: f,
                    checkedIcon: h = w,
                    color: p = "primary",
                    icon: v = z,
                    name: x,
                    onChange: _,
                    size: y = "medium",
                    className: j
                } = n,
                E = (0, d._)(n, q),
                M = (0, r._)({}, n, {
                    color: p,
                    size: y
                }),
                C = (e => {
                    let {
                        classes: t,
                        color: a,
                        size: s
                    } = e, i = {
                        root: ["root", "color".concat((0, d.a)(a)), "medium" !== s && "size".concat((0, d.a)(s))]
                    };
                    return (0, r._)({}, t, (0, l.a)(i, k, t))
                })(M),
                R = a.useContext(m.R),
                A = f,
                N = (0, b.c)(_, R && R.onChange),
                L = x;
            return R && (void 0 === A && (c = R.value, A = "object" == typeof(o = n.value) && null !== o ? c === o : String(c) === String(o)), void 0 === L && (L = R.name)), (0, u.jsx)(S, (0, r._)({
                type: "radio",
                icon: a.cloneElement(v, {
                    fontSize: null != (s = z.props.fontSize) ? s : y
                }),
                checkedIcon: a.cloneElement(h, {
                    fontSize: null != (i = w.props.fontSize) ? i : y
                }),
                ownerState: M,
                classes: C,
                name: L,
                checked: A,
                onChange: N,
                ref: t,
                className: (0, l.c)(C.root, j)
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
        M = (0, a.forwardRef)(function(e, s) {
            var c = e.classes,
                d = e.color,
                r = e.inputProps,
                l = e["aria-label"],
                o = e.className,
                n = (0, t.a)(e, ["classes", "color", "inputProps", "aria-label", "className"]),
                u = E(void 0, {
                    props: {
                        classes: (0, i.default)(c, o)
                    }
                });
            return a.default.createElement(j, (0, t._)({}, n, {
                classes: u.classes,
                color: void 0 === d ? "primary" : d,
                ref: s,
                inputProps: (0, t._)({
                    "aria-label": l
                }, r)
            }))
        });
    e.s(["Radio", 0, M], 854705)
}, 219224, e => {
    "use strict";
    let t = e.i(416340).createContext(void 0);
    e.s(["R", 0, t])
}, 774807, e => {
    "use strict";
    var t = e.i(833172);
    e.s(["ArrowDownwardIcon", () => t.ArrowDownward])
}, 558826, e => {
    "use strict";
    var t = e.i(833172);
    e.s(["ArrowUpwardIcon", () => t.ArrowUpward])
}, 93235, e => {
    "use strict";
    var t = e.i(833172);
    e.s(["NavigateBeforeIcon", () => t.NavigateBefore])
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

//# debugId=f5def763-a2ce-64aa-8615-c77ff5291040
//# sourceMappingURL=0uzh3gxs6vfkm.js.map
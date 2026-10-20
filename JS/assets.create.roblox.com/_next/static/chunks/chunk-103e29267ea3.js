;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "58dfc1e1-1bd0-c6f3-1649-3ea4a2478fef")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 493924, 938429, 321623, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(623983),
        i = e.i(697973),
        r = e.i(776344),
        n = e.i(462863),
        s = e.i(343885),
        o = e.i(609794),
        l = e.i(57561),
        c = e.i(509747),
        u = e.i(475555),
        d = e.i(538302),
        f = e.i(387707),
        p = e.i(262135),
        h = e.i(240731),
        m = e.i(956923),
        v = e.i(84362),
        g = e.i(214665),
        b = e.i(455506),
        k = e.i(918290),
        y = e.i(716933),
        x = e.i(347319),
        w = e.i(543657),
        L = e.i(850412),
        q = e.i(103329),
        R = e.i(692706),
        A = e.i(405654),
        _ = e.i(891409),
        C = e.i(758060),
        I = e.i(710005),
        P = e.i(495550),
        U = e.i(320429),
        S = e.i(106017),
        B = e.i(821978),
        T = e.i(766389),
        E = e.i(374717),
        j = e.i(756733),
        G = e.i(251697),
        N = e.i(411118),
        z = e.i(839596),
        O = e.i(729733),
        M = e.i(66217),
        D = e.i(148865),
        K = e.i(45512),
        J = e.i(706478),
        W = e.i(166181),
        F = e.i(37474),
        Q = e.i(147189),
        V = e.i(105897),
        H = e.i(123524),
        X = e.i(752739),
        Z = e.i(331105),
        Y = e.i(564908),
        $ = e.i(663412),
        ee = e.i(215887),
        et = e.i(962803),
        ea = e.i(914865),
        ei = e.i(818392),
        er = e.i(173034),
        en = e.i(780078),
        es = e.i(756885),
        eo = e.i(260123),
        el = e.i(507792),
        ec = e.i(850994);
    let eu = {
        secrets: {
            light: E.default,
            dark: T.default
        },
        noPermissions: {
            light: E.default,
            dark: T.default
        },
        notifications: {
            light: Q.default,
            dark: F.default
        },
        experiences: {
            light: el.default,
            dark: eo.default
        },
        shareLinks: {
            light: et.default,
            dark: ee.default
        },
        eventsAndUpdates: {
            light: L.default,
            dark: w.default
        },
        avatarItem: {
            light: d.default,
            dark: u.default
        },
        models: {
            light: K.default,
            dark: D.default
        },
        plugins: {
            light: W.default,
            dark: J.default
        },
        audio: {
            light: c.default,
            dark: l.default
        },
        decals: {
            light: k.default,
            dark: b.default
        },
        images: {
            light: _.default,
            dark: A.default
        },
        videos: {
            light: ec.default,
            dark: es.default
        },
        meshes: {
            light: M.default,
            dark: O.default
        },
        animations: {
            light: $.default,
            dark: Y.default
        },
        textDocuments: {
            light: x.default,
            dark: y.default
        },
        noUsers: {
            light: g.default,
            dark: v.default
        },
        localization: {
            light: B.default,
            dark: S.default
        },
        rightsManager: {
            light: Z.default,
            dark: X.default
        },
        tokens: {
            light: en.default,
            dark: er.default
        },
        chart: {
            light: U.default,
            dark: P.default
        },
        badge: {
            light: p.default,
            dark: f.default
        },
        apiKeys: {
            light: o.default,
            dark: s.default
        },
        signin: {
            light: ei.default,
            dark: ea.default
        },
        oAuthApps: {
            light: H.default,
            dark: V.default
        },
        makeupLooks: {
            light: G.default,
            dark: j.default
        },
        barGraph: {
            light: m.default,
            dark: h.default
        },
        leaderboard: {
            light: I.default,
            dark: C.default
        },
        findPeople: {
            light: R.default,
            dark: q.default
        },
        managedPricing: {
            light: z.default,
            dark: N.default
        }
    };
    e.s(["default", 0, eu], 938429);
    let ed = "".concat("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/assets", "/spot_illustrations"),
        ef = {
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
    e.s(["default", 0, ef], 321623);
    let ep = (0, i.makeStyles)()(() => ({
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
        eh = e => {
            let {
                illustration: a,
                size: i = "large"
            } = e, r = a && eu[a];
            if (r) return (0, t.jsx)(n.default, {
                lightSrc: r.light,
                darkSrc: r.dark,
                alt: a
            });
            let s = a ? ef[i][a] : null;
            return s && (0, t.jsx)("img", {
                height: "large" === i ? 240 : 96,
                width: "large" === i ? 320 : 96,
                src: s,
                alt: a
            })
        },
        em = e => {
            let {
                children: i,
                title: n,
                description: s,
                size: o = "large",
                illustration: l
            } = e, {
                classes: {
                    smallContainer: c,
                    largeContainer: u,
                    smallText: d,
                    largeText: f
                },
                cx: p
            } = ep();
            return (0, t.jsxs)(r.default, {
                classes: {
                    root: p({
                        [c]: "small" === o,
                        [u]: "large" === o
                    })
                },
                flexDirection: "column",
                alignItems: "center",
                children: [(0, t.jsx)(eh, {
                    illustration: l,
                    size: o
                }), (0, t.jsxs)(r.default, {
                    classes: {
                        root: p({
                            [d]: "small" === o,
                            [f]: "large" === o
                        })
                    },
                    flexDirection: "column",
                    alignItems: "center",
                    children: [(0, t.jsx)(a.Typography, {
                        textAlign: "center",
                        variant: "h4",
                        color: "primary",
                        children: n
                    }), s && (0, t.jsx)(a.Typography, {
                        textAlign: "center",
                        color: "secondary",
                        children: s
                    })]
                }), i]
            })
        };
    em.displayName = "EmptyState", e.s(["EmptyStateIllustration", 0, eh, "default", 0, em], 493924)
}, 756568, e => {
    "use strict";
    var t = e.i(776344);
    e.s(["Flex", () => t.default])
}, 338653, 540459, e => {
    "use strict";
    var t = e.i(677753),
        a = function(e, t) {
            return (a = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var a in t) Object.prototype.hasOwnProperty.call(t, a) && (e[a] = t[a])
            })(e, t)
        };

    function i(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function i() {
            this.constructor = e
        }
        a(e, t), e.prototype = null === t ? Object.create(t) : (i.prototype = t.prototype, new i)
    }

    function r(e, t, a, i) {
        return new(a || (a = Promise))(function(r, n) {
            function s(e) {
                try {
                    l(i.next(e))
                } catch (e) {
                    n(e)
                }
            }

            function o(e) {
                try {
                    l(i.throw(e))
                } catch (e) {
                    n(e)
                }
            }

            function l(e) {
                var t;
                e.done ? r(e.value) : ((t = e.value) instanceof a ? t : new a(function(e) {
                    e(t)
                })).then(s, o)
            }
            l((i = i.apply(e, t || [])).next())
        })
    }

    function n(e, t) {
        var a, i, r, n = {
                label: 0,
                sent: function() {
                    if (1 & r[0]) throw r[1];
                    return r[1]
                },
                trys: [],
                ops: []
            },
            s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return s.next = o(0), s.throw = o(1), s.return = o(2), "function" == typeof Symbol && (s[Symbol.iterator] = function() {
            return this
        }), s;

        function o(o) {
            return function(l) {
                var c = [o, l];
                if (a) throw TypeError("Generator is already executing.");
                for (; s && (s = 0, c[0] && (n = 0)), n;) try {
                    if (a = 1, i && (r = 2 & c[0] ? i.return : c[0] ? i.throw || ((r = i.return) && r.call(i), 0) : i.next) && !(r = r.call(i, c[1])).done) return r;
                    switch (i = 0, r && (c = [2 & c[0], r.value]), c[0]) {
                        case 0:
                        case 1:
                            r = c;
                            break;
                        case 4:
                            return n.label++, {
                                value: c[1],
                                done: !1
                            };
                        case 5:
                            n.label++, i = c[1], c = [0];
                            continue;
                        case 7:
                            c = n.ops.pop(), n.trys.pop();
                            continue;
                        default:
                            if (!(r = (r = n.trys).length > 0 && r[r.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                n = 0;
                                continue
                            }
                            if (3 === c[0] && (!r || c[1] > r[0] && c[1] < r[3])) {
                                n.label = c[1];
                                break
                            }
                            if (6 === c[0] && n.label < r[1]) {
                                n.label = r[1], r = c;
                                break
                            }
                            if (r && n.label < r[2]) {
                                n.label = r[2], n.ops.push(c);
                                break
                            }
                            r[2] && n.ops.pop(), n.trys.pop();
                            continue
                    }
                    c = t.call(e, n)
                } catch (e) {
                    c = [6, e], i = 0
                } finally {
                    a = r = 0
                }
                if (5 & c[0]) throw c[1];
                return {
                    value: c[0] ? c[1] : void 0,
                    done: !0
                }
            }
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function s(e, t) {
        return null == e ? e : {
            universeId: e.universeId,
            universeName: e.universeName,
            rootPlaceId: e.rootPlaceId
        }
    }

    function o(e) {
        var a;
        return null == (a = e) ? a : {
            campaignName: a.campaignName,
            linkId: a.linkId,
            linkType: a.linkType,
            createdUtc: new Date(a.createdUtc),
            updatedUtc: new Date(a.updatedUtc),
            universe: (0, t.exists)(a, "universe") ? s(a.universe) : void 0,
            referralCode: a.referralCode,
            referralCodeType: a.referralCodeType,
            launchData: (0, t.exists)(a, "launchData") ? a.launchData : void 0,
            creatorKey: (0, t.exists)(a, "creatorKey") ? a.creatorKey : void 0,
            creatorType: (0, t.exists)(a, "creatorType") ? a.creatorType : void 0,
            fallbackType: (0, t.exists)(a, "fallbackType") ? a.fallbackType : void 0
        }
    }

    function l(e) {
        if (void 0 !== e) return null === e ? null : {
            universeId: e.universeId,
            campaignName: e.campaignName,
            launchData: e.launchData,
            fallbackType: e.fallbackType
        }
    }

    function c(e) {
        if (void 0 !== e) return null === e ? null : {
            linkId: e.linkId,
            universeId: e.universeId,
            launchData: e.launchData,
            newOwnerId: e.newOwnerId,
            newOwnerType: e.newOwnerType,
            fallbackType: e.fallbackType
        }
    }

    function u(e, a) {
        return null == e ? e : {
            campaignName: e.campaignName,
            linkId: e.linkId,
            linkType: e.linkType,
            createdUtc: new Date(e.createdUtc),
            updatedUtc: new Date(e.updatedUtc),
            universe: (0, t.exists)(e, "universe") ? s(e.universe) : void 0,
            referralCode: e.referralCode,
            referralCodeType: e.referralCodeType,
            launchData: (0, t.exists)(e, "launchData") ? e.launchData : void 0,
            creatorKey: (0, t.exists)(e, "creatorKey") ? e.creatorKey : void 0,
            creatorType: (0, t.exists)(e, "creatorType") ? e.creatorType : void 0,
            fallbackType: (0, t.exists)(e, "fallbackType") ? e.fallbackType : void 0
        }
    }

    function d(e, t) {
        return null == e ? e : {
            affiliateLink: u(e.affiliateLink)
        }
    }

    function f(e) {
        if (void 0 !== e) return null === e ? null : {
            creatorId: e.creatorId,
            creatorType: e.creatorType
        }
    }

    function p(e, a) {
        return null == e ? e : {
            experienceEventId: (0, t.exists)(e, "experienceEventId") ? e.experienceEventId : void 0,
            launchData: (0, t.exists)(e, "launchData") ? e.launchData : void 0
        }
    }

    function h(e, t) {
        return null == e ? e : {
            isEligibleToCreate: e.isEligibleToCreate,
            isAllowedToCreateForAnyExperience: e.isAllowedToCreateForAnyExperience
        }
    }

    function m(e) {
        return e
    }

    function v(e, a) {
        return null == e ? e : {
            affiliateLinks: e.affiliateLinks.map(o),
            totalCount: e.totalCount,
            nextPageToken: (0, t.exists)(e, "nextPageToken") ? e.nextPageToken : void 0
        }
    }

    function g(e, t) {
        return null == e ? e : {
            affiliateLink: u(e.affiliateLink)
        }
    }
    var b = function(e) {
        function a() {
            return null !== e && e.apply(this, arguments) || this
        }
        return i(a, e), a.prototype.affiliateLinksCreateAffiliateLinkByGroupRaw = function(e, a) {
            return r(this, void 0, void 0, function() {
                var i, r, s;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new t.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling affiliateLinksCreateAffiliateLinkByGroup.");
                            if (null === e.affiliateLinksCreateAffiliateLinkByUserRequest || void 0 === e.affiliateLinksCreateAffiliateLinkByUserRequest) throw new t.RequiredError("affiliateLinksCreateAffiliateLinkByUserRequest", "Required parameter requestParameters.affiliateLinksCreateAffiliateLinkByUserRequest was null or undefined when calling affiliateLinksCreateAffiliateLinkByGroup.");
                            return i = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/groups/{groupId}/links".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/links",
                                method: "POST",
                                headers: r,
                                query: i,
                                body: l(e.affiliateLinksCreateAffiliateLinkByUserRequest)
                            }, a)];
                        case 1:
                            return s = n.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return d(e)
                            })]
                    }
                })
            })
        }, a.prototype.affiliateLinksCreateAffiliateLinkByGroup = function(e, t) {
            return r(this, void 0, void 0, function() {
                return n(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.affiliateLinksCreateAffiliateLinkByGroupRaw(e, t)];
                        case 1:
                            return [4, a.sent().value()];
                        case 2:
                            return [2, a.sent()]
                    }
                })
            })
        }, a.prototype.affiliateLinksCreateAffiliateLinkByUserRaw = function(e, a) {
            return r(this, void 0, void 0, function() {
                var i, r, s;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.affiliateLinksCreateAffiliateLinkByUserRequest || void 0 === e.affiliateLinksCreateAffiliateLinkByUserRequest) throw new t.RequiredError("affiliateLinksCreateAffiliateLinkByUserRequest", "Required parameter requestParameters.affiliateLinksCreateAffiliateLinkByUserRequest was null or undefined when calling affiliateLinksCreateAffiliateLinkByUser.");
                            return i = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/links",
                                schemaPath: "/v1/links",
                                method: "POST",
                                headers: r,
                                query: i,
                                body: l(e.affiliateLinksCreateAffiliateLinkByUserRequest)
                            }, a)];
                        case 1:
                            return s = n.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return d(e)
                            })]
                    }
                })
            })
        }, a.prototype.affiliateLinksCreateAffiliateLinkByUser = function(e, t) {
            return r(this, void 0, void 0, function() {
                return n(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.affiliateLinksCreateAffiliateLinkByUserRaw(e, t)];
                        case 1:
                            return [4, a.sent().value()];
                        case 2:
                            return [2, a.sent()]
                    }
                })
            })
        }, a.prototype.affiliateLinksGetCreatorMetadataByGroupRaw = function(e, a) {
            return r(this, void 0, void 0, function() {
                var i, r, s;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new t.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling affiliateLinksGetCreatorMetadataByGroup.");
                            return i = {}, r = {}, [4, this.request({
                                path: "/v1/groups/{groupId}/links/metadata".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/links/metadata",
                                method: "GET",
                                headers: r,
                                query: i
                            }, a)];
                        case 1:
                            return s = n.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return h(e)
                            })]
                    }
                })
            })
        }, a.prototype.affiliateLinksGetCreatorMetadataByGroup = function(e, t) {
            return r(this, void 0, void 0, function() {
                return n(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.affiliateLinksGetCreatorMetadataByGroupRaw(e, t)];
                        case 1:
                            return [4, a.sent().value()];
                        case 2:
                            return [2, a.sent()]
                    }
                })
            })
        }, a.prototype.affiliateLinksGetCreatorMetadataByUserRaw = function(e) {
            return r(this, void 0, void 0, function() {
                var a, i, r;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return a = {}, i = {}, [4, this.request({
                                path: "/v1/links/metadata",
                                schemaPath: "/v1/links/metadata",
                                method: "GET",
                                headers: i,
                                query: a
                            }, e)];
                        case 1:
                            return r = n.sent(), [2, new t.JSONApiResponse(r, function(e) {
                                return h(e)
                            })]
                    }
                })
            })
        }, a.prototype.affiliateLinksGetCreatorMetadataByUser = function(e) {
            return r(this, void 0, void 0, function() {
                return n(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.affiliateLinksGetCreatorMetadataByUserRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, a.prototype.affiliateLinksGetEligibilityByGroupRaw = function(e, a) {
            return r(this, void 0, void 0, function() {
                var i, r, s;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new t.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling affiliateLinksGetEligibilityByGroup.");
                            return i = {}, r = {}, [4, this.request({
                                path: "/v1/groups/{groupId}/eligibility".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/eligibility",
                                method: "GET",
                                headers: r,
                                query: i
                            }, a)];
                        case 1:
                            return s = n.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return null == e ? e : {
                                    isEligible: e.IsEligible
                                }
                            })]
                    }
                })
            })
        }, a.prototype.affiliateLinksGetEligibilityByGroup = function(e, t) {
            return r(this, void 0, void 0, function() {
                return n(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.affiliateLinksGetEligibilityByGroupRaw(e, t)];
                        case 1:
                            return [4, a.sent().value()];
                        case 2:
                            return [2, a.sent()]
                    }
                })
            })
        }, a.prototype.affiliateLinksGetRequirementsByUserRaw = function(e) {
            return r(this, void 0, void 0, function() {
                var a, i, r;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return a = {}, i = {}, [4, this.request({
                                path: "/v1/links/requirements",
                                schemaPath: "/v1/links/requirements",
                                method: "GET",
                                headers: i,
                                query: a
                            }, e)];
                        case 1:
                            return r = n.sent(), [2, new t.JSONApiResponse(r, function(e) {
                                return null == e ? e : {
                                    requirements: e.Requirements.map(m)
                                }
                            })]
                    }
                })
            })
        }, a.prototype.affiliateLinksGetRequirementsByUser = function(e) {
            return r(this, void 0, void 0, function() {
                return n(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.affiliateLinksGetRequirementsByUserRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, a.prototype.affiliateLinksGetUniverseEligibilityByIdRaw = function(e, a) {
            return r(this, void 0, void 0, function() {
                var i, r, s;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling affiliateLinksGetUniverseEligibilityById.");
                            return i = {}, r = {}, [4, this.request({
                                path: "/v1/universes/{universeId}/eligibility".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/universes/{universeId}/eligibility",
                                method: "GET",
                                headers: r,
                                query: i
                            }, a)];
                        case 1:
                            return s = n.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return null == e ? e : {
                                    isEligible: e.IsEligible
                                }
                            })]
                    }
                })
            })
        }, a.prototype.affiliateLinksGetUniverseEligibilityById = function(e, t) {
            return r(this, void 0, void 0, function() {
                return n(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.affiliateLinksGetUniverseEligibilityByIdRaw(e, t)];
                        case 1:
                            return [4, a.sent().value()];
                        case 2:
                            return [2, a.sent()]
                    }
                })
            })
        }, a.prototype.affiliateLinksListAffiliateLinksByGroupRaw = function(e, a) {
            return r(this, void 0, void 0, function() {
                var i, r, s;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new t.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling affiliateLinksListAffiliateLinksByGroup.");
                            return i = {}, void 0 !== e.maxPageSize && (i.maxPageSize = e.maxPageSize), void 0 !== e.sortOrder && (i.sortOrder = e.sortOrder), void 0 !== e.pageToken && (i.pageToken = e.pageToken), r = {}, [4, this.request({
                                path: "/v1/groups/{groupId}/links".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/links",
                                method: "GET",
                                headers: r,
                                query: i
                            }, a)];
                        case 1:
                            return s = n.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return v(e)
                            })]
                    }
                })
            })
        }, a.prototype.affiliateLinksListAffiliateLinksByGroup = function(e, t) {
            return r(this, void 0, void 0, function() {
                return n(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.affiliateLinksListAffiliateLinksByGroupRaw(e, t)];
                        case 1:
                            return [4, a.sent().value()];
                        case 2:
                            return [2, a.sent()]
                    }
                })
            })
        }, a.prototype.affiliateLinksListAffiliateLinksByUserRaw = function(e, a) {
            return r(this, void 0, void 0, function() {
                var i, r, s;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return i = {}, void 0 !== e.maxPageSize && (i.maxPageSize = e.maxPageSize), void 0 !== e.sortOrder && (i.sortOrder = e.sortOrder), void 0 !== e.pageToken && (i.pageToken = e.pageToken), r = {}, [4, this.request({
                                path: "/v1/links",
                                schemaPath: "/v1/links",
                                method: "GET",
                                headers: r,
                                query: i
                            }, a)];
                        case 1:
                            return s = n.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return v(e)
                            })]
                    }
                })
            })
        }, a.prototype.affiliateLinksListAffiliateLinksByUser = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), n(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.affiliateLinksListAffiliateLinksByUserRaw(e, t)];
                        case 1:
                            return [4, a.sent().value()];
                        case 2:
                            return [2, a.sent()]
                    }
                })
            })
        }, a.prototype.affiliateLinksResolveAffiliateLinkByReferralCodeRaw = function(e, a) {
            return r(this, void 0, void 0, function() {
                var i, r, s;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.referralCode || void 0 === e.referralCode) throw new t.RequiredError("referralCode", "Required parameter requestParameters.referralCode was null or undefined when calling affiliateLinksResolveAffiliateLinkByReferralCode.");
                            return i = {}, void 0 !== e.referralCode && (i.referralCode = e.referralCode), r = {}, [4, this.request({
                                path: "/v1/links/resolve",
                                schemaPath: "/v1/links/resolve",
                                method: "GET",
                                headers: r,
                                query: i
                            }, a)];
                        case 1:
                            return s = n.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return null == e ? e : {
                                    linkId: e.linkId,
                                    linkType: e.linkType,
                                    universeId: (0, t.exists)(e, "universeId") ? e.universeId : void 0,
                                    experienceJoinData: (0, t.exists)(e, "experienceJoinData") ? p(e.experienceJoinData) : void 0,
                                    joinData: (0, t.exists)(e, "joinData") ? p(e.joinData) : void 0,
                                    fallbackType: (0, t.exists)(e, "fallbackType") ? e.fallbackType : void 0,
                                    fallbackId: (0, t.exists)(e, "fallbackId") ? e.fallbackId : void 0
                                }
                            })]
                    }
                })
            })
        }, a.prototype.affiliateLinksResolveAffiliateLinkByReferralCode = function(e, t) {
            return r(this, void 0, void 0, function() {
                return n(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.affiliateLinksResolveAffiliateLinkByReferralCodeRaw(e, t)];
                        case 1:
                            return [4, a.sent().value()];
                        case 2:
                            return [2, a.sent()]
                    }
                })
            })
        }, a.prototype.affiliateLinksUpdateAffiliateLinkByGroupRaw = function(e, a) {
            return r(this, void 0, void 0, function() {
                var i, r, s;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new t.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling affiliateLinksUpdateAffiliateLinkByGroup.");
                            if (null === e.affiliateLinksUpdateAffiliateLinkByUserRequest || void 0 === e.affiliateLinksUpdateAffiliateLinkByUserRequest) throw new t.RequiredError("affiliateLinksUpdateAffiliateLinkByUserRequest", "Required parameter requestParameters.affiliateLinksUpdateAffiliateLinkByUserRequest was null or undefined when calling affiliateLinksUpdateAffiliateLinkByGroup.");
                            return i = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/groups/{groupId}/links".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/links",
                                method: "PUT",
                                headers: r,
                                query: i,
                                body: c(e.affiliateLinksUpdateAffiliateLinkByUserRequest)
                            }, a)];
                        case 1:
                            return s = n.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return g(e)
                            })]
                    }
                })
            })
        }, a.prototype.affiliateLinksUpdateAffiliateLinkByGroup = function(e, t) {
            return r(this, void 0, void 0, function() {
                return n(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.affiliateLinksUpdateAffiliateLinkByGroupRaw(e, t)];
                        case 1:
                            return [4, a.sent().value()];
                        case 2:
                            return [2, a.sent()]
                    }
                })
            })
        }, a.prototype.affiliateLinksUpdateAffiliateLinkByUserRaw = function(e, a) {
            return r(this, void 0, void 0, function() {
                var i, r, s;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.affiliateLinksUpdateAffiliateLinkByUserRequest || void 0 === e.affiliateLinksUpdateAffiliateLinkByUserRequest) throw new t.RequiredError("affiliateLinksUpdateAffiliateLinkByUserRequest", "Required parameter requestParameters.affiliateLinksUpdateAffiliateLinkByUserRequest was null or undefined when calling affiliateLinksUpdateAffiliateLinkByUser.");
                            return i = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/links",
                                schemaPath: "/v1/links",
                                method: "PUT",
                                headers: r,
                                query: i,
                                body: c(e.affiliateLinksUpdateAffiliateLinkByUserRequest)
                            }, a)];
                        case 1:
                            return s = n.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return g(e)
                            })]
                    }
                })
            })
        }, a.prototype.affiliateLinksUpdateAffiliateLinkByUser = function(e, t) {
            return r(this, void 0, void 0, function() {
                return n(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.affiliateLinksUpdateAffiliateLinkByUserRaw(e, t)];
                        case 1:
                            return [4, a.sent().value()];
                        case 2:
                            return [2, a.sent()]
                    }
                })
            })
        }, a
    }(t.BaseAPI);
    (function(e) {
        function a() {
            return null !== e && e.apply(this, arguments) || this
        }
        i(a, e), a.prototype.eventsAuthenticatedVisitRaw = function(e, a) {
            return r(this, void 0, void 0, function() {
                var i, r, s;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.eventsAuthenticatedVisitRequest || void 0 === e.eventsAuthenticatedVisitRequest) throw new t.RequiredError("eventsAuthenticatedVisitRequest", "Required parameter requestParameters.eventsAuthenticatedVisitRequest was null or undefined when calling eventsAuthenticatedVisit.");
                            return i = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/events/authenticated-visit",
                                schemaPath: "/v1/events/authenticated-visit",
                                method: "POST",
                                headers: r,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        linkId: e.linkId,
                                        referralUrl: e.referralUrl,
                                        linkType: e.linkType,
                                        userDidLogIn: e.userDidLogIn
                                    }
                                }(e.eventsAuthenticatedVisitRequest)
                            }, a)];
                        case 1:
                            return s = n.sent(), [2, new t.VoidApiResponse(s)]
                    }
                })
            })
        }, a.prototype.eventsAuthenticatedVisit = function(e, t) {
            return r(this, void 0, void 0, function() {
                return n(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.eventsAuthenticatedVisitRaw(e, t)];
                        case 1:
                            return a.sent(), [2]
                    }
                })
            })
        }, a.prototype.eventsPostQualifiedSignupRaw = function(e, a) {
            return r(this, void 0, void 0, function() {
                var i, r, s;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.eventsPostQualifiedSignupRequest || void 0 === e.eventsPostQualifiedSignupRequest) throw new t.RequiredError("eventsPostQualifiedSignupRequest", "Required parameter requestParameters.eventsPostQualifiedSignupRequest was null or undefined when calling eventsPostQualifiedSignup.");
                            return i = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/events/qualified-signup",
                                schemaPath: "/v1/events/qualified-signup",
                                method: "POST",
                                headers: r,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        linkId: e.linkId,
                                        referralUrl: e.referralUrl,
                                        linkType: e.linkType
                                    }
                                }(e.eventsPostQualifiedSignupRequest)
                            }, a)];
                        case 1:
                            return s = n.sent(), [2, new t.VoidApiResponse(s)]
                    }
                })
            })
        }, a.prototype.eventsPostQualifiedSignup = function(e, t) {
            return r(this, void 0, void 0, function() {
                return n(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.eventsPostQualifiedSignupRaw(e, t)];
                        case 1:
                            return a.sent(), [2]
                    }
                })
            })
        }
    })(t.BaseAPI),
    function(e) {
        function a() {
            return null !== e && e.apply(this, arguments) || this
        }
        i(a, e), a.prototype.internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRaw = function(e, a) {
            return r(this, void 0, void 0, function() {
                var i, r, s;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRequest || void 0 === e.internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRequest) throw new t.RequiredError("internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRequest", "Required parameter requestParameters.internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRequest was null or undefined when calling internalAffiliateLinksCreateAffiliateLinkWithCustomCode.");
                            return i = {}, (r = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/links/vanity",
                                schemaPath: "/v1/internal/links/vanity",
                                method: "POST",
                                headers: r,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        universeId: e.universeId,
                                        campaignName: e.campaignName,
                                        creator: f(e.creator),
                                        vanityCode: e.vanityCode,
                                        launchData: e.launchData,
                                        fallbackType: e.fallbackType
                                    }
                                }(e.internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRequest)
                            }, a)];
                        case 1:
                            return s = n.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return d(e)
                            })]
                    }
                })
            })
        }, a.prototype.internalAffiliateLinksCreateAffiliateLinkWithCustomCode = function(e, t) {
            return r(this, void 0, void 0, function() {
                return n(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRaw(e, t)];
                        case 1:
                            return [4, a.sent().value()];
                        case 2:
                            return [2, a.sent()]
                    }
                })
            })
        }, a.prototype.internalAffiliateLinksDeleteAffiliateLinkRaw = function(e, a) {
            return r(this, void 0, void 0, function() {
                var i, r, s;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.linkId || void 0 === e.linkId) throw new t.RequiredError("linkId", "Required parameter requestParameters.linkId was null or undefined when calling internalAffiliateLinksDeleteAffiliateLink.");
                            return i = {}, r = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/links/{linkId}".replace("{".concat("linkId", "}"), encodeURIComponent(String(e.linkId))),
                                schemaPath: "/v1/internal/links/{linkId}",
                                method: "DELETE",
                                headers: r,
                                query: i
                            }, a)];
                        case 1:
                            return s = n.sent(), [2, new t.VoidApiResponse(s)]
                    }
                })
            })
        }, a.prototype.internalAffiliateLinksDeleteAffiliateLink = function(e, t) {
            return r(this, void 0, void 0, function() {
                return n(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.internalAffiliateLinksDeleteAffiliateLinkRaw(e, t)];
                        case 1:
                            return a.sent(), [2]
                    }
                })
            })
        }, a.prototype.internalAffiliateLinksGetAffiliateLinkForReferralCodeRaw = function(e, a) {
            return r(this, void 0, void 0, function() {
                var i, r, s;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.referralCode || void 0 === e.referralCode) throw new t.RequiredError("referralCode", "Required parameter requestParameters.referralCode was null or undefined when calling internalAffiliateLinksGetAffiliateLinkForReferralCode.");
                            return i = {}, void 0 !== e.referralCode && (i.referralCode = e.referralCode), r = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/links/share",
                                schemaPath: "/v1/internal/links/share",
                                method: "GET",
                                headers: r,
                                query: i
                            }, a)];
                        case 1:
                            return s = n.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return null == e ? e : {
                                    linkId: e.linkId,
                                    linkType: e.linkType
                                }
                            })]
                    }
                })
            })
        }, a.prototype.internalAffiliateLinksGetAffiliateLinkForReferralCode = function(e, t) {
            return r(this, void 0, void 0, function() {
                return n(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.internalAffiliateLinksGetAffiliateLinkForReferralCodeRaw(e, t)];
                        case 1:
                            return [4, a.sent().value()];
                        case 2:
                            return [2, a.sent()]
                    }
                })
            })
        }, a.prototype.internalAffiliateLinksUpdateAffiliateLinkByReferralCodeRaw = function(e, a) {
            return r(this, void 0, void 0, function() {
                var i, r, s;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.referralCode || void 0 === e.referralCode) throw new t.RequiredError("referralCode", "Required parameter requestParameters.referralCode was null or undefined when calling internalAffiliateLinksUpdateAffiliateLinkByReferralCode.");
                            if (null === e.internalAffiliateLinksUpdateAffiliateLinkByReferralCodeRequest || void 0 === e.internalAffiliateLinksUpdateAffiliateLinkByReferralCodeRequest) throw new t.RequiredError("internalAffiliateLinksUpdateAffiliateLinkByReferralCodeRequest", "Required parameter requestParameters.internalAffiliateLinksUpdateAffiliateLinkByReferralCodeRequest was null or undefined when calling internalAffiliateLinksUpdateAffiliateLinkByReferralCode.");
                            return i = {}, (r = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/links/referral-code/{referralCode}".replace("{".concat("referralCode", "}"), encodeURIComponent(String(e.referralCode))),
                                schemaPath: "/v1/internal/links/referral-code/{referralCode}",
                                method: "PATCH",
                                headers: r,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        universeId: e.universeId,
                                        launchData: e.launchData,
                                        creator: f(e.creator),
                                        fallbackType: e.fallbackType
                                    }
                                }(e.internalAffiliateLinksUpdateAffiliateLinkByReferralCodeRequest)
                            }, a)];
                        case 1:
                            return s = n.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return g(e)
                            })]
                    }
                })
            })
        }, a.prototype.internalAffiliateLinksUpdateAffiliateLinkByReferralCode = function(e, t) {
            return r(this, void 0, void 0, function() {
                return n(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.internalAffiliateLinksUpdateAffiliateLinkByReferralCodeRaw(e, t)];
                        case 1:
                            return [4, a.sent().value()];
                        case 2:
                            return [2, a.sent()]
                    }
                })
            })
        }, a.prototype.internalAffiliateLinksUpdateAffiliateLinkReferralCodeRaw = function(e, a) {
            return r(this, void 0, void 0, function() {
                var i, r, s;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.linkId || void 0 === e.linkId) throw new t.RequiredError("linkId", "Required parameter requestParameters.linkId was null or undefined when calling internalAffiliateLinksUpdateAffiliateLinkReferralCode.");
                            return i = {}, void 0 !== e.linkId && (i.linkId = e.linkId), r = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/links",
                                schemaPath: "/v1/internal/links",
                                method: "PUT",
                                headers: r,
                                query: i
                            }, a)];
                        case 1:
                            return s = n.sent(), [2, new t.VoidApiResponse(s)]
                    }
                })
            })
        }, a.prototype.internalAffiliateLinksUpdateAffiliateLinkReferralCode = function(e, t) {
            return r(this, void 0, void 0, function() {
                return n(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.internalAffiliateLinksUpdateAffiliateLinkReferralCodeRaw(e, t)];
                        case 1:
                            return a.sent(), [2]
                    }
                })
            })
        }
    }(t.BaseAPI),
    function(e) {
        function a() {
            return null !== e && e.apply(this, arguments) || this
        }
        i(a, e), a.prototype.privacyTaskWebhookEraseUserDataRaw = function(e, a) {
            return r(this, void 0, void 0, function() {
                var i, r, s;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return i = {}, (r = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/erase-user-data",
                                schemaPath: "/v1/erase-user-data",
                                method: "POST",
                                headers: r,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        privacyTaskId: e.privacyTaskId,
                                        userKey: e.userKey,
                                        userId: e.userId
                                    }
                                }(e.privacyTaskWebhookEraseUserDataRequest)
                            }, a)];
                        case 1:
                            return s = n.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return null == e ? e : {
                                    state: (0, t.exists)(e, "state") ? e.state : void 0
                                }
                            })]
                    }
                })
            })
        }, a.prototype.privacyTaskWebhookEraseUserData = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), n(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.privacyTaskWebhookEraseUserDataRaw(e, t)];
                        case 1:
                            return [4, a.sent().value()];
                        case 2:
                            return [2, a.sent()]
                    }
                })
            })
        }
    }(t.BaseAPI), e.s(["AffiliateLinksApi", 0, b, "FallbackType", 0, {
        Invalid: "Invalid",
        Profile: "Profile",
        Home: "Home"
    }, "Requirements", 0, {
        Restricted: "Restricted",
        Email: "Email",
        Id: "Id",
        UserAgreement: "UserAgreement",
        ModerationStatus: "ModerationStatus",
        Payable: "Payable"
    }], 540459);
    let k = new b((0, e.i(272593).createClientConfiguration)("affiliate-links", "bedev2"));
    e.s(["createAffiliateLink", 0, e => k.affiliateLinksCreateAffiliateLinkByUser({
        affiliateLinksCreateAffiliateLinkByUserRequest: e
    }), "createGroupAffiliateLink", 0, e => {
        let {
            groupId: t,
            ...a
        } = e;
        return k.affiliateLinksCreateAffiliateLinkByGroup({
            groupId: t,
            affiliateLinksCreateAffiliateLinkByUserRequest: a
        })
    }, "editAffiliateLink", 0, e => k.affiliateLinksUpdateAffiliateLinkByUser({
        affiliateLinksUpdateAffiliateLinkByUserRequest: e
    }), "editGroupAffiliateLink", 0, e => {
        let {
            groupId: t,
            ...a
        } = e;
        return k.affiliateLinksUpdateAffiliateLinkByGroup({
            groupId: t,
            affiliateLinksUpdateAffiliateLinkByUserRequest: a
        })
    }, "getAffiliateLinks", 0, e => k.affiliateLinksListAffiliateLinksByUser(e), "getGroupAffiliateLinks", 0, e => k.affiliateLinksListAffiliateLinksByGroup(e), "getGroupCreatorMetadata", 0, e => k.affiliateLinksGetCreatorMetadataByGroup({
        groupId: e
    }), "getGroupEligibility", 0, e => k.affiliateLinksGetEligibilityByGroup({
        groupId: e
    }), "getRequirements", 0, () => k.affiliateLinksGetRequirementsByUser(), "getUniverseEligibility", 0, e => k.affiliateLinksGetUniverseEligibilityById({
        universeId: e
    }), "getUserCreatorMetadata", 0, () => k.affiliateLinksGetCreatorMetadataByUser()], 338653)
}, 127792, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/alert_dark.1spa8ixzmujxs.svg")
}, 858517, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/alert_light.3o6_fob3g_8zu.svg")
}, 343885, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/api_key_dark.1k1v6y4zm3j28.svg")
}, 609794, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/api_key_light.06t4q4202-77s.svg")
}, 57561, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/audio_dark.16razgllw2ska.svg")
}, 509747, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/audio_light.3ra073_18pbj-.svg")
}, 475555, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/avatar_setup_dark.0orjsl7i089hc.svg")
}, 538302, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/avatar_setup_light.32r86q54d7kuh.svg")
}, 387707, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/badge_dark.3m45r-3favo3f.svg")
}, 262135, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/badge_light.3fxfvj8ub7utb.svg")
}, 240731, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/bar_graph_dark.01vf9sty52re2.svg")
}, 956923, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/bar_graph_light.1iiixo_d8ur81.svg")
}, 84362, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/collaborators_dark.30gxkwssilacj.svg")
}, 214665, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/collaborators_light.3x7fovqhay1x5.svg")
}, 455506, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/decals_dark.2jpntsljojhzc.svg")
}, 918290, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/decals_light.16_gp3tnuc5p_.svg")
}, 716933, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/envelope_dark.2-ouf9shuihi4.svg")
}, 347319, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/envelope_light.1me9hqye66z7w.svg")
}, 543657, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/event_calendar_dark.3lx4_kse68by8.svg")
}, 850412, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/event_calendar_light.1pq-t84d90ty1.svg")
}, 103329, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/find_people_dark.220q6_cs04hcq.svg")
}, 692706, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/find_people_light.1gkb3pmwc8s2n.svg")
}, 405654, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/image_dark.2giew28wx4z86.svg")
}, 891409, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/image_light.0ouq8tcgpznz7.svg")
}, 758060, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/leaderboard_dark.301ypg94lbxpv.svg")
}, 710005, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/leaderboard_light.43sjz_ibwkiq_.svg")
}, 495550, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/line_chart_dark.0k7qf3mhepo6s.svg")
}, 320429, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/line_chart_light.049gcvvmai0ax.svg")
}, 106017, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/localization_dark.1ia7wat2mwyfi.svg")
}, 821978, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/localization_light.2jss_xvx2fuq0.svg")
}, 766389, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/lockSecrets_dark.0na6naigcbnkj.svg")
}, 374717, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/lockSecrets_light.0rzix2i1i13lt.svg")
}, 756733, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/makeup_look_dark.26-5-yn8598c9.svg")
}, 251697, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/makeup_look_light.0rc05t5n5al4m.svg")
}, 411118, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/managed_pricing_dark.2zdkf2-ctboa2.svg")
}, 839596, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/managed_pricing_light.0sioq_hruq1qp.svg")
}, 729733, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/meshes_dark.2tlm50ns1pq5o.svg")
}, 66217, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/meshes_light.36wh96flp2o3r.svg")
}, 148865, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/models_dark.30suu5lj5-ua5.svg")
}, 45512, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/models_light.0kiw6k3ejw-rn.svg")
}, 706478, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/models_plugins_parts_dark.3jp6jislnsqf8.svg")
}, 166181, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/models_plugins_parts_light.2nj1xhv0bfg_u.svg")
}, 37474, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/notifications_dark.2l_rf34_xo6o8.svg")
}, 147189, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/notifications_light.3p-b4rzvwwfmj.svg")
}, 105897, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/oauth_dark.42jv8--11_1i0.svg")
}, 123524, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/oauth_light.17vwiebwrn8ox.svg")
}, 752739, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/rights_manager_dark.0m7ca17sdbgim.svg")
}, 331105, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/rights_manager_light.1moaenz1cbft0.svg")
}, 564908, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/run_dark.1sun4tvxh_arh.svg")
}, 663412, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/run_light.29f-3jyw910_v.svg")
}, 215887, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/shareLinks_dark.1l5fwuv6cgzmy.svg")
}, 962803, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/shareLinks_light.116igf-ldibmu.svg")
}, 914865, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/signin_dark.1k_gzn1-5q0ca.svg")
}, 818392, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/signin_light.1o1-jng_ct0y2.svg")
}, 173034, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/token_dark.2qy4jy9ffjhax.svg")
}, 780078, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/token_light.2xc00j5zp1q8_.svg")
}, 756885, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/video_dark.2-gdpodjtsjj3.svg")
}, 260123, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/video_game_dark.0tuxtkttj8gcu.svg")
}, 507792, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/video_game_light.3l155817mjupj.svg")
}, 850994, e => {
    e.q("https://assets.create.roblox.com/0d20ac295b260f61613cc053517abeede07b8a5a/_next/static/media/video_light.1fum3vlxctp7w.svg")
}, 836344, e => {
    "use strict";
    var t = e.i(140625),
        a = e.i(603955),
        i = e.i(75584),
        r = e.i(197649),
        n = e.i(416340);
    let s = {
            Small: "XSmall",
            Medium: "Small",
            Large: "Medium"
        },
        o = {
            Small: ["height-600", "text-label-small"],
            Medium: ["height-800", "text-label-medium"],
            Large: ["height-1000", "text-label-medium"]
        },
        l = {
            Small: "padding-left-small",
            Medium: "padding-left-medium",
            Large: "padding-left-large"
        },
        c = {
            Small: "padding-left-small",
            Medium: "padding-left-medium",
            Large: "padding-left-medium"
        },
        u = {
            Small: "padding-right-small",
            Medium: "padding-right-medium",
            Large: "padding-right-large"
        },
        d = {
            Small: "padding-right-small",
            Medium: "padding-right-medium",
            Large: "padding-right-medium"
        },
        f = {
            Small: "padding-left-xsmall",
            Medium: "padding-left-[var(--size-150)]",
            Large: "padding-left-small"
        },
        p = {
            Small: "padding-right-[var(--size-150)]",
            Medium: "padding-right-small",
            Large: "padding-right-[var(--size-250)]"
        },
        h = {
            Standard: "bg-shift-300",
            Utility: "bg-none"
        },
        m = {
            Small: "size-[var(--icon-size-xsmall)]",
            Medium: "size-[var(--icon-size-small)]",
            Large: "size-[var(--icon-size-medium)]"
        },
        v = e => {
            let {
                iconName: t,
                node: a,
                size: o
            } = e;
            return null != t ? n.default.createElement(i.Icon, {
                name: t,
                size: s[o]
            }) : null != a ? n.default.createElement("span", {
                className: (0, r.default)("inline-flex items-center justify-center shrink-0", m[o])
            }, a) : null
        },
        g = (0, n.forwardRef)((e, i) => {
            let {
                className: s,
                style: m,
                text: g,
                isDisabled: b = !1,
                size: k = "Medium",
                variant: y = "Standard",
                leadingIconName: x,
                leadingIconNode: w,
                trailingIconName: L,
                trailingIconNode: q,
                ...R
            } = e, A = null != x || null != w, _ = null != L || null != q, C = (0, r.default)(b ? a.disabledOpacity : [t.interactable, "cursor-pointer"], "relative flex justify-center items-center radius-circle stroke-none", A ? c[k] : l[k], _ ? d[k] : u[k], o[k], s), I = n.default.createElement(n.default.Fragment, null, n.default.createElement(t.StateLayer, null), n.default.createElement(v, {
                iconName: x,
                node: w,
                size: k
            }), n.default.createElement("span", {
                className: (0, r.default)("padding-y-xsmall text-no-wrap text-truncate-end", A && f[k], _ && p[k])
            }, g), n.default.createElement(v, {
                iconName: L,
                node: q,
                size: k
            })), P = {
                textDecoration: "none",
                ...m
            };
            if ("a" === R.as) {
                let {
                    as: e,
                    href: t,
                    ...a
                } = R;
                return n.default.createElement("a", {
                    ref: i,
                    ...a,
                    "aria-disabled": b,
                    href: b ? void 0 : t,
                    className: (0, r.default)(C, h[y], "content-action-utility"),
                    style: P
                }, I)
            }
            let {
                as: U,
                isChecked: S,
                onCheckedChange: B,
                ...T
            } = R;
            return n.default.createElement("button", {
                ref: i,
                type: "button",
                ...T,
                className: (0, r.default)(S ? "bg-inverse-surface-0" : h[y], S ? "content-inverse-emphasis" : "content-action-utility", C),
                style: P,
                "aria-pressed": S,
                disabled: b,
                onClick: null == B ? void 0 : () => B(!S)
            }, I)
        });
    e.s(["Chip", 0, g])
}, 607895, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340),
        i = e.i(23342);
    let r = new Set(["_self", "_parent", "_top"]),
        n = {
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        s = {
            Standard: "content-emphasis",
            Emphasis: "content-emphasis",
            Inverse: "content-inverse-default"
        },
        o = (0, a.forwardRef)((e, o) => {
            var l, c, u;
            let {
                children: d,
                className: f,
                size: p,
                color: h = "Emphasis",
                variant: m = "Standalone",
                underline: v = "hover",
                isExternal: g,
                asChild: b,
                ...k
            } = e, y = (c = null != (l = k.as) ? l : "a", u = "button" === k.as ? void 0 : k.target, void 0 !== g ? g : "button" !== c && void 0 !== u && !r.has(u)), x = (0, t.default)("foundation-web-link", "button" === k.as && "bg-none stroke-none padding-none appearance-none [text-align:inherit]", ("Standalone" === m || y) && "inline-flex items-center gap-xsmall", void 0 !== p && n[p], s[h], "always" === v ? "underline" : "no-underline", "hover" === v && "hover:underline", "motion-safe:transition-opacity", "hover:cursor-pointer hover:[opacity:0.8]", "radius-xsmall focus-visible:[outline-style:solid] focus-visible:[outline-width:var(--stroke-standard)] focus-visible:[outline-color:var(--color-system-emphasis)]", f), w = y ? a.default.createElement("span", {
                "aria-hidden": !0,
                "data-testid": "foundation-web-icon",
                className: (0, t.default)("grow-0 shrink-0 basis-auto icon size-[1em]", "icon-regular-arrow-up-right-from-square")
            }) : null;
            if (b) {
                let {
                    as: e,
                    ...t
                } = k, r = a.default.Children.only(d);
                return a.default.isValidElement(r) ? a.default.createElement(i.Slot, {
                    ref: o,
                    ...t,
                    className: x
                }, a.default.cloneElement(r, {}, a.default.createElement(a.default.Fragment, null, r.props.children, w))) : null
            }
            if ("button" === k.as) {
                let {
                    as: e,
                    type: t,
                    ...i
                } = k;
                return a.default.createElement("button", {
                    ref: o,
                    type: null != t ? t : "button",
                    ...i,
                    className: x
                }, d, w)
            }
            let {
                as: L,
                ...q
            } = k;
            return a.default.createElement("a", {
                ref: o,
                ...q,
                className: x
            }, d, w)
        });
    o.displayName = "Link", e.s(["Link", 0, o])
}, 367808, e => {
    "use strict";
    var t = e.i(194250),
        a = e.i(416340),
        i = e.i(863605),
        r = e.i(154502),
        n = e.i(945146),
        s = e.i(690569),
        o = e.i(251635),
        l = e.i(787802),
        c = e.i(221628),
        u = e.i(396249),
        d = e.i(121880);

    function f(e) {
        return (0, s.g)("MuiAlertTitle", e)
    }(0, l.g)("MuiAlertTitle", ["root"]);
    let p = ["className"],
        h = (0, o.s)(u.T, {
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
        m = a.forwardRef(function(e, t) {
            let a = (0, d.u)({
                    props: e,
                    name: "MuiAlertTitle"
                }),
                {
                    className: i
                } = a,
                r = (0, s._)(a, p),
                l = (e => {
                    let {
                        classes: t
                    } = e;
                    return (0, o.a)({
                        root: ["root"]
                    }, f, t)
                })(a);
            return (0, c.jsx)(h, (0, n._)({
                gutterBottom: !0,
                component: "div",
                ownerState: a,
                ref: t,
                className: (0, o.c)(l.root, i)
            }, r))
        });
    var v = (0, i.default)({
            name: "AlertTitle"
        })(function(e) {
            return {
                root: (0, t._)((0, t._)({}, e.typography.alertTitle), {
                    margin: "-1px 0"
                })
            }
        }),
        g = (0, a.forwardRef)(function(e, i) {
            var n = e.classes,
                s = e.className,
                o = (0, t.a)(e, ["classes", "className"]),
                l = v(void 0, {
                    props: {
                        classes: (0, r.default)(n, s)
                    }
                });
            return a.default.createElement(m, (0, t._)({}, o, {
                classes: l.classes,
                ref: i
            }))
        });
    e.s(["AlertTitle", 0, g], 367808)
}, 16255, e => {
    "use strict";
    var t = e.i(788647);
    e.s(["NavigateNextIcon", () => t.N])
}, 957474, e => {
    "use strict";
    var t = e.i(194250),
        a = e.i(416340),
        i = e.i(863605),
        r = e.i(154502),
        n = e.i(787802),
        s = e.i(690569),
        o = e.i(945146),
        l = e.i(251635),
        c = e.i(51928),
        u = e.i(634034),
        d = e.i(221628),
        f = e.i(176595),
        p = e.i(121880),
        h = e.i(105006);
    e.i(465957);
    var m = (0, u.c)((0, d.jsx)("path", {
            d: "M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8z"
        }), "RadioButtonUnchecked"),
        v = (0, u.c)((0, d.jsx)("path", {
            d: "M8.465 8.465C9.37 7.56 10.62 7 12 7C14.76 7 17 9.24 17 12C17 13.38 16.44 14.63 15.535 15.535C14.63 16.44 13.38 17 12 17C9.24 17 7 14.76 7 12C7 10.62 7.56 9.37 8.465 8.465Z"
        }), "RadioButtonChecked");
    let g = (0, l.s)("span", {
            name: "MuiRadioButtonIcon",
            shouldForwardProp: l.r
        })({
            position: "relative",
            display: "flex"
        }),
        b = (0, l.s)(m, {
            name: "MuiRadioButtonIcon"
        })({
            transform: "scale(1)"
        }),
        k = (0, l.s)(v, {
            name: "MuiRadioButtonIcon"
        })(e => {
            let {
                theme: t,
                ownerState: a
            } = e;
            return (0, o._)({
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

    function y(e) {
        let {
            checked: t = !1,
            classes: a = {},
            fontSize: i
        } = e, r = (0, o._)({}, e, {
            checked: t
        });
        return (0, d.jsxs)(g, {
            className: a.root,
            ownerState: r,
            children: [(0, d.jsx)(b, {
                fontSize: i,
                className: a.background,
                ownerState: r
            }), (0, d.jsx)(k, {
                fontSize: i,
                className: a.dot,
                ownerState: r
            })]
        })
    }

    function x(e) {
        return (0, s.g)("MuiRadio", e)
    }
    var w = (0, n.g)("MuiRadio", ["root", "checked", "disabled", "colorPrimary", "colorSecondary", "sizeSmall"]);
    let L = ["checked", "checkedIcon", "color", "icon", "name", "onChange", "size", "className"],
        q = (0, l.s)(c.S, {
            shouldForwardProp: e => (0, l.r)(e) || "classes" === e,
            name: "MuiRadio",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: a
                } = e;
                return [t.root, "medium" !== a.size && t["size".concat((0, s.a)(a.size))], t["color".concat((0, s.a)(a.color))]]
            }
        })(e => {
            let {
                theme: t,
                ownerState: a
            } = e;
            return (0, o._)({
                color: (t.vars || t).palette.text.secondary
            }, !a.disableRipple && {
                "&:hover": {
                    backgroundColor: t.vars ? "rgba(".concat("default" === a.color ? t.vars.palette.action.activeChannel : t.vars.palette[a.color].mainChannel, " / ").concat(t.vars.palette.action.hoverOpacity, ")") : (0, s.b)("default" === a.color ? t.palette.action.active : t.palette[a.color].main, t.palette.action.hoverOpacity),
                    "@media (hover: none)": {
                        backgroundColor: "transparent"
                    }
                }
            }, "default" !== a.color && {
                ["&.".concat(w.checked)]: {
                    color: (t.vars || t).palette[a.color].main
                }
            }, {
                ["&.".concat(w.disabled)]: {
                    color: (t.vars || t).palette.action.disabled
                }
            })
        }),
        R = (0, d.jsx)(y, {
            checked: !0
        }),
        A = (0, d.jsx)(y, {}),
        _ = a.forwardRef(function(e, t) {
            var i, r, n, c;
            let u = (0, p.u)({
                    props: e,
                    name: "MuiRadio"
                }),
                {
                    checked: m,
                    checkedIcon: v = R,
                    color: g = "primary",
                    icon: b = A,
                    name: k,
                    onChange: y,
                    size: w = "medium",
                    className: _
                } = u,
                C = (0, s._)(u, L),
                I = (0, o._)({}, u, {
                    color: g,
                    size: w
                }),
                P = (e => {
                    let {
                        classes: t,
                        color: a,
                        size: i
                    } = e, r = {
                        root: ["root", "color".concat((0, s.a)(a)), "medium" !== i && "size".concat((0, s.a)(i))]
                    };
                    return (0, o._)({}, t, (0, l.a)(r, x, t))
                })(I),
                U = a.useContext(f.R),
                S = m,
                B = (0, h.c)(y, U && U.onChange),
                T = k;
            return U && (void 0 === S && (n = U.value, S = "object" == typeof(c = u.value) && null !== c ? n === c : String(n) === String(c)), void 0 === T && (T = U.name)), (0, d.jsx)(q, (0, o._)({
                type: "radio",
                icon: a.cloneElement(b, {
                    fontSize: null != (i = A.props.fontSize) ? i : w
                }),
                checkedIcon: a.cloneElement(v, {
                    fontSize: null != (r = R.props.fontSize) ? r : w
                }),
                ownerState: I,
                classes: P,
                name: T,
                checked: S,
                onChange: B,
                ref: t,
                className: (0, l.c)(P.root, _)
            }, C))
        });
    var C = (0, i.default)({
            name: "Radio"
        })(function(e) {
            var t, a;
            return {
                root: {
                    color: e.palette.states.active
                },
                colorPrimary: ((t = {
                    color: e.palette.content.muted
                })["&.".concat(w.checked)] = {
                    color: e.palette.actionV2.primaryBrand.fill
                }, t),
                colorSecondary: {
                    color: e.palette.actionV2.primary.fill
                },
                disabled: ((a = {
                    color: e.palette.states.disabled
                })["&.".concat(w.colorPrimary, ".").concat(w.checked)] = {
                    color: e.palette.states.disabled
                }, a)
            }
        }),
        I = (0, a.forwardRef)(function(e, i) {
            var n = e.classes,
                s = e.color,
                o = e.inputProps,
                l = e["aria-label"],
                c = e.className,
                u = (0, t.a)(e, ["classes", "color", "inputProps", "aria-label", "className"]),
                d = C(void 0, {
                    props: {
                        classes: (0, r.default)(n, c)
                    }
                });
            return a.default.createElement(_, (0, t._)({}, u, {
                classes: d.classes,
                color: void 0 === s ? "primary" : s,
                ref: i,
                inputProps: (0, t._)({
                    "aria-label": l
                }, o)
            }))
        });
    e.s(["Radio", 0, I], 957474)
}, 176595, e => {
    "use strict";
    let t = e.i(416340).createContext(void 0);
    e.s(["R", 0, t])
}, 883302, e => {
    "use strict";
    var t = e.i(29013);
    e.s(["NavigateBeforeIcon", () => t.NavigateBefore])
}, 722417, e => {
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
}, 117437, e => {
    "use strict";
    var t = e.i(711367);

    function a(e, t) {
        let {
            pages: a,
            pageParams: i
        } = t, r = a.length - 1;
        return a.length > 0 ? e.getNextPageParam(a[r], a, i[r], i) : void 0
    }

    function i(e, t) {
        var a;
        let {
            pages: i,
            pageParams: r
        } = t;
        return i.length > 0 ? null == (a = e.getPreviousPageParam) ? void 0 : a.call(e, i[0], i, r[0], r) : void 0
    }
    e.s(["hasNextPage", 0, function(e, t) {
        return !!t && null != a(e, t)
    }, "hasPreviousPage", 0, function(e, t) {
        return !!t && !!e.getPreviousPageParam && null != i(e, t)
    }, "infiniteQueryBehavior", 0, function(e) {
        return {
            onFetch: (r, n) => {
                var s, o, l, c, u;
                let d = r.options,
                    f = null == (l = r.fetchOptions) || null == (o = l.meta) || null == (s = o.fetchMore) ? void 0 : s.direction,
                    p = (null == (c = r.state.data) ? void 0 : c.pages) || [],
                    h = (null == (u = r.state.data) ? void 0 : u.pageParams) || [],
                    m = {
                        pages: [],
                        pageParams: []
                    },
                    v = 0,
                    g = async () => {
                        let n = !1,
                            s = (0, t.ensureQueryFn)(r.options, r.fetchOptions),
                            o = async (e, a, i) => {
                                let o;
                                if (n) return Promise.reject();
                                if (null == a && e.pages.length) return Promise.resolve(e);
                                let l = (Object.defineProperty(o = {
                                        client: r.client,
                                        queryKey: r.queryKey,
                                        pageParam: a,
                                        direction: i ? "backward" : "forward",
                                        meta: r.options.meta
                                    }, "signal", {
                                        enumerable: !0,
                                        get: () => (r.signal.aborted ? n = !0 : r.signal.addEventListener("abort", () => {
                                            n = !0
                                        }), r.signal)
                                    }), o),
                                    c = await s(l),
                                    {
                                        maxPages: u
                                    } = r.options,
                                    d = i ? t.addToStart : t.addToEnd;
                                return {
                                    pages: d(e.pages, c, u),
                                    pageParams: d(e.pageParams, a, u)
                                }
                            };
                        if (f && p.length) {
                            let e = "backward" === f,
                                t = {
                                    pages: p,
                                    pageParams: h
                                },
                                r = (e ? i : a)(d, t);
                            m = await o(t, r, e)
                        } else {
                            let t = null != e ? e : p.length;
                            do {
                                var l;
                                let e = 0 === v ? null != (l = h[0]) ? l : d.initialPageParam : a(d, m);
                                if (v > 0 && null == e) break;
                                m = await o(m, e), v++
                            } while (v < t)
                        }
                        return m
                    };
                r.options.persister ? r.fetchFn = () => {
                    var e, t;
                    return null == (e = (t = r.options).persister) ? void 0 : e.call(t, g, {
                        client: r.client,
                        queryKey: r.queryKey,
                        meta: r.options.meta,
                        signal: r.signal
                    }, n)
                } : r.fetchFn = g
            }
        }
    }])
}, 630986, e => {
    "use strict";
    var t = e.i(468612),
        a = e.i(117437),
        i = class extends t.QueryObserver {
            bindMethods() {
                super.bindMethods(), this.fetchNextPage = this.fetchNextPage.bind(this), this.fetchPreviousPage = this.fetchPreviousPage.bind(this)
            }
            setOptions(e) {
                super.setOptions({
                    ...e,
                    behavior: (0, a.infiniteQueryBehavior)()
                })
            }
            getOptimisticResult(e) {
                return e.behavior = (0, a.infiniteQueryBehavior)(), super.getOptimisticResult(e)
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
                var i, r;
                let {
                    state: n
                } = e, s = super.createResult(e, t), {
                    isFetching: o,
                    isRefetching: l,
                    isError: c,
                    isRefetchError: u
                } = s, d = null == (r = n.fetchMeta) || null == (i = r.fetchMore) ? void 0 : i.direction, f = c && "forward" === d, p = o && "forward" === d, h = c && "backward" === d, m = o && "backward" === d;
                return {
                    ...s,
                    fetchNextPage: this.fetchNextPage,
                    fetchPreviousPage: this.fetchPreviousPage,
                    hasNextPage: (0, a.hasNextPage)(t, n.data),
                    hasPreviousPage: (0, a.hasPreviousPage)(t, n.data),
                    isFetchNextPageError: f,
                    isFetchingNextPage: p,
                    isFetchPreviousPageError: h,
                    isFetchingPreviousPage: m,
                    isRefetchError: u && !f && !h,
                    isRefetching: l && !p && !m
                }
            }
            constructor(e, t) {
                super(e, t)
            }
        },
        r = e.i(624083);
    e.s(["useInfiniteQuery", 0, function(e, t) {
        return (0, r.useBaseQuery)(e, i, t)
    }], 630986)
}]);

//# debugId=58dfc1e1-1bd0-c6f3-1649-3ea4a2478fef
//# sourceMappingURL=2-g8j7eju6ga0.js.map
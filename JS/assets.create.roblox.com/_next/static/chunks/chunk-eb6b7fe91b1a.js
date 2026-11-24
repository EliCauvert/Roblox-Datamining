;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "abea2c17-331e-d116-63fe-977a99297816")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 649499, e => {
    "use strict";
    var t = e.i(277199);
    e.s(["f", () => t.N])
}, 887545, e => {
    "use strict";
    var t = e.i(225226),
        a = e.i(643766),
        n = e.i(231543),
        i = e.i(130933),
        r = (0, n.f)({
            name: "Label"
        })(function(e, a) {
            var n = {
                    alignItems: "center",
                    backgroundColor: e.palette.states.selected,
                    borderRadius: 4,
                    color: e.palette.content.standard,
                    display: "inline-flex",
                    lineHeight: "20px",
                    paddingLeft: a.hasIcon ? 4 : 6,
                    paddingRight: 6,
                    textTransform: "none"
                },
                i = function(e) {
                    var t = e.severity,
                        a = e.theme;
                    if ("text" === e.variant) {
                        var n = {
                            backgroundColor: "transparent"
                        };
                        return "default" === t && (n.color = a.palette.content.muted), "success" === t && (n.color = a.palette.content.alert.active), "info" === t && (n.color = a.palette.content.alert.inform), "warning" === t && (n.color = a.palette.components.label.warningText), "error" === t && (n.color = a.palette.content.alert.important), n
                    }
                    return "success" === t ? {
                        background: a.palette.components.label.activeFill,
                        color: a.palette.components.label.activeContent
                    } : "info" === t ? {
                        background: a.palette.components.label.informFill,
                        color: a.palette.components.label.informContent
                    } : "warning" === t ? {
                        background: a.palette.components.label.noticeFill,
                        color: a.palette.components.label.noticeContent
                    } : "error" === t ? {
                        background: a.palette.components.label.importantFill,
                        color: a.palette.components.label.importantContent
                    } : {}
                }({
                    theme: e,
                    severity: a.severity,
                    variant: a.variant
                });
            return {
                iconSize: {
                    boxSizing: "content-box",
                    height: 12,
                    marginRight: 4,
                    width: 12
                },
                root: (0, t._)((0, t._)({}, n), i)
            }
        }),
        s = (0, a.forwardRef)(function(e, t) {
            var n = e.icon,
                s = e.severity,
                o = e.variant,
                c = e.labelText,
                l = e.classes,
                u = e.className,
                d = a.default.isValidElement(n),
                p = r({
                    hasIcon: d,
                    severity: void 0 === s ? "default" : s,
                    variant: void 0 === o ? "contained" : o
                }, {
                    props: {
                        classes: (0, i.f)(l, u)
                    }
                }),
                h = p.classes,
                g = h.root,
                f = h.iconSize,
                m = p.cx,
                v = d ? a.default.cloneElement(n, {
                    className: m(n.props.className, f)
                }) : null;
            return a.default.createElement("div", {
                className: g,
                ref: t
            }, v, c)
        });
    e.s(["f", 0, s], 887545)
}, 97782, e => {
    "use strict";
    var t = e.i(730530),
        a = e.i(881670);
    let n = {
            path: "/monetization/overview",
            pathPattern: /\/monetization\/overview/,
            title: (0, t.Q)("Heading.Monetization", a.f.Analytics)
        },
        i = {
            path: "/dashboard/analytics",
            pathPattern: /\/dashboard\/analytics/,
            title: (0, t.Q)("Heading.Analytics", a.f.Navigation)
        },
        r = {
            path: "/experiments",
            pathPattern: /\/experiments(?!\/)/,
            title: (0, t.Q)("Heading.Experiments", a.f.Navigation)
        },
        s = {
            path: "/monetization/developer-products",
            pathPattern: /\/monetization\/developer-products/,
            title: (0, t.Q)("Label.DeveloperProducts", a.f.Navigation),
            group: n
        },
        o = {
            path: "/monetization/passes",
            pathPattern: /\/monetization\/passes/,
            title: (0, t.Q)("Label.GamePasses", a.f.Navigation),
            group: n
        },
        c = {
            path: "/monetization/avatar-items",
            pathPattern: /\/monetization\/avatar-items/,
            title: (0, t.Q)("Label.ThirdPartyAvatarItemCommissions", a.f.Navigation),
            group: n
        },
        l = {
            path: "/creations/catalog",
            pathPattern: /\/creations\/catalog/,
            title: (0, t.Q)("Heading.ItemAnalytics", a.f.Analytics)
        },
        u = {
            path: "/monetization/immersive-ads",
            pathPattern: /\/monetization\/immersive-ads/,
            title: (0, t.Q)("Heading.Ads", a.f.Navigation),
            group: n
        },
        d = {
            path: "/monetization/subscriptions",
            pathPattern: /\/monetization\/subscriptions/,
            title: (0, t.Q)("Heading.Subscriptions", a.f.Navigation),
            group: n
        },
        p = {
            path: "/analytics/memory-stores",
            pathPattern: /\/analytics\/memory-stores/,
            title: (0, t.Q)("Heading.MemoryStores", a.f.Navigation)
        },
        h = {
            path: "/analytics/queue-service",
            pathPattern: /\/analytics\/queue-service/,
            title: (0, t.Q)("Heading.QueueService", a.f.Navigation)
        },
        g = {
            path: "/analytics/data-stores",
            pathPattern: /\/analytics\/data-stores/,
            title: (0, t.Q)("Heading.DataStores", a.f.Navigation)
        },
        f = {
            path: "/analytics/http-service",
            pathPattern: /\/analytics\/http-service/,
            title: (0, t.Q)("Heading.HttpService", a.f.Navigation)
        },
        m = {
            path: "/analytics/messaging-service",
            pathPattern: /\/analytics\/messaging-service/,
            title: (0, t.Q)("Heading.MessagingService", a.f.Navigation)
        },
        v = {
            path: "/analytics/speech-to-text",
            pathPattern: /\/analytics\/speech-to-text/,
            title: (0, t.Q)("Heading.SpeechToText", a.f.Navigation)
        },
        y = {
            path: "/analytics/text-to-speech",
            pathPattern: /\/analytics\/text-to-speech/,
            title: (0, t.Q)("Heading.TextToSpeech", a.f.Navigation)
        },
        b = {
            path: "/analytics/video-service",
            pathPattern: /\/analytics\/video-service/,
            title: (0, t.Q)("Heading.VideoService", a.f.Navigation)
        },
        P = {
            path: "/monetization/creator-rewards",
            pathPattern: /\/monetization\/creator-rewards/,
            title: (0, t.Q)("Heading.CreatorRewards", a.f.Navigation),
            group: n
        },
        w = {
            path: "/monetization/roblox-plus",
            pathPattern: /\/monetization\/roblox-plus/,
            title: (0, t.Q)("Heading.RobloxPlusDeveloperProgram", a.f.Navigation),
            group: n
        },
        x = {
            path: "/analytics/performance",
            pathPattern: /\/analytics\/performance/,
            title: (0, t.Q)("Heading.Performance", a.f.Navigation)
        },
        C = {
            path: "/analytics/crashes",
            pathPattern: /\/analytics\/crashes/,
            title: (0, t.Q)("Heading.Crashes", a.f.Analytics)
        },
        A = {
            path: "/analytics/errors",
            pathPattern: /\/analytics\/errors/,
            title: (0, t.Q)("Heading.ErrorReport", a.f.Navigation)
        },
        k = {
            path: "/analytics/audience",
            pathPattern: /\/analytics\/audience/,
            title: (0, t.Q)("Heading.Demographics", a.f.Navigation)
        },
        I = {
            path: "/analytics/economy",
            pathPattern: /\/analytics\/economy/,
            title: (0, t.Q)("Heading.Economy", a.f.Navigation)
        },
        N = {
            path: "/analytics/funnels",
            pathPattern: /\/analytics\/funnels/,
            title: (0, t.Q)("Heading.Funnels", a.f.Navigation)
        },
        S = {
            path: "/analytics/explore",
            pathPattern: /\/analytics\/explore/,
            title: (0, t.Q)("Heading.Explore", a.f.Navigation)
        },
        G = {
            path: "/analytics/dashboards",
            pathPattern: /\/analytics\/dashboards/,
            title: (0, t.Q)("Heading.CustomDashboards", a.f.Navigation)
        },
        H = {
            path: "/analytics/retention",
            pathPattern: /\/analytics\/retention/,
            title: (0, t.Q)("Heading.Retention", a.f.Navigation)
        },
        E = {
            path: "/analytics/engagement",
            pathPattern: /\/analytics\/engagement/,
            title: (0, t.Q)("Heading.Engagement", a.f.Navigation)
        },
        Q = {
            path: "/analytics/acquisition",
            pathPattern: /\/analytics\/acquisition/,
            title: (0, t.Q)("Heading.Acquisition", a.f.Navigation),
            group: i
        },
        M = {
            path: "/analytics/acquisition?tab=homeRecommendations",
            pathPattern: /\/analytics\/acquisition\?tab=homeRecommendations/,
            title: (0, t.Q)("Heading.Acquisition", a.f.Navigation),
            group: i
        },
        R = {
            path: "/analytics/custom",
            pathPattern: /\/analytics\/custom/,
            title: (0, t.Q)("Heading.CustomEvents", a.f.Navigation)
        },
        F = {
            path: "/analytics/journeys",
            pathPattern: /\/analytics\/journeys/,
            title: (0, t.Q)("Heading.Journeys", a.f.Navigation)
        },
        j = {
            path: "/analytics/journeys/create",
            pathPattern: /\/analytics\/journeys\/create/,
            title: (0, t.Q)("Heading.JourneyEventsConfigCreate", a.f.Navigation)
        },
        T = {
            path: "/analytics/journeys/edit",
            pathPattern: /\/analytics\/journeys\/edit/,
            title: (0, t.Q)("Heading.JourneyEventsConfigCreate", a.f.Navigation)
        },
        U = {
            path: "/analytics/journeys/view",
            pathPattern: /\/analytics\/journeys\/view/,
            title: (0, t.Q)("Heading.Journeys", a.f.Navigation)
        },
        D = {
            path: "/feedback",
            pathPattern: /\/feedback/,
            title: (0, t.Q)("Heading.Feedback", a.f.PlayerFeedback)
        },
        q = {
            path: "/configs/history",
            pathPattern: /\/configs\/history/,
            title: (0, t.Q)("Heading.ConfigsHistory", a.f.Navigation),
            titleOverrideForIAM2: (0, t.Q)("Heading.ConfigHistory", a.f.Navigation)
        },
        O = {
            path: "/configs",
            pathPattern: /\/configs(?!\/)/,
            title: (0, t.Q)("Heading.Configs", a.f.Navigation)
        },
        z = {
            path: "/configs/config-create",
            pathPattern: /\/configs\/config-create/,
            title: (0, t.Q)("Heading.ConfigCreate", a.f.Navigation)
        },
        B = {
            path: "/alerts",
            pathPattern: /\/alerts(?!\/)/,
            title: (0, t.Q)("Heading.Alerts", a.f.Navigation)
        },
        L = {
            path: "/alerts/create",
            pathPattern: /\/alerts\/create/,
            title: (0, t.Q)("Heading.CreateAlert", a.f.ExperienceAlerts)
        },
        _ = {
            path: "/alerts",
            pathPattern: /\/alerts\/\d+\/configure$/,
            title: (0, t.Q)("Heading.ConfigureAlert", a.f.Navigation)
        },
        V = {
            path: "/matchmaking",
            pathPattern: /\/matchmaking/,
            title: (0, t.Q)("Heading.CustomMatchmaking", a.f.Matchmaking)
        },
        X = {
            path: "/monetization/commerce",
            pathPattern: /\/monetization\/commerce/,
            title: (0, t.Q)("Heading.Commerce", a.f.Navigation),
            group: n
        },
        K = {
            path: "/analytics/assistant",
            pathPattern: /\/analytics\/assistant/,
            title: (0, t.Q)("Heading.Assistant", a.f.Analytics)
        },
        J = {
            path: "/analytics/agent",
            pathPattern: /\/analytics\/agent/,
            title: (0, t.Q)("Heading.Assistant", a.f.Analytics)
        },
        W = {
            path: "/analytics/ai-chat",
            pathPattern: /\/analytics\/ai-chat/,
            title: (0, t.Q)("Heading.Assistant", a.f.Analytics)
        },
        Y = {
            path: "/experiments/experiment-create",
            pathPattern: /\/experiments\/experiment-create/,
            title: (0, t.Q)("Heading.ExperimentsCreate", a.f.Navigation),
            titleOverrideForIAM2: (0, t.o)("Heading.Experimentation"),
            group: r
        },
        $ = {
            path: "/recommendation-service",
            pathPattern: /\/recommendation-service/,
            title: (0, t.Q)("Heading.RecommendationService", a.f.Navigation)
        },
        Z = {
            path: "/safety/overview",
            pathPattern: /\/safety\/overview/,
            title: (0, t.Q)("Heading.SafetyOverview", a.f.Analytics),
            titleOverrideForIAM2: (0, t.Q)("Heading.Safety", a.f.Navigation)
        },
        ee = {
            path: "/overview",
            pathPattern: /\/overview(?![/\w])/,
            title: (0, t.Q)("Heading.Overview", a.f.Navigation)
        },
        et = {
            path: "/thumbnails",
            pathPattern: /\/places\/\d+\/thumbnails$/,
            title: (0, t.Q)("Heading.Thumbnails", a.f.Navigation)
        },
        ea = {
            path: "/notifications",
            pathPattern: /\/notifications/,
            title: (0, t.Q)("Heading.Notifications", a.f.Navigation)
        },
        en = {
            path: "/experience-subscriptions",
            pathPattern: /\/experience-subscriptions/,
            title: (0, t.Q)("Heading.Subscriptions", a.f.Navigation),
            group: n
        },
        ei = {
            path: "/analytics/generative-ai",
            pathPattern: /\/analytics\/generative-ai/,
            title: (0, t.Q)("Heading.GenerativeAI", a.f.Navigation)
        },
        er = {
            path: "/monetization/avatar-creation-tokens",
            pathPattern: /\/monetization\/avatar-creation-tokens/,
            title: (0, t.Q)("Heading.AvatarCreationTokens", a.f.AvatarAnalytics),
            titleOverrideForIAM2: (0, t.Q)("Heading.AvatarCreationTokens", a.f.Navigation),
            group: n
        },
        es = [M, Q, E, H, n, s, o, c, l, u, d, p, h, g, f, m, v, y, b, ei, P, w, x, C, A, k, I, N, F, j, T, U, S, G, R, K, J, W, D, q, O, z, V, X, Z, ee, i, r, Y, $, et, ea, en, L, _, B, er];
    e.s(["Q3", 0, J, "l9", 0, W, "g1", 0, _, "PS", 0, L, "rf", 0, B, "ib", 0, i, "xG", 0, K, "gX", 0, k, "kg", 0, er, "is", 0, w, "DH", 0, X, "nu", 0, q, "m2", 0, O, "aQ", 0, C, "c3", 0, ee, "dX", 0, G, "Np", 0, R, "jc", 0, g, "P_", 0, E, "Pu", 0, A, "th", 0, P, "pr", 0, en, "bw", 0, Y, "Ap", 0, r, "Iv", 0, S, "Iw", 0, D, "p_", 0, ei, "jY", 0, f, "Kh", 0, u, "j$", 0, c, "uv", 0, s, "fX", 0, o, "Em", 0, V, "Bt", 0, p, "Vs", 0, m, "du", 0, n, "rJ", 0, ea, "Xe", 0, x, "IQ", 0, h, "pj", 0, $, "vH", 0, I, "Ya", 0, N, "kL", 0, j, "e_", 0, T, "rS", 0, F, "ko", 0, U, "bm", 0, H, "jd", 0, Z, "k7", 0, v, "t", 0, d, "Cu", 0, y, "FO", 0, Q, "N$", 0, M, "D2", 0, b, "xL", 0, function(e) {
        return es.find(t => t.pathPattern.test(e))
    }])
}, 894854, e => {
    "use strict";
    var t = e.i(893949);
    e.s(["f", () => t.U])
}, 767112, e => {
    "use strict";
    var t = e.i(726474);
    e.s(["f", 0, t])
}, 174528, 271773, e => {
    "use strict";
    var t = e.i(785517),
        a = e.i(643766),
        n = e.i(260241),
        i = e.i(805290),
        r = e.i(680241),
        s = e.i(882782),
        o = e.i(910272),
        c = e.i(415858),
        l = function(e, t) {
            return (l = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var a in t) Object.prototype.hasOwnProperty.call(t, a) && (e[a] = t[a])
            })(e, t)
        };

    function u(e, t, a, n) {
        return new(a || (a = Promise))(function(i, r) {
            function s(e) {
                try {
                    c(n.next(e))
                } catch (e) {
                    r(e)
                }
            }

            function o(e) {
                try {
                    c(n.throw(e))
                } catch (e) {
                    r(e)
                }
            }

            function c(e) {
                var t;
                e.done ? i(e.value) : ((t = e.value) instanceof a ? t : new a(function(e) {
                    e(t)
                })).then(s, o)
            }
            c((n = n.apply(e, t || [])).next())
        })
    }

    function d(e, t) {
        var a, n, i, r = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            },
            s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return s.next = o(0), s.throw = o(1), s.return = o(2), "function" == typeof Symbol && (s[Symbol.iterator] = function() {
            return this
        }), s;

        function o(o) {
            return function(c) {
                var l = [o, c];
                if (a) throw TypeError("Generator is already executing.");
                for (; s && (s = 0, l[0] && (r = 0)), r;) try {
                    if (a = 1, n && (i = 2 & l[0] ? n.return : l[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, l[1])).done) return i;
                    switch (n = 0, i && (l = [2 & l[0], i.value]), l[0]) {
                        case 0:
                        case 1:
                            i = l;
                            break;
                        case 4:
                            return r.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            r.label++, n = l[1], l = [0];
                            continue;
                        case 7:
                            l = r.ops.pop(), r.trys.pop();
                            continue;
                        default:
                            if (!(i = (i = r.trys).length > 0 && i[i.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                r = 0;
                                continue
                            }
                            if (3 === l[0] && (!i || l[1] > i[0] && l[1] < i[3])) {
                                r.label = l[1];
                                break
                            }
                            if (6 === l[0] && r.label < i[1]) {
                                r.label = i[1], i = l;
                                break
                            }
                            if (i && r.label < i[2]) {
                                r.label = i[2], r.ops.push(l);
                                break
                            }
                            i[2] && r.ops.pop(), r.trys.pop();
                            continue
                    }
                    l = t.call(e, r)
                } catch (e) {
                    l = [6, e], n = 0
                } finally {
                    a = i = 0
                }
                if (5 & l[0]) throw l[1];
                return {
                    value: l[0] ? l[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function p(e) {
        if (void 0 !== e) return null === e ? null : {
            userId: e.userId,
            featureName: e.featureName,
            namespace: e.namespace
        }
    }
    "function" == typeof SuppressedError && SuppressedError;
    var h = function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        return function(e, t) {
            if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

            function a() {
                this.constructor = e
            }
            l(e, t), e.prototype = null === t ? Object.create(t) : (a.prototype = t.prototype, new a)
        }(t, e), t.prototype.accessManagementAPIGetFeatureAccessRaw = function(e, t) {
            return u(this, void 0, void 0, function() {
                var a, n, i;
                return d(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return a = {}, void 0 !== e.featureNames && (a.featureNames = e.featureNames), void 0 !== e.namespace && (a.namespace = e.namespace), void 0 !== e.extraParameters && (a.extraParameters = e.extraParameters), n = {}, [4, this.request({
                                path: "/v1/feature-access",
                                schemaPath: "/v1/feature-access",
                                method: "GET",
                                headers: n,
                                query: a
                            }, t)];
                        case 1:
                            return i = r.sent(), [2, new c.V(i)]
                    }
                })
            })
        }, t.prototype.accessManagementAPIGetFeatureAccess = function() {
            return u(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), d(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.accessManagementAPIGetFeatureAccessRaw(e, t)];
                        case 1:
                            return a.sent(), [2]
                    }
                })
            })
        }, t.prototype.accessManagementAPIGetPairwiseFeatureAccessRaw = function(e, t) {
            return u(this, void 0, void 0, function() {
                var a, n, i;
                return d(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return a = {}, void 0 !== e.featureName && (a.featureName = e.featureName), void 0 !== e.namespace && (a.namespace = e.namespace), void 0 !== e.targetUserId && (a.targetUserId = e.targetUserId), e.otherUserIds && (a.otherUserIds = e.otherUserIds), n = {}, [4, this.request({
                                path: "/v1/pairwise-feature-access",
                                schemaPath: "/v1/pairwise-feature-access",
                                method: "GET",
                                headers: n,
                                query: a
                            }, t)];
                        case 1:
                            return i = r.sent(), [2, new c.V(i)]
                    }
                })
            })
        }, t.prototype.accessManagementAPIGetPairwiseFeatureAccess = function() {
            return u(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), d(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.accessManagementAPIGetPairwiseFeatureAccessRaw(e, t)];
                        case 1:
                            return a.sent(), [2]
                    }
                })
            })
        }, t.prototype.accessManagementAPIGetRCCOwnerFeatureAccessRaw = function(e, t) {
            return u(this, void 0, void 0, function() {
                var a, n, i;
                return d(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return a = {}, void 0 !== e.featureNames && (a.featureNames = e.featureNames), void 0 !== e.namespace && (a.namespace = e.namespace), void 0 !== e.extraParameters && (a.extraParameters = e.extraParameters), n = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (n["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                                path: "/v1/rcc-owner-feature-access",
                                schemaPath: "/v1/rcc-owner-feature-access",
                                method: "GET",
                                headers: n,
                                query: a
                            }, t)];
                        case 1:
                            return i = r.sent(), [2, new c.V(i)]
                    }
                })
            })
        }, t.prototype.accessManagementAPIGetRCCOwnerFeatureAccess = function() {
            return u(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), d(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.accessManagementAPIGetRCCOwnerFeatureAccessRaw(e, t)];
                        case 1:
                            return a.sent(), [2]
                    }
                })
            })
        }, t.prototype.accessManagementAPIGetRCCUserFeatureAccessRaw = function(e, t) {
            return u(this, void 0, void 0, function() {
                var a, n, i;
                return d(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return a = {}, void 0 !== e.featureNames && (a.featureNames = e.featureNames), void 0 !== e.userId && (a.userId = e.userId), void 0 !== e.namespace && (a.namespace = e.namespace), void 0 !== e.extraParameters && (a.extraParameters = e.extraParameters), n = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (n["Roblox-Place-Id"] = String(e.robloxPlaceId)), void 0 !== e.robloxGameId && null !== e.robloxGameId && (n["Roblox-Game-Id"] = String(e.robloxGameId)), [4, this.request({
                                path: "/v1/rcc-user-feature-access",
                                schemaPath: "/v1/rcc-user-feature-access",
                                method: "GET",
                                headers: n,
                                query: a
                            }, t)];
                        case 1:
                            return i = r.sent(), [2, new c.V(i)]
                    }
                })
            })
        }, t.prototype.accessManagementAPIGetRCCUserFeatureAccess = function() {
            return u(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), d(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.accessManagementAPIGetRCCUserFeatureAccessRaw(e, t)];
                        case 1:
                            return a.sent(), [2]
                    }
                })
            })
        }, t.prototype.accessManagementAPIGetRCCUserFeatureEvaluationRaw = function(e, t) {
            return u(this, void 0, void 0, function() {
                var a, n, i;
                return d(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return a = {}, (n = {})["Content-Type"] = "application/json", void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (n["Roblox-Place-Id"] = String(e.robloxPlaceId)), void 0 !== e.robloxGameId && null !== e.robloxGameId && (n["Roblox-Game-Id"] = String(e.robloxGameId)), [4, this.request({
                                path: "/v1/rcc-user-feature-evaluation",
                                schemaPath: "/v1/rcc-user-feature-evaluation",
                                method: "POST",
                                headers: n,
                                query: a,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        requests: void 0 === e.requests ? void 0 : null === e.requests ? null : e.requests.map(p)
                                    }
                                }(e.accessManagementAPIGetRCCUserFeatureEvaluationRequest)
                            }, t)];
                        case 1:
                            return i = r.sent(), [2, new c.V(i)]
                    }
                })
            })
        }, t.prototype.accessManagementAPIGetRCCUserFeatureEvaluation = function() {
            return u(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), d(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.accessManagementAPIGetRCCUserFeatureEvaluationRaw(e, t)];
                        case 1:
                            return a.sent(), [2]
                    }
                })
            })
        }, t.prototype.accessManagementAPIGetUpsellFeatureAccessRaw = function(e, t) {
            return u(this, void 0, void 0, function() {
                var a, n, i;
                return d(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return a = {}, void 0 !== e.featureName && (a.featureName = e.featureName), void 0 !== e.namespace && (a.namespace = e.namespace), void 0 !== e.extraParameters && (a.extraParameters = e.extraParameters), void 0 !== e.successfulActions && (a.successfulActions = e.successfulActions), n = {}, [4, this.request({
                                path: "/v1/upsell-feature-access",
                                schemaPath: "/v1/upsell-feature-access",
                                method: "GET",
                                headers: n,
                                query: a
                            }, t)];
                        case 1:
                            return i = r.sent(), [2, new c.V(i)]
                    }
                })
            })
        }, t.prototype.accessManagementAPIGetUpsellFeatureAccess = function() {
            return u(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), d(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.accessManagementAPIGetUpsellFeatureAccessRaw(e, t)];
                        case 1:
                            return a.sent(), [2]
                    }
                })
            })
        }, t.prototype.accessManagementAPIPostPairwiseFeatureAccessRaw = function(e, t) {
            return u(this, void 0, void 0, function() {
                var a, n, i;
                return d(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return a = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/pairwise-feature-access",
                                schemaPath: "/v1/pairwise-feature-access",
                                method: "POST",
                                headers: n,
                                query: a,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        featureName: e.featureName,
                                        namespace: e.namespace,
                                        targetUserId: e.targetUserId,
                                        otherUserIds: e.otherUserIds
                                    }
                                }(e.accessManagementAPIPostPairwiseFeatureAccessRequest)
                            }, t)];
                        case 1:
                            return i = r.sent(), [2, new c.V(i)]
                    }
                })
            })
        }, t.prototype.accessManagementAPIPostPairwiseFeatureAccess = function() {
            return u(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), d(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.accessManagementAPIPostPairwiseFeatureAccessRaw(e, t)];
                        case 1:
                            return a.sent(), [2]
                    }
                })
            })
        }, t
    }(c._);
    e.s(["f", 0, h], 271773);
    var g = e.i(884399);
    let f = new Map,
        m = async (e, t, a) => {
            let n, i, r = (n = "".concat(e, "/access-management"), (i = f.get(n)) || (i = new h(new c.x({
                basePath: n,
                credentials: "include",
                enableMrRouter: !0
            })), f.set(n, i)), i);
            try {
                let e = await r.accessManagementAPIGetUpsellFeatureAccessRaw({
                    featureName: t,
                    namespace: a
                });
                return await e.raw.json()
            } catch (t) {
                let e = t instanceof Error ? t.message : "Unknown error";
                throw Error("Failed to check feature access: ".concat(e), {
                    cause: t
                })
            }
        }, v = new Map, y = e => {
            let t = v.get(e);
            return t || (t = new g.f(new c.x({
                basePath: e,
                credentials: "include",
                enableMrRouter: !0
            })), v.set(e, t)), t
        }, b = async e => {
            let t = y(e);
            try {
                await t.userSettingsApiSetGlobalPrivacyControl()
            } catch (t) {
                let e = t instanceof Error ? t.message : "Unknown error";
                throw Error("Failed to set Global Privacy Control: ".concat(e), {
                    cause: t
                })
            }
        }, P = async e => {
            let t = y(e);
            try {
                return await t.userSettingsApiGet({
                    requestedUserSettings: "allowSellShareData"
                })
            } catch (t) {
                let e = t instanceof Error ? t.message : "Unknown error";
                throw Error("Failed to get user settings: ".concat(e), {
                    cause: t
                })
            }
        }, w = () => !("u" < typeof navigator) && !!navigator.globalPrivacyControl, x = async e => {
            var t, a;
            if (e && (null == (a = window.evidon) || null == (t = a.notice) ? void 0 : t.showOptions)) try {
                window.evidon.notice.showOptions()
            } catch (e) {
                console.error("Failed to call Evidon API:", e)
            }
        };
    class C {
        updateCookiePreferences(e) {
            this.currentCookiePreferences = {
                ...e
            }
        }
        hasCookiePreferencesChanged() {
            return Array.from(new Set([...Object.keys(this.currentCookiePreferences), ...Object.keys(this.initialCookiePreferences)])).some(e => this.currentCookiePreferences[e] !== this.initialCookiePreferences[e])
        }
        getGpcState() {
            let e = w(),
                t = this.hasCookiePreferencesChanged();
            return {
                isGpcDetected: e,
                initialGpcState: this.initialGpcState,
                hasUserMadeCookieChanges: t,
                scenario: e ? t ? "signal-with-changes" : "signal-honored" : "no-signal"
            }
        }
        initializeEvidon(e) {
            var t;
            let a;
            e && (x(e).catch(e => {
                console.error("Failed to call Evidon API:", e)
            }), this.evidonCleanup = (t = () => {}, a = () => {
                try {
                    var e, a;
                    (null == (a = window.evidon) || null == (e = a.notice) ? void 0 : e.userGpcEnabled) !== void 0 && t(window.evidon.notice.userGpcEnabled)
                } catch (e) {
                    console.error("Failed to extract GPC signal from Evidon event:", e)
                }
            }, window.addEventListener("evidon-consent-change", a), () => {
                window.removeEventListener("evidon-consent-change", a)
            }))
        }
        cleanup() {
            this.evidonCleanup && (this.evidonCleanup(), this.evidonCleanup = null)
        }
        constructor(e = {}) {
            (0, i._)(this, "initialGpcState", void 0), (0, i._)(this, "evidonCleanup", null), (0, i._)(this, "initialCookiePreferences", void 0), (0, i._)(this, "currentCookiePreferences", void 0), this.initialGpcState = w(), this.initialCookiePreferences = {
                ...e
            }, this.currentCookiePreferences = {
                ...e
            }
        }
    }
    var A = e.i(79187),
        k = e.i(446475),
        I = e.i(47277),
        N = e.i(870999),
        S = e.i(67243),
        G = e.i(814975);
    let H = (0, S.f)()(() => ({
            container: {
                textAlign: "center",
                paddingTop: "20px",
                paddingBottom: "20px",
                width: "100%",
                marginTop: "0",
                marginBottom: "0"
            },
            link: {
                textDecoration: "none",
                display: "inline-flex",
                alignItems: "center",
                cursor: "pointer",
                "&:hover": {
                    textDecoration: "underline"
                },
                "&:visited": {
                    color: "inherit"
                }
            },
            icon: {
                marginLeft: "8px",
                verticalAlign: "middle",
                height: "16px",
                width: "auto"
            }
        })),
        E = "Title.GpcDetected",
        Q = "Body.GpcDetectedSettingDisabledIneligible",
        M = "Body.GpcDetectedSettingDisabledEligible",
        R = "Body.GpcDetectedSettingEnabledIneligible",
        F = "Body.GpcMissingSettingIneligible",
        j = (0, S.f)()(() => ({
            modalLink: {
                color: "inherit",
                textDecoration: "none",
                "&:hover": {
                    textDecoration: "underline"
                },
                "&:focus": {
                    textDecoration: "underline"
                }
            },
            inlineLink: {
                display: "inline-flex",
                alignItems: "center"
            },
            inlineIcon: {
                marginLeft: "8px",
                height: "16px",
                width: "auto",
                verticalAlign: "middle"
            }
        })),
        T = e => {
            var n, i;
            let {
                gpcState: o,
                modalData: c,
                translate: l,
                translateHTML: u,
                handleClose: d,
                privacyPreferencesUrl: p,
                modalLinkClass: h
            } = e, {
                user: g
            } = (0, G.f)(), f = !!g, m = null != (n = null == c ? void 0 : c.isAdsSellShareDataEnabled) && n, v = null != (i = null == c ? void 0 : c.canUserManageAdsSettings) && i, y = (0, a.useCallback)(e => {
                window.location.pathname.includes("/my/account") && (e.preventDefault(), window.location.href = p)
            }, [p]), b = (0, a.useCallback)(e => (0, t.jsx)(k.f, {
                href: "https://en.help.roblox.com/hc/articles/28943243301780",
                target: "_blank",
                rel: "noreferrer",
                className: h,
                children: e
            }), [h]), P = (0, a.useCallback)(e => (0, t.jsx)(k.f, {
                href: p,
                className: h,
                onClick: y,
                children: e
            }), [p, h, y]), w = (0, a.useMemo)(() => (0, t.jsx)("br", {}), []), x = (0, a.useCallback)((e, n) => {
                let i = (l(e, {
                        link: "",
                        hrefEnd: ""
                    }) || "").replaceAll(/{link}/g, "").replaceAll(/{hrefEnd}/g, ""),
                    r = i.split(/{aTagWithHref}|{aTagEnd}/),
                    s = e => {
                        let n = e.split(/{lineBreak}/);
                        return 1 === n.length ? e : (0, t.jsx)(t.Fragment, {
                            children: n.map((e, i) => {
                                let r = "linebreak-".concat(i, "-").concat(e.substring(0, 10));
                                return (0, t.jsxs)(a.Fragment, {
                                    children: [e, i < n.length - 1 && w]
                                }, r)
                            })
                        })
                    };
                return 3 === r.length ? (0, t.jsxs)(t.Fragment, {
                    children: [s(r[0]), n(r[1]), s(r[2])]
                }) : s(i)
            }, [l, w]);
            return (0, t.jsxs)(t.Fragment, {
                children: [(0, t.jsxs)(r.K, {
                    children: [(0, t.jsx)(r.F, {
                        className: "text-heading-small",
                        children: o.isGpcDetected ? l(E) || "" : l("Title.NoGpcDetected") || ""
                    }), (0, t.jsx)("div", {
                        className: "text-body-medium",
                        children: (() => {
                            if (!f) {
                                let e = [{
                                        opening: "aTagStart",
                                        closing: "aTagEnd",
                                        content: b
                                    }],
                                    t = {
                                        lineBreak: w
                                    };
                                return o.isGpcDetected ? m ? u(R, e, t) : u(Q, e, t) : u(F, e, t)
                            }
                            if (!o.isGpcDetected) return v ? x("Body.GpcMissingSettingEligible", P) : u(F, [{
                                opening: "aTagStart",
                                closing: "aTagEnd",
                                content: b
                            }], {
                                lineBreak: w
                            });
                            if (m) return v ? x("Body.GpcDetectedSettingEnabledEligible", P) : u(R, [{
                                opening: "aTagStart",
                                closing: "aTagEnd",
                                content: b
                            }], {
                                lineBreak: w
                            });
                            let e = v ? {
                                tags: [{
                                    opening: "aTagWithHref",
                                    closing: "aTagEnd",
                                    content: P
                                }],
                                args: {
                                    lineBreak: w
                                }
                            } : {
                                tags: [{
                                    opening: "aTagStart",
                                    closing: "aTagEnd",
                                    content: b
                                }],
                                args: {
                                    lineBreak: w
                                }
                            };
                            if ("signal-with-changes" === o.scenario) return v ? x(M, P) : u(Q, e.tags, e.args);
                            let t = v ? M : Q;
                            return v ? x(t, P) : u(t, e.tags, e.args)
                        })()
                    })]
                }), (0, t.jsx)(r.c, {
                    className: "width-full",
                    children: (0, t.jsx)(s.f, {
                        className: "width-full",
                        size: "Large",
                        variant: "Emphasis",
                        onClick: d,
                        children: l("Action.Ok") || ""
                    })
                })]
            })
        },
        U = e => {
            let {
                inline: i = !1
            } = e, {
                translate: s,
                translateHTML: c
            } = (0, A.A)(), l = (0, A.z)(), u = (0, n.a)().preferences, d = (0, a.useRef)(null), p = (0, a.useRef)(!1), [h, g] = (0, a.useState)(!1), {
                classes: {
                    container: f
                }
            } = H(), {
                classes: v
            } = j(), y = (0, a.useCallback)(() => {
                if ("u" < typeof document) return {};
                let e = document.cookie.split("; ").find(e => e.startsWith("RBXcb="));
                if (!e) return {};
                let t = e.substring(6),
                    a = t;
                try {
                    a = decodeURIComponent(t)
                } catch (e) {}
                let n = {};
                return a.split("&").forEach(e => {
                    let [t, a] = e.split("=");
                    t && (n[t] = "true" === a)
                }), n
            }, []), [w, x] = (0, a.useState)({
                isGpcDetected: !1,
                initialGpcState: !1,
                hasUserMadeCookieChanges: !1,
                scenario: "no-signal"
            });
            (0, a.useEffect)(() => () => {
                d.current && d.current.cleanup()
            }, []), (0, a.useEffect)(() => {
                if (h && !p.current) {
                    let e = y();
                    d.current = new C(Object.keys(e).length > 0 ? e : u), p.current = !0, x(d.current.getGpcState())
                }
            }, [h, u, y]), (0, a.useEffect)(() => {
                if (d.current) {
                    let e = y(),
                        t = Object.keys(e).length > 0 ? e : u;
                    d.current.updateCookiePreferences(t);
                    let a = d.current.getGpcState();
                    x(e => e.scenario !== a.scenario || e.isGpcDetected !== a.isGpcDetected || e.hasUserMadeCookieChanges !== a.hasUserMadeCookieChanges ? a : e)
                }
            }, [u, y]), (0, a.useEffect)(() => {
                if (!d.current) return;
                let e = setInterval(() => {
                    if (d.current) {
                        let e = y(),
                            t = Object.keys(e).length > 0 ? e : u;
                        d.current.updateCookiePreferences(t);
                        let a = d.current.getGpcState();
                        x(e => e.scenario !== a.scenario || e.isGpcDetected !== a.isGpcDetected || e.hasUserMadeCookieChanges !== a.hasUserMadeCookieChanges ? a : e)
                    }
                }, 2e3);
                return () => clearInterval(e)
            }, [u, y]);
            let {
                user: k
            } = (0, G.f)(), S = !!k, {
                data: Q,
                isLoading: M
            } = (e => {
                let {
                    showModal: t,
                    gpcTrackerRef: a,
                    userSettingsApiBaseUrl: n,
                    apiGatewayBaseUrl: i,
                    isAuthenticated: r
                } = e;
                return (0, o.f)({
                    queryKey: ["yourPrivacyChoicesModal", t],
                    queryFn: async () => {
                        var e, t, s;
                        let o = null != (e = null == r ? void 0 : r()) && e,
                            c = null != (t = null == (s = a.current) ? void 0 : s.getGpcState()) ? t : {
                                isGpcDetected: !1,
                                scenario: "no-signal"
                            },
                            {
                                isGpcDetected: l
                            } = c;
                        o && l && await b(n);
                        let u = !1;
                        if (o) try {
                            let {
                                access: e
                            } = await m(i, "ShouldShowAdsSettings", "account_management/UserSettingsPolicy");
                            u = "Granted" === e
                        } catch (e) {
                            console.error("Failed to check feature access:", e)
                        }
                        let d = !1;
                        if (o) try {
                            let e = await P(n);
                            d = "Enabled" === e.allowSellShareData
                        } catch (e) {
                            console.error("Failed to get user settings:", e)
                        } else if ("u" > typeof document) {
                            let e = document.cookie.split("; ").find(e => e.trim().startsWith("RBXcb="));
                            if (e) {
                                let t = e.substring(6),
                                    a = t;
                                try {
                                    a = decodeURIComponent(t)
                                } catch (e) {}
                                let n = a.split("&"),
                                    i = n.some(e => {
                                        let [t, a] = e.split("=");
                                        return "GoogleAnalytics" === t && "true" === a
                                    }),
                                    r = n.some(e => {
                                        let [t, a] = e.split("=");
                                        return "RBXSource" === t && "true" === a
                                    });
                                (i || r) && (d = !0)
                            }
                        } return {
                            isGpcDetected: l,
                            canUserManageAdsSettings: u,
                            isAdsSellShareDataEnabled: d,
                            scenario: c.scenario
                        }
                    },
                    enabled: t,
                    gcTime: 0
                })
            })({
                showModal: h,
                gpcTrackerRef: d,
                userSettingsApiBaseUrl: (0, a.useMemo)(() => "".concat("https://apis.roblox.com", "/user-settings-api"), []),
                apiGatewayBaseUrl: (0, a.useMemo)(() => "https://apis.roblox.com", []),
                isAuthenticated: () => S
            }), R = (0, a.useMemo)(() => l.locale ? (0, A.f)(l.locale) : "en_us", [l.locale]), F = (0, a.useMemo)(() => {
                let e = "/my/account#!/privacy/AdPreferences?locale=".concat(R);
                return "https://www.roblox.com".concat(e)
            }, [R]), U = (0, a.useCallback)(e => {
                e.preventDefault(), g(!0)
            }, []), D = (0, a.useCallback)(() => {
                g(!1)
            }, []), q = s("Label.YourPrivacyChoices") || "", O = (0, t.jsx)("button", {
                type: "button",
                onClick: U,
                style: {
                    display: "inline-flex",
                    alignItems: "center",
                    background: "none",
                    border: "none",
                    padding: 0,
                    cursor: "pointer",
                    color: "inherit"
                },
                children: (0, t.jsxs)(I.f, {
                    variant: "footer",
                    color: "secondary",
                    component: "span",
                    children: [q, (0, t.jsx)("img", {
                        src: "".concat("https://assets.create.roblox.com/1a533dbd56be917f38cf56bbcad2f6134bb9b38c/assets", "/navigation/privacy_icon.png"),
                        alt: "",
                        style: {
                            marginLeft: "8px",
                            height: "16px",
                            width: "auto",
                            verticalAlign: "middle"
                        }
                    })]
                })
            });
            return (0, t.jsxs)(t.Fragment, {
                children: [i ? O : (0, t.jsx)(N.f, {
                    classes: {
                        root: f
                    },
                    container: !0,
                    justifyContent: "center",
                    item: !0,
                    children: O
                }), (0, t.jsx)(r.N, {
                    open: h,
                    onOpenChange: D,
                    size: "Small",
                    isModal: !0,
                    hasCloseAffordance: !0,
                    closeLabel: s("Action.Close"),
                    children: (0, t.jsx)(r.d, {
                        children: M ? (0, t.jsxs)(r.K, {
                            children: [(0, t.jsx)(r.F, {
                                className: "text-heading-small",
                                children: s(E) || ""
                            }), (0, t.jsx)("div", {
                                className: "text-body-medium",
                                children: s("Description.Loading") || ""
                            })]
                        }) : (0, t.jsx)(T, {
                            gpcState: w,
                            modalData: Q,
                            translate: s,
                            translateHTML: c,
                            handleClose: D,
                            privacyPreferencesUrl: F,
                            modalLinkClass: v.modalLink
                        })
                    })
                })]
            })
        };
    e.s(["default", 0, e => {
        let {
            inline: a = !1
        } = e;
        try {
            return (0, t.jsx)(U, {
                inline: a
            })
        } catch (e) {
            return console.error("Error rendering PrivacyChoicesFooterLink:", e), null
        }
    }], 174528)
}, 86027, e => {
    "use strict";
    var t = e.i(118413),
        a = e.i(726474);
    let n = async e => a.dashboard.getServerManagementUrl(e, await (0, t.r)({
        universeId: e
    }));
    e.s(["Y", 0, e => e.includes("/observability/server-management"), "E", 0, n])
}]);

//# debugId=abea2c17-331e-d116-63fe-977a99297816
//# sourceMappingURL=0jzlynjw5l54w.js.map
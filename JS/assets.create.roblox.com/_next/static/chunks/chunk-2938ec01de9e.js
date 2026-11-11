;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "88248e3b-56b6-9d75-d21b-c3b07b57a178")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 512725, e => {
    "use strict";
    e.s(["f", 0, function e(t) {
        let n = t;
        var i = ({}).toString.call(t).slice(8, -1);
        if ("Set" == i) return new Set([...t].map(t => e(t)));
        if ("Map" == i) return new Map([...t].map(t => [e(t[0]), e(t[1])]));
        if ("Date" == i) return new Date(t.getTime());
        if ("RegExp" == i) return RegExp(t.source, function(e) {
            if ("string" == typeof e.source.flags) return e.source.flags;
            var t = [];
            return e.global && t.push("g"), e.ignoreCase && t.push("i"), e.multiline && t.push("m"), e.sticky && t.push("y"), e.unicode && t.push("u"), t.join("")
        }(t));
        if ("Array" == i || "Object" == i)
            for (var r in n = Array.isArray(t) ? [] : {}, t) n[r] = e(t[r]);
        return n
    }])
}, 949791, (e, t, n) => {
    "use strict";
    var i = e.r(643766).__CLIENT_INTERNALS_DO_NOT_USE_OR_WARN_USERS_THEY_CANNOT_UPGRADE;
    n.c = function(e) {
        return i.H.useMemoCache(e)
    }
}, 435968, (e, t, n) => {
    "use strict";
    t.exports = e.r(949791)
}, 663196, e => {
    "use strict";
    var t = e.i(626473);
    e.s(["f", () => t.n])
}, 336268, e => {
    "use strict";
    var t = e.i(415858);
    e.s(["f", () => t.a])
}, 923319, e => {
    "use strict";
    var t, n, i = e.i(730530),
        r = ((t = {}).BoldText = "boldText", t.Text = "text", t.TextWithDisplayValue = "textWithDisplayValue", t.Number = "number", t.Timestamp = "timestamp", t.RawJSONString = "RawJSONString", t.CodeDiff = "codeDiff", t.TextWithTooltip = "textWithTooltip", t.Other = "other", t.Selection = "selection", t.Actions = "actions", t.TextWithLink = "textWithLink", t.Image = "image", t.Date = "date", t.Status = "status", t.TextWithIcon = "TextWithIcon", t.Code = "code", t),
        o = ((n = {}).ValueOpacityFill = "valueOpacityFill", n.ValuePercentageWidthFill = "valuePercentageWidthFill", n.ConstantFill = "constantFill", n);
    e.s(["k", () => o, "V", () => r, "K", 0, {
        boldText: "left",
        text: "left",
        textWithDisplayValue: "left",
        number: "right",
        other: "left",
        timestamp: "left",
        RawJSONString: "left",
        codeDiff: "left",
        textWithTooltip: "left",
        selection: "center",
        actions: "center",
        textWithLink: "left",
        image: "left",
        date: "left",
        status: "left",
        TextWithIcon: "left",
        code: "left"
    }, "U", 0, (e, t, n) => void 0 !== n ? (0, i.q)(n) : "string" == typeof t ? t : e(t)])
}, 447311, e => {
    "use strict";
    var t, n = ((t = {}).Positive = "Positive", t.Negative = "Negative", t.Progression = "Progression", t.Highlight = "Highlight", t);
    e.s(["f", () => n])
}, 36826, 344112, e => {
    "use strict";
    var t, n, i, r, o, a, l = e.i(415858),
        s = function(e, t) {
            return (s = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
            })(e, t)
        };

    function u(e, t, n, i) {
        return new(n || (n = Promise))(function(r, o) {
            function a(e) {
                try {
                    s(i.next(e))
                } catch (e) {
                    o(e)
                }
            }

            function l(e) {
                try {
                    s(i.throw(e))
                } catch (e) {
                    o(e)
                }
            }

            function s(e) {
                var t;
                e.done ? r(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(a, l)
            }
            s((i = i.apply(e, t || [])).next())
        })
    }

    function d(e, t) {
        var n, i, r, o = {
                label: 0,
                sent: function() {
                    if (1 & r[0]) throw r[1];
                    return r[1]
                },
                trys: [],
                ops: []
            },
            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
            return this
        }), a;

        function l(l) {
            return function(s) {
                var u = [l, s];
                if (n) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, u[0] && (o = 0)), o;) try {
                    if (n = 1, i && (r = 2 & u[0] ? i.return : u[0] ? i.throw || ((r = i.return) && r.call(i), 0) : i.next) && !(r = r.call(i, u[1])).done) return r;
                    switch (i = 0, r && (u = [2 & u[0], r.value]), u[0]) {
                        case 0:
                        case 1:
                            r = u;
                            break;
                        case 4:
                            return o.label++, {
                                value: u[1],
                                done: !1
                            };
                        case 5:
                            o.label++, i = u[1], u = [0];
                            continue;
                        case 7:
                            u = o.ops.pop(), o.trys.pop();
                            continue;
                        default:
                            if (!(r = (r = o.trys).length > 0 && r[r.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                o = 0;
                                continue
                            }
                            if (3 === u[0] && (!r || u[1] > r[0] && u[1] < r[3])) {
                                o.label = u[1];
                                break
                            }
                            if (6 === u[0] && o.label < r[1]) {
                                o.label = r[1], r = u;
                                break
                            }
                            if (r && o.label < r[2]) {
                                o.label = r[2], o.ops.push(u);
                                break
                            }
                            r[2] && o.ops.pop(), o.trys.pop();
                            continue
                    }
                    u = t.call(e, o)
                } catch (e) {
                    u = [6, e], i = 0
                } finally {
                    n = r = 0
                }
                if (5 & u[0]) throw u[1];
                return {
                    value: u[0] ? u[1] : void 0,
                    done: !0
                }
            }
        }
    }
    "function" == typeof SuppressedError && SuppressedError;
    var c = {
        NUMBER_0: 0,
        NUMBER_1: 1,
        NUMBER_2: 2,
        NUMBER_3: 3,
        NUMBER_4: 4,
        NUMBER_5: 5,
        NUMBER_6: 6,
        NUMBER_7: 7,
        NUMBER_8: 8,
        NUMBER_9: 9,
        NUMBER_10: 10,
        NUMBER_11: 11,
        NUMBER_12: 12,
        NUMBER_13: 13,
        NUMBER_14: 14,
        NUMBER_15: 15,
        NUMBER_16: 16
    };

    function E(e) {
        var t, n, i, r, o, a, s, u, d, c, E, v, m, p, g, A, f, _;
        return null == (t = e) ? t : {
            id: (0, l.u)(t, "id") ? t.id : void 0,
            annotationType: (0, l.u)(t, "annotationType") ? t.annotationType : void 0,
            metadata: (0, l.u)(t, "metadata") ? null == (n = t.metadata) ? n : {
                placeIcon: (0, l.u)(n, "placeIcon") ? null == (i = n.placeIcon) ? i : {
                    iconAssetId: (0, l.u)(i, "iconAssetId") ? i.iconAssetId : void 0
                } : void 0,
                devProduct: (0, l.u)(n, "devProduct") ? null == (r = n.devProduct) ? r : {
                    name: (0, l.u)(r, "name") ? r.name : void 0,
                    imageAssetId: (0, l.u)(r, "imageAssetId") ? r.imageAssetId : void 0,
                    priceInRobux: (0, l.u)(r, "priceInRobux") ? r.priceInRobux : void 0
                } : void 0,
                gamePass: (0, l.u)(n, "gamePass") ? null == (o = n.gamePass) ? o : {
                    name: (0, l.u)(o, "name") ? o.name : void 0,
                    imageAssetId: (0, l.u)(o, "imageAssetId") ? o.imageAssetId : void 0,
                    priceInRobux: (0, l.u)(o, "priceInRobux") ? o.priceInRobux : void 0,
                    isForSale: (0, l.u)(o, "isForSale") ? o.isForSale : void 0
                } : void 0,
                placeThumbnail: (0, l.u)(n, "placeThumbnail") ? null == (a = n.placeThumbnail) ? a : {
                    thumbnailAssetId: (0, l.u)(a, "thumbnailAssetId") ? a.thumbnailAssetId : void 0,
                    thumbnailAssetIds: (0, l.u)(a, "thumbnailAssetIds") ? a.thumbnailAssetIds : void 0
                } : void 0,
                placeVersion: (0, l.u)(n, "placeVersion") ? null == (s = n.placeVersion) ? s : {
                    versionNumber: (0, l.u)(s, "versionNumber") ? s.versionNumber : void 0,
                    isPublished: (0, l.u)(s, "isPublished") ? s.isPublished : void 0
                } : void 0,
                benchmarkChange: (0, l.u)(n, "benchmarkChange") ? null == (u = n.benchmarkChange) ? u : {
                    fromBenchmarkType: (0, l.u)(u, "fromBenchmarkType") ? u.fromBenchmarkType : void 0,
                    toBenchmarkType: (0, l.u)(u, "toBenchmarkType") ? u.toBenchmarkType : void 0
                } : void 0,
                funnelStepNameChange: (0, l.u)(n, "funnelStepNameChange") ? null == (d = n.funnelStepNameChange) ? d : {
                    minStep: (0, l.u)(d, "minStep") ? d.minStep : void 0
                } : void 0,
                experienceEventState: (0, l.u)(n, "experienceEventState") ? null == (c = n.experienceEventState) ? c : {
                    eventId: (0, l.u)(c, "eventId") ? c.eventId : void 0,
                    eventName: (0, l.u)(c, "eventName") ? c.eventName : void 0,
                    imageAssetId: (0, l.u)(c, "imageAssetId") ? c.imageAssetId : void 0,
                    eventStateType: (0, l.u)(c, "eventStateType") ? c.eventStateType : void 0
                } : void 0,
                customMatchmaking: (0, l.u)(n, "customMatchmaking") ? null == (E = n.customMatchmaking) ? E : {
                    stateChange: (0, l.u)(E, "stateChange") ? E.stateChange : void 0,
                    scoringConfigurationName: (0, l.u)(E, "scoringConfigurationName") ? E.scoringConfigurationName : void 0
                } : void 0,
                engineRelease: (0, l.u)(n, "engineRelease") ? null == (v = n.engineRelease) ? v : {
                    platform: (0, l.u)(v, "platform") ? v.platform : void 0,
                    releaseMajorVersion: (0, l.u)(v, "releaseMajorVersion") ? v.releaseMajorVersion : void 0
                } : void 0,
                gamePreviewVideoStateChange: (0, l.u)(n, "gamePreviewVideoStateChange") ? null == (m = n.gamePreviewVideoStateChange) ? m : {
                    videoAssetId: (0, l.u)(m, "videoAssetId") ? m.videoAssetId : void 0,
                    universeId: (0, l.u)(m, "universeId") ? m.universeId : void 0,
                    gamePreviewVideoStateType: (0, l.u)(m, "gamePreviewVideoStateType") ? m.gamePreviewVideoStateType : void 0
                } : void 0,
                configChange: (0, l.u)(n, "configChange") ? null == (p = n.configChange) ? p : {
                    version: (0, l.u)(p, "version") ? p.version : void 0
                } : void 0,
                experimentationOperation: (0, l.u)(n, "experimentationOperation") ? null == (g = n.experimentationOperation) ? g : {
                    status: (0, l.u)(g, "status") ? g.status : void 0,
                    experimentName: (0, l.u)(g, "experimentName") ? g.experimentName : void 0,
                    exposurePercent: (0, l.u)(g, "exposurePercent") ? g.exposurePercent : void 0,
                    rampedVariantLabel: (0, l.u)(g, "rampedVariantLabel") ? g.rampedVariantLabel : void 0,
                    experimentId: (0, l.u)(g, "experimentId") ? g.experimentId : void 0
                } : void 0,
                globalAnnouncement: (0, l.u)(n, "globalAnnouncement") ? null == (A = n.globalAnnouncement) ? A : {
                    forAllPages: (0, l.u)(A, "forAllPages") ? A.forAllPages : void 0,
                    appliedMetrics: (0, l.u)(A, "appliedMetrics") ? A.appliedMetrics : void 0,
                    translationKey: (0, l.u)(A, "translationKey") ? A.translationKey : void 0,
                    links: (0, l.u)(A, "links") ? A.links : void 0
                } : void 0,
                extendedServicesEnablement: (0, l.u)(n, "extendedServicesEnablement") ? null == (f = n.extendedServicesEnablement) ? f : {
                    service: (0, l.u)(f, "service") ? f.service : void 0,
                    resource: (0, l.u)(f, "resource") ? f.resource : void 0,
                    enabled: (0, l.u)(f, "enabled") ? f.enabled : void 0,
                    enablementType: (0, l.u)(f, "enablementType") ? f.enablementType : void 0
                } : void 0,
                creatorRegexChange: (0, l.u)(n, "creatorRegexChange") ? null == (_ = n.creatorRegexChange) ? _ : {
                    regexOperation: (0, l.u)(_, "regexOperation") ? _.regexOperation : void 0
                } : void 0
            } : void 0,
            createdUtcTime: (0, l.u)(t, "createdUtcTime") ? t.createdUtcTime : void 0
        }
    }
    var v = function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        return function(e, t) {
            if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

            function n() {
                this.constructor = e
            }
            s(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
        }(t, e), t.prototype.v1UniversesUniverseIdAnnotationsGetRaw = function(e, t) {
            return u(this, void 0, void 0, function() {
                var n, i, r;
                return d(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new l.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdAnnotationsGet.");
                            return n = {}, void 0 !== e.annotationType && (n.annotationType = e.annotationType), void 0 !== e.inclusiveStartUtcTime && (n.inclusiveStartUtcTime = e.inclusiveStartUtcTime), void 0 !== e.inclusiveEndUtcTime && (n.inclusiveEndUtcTime = e.inclusiveEndUtcTime), void 0 !== e.cursor && (n.cursor = e.cursor), void 0 !== e.reverse && (n.reverse = e.reverse), void 0 !== e.resultsPerPage && (n.resultsPerPage = e.resultsPerPage), void 0 !== e.placeId && (n.placeId = e.placeId), void 0 !== e.developerProductId && (n.developerProductId = e.developerProductId), void 0 !== e.gamePassId && (n.gamePassId = e.gamePassId), void 0 !== e.funnelName && (n.funnelName = e.funnelName), i = {}, [4, this.request({
                                path: "/v1/universes/{universeId}/annotations".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/universes/{universeId}/annotations",
                                method: "GET",
                                headers: i,
                                query: n
                            }, t)];
                        case 1:
                            return r = o.sent(), [2, new l.H(r, function(e) {
                                return null == e ? e : {
                                    annotations: (0, l.u)(e, "annotations") ? e.annotations.map(E) : void 0,
                                    nextCursor: (0, l.u)(e, "nextCursor") ? e.nextCursor : void 0,
                                    previousCursor: (0, l.u)(e, "previousCursor") ? e.previousCursor : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1UniversesUniverseIdAnnotationsGet = function(e, t) {
            return u(this, void 0, void 0, function() {
                return d(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1UniversesUniverseIdAnnotationsGetRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t
    }(l._);
    e.s(["Y", 0, v, "W", 0, c, "b", 0, {
        Invalid: "CUSTOM_MATCHMAKING_CHANGE_INVALID",
        Enrollment: "CUSTOM_MATCHMAKING_CHANGE_ENROLLMENT",
        Unenrollment: "CUSTOM_MATCHMAKING_CHANGE_UNENROLLMENT",
        TypeWeightsUpdate: "CUSTOM_MATCHMAKING_CHANGE_TYPE_WEIGHTS_UPDATE",
        TypeSignalAdd: "CUSTOM_MATCHMAKING_CHANGE_TYPE_SIGNAL_ADD",
        TypeSignalRemove: "CUSTOM_MATCHMAKING_CHANGE_TYPE_SIGNAL_REMOVE"
    }, "B", 0, {
        Invalid: "ENABLEMENT_TYPE_INVALID",
        Standard: "ENABLEMENT_TYPE_STANDARD",
        Extended: "ENABLEMENT_TYPE_EXTENDED"
    }, "S", 0, {
        Invalid: "ENGINE_RELEASE_PLATFORM_INVALID",
        Rcc: "ENGINE_RELEASE_PLATFORM_RCC",
        WindowsPlayer: "ENGINE_RELEASE_PLATFORM_WINDOWS_PLAYER",
        MacPlayer: "ENGINE_RELEASE_PLATFORM_MAC_PLAYER",
        GoogleAndroid: "ENGINE_RELEASE_PLATFORM_GOOGLE_ANDROID",
        AmazonAndroid: "ENGINE_RELEASE_PLATFORM_AMAZON_ANDROID",
        SamsungAndroid: "ENGINE_RELEASE_PLATFORM_SAMSUNG_ANDROID",
        MetaQuest: "ENGINE_RELEASE_PLATFORM_META_QUEST",
        Ios: "ENGINE_RELEASE_PLATFORM_IOS",
        Pcgdk: "ENGINE_RELEASE_PLATFORM_PCGDK",
        Xbox: "ENGINE_RELEASE_PLATFORM_XBOX",
        Playstation4: "ENGINE_RELEASE_PLATFORM_PLAYSTATION_4"
    }, "L", 0, {
        Invalid: "EVENT_STATE_TYPE_INVALID",
        EventStart: "EVENT_STATE_TYPE_EVENT_START",
        EventEnd: "EVENT_STATE_TYPE_EVENT_END"
    }, "q", 0, {
        Invalid: "GAME_PREVIEW_VIDEO_STATE_TYPE_INVALID",
        Discoverable: "GAME_PREVIEW_VIDEO_STATE_TYPE_DISCOVERABLE"
    }, "D", 0, {
        Invalid: "REGEX_OPERATION_INVALID",
        IgnoreAdd: "REGEX_OPERATION_IGNORE_ADD",
        IgnoreRemove: "REGEX_OPERATION_IGNORE_REMOVE"
    }], 344112);
    var m = ((t = {}).PlaceIcon = "PlaceIcon", t.PlaceThumbnail = "PlaceThumbnail", t.PlaceVideo = "PlaceVideo", t.PlaceVersion = "PlaceVersion", t.Benchmark = "Benchmark", t.FunnelStepNameChange = "FunnelStepNameChange", t.LiveEvent = "LiveEvent", t.CustomMatchmaking = "CustomMatchmaking", t.EngineRelease = "EngineRelease", t.MemoryStoreMemoryUsageAlert = "MemoryStoreMemoryUsageAlert", t.MemoryStoreRequestsAlert = "MemoryStoreRequestsAlert", t.ClientCrashRateNotStableAlert = "ClientCrashRateNotStableAlert", t.RetentionCorhortDisclaimer = "RetentionCorhortDisclaimer", t.ConfigVersion = "ConfigVersion", t.Announcement = "Announcement", t.ExtendedServicesEnablement = "ExtendedServicesEnablement", t.ConfiguredAlertIncident = "ConfiguredAlertIncident", t.CreatorRegexChange = "CreatorRegexChange", t);
    let p = {
        PlaceIcon: c.NUMBER_1,
        PlaceThumbnail: c.NUMBER_4,
        PlaceVersion: c.NUMBER_5,
        Benchmark: c.NUMBER_6,
        FunnelStepNameChange: c.NUMBER_7,
        LiveEvent: c.NUMBER_8,
        CustomMatchmaking: c.NUMBER_9,
        EngineRelease: c.NUMBER_10,
        PlaceVideo: c.NUMBER_11,
        ConfigVersion: c.NUMBER_12,
        ExtendedServicesEnablement: c.NUMBER_15,
        CreatorRegexChange: c.NUMBER_16
    };
    var g = ((n = {}).Similarity = "SIMILARITY", n.Genre = "GENRE", n),
        A = ((i = {}).Enrollment = "Enrollment", i.Unenrollment = "Unenrollment", i.WeightsUpdate = "WeightsUpdate", i),
        f = ((r = {}).Rcc = "RCC", r.WindowsPlayer = "WindowsPlayer", r.MacPlayer = "MacPlayer", r),
        _ = ((o = {}).IgnoreAdd = "REGEX_OPERATION_IGNORE_ADD", o.IgnoreRemove = "REGEX_OPERATION_IGNORE_REMOVE", o),
        T = ((a = {}).Standard = "ENABLEMENT_TYPE_STANDARD", a.Extended = "ENABLEMENT_TYPE_EXTENDED", a);
    e.s(["J", () => g, "y", () => _, "k", () => A, "T", () => T, "Y", () => f, "W", () => m, "l", 0, p, "e", 0, e => "MemoryStoreMemoryUsageAlert" === e || "MemoryStoreRequestsAlert" === e || "ClientCrashRateNotStableAlert" === e], 36826)
}, 215928, 929764, e => {
    "use strict";
    var t = e.i(31611),
        n = e.i(927868),
        i = e.i(908374),
        r = e.i(606662);
    let o = e => null !== e.aggregationType || null !== e.percentile;
    e.s(["U", 0, (e, i) => {
        let o = [],
            a = null,
            l = null;
        return null == e || e.forEach(e => {
            if (e.dimension !== t.EM.AggregationType && e.dimension !== t.EM.PercentileType) return void o.push(e);
            let s = e.values[0];
            if (!s) return;
            let u = (0, r.b)(i ? [i] : [], e.dimension);
            (void 0 === u || (0, r.u)(u, s)) && (e.dimension === t.EM.AggregationType && (0, n.s)(t.W4, s) ? a = s : e.dimension === t.EM.PercentileType && (0, n.s)(t.G6, s) && (l = s))
        }), {
            pseudoDimensionValues: {
                aggregationType: a,
                percentile: l
            },
            realFilters: o
        }
    }, "s", 0, o], 929764);
    let a = e => {
            var i;
            return (0, n.s)(t.R$, e) && (null == (i = t.FX[e]) ? void 0 : i.variantId) === t.Y7.L7Average
        },
        l = Object.entries(t.FX).reduce((e, t) => {
            let [n, r] = t;
            return a(n) && (0, i.y)(r.metric) && (e[n] = r.metric), e
        }, {}),
        s = new Set(Object.keys(t.FX).filter(a)),
        u = (e, n) => {
            var i;
            return e === t.Ea.CustomEventsV2 && (null == n ? void 0 : n.customEventName) ? {
                metric: e,
                customEventName: n.customEventName,
                ...(null == (i = n.pseudoDimensionValues) ? void 0 : i.aggregationType) ? {
                    aggregationType: n.pseudoDimensionValues.aggregationType
                } : {}
            } : e
        },
        d = (e, t) => {
            let n;
            return {
                sources: [(n = {
                    key: "A",
                    metric: u(e, t)
                }, (null == t ? void 0 : t.pseudoDimensionValues) && o(t.pseudoDimensionValues) && (n.pseudoDimensionValues = t.pseudoDimensionValues), n)],
                formula: "A",
                l7Smoothing: !0
            }
        },
        c = e => 1 === e.sources.length && e.formula.trim() === e.sources[0].key,
        E = e => !!e.l7Smoothing && c(e);
    e.s(["I", 0, d, "S", 0, e => {
        var t;
        return a(e) && null != (t = l[e]) ? t : null
    }, "k", 0, e => t.FX[e], "x", 0, (e, t, n) => t ? d(e, n) : u(e, n), "p", 0, e => {
        var i, r;
        if (!E(e)) return;
        let [a] = e.sources;
        if (!("string" != typeof a.metric || (null != (i = null == (r = a.filters) ? void 0 : r.length) ? i : 0) > 0 || a.pseudoDimensionValues && o(a.pseudoDimensionValues))) return (0, n.s)(t.ST, a.metric) ? a.metric : void 0
    }, "Z", 0, e => {
        var i, r;
        if (!(0, n.s)(t.ST, e)) return null;
        let o = null == (r = t.Q3[e]) || null == (i = r[t.Y7.L7Average]) ? void 0 : i.datasetKey;
        return o && a(o) ? o : null
    }, "s", 0, c, "g", 0, a, "z", 0, E, "E", 0, s], 215928)
}, 956154, e => {
    "use strict";
    e.s(["F", 0, {
        "7d": 6048e5,
        "14d": 12096e5,
        "28d": 24192e5
    }, "J", 0, ["7d", "14d", "28d"]])
}, 973005, e => {
    "use strict";
    var t = e.i(31611),
        n = e.i(927868),
        i = e.i(405005);
    e.s(["U", 0, e => (0, n.s)(t.EM, e) && t.T_[e].pseudoDimensionConfig.type === t.Wz.MetricFanout, "D", 0, (e, t) => (0, i.X)(t, e)])
}, 339923, e => {
    "use strict";
    var t = e.i(31611),
        n = e.i(730530),
        i = e.i(577038),
        r = e.i(881670),
        o = e.i(927868),
        a = e.i(215928),
        l = e.i(908374),
        s = e.i(11517);
    let u = e => "string" == typeof e && e.trim().length > 0,
        d = e => (0, o.s)(t.ST, e),
        c = e => (0, n.q)(e),
        E = (e, t) => {
            if (!(0, s.Z)(e)) {
                if ((0, s.Q)(e)) return c(e.customEventName);
                let {
                    localizedName: n
                } = (0, l.U)((0, s.Y)(e));
                return t ? t.translate(n) : c(n.key)
            }
            return (0, a.z)(e) ? E(e.sources[0].metric, t) : c(u(e.name) ? e.name : e.formula)
        },
        v = (0, n.Q)("Label.ExploreMode.UntitledFormula", r.f.Analytics),
        m = (e, t) => {
            if ((0, s.Z)(e)) return (0, a.z)(e) ? m(e.sources[0].metric, t) : (0, n.q)("");
            let {
                localizedName: i
            } = (0, l.U)((0, s.Y)(e));
            return t.translate(i)
        },
        p = e => (0, s.Z)(e) ? !(0, a.z)(e) || p(e.sources[0].metric) : (0, l.U)((0, s.Y)(e)).isPositiveGood,
        g = e => {
            var t;
            if ((0, s.Z)(e)) return !!(0, a.z)(e) && g(e.sources[0].metric);
            let {
                defaultTotalSummaryTypes: n
            } = (0, l.U)((0, s.Y)(e));
            return (null == n || null == (t = n[0]) ? void 0 : t.type) === i.f.Average
        };
    e.s(["F", 0, v, "a", 0, c, "I", 0, e => {
        if ("string" == typeof e) {
            if ((0, a.g)(e)) {
                let t = (0, a.k)(e);
                return null == t ? null : {
                    metric: t.metric,
                    benchmarkVariantId: t.variantId
                }
            }
            return d(e) ? {
                metric: e
            } : null
        }
        if ((0, s.Z)(e)) {
            if (!(0, a.z)(e)) return null;
            let n = (0, s.Y)(e.sources[0].metric);
            return (0, o.s)(t.ST, n) && null != (0, a.Z)(n) ? {
                metric: n,
                benchmarkVariantId: t.Y7.L7Average
            } : null
        }
        let n = (0, s.Y)(e);
        return d(n) ? {
            metric: n
        } : null
    }, "t", 0, m, "v", 0, g, "P", 0, p, "N", 0, E, "W", 0, e => (0, s.Z)(e) ? u(e.name) ? c(e.name) : v : (0, s.Q)(e) ? c(e.customEventName) : (0, l.U)((0, s.Y)(e)).localizedName, "X", 0, e => {
        if ("string" == typeof e) return (0, a.g)(e) || d(e) ? e : null;
        if ((0, s.Z)(e)) {
            if (!(0, a.z)(e)) return null;
            let t = (0, s.Y)(e.sources[0].metric);
            return (0, a.Z)(t)
        }
        let t = (0, s.Y)(e);
        return d(t) ? t : null
    }])
}, 405005, e => {
    "use strict";
    var t = e.i(626473),
        n = e.i(31611),
        i = e.i(606662);
    let r = {
            percentile: n.EM.PercentileType,
            aggregation: n.EM.AggregationType
        },
        o = n.G6.AVG,
        a = e => (null == e ? void 0 : e.mode) === "fanout",
        l = e => r[e],
        s = (e, t) => {
            let i = t.replaceAll(/([a-z0-9])([A-Z])/g, "$1_$2").replaceAll(/[^A-Za-z0-9]+/g, "_").toUpperCase().replaceAll(/^_+|_+$/g, "");
            if (i === o || "AVERAGE" === i) return "AVERAGE";
            if (e === n.EM.PercentileType) {
                let e = /^P?(\d+)$/.exec(i);
                if (e) return "P".concat(e[1])
            }
            return i
        },
        u = e => e === n.EM.PercentileType ? t.S.Percentile : e === n.EM.AggregationType ? t.S.Aggregation : null,
        d = (e, t) => {
            let i = [],
                r = [];
            if (null == t || t.forEach(e => {
                    let t = e === n.EM.PercentileType ? "percentile" : e === n.EM.AggregationType ? "aggregation" : void 0;
                    if (void 0 !== t) {
                        r.includes(t) || r.push(t);
                        return
                    }
                    i.push(e)
                }), a(e)) return {
                metricVariant: e,
                breakdown: i
            };
            let o = r[0];
            return o ? {
                metricVariant: {
                    mode: "fanout",
                    kind: o
                },
                breakdown: i
            } : {
                metricVariant: void 0,
                breakdown: i
            }
        },
        c = (e, t) => {
            let {
                metricVariant: n
            } = d(e, t);
            return a(n)
        };
    e.s(["c", 0, e => {
        let t = u(e.dimension);
        if (null == t) throw Error("Unsupported metric variant breakdown ".concat(e.dimension));
        return {
            variant: {
                kind: t,
                keys: e.config.supportedDimensionValues.map(t => s(e.dimension, t))
            }
        }
    }, "f", 0, e => {
        let t = Array.isArray(e) ? e[0] : e;
        if ("percentile" === t || "aggregation" === t) return {
            mode: "fanout",
            kind: t
        }
    }, "g", 0, e => a(e) ? l(e.kind) : void 0, "a", 0, (e, t) => {
        let r = l(e.kind),
            o = n.T_[r].pseudoDimensionConfig;
        if (o.type !== n.Wz.MetricFanout) return;
        let a = (0, i.b)(t, r);
        if (void 0 === a) return {
            dimension: r,
            config: o
        };
        let s = o.supportedDimensionValues.filter(e => (0, i.u)(a, e)),
            u = s.includes(o.totalSeries) ? o.totalSeries : s[0];
        if (void 0 !== u) return {
            dimension: r,
            config: {
                ...o,
                supportedDimensionValues: s,
                totalSeries: u
            }
        }
    }, "N", 0, s, "P", 0, u, "T", 0, (e, t) => {
        var n;
        return (null != (n = null == e ? void 0 : e.length) ? n : 0) > 0 || c(t, e)
    }, "X", 0, c, "b", 0, a, "R", 0, (e, t) => {
        if (!a(t)) return [...e];
        let n = l(t.kind);
        return e.includes(n) ? [...e] : [...e, n]
    }, "E", 0, (e, t) => {
        if (!a(e)) return;
        let i = l(e.kind);
        return i === n.EM.AggregationType ? e : t.includes(i) ? void 0 : e
    }, "l", 0, e => a(e) ? e.kind : null, "w", 0, d, "d", 0, (e, t) => {
        if (a(e)) return t.includes(l(e.kind)) ? e : void 0
    }])
}]);

//# debugId=88248e3b-56b6-9d75-d21b-c3b07b57a178
//# sourceMappingURL=1tyt5nt3j72io.js.map
;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "1f2fdec3-b4c5-3b20-59bb-55f73372950c")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 118413, e => {
    "use strict";
    var t = e.i(157700);
    let r = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "analyticsChartLoadEventstreamEnabled",
            defaultValue: !1
        }),
        n = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isLimitedAnalyticsAdminMonitoringNavigationEnabled",
            defaultValue: !1
        }),
        i = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "visibleAssetIdInPersonalizationEnabled",
            defaultValue: !1
        }),
        a = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isExperimentationTemplatesEnabled",
            defaultValue: !1
        }),
        o = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isExperimentTargetingEnabled",
            defaultValue: !0
        }),
        s = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "acquisitionMigrationMetricsEnabled",
            defaultValue: !1
        }),
        u = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isTargetingConfigsEnabled",
            defaultValue: !0
        }),
        l = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isExperimentNullControlValueEnabled",
            defaultValue: !0
        }),
        f = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isExperimentRolloutEnabled",
            defaultValue: !0
        }),
        c = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "IsGeneralBreakGlassBannerEnabled",
            defaultValue: !1
        }),
        d = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "IsMonetizationBreakGlassBannerEnabled",
            defaultValue: !1
        }),
        h = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isPlayerFeedbackExampleCommentsEnabled",
            defaultValue: !1
        }),
        p = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isAnalyticsAssistantChatEnabled",
            defaultValue: !1
        }),
        m = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isAnalyticsAssistantIssueBannerEnabled",
            defaultValue: !1
        }),
        g = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "showCreatorRewardsReportingDisclaimer",
            defaultValue: !1
        }),
        y = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isRotraceMetricEnabled",
            defaultValue: !1
        }),
        E = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isTelemetryMigrationEnabled",
            defaultValue: !1
        }),
        v = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "showVideoServiceDashboard",
            defaultValue: !1
        }),
        A = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isTreemapColorBySiblingProportionEnabled",
            defaultValue: !1
        }),
        b = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isAssistantChartOverflowMenuEnabled",
            defaultValue: !1
        }),
        I = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isAnalyticsMetricAwareYAxisFormatterEnabled",
            defaultValue: !1
        }),
        M = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isCustomDashboardsEnabled",
            defaultValue: !0
        }),
        T = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isCustomDashboardsLocalStorageEnabled",
            defaultValue: !1
        }),
        R = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isCustomDashboardsApiBackendEnabled",
            defaultValue: !0
        }),
        x = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isJourneyEventsEnabled",
            defaultValue: !1
        }),
        _ = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isClientSessionsEnabled",
            defaultValue: !1
        }),
        N = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isEhdResultsEnabled",
            defaultValue: !1
        }),
        C = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isEhdResultsAlwaysFetched",
            defaultValue: !1
        }),
        P = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isMetricVariantChartStateEnabled",
            defaultValue: !1
        });
    e.s(["acquisitionMigrationMetricsEnabled", 0, s, "analyticsChartLoadEventstreamEnabled", 0, r, "isAnalyticsAssistantChatEnabled", 0, p, "isAnalyticsAssistantIssueBannerEnabled", 0, m, "isAnalyticsMetricAwareYAxisFormatterEnabled", 0, I, "isAssistantChartOverflowMenuEnabled", 0, b, "isClientSessionsEnabled", 0, _, "isCustomDashboardsApiBackendEnabled", 0, R, "isCustomDashboardsEnabled", 0, M, "isCustomDashboardsLocalStorageEnabled", 0, T, "isEhdResultsAlwaysFetched", 0, C, "isEhdResultsEnabled", 0, N, "isExperimentNullControlValueEnabled", 0, l, "isExperimentRolloutEnabled", 0, f, "isExperimentTargetingEnabled", 0, o, "isExperimentationTemplatesEnabled", 0, a, "isGeneralBreakGlassBannerEnabled", 0, c, "isJourneyEventsEnabled", 0, x, "isLimitedAnalyticsAdminMonitoringNavigationEnabled", 0, n, "isMetricVariantChartStateEnabled", 0, P, "isMonetizationBreakGlassBannerEnabled", 0, d, "isPlayerFeedbackExampleCommentsEnabled", 0, h, "isRotraceMetricEnabled", 0, y, "isTargetingConfigsEnabled", 0, u, "isTelemetryMigrationEnabled", 0, E, "isTreemapColorBySiblingProportionEnabled", 0, A, "showCreatorRewardsReportingDisclaimer", 0, g, "showVideoServiceDashboard", 0, v, "visibleAssetIdInPersonalizationEnabled", 0, i])
}, 36826, 61925, e => {
    "use strict";
    var t, r, n, i, a, o, s = e.i(677753),
        u = function(e, t) {
            return (u = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
            })(e, t)
        };

    function l(e, t, r, n) {
        return new(r || (r = Promise))(function(i, a) {
            function o(e) {
                try {
                    u(n.next(e))
                } catch (e) {
                    a(e)
                }
            }

            function s(e) {
                try {
                    u(n.throw(e))
                } catch (e) {
                    a(e)
                }
            }

            function u(e) {
                var t;
                e.done ? i(e.value) : ((t = e.value) instanceof r ? t : new r(function(e) {
                    e(t)
                })).then(o, s)
            }
            u((n = n.apply(e, t || [])).next())
        })
    }

    function f(e, t) {
        var r, n, i, a = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            },
            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return o.next = s(0), o.throw = s(1), o.return = s(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
            return this
        }), o;

        function s(s) {
            return function(u) {
                var l = [s, u];
                if (r) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, l[0] && (a = 0)), a;) try {
                    if (r = 1, n && (i = 2 & l[0] ? n.return : l[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, l[1])).done) return i;
                    switch (n = 0, i && (l = [2 & l[0], i.value]), l[0]) {
                        case 0:
                        case 1:
                            i = l;
                            break;
                        case 4:
                            return a.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            a.label++, n = l[1], l = [0];
                            continue;
                        case 7:
                            l = a.ops.pop(), a.trys.pop();
                            continue;
                        default:
                            if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                a = 0;
                                continue
                            }
                            if (3 === l[0] && (!i || l[1] > i[0] && l[1] < i[3])) {
                                a.label = l[1];
                                break
                            }
                            if (6 === l[0] && a.label < i[1]) {
                                a.label = i[1], i = l;
                                break
                            }
                            if (i && a.label < i[2]) {
                                a.label = i[2], a.ops.push(l);
                                break
                            }
                            i[2] && a.ops.pop(), a.trys.pop();
                            continue
                    }
                    l = t.call(e, a)
                } catch (e) {
                    l = [6, e], n = 0
                } finally {
                    r = i = 0
                }
                if (5 & l[0]) throw l[1];
                return {
                    value: l[0] ? l[1] : void 0,
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

    function d(e) {
        var t, r, n, i, a, o, u, l, f, c, d, h, p, m, g, y, E, v;
        return null == (t = e) ? t : {
            id: (0, s.exists)(t, "id") ? t.id : void 0,
            annotationType: (0, s.exists)(t, "annotationType") ? t.annotationType : void 0,
            metadata: (0, s.exists)(t, "metadata") ? null == (r = t.metadata) ? r : {
                placeIcon: (0, s.exists)(r, "placeIcon") ? null == (n = r.placeIcon) ? n : {
                    iconAssetId: (0, s.exists)(n, "iconAssetId") ? n.iconAssetId : void 0
                } : void 0,
                devProduct: (0, s.exists)(r, "devProduct") ? null == (i = r.devProduct) ? i : {
                    name: (0, s.exists)(i, "name") ? i.name : void 0,
                    imageAssetId: (0, s.exists)(i, "imageAssetId") ? i.imageAssetId : void 0,
                    priceInRobux: (0, s.exists)(i, "priceInRobux") ? i.priceInRobux : void 0
                } : void 0,
                gamePass: (0, s.exists)(r, "gamePass") ? null == (a = r.gamePass) ? a : {
                    name: (0, s.exists)(a, "name") ? a.name : void 0,
                    imageAssetId: (0, s.exists)(a, "imageAssetId") ? a.imageAssetId : void 0,
                    priceInRobux: (0, s.exists)(a, "priceInRobux") ? a.priceInRobux : void 0,
                    isForSale: (0, s.exists)(a, "isForSale") ? a.isForSale : void 0
                } : void 0,
                placeThumbnail: (0, s.exists)(r, "placeThumbnail") ? null == (o = r.placeThumbnail) ? o : {
                    thumbnailAssetId: (0, s.exists)(o, "thumbnailAssetId") ? o.thumbnailAssetId : void 0,
                    thumbnailAssetIds: (0, s.exists)(o, "thumbnailAssetIds") ? o.thumbnailAssetIds : void 0
                } : void 0,
                placeVersion: (0, s.exists)(r, "placeVersion") ? null == (u = r.placeVersion) ? u : {
                    versionNumber: (0, s.exists)(u, "versionNumber") ? u.versionNumber : void 0,
                    isPublished: (0, s.exists)(u, "isPublished") ? u.isPublished : void 0
                } : void 0,
                benchmarkChange: (0, s.exists)(r, "benchmarkChange") ? null == (l = r.benchmarkChange) ? l : {
                    fromBenchmarkType: (0, s.exists)(l, "fromBenchmarkType") ? l.fromBenchmarkType : void 0,
                    toBenchmarkType: (0, s.exists)(l, "toBenchmarkType") ? l.toBenchmarkType : void 0
                } : void 0,
                funnelStepNameChange: (0, s.exists)(r, "funnelStepNameChange") ? null == (f = r.funnelStepNameChange) ? f : {
                    minStep: (0, s.exists)(f, "minStep") ? f.minStep : void 0
                } : void 0,
                experienceEventState: (0, s.exists)(r, "experienceEventState") ? null == (c = r.experienceEventState) ? c : {
                    eventId: (0, s.exists)(c, "eventId") ? c.eventId : void 0,
                    eventName: (0, s.exists)(c, "eventName") ? c.eventName : void 0,
                    imageAssetId: (0, s.exists)(c, "imageAssetId") ? c.imageAssetId : void 0,
                    eventStateType: (0, s.exists)(c, "eventStateType") ? c.eventStateType : void 0
                } : void 0,
                customMatchmaking: (0, s.exists)(r, "customMatchmaking") ? null == (d = r.customMatchmaking) ? d : {
                    stateChange: (0, s.exists)(d, "stateChange") ? d.stateChange : void 0,
                    scoringConfigurationName: (0, s.exists)(d, "scoringConfigurationName") ? d.scoringConfigurationName : void 0
                } : void 0,
                engineRelease: (0, s.exists)(r, "engineRelease") ? null == (h = r.engineRelease) ? h : {
                    platform: (0, s.exists)(h, "platform") ? h.platform : void 0,
                    releaseMajorVersion: (0, s.exists)(h, "releaseMajorVersion") ? h.releaseMajorVersion : void 0
                } : void 0,
                gamePreviewVideoStateChange: (0, s.exists)(r, "gamePreviewVideoStateChange") ? null == (p = r.gamePreviewVideoStateChange) ? p : {
                    videoAssetId: (0, s.exists)(p, "videoAssetId") ? p.videoAssetId : void 0,
                    universeId: (0, s.exists)(p, "universeId") ? p.universeId : void 0,
                    gamePreviewVideoStateType: (0, s.exists)(p, "gamePreviewVideoStateType") ? p.gamePreviewVideoStateType : void 0
                } : void 0,
                configChange: (0, s.exists)(r, "configChange") ? null == (m = r.configChange) ? m : {
                    version: (0, s.exists)(m, "version") ? m.version : void 0
                } : void 0,
                experimentationOperation: (0, s.exists)(r, "experimentationOperation") ? null == (g = r.experimentationOperation) ? g : {
                    status: (0, s.exists)(g, "status") ? g.status : void 0,
                    experimentName: (0, s.exists)(g, "experimentName") ? g.experimentName : void 0,
                    exposurePercent: (0, s.exists)(g, "exposurePercent") ? g.exposurePercent : void 0,
                    rampedVariantLabel: (0, s.exists)(g, "rampedVariantLabel") ? g.rampedVariantLabel : void 0,
                    experimentId: (0, s.exists)(g, "experimentId") ? g.experimentId : void 0
                } : void 0,
                globalAnnouncement: (0, s.exists)(r, "globalAnnouncement") ? null == (y = r.globalAnnouncement) ? y : {
                    forAllPages: (0, s.exists)(y, "forAllPages") ? y.forAllPages : void 0,
                    appliedMetrics: (0, s.exists)(y, "appliedMetrics") ? y.appliedMetrics : void 0,
                    translationKey: (0, s.exists)(y, "translationKey") ? y.translationKey : void 0,
                    links: (0, s.exists)(y, "links") ? y.links : void 0
                } : void 0,
                extendedServicesEnablement: (0, s.exists)(r, "extendedServicesEnablement") ? null == (E = r.extendedServicesEnablement) ? E : {
                    service: (0, s.exists)(E, "service") ? E.service : void 0,
                    resource: (0, s.exists)(E, "resource") ? E.resource : void 0,
                    enabled: (0, s.exists)(E, "enabled") ? E.enabled : void 0,
                    enablementType: (0, s.exists)(E, "enablementType") ? E.enablementType : void 0
                } : void 0,
                creatorRegexChange: (0, s.exists)(r, "creatorRegexChange") ? null == (v = r.creatorRegexChange) ? v : {
                    regexOperation: (0, s.exists)(v, "regexOperation") ? v.regexOperation : void 0
                } : void 0
            } : void 0,
            createdUtcTime: (0, s.exists)(t, "createdUtcTime") ? t.createdUtcTime : void 0
        }
    }
    var h = function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        return function(e, t) {
            if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

            function r() {
                this.constructor = e
            }
            u(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
        }(t, e), t.prototype.v1UniversesUniverseIdAnnotationsGetRaw = function(e, t) {
            return l(this, void 0, void 0, function() {
                var r, n, i;
                return f(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new s.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdAnnotationsGet.");
                            return r = {}, void 0 !== e.annotationType && (r.annotationType = e.annotationType), void 0 !== e.inclusiveStartUtcTime && (r.inclusiveStartUtcTime = e.inclusiveStartUtcTime), void 0 !== e.inclusiveEndUtcTime && (r.inclusiveEndUtcTime = e.inclusiveEndUtcTime), void 0 !== e.cursor && (r.cursor = e.cursor), void 0 !== e.reverse && (r.reverse = e.reverse), void 0 !== e.resultsPerPage && (r.resultsPerPage = e.resultsPerPage), void 0 !== e.placeId && (r.placeId = e.placeId), void 0 !== e.developerProductId && (r.developerProductId = e.developerProductId), void 0 !== e.gamePassId && (r.gamePassId = e.gamePassId), void 0 !== e.funnelName && (r.funnelName = e.funnelName), n = {}, [4, this.request({
                                path: "/v1/universes/{universeId}/annotations".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/universes/{universeId}/annotations",
                                method: "GET",
                                headers: n,
                                query: r
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new s.JSONApiResponse(i, function(e) {
                                return null == e ? e : {
                                    annotations: (0, s.exists)(e, "annotations") ? e.annotations.map(d) : void 0,
                                    nextCursor: (0, s.exists)(e, "nextCursor") ? e.nextCursor : void 0,
                                    previousCursor: (0, s.exists)(e, "previousCursor") ? e.previousCursor : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1UniversesUniverseIdAnnotationsGet = function(e, t) {
            return l(this, void 0, void 0, function() {
                return f(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1UniversesUniverseIdAnnotationsGetRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, t
    }(s.BaseAPI);
    e.s(["AnalyticsAnnotationsAPIApi", 0, h, "AnnotationType", 0, c, "CustomMatchmakingChange", 0, {
        Invalid: "CUSTOM_MATCHMAKING_CHANGE_INVALID",
        Enrollment: "CUSTOM_MATCHMAKING_CHANGE_ENROLLMENT",
        Unenrollment: "CUSTOM_MATCHMAKING_CHANGE_UNENROLLMENT",
        TypeWeightsUpdate: "CUSTOM_MATCHMAKING_CHANGE_TYPE_WEIGHTS_UPDATE",
        TypeSignalAdd: "CUSTOM_MATCHMAKING_CHANGE_TYPE_SIGNAL_ADD",
        TypeSignalRemove: "CUSTOM_MATCHMAKING_CHANGE_TYPE_SIGNAL_REMOVE"
    }, "EnablementType", 0, {
        Invalid: "ENABLEMENT_TYPE_INVALID",
        Standard: "ENABLEMENT_TYPE_STANDARD",
        Extended: "ENABLEMENT_TYPE_EXTENDED"
    }, "EngineReleasePlatform", 0, {
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
    }, "EventStateType", 0, {
        Invalid: "EVENT_STATE_TYPE_INVALID",
        EventStart: "EVENT_STATE_TYPE_EVENT_START",
        EventEnd: "EVENT_STATE_TYPE_EVENT_END"
    }, "GamePreviewVideoStateType", 0, {
        Invalid: "GAME_PREVIEW_VIDEO_STATE_TYPE_INVALID",
        Discoverable: "GAME_PREVIEW_VIDEO_STATE_TYPE_DISCOVERABLE"
    }, "RegexOperation", 0, {
        Invalid: "REGEX_OPERATION_INVALID",
        IgnoreAdd: "REGEX_OPERATION_IGNORE_ADD",
        IgnoreRemove: "REGEX_OPERATION_IGNORE_REMOVE"
    }], 61925);
    var p = ((t = {}).PlaceIcon = "PlaceIcon", t.PlaceThumbnail = "PlaceThumbnail", t.PlaceVideo = "PlaceVideo", t.PlaceVersion = "PlaceVersion", t.Benchmark = "Benchmark", t.FunnelStepNameChange = "FunnelStepNameChange", t.LiveEvent = "LiveEvent", t.CustomMatchmaking = "CustomMatchmaking", t.EngineRelease = "EngineRelease", t.MemoryStoreMemoryUsageAlert = "MemoryStoreMemoryUsageAlert", t.MemoryStoreRequestsAlert = "MemoryStoreRequestsAlert", t.ClientCrashRateNotStableAlert = "ClientCrashRateNotStableAlert", t.RetentionCorhortDisclaimer = "RetentionCorhortDisclaimer", t.ConfigVersion = "ConfigVersion", t.Announcement = "Announcement", t.ExtendedServicesEnablement = "ExtendedServicesEnablement", t.ConfiguredAlertIncident = "ConfiguredAlertIncident", t.CreatorRegexChange = "CreatorRegexChange", t);
    let m = {
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
    var g = ((r = {}).Similarity = "SIMILARITY", r.Genre = "GENRE", r),
        y = ((n = {}).Enrollment = "Enrollment", n.Unenrollment = "Unenrollment", n.WeightsUpdate = "WeightsUpdate", n),
        E = ((i = {}).Rcc = "RCC", i.WindowsPlayer = "WindowsPlayer", i.MacPlayer = "MacPlayer", i),
        v = ((a = {}).IgnoreAdd = "REGEX_OPERATION_IGNORE_ADD", a.IgnoreRemove = "REGEX_OPERATION_IGNORE_REMOVE", a),
        A = ((o = {}).Standard = "ENABLEMENT_TYPE_STANDARD", o.Extended = "ENABLEMENT_TYPE_EXTENDED", o);
    e.s(["AnnotationBenchmarkType", () => g, "AnnotationCreatorRegexOperation", () => v, "AnnotationCustomMatchmakingChangeType", () => y, "AnnotationEnablementType", () => A, "AnnotationEngineReleasePlatform", () => E, "AnnotationType", () => p, "UIAnnotationTypeToApiAnnotation", 0, m, "isAnnotationAlertType", 0, e => "MemoryStoreMemoryUsageAlert" === e || "MemoryStoreRequestsAlert" === e || "ClientCrashRateNotStableAlert" === e], 36826)
}, 215928, 929764, e => {
    "use strict";
    var t = e.i(31611),
        r = e.i(927868),
        n = e.i(908374);
    let i = e => null !== e.aggregationType || null !== e.percentile;
    e.s(["default", 0, e => {
        let n = [],
            i = null,
            a = null;
        return null == e || e.forEach(e => {
            if (e.dimension !== t.RAQIV2UIPseudoDimension.AggregationType && e.dimension !== t.RAQIV2UIPseudoDimension.PercentileType) return void n.push(e);
            let o = e.values[0];
            o && (e.dimension === t.RAQIV2UIPseudoDimension.AggregationType && (0, r.isValidEnumValue)(t.RAQIV2AggregationType, o) ? i = o : e.dimension === t.RAQIV2UIPseudoDimension.PercentileType && (0, r.isValidEnumValue)(t.RAQIV2PercentileType, o) && (a = o))
        }), {
            pseudoDimensionValues: {
                aggregationType: i,
                percentile: a
            },
            realFilters: n
        }
    }, "hasPseudoDimensionValues", 0, i], 929764);
    let a = new Set(["L7AverageDailyActiveUsers", "L7AverageDailyRevenue", "L7AverageForwardD1Retention", "L7AverageForwardD7Retention", "L7AveragePayingUsersCVR", "L7AveragePlayTimeMinutesPerDAU", "L7AverageRFYPlayThroughRate", "L7AverageRFYQualifiedPTR", "L7AverageRevenuePerPayingUser", "L7AverageUniqueUsersWithPlaySessions"]),
        o = e => Object.hasOwn(t.RAQIV2BenchmarkDatasetKeyToVariant, e) && a.has(e),
        s = Object.entries(t.RAQIV2BenchmarkDatasetKeyToVariant).reduce((e, t) => {
            let [r, i] = t;
            return o(r) && (0, n.isNumericUIMetric)(i.metric) && (e[r] = i.metric), e
        }, {}),
        u = new Set(Object.keys(t.RAQIV2BenchmarkDatasetKeyToVariant)),
        l = (e, r) => {
            var n;
            return e === t.RAQIV2UIMetric.CustomEventsV2 && (null == r ? void 0 : r.customEventName) ? {
                metric: e,
                customEventName: r.customEventName,
                ...(null == (n = r.pseudoDimensionValues) ? void 0 : n.aggregationType) ? {
                    aggregationType: r.pseudoDimensionValues.aggregationType
                } : {}
            } : e
        },
        f = (e, t) => {
            let r;
            return {
                sources: [(r = {
                    key: "A",
                    metric: l(e, t)
                }, (null == t ? void 0 : t.pseudoDimensionValues) && i(t.pseudoDimensionValues) && (r.pseudoDimensionValues = t.pseudoDimensionValues), r)],
                formula: "A",
                l7Smoothing: !0
            }
        },
        c = e => 1 === e.sources.length && e.formula.trim() === e.sources[0].key,
        d = e => {
            var t;
            return o(e) && null != (t = s[e]) ? t : null
        };
    e.s(["buildL7SmoothingComputedMetric", 0, f, "getBaseMetricFromL7", 0, d, "getBenchmarkVariantByDatasetKey", 0, e => t.RAQIV2BenchmarkDatasetKeyToVariant[e], "getMetricForL7Smoothing", 0, (e, t, r) => t ? f(e, r) : l(e, r), "getPrecomputedL7MetricFromBase", 0, e => {
        var n, i;
        if (!(0, r.isValidEnumValue)(t.RAQIV2Metric, e)) return null;
        let a = null == (i = t.RAQIV2BenchmarkVariantsByMetric[e]) || null == (n = i[t.RAQIV2BenchmarkVariantId.L7Average]) ? void 0 : n.datasetKey;
        return a && o(a) ? a : null
    }, "isIdentityFormulaComputedMetric", 0, c, "isPrecomputedL7Metric", 0, o, "isPureL7SmoothingComputedMetric", 0, e => !!e.l7Smoothing && c(e), "precomputedL7Metrics", 0, u, "rewritePrecomputedL7MetricForRequest", 0, e => {
        if ("string" != typeof e) return null;
        let t = d(e);
        return t ? f(t, void 0) : null
    }], 215928)
}, 956154, e => {
    "use strict";
    e.s(["COMPARISON_RELATIVE_OFFSET_TO_MS", 0, {
        "7d": 6048e5,
        "14d": 12096e5,
        "28d": 24192e5
    }, "ComparisonOffset", 0, ["7d", "14d", "28d"]])
}, 973005, e => {
    "use strict";
    var t = e.i(31611),
        r = e.i(927868),
        n = e.i(405005);
    e.s(["default", 0, e => (0, r.isValidEnumValue)(t.RAQIV2UIPseudoDimension, e) && t.RAQIV2DimensionDisplayConfig[e].pseudoDimensionConfig.type === t.RAQIV2UIPseudoDimensionType.MetricFanout, "hasMetricFanoutBreakdown", 0, (e, t) => (0, n.hasMetricVariantFanout)(t, e)])
}, 339923, e => {
    "use strict";
    var t = e.i(31611),
        r = e.i(730530),
        n = e.i(577038),
        i = e.i(881670),
        a = e.i(927868),
        o = e.i(215928),
        s = e.i(908374),
        u = e.i(11517);
    let l = e => "string" == typeof e && e.trim().length > 0,
        f = e => (0, a.isValidEnumValue)(t.RAQIV2Metric, e),
        c = e => (0, r.brandUntranslatableText)(e),
        d = (e, t) => {
            if (!(0, u.isComputedMetric)(e)) {
                if ((0, u.isCustomEventsAtomicMetricLike)(e)) return c(e.customEventName);
                let {
                    localizedName: r
                } = (0, s.default)((0, u.getUIMetricFromAtomicMetricLike)(e));
                return t ? t.translate(r) : c(r.key)
            }
            return (0, o.isPureL7SmoothingComputedMetric)(e) ? d(e.sources[0].metric, t) : c(l(e.name) ? e.name : e.formula)
        },
        h = (0, r.translationKey)("Label.ExploreMode.UntitledFormula", i.TranslationNamespace.Analytics),
        p = (e, t) => {
            if ((0, u.isComputedMetric)(e)) return (0, o.isPureL7SmoothingComputedMetric)(e) ? p(e.sources[0].metric, t) : (0, r.brandUntranslatableText)("");
            let {
                localizedName: n
            } = (0, s.default)((0, u.getUIMetricFromAtomicMetricLike)(e));
            return t.translate(n)
        },
        m = e => (0, u.isComputedMetric)(e) ? !(0, o.isPureL7SmoothingComputedMetric)(e) || m(e.sources[0].metric) : (0, s.default)((0, u.getUIMetricFromAtomicMetricLike)(e)).isPositiveGood,
        g = e => {
            var t;
            if ((0, u.isComputedMetric)(e)) return !!(0, o.isPureL7SmoothingComputedMetric)(e) && g(e.sources[0].metric);
            let {
                defaultTotalSummaryTypes: r
            } = (0, s.default)((0, u.getUIMetricFromAtomicMetricLike)(e));
            return (null == r || null == (t = r[0]) ? void 0 : t.type) === n.default.Average
        };
    e.s(["UNTITLED_FORMULA_TRANSLATION_KEY", 0, h, "brandUserSuppliedText", 0, c, "getBenchmarkRequestIdentityFromMetricLike", 0, e => {
        if ((0, u.isComputedMetric)(e)) {
            if (!(0, o.isPureL7SmoothingComputedMetric)(e)) return null;
            let r = (0, u.getUIMetricFromAtomicMetricLike)(e.sources[0].metric);
            return (0, a.isValidEnumValue)(t.RAQIV2Metric, r) && null != (0, o.getPrecomputedL7MetricFromBase)(r) ? {
                metric: r,
                benchmarkVariantId: t.RAQIV2BenchmarkVariantId.L7Average
            } : null
        }
        let r = (0, u.getUIMetricFromAtomicMetricLike)(e);
        if ((0, o.isPrecomputedL7Metric)(r)) {
            let e = (0, o.getBenchmarkVariantByDatasetKey)(r);
            return null == e ? null : {
                metric: e.metric,
                benchmarkVariantId: e.variantId
            }
        }
        return f(r) ? {
            metric: r
        } : null
    }, "getDisplayUnitFromMetricLike", 0, p, "getIsAverageAggregationMetric", 0, g, "getIsPositiveGoodFromMetricLike", 0, m, "getMetricLabelFromMetricLike", 0, d, "getMetricTitleKeyFromMetricLike", 0, e => (0, u.isComputedMetric)(e) ? l(e.name) ? c(e.name) : h : (0, u.isCustomEventsAtomicMetricLike)(e) ? c(e.customEventName) : (0, s.default)((0, u.getUIMetricFromAtomicMetricLike)(e)).localizedName, "getRAQIV2BenchmarkMetricFromMetricLike", 0, e => {
        if ((0, u.isComputedMetric)(e)) {
            if (!(0, o.isPureL7SmoothingComputedMetric)(e)) return null;
            let t = (0, u.getUIMetricFromAtomicMetricLike)(e.sources[0].metric);
            return (0, o.getPrecomputedL7MetricFromBase)(t)
        }
        let t = (0, u.getUIMetricFromAtomicMetricLike)(e);
        return f(t) ? t : null
    }])
}, 847579, e => {
    "use strict";
    var t = e.i(860504);
    e.s(["AnalyticsQueryGatewayAPIFilterOperation", () => t.FilterOperation])
}, 619130, e => {
    "use strict";
    var t = e.i(677753);
    e.s(["default", () => t.createFetchClient])
}, 507786, (e, t, r) => {
    var n = {
            872: function(e, t) {
                "use strict";
                t.byteLength = function(e) {
                    var t = u(e),
                        r = t[0],
                        n = t[1];
                    return (r + n) * 3 / 4 - n
                }, t.toByteArray = function(e) {
                    var t, r, a = u(e),
                        o = a[0],
                        s = a[1],
                        l = new i((o + s) * 3 / 4 - s),
                        f = 0,
                        c = s > 0 ? o - 4 : o;
                    for (r = 0; r < c; r += 4) t = n[e.charCodeAt(r)] << 18 | n[e.charCodeAt(r + 1)] << 12 | n[e.charCodeAt(r + 2)] << 6 | n[e.charCodeAt(r + 3)], l[f++] = t >> 16 & 255, l[f++] = t >> 8 & 255, l[f++] = 255 & t;
                    return 2 === s && (t = n[e.charCodeAt(r)] << 2 | n[e.charCodeAt(r + 1)] >> 4, l[f++] = 255 & t), 1 === s && (t = n[e.charCodeAt(r)] << 10 | n[e.charCodeAt(r + 1)] << 4 | n[e.charCodeAt(r + 2)] >> 2, l[f++] = t >> 8 & 255, l[f++] = 255 & t), l
                }, t.fromByteArray = function(e) {
                    for (var t, n = e.length, i = n % 3, a = [], o = 0, s = n - i; o < s; o += 16383) a.push(function(e, t, n) {
                        for (var i, a = [], o = t; o < n; o += 3) i = (e[o] << 16 & 0xff0000) + (e[o + 1] << 8 & 65280) + (255 & e[o + 2]), a.push(r[i >> 18 & 63] + r[i >> 12 & 63] + r[i >> 6 & 63] + r[63 & i]);
                        return a.join("")
                    }(e, o, o + 16383 > s ? s : o + 16383));
                    return 1 === i ? a.push(r[(t = e[n - 1]) >> 2] + r[t << 4 & 63] + "==") : 2 === i && a.push(r[(t = (e[n - 2] << 8) + e[n - 1]) >> 10] + r[t >> 4 & 63] + r[t << 2 & 63] + "="), a.join("")
                };
                for (var r = [], n = [], i = "u" > typeof Uint8Array ? Uint8Array : Array, a = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", o = 0, s = a.length; o < s; ++o) r[o] = a[o], n[a.charCodeAt(o)] = o;

                function u(e) {
                    var t = e.length;
                    if (t % 4 > 0) throw Error("Invalid string. Length must be a multiple of 4");
                    var r = e.indexOf("="); - 1 === r && (r = t);
                    var n = r === t ? 0 : 4 - r % 4;
                    return [r, n]
                }
                n[45] = 62, n[95] = 63
            },
            230: function(e, t, r) {
                "use strict";
                var n = r(872),
                    i = r(321),
                    a = "function" == typeof Symbol && "function" == typeof Symbol.for ? Symbol.for("nodejs.util.inspect.custom") : null;

                function o(e) {
                    if (e > 0x7fffffff) throw RangeError('The value "' + e + '" is invalid for option "size"');
                    var t = new Uint8Array(e);
                    return Object.setPrototypeOf(t, s.prototype), t
                }

                function s(e, t, r) {
                    if ("number" == typeof e) {
                        if ("string" == typeof t) throw TypeError('The "string" argument must be of type string. Received type number');
                        return f(e)
                    }
                    return u(e, t, r)
                }

                function u(e, t, r) {
                    if ("string" == typeof e) {
                        var n = e,
                            i = t;
                        if (("string" != typeof i || "" === i) && (i = "utf8"), !s.isEncoding(i)) throw TypeError("Unknown encoding: " + i);
                        var a = 0 | h(n, i),
                            u = o(a),
                            l = u.write(n, i);
                        return l !== a && (u = u.slice(0, l)), u
                    }
                    if (ArrayBuffer.isView(e)) return c(e);
                    if (null == e) throw TypeError("The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type " + typeof e);
                    if (C(e, ArrayBuffer) || e && C(e.buffer, ArrayBuffer) || "u" > typeof SharedArrayBuffer && (C(e, SharedArrayBuffer) || e && C(e.buffer, SharedArrayBuffer))) return function(e, t, r) {
                        var n;
                        if (t < 0 || e.byteLength < t) throw RangeError('"offset" is outside of buffer bounds');
                        if (e.byteLength < t + (r || 0)) throw RangeError('"length" is outside of buffer bounds');
                        return Object.setPrototypeOf(n = void 0 === t && void 0 === r ? new Uint8Array(e) : void 0 === r ? new Uint8Array(e, t) : new Uint8Array(e, t, r), s.prototype), n
                    }(e, t, r);
                    if ("number" == typeof e) throw TypeError('The "value" argument must not be of type number. Received type number');
                    var f = e.valueOf && e.valueOf();
                    if (null != f && f !== e) return s.from(f, t, r);
                    var p = function(e) {
                        if (s.isBuffer(e)) {
                            var t = 0 | d(e.length),
                                r = o(t);
                            return 0 === r.length || e.copy(r, 0, 0, t), r
                        }
                        return void 0 !== e.length ? "number" != typeof e.length || function(e) {
                            return e != e
                        }(e.length) ? o(0) : c(e) : "Buffer" === e.type && Array.isArray(e.data) ? c(e.data) : void 0
                    }(e);
                    if (p) return p;
                    if ("u" > typeof Symbol && null != Symbol.toPrimitive && "function" == typeof e[Symbol.toPrimitive]) return s.from(e[Symbol.toPrimitive]("string"), t, r);
                    throw TypeError("The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type " + typeof e)
                }

                function l(e) {
                    if ("number" != typeof e) throw TypeError('"size" argument must be of type number');
                    if (e < 0) throw RangeError('The value "' + e + '" is invalid for option "size"')
                }

                function f(e) {
                    return l(e), o(e < 0 ? 0 : 0 | d(e))
                }

                function c(e) {
                    for (var t = e.length < 0 ? 0 : 0 | d(e.length), r = o(t), n = 0; n < t; n += 1) r[n] = 255 & e[n];
                    return r
                }
                t.Buffer = s, t.SlowBuffer = function(e) {
                    return +e != e && (e = 0), s.alloc(+e)
                }, t.INSPECT_MAX_BYTES = 50, t.kMaxLength = 0x7fffffff, s.TYPED_ARRAY_SUPPORT = function() {
                    try {
                        var e = new Uint8Array(1),
                            t = {
                                foo: function() {
                                    return 42
                                }
                            };
                        return Object.setPrototypeOf(t, Uint8Array.prototype), Object.setPrototypeOf(e, t), 42 === e.foo()
                    } catch (e) {
                        return !1
                    }
                }(), !s.TYPED_ARRAY_SUPPORT && "u" > typeof console && "function" == typeof console.error && console.error("This browser lacks typed array (Uint8Array) support which is required by `buffer` v5.x. Use `buffer` v4.x if you require old browser support."), Object.defineProperty(s.prototype, "parent", {
                    enumerable: !0,
                    get: function() {
                        if (s.isBuffer(this)) return this.buffer
                    }
                }), Object.defineProperty(s.prototype, "offset", {
                    enumerable: !0,
                    get: function() {
                        if (s.isBuffer(this)) return this.byteOffset
                    }
                }), s.poolSize = 8192, s.from = function(e, t, r) {
                    return u(e, t, r)
                }, Object.setPrototypeOf(s.prototype, Uint8Array.prototype), Object.setPrototypeOf(s, Uint8Array), s.alloc = function(e, t, r) {
                    return (l(e), e <= 0) ? o(e) : void 0 !== t ? "string" == typeof r ? o(e).fill(t, r) : o(e).fill(t) : o(e)
                }, s.allocUnsafe = function(e) {
                    return f(e)
                }, s.allocUnsafeSlow = function(e) {
                    return f(e)
                };

                function d(e) {
                    if (e >= 0x7fffffff) throw RangeError("Attempt to allocate Buffer larger than maximum size: 0x7fffffff bytes");
                    return 0 | e
                }

                function h(e, t) {
                    if (s.isBuffer(e)) return e.length;
                    if (ArrayBuffer.isView(e) || C(e, ArrayBuffer)) return e.byteLength;
                    if ("string" != typeof e) throw TypeError('The "string" argument must be one of type string, Buffer, or ArrayBuffer. Received type ' + typeof e);
                    var r = e.length,
                        n = arguments.length > 2 && !0 === arguments[2];
                    if (!n && 0 === r) return 0;
                    for (var i = !1;;) switch (t) {
                        case "ascii":
                        case "latin1":
                        case "binary":
                            return r;
                        case "utf8":
                        case "utf-8":
                            return R(e).length;
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return 2 * r;
                        case "hex":
                            return r >>> 1;
                        case "base64":
                            return _(e).length;
                        default:
                            if (i) return n ? -1 : R(e).length;
                            t = ("" + t).toLowerCase(), i = !0
                    }
                }

                function p(e, t, r) {
                    var i, a, o, s = !1;
                    if ((void 0 === t || t < 0) && (t = 0), t > this.length || ((void 0 === r || r > this.length) && (r = this.length), r <= 0 || (r >>>= 0) <= (t >>>= 0))) return "";
                    for (e || (e = "utf8");;) switch (e) {
                        case "hex":
                            return function(e, t, r) {
                                var n = e.length;
                                (!t || t < 0) && (t = 0), (!r || r < 0 || r > n) && (r = n);
                                for (var i = "", a = t; a < r; ++a) i += P[e[a]];
                                return i
                            }(this, t, r);
                        case "utf8":
                        case "utf-8":
                            return E(this, t, r);
                        case "ascii":
                            return function(e, t, r) {
                                var n = "";
                                r = Math.min(e.length, r);
                                for (var i = t; i < r; ++i) n += String.fromCharCode(127 & e[i]);
                                return n
                            }(this, t, r);
                        case "latin1":
                        case "binary":
                            return function(e, t, r) {
                                var n = "";
                                r = Math.min(e.length, r);
                                for (var i = t; i < r; ++i) n += String.fromCharCode(e[i]);
                                return n
                            }(this, t, r);
                        case "base64":
                            return i = this, a = t, o = r, 0 === a && o === i.length ? n.fromByteArray(i) : n.fromByteArray(i.slice(a, o));
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return function(e, t, r) {
                                for (var n = e.slice(t, r), i = "", a = 0; a < n.length; a += 2) i += String.fromCharCode(n[a] + 256 * n[a + 1]);
                                return i
                            }(this, t, r);
                        default:
                            if (s) throw TypeError("Unknown encoding: " + e);
                            e = (e + "").toLowerCase(), s = !0
                    }
                }

                function m(e, t, r) {
                    var n = e[t];
                    e[t] = e[r], e[r] = n
                }

                function g(e, t, r, n, i) {
                    var a;
                    if (0 === e.length) return -1;
                    if ("string" == typeof r ? (n = r, r = 0) : r > 0x7fffffff ? r = 0x7fffffff : r < -0x80000000 && (r = -0x80000000), (a = r *= 1) != a && (r = i ? 0 : e.length - 1), r < 0 && (r = e.length + r), r >= e.length)
                        if (i) return -1;
                        else r = e.length - 1;
                    else if (r < 0)
                        if (!i) return -1;
                        else r = 0;
                    if ("string" == typeof t && (t = s.from(t, n)), s.isBuffer(t)) return 0 === t.length ? -1 : y(e, t, r, n, i);
                    if ("number" == typeof t) {
                        if (t &= 255, "function" == typeof Uint8Array.prototype.indexOf)
                            if (i) return Uint8Array.prototype.indexOf.call(e, t, r);
                            else return Uint8Array.prototype.lastIndexOf.call(e, t, r);
                        return y(e, [t], r, n, i)
                    }
                    throw TypeError("val must be string, number or Buffer")
                }

                function y(e, t, r, n, i) {
                    var a, o = 1,
                        s = e.length,
                        u = t.length;
                    if (void 0 !== n && ("ucs2" === (n = String(n).toLowerCase()) || "ucs-2" === n || "utf16le" === n || "utf-16le" === n)) {
                        if (e.length < 2 || t.length < 2) return -1;
                        o = 2, s /= 2, u /= 2, r /= 2
                    }

                    function l(e, t) {
                        return 1 === o ? e[t] : e.readUInt16BE(t * o)
                    }
                    if (i) {
                        var f = -1;
                        for (a = r; a < s; a++)
                            if (l(e, a) === l(t, -1 === f ? 0 : a - f)) {
                                if (-1 === f && (f = a), a - f + 1 === u) return f * o
                            } else - 1 !== f && (a -= a - f), f = -1
                    } else
                        for (r + u > s && (r = s - u), a = r; a >= 0; a--) {
                            for (var c = !0, d = 0; d < u; d++)
                                if (l(e, a + d) !== l(t, d)) {
                                    c = !1;
                                    break
                                } if (c) return a
                        }
                    return -1
                }
                s.isBuffer = function(e) {
                    return null != e && !0 === e._isBuffer && e !== s.prototype
                }, s.compare = function(e, t) {
                    if (C(e, Uint8Array) && (e = s.from(e, e.offset, e.byteLength)), C(t, Uint8Array) && (t = s.from(t, t.offset, t.byteLength)), !s.isBuffer(e) || !s.isBuffer(t)) throw TypeError('The "buf1", "buf2" arguments must be one of type Buffer or Uint8Array');
                    if (e === t) return 0;
                    for (var r = e.length, n = t.length, i = 0, a = Math.min(r, n); i < a; ++i)
                        if (e[i] !== t[i]) {
                            r = e[i], n = t[i];
                            break
                        } return r < n ? -1 : +(n < r)
                }, s.isEncoding = function(e) {
                    switch (String(e).toLowerCase()) {
                        case "hex":
                        case "utf8":
                        case "utf-8":
                        case "ascii":
                        case "latin1":
                        case "binary":
                        case "base64":
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return !0;
                        default:
                            return !1
                    }
                }, s.concat = function(e, t) {
                    if (!Array.isArray(e)) throw TypeError('"list" argument must be an Array of Buffers');
                    if (0 === e.length) return s.alloc(0);
                    if (void 0 === t)
                        for (r = 0, t = 0; r < e.length; ++r) t += e[r].length;
                    var r, n = s.allocUnsafe(t),
                        i = 0;
                    for (r = 0; r < e.length; ++r) {
                        var a = e[r];
                        if (C(a, Uint8Array) && (a = s.from(a)), !s.isBuffer(a)) throw TypeError('"list" argument must be an Array of Buffers');
                        a.copy(n, i), i += a.length
                    }
                    return n
                }, s.byteLength = h, s.prototype._isBuffer = !0, s.prototype.swap16 = function() {
                    var e = this.length;
                    if (e % 2 != 0) throw RangeError("Buffer size must be a multiple of 16-bits");
                    for (var t = 0; t < e; t += 2) m(this, t, t + 1);
                    return this
                }, s.prototype.swap32 = function() {
                    var e = this.length;
                    if (e % 4 != 0) throw RangeError("Buffer size must be a multiple of 32-bits");
                    for (var t = 0; t < e; t += 4) m(this, t, t + 3), m(this, t + 1, t + 2);
                    return this
                }, s.prototype.swap64 = function() {
                    var e = this.length;
                    if (e % 8 != 0) throw RangeError("Buffer size must be a multiple of 64-bits");
                    for (var t = 0; t < e; t += 8) m(this, t, t + 7), m(this, t + 1, t + 6), m(this, t + 2, t + 5), m(this, t + 3, t + 4);
                    return this
                }, s.prototype.toString = function() {
                    var e = this.length;
                    return 0 === e ? "" : 0 == arguments.length ? E(this, 0, e) : p.apply(this, arguments)
                }, s.prototype.toLocaleString = s.prototype.toString, s.prototype.equals = function(e) {
                    if (!s.isBuffer(e)) throw TypeError("Argument must be a Buffer");
                    return this === e || 0 === s.compare(this, e)
                }, s.prototype.inspect = function() {
                    var e = "",
                        r = t.INSPECT_MAX_BYTES;
                    return e = this.toString("hex", 0, r).replace(/(.{2})/g, "$1 ").trim(), this.length > r && (e += " ... "), "<Buffer " + e + ">"
                }, a && (s.prototype[a] = s.prototype.inspect), s.prototype.compare = function(e, t, r, n, i) {
                    if (C(e, Uint8Array) && (e = s.from(e, e.offset, e.byteLength)), !s.isBuffer(e)) throw TypeError('The "target" argument must be one of type Buffer or Uint8Array. Received type ' + typeof e);
                    if (void 0 === t && (t = 0), void 0 === r && (r = e ? e.length : 0), void 0 === n && (n = 0), void 0 === i && (i = this.length), t < 0 || r > e.length || n < 0 || i > this.length) throw RangeError("out of range index");
                    if (n >= i && t >= r) return 0;
                    if (n >= i) return -1;
                    if (t >= r) return 1;
                    if (t >>>= 0, r >>>= 0, n >>>= 0, i >>>= 0, this === e) return 0;
                    for (var a = i - n, o = r - t, u = Math.min(a, o), l = this.slice(n, i), f = e.slice(t, r), c = 0; c < u; ++c)
                        if (l[c] !== f[c]) {
                            a = l[c], o = f[c];
                            break
                        } return a < o ? -1 : +(o < a)
                }, s.prototype.includes = function(e, t, r) {
                    return -1 !== this.indexOf(e, t, r)
                }, s.prototype.indexOf = function(e, t, r) {
                    return g(this, e, t, r, !0)
                }, s.prototype.lastIndexOf = function(e, t, r) {
                    return g(this, e, t, r, !1)
                };

                function E(e, t, r) {
                    r = Math.min(e.length, r);
                    for (var n = [], i = t; i < r;) {
                        var a, o, s, u, l = e[i],
                            f = null,
                            c = l > 239 ? 4 : l > 223 ? 3 : l > 191 ? 2 : 1;
                        if (i + c <= r) switch (c) {
                            case 1:
                                l < 128 && (f = l);
                                break;
                            case 2:
                                (192 & (a = e[i + 1])) == 128 && (u = (31 & l) << 6 | 63 & a) > 127 && (f = u);
                                break;
                            case 3:
                                a = e[i + 1], o = e[i + 2], (192 & a) == 128 && (192 & o) == 128 && (u = (15 & l) << 12 | (63 & a) << 6 | 63 & o) > 2047 && (u < 55296 || u > 57343) && (f = u);
                                break;
                            case 4:
                                a = e[i + 1], o = e[i + 2], s = e[i + 3], (192 & a) == 128 && (192 & o) == 128 && (192 & s) == 128 && (u = (15 & l) << 18 | (63 & a) << 12 | (63 & o) << 6 | 63 & s) > 65535 && u < 1114112 && (f = u)
                        }
                        null === f ? (f = 65533, c = 1) : f > 65535 && (f -= 65536, n.push(f >>> 10 & 1023 | 55296), f = 56320 | 1023 & f), n.push(f), i += c
                    }
                    var d = n,
                        h = d.length;
                    if (h <= 4096) return String.fromCharCode.apply(String, d);
                    for (var p = "", m = 0; m < h;) p += String.fromCharCode.apply(String, d.slice(m, m += 4096));
                    return p
                }

                function v(e, t, r) {
                    if (e % 1 != 0 || e < 0) throw RangeError("offset is not uint");
                    if (e + t > r) throw RangeError("Trying to access beyond buffer length")
                }

                function A(e, t, r, n, i, a) {
                    if (!s.isBuffer(e)) throw TypeError('"buffer" argument must be a Buffer instance');
                    if (t > i || t < a) throw RangeError('"value" argument is out of bounds');
                    if (r + n > e.length) throw RangeError("Index out of range")
                }

                function b(e, t, r, n, i, a) {
                    if (r + n > e.length || r < 0) throw RangeError("Index out of range")
                }

                function I(e, t, r, n, a) {
                    return t *= 1, r >>>= 0, a || b(e, t, r, 4, 34028234663852886e22, -34028234663852886e22), i.write(e, t, r, n, 23, 4), r + 4
                }

                function M(e, t, r, n, a) {
                    return t *= 1, r >>>= 0, a || b(e, t, r, 8, 17976931348623157e292, -17976931348623157e292), i.write(e, t, r, n, 52, 8), r + 8
                }
                s.prototype.write = function(e, t, r, n) {
                    if (void 0 === t) n = "utf8", r = this.length, t = 0;
                    else if (void 0 === r && "string" == typeof t) n = t, r = this.length, t = 0;
                    else if (isFinite(t)) t >>>= 0, isFinite(r) ? (r >>>= 0, void 0 === n && (n = "utf8")) : (n = r, r = void 0);
                    else throw Error("Buffer.write(string, encoding, offset[, length]) is no longer supported");
                    var i, a, o, s, u, l, f, c, d = this.length - t;
                    if ((void 0 === r || r > d) && (r = d), e.length > 0 && (r < 0 || t < 0) || t > this.length) throw RangeError("Attempt to write outside buffer bounds");
                    n || (n = "utf8");
                    for (var h = !1;;) switch (n) {
                        case "hex":
                            return function(e, t, r, n) {
                                r = Number(r) || 0;
                                var i = e.length - r;
                                n ? (n = Number(n)) > i && (n = i) : n = i;
                                var a = t.length;
                                n > a / 2 && (n = a / 2);
                                for (var o = 0; o < n; ++o) {
                                    var s, u = parseInt(t.substr(2 * o, 2), 16);
                                    if ((s = u) != s) break;
                                    e[r + o] = u
                                }
                                return o
                            }(this, e, t, r);
                        case "utf8":
                        case "utf-8":
                            return i = t, a = r, N(R(e, this.length - i), this, i, a);
                        case "ascii":
                            return o = t, s = r, N(x(e), this, o, s);
                        case "latin1":
                        case "binary":
                            return function(e, t, r, n) {
                                return N(x(t), e, r, n)
                            }(this, e, t, r);
                        case "base64":
                            return u = t, l = r, N(_(e), this, u, l);
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return f = t, c = r, N(function(e, t) {
                                for (var r, n, i = [], a = 0; a < e.length && !((t -= 2) < 0); ++a) n = (r = e.charCodeAt(a)) >> 8, i.push(r % 256), i.push(n);
                                return i
                            }(e, this.length - f), this, f, c);
                        default:
                            if (h) throw TypeError("Unknown encoding: " + n);
                            n = ("" + n).toLowerCase(), h = !0
                    }
                }, s.prototype.toJSON = function() {
                    return {
                        type: "Buffer",
                        data: Array.prototype.slice.call(this._arr || this, 0)
                    }
                }, s.prototype.slice = function(e, t) {
                    var r = this.length;
                    e = ~~e, t = void 0 === t ? r : ~~t, e < 0 ? (e += r) < 0 && (e = 0) : e > r && (e = r), t < 0 ? (t += r) < 0 && (t = 0) : t > r && (t = r), t < e && (t = e);
                    var n = this.subarray(e, t);
                    return Object.setPrototypeOf(n, s.prototype), n
                }, s.prototype.readUIntLE = function(e, t, r) {
                    e >>>= 0, t >>>= 0, r || v(e, t, this.length);
                    for (var n = this[e], i = 1, a = 0; ++a < t && (i *= 256);) n += this[e + a] * i;
                    return n
                }, s.prototype.readUIntBE = function(e, t, r) {
                    e >>>= 0, t >>>= 0, r || v(e, t, this.length);
                    for (var n = this[e + --t], i = 1; t > 0 && (i *= 256);) n += this[e + --t] * i;
                    return n
                }, s.prototype.readUInt8 = function(e, t) {
                    return e >>>= 0, t || v(e, 1, this.length), this[e]
                }, s.prototype.readUInt16LE = function(e, t) {
                    return e >>>= 0, t || v(e, 2, this.length), this[e] | this[e + 1] << 8
                }, s.prototype.readUInt16BE = function(e, t) {
                    return e >>>= 0, t || v(e, 2, this.length), this[e] << 8 | this[e + 1]
                }, s.prototype.readUInt32LE = function(e, t) {
                    return e >>>= 0, t || v(e, 4, this.length), (this[e] | this[e + 1] << 8 | this[e + 2] << 16) + 0x1000000 * this[e + 3]
                }, s.prototype.readUInt32BE = function(e, t) {
                    return e >>>= 0, t || v(e, 4, this.length), 0x1000000 * this[e] + (this[e + 1] << 16 | this[e + 2] << 8 | this[e + 3])
                }, s.prototype.readIntLE = function(e, t, r) {
                    e >>>= 0, t >>>= 0, r || v(e, t, this.length);
                    for (var n = this[e], i = 1, a = 0; ++a < t && (i *= 256);) n += this[e + a] * i;
                    return n >= (i *= 128) && (n -= Math.pow(2, 8 * t)), n
                }, s.prototype.readIntBE = function(e, t, r) {
                    e >>>= 0, t >>>= 0, r || v(e, t, this.length);
                    for (var n = t, i = 1, a = this[e + --n]; n > 0 && (i *= 256);) a += this[e + --n] * i;
                    return a >= (i *= 128) && (a -= Math.pow(2, 8 * t)), a
                }, s.prototype.readInt8 = function(e, t) {
                    return (e >>>= 0, t || v(e, 1, this.length), 128 & this[e]) ? -((255 - this[e] + 1) * 1) : this[e]
                }, s.prototype.readInt16LE = function(e, t) {
                    e >>>= 0, t || v(e, 2, this.length);
                    var r = this[e] | this[e + 1] << 8;
                    return 32768 & r ? 0xffff0000 | r : r
                }, s.prototype.readInt16BE = function(e, t) {
                    e >>>= 0, t || v(e, 2, this.length);
                    var r = this[e + 1] | this[e] << 8;
                    return 32768 & r ? 0xffff0000 | r : r
                }, s.prototype.readInt32LE = function(e, t) {
                    return e >>>= 0, t || v(e, 4, this.length), this[e] | this[e + 1] << 8 | this[e + 2] << 16 | this[e + 3] << 24
                }, s.prototype.readInt32BE = function(e, t) {
                    return e >>>= 0, t || v(e, 4, this.length), this[e] << 24 | this[e + 1] << 16 | this[e + 2] << 8 | this[e + 3]
                }, s.prototype.readFloatLE = function(e, t) {
                    return e >>>= 0, t || v(e, 4, this.length), i.read(this, e, !0, 23, 4)
                }, s.prototype.readFloatBE = function(e, t) {
                    return e >>>= 0, t || v(e, 4, this.length), i.read(this, e, !1, 23, 4)
                }, s.prototype.readDoubleLE = function(e, t) {
                    return e >>>= 0, t || v(e, 8, this.length), i.read(this, e, !0, 52, 8)
                }, s.prototype.readDoubleBE = function(e, t) {
                    return e >>>= 0, t || v(e, 8, this.length), i.read(this, e, !1, 52, 8)
                }, s.prototype.writeUIntLE = function(e, t, r, n) {
                    if (e *= 1, t >>>= 0, r >>>= 0, !n) {
                        var i = Math.pow(2, 8 * r) - 1;
                        A(this, e, t, r, i, 0)
                    }
                    var a = 1,
                        o = 0;
                    for (this[t] = 255 & e; ++o < r && (a *= 256);) this[t + o] = e / a & 255;
                    return t + r
                }, s.prototype.writeUIntBE = function(e, t, r, n) {
                    if (e *= 1, t >>>= 0, r >>>= 0, !n) {
                        var i = Math.pow(2, 8 * r) - 1;
                        A(this, e, t, r, i, 0)
                    }
                    var a = r - 1,
                        o = 1;
                    for (this[t + a] = 255 & e; --a >= 0 && (o *= 256);) this[t + a] = e / o & 255;
                    return t + r
                }, s.prototype.writeUInt8 = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || A(this, e, t, 1, 255, 0), this[t] = 255 & e, t + 1
                }, s.prototype.writeUInt16LE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || A(this, e, t, 2, 65535, 0), this[t] = 255 & e, this[t + 1] = e >>> 8, t + 2
                }, s.prototype.writeUInt16BE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || A(this, e, t, 2, 65535, 0), this[t] = e >>> 8, this[t + 1] = 255 & e, t + 2
                }, s.prototype.writeUInt32LE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || A(this, e, t, 4, 0xffffffff, 0), this[t + 3] = e >>> 24, this[t + 2] = e >>> 16, this[t + 1] = e >>> 8, this[t] = 255 & e, t + 4
                }, s.prototype.writeUInt32BE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || A(this, e, t, 4, 0xffffffff, 0), this[t] = e >>> 24, this[t + 1] = e >>> 16, this[t + 2] = e >>> 8, this[t + 3] = 255 & e, t + 4
                }, s.prototype.writeIntLE = function(e, t, r, n) {
                    if (e *= 1, t >>>= 0, !n) {
                        var i = Math.pow(2, 8 * r - 1);
                        A(this, e, t, r, i - 1, -i)
                    }
                    var a = 0,
                        o = 1,
                        s = 0;
                    for (this[t] = 255 & e; ++a < r && (o *= 256);) e < 0 && 0 === s && 0 !== this[t + a - 1] && (s = 1), this[t + a] = (e / o | 0) - s & 255;
                    return t + r
                }, s.prototype.writeIntBE = function(e, t, r, n) {
                    if (e *= 1, t >>>= 0, !n) {
                        var i = Math.pow(2, 8 * r - 1);
                        A(this, e, t, r, i - 1, -i)
                    }
                    var a = r - 1,
                        o = 1,
                        s = 0;
                    for (this[t + a] = 255 & e; --a >= 0 && (o *= 256);) e < 0 && 0 === s && 0 !== this[t + a + 1] && (s = 1), this[t + a] = (e / o | 0) - s & 255;
                    return t + r
                }, s.prototype.writeInt8 = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || A(this, e, t, 1, 127, -128), e < 0 && (e = 255 + e + 1), this[t] = 255 & e, t + 1
                }, s.prototype.writeInt16LE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || A(this, e, t, 2, 32767, -32768), this[t] = 255 & e, this[t + 1] = e >>> 8, t + 2
                }, s.prototype.writeInt16BE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || A(this, e, t, 2, 32767, -32768), this[t] = e >>> 8, this[t + 1] = 255 & e, t + 2
                }, s.prototype.writeInt32LE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || A(this, e, t, 4, 0x7fffffff, -0x80000000), this[t] = 255 & e, this[t + 1] = e >>> 8, this[t + 2] = e >>> 16, this[t + 3] = e >>> 24, t + 4
                }, s.prototype.writeInt32BE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || A(this, e, t, 4, 0x7fffffff, -0x80000000), e < 0 && (e = 0xffffffff + e + 1), this[t] = e >>> 24, this[t + 1] = e >>> 16, this[t + 2] = e >>> 8, this[t + 3] = 255 & e, t + 4
                }, s.prototype.writeFloatLE = function(e, t, r) {
                    return I(this, e, t, !0, r)
                }, s.prototype.writeFloatBE = function(e, t, r) {
                    return I(this, e, t, !1, r)
                }, s.prototype.writeDoubleLE = function(e, t, r) {
                    return M(this, e, t, !0, r)
                }, s.prototype.writeDoubleBE = function(e, t, r) {
                    return M(this, e, t, !1, r)
                }, s.prototype.copy = function(e, t, r, n) {
                    if (!s.isBuffer(e)) throw TypeError("argument should be a Buffer");
                    if (r || (r = 0), n || 0 === n || (n = this.length), t >= e.length && (t = e.length), t || (t = 0), n > 0 && n < r && (n = r), n === r || 0 === e.length || 0 === this.length) return 0;
                    if (t < 0) throw RangeError("targetStart out of bounds");
                    if (r < 0 || r >= this.length) throw RangeError("Index out of range");
                    if (n < 0) throw RangeError("sourceEnd out of bounds");
                    n > this.length && (n = this.length), e.length - t < n - r && (n = e.length - t + r);
                    var i = n - r;
                    if (this === e && "function" == typeof Uint8Array.prototype.copyWithin) this.copyWithin(t, r, n);
                    else if (this === e && r < t && t < n)
                        for (var a = i - 1; a >= 0; --a) e[a + t] = this[a + r];
                    else Uint8Array.prototype.set.call(e, this.subarray(r, n), t);
                    return i
                }, s.prototype.fill = function(e, t, r, n) {
                    if ("string" == typeof e) {
                        if ("string" == typeof t ? (n = t, t = 0, r = this.length) : "string" == typeof r && (n = r, r = this.length), void 0 !== n && "string" != typeof n) throw TypeError("encoding must be a string");
                        if ("string" == typeof n && !s.isEncoding(n)) throw TypeError("Unknown encoding: " + n);
                        if (1 === e.length) {
                            var i, a = e.charCodeAt(0);
                            ("utf8" === n && a < 128 || "latin1" === n) && (e = a)
                        }
                    } else "number" == typeof e ? e &= 255 : "boolean" == typeof e && (e = Number(e));
                    if (t < 0 || this.length < t || this.length < r) throw RangeError("Out of range index");
                    if (r <= t) return this;
                    if (t >>>= 0, r = void 0 === r ? this.length : r >>> 0, e || (e = 0), "number" == typeof e)
                        for (i = t; i < r; ++i) this[i] = e;
                    else {
                        var o = s.isBuffer(e) ? e : s.from(e, n),
                            u = o.length;
                        if (0 === u) throw TypeError('The value "' + e + '" is invalid for argument "value"');
                        for (i = 0; i < r - t; ++i) this[i + t] = o[i % u]
                    }
                    return this
                };
                var T = /[^+/0-9A-Za-z-_]/g;

                function R(e, t) {
                    t = t || 1 / 0;
                    for (var r, n = e.length, i = null, a = [], o = 0; o < n; ++o) {
                        if ((r = e.charCodeAt(o)) > 55295 && r < 57344) {
                            if (!i) {
                                if (r > 56319 || o + 1 === n) {
                                    (t -= 3) > -1 && a.push(239, 191, 189);
                                    continue
                                }
                                i = r;
                                continue
                            }
                            if (r < 56320) {
                                (t -= 3) > -1 && a.push(239, 191, 189), i = r;
                                continue
                            }
                            r = (i - 55296 << 10 | r - 56320) + 65536
                        } else i && (t -= 3) > -1 && a.push(239, 191, 189);
                        if (i = null, r < 128) {
                            if ((t -= 1) < 0) break;
                            a.push(r)
                        } else if (r < 2048) {
                            if ((t -= 2) < 0) break;
                            a.push(r >> 6 | 192, 63 & r | 128)
                        } else if (r < 65536) {
                            if ((t -= 3) < 0) break;
                            a.push(r >> 12 | 224, r >> 6 & 63 | 128, 63 & r | 128)
                        } else if (r < 1114112) {
                            if ((t -= 4) < 0) break;
                            a.push(r >> 18 | 240, r >> 12 & 63 | 128, r >> 6 & 63 | 128, 63 & r | 128)
                        } else throw Error("Invalid code point")
                    }
                    return a
                }

                function x(e) {
                    for (var t = [], r = 0; r < e.length; ++r) t.push(255 & e.charCodeAt(r));
                    return t
                }

                function _(e) {
                    return n.toByteArray(function(e) {
                        if ((e = (e = e.split("=")[0]).trim().replace(T, "")).length < 2) return "";
                        for (; e.length % 4 != 0;) e += "=";
                        return e
                    }(e))
                }

                function N(e, t, r, n) {
                    for (var i = 0; i < n && !(i + r >= t.length) && !(i >= e.length); ++i) t[i + r] = e[i];
                    return i
                }

                function C(e, t) {
                    return e instanceof t || null != e && null != e.constructor && null != e.constructor.name && e.constructor.name === t.name
                }
                var P = function() {
                    for (var e = "0123456789abcdef", t = Array(256), r = 0; r < 16; ++r)
                        for (var n = 16 * r, i = 0; i < 16; ++i) t[n + i] = e[r] + e[i];
                    return t
                }()
            },
            321: function(e, t) {
                t.read = function(e, t, r, n, i) {
                    var a, o, s = 8 * i - n - 1,
                        u = (1 << s) - 1,
                        l = u >> 1,
                        f = -7,
                        c = r ? i - 1 : 0,
                        d = r ? -1 : 1,
                        h = e[t + c];
                    for (c += d, a = h & (1 << -f) - 1, h >>= -f, f += s; f > 0; a = 256 * a + e[t + c], c += d, f -= 8);
                    for (o = a & (1 << -f) - 1, a >>= -f, f += n; f > 0; o = 256 * o + e[t + c], c += d, f -= 8);
                    if (0 === a) a = 1 - l;
                    else {
                        if (a === u) return o ? NaN : 1 / 0 * (h ? -1 : 1);
                        o += Math.pow(2, n), a -= l
                    }
                    return (h ? -1 : 1) * o * Math.pow(2, a - n)
                }, t.write = function(e, t, r, n, i, a) {
                    var o, s, u, l = 8 * a - i - 1,
                        f = (1 << l) - 1,
                        c = f >> 1,
                        d = 5960464477539062e-23 * (23 === i),
                        h = n ? 0 : a - 1,
                        p = n ? 1 : -1,
                        m = +(t < 0 || 0 === t && 1 / t < 0);
                    for (isNaN(t = Math.abs(t)) || t === 1 / 0 ? (s = +!!isNaN(t), o = f) : (o = Math.floor(Math.log(t) / Math.LN2), t * (u = Math.pow(2, -o)) < 1 && (o--, u *= 2), o + c >= 1 ? t += d / u : t += d * Math.pow(2, 1 - c), t * u >= 2 && (o++, u /= 2), o + c >= f ? (s = 0, o = f) : o + c >= 1 ? (s = (t * u - 1) * Math.pow(2, i), o += c) : (s = t * Math.pow(2, c - 1) * Math.pow(2, i), o = 0)); i >= 8; e[r + h] = 255 & s, h += p, s /= 256, i -= 8);
                    for (o = o << i | s, l += i; l > 0; e[r + h] = 255 & o, h += p, o /= 256, l -= 8);
                    e[r + h - p] |= 128 * m
                }
            }
        },
        i = {};

    function a(e) {
        var t = i[e];
        if (void 0 !== t) return t.exports;
        var r = i[e] = {
                exports: {}
            },
            o = !0;
        try {
            n[e](r, r.exports, a), o = !1
        } finally {
            o && delete i[e]
        }
        return r.exports
    }
    a.ab = "/ROOT/node_modules/.pnpm/next@16.3.0_@babel+core@7.29.0_@opentelemetry+api@1.9.1_@playwright+test@1.61.1_@types+_379fb98fecc9fc5f7bce6eca48d1b2a5/node_modules/next/dist/compiled/buffer/", t.exports = a(230)
}]);

//# debugId=1f2fdec3-b4c5-3b20-59bb-55f73372950c
//# sourceMappingURL=2vgocd_r6mb3c.js.map
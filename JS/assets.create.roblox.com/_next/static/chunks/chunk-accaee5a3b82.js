;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "5d1d0255-fc1e-e93d-db61-a263e5fd15b3")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 923319, e => {
    "use strict";
    var t, i, n = e.i(730530),
        r = ((t = {}).BoldText = "boldText", t.Text = "text", t.TextWithDisplayValue = "textWithDisplayValue", t.Number = "number", t.Timestamp = "timestamp", t.RawJSONString = "RawJSONString", t.CodeDiff = "codeDiff", t.TextWithTooltip = "textWithTooltip", t.Other = "other", t.Selection = "selection", t.Actions = "actions", t.TextWithLink = "textWithLink", t.Image = "image", t.Date = "date", t.Status = "status", t.TextWithIcon = "TextWithIcon", t.Code = "code", t),
        o = ((i = {}).ValueOpacityFill = "valueOpacityFill", i.ValuePercentageWidthFill = "valuePercentageWidthFill", i.ConstantFill = "constantFill", i);
    e.s(["CellBackgroundType", () => o, "ColumnType", () => r, "ColumnTypeToAlign", 0, {
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
    }, "resolveTableColumnTitle", 0, (e, t, i) => void 0 !== i ? (0, n.brandUntranslatableText)(i) : "string" == typeof t ? t : e(t)])
}, 447311, e => {
    "use strict";
    var t, i = ((t = {}).Positive = "Positive", t.Negative = "Negative", t.Progression = "Progression", t.Highlight = "Highlight", t);
    e.s(["TableCellBackgroundColor", () => i])
}, 36826, 61925, e => {
    "use strict";
    var t, i, n, r, o, a, s = e.i(677753),
        l = function(e, t) {
            return (l = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var i in t) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i])
            })(e, t)
        };

    function u(e, t, i, n) {
        return new(i || (i = Promise))(function(r, o) {
            function a(e) {
                try {
                    l(n.next(e))
                } catch (e) {
                    o(e)
                }
            }

            function s(e) {
                try {
                    l(n.throw(e))
                } catch (e) {
                    o(e)
                }
            }

            function l(e) {
                var t;
                e.done ? r(e.value) : ((t = e.value) instanceof i ? t : new i(function(e) {
                    e(t)
                })).then(a, s)
            }
            l((n = n.apply(e, t || [])).next())
        })
    }

    function c(e, t) {
        var i, n, r, o = {
                label: 0,
                sent: function() {
                    if (1 & r[0]) throw r[1];
                    return r[1]
                },
                trys: [],
                ops: []
            },
            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
            return this
        }), a;

        function s(s) {
            return function(l) {
                var u = [s, l];
                if (i) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, u[0] && (o = 0)), o;) try {
                    if (i = 1, n && (r = 2 & u[0] ? n.return : u[0] ? n.throw || ((r = n.return) && r.call(n), 0) : n.next) && !(r = r.call(n, u[1])).done) return r;
                    switch (n = 0, r && (u = [2 & u[0], r.value]), u[0]) {
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
                            o.label++, n = u[1], u = [0];
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
                    u = [6, e], n = 0
                } finally {
                    i = r = 0
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
    var d = {
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

    function m(e) {
        var t, i, n, r, o, a, l, u, c, d, m, p, E, v, g, A, I, T;
        return null == (t = e) ? t : {
            id: (0, s.exists)(t, "id") ? t.id : void 0,
            annotationType: (0, s.exists)(t, "annotationType") ? t.annotationType : void 0,
            metadata: (0, s.exists)(t, "metadata") ? null == (i = t.metadata) ? i : {
                placeIcon: (0, s.exists)(i, "placeIcon") ? null == (n = i.placeIcon) ? n : {
                    iconAssetId: (0, s.exists)(n, "iconAssetId") ? n.iconAssetId : void 0
                } : void 0,
                devProduct: (0, s.exists)(i, "devProduct") ? null == (r = i.devProduct) ? r : {
                    name: (0, s.exists)(r, "name") ? r.name : void 0,
                    imageAssetId: (0, s.exists)(r, "imageAssetId") ? r.imageAssetId : void 0,
                    priceInRobux: (0, s.exists)(r, "priceInRobux") ? r.priceInRobux : void 0
                } : void 0,
                gamePass: (0, s.exists)(i, "gamePass") ? null == (o = i.gamePass) ? o : {
                    name: (0, s.exists)(o, "name") ? o.name : void 0,
                    imageAssetId: (0, s.exists)(o, "imageAssetId") ? o.imageAssetId : void 0,
                    priceInRobux: (0, s.exists)(o, "priceInRobux") ? o.priceInRobux : void 0,
                    isForSale: (0, s.exists)(o, "isForSale") ? o.isForSale : void 0
                } : void 0,
                placeThumbnail: (0, s.exists)(i, "placeThumbnail") ? null == (a = i.placeThumbnail) ? a : {
                    thumbnailAssetId: (0, s.exists)(a, "thumbnailAssetId") ? a.thumbnailAssetId : void 0,
                    thumbnailAssetIds: (0, s.exists)(a, "thumbnailAssetIds") ? a.thumbnailAssetIds : void 0
                } : void 0,
                placeVersion: (0, s.exists)(i, "placeVersion") ? null == (l = i.placeVersion) ? l : {
                    versionNumber: (0, s.exists)(l, "versionNumber") ? l.versionNumber : void 0,
                    isPublished: (0, s.exists)(l, "isPublished") ? l.isPublished : void 0
                } : void 0,
                benchmarkChange: (0, s.exists)(i, "benchmarkChange") ? null == (u = i.benchmarkChange) ? u : {
                    fromBenchmarkType: (0, s.exists)(u, "fromBenchmarkType") ? u.fromBenchmarkType : void 0,
                    toBenchmarkType: (0, s.exists)(u, "toBenchmarkType") ? u.toBenchmarkType : void 0
                } : void 0,
                funnelStepNameChange: (0, s.exists)(i, "funnelStepNameChange") ? null == (c = i.funnelStepNameChange) ? c : {
                    minStep: (0, s.exists)(c, "minStep") ? c.minStep : void 0
                } : void 0,
                experienceEventState: (0, s.exists)(i, "experienceEventState") ? null == (d = i.experienceEventState) ? d : {
                    eventId: (0, s.exists)(d, "eventId") ? d.eventId : void 0,
                    eventName: (0, s.exists)(d, "eventName") ? d.eventName : void 0,
                    imageAssetId: (0, s.exists)(d, "imageAssetId") ? d.imageAssetId : void 0,
                    eventStateType: (0, s.exists)(d, "eventStateType") ? d.eventStateType : void 0
                } : void 0,
                customMatchmaking: (0, s.exists)(i, "customMatchmaking") ? null == (m = i.customMatchmaking) ? m : {
                    stateChange: (0, s.exists)(m, "stateChange") ? m.stateChange : void 0,
                    scoringConfigurationName: (0, s.exists)(m, "scoringConfigurationName") ? m.scoringConfigurationName : void 0
                } : void 0,
                engineRelease: (0, s.exists)(i, "engineRelease") ? null == (p = i.engineRelease) ? p : {
                    platform: (0, s.exists)(p, "platform") ? p.platform : void 0,
                    releaseMajorVersion: (0, s.exists)(p, "releaseMajorVersion") ? p.releaseMajorVersion : void 0
                } : void 0,
                gamePreviewVideoStateChange: (0, s.exists)(i, "gamePreviewVideoStateChange") ? null == (E = i.gamePreviewVideoStateChange) ? E : {
                    videoAssetId: (0, s.exists)(E, "videoAssetId") ? E.videoAssetId : void 0,
                    universeId: (0, s.exists)(E, "universeId") ? E.universeId : void 0,
                    gamePreviewVideoStateType: (0, s.exists)(E, "gamePreviewVideoStateType") ? E.gamePreviewVideoStateType : void 0
                } : void 0,
                configChange: (0, s.exists)(i, "configChange") ? null == (v = i.configChange) ? v : {
                    version: (0, s.exists)(v, "version") ? v.version : void 0
                } : void 0,
                experimentationOperation: (0, s.exists)(i, "experimentationOperation") ? null == (g = i.experimentationOperation) ? g : {
                    status: (0, s.exists)(g, "status") ? g.status : void 0,
                    experimentName: (0, s.exists)(g, "experimentName") ? g.experimentName : void 0,
                    exposurePercent: (0, s.exists)(g, "exposurePercent") ? g.exposurePercent : void 0,
                    rampedVariantLabel: (0, s.exists)(g, "rampedVariantLabel") ? g.rampedVariantLabel : void 0,
                    experimentId: (0, s.exists)(g, "experimentId") ? g.experimentId : void 0
                } : void 0,
                globalAnnouncement: (0, s.exists)(i, "globalAnnouncement") ? null == (A = i.globalAnnouncement) ? A : {
                    forAllPages: (0, s.exists)(A, "forAllPages") ? A.forAllPages : void 0,
                    appliedMetrics: (0, s.exists)(A, "appliedMetrics") ? A.appliedMetrics : void 0,
                    translationKey: (0, s.exists)(A, "translationKey") ? A.translationKey : void 0,
                    links: (0, s.exists)(A, "links") ? A.links : void 0
                } : void 0,
                extendedServicesEnablement: (0, s.exists)(i, "extendedServicesEnablement") ? null == (I = i.extendedServicesEnablement) ? I : {
                    service: (0, s.exists)(I, "service") ? I.service : void 0,
                    resource: (0, s.exists)(I, "resource") ? I.resource : void 0,
                    enabled: (0, s.exists)(I, "enabled") ? I.enabled : void 0,
                    enablementType: (0, s.exists)(I, "enablementType") ? I.enablementType : void 0
                } : void 0,
                creatorRegexChange: (0, s.exists)(i, "creatorRegexChange") ? null == (T = i.creatorRegexChange) ? T : {
                    regexOperation: (0, s.exists)(T, "regexOperation") ? T.regexOperation : void 0
                } : void 0
            } : void 0,
            createdUtcTime: (0, s.exists)(t, "createdUtcTime") ? t.createdUtcTime : void 0
        }
    }
    var p = function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        return function(e, t) {
            if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

            function i() {
                this.constructor = e
            }
            l(e, t), e.prototype = null === t ? Object.create(t) : (i.prototype = t.prototype, new i)
        }(t, e), t.prototype.v1UniversesUniverseIdAnnotationsGetRaw = function(e, t) {
            return u(this, void 0, void 0, function() {
                var i, n, r;
                return c(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new s.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdAnnotationsGet.");
                            return i = {}, void 0 !== e.annotationType && (i.annotationType = e.annotationType), void 0 !== e.inclusiveStartUtcTime && (i.inclusiveStartUtcTime = e.inclusiveStartUtcTime), void 0 !== e.inclusiveEndUtcTime && (i.inclusiveEndUtcTime = e.inclusiveEndUtcTime), void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.reverse && (i.reverse = e.reverse), void 0 !== e.resultsPerPage && (i.resultsPerPage = e.resultsPerPage), void 0 !== e.placeId && (i.placeId = e.placeId), void 0 !== e.developerProductId && (i.developerProductId = e.developerProductId), void 0 !== e.gamePassId && (i.gamePassId = e.gamePassId), void 0 !== e.funnelName && (i.funnelName = e.funnelName), n = {}, [4, this.request({
                                path: "/v1/universes/{universeId}/annotations".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/universes/{universeId}/annotations",
                                method: "GET",
                                headers: n,
                                query: i
                            }, t)];
                        case 1:
                            return r = o.sent(), [2, new s.JSONApiResponse(r, function(e) {
                                return null == e ? e : {
                                    annotations: (0, s.exists)(e, "annotations") ? e.annotations.map(m) : void 0,
                                    nextCursor: (0, s.exists)(e, "nextCursor") ? e.nextCursor : void 0,
                                    previousCursor: (0, s.exists)(e, "previousCursor") ? e.previousCursor : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1UniversesUniverseIdAnnotationsGet = function(e, t) {
            return u(this, void 0, void 0, function() {
                return c(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.v1UniversesUniverseIdAnnotationsGetRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, t
    }(s.BaseAPI);
    e.s(["AnalyticsAnnotationsAPIApi", 0, p, "AnnotationType", 0, d, "CustomMatchmakingChange", 0, {
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
    var E = ((t = {}).PlaceIcon = "PlaceIcon", t.PlaceThumbnail = "PlaceThumbnail", t.PlaceVideo = "PlaceVideo", t.PlaceVersion = "PlaceVersion", t.Benchmark = "Benchmark", t.FunnelStepNameChange = "FunnelStepNameChange", t.LiveEvent = "LiveEvent", t.CustomMatchmaking = "CustomMatchmaking", t.EngineRelease = "EngineRelease", t.MemoryStoreMemoryUsageAlert = "MemoryStoreMemoryUsageAlert", t.MemoryStoreRequestsAlert = "MemoryStoreRequestsAlert", t.ClientCrashRateNotStableAlert = "ClientCrashRateNotStableAlert", t.RetentionCorhortDisclaimer = "RetentionCorhortDisclaimer", t.ConfigVersion = "ConfigVersion", t.Announcement = "Announcement", t.ExtendedServicesEnablement = "ExtendedServicesEnablement", t.ConfiguredAlertIncident = "ConfiguredAlertIncident", t.CreatorRegexChange = "CreatorRegexChange", t);
    let v = {
        PlaceIcon: d.NUMBER_1,
        PlaceThumbnail: d.NUMBER_4,
        PlaceVersion: d.NUMBER_5,
        Benchmark: d.NUMBER_6,
        FunnelStepNameChange: d.NUMBER_7,
        LiveEvent: d.NUMBER_8,
        CustomMatchmaking: d.NUMBER_9,
        EngineRelease: d.NUMBER_10,
        PlaceVideo: d.NUMBER_11,
        ConfigVersion: d.NUMBER_12,
        ExtendedServicesEnablement: d.NUMBER_15,
        CreatorRegexChange: d.NUMBER_16
    };
    var g = ((i = {}).Similarity = "SIMILARITY", i.Genre = "GENRE", i),
        A = ((n = {}).Enrollment = "Enrollment", n.Unenrollment = "Unenrollment", n.WeightsUpdate = "WeightsUpdate", n),
        I = ((r = {}).Rcc = "RCC", r.WindowsPlayer = "WindowsPlayer", r.MacPlayer = "MacPlayer", r),
        T = ((o = {}).IgnoreAdd = "REGEX_OPERATION_IGNORE_ADD", o.IgnoreRemove = "REGEX_OPERATION_IGNORE_REMOVE", o),
        M = ((a = {}).Standard = "ENABLEMENT_TYPE_STANDARD", a.Extended = "ENABLEMENT_TYPE_EXTENDED", a);
    e.s(["AnnotationBenchmarkType", () => g, "AnnotationCreatorRegexOperation", () => T, "AnnotationCustomMatchmakingChangeType", () => A, "AnnotationEnablementType", () => M, "AnnotationEngineReleasePlatform", () => I, "AnnotationType", () => E, "UIAnnotationTypeToApiAnnotation", 0, v, "isAnnotationAlertType", 0, e => "MemoryStoreMemoryUsageAlert" === e || "MemoryStoreRequestsAlert" === e || "ClientCrashRateNotStableAlert" === e], 36826)
}, 215928, 929764, e => {
    "use strict";
    var t = e.i(31611),
        i = e.i(927868),
        n = e.i(908374),
        r = e.i(606662);
    let o = e => null !== e.aggregationType || null !== e.percentile;
    e.s(["default", 0, (e, n) => {
        let o = [],
            a = null,
            s = null;
        return null == e || e.forEach(e => {
            if (e.dimension !== t.RAQIV2UIPseudoDimension.AggregationType && e.dimension !== t.RAQIV2UIPseudoDimension.PercentileType) return void o.push(e);
            let l = e.values[0];
            if (!l) return;
            let u = (0, r.getSupportedFilterDimensionOptions)(n ? [n] : [], e.dimension);
            (void 0 === u || (0, r.isSupportedMetricFanoutDimensionValue)(u, l)) && (e.dimension === t.RAQIV2UIPseudoDimension.AggregationType && (0, i.isValidEnumValue)(t.RAQIV2AggregationType, l) ? a = l : e.dimension === t.RAQIV2UIPseudoDimension.PercentileType && (0, i.isValidEnumValue)(t.RAQIV2PercentileType, l) && (s = l))
        }), {
            pseudoDimensionValues: {
                aggregationType: a,
                percentile: s
            },
            realFilters: o
        }
    }, "hasPseudoDimensionValues", 0, o], 929764);
    let a = e => {
            var n;
            return (0, i.isValidEnumValue)(t.RAQIV2BenchmarkDatasetKey, e) && (null == (n = t.RAQIV2BenchmarkDatasetKeyToVariant[e]) ? void 0 : n.variantId) === t.RAQIV2BenchmarkVariantId.L7Average
        },
        s = Object.entries(t.RAQIV2BenchmarkDatasetKeyToVariant).reduce((e, t) => {
            let [i, r] = t;
            return a(i) && (0, n.isNumericUIMetric)(r.metric) && (e[i] = r.metric), e
        }, {}),
        l = new Set(Object.keys(t.RAQIV2BenchmarkDatasetKeyToVariant).filter(a)),
        u = (e, i) => {
            var n;
            return e === t.RAQIV2UIMetric.CustomEventsV2 && (null == i ? void 0 : i.customEventName) ? {
                metric: e,
                customEventName: i.customEventName,
                ...(null == (n = i.pseudoDimensionValues) ? void 0 : n.aggregationType) ? {
                    aggregationType: i.pseudoDimensionValues.aggregationType
                } : {}
            } : e
        },
        c = (e, t) => {
            let i;
            return {
                sources: [(i = {
                    key: "A",
                    metric: u(e, t)
                }, (null == t ? void 0 : t.pseudoDimensionValues) && o(t.pseudoDimensionValues) && (i.pseudoDimensionValues = t.pseudoDimensionValues), i)],
                formula: "A",
                l7Smoothing: !0
            }
        },
        d = e => 1 === e.sources.length && e.formula.trim() === e.sources[0].key,
        m = e => !!e.l7Smoothing && d(e);
    e.s(["buildL7SmoothingComputedMetric", 0, c, "getBaseMetricFromL7", 0, e => {
        var t;
        return a(e) && null != (t = s[e]) ? t : null
    }, "getBenchmarkVariantByDatasetKey", 0, e => t.RAQIV2BenchmarkDatasetKeyToVariant[e], "getMetricForL7Smoothing", 0, (e, t, i) => t ? c(e, i) : u(e, i), "getPeriodSummaryBaseMetricForL7", 0, e => {
        var n, r;
        if (!m(e)) return;
        let [a] = e.sources;
        if (!("string" != typeof a.metric || (null != (n = null == (r = a.filters) ? void 0 : r.length) ? n : 0) > 0 || a.pseudoDimensionValues && o(a.pseudoDimensionValues))) return (0, i.isValidEnumValue)(t.RAQIV2Metric, a.metric) ? a.metric : void 0
    }, "getPrecomputedL7MetricFromBase", 0, e => {
        var n, r;
        if (!(0, i.isValidEnumValue)(t.RAQIV2Metric, e)) return null;
        let o = null == (r = t.RAQIV2BenchmarkVariantsByMetric[e]) || null == (n = r[t.RAQIV2BenchmarkVariantId.L7Average]) ? void 0 : n.datasetKey;
        return o && a(o) ? o : null
    }, "isIdentityFormulaComputedMetric", 0, d, "isPrecomputedL7Metric", 0, a, "isPureL7SmoothingComputedMetric", 0, m, "precomputedL7Metrics", 0, l], 215928)
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
        i = e.i(927868),
        n = e.i(405005);
    e.s(["default", 0, e => (0, i.isValidEnumValue)(t.RAQIV2UIPseudoDimension, e) && t.RAQIV2DimensionDisplayConfig[e].pseudoDimensionConfig.type === t.RAQIV2UIPseudoDimensionType.MetricFanout, "hasMetricFanoutBreakdown", 0, (e, t) => (0, n.hasMetricVariantFanout)(t, e)])
}, 339923, e => {
    "use strict";
    var t = e.i(31611),
        i = e.i(730530),
        n = e.i(577038),
        r = e.i(881670),
        o = e.i(927868),
        a = e.i(215928),
        s = e.i(908374),
        l = e.i(11517);
    let u = e => "string" == typeof e && e.trim().length > 0,
        c = e => (0, o.isValidEnumValue)(t.RAQIV2Metric, e),
        d = e => (0, i.brandUntranslatableText)(e),
        m = (e, t) => {
            if (!(0, l.isComputedMetric)(e)) {
                if ((0, l.isCustomEventsAtomicMetricLike)(e)) return d(e.customEventName);
                let {
                    localizedName: i
                } = (0, s.default)((0, l.getUIMetricFromAtomicMetricLike)(e));
                return t ? t.translate(i) : d(i.key)
            }
            return (0, a.isPureL7SmoothingComputedMetric)(e) ? m(e.sources[0].metric, t) : d(u(e.name) ? e.name : e.formula)
        },
        p = (0, i.translationKey)("Label.ExploreMode.UntitledFormula", r.TranslationNamespace.Analytics),
        E = (e, t) => {
            if ((0, l.isComputedMetric)(e)) return (0, a.isPureL7SmoothingComputedMetric)(e) ? E(e.sources[0].metric, t) : (0, i.brandUntranslatableText)("");
            let {
                localizedName: n
            } = (0, s.default)((0, l.getUIMetricFromAtomicMetricLike)(e));
            return t.translate(n)
        },
        v = e => (0, l.isComputedMetric)(e) ? !(0, a.isPureL7SmoothingComputedMetric)(e) || v(e.sources[0].metric) : (0, s.default)((0, l.getUIMetricFromAtomicMetricLike)(e)).isPositiveGood,
        g = e => {
            var t;
            if ((0, l.isComputedMetric)(e)) return !!(0, a.isPureL7SmoothingComputedMetric)(e) && g(e.sources[0].metric);
            let {
                defaultTotalSummaryTypes: i
            } = (0, s.default)((0, l.getUIMetricFromAtomicMetricLike)(e));
            return (null == i || null == (t = i[0]) ? void 0 : t.type) === n.default.Average
        };
    e.s(["UNTITLED_FORMULA_TRANSLATION_KEY", 0, p, "brandUserSuppliedText", 0, d, "getBenchmarkRequestIdentityFromMetricLike", 0, e => {
        if ("string" == typeof e) {
            if ((0, a.isPrecomputedL7Metric)(e)) {
                let t = (0, a.getBenchmarkVariantByDatasetKey)(e);
                return null == t ? null : {
                    metric: t.metric,
                    benchmarkVariantId: t.variantId
                }
            }
            return c(e) ? {
                metric: e
            } : null
        }
        if ((0, l.isComputedMetric)(e)) {
            if (!(0, a.isPureL7SmoothingComputedMetric)(e)) return null;
            let i = (0, l.getUIMetricFromAtomicMetricLike)(e.sources[0].metric);
            return (0, o.isValidEnumValue)(t.RAQIV2Metric, i) && null != (0, a.getPrecomputedL7MetricFromBase)(i) ? {
                metric: i,
                benchmarkVariantId: t.RAQIV2BenchmarkVariantId.L7Average
            } : null
        }
        let i = (0, l.getUIMetricFromAtomicMetricLike)(e);
        return c(i) ? {
            metric: i
        } : null
    }, "getDisplayUnitFromMetricLike", 0, E, "getIsAverageAggregationMetric", 0, g, "getIsPositiveGoodFromMetricLike", 0, v, "getMetricLabelFromMetricLike", 0, m, "getMetricTitleKeyFromMetricLike", 0, e => (0, l.isComputedMetric)(e) ? u(e.name) ? d(e.name) : p : (0, l.isCustomEventsAtomicMetricLike)(e) ? d(e.customEventName) : (0, s.default)((0, l.getUIMetricFromAtomicMetricLike)(e)).localizedName, "getRAQIV2BenchmarkMetricFromMetricLike", 0, e => {
        if ("string" == typeof e) return (0, a.isPrecomputedL7Metric)(e) || c(e) ? e : null;
        if ((0, l.isComputedMetric)(e)) {
            if (!(0, a.isPureL7SmoothingComputedMetric)(e)) return null;
            let t = (0, l.getUIMetricFromAtomicMetricLike)(e.sources[0].metric);
            return (0, a.getPrecomputedL7MetricFromBase)(t)
        }
        let t = (0, l.getUIMetricFromAtomicMetricLike)(e);
        return c(t) ? t : null
    }])
}, 405005, e => {
    "use strict";
    var t = e.i(80251),
        i = e.i(31611),
        n = e.i(606662);
    let r = {
            percentile: i.RAQIV2UIPseudoDimension.PercentileType,
            aggregation: i.RAQIV2UIPseudoDimension.AggregationType
        },
        o = i.RAQIV2PercentileType.AVG,
        a = e => (null == e ? void 0 : e.mode) === "fanout",
        s = e => r[e],
        l = (e, t) => {
            let n = t.replaceAll(/([a-z0-9])([A-Z])/g, "$1_$2").replaceAll(/[^A-Za-z0-9]+/g, "_").toUpperCase().replaceAll(/^_+|_+$/g, "");
            if (n === o || "AVERAGE" === n) return "AVERAGE";
            if (e === i.RAQIV2UIPseudoDimension.PercentileType) {
                let e = /^P?(\d+)$/.exec(n);
                if (e) return "P".concat(e[1])
            }
            return n
        },
        u = e => e === i.RAQIV2UIPseudoDimension.PercentileType ? t.VariantKind.Percentile : e === i.RAQIV2UIPseudoDimension.AggregationType ? t.VariantKind.Aggregation : null,
        c = (e, t) => {
            let n = [],
                r = [];
            if (null == t || t.forEach(e => {
                    let t = e === i.RAQIV2UIPseudoDimension.PercentileType ? "percentile" : e === i.RAQIV2UIPseudoDimension.AggregationType ? "aggregation" : void 0;
                    if (void 0 !== t) {
                        r.includes(t) || r.push(t);
                        return
                    }
                    n.push(e)
                }), a(e)) return {
                metricVariant: e,
                breakdown: n
            };
            let o = r[0];
            return o ? {
                metricVariant: {
                    mode: "fanout",
                    kind: o
                },
                breakdown: n
            } : {
                metricVariant: void 0,
                breakdown: n
            }
        },
        d = (e, t) => {
            let {
                metricVariant: i
            } = c(e, t);
            return a(i)
        };
    e.s(["buildVariantBreakdownSpec", 0, e => {
        let t = u(e.dimension);
        if (null == t) throw Error("Unsupported metric variant breakdown ".concat(e.dimension));
        return {
            variant: {
                kind: t,
                keys: e.config.supportedDimensionValues.map(t => l(e.dimension, t))
            }
        }
    }, "deserializeMetricVariantFanout", 0, e => {
        let t = Array.isArray(e) ? e[0] : e;
        if ("percentile" === t || "aggregation" === t) return {
            mode: "fanout",
            kind: t
        }
    }, "getFanoutOwnedDimension", 0, e => a(e) ? s(e.kind) : void 0, "getMetricFanoutDimensionInfo", 0, (e, t) => {
        let r = s(e.kind),
            o = i.RAQIV2DimensionDisplayConfig[r].pseudoDimensionConfig;
        if (o.type !== i.RAQIV2UIPseudoDimensionType.MetricFanout) return;
        let a = (0, n.getSupportedFilterDimensionOptions)(t, r);
        if (void 0 === a) return {
            dimension: r,
            config: o
        };
        let l = o.supportedDimensionValues.filter(e => (0, n.isSupportedMetricFanoutDimensionValue)(a, e)),
            u = l.includes(o.totalSeries) ? o.totalSeries : l[0];
        if (void 0 !== u) return {
            dimension: r,
            config: {
                ...o,
                supportedDimensionValues: l,
                totalSeries: u
            }
        }
    }, "getStableVariantKey", 0, l, "getVariantKind", 0, u, "hasChartBreakdown", 0, (e, t) => {
        var i;
        return (null != (i = null == e ? void 0 : e.length) ? i : 0) > 0 || d(t, e)
    }, "hasMetricVariantFanout", 0, d, "isMetricVariantFanout", 0, a, "mergeMetricVariantIntoBreakdown", 0, (e, t) => {
        if (!a(t)) return [...e];
        let i = s(t.kind);
        return e.includes(i) ? [...e] : [...e, i]
    }, "metricVariantAllowedForFilterOnlyDimensions", 0, (e, t) => {
        if (!a(e)) return;
        let n = s(e.kind);
        return n === i.RAQIV2UIPseudoDimension.AggregationType ? e : t.includes(n) ? void 0 : e
    }, "serializeMetricVariantFanout", 0, e => a(e) ? e.kind : null, "splitMetricVariantFromBreakdown", 0, c, "supportedMetricVariantForDimensions", 0, (e, t) => {
        if (a(e)) return t.includes(s(e.kind)) ? e : void 0
    }])
}, 448321, e => {
    "use strict";
    var t = e.i(80251);
    e.s(["AnalyticsQueryGatewayAPIFilterOperation", () => t.FilterOperation])
}, 619130, e => {
    "use strict";
    var t = e.i(677753);
    e.s(["default", () => t.createFetchClient])
}, 718389, e => {
    "use strict";
    e.s(["default", 0, function e(t) {
        let i = t;
        var n = ({}).toString.call(t).slice(8, -1);
        if ("Set" == n) return new Set([...t].map(t => e(t)));
        if ("Map" == n) return new Map([...t].map(t => [e(t[0]), e(t[1])]));
        if ("Date" == n) return new Date(t.getTime());
        if ("RegExp" == n) return RegExp(t.source, function(e) {
            if ("string" == typeof e.source.flags) return e.source.flags;
            var t = [];
            return e.global && t.push("g"), e.ignoreCase && t.push("i"), e.multiline && t.push("m"), e.sticky && t.push("y"), e.unicode && t.push("u"), t.join("")
        }(t));
        if ("Array" == n || "Object" == n)
            for (var r in i = Array.isArray(t) ? [] : {}, t) i[r] = e(t[r]);
        return i
    }])
}, 515210, (e, t, i) => {
    "use strict";
    var n = e.r(416340).__CLIENT_INTERNALS_DO_NOT_USE_OR_WARN_USERS_THEY_CANNOT_UPGRADE;
    i.c = function(e) {
        return n.H.useMemoCache(e)
    }
}, 999061, (e, t, i) => {
    "use strict";
    t.exports = e.r(515210)
}]);

//# debugId=5d1d0255-fc1e-e93d-db61-a263e5fd15b3
//# sourceMappingURL=3gh2y8mepkp6b.js.map
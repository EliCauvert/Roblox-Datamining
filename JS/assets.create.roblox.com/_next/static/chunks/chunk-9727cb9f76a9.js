;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "18054e2b-9d1b-9305-ab44-030ad5cd66ad")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 923319, e => {
    "use strict";
    var t, r, n = e.i(730530),
        i = ((t = {}).BoldText = "boldText", t.Text = "text", t.TextWithDisplayValue = "textWithDisplayValue", t.Number = "number", t.Timestamp = "timestamp", t.RawJSONString = "RawJSONString", t.CodeDiff = "codeDiff", t.TextWithTooltip = "textWithTooltip", t.Other = "other", t.Selection = "selection", t.Actions = "actions", t.TextWithLink = "textWithLink", t.Image = "image", t.Date = "date", t.Status = "status", t.TextWithIcon = "TextWithIcon", t.Code = "code", t),
        o = ((r = {}).ValueOpacityFill = "valueOpacityFill", r.ValuePercentageWidthFill = "valuePercentageWidthFill", r.ConstantFill = "constantFill", r);
    e.s(["CellBackgroundType", () => o, "ColumnType", () => i, "ColumnTypeToAlign", 0, {
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
    }, "resolveTableColumnTitle", 0, (e, t, r) => void 0 !== r ? (0, n.brandUntranslatableText)(r) : "string" == typeof t ? t : e(t)])
}, 447311, e => {
    "use strict";
    var t, r = ((t = {}).Positive = "Positive", t.Negative = "Negative", t.Progression = "Progression", t.Highlight = "Highlight", t);
    e.s(["TableCellBackgroundColor", () => r])
}, 36826, 61925, e => {
    "use strict";
    var t, r, n, i, o, a, s = e.i(677753),
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
        return new(r || (r = Promise))(function(i, o) {
            function a(e) {
                try {
                    u(n.next(e))
                } catch (e) {
                    o(e)
                }
            }

            function s(e) {
                try {
                    u(n.throw(e))
                } catch (e) {
                    o(e)
                }
            }

            function u(e) {
                var t;
                e.done ? i(e.value) : ((t = e.value) instanceof r ? t : new r(function(e) {
                    e(t)
                })).then(a, s)
            }
            u((n = n.apply(e, t || [])).next())
        })
    }

    function f(e, t) {
        var r, n, i, o = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            },
            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
            return this
        }), a;

        function s(s) {
            return function(u) {
                var l = [s, u];
                if (r) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, l[0] && (o = 0)), o;) try {
                    if (r = 1, n && (i = 2 & l[0] ? n.return : l[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, l[1])).done) return i;
                    switch (n = 0, i && (l = [2 & l[0], i.value]), l[0]) {
                        case 0:
                        case 1:
                            i = l;
                            break;
                        case 4:
                            return o.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            o.label++, n = l[1], l = [0];
                            continue;
                        case 7:
                            l = o.ops.pop(), o.trys.pop();
                            continue;
                        default:
                            if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                o = 0;
                                continue
                            }
                            if (3 === l[0] && (!i || l[1] > i[0] && l[1] < i[3])) {
                                o.label = l[1];
                                break
                            }
                            if (6 === l[0] && o.label < i[1]) {
                                o.label = i[1], i = l;
                                break
                            }
                            if (i && o.label < i[2]) {
                                o.label = i[2], o.ops.push(l);
                                break
                            }
                            i[2] && o.ops.pop(), o.trys.pop();
                            continue
                    }
                    l = t.call(e, o)
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

    function h(e) {
        var t, r, n, i, o, a, u, l, f, c, h, p, d, m, g, y, v, E;
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
                gamePass: (0, s.exists)(r, "gamePass") ? null == (o = r.gamePass) ? o : {
                    name: (0, s.exists)(o, "name") ? o.name : void 0,
                    imageAssetId: (0, s.exists)(o, "imageAssetId") ? o.imageAssetId : void 0,
                    priceInRobux: (0, s.exists)(o, "priceInRobux") ? o.priceInRobux : void 0,
                    isForSale: (0, s.exists)(o, "isForSale") ? o.isForSale : void 0
                } : void 0,
                placeThumbnail: (0, s.exists)(r, "placeThumbnail") ? null == (a = r.placeThumbnail) ? a : {
                    thumbnailAssetId: (0, s.exists)(a, "thumbnailAssetId") ? a.thumbnailAssetId : void 0,
                    thumbnailAssetIds: (0, s.exists)(a, "thumbnailAssetIds") ? a.thumbnailAssetIds : void 0
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
                customMatchmaking: (0, s.exists)(r, "customMatchmaking") ? null == (h = r.customMatchmaking) ? h : {
                    stateChange: (0, s.exists)(h, "stateChange") ? h.stateChange : void 0,
                    scoringConfigurationName: (0, s.exists)(h, "scoringConfigurationName") ? h.scoringConfigurationName : void 0
                } : void 0,
                engineRelease: (0, s.exists)(r, "engineRelease") ? null == (p = r.engineRelease) ? p : {
                    platform: (0, s.exists)(p, "platform") ? p.platform : void 0,
                    releaseMajorVersion: (0, s.exists)(p, "releaseMajorVersion") ? p.releaseMajorVersion : void 0
                } : void 0,
                gamePreviewVideoStateChange: (0, s.exists)(r, "gamePreviewVideoStateChange") ? null == (d = r.gamePreviewVideoStateChange) ? d : {
                    videoAssetId: (0, s.exists)(d, "videoAssetId") ? d.videoAssetId : void 0,
                    universeId: (0, s.exists)(d, "universeId") ? d.universeId : void 0,
                    gamePreviewVideoStateType: (0, s.exists)(d, "gamePreviewVideoStateType") ? d.gamePreviewVideoStateType : void 0
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
                extendedServicesEnablement: (0, s.exists)(r, "extendedServicesEnablement") ? null == (v = r.extendedServicesEnablement) ? v : {
                    service: (0, s.exists)(v, "service") ? v.service : void 0,
                    resource: (0, s.exists)(v, "resource") ? v.resource : void 0,
                    enabled: (0, s.exists)(v, "enabled") ? v.enabled : void 0,
                    enablementType: (0, s.exists)(v, "enablementType") ? v.enablementType : void 0
                } : void 0,
                creatorRegexChange: (0, s.exists)(r, "creatorRegexChange") ? null == (E = r.creatorRegexChange) ? E : {
                    regexOperation: (0, s.exists)(E, "regexOperation") ? E.regexOperation : void 0
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

            function r() {
                this.constructor = e
            }
            u(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
        }(t, e), t.prototype.v1UniversesUniverseIdAnnotationsGetRaw = function(e, t) {
            return l(this, void 0, void 0, function() {
                var r, n, i;
                return f(this, function(o) {
                    switch (o.label) {
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
                            return i = o.sent(), [2, new s.JSONApiResponse(i, function(e) {
                                return null == e ? e : {
                                    annotations: (0, s.exists)(e, "annotations") ? e.annotations.map(h) : void 0,
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
    e.s(["AnalyticsAnnotationsAPIApi", 0, p, "AnnotationType", 0, c, "CustomMatchmakingChange", 0, {
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
    var d = ((t = {}).PlaceIcon = "PlaceIcon", t.PlaceThumbnail = "PlaceThumbnail", t.PlaceVideo = "PlaceVideo", t.PlaceVersion = "PlaceVersion", t.Benchmark = "Benchmark", t.FunnelStepNameChange = "FunnelStepNameChange", t.LiveEvent = "LiveEvent", t.CustomMatchmaking = "CustomMatchmaking", t.EngineRelease = "EngineRelease", t.MemoryStoreMemoryUsageAlert = "MemoryStoreMemoryUsageAlert", t.MemoryStoreRequestsAlert = "MemoryStoreRequestsAlert", t.ClientCrashRateNotStableAlert = "ClientCrashRateNotStableAlert", t.RetentionCorhortDisclaimer = "RetentionCorhortDisclaimer", t.ConfigVersion = "ConfigVersion", t.Announcement = "Announcement", t.ExtendedServicesEnablement = "ExtendedServicesEnablement", t.ConfiguredAlertIncident = "ConfiguredAlertIncident", t.CreatorRegexChange = "CreatorRegexChange", t);
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
        v = ((i = {}).Rcc = "RCC", i.WindowsPlayer = "WindowsPlayer", i.MacPlayer = "MacPlayer", i),
        E = ((o = {}).IgnoreAdd = "REGEX_OPERATION_IGNORE_ADD", o.IgnoreRemove = "REGEX_OPERATION_IGNORE_REMOVE", o),
        A = ((a = {}).Standard = "ENABLEMENT_TYPE_STANDARD", a.Extended = "ENABLEMENT_TYPE_EXTENDED", a);
    e.s(["AnnotationBenchmarkType", () => g, "AnnotationCreatorRegexOperation", () => E, "AnnotationCustomMatchmakingChangeType", () => y, "AnnotationEnablementType", () => A, "AnnotationEngineReleasePlatform", () => v, "AnnotationType", () => d, "UIAnnotationTypeToApiAnnotation", 0, m, "isAnnotationAlertType", 0, e => "MemoryStoreMemoryUsageAlert" === e || "MemoryStoreRequestsAlert" === e || "ClientCrashRateNotStableAlert" === e], 36826)
}, 215928, 281889, e => {
    "use strict";
    var t = e.i(31611),
        r = e.i(927868),
        n = e.i(908374),
        i = e.i(606662);
    let o = e => null !== e.aggregationType || null !== e.percentile;
    e.s(["default", 0, (e, n) => {
        let o = [],
            a = null,
            s = null;
        return null == e || e.forEach(e => {
            if (e.dimension !== t.RAQIV2UIPseudoDimension.AggregationType && e.dimension !== t.RAQIV2UIPseudoDimension.PercentileType) return void o.push(e);
            let u = e.values[0];
            if (!u) return;
            let l = (0, i.getSupportedFilterDimensionOptions)(n ? [n] : [], e.dimension);
            (void 0 === l || (0, i.isSupportedMetricFanoutDimensionValue)(l, u)) && (e.dimension === t.RAQIV2UIPseudoDimension.AggregationType && (0, r.isValidEnumValue)(t.RAQIV2AggregationType, u) ? a = u : e.dimension === t.RAQIV2UIPseudoDimension.PercentileType && (0, r.isValidEnumValue)(t.RAQIV2PercentileType, u) && (s = u))
        }), {
            pseudoDimensionValues: {
                aggregationType: a,
                percentile: s
            },
            realFilters: o
        }
    }, "hasPseudoDimensionValues", 0, o], 281889);
    let a = e => {
            var n;
            return (0, r.isValidEnumValue)(t.RAQIV2BenchmarkDatasetKey, e) && (null == (n = t.RAQIV2BenchmarkDatasetKeyToVariant[e]) ? void 0 : n.variantId) === t.RAQIV2BenchmarkVariantId.L7Average
        },
        s = Object.entries(t.RAQIV2BenchmarkDatasetKeyToVariant).reduce((e, t) => {
            let [r, i] = t;
            return a(r) && (0, n.isNumericUIMetric)(i.metric) && (e[r] = i.metric), e
        }, {}),
        u = new Set(Object.keys(t.RAQIV2BenchmarkDatasetKeyToVariant).filter(a)),
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
                }, (null == t ? void 0 : t.pseudoDimensionValues) && o(t.pseudoDimensionValues) && (r.pseudoDimensionValues = t.pseudoDimensionValues), r)],
                formula: "A",
                l7Smoothing: !0
            }
        },
        c = e => 1 === e.sources.length && e.formula.trim() === e.sources[0].key,
        h = e => !!e.l7Smoothing && c(e);
    e.s(["buildL7SmoothingComputedMetric", 0, f, "getBaseMetricFromL7", 0, e => {
        var t;
        return a(e) && null != (t = s[e]) ? t : null
    }, "getBenchmarkVariantByDatasetKey", 0, e => t.RAQIV2BenchmarkDatasetKeyToVariant[e], "getMetricForL7Smoothing", 0, (e, t, r) => t ? f(e, r) : l(e, r), "getPeriodSummaryBaseMetricForL7", 0, e => {
        var n, i;
        if (!h(e)) return;
        let [a] = e.sources;
        if (!("string" != typeof a.metric || (null != (n = null == (i = a.filters) ? void 0 : i.length) ? n : 0) > 0 || a.pseudoDimensionValues && o(a.pseudoDimensionValues))) return (0, r.isValidEnumValue)(t.RAQIV2Metric, a.metric) ? a.metric : void 0
    }, "getPrecomputedL7MetricFromBase", 0, e => {
        var n, i;
        if (!(0, r.isValidEnumValue)(t.RAQIV2Metric, e)) return null;
        let o = null == (i = t.RAQIV2BenchmarkVariantsByMetric[e]) || null == (n = i[t.RAQIV2BenchmarkVariantId.L7Average]) ? void 0 : n.datasetKey;
        return o && a(o) ? o : null
    }, "isIdentityFormulaComputedMetric", 0, c, "isPrecomputedL7Metric", 0, a, "isPureL7SmoothingComputedMetric", 0, h, "precomputedL7Metrics", 0, u], 215928)
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
        o = e.i(927868),
        a = e.i(215928),
        s = e.i(908374),
        u = e.i(11517);
    let l = e => "string" == typeof e && e.trim().length > 0,
        f = e => (0, o.isValidEnumValue)(t.RAQIV2Metric, e),
        c = e => (0, r.brandUntranslatableText)(e),
        h = (e, t) => {
            if (!(0, u.isComputedMetric)(e)) {
                if ((0, u.isCustomEventsAtomicMetricLike)(e)) return c(e.customEventName);
                let {
                    localizedName: r
                } = (0, s.default)((0, u.getUIMetricFromAtomicMetricLike)(e));
                return t ? t.translate(r) : c(r.key)
            }
            return (0, a.isPureL7SmoothingComputedMetric)(e) ? h(e.sources[0].metric, t) : c(l(e.name) ? e.name : e.formula)
        },
        p = (0, r.translationKey)("Label.ExploreMode.UntitledFormula", i.TranslationNamespace.Analytics),
        d = (e, t) => {
            if ((0, u.isComputedMetric)(e)) return (0, a.isPureL7SmoothingComputedMetric)(e) ? d(e.sources[0].metric, t) : (0, r.brandUntranslatableText)("");
            let {
                localizedName: n
            } = (0, s.default)((0, u.getUIMetricFromAtomicMetricLike)(e));
            return t.translate(n)
        },
        m = e => (0, u.isComputedMetric)(e) ? !(0, a.isPureL7SmoothingComputedMetric)(e) || m(e.sources[0].metric) : (0, s.default)((0, u.getUIMetricFromAtomicMetricLike)(e)).isPositiveGood,
        g = e => {
            var t;
            if ((0, u.isComputedMetric)(e)) return !!(0, a.isPureL7SmoothingComputedMetric)(e) && g(e.sources[0].metric);
            let {
                defaultTotalSummaryTypes: r
            } = (0, s.default)((0, u.getUIMetricFromAtomicMetricLike)(e));
            return (null == r || null == (t = r[0]) ? void 0 : t.type) === n.default.Average
        };
    e.s(["UNTITLED_FORMULA_TRANSLATION_KEY", 0, p, "brandUserSuppliedText", 0, c, "getBenchmarkRequestIdentityFromMetricLike", 0, e => {
        if ("string" == typeof e) {
            if ((0, a.isPrecomputedL7Metric)(e)) {
                let t = (0, a.getBenchmarkVariantByDatasetKey)(e);
                return null == t ? null : {
                    metric: t.metric,
                    benchmarkVariantId: t.variantId
                }
            }
            return f(e) ? {
                metric: e
            } : null
        }
        if ((0, u.isComputedMetric)(e)) {
            if (!(0, a.isPureL7SmoothingComputedMetric)(e)) return null;
            let r = (0, u.getUIMetricFromAtomicMetricLike)(e.sources[0].metric);
            return (0, o.isValidEnumValue)(t.RAQIV2Metric, r) && null != (0, a.getPrecomputedL7MetricFromBase)(r) ? {
                metric: r,
                benchmarkVariantId: t.RAQIV2BenchmarkVariantId.L7Average
            } : null
        }
        let r = (0, u.getUIMetricFromAtomicMetricLike)(e);
        return f(r) ? {
            metric: r
        } : null
    }, "getDisplayUnitFromMetricLike", 0, d, "getIsAverageAggregationMetric", 0, g, "getIsPositiveGoodFromMetricLike", 0, m, "getMetricLabelFromMetricLike", 0, h, "getMetricTitleKeyFromMetricLike", 0, e => (0, u.isComputedMetric)(e) ? l(e.name) ? c(e.name) : p : (0, u.isCustomEventsAtomicMetricLike)(e) ? c(e.customEventName) : (0, s.default)((0, u.getUIMetricFromAtomicMetricLike)(e)).localizedName, "getRAQIV2BenchmarkMetricFromMetricLike", 0, e => {
        if ("string" == typeof e) return (0, a.isPrecomputedL7Metric)(e) || f(e) ? e : null;
        if ((0, u.isComputedMetric)(e)) {
            if (!(0, a.isPureL7SmoothingComputedMetric)(e)) return null;
            let t = (0, u.getUIMetricFromAtomicMetricLike)(e.sources[0].metric);
            return (0, a.getPrecomputedL7MetricFromBase)(t)
        }
        let t = (0, u.getUIMetricFromAtomicMetricLike)(e);
        return f(t) ? t : null
    }])
}, 405005, e => {
    "use strict";
    var t = e.i(80251),
        r = e.i(31611),
        n = e.i(606662);
    let i = {
            percentile: r.RAQIV2UIPseudoDimension.PercentileType,
            aggregation: r.RAQIV2UIPseudoDimension.AggregationType
        },
        o = r.RAQIV2PercentileType.AVG,
        a = e => (null == e ? void 0 : e.mode) === "fanout",
        s = e => i[e],
        u = (e, t) => {
            let n = t.replaceAll(/([a-z0-9])([A-Z])/g, "$1_$2").replaceAll(/[^A-Za-z0-9]+/g, "_").toUpperCase().replaceAll(/^_+|_+$/g, "");
            if (n === o || "AVERAGE" === n) return "AVERAGE";
            if (e === r.RAQIV2UIPseudoDimension.PercentileType) {
                let e = /^P?(\d+)$/.exec(n);
                if (e) return "P".concat(e[1])
            }
            return n
        },
        l = e => e === r.RAQIV2UIPseudoDimension.PercentileType ? t.VariantKind.Percentile : e === r.RAQIV2UIPseudoDimension.AggregationType ? t.VariantKind.Aggregation : null,
        f = (e, t) => {
            let n = [],
                i = [];
            if (null == t || t.forEach(e => {
                    let t = e === r.RAQIV2UIPseudoDimension.PercentileType ? "percentile" : e === r.RAQIV2UIPseudoDimension.AggregationType ? "aggregation" : void 0;
                    if (void 0 !== t) {
                        i.includes(t) || i.push(t);
                        return
                    }
                    n.push(e)
                }), a(e)) return {
                metricVariant: e,
                breakdown: n
            };
            let o = i[0];
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
        c = (e, t) => {
            let {
                metricVariant: r
            } = f(e, t);
            return a(r)
        };
    e.s(["buildVariantBreakdownSpec", 0, e => {
        let t = l(e.dimension);
        if (null == t) throw Error("Unsupported metric variant breakdown ".concat(e.dimension));
        return {
            variant: {
                kind: t,
                keys: e.config.supportedDimensionValues.map(t => u(e.dimension, t))
            }
        }
    }, "deserializeMetricVariantFanout", 0, e => {
        let t = Array.isArray(e) ? e[0] : e;
        if ("percentile" === t || "aggregation" === t) return {
            mode: "fanout",
            kind: t
        }
    }, "getFanoutOwnedDimension", 0, e => a(e) ? s(e.kind) : void 0, "getMetricFanoutDimensionInfo", 0, (e, t) => {
        let i = s(e.kind),
            o = r.RAQIV2DimensionDisplayConfig[i].pseudoDimensionConfig;
        if (o.type !== r.RAQIV2UIPseudoDimensionType.MetricFanout) return;
        let a = (0, n.getSupportedFilterDimensionOptions)(t, i);
        if (void 0 === a) return {
            dimension: i,
            config: o
        };
        let u = o.supportedDimensionValues.filter(e => (0, n.isSupportedMetricFanoutDimensionValue)(a, e)),
            l = u.includes(o.totalSeries) ? o.totalSeries : u[0];
        if (void 0 !== l) return {
            dimension: i,
            config: {
                ...o,
                supportedDimensionValues: u,
                totalSeries: l
            }
        }
    }, "getStableVariantKey", 0, u, "getVariantKind", 0, l, "hasChartBreakdown", 0, (e, t) => {
        var r;
        return (null != (r = null == e ? void 0 : e.length) ? r : 0) > 0 || c(t, e)
    }, "hasMetricVariantFanout", 0, c, "isMetricVariantFanout", 0, a, "mergeMetricVariantIntoBreakdown", 0, (e, t) => {
        if (!a(t)) return [...e];
        let r = s(t.kind);
        return e.includes(r) ? [...e] : [...e, r]
    }, "metricVariantAllowedForFilterOnlyDimensions", 0, (e, t) => {
        if (!a(e)) return;
        let n = s(e.kind);
        return n === r.RAQIV2UIPseudoDimension.AggregationType ? e : t.includes(n) ? void 0 : e
    }, "serializeMetricVariantFanout", 0, e => a(e) ? e.kind : null, "splitMetricVariantFromBreakdown", 0, f, "supportedMetricVariantForDimensions", 0, (e, t) => {
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
        let r = t;
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
            for (var i in r = Array.isArray(t) ? [] : {}, t) r[i] = e(t[i]);
        return r
    }])
}, 836047, (e, t, r) => {
    var n = {
            872: function(e, t) {
                "use strict";
                t.byteLength = function(e) {
                    var t = u(e),
                        r = t[0],
                        n = t[1];
                    return (r + n) * 3 / 4 - n
                }, t.toByteArray = function(e) {
                    var t, r, o = u(e),
                        a = o[0],
                        s = o[1],
                        l = new i((a + s) * 3 / 4 - s),
                        f = 0,
                        c = s > 0 ? a - 4 : a;
                    for (r = 0; r < c; r += 4) t = n[e.charCodeAt(r)] << 18 | n[e.charCodeAt(r + 1)] << 12 | n[e.charCodeAt(r + 2)] << 6 | n[e.charCodeAt(r + 3)], l[f++] = t >> 16 & 255, l[f++] = t >> 8 & 255, l[f++] = 255 & t;
                    return 2 === s && (t = n[e.charCodeAt(r)] << 2 | n[e.charCodeAt(r + 1)] >> 4, l[f++] = 255 & t), 1 === s && (t = n[e.charCodeAt(r)] << 10 | n[e.charCodeAt(r + 1)] << 4 | n[e.charCodeAt(r + 2)] >> 2, l[f++] = t >> 8 & 255, l[f++] = 255 & t), l
                }, t.fromByteArray = function(e) {
                    for (var t, n = e.length, i = n % 3, o = [], a = 0, s = n - i; a < s; a += 16383) o.push(function(e, t, n) {
                        for (var i, o = [], a = t; a < n; a += 3) i = (e[a] << 16 & 0xff0000) + (e[a + 1] << 8 & 65280) + (255 & e[a + 2]), o.push(r[i >> 18 & 63] + r[i >> 12 & 63] + r[i >> 6 & 63] + r[63 & i]);
                        return o.join("")
                    }(e, a, a + 16383 > s ? s : a + 16383));
                    return 1 === i ? o.push(r[(t = e[n - 1]) >> 2] + r[t << 4 & 63] + "==") : 2 === i && o.push(r[(t = (e[n - 2] << 8) + e[n - 1]) >> 10] + r[t >> 4 & 63] + r[t << 2 & 63] + "="), o.join("")
                };
                for (var r = [], n = [], i = "u" > typeof Uint8Array ? Uint8Array : Array, o = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", a = 0, s = o.length; a < s; ++a) r[a] = o[a], n[o.charCodeAt(a)] = a;

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
                    o = "function" == typeof Symbol && "function" == typeof Symbol.for ? Symbol.for("nodejs.util.inspect.custom") : null;

                function a(e) {
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
                        var o = 0 | p(n, i),
                            u = a(o),
                            l = u.write(n, i);
                        return l !== o && (u = u.slice(0, l)), u
                    }
                    if (ArrayBuffer.isView(e)) return c(e);
                    if (null == e) throw TypeError("The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type " + typeof e);
                    if (N(e, ArrayBuffer) || e && N(e.buffer, ArrayBuffer) || "u" > typeof SharedArrayBuffer && (N(e, SharedArrayBuffer) || e && N(e.buffer, SharedArrayBuffer))) return function(e, t, r) {
                        var n;
                        if (t < 0 || e.byteLength < t) throw RangeError('"offset" is outside of buffer bounds');
                        if (e.byteLength < t + (r || 0)) throw RangeError('"length" is outside of buffer bounds');
                        return Object.setPrototypeOf(n = void 0 === t && void 0 === r ? new Uint8Array(e) : void 0 === r ? new Uint8Array(e, t) : new Uint8Array(e, t, r), s.prototype), n
                    }(e, t, r);
                    if ("number" == typeof e) throw TypeError('The "value" argument must not be of type number. Received type number');
                    var f = e.valueOf && e.valueOf();
                    if (null != f && f !== e) return s.from(f, t, r);
                    var d = function(e) {
                        if (s.isBuffer(e)) {
                            var t = 0 | h(e.length),
                                r = a(t);
                            return 0 === r.length || e.copy(r, 0, 0, t), r
                        }
                        return void 0 !== e.length ? "number" != typeof e.length || function(e) {
                            return e != e
                        }(e.length) ? a(0) : c(e) : "Buffer" === e.type && Array.isArray(e.data) ? c(e.data) : void 0
                    }(e);
                    if (d) return d;
                    if ("u" > typeof Symbol && null != Symbol.toPrimitive && "function" == typeof e[Symbol.toPrimitive]) return s.from(e[Symbol.toPrimitive]("string"), t, r);
                    throw TypeError("The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type " + typeof e)
                }

                function l(e) {
                    if ("number" != typeof e) throw TypeError('"size" argument must be of type number');
                    if (e < 0) throw RangeError('The value "' + e + '" is invalid for option "size"')
                }

                function f(e) {
                    return l(e), a(e < 0 ? 0 : 0 | h(e))
                }

                function c(e) {
                    for (var t = e.length < 0 ? 0 : 0 | h(e.length), r = a(t), n = 0; n < t; n += 1) r[n] = 255 & e[n];
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
                    return (l(e), e <= 0) ? a(e) : void 0 !== t ? "string" == typeof r ? a(e).fill(t, r) : a(e).fill(t) : a(e)
                }, s.allocUnsafe = function(e) {
                    return f(e)
                }, s.allocUnsafeSlow = function(e) {
                    return f(e)
                };

                function h(e) {
                    if (e >= 0x7fffffff) throw RangeError("Attempt to allocate Buffer larger than maximum size: 0x7fffffff bytes");
                    return 0 | e
                }

                function p(e, t) {
                    if (s.isBuffer(e)) return e.length;
                    if (ArrayBuffer.isView(e) || N(e, ArrayBuffer)) return e.byteLength;
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

                function d(e, t, r) {
                    var i, o, a, s = !1;
                    if ((void 0 === t || t < 0) && (t = 0), t > this.length || ((void 0 === r || r > this.length) && (r = this.length), r <= 0 || (r >>>= 0) <= (t >>>= 0))) return "";
                    for (e || (e = "utf8");;) switch (e) {
                        case "hex":
                            return function(e, t, r) {
                                var n = e.length;
                                (!t || t < 0) && (t = 0), (!r || r < 0 || r > n) && (r = n);
                                for (var i = "", o = t; o < r; ++o) i += S[e[o]];
                                return i
                            }(this, t, r);
                        case "utf8":
                        case "utf-8":
                            return v(this, t, r);
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
                            return i = this, o = t, a = r, 0 === o && a === i.length ? n.fromByteArray(i) : n.fromByteArray(i.slice(o, a));
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return function(e, t, r) {
                                for (var n = e.slice(t, r), i = "", o = 0; o < n.length; o += 2) i += String.fromCharCode(n[o] + 256 * n[o + 1]);
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
                    var o;
                    if (0 === e.length) return -1;
                    if ("string" == typeof r ? (n = r, r = 0) : r > 0x7fffffff ? r = 0x7fffffff : r < -0x80000000 && (r = -0x80000000), (o = r *= 1) != o && (r = i ? 0 : e.length - 1), r < 0 && (r = e.length + r), r >= e.length)
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
                    var o, a = 1,
                        s = e.length,
                        u = t.length;
                    if (void 0 !== n && ("ucs2" === (n = String(n).toLowerCase()) || "ucs-2" === n || "utf16le" === n || "utf-16le" === n)) {
                        if (e.length < 2 || t.length < 2) return -1;
                        a = 2, s /= 2, u /= 2, r /= 2
                    }

                    function l(e, t) {
                        return 1 === a ? e[t] : e.readUInt16BE(t * a)
                    }
                    if (i) {
                        var f = -1;
                        for (o = r; o < s; o++)
                            if (l(e, o) === l(t, -1 === f ? 0 : o - f)) {
                                if (-1 === f && (f = o), o - f + 1 === u) return f * a
                            } else - 1 !== f && (o -= o - f), f = -1
                    } else
                        for (r + u > s && (r = s - u), o = r; o >= 0; o--) {
                            for (var c = !0, h = 0; h < u; h++)
                                if (l(e, o + h) !== l(t, h)) {
                                    c = !1;
                                    break
                                } if (c) return o
                        }
                    return -1
                }
                s.isBuffer = function(e) {
                    return null != e && !0 === e._isBuffer && e !== s.prototype
                }, s.compare = function(e, t) {
                    if (N(e, Uint8Array) && (e = s.from(e, e.offset, e.byteLength)), N(t, Uint8Array) && (t = s.from(t, t.offset, t.byteLength)), !s.isBuffer(e) || !s.isBuffer(t)) throw TypeError('The "buf1", "buf2" arguments must be one of type Buffer or Uint8Array');
                    if (e === t) return 0;
                    for (var r = e.length, n = t.length, i = 0, o = Math.min(r, n); i < o; ++i)
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
                        var o = e[r];
                        if (N(o, Uint8Array) && (o = s.from(o)), !s.isBuffer(o)) throw TypeError('"list" argument must be an Array of Buffers');
                        o.copy(n, i), i += o.length
                    }
                    return n
                }, s.byteLength = p, s.prototype._isBuffer = !0, s.prototype.swap16 = function() {
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
                    return 0 === e ? "" : 0 == arguments.length ? v(this, 0, e) : d.apply(this, arguments)
                }, s.prototype.toLocaleString = s.prototype.toString, s.prototype.equals = function(e) {
                    if (!s.isBuffer(e)) throw TypeError("Argument must be a Buffer");
                    return this === e || 0 === s.compare(this, e)
                }, s.prototype.inspect = function() {
                    var e = "",
                        r = t.INSPECT_MAX_BYTES;
                    return e = this.toString("hex", 0, r).replace(/(.{2})/g, "$1 ").trim(), this.length > r && (e += " ... "), "<Buffer " + e + ">"
                }, o && (s.prototype[o] = s.prototype.inspect), s.prototype.compare = function(e, t, r, n, i) {
                    if (N(e, Uint8Array) && (e = s.from(e, e.offset, e.byteLength)), !s.isBuffer(e)) throw TypeError('The "target" argument must be one of type Buffer or Uint8Array. Received type ' + typeof e);
                    if (void 0 === t && (t = 0), void 0 === r && (r = e ? e.length : 0), void 0 === n && (n = 0), void 0 === i && (i = this.length), t < 0 || r > e.length || n < 0 || i > this.length) throw RangeError("out of range index");
                    if (n >= i && t >= r) return 0;
                    if (n >= i) return -1;
                    if (t >= r) return 1;
                    if (t >>>= 0, r >>>= 0, n >>>= 0, i >>>= 0, this === e) return 0;
                    for (var o = i - n, a = r - t, u = Math.min(o, a), l = this.slice(n, i), f = e.slice(t, r), c = 0; c < u; ++c)
                        if (l[c] !== f[c]) {
                            o = l[c], a = f[c];
                            break
                        } return o < a ? -1 : +(a < o)
                }, s.prototype.includes = function(e, t, r) {
                    return -1 !== this.indexOf(e, t, r)
                }, s.prototype.indexOf = function(e, t, r) {
                    return g(this, e, t, r, !0)
                }, s.prototype.lastIndexOf = function(e, t, r) {
                    return g(this, e, t, r, !1)
                };

                function v(e, t, r) {
                    r = Math.min(e.length, r);
                    for (var n = [], i = t; i < r;) {
                        var o, a, s, u, l = e[i],
                            f = null,
                            c = l > 239 ? 4 : l > 223 ? 3 : l > 191 ? 2 : 1;
                        if (i + c <= r) switch (c) {
                            case 1:
                                l < 128 && (f = l);
                                break;
                            case 2:
                                (192 & (o = e[i + 1])) == 128 && (u = (31 & l) << 6 | 63 & o) > 127 && (f = u);
                                break;
                            case 3:
                                o = e[i + 1], a = e[i + 2], (192 & o) == 128 && (192 & a) == 128 && (u = (15 & l) << 12 | (63 & o) << 6 | 63 & a) > 2047 && (u < 55296 || u > 57343) && (f = u);
                                break;
                            case 4:
                                o = e[i + 1], a = e[i + 2], s = e[i + 3], (192 & o) == 128 && (192 & a) == 128 && (192 & s) == 128 && (u = (15 & l) << 18 | (63 & o) << 12 | (63 & a) << 6 | 63 & s) > 65535 && u < 1114112 && (f = u)
                        }
                        null === f ? (f = 65533, c = 1) : f > 65535 && (f -= 65536, n.push(f >>> 10 & 1023 | 55296), f = 56320 | 1023 & f), n.push(f), i += c
                    }
                    var h = n,
                        p = h.length;
                    if (p <= 4096) return String.fromCharCode.apply(String, h);
                    for (var d = "", m = 0; m < p;) d += String.fromCharCode.apply(String, h.slice(m, m += 4096));
                    return d
                }

                function E(e, t, r) {
                    if (e % 1 != 0 || e < 0) throw RangeError("offset is not uint");
                    if (e + t > r) throw RangeError("Trying to access beyond buffer length")
                }

                function A(e, t, r, n, i, o) {
                    if (!s.isBuffer(e)) throw TypeError('"buffer" argument must be a Buffer instance');
                    if (t > i || t < o) throw RangeError('"value" argument is out of bounds');
                    if (r + n > e.length) throw RangeError("Index out of range")
                }

                function I(e, t, r, n, i, o) {
                    if (r + n > e.length || r < 0) throw RangeError("Index out of range")
                }

                function T(e, t, r, n, o) {
                    return t *= 1, r >>>= 0, o || I(e, t, r, 4, 34028234663852886e22, -34028234663852886e22), i.write(e, t, r, n, 23, 4), r + 4
                }

                function b(e, t, r, n, o) {
                    return t *= 1, r >>>= 0, o || I(e, t, r, 8, 17976931348623157e292, -17976931348623157e292), i.write(e, t, r, n, 52, 8), r + 8
                }
                s.prototype.write = function(e, t, r, n) {
                    if (void 0 === t) n = "utf8", r = this.length, t = 0;
                    else if (void 0 === r && "string" == typeof t) n = t, r = this.length, t = 0;
                    else if (isFinite(t)) t >>>= 0, isFinite(r) ? (r >>>= 0, void 0 === n && (n = "utf8")) : (n = r, r = void 0);
                    else throw Error("Buffer.write(string, encoding, offset[, length]) is no longer supported");
                    var i, o, a, s, u, l, f, c, h = this.length - t;
                    if ((void 0 === r || r > h) && (r = h), e.length > 0 && (r < 0 || t < 0) || t > this.length) throw RangeError("Attempt to write outside buffer bounds");
                    n || (n = "utf8");
                    for (var p = !1;;) switch (n) {
                        case "hex":
                            return function(e, t, r, n) {
                                r = Number(r) || 0;
                                var i = e.length - r;
                                n ? (n = Number(n)) > i && (n = i) : n = i;
                                var o = t.length;
                                n > o / 2 && (n = o / 2);
                                for (var a = 0; a < n; ++a) {
                                    var s, u = parseInt(t.substr(2 * a, 2), 16);
                                    if ((s = u) != s) break;
                                    e[r + a] = u
                                }
                                return a
                            }(this, e, t, r);
                        case "utf8":
                        case "utf-8":
                            return i = t, o = r, P(R(e, this.length - i), this, i, o);
                        case "ascii":
                            return a = t, s = r, P(x(e), this, a, s);
                        case "latin1":
                        case "binary":
                            return function(e, t, r, n) {
                                return P(x(t), e, r, n)
                            }(this, e, t, r);
                        case "base64":
                            return u = t, l = r, P(_(e), this, u, l);
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return f = t, c = r, P(function(e, t) {
                                for (var r, n, i = [], o = 0; o < e.length && !((t -= 2) < 0); ++o) n = (r = e.charCodeAt(o)) >> 8, i.push(r % 256), i.push(n);
                                return i
                            }(e, this.length - f), this, f, c);
                        default:
                            if (p) throw TypeError("Unknown encoding: " + n);
                            n = ("" + n).toLowerCase(), p = !0
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
                    e >>>= 0, t >>>= 0, r || E(e, t, this.length);
                    for (var n = this[e], i = 1, o = 0; ++o < t && (i *= 256);) n += this[e + o] * i;
                    return n
                }, s.prototype.readUIntBE = function(e, t, r) {
                    e >>>= 0, t >>>= 0, r || E(e, t, this.length);
                    for (var n = this[e + --t], i = 1; t > 0 && (i *= 256);) n += this[e + --t] * i;
                    return n
                }, s.prototype.readUInt8 = function(e, t) {
                    return e >>>= 0, t || E(e, 1, this.length), this[e]
                }, s.prototype.readUInt16LE = function(e, t) {
                    return e >>>= 0, t || E(e, 2, this.length), this[e] | this[e + 1] << 8
                }, s.prototype.readUInt16BE = function(e, t) {
                    return e >>>= 0, t || E(e, 2, this.length), this[e] << 8 | this[e + 1]
                }, s.prototype.readUInt32LE = function(e, t) {
                    return e >>>= 0, t || E(e, 4, this.length), (this[e] | this[e + 1] << 8 | this[e + 2] << 16) + 0x1000000 * this[e + 3]
                }, s.prototype.readUInt32BE = function(e, t) {
                    return e >>>= 0, t || E(e, 4, this.length), 0x1000000 * this[e] + (this[e + 1] << 16 | this[e + 2] << 8 | this[e + 3])
                }, s.prototype.readIntLE = function(e, t, r) {
                    e >>>= 0, t >>>= 0, r || E(e, t, this.length);
                    for (var n = this[e], i = 1, o = 0; ++o < t && (i *= 256);) n += this[e + o] * i;
                    return n >= (i *= 128) && (n -= Math.pow(2, 8 * t)), n
                }, s.prototype.readIntBE = function(e, t, r) {
                    e >>>= 0, t >>>= 0, r || E(e, t, this.length);
                    for (var n = t, i = 1, o = this[e + --n]; n > 0 && (i *= 256);) o += this[e + --n] * i;
                    return o >= (i *= 128) && (o -= Math.pow(2, 8 * t)), o
                }, s.prototype.readInt8 = function(e, t) {
                    return (e >>>= 0, t || E(e, 1, this.length), 128 & this[e]) ? -((255 - this[e] + 1) * 1) : this[e]
                }, s.prototype.readInt16LE = function(e, t) {
                    e >>>= 0, t || E(e, 2, this.length);
                    var r = this[e] | this[e + 1] << 8;
                    return 32768 & r ? 0xffff0000 | r : r
                }, s.prototype.readInt16BE = function(e, t) {
                    e >>>= 0, t || E(e, 2, this.length);
                    var r = this[e + 1] | this[e] << 8;
                    return 32768 & r ? 0xffff0000 | r : r
                }, s.prototype.readInt32LE = function(e, t) {
                    return e >>>= 0, t || E(e, 4, this.length), this[e] | this[e + 1] << 8 | this[e + 2] << 16 | this[e + 3] << 24
                }, s.prototype.readInt32BE = function(e, t) {
                    return e >>>= 0, t || E(e, 4, this.length), this[e] << 24 | this[e + 1] << 16 | this[e + 2] << 8 | this[e + 3]
                }, s.prototype.readFloatLE = function(e, t) {
                    return e >>>= 0, t || E(e, 4, this.length), i.read(this, e, !0, 23, 4)
                }, s.prototype.readFloatBE = function(e, t) {
                    return e >>>= 0, t || E(e, 4, this.length), i.read(this, e, !1, 23, 4)
                }, s.prototype.readDoubleLE = function(e, t) {
                    return e >>>= 0, t || E(e, 8, this.length), i.read(this, e, !0, 52, 8)
                }, s.prototype.readDoubleBE = function(e, t) {
                    return e >>>= 0, t || E(e, 8, this.length), i.read(this, e, !1, 52, 8)
                }, s.prototype.writeUIntLE = function(e, t, r, n) {
                    if (e *= 1, t >>>= 0, r >>>= 0, !n) {
                        var i = Math.pow(2, 8 * r) - 1;
                        A(this, e, t, r, i, 0)
                    }
                    var o = 1,
                        a = 0;
                    for (this[t] = 255 & e; ++a < r && (o *= 256);) this[t + a] = e / o & 255;
                    return t + r
                }, s.prototype.writeUIntBE = function(e, t, r, n) {
                    if (e *= 1, t >>>= 0, r >>>= 0, !n) {
                        var i = Math.pow(2, 8 * r) - 1;
                        A(this, e, t, r, i, 0)
                    }
                    var o = r - 1,
                        a = 1;
                    for (this[t + o] = 255 & e; --o >= 0 && (a *= 256);) this[t + o] = e / a & 255;
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
                    var o = 0,
                        a = 1,
                        s = 0;
                    for (this[t] = 255 & e; ++o < r && (a *= 256);) e < 0 && 0 === s && 0 !== this[t + o - 1] && (s = 1), this[t + o] = (e / a | 0) - s & 255;
                    return t + r
                }, s.prototype.writeIntBE = function(e, t, r, n) {
                    if (e *= 1, t >>>= 0, !n) {
                        var i = Math.pow(2, 8 * r - 1);
                        A(this, e, t, r, i - 1, -i)
                    }
                    var o = r - 1,
                        a = 1,
                        s = 0;
                    for (this[t + o] = 255 & e; --o >= 0 && (a *= 256);) e < 0 && 0 === s && 0 !== this[t + o + 1] && (s = 1), this[t + o] = (e / a | 0) - s & 255;
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
                    return T(this, e, t, !0, r)
                }, s.prototype.writeFloatBE = function(e, t, r) {
                    return T(this, e, t, !1, r)
                }, s.prototype.writeDoubleLE = function(e, t, r) {
                    return b(this, e, t, !0, r)
                }, s.prototype.writeDoubleBE = function(e, t, r) {
                    return b(this, e, t, !1, r)
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
                        for (var o = i - 1; o >= 0; --o) e[o + t] = this[o + r];
                    else Uint8Array.prototype.set.call(e, this.subarray(r, n), t);
                    return i
                }, s.prototype.fill = function(e, t, r, n) {
                    if ("string" == typeof e) {
                        if ("string" == typeof t ? (n = t, t = 0, r = this.length) : "string" == typeof r && (n = r, r = this.length), void 0 !== n && "string" != typeof n) throw TypeError("encoding must be a string");
                        if ("string" == typeof n && !s.isEncoding(n)) throw TypeError("Unknown encoding: " + n);
                        if (1 === e.length) {
                            var i, o = e.charCodeAt(0);
                            ("utf8" === n && o < 128 || "latin1" === n) && (e = o)
                        }
                    } else "number" == typeof e ? e &= 255 : "boolean" == typeof e && (e = Number(e));
                    if (t < 0 || this.length < t || this.length < r) throw RangeError("Out of range index");
                    if (r <= t) return this;
                    if (t >>>= 0, r = void 0 === r ? this.length : r >>> 0, e || (e = 0), "number" == typeof e)
                        for (i = t; i < r; ++i) this[i] = e;
                    else {
                        var a = s.isBuffer(e) ? e : s.from(e, n),
                            u = a.length;
                        if (0 === u) throw TypeError('The value "' + e + '" is invalid for argument "value"');
                        for (i = 0; i < r - t; ++i) this[i + t] = a[i % u]
                    }
                    return this
                };
                var M = /[^+/0-9A-Za-z-_]/g;

                function R(e, t) {
                    t = t || 1 / 0;
                    for (var r, n = e.length, i = null, o = [], a = 0; a < n; ++a) {
                        if ((r = e.charCodeAt(a)) > 55295 && r < 57344) {
                            if (!i) {
                                if (r > 56319 || a + 1 === n) {
                                    (t -= 3) > -1 && o.push(239, 191, 189);
                                    continue
                                }
                                i = r;
                                continue
                            }
                            if (r < 56320) {
                                (t -= 3) > -1 && o.push(239, 191, 189), i = r;
                                continue
                            }
                            r = (i - 55296 << 10 | r - 56320) + 65536
                        } else i && (t -= 3) > -1 && o.push(239, 191, 189);
                        if (i = null, r < 128) {
                            if ((t -= 1) < 0) break;
                            o.push(r)
                        } else if (r < 2048) {
                            if ((t -= 2) < 0) break;
                            o.push(r >> 6 | 192, 63 & r | 128)
                        } else if (r < 65536) {
                            if ((t -= 3) < 0) break;
                            o.push(r >> 12 | 224, r >> 6 & 63 | 128, 63 & r | 128)
                        } else if (r < 1114112) {
                            if ((t -= 4) < 0) break;
                            o.push(r >> 18 | 240, r >> 12 & 63 | 128, r >> 6 & 63 | 128, 63 & r | 128)
                        } else throw Error("Invalid code point")
                    }
                    return o
                }

                function x(e) {
                    for (var t = [], r = 0; r < e.length; ++r) t.push(255 & e.charCodeAt(r));
                    return t
                }

                function _(e) {
                    return n.toByteArray(function(e) {
                        if ((e = (e = e.split("=")[0]).trim().replace(M, "")).length < 2) return "";
                        for (; e.length % 4 != 0;) e += "=";
                        return e
                    }(e))
                }

                function P(e, t, r, n) {
                    for (var i = 0; i < n && !(i + r >= t.length) && !(i >= e.length); ++i) t[i + r] = e[i];
                    return i
                }

                function N(e, t) {
                    return e instanceof t || null != e && null != e.constructor && null != e.constructor.name && e.constructor.name === t.name
                }
                var S = function() {
                    for (var e = "0123456789abcdef", t = Array(256), r = 0; r < 16; ++r)
                        for (var n = 16 * r, i = 0; i < 16; ++i) t[n + i] = e[r] + e[i];
                    return t
                }()
            },
            321: function(e, t) {
                t.read = function(e, t, r, n, i) {
                    var o, a, s = 8 * i - n - 1,
                        u = (1 << s) - 1,
                        l = u >> 1,
                        f = -7,
                        c = r ? i - 1 : 0,
                        h = r ? -1 : 1,
                        p = e[t + c];
                    for (c += h, o = p & (1 << -f) - 1, p >>= -f, f += s; f > 0; o = 256 * o + e[t + c], c += h, f -= 8);
                    for (a = o & (1 << -f) - 1, o >>= -f, f += n; f > 0; a = 256 * a + e[t + c], c += h, f -= 8);
                    if (0 === o) o = 1 - l;
                    else {
                        if (o === u) return a ? NaN : 1 / 0 * (p ? -1 : 1);
                        a += Math.pow(2, n), o -= l
                    }
                    return (p ? -1 : 1) * a * Math.pow(2, o - n)
                }, t.write = function(e, t, r, n, i, o) {
                    var a, s, u, l = 8 * o - i - 1,
                        f = (1 << l) - 1,
                        c = f >> 1,
                        h = 5960464477539062e-23 * (23 === i),
                        p = n ? 0 : o - 1,
                        d = n ? 1 : -1,
                        m = +(t < 0 || 0 === t && 1 / t < 0);
                    for (isNaN(t = Math.abs(t)) || t === 1 / 0 ? (s = +!!isNaN(t), a = f) : (a = Math.floor(Math.log(t) / Math.LN2), t * (u = Math.pow(2, -a)) < 1 && (a--, u *= 2), a + c >= 1 ? t += h / u : t += h * Math.pow(2, 1 - c), t * u >= 2 && (a++, u /= 2), a + c >= f ? (s = 0, a = f) : a + c >= 1 ? (s = (t * u - 1) * Math.pow(2, i), a += c) : (s = t * Math.pow(2, c - 1) * Math.pow(2, i), a = 0)); i >= 8; e[r + p] = 255 & s, p += d, s /= 256, i -= 8);
                    for (a = a << i | s, l += i; l > 0; e[r + p] = 255 & a, p += d, a /= 256, l -= 8);
                    e[r + p - d] |= 128 * m
                }
            }
        },
        i = {};

    function o(e) {
        var t = i[e];
        if (void 0 !== t) return t.exports;
        var r = i[e] = {
                exports: {}
            },
            a = !0;
        try {
            n[e](r, r.exports, o), a = !1
        } finally {
            a && delete i[e]
        }
        return r.exports
    }
    o.ab = "/ROOT/node_modules/.pnpm/next@16.3.0_@babel+core@7.29.0_supports-color@8.1.1__@opentelemetry+api@1.9.1_@playwrig_2bf1aa2500abc393a8e8c0b283d26d6e/node_modules/next/dist/compiled/buffer/", t.exports = o(230)
}]);

//# debugId=18054e2b-9d1b-9305-ab44-030ad5cd66ad
//# sourceMappingURL=30oabns7t3jjx.js.map
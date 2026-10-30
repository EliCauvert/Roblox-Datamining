;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "b23396a2-752b-b6b1-3a69-0b0966f1c2a9")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 401263, 884213, e => {
    "use strict";
    var t = e.i(416340);
    let n = /{(.+?)}/g,
        i = (e, t) => void 0 === t || 0 === Object.keys(t).length ? e : e.replace(n, (e, n) => {
            var i;
            return null != (i = t[n]) ? i : "{".concat(n, "}")
        });
    e.s(["default", 0, i], 884213);
    let r = /{(.+?)}/,
        o = /({.+?})/g,
        a = /^[a-zA-Z0-9-]+\.(?:capture-loopback\.)?chromatic\.com$/,
        s = /(?:^|\.)robloxlabs\.com$/,
        l = () => {
            let e, t = a.test(window.location.hostname),
                n = window.location.hostname.includes("localhost"),
                i = "string" == typeof(e = window.location.hostname) && s.test(e);
            return {
                isSSR: !1,
                isAllowed: t || n || i,
                isDangerous: t || i,
                preferLoadedTranslations: i
            }
        },
        u = (e, t) => t.isDangerous ? "[!!".concat(e, "!!]") : e;
    var c = e.i(730530);
    e.s(["default", 0, e => {
        let {
            ready: n,
            translate: a,
            translateHTML: s,
            translateWithNamespace: d,
            translateWithNamespaceHTML: m
        } = e, p = (0, t.useMemo)(() => ({
            ready: n,
            translate: a,
            translateHTML: s,
            translateWithNamespace: d,
            translateWithNamespaceHTML: m
        }), [n, a, s, d, m]);
        return (0, t.useMemo)(() => {
            let e = {
                ready: p.ready,
                translate: (0, c.translationFn)(p),
                translateHTML: (0, c.translateHTMLFn)(p),
                translateWithNamespace: p.translateWithNamespace,
                translateWithNamespaceHTML: p.translateWithNamespaceHTML
            };
            return {
                ...e,
                tPendingTranslation: (e => {
                    let {
                        ready: t,
                        translate: n
                    } = e;
                    return (e, r, o, a) => {
                        let s = l();
                        if (!s.isAllowed) return n(o, a);
                        if (s.preferLoadedTranslations && t) {
                            let e = n(o, a);
                            if (e.length > 0) return e
                        }
                        return i(s.preferLoadedTranslations && !t ? e : u(e, s), a)
                    }
                })(e),
                tPendingHtmlTranslation: (e => {
                    let {
                        ready: n,
                        translateHTML: a
                    } = e;
                    return (e, s, c, d, m) => {
                        let p = l();
                        if (!p.isAllowed) return a(c, d, m);
                        if (p.preferLoadedTranslations && n) {
                            let e = a(c, d, m);
                            if ("" !== e) return e
                        }
                        return ((e, n, a) => {
                            let s, l;
                            if (void 0 === n && void 0 === a) return e;
                            let {
                                stringArgs: u,
                                htmlArgs: c
                            } = (s = {}, l = {}, void 0 === a || Object.entries(a).forEach(e => {
                                let [t, n] = e;
                                "string" == typeof n ? s[t] = n : l[t] = n
                            }), {
                                stringArgs: s,
                                htmlArgs: l
                            }), d = i(e, u), m = d.split(o).filter(e => !!e);
                            if (1 === m.length) return d;
                            let p = [...m];
                            if (0 !== Object.keys(c).length) {
                                let e = m.reduce((e, t, n) => {
                                    let i = r.exec(t);
                                    if (i) {
                                        let t = i[1];
                                        if (Object.hasOwn(c, t)) {
                                            let i = e[t];
                                            if (!i) return Object.assign(e, {
                                                [t]: [n]
                                            });
                                            i.push(n)
                                        }
                                    }
                                    return e
                                }, {});
                                Object.entries(c).forEach(t => {
                                    let [n, i] = t, r = e[n];
                                    r && r.forEach(e => {
                                        p[e] = i
                                    })
                                })
                            }
                            if (!Array.isArray(n) || 0 === n.length) return (0, t.createElement)(t.Fragment, null, ...p);
                            let v = n.reduce((e, t) => {
                                    let {
                                        opening: n,
                                        closing: i,
                                        content: r
                                    } = t;
                                    return Object.assign(e, {
                                        ["{".concat(n, "}")]: {
                                            match: "{".concat(i, "}"),
                                            content: r
                                        }
                                    })
                                }, {}),
                                g = [],
                                E = [],
                                A = [];
                            for (let e = p.shift(); void 0 !== e; e = p.shift())
                                if ("string" == typeof e && r.test(e))
                                    if (Object.hasOwn(v, e)) E.push(e), A.push(e);
                                    else {
                                        let n = E.pop();
                                        if (void 0 !== n) {
                                            let {
                                                match: i,
                                                content: r
                                            } = v[n];
                                            if (e !== i) break;
                                            let o = [],
                                                a = !1;
                                            for (; A.length > 0 && !a;) {
                                                let e = A.pop();
                                                e === n ? a = !0 : o.unshift(e)
                                            }
                                            let s = r(o.every(e => "string" == typeof e) ? o : (0, t.createElement)(t.Fragment, null, ...o));
                                            0 === A.length ? g.push(s) : A.push(s)
                                        }
                                    }
                            else 0 === A.length ? g.push(e) : A.push(e);
                            return (0, t.createElement)(t.Fragment, null, ...g)
                        })(p.preferLoadedTranslations && !n ? e : u(e, p), d, m)
                    }
                })(e)
            }
        }, [p])
    }], 401263)
}, 923319, e => {
    "use strict";
    var t, n, i = e.i(730530),
        r = ((t = {}).BoldText = "boldText", t.Text = "text", t.TextWithDisplayValue = "textWithDisplayValue", t.Number = "number", t.Timestamp = "timestamp", t.RawJSONString = "RawJSONString", t.CodeDiff = "codeDiff", t.TextWithTooltip = "textWithTooltip", t.Other = "other", t.Selection = "selection", t.Actions = "actions", t.TextWithLink = "textWithLink", t.Image = "image", t.Date = "date", t.Status = "status", t.TextWithIcon = "TextWithIcon", t.Code = "code", t),
        o = ((n = {}).ValueOpacityFill = "valueOpacityFill", n.ValuePercentageWidthFill = "valuePercentageWidthFill", n.ConstantFill = "constantFill", n);
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
    }, "resolveTableColumnTitle", 0, (e, t, n) => void 0 !== n ? (0, i.brandUntranslatableText)(n) : "string" == typeof t ? t : e(t)])
}, 447311, e => {
    "use strict";
    var t, n = ((t = {}).Positive = "Positive", t.Negative = "Negative", t.Progression = "Progression", t.Highlight = "Highlight", t);
    e.s(["TableCellBackgroundColor", () => n])
}, 36826, 61925, e => {
    "use strict";
    var t, n, i, r, o, a, s = e.i(677753),
        l = function(e, t) {
            return (l = Object.setPrototypeOf || ({
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
                    l(i.next(e))
                } catch (e) {
                    o(e)
                }
            }

            function s(e) {
                try {
                    l(i.throw(e))
                } catch (e) {
                    o(e)
                }
            }

            function l(e) {
                var t;
                e.done ? r(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(a, s)
            }
            l((i = i.apply(e, t || [])).next())
        })
    }

    function c(e, t) {
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
        return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
            return this
        }), a;

        function s(s) {
            return function(l) {
                var u = [s, l];
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
        var t, n, i, r, o, a, l, u, c, d, m, p, v, g, E, A, f, h;
        return null == (t = e) ? t : {
            id: (0, s.exists)(t, "id") ? t.id : void 0,
            annotationType: (0, s.exists)(t, "annotationType") ? t.annotationType : void 0,
            metadata: (0, s.exists)(t, "metadata") ? null == (n = t.metadata) ? n : {
                placeIcon: (0, s.exists)(n, "placeIcon") ? null == (i = n.placeIcon) ? i : {
                    iconAssetId: (0, s.exists)(i, "iconAssetId") ? i.iconAssetId : void 0
                } : void 0,
                devProduct: (0, s.exists)(n, "devProduct") ? null == (r = n.devProduct) ? r : {
                    name: (0, s.exists)(r, "name") ? r.name : void 0,
                    imageAssetId: (0, s.exists)(r, "imageAssetId") ? r.imageAssetId : void 0,
                    priceInRobux: (0, s.exists)(r, "priceInRobux") ? r.priceInRobux : void 0
                } : void 0,
                gamePass: (0, s.exists)(n, "gamePass") ? null == (o = n.gamePass) ? o : {
                    name: (0, s.exists)(o, "name") ? o.name : void 0,
                    imageAssetId: (0, s.exists)(o, "imageAssetId") ? o.imageAssetId : void 0,
                    priceInRobux: (0, s.exists)(o, "priceInRobux") ? o.priceInRobux : void 0,
                    isForSale: (0, s.exists)(o, "isForSale") ? o.isForSale : void 0
                } : void 0,
                placeThumbnail: (0, s.exists)(n, "placeThumbnail") ? null == (a = n.placeThumbnail) ? a : {
                    thumbnailAssetId: (0, s.exists)(a, "thumbnailAssetId") ? a.thumbnailAssetId : void 0,
                    thumbnailAssetIds: (0, s.exists)(a, "thumbnailAssetIds") ? a.thumbnailAssetIds : void 0
                } : void 0,
                placeVersion: (0, s.exists)(n, "placeVersion") ? null == (l = n.placeVersion) ? l : {
                    versionNumber: (0, s.exists)(l, "versionNumber") ? l.versionNumber : void 0,
                    isPublished: (0, s.exists)(l, "isPublished") ? l.isPublished : void 0
                } : void 0,
                benchmarkChange: (0, s.exists)(n, "benchmarkChange") ? null == (u = n.benchmarkChange) ? u : {
                    fromBenchmarkType: (0, s.exists)(u, "fromBenchmarkType") ? u.fromBenchmarkType : void 0,
                    toBenchmarkType: (0, s.exists)(u, "toBenchmarkType") ? u.toBenchmarkType : void 0
                } : void 0,
                funnelStepNameChange: (0, s.exists)(n, "funnelStepNameChange") ? null == (c = n.funnelStepNameChange) ? c : {
                    minStep: (0, s.exists)(c, "minStep") ? c.minStep : void 0
                } : void 0,
                experienceEventState: (0, s.exists)(n, "experienceEventState") ? null == (d = n.experienceEventState) ? d : {
                    eventId: (0, s.exists)(d, "eventId") ? d.eventId : void 0,
                    eventName: (0, s.exists)(d, "eventName") ? d.eventName : void 0,
                    imageAssetId: (0, s.exists)(d, "imageAssetId") ? d.imageAssetId : void 0,
                    eventStateType: (0, s.exists)(d, "eventStateType") ? d.eventStateType : void 0
                } : void 0,
                customMatchmaking: (0, s.exists)(n, "customMatchmaking") ? null == (m = n.customMatchmaking) ? m : {
                    stateChange: (0, s.exists)(m, "stateChange") ? m.stateChange : void 0,
                    scoringConfigurationName: (0, s.exists)(m, "scoringConfigurationName") ? m.scoringConfigurationName : void 0
                } : void 0,
                engineRelease: (0, s.exists)(n, "engineRelease") ? null == (p = n.engineRelease) ? p : {
                    platform: (0, s.exists)(p, "platform") ? p.platform : void 0,
                    releaseMajorVersion: (0, s.exists)(p, "releaseMajorVersion") ? p.releaseMajorVersion : void 0
                } : void 0,
                gamePreviewVideoStateChange: (0, s.exists)(n, "gamePreviewVideoStateChange") ? null == (v = n.gamePreviewVideoStateChange) ? v : {
                    videoAssetId: (0, s.exists)(v, "videoAssetId") ? v.videoAssetId : void 0,
                    universeId: (0, s.exists)(v, "universeId") ? v.universeId : void 0,
                    gamePreviewVideoStateType: (0, s.exists)(v, "gamePreviewVideoStateType") ? v.gamePreviewVideoStateType : void 0
                } : void 0,
                configChange: (0, s.exists)(n, "configChange") ? null == (g = n.configChange) ? g : {
                    version: (0, s.exists)(g, "version") ? g.version : void 0
                } : void 0,
                experimentationOperation: (0, s.exists)(n, "experimentationOperation") ? null == (E = n.experimentationOperation) ? E : {
                    status: (0, s.exists)(E, "status") ? E.status : void 0,
                    experimentName: (0, s.exists)(E, "experimentName") ? E.experimentName : void 0,
                    exposurePercent: (0, s.exists)(E, "exposurePercent") ? E.exposurePercent : void 0,
                    rampedVariantLabel: (0, s.exists)(E, "rampedVariantLabel") ? E.rampedVariantLabel : void 0,
                    experimentId: (0, s.exists)(E, "experimentId") ? E.experimentId : void 0
                } : void 0,
                globalAnnouncement: (0, s.exists)(n, "globalAnnouncement") ? null == (A = n.globalAnnouncement) ? A : {
                    forAllPages: (0, s.exists)(A, "forAllPages") ? A.forAllPages : void 0,
                    appliedMetrics: (0, s.exists)(A, "appliedMetrics") ? A.appliedMetrics : void 0,
                    translationKey: (0, s.exists)(A, "translationKey") ? A.translationKey : void 0,
                    links: (0, s.exists)(A, "links") ? A.links : void 0
                } : void 0,
                extendedServicesEnablement: (0, s.exists)(n, "extendedServicesEnablement") ? null == (f = n.extendedServicesEnablement) ? f : {
                    service: (0, s.exists)(f, "service") ? f.service : void 0,
                    resource: (0, s.exists)(f, "resource") ? f.resource : void 0,
                    enabled: (0, s.exists)(f, "enabled") ? f.enabled : void 0,
                    enablementType: (0, s.exists)(f, "enablementType") ? f.enablementType : void 0
                } : void 0,
                creatorRegexChange: (0, s.exists)(n, "creatorRegexChange") ? null == (h = n.creatorRegexChange) ? h : {
                    regexOperation: (0, s.exists)(h, "regexOperation") ? h.regexOperation : void 0
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

            function n() {
                this.constructor = e
            }
            l(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
        }(t, e), t.prototype.v1UniversesUniverseIdAnnotationsGetRaw = function(e, t) {
            return u(this, void 0, void 0, function() {
                var n, i, r;
                return c(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new s.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdAnnotationsGet.");
                            return n = {}, void 0 !== e.annotationType && (n.annotationType = e.annotationType), void 0 !== e.inclusiveStartUtcTime && (n.inclusiveStartUtcTime = e.inclusiveStartUtcTime), void 0 !== e.inclusiveEndUtcTime && (n.inclusiveEndUtcTime = e.inclusiveEndUtcTime), void 0 !== e.cursor && (n.cursor = e.cursor), void 0 !== e.reverse && (n.reverse = e.reverse), void 0 !== e.resultsPerPage && (n.resultsPerPage = e.resultsPerPage), void 0 !== e.placeId && (n.placeId = e.placeId), void 0 !== e.developerProductId && (n.developerProductId = e.developerProductId), void 0 !== e.gamePassId && (n.gamePassId = e.gamePassId), void 0 !== e.funnelName && (n.funnelName = e.funnelName), i = {}, [4, this.request({
                                path: "/v1/universes/{universeId}/annotations".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/universes/{universeId}/annotations",
                                method: "GET",
                                headers: i,
                                query: n
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
                return c(this, function(n) {
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
    var v = ((t = {}).PlaceIcon = "PlaceIcon", t.PlaceThumbnail = "PlaceThumbnail", t.PlaceVideo = "PlaceVideo", t.PlaceVersion = "PlaceVersion", t.Benchmark = "Benchmark", t.FunnelStepNameChange = "FunnelStepNameChange", t.LiveEvent = "LiveEvent", t.CustomMatchmaking = "CustomMatchmaking", t.EngineRelease = "EngineRelease", t.MemoryStoreMemoryUsageAlert = "MemoryStoreMemoryUsageAlert", t.MemoryStoreRequestsAlert = "MemoryStoreRequestsAlert", t.ClientCrashRateNotStableAlert = "ClientCrashRateNotStableAlert", t.RetentionCorhortDisclaimer = "RetentionCorhortDisclaimer", t.ConfigVersion = "ConfigVersion", t.Announcement = "Announcement", t.ExtendedServicesEnablement = "ExtendedServicesEnablement", t.ConfiguredAlertIncident = "ConfiguredAlertIncident", t.CreatorRegexChange = "CreatorRegexChange", t);
    let g = {
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
    var E = ((n = {}).Similarity = "SIMILARITY", n.Genre = "GENRE", n),
        A = ((i = {}).Enrollment = "Enrollment", i.Unenrollment = "Unenrollment", i.WeightsUpdate = "WeightsUpdate", i),
        f = ((r = {}).Rcc = "RCC", r.WindowsPlayer = "WindowsPlayer", r.MacPlayer = "MacPlayer", r),
        h = ((o = {}).IgnoreAdd = "REGEX_OPERATION_IGNORE_ADD", o.IgnoreRemove = "REGEX_OPERATION_IGNORE_REMOVE", o),
        I = ((a = {}).Standard = "ENABLEMENT_TYPE_STANDARD", a.Extended = "ENABLEMENT_TYPE_EXTENDED", a);
    e.s(["AnnotationBenchmarkType", () => E, "AnnotationCreatorRegexOperation", () => h, "AnnotationCustomMatchmakingChangeType", () => A, "AnnotationEnablementType", () => I, "AnnotationEngineReleasePlatform", () => f, "AnnotationType", () => v, "UIAnnotationTypeToApiAnnotation", 0, g, "isAnnotationAlertType", 0, e => "MemoryStoreMemoryUsageAlert" === e || "MemoryStoreRequestsAlert" === e || "ClientCrashRateNotStableAlert" === e], 36826)
}, 215928, 929764, e => {
    "use strict";
    var t = e.i(31611),
        n = e.i(927868),
        i = e.i(908374),
        r = e.i(606662);
    let o = e => null !== e.aggregationType || null !== e.percentile;
    e.s(["default", 0, (e, i) => {
        let o = [],
            a = null,
            s = null;
        return null == e || e.forEach(e => {
            if (e.dimension !== t.RAQIV2UIPseudoDimension.AggregationType && e.dimension !== t.RAQIV2UIPseudoDimension.PercentileType) return void o.push(e);
            let l = e.values[0];
            if (!l) return;
            let u = (0, r.getSupportedFilterDimensionOptions)(i ? [i] : [], e.dimension);
            (void 0 === u || (0, r.isSupportedMetricFanoutDimensionValue)(u, l)) && (e.dimension === t.RAQIV2UIPseudoDimension.AggregationType && (0, n.isValidEnumValue)(t.RAQIV2AggregationType, l) ? a = l : e.dimension === t.RAQIV2UIPseudoDimension.PercentileType && (0, n.isValidEnumValue)(t.RAQIV2PercentileType, l) && (s = l))
        }), {
            pseudoDimensionValues: {
                aggregationType: a,
                percentile: s
            },
            realFilters: o
        }
    }, "hasPseudoDimensionValues", 0, o], 929764);
    let a = e => {
            var i;
            return (0, n.isValidEnumValue)(t.RAQIV2BenchmarkDatasetKey, e) && (null == (i = t.RAQIV2BenchmarkDatasetKeyToVariant[e]) ? void 0 : i.variantId) === t.RAQIV2BenchmarkVariantId.L7Average
        },
        s = Object.entries(t.RAQIV2BenchmarkDatasetKeyToVariant).reduce((e, t) => {
            let [n, r] = t;
            return a(n) && (0, i.isNumericUIMetric)(r.metric) && (e[n] = r.metric), e
        }, {}),
        l = new Set(Object.keys(t.RAQIV2BenchmarkDatasetKeyToVariant).filter(a)),
        u = (e, n) => {
            var i;
            return e === t.RAQIV2UIMetric.CustomEventsV2 && (null == n ? void 0 : n.customEventName) ? {
                metric: e,
                customEventName: n.customEventName,
                ...(null == (i = n.pseudoDimensionValues) ? void 0 : i.aggregationType) ? {
                    aggregationType: n.pseudoDimensionValues.aggregationType
                } : {}
            } : e
        },
        c = (e, t) => {
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
        d = e => 1 === e.sources.length && e.formula.trim() === e.sources[0].key,
        m = e => !!e.l7Smoothing && d(e);
    e.s(["buildL7SmoothingComputedMetric", 0, c, "getBaseMetricFromL7", 0, e => {
        var t;
        return a(e) && null != (t = s[e]) ? t : null
    }, "getBenchmarkVariantByDatasetKey", 0, e => t.RAQIV2BenchmarkDatasetKeyToVariant[e], "getMetricForL7Smoothing", 0, (e, t, n) => t ? c(e, n) : u(e, n), "getPeriodSummaryBaseMetricForL7", 0, e => {
        var i, r;
        if (!m(e)) return;
        let [a] = e.sources;
        if (!("string" != typeof a.metric || (null != (i = null == (r = a.filters) ? void 0 : r.length) ? i : 0) > 0 || a.pseudoDimensionValues && o(a.pseudoDimensionValues))) return (0, n.isValidEnumValue)(t.RAQIV2Metric, a.metric) ? a.metric : void 0
    }, "getPrecomputedL7MetricFromBase", 0, e => {
        var i, r;
        if (!(0, n.isValidEnumValue)(t.RAQIV2Metric, e)) return null;
        let o = null == (r = t.RAQIV2BenchmarkVariantsByMetric[e]) || null == (i = r[t.RAQIV2BenchmarkVariantId.L7Average]) ? void 0 : i.datasetKey;
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
        n = e.i(927868),
        i = e.i(405005);
    e.s(["default", 0, e => (0, n.isValidEnumValue)(t.RAQIV2UIPseudoDimension, e) && t.RAQIV2DimensionDisplayConfig[e].pseudoDimensionConfig.type === t.RAQIV2UIPseudoDimensionType.MetricFanout, "hasMetricFanoutBreakdown", 0, (e, t) => (0, i.hasMetricVariantFanout)(t, e)])
}, 339923, e => {
    "use strict";
    var t = e.i(31611),
        n = e.i(730530),
        i = e.i(577038),
        r = e.i(881670),
        o = e.i(927868),
        a = e.i(215928),
        s = e.i(908374),
        l = e.i(11517);
    let u = e => "string" == typeof e && e.trim().length > 0,
        c = e => (0, o.isValidEnumValue)(t.RAQIV2Metric, e),
        d = e => (0, n.brandUntranslatableText)(e),
        m = (e, t) => {
            if (!(0, l.isComputedMetric)(e)) {
                if ((0, l.isCustomEventsAtomicMetricLike)(e)) return d(e.customEventName);
                let {
                    localizedName: n
                } = (0, s.default)((0, l.getUIMetricFromAtomicMetricLike)(e));
                return t ? t.translate(n) : d(n.key)
            }
            return (0, a.isPureL7SmoothingComputedMetric)(e) ? m(e.sources[0].metric, t) : d(u(e.name) ? e.name : e.formula)
        },
        p = (0, n.translationKey)("Label.ExploreMode.UntitledFormula", r.TranslationNamespace.Analytics),
        v = (e, t) => {
            if ((0, l.isComputedMetric)(e)) return (0, a.isPureL7SmoothingComputedMetric)(e) ? v(e.sources[0].metric, t) : (0, n.brandUntranslatableText)("");
            let {
                localizedName: i
            } = (0, s.default)((0, l.getUIMetricFromAtomicMetricLike)(e));
            return t.translate(i)
        },
        g = e => (0, l.isComputedMetric)(e) ? !(0, a.isPureL7SmoothingComputedMetric)(e) || g(e.sources[0].metric) : (0, s.default)((0, l.getUIMetricFromAtomicMetricLike)(e)).isPositiveGood,
        E = e => {
            var t;
            if ((0, l.isComputedMetric)(e)) return !!(0, a.isPureL7SmoothingComputedMetric)(e) && E(e.sources[0].metric);
            let {
                defaultTotalSummaryTypes: n
            } = (0, s.default)((0, l.getUIMetricFromAtomicMetricLike)(e));
            return (null == n || null == (t = n[0]) ? void 0 : t.type) === i.default.Average
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
            let n = (0, l.getUIMetricFromAtomicMetricLike)(e.sources[0].metric);
            return (0, o.isValidEnumValue)(t.RAQIV2Metric, n) && null != (0, a.getPrecomputedL7MetricFromBase)(n) ? {
                metric: n,
                benchmarkVariantId: t.RAQIV2BenchmarkVariantId.L7Average
            } : null
        }
        let n = (0, l.getUIMetricFromAtomicMetricLike)(e);
        return c(n) ? {
            metric: n
        } : null
    }, "getDisplayUnitFromMetricLike", 0, v, "getIsAverageAggregationMetric", 0, E, "getIsPositiveGoodFromMetricLike", 0, g, "getMetricLabelFromMetricLike", 0, m, "getMetricTitleKeyFromMetricLike", 0, e => (0, l.isComputedMetric)(e) ? u(e.name) ? d(e.name) : p : (0, l.isCustomEventsAtomicMetricLike)(e) ? d(e.customEventName) : (0, s.default)((0, l.getUIMetricFromAtomicMetricLike)(e)).localizedName, "getRAQIV2BenchmarkMetricFromMetricLike", 0, e => {
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
        n = e.i(31611),
        i = e.i(606662);
    let r = {
            percentile: n.RAQIV2UIPseudoDimension.PercentileType,
            aggregation: n.RAQIV2UIPseudoDimension.AggregationType
        },
        o = n.RAQIV2PercentileType.AVG,
        a = e => (null == e ? void 0 : e.mode) === "fanout",
        s = e => r[e],
        l = (e, t) => {
            let i = t.replaceAll(/([a-z0-9])([A-Z])/g, "$1_$2").replaceAll(/[^A-Za-z0-9]+/g, "_").toUpperCase().replaceAll(/^_+|_+$/g, "");
            if (i === o || "AVERAGE" === i) return "AVERAGE";
            if (e === n.RAQIV2UIPseudoDimension.PercentileType) {
                let e = /^P?(\d+)$/.exec(i);
                if (e) return "P".concat(e[1])
            }
            return i
        },
        u = e => e === n.RAQIV2UIPseudoDimension.PercentileType ? t.VariantKind.Percentile : e === n.RAQIV2UIPseudoDimension.AggregationType ? t.VariantKind.Aggregation : null,
        c = (e, t) => {
            let i = [],
                r = [];
            if (null == t || t.forEach(e => {
                    let t = e === n.RAQIV2UIPseudoDimension.PercentileType ? "percentile" : e === n.RAQIV2UIPseudoDimension.AggregationType ? "aggregation" : void 0;
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
        d = (e, t) => {
            let {
                metricVariant: n
            } = c(e, t);
            return a(n)
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
            o = n.RAQIV2DimensionDisplayConfig[r].pseudoDimensionConfig;
        if (o.type !== n.RAQIV2UIPseudoDimensionType.MetricFanout) return;
        let a = (0, i.getSupportedFilterDimensionOptions)(t, r);
        if (void 0 === a) return {
            dimension: r,
            config: o
        };
        let l = o.supportedDimensionValues.filter(e => (0, i.isSupportedMetricFanoutDimensionValue)(a, e)),
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
        var n;
        return (null != (n = null == e ? void 0 : e.length) ? n : 0) > 0 || d(t, e)
    }, "hasMetricVariantFanout", 0, d, "isMetricVariantFanout", 0, a, "mergeMetricVariantIntoBreakdown", 0, (e, t) => {
        if (!a(t)) return [...e];
        let n = s(t.kind);
        return e.includes(n) ? [...e] : [...e, n]
    }, "metricVariantAllowedForFilterOnlyDimensions", 0, (e, t) => {
        if (!a(e)) return;
        let i = s(e.kind);
        return i === n.RAQIV2UIPseudoDimension.AggregationType ? e : t.includes(i) ? void 0 : e
    }, "serializeMetricVariantFanout", 0, e => a(e) ? e.kind : null, "splitMetricVariantFromBreakdown", 0, c, "supportedMetricVariantForDimensions", 0, (e, t) => {
        if (a(e)) return t.includes(s(e.kind)) ? e : void 0
    }])
}, 927868, e => {
    "use strict";
    e.s(["getEnumKeyByValue", 0, (e, t) => {
        let n = Object.entries(e).find(e => {
            let [, n] = e;
            return n === t
        });
        return n ? n[0] : null
    }, "isValidArrayEnumValue", 0, (e, t) => e.includes(t), "isValidEnumValue", 0, (e, t) => Object.values(e).includes(t)])
}, 448321, e => {
    "use strict";
    var t = e.i(80251);
    e.s(["AnalyticsQueryGatewayAPIFilterOperation", () => t.FilterOperation])
}, 619130, e => {
    "use strict";
    var t = e.i(677753);
    e.s(["default", () => t.createFetchClient])
}, 459703, e => {
    "use strict";
    var t = e.i(30941),
        n = e.i(416340),
        i = e.i(787159);
    e.i(221628), e.i(149285);
    var r = (0, n.createContext)({
        ref: {
            current: null
        },
        enqueue: function() {
            throw Error("useSnackbar was invoked without SnackbarProvider")
        },
        close: function() {
            throw Error("useSnackbar was invoked without SnackbarProvider")
        }
    });
    e.s(["default", 0, function(e) {
        var o, a, s, l, u = e.children,
            c = (0, t.a)(e, ["children"]),
            d = (0, n.useRef)(null),
            m = (0, n.useState)(!1),
            p = m[0],
            v = m[1],
            g = (0, n.useState)([]),
            E = g[0],
            A = g[1],
            f = (0, n.useCallback)(function(e, n) {
                void 0 === e && (e = {}), void 0 === n && (n = function() {
                    return !0
                }), A(function(i) {
                    return (0, t.b)((0, t.b)([], i, !0), [{
                        props: e,
                        shouldClose: n
                    }], !1)
                })
            }, [A]),
            h = (0, n.useCallback)(function() {
                v(!1)
            }, [v]);
        (0, n.useEffect)(function() {
            E.length > 0 && v(!0)
        }, [E.length]);
        var I = (0, n.useMemo)(function() {
            return {
                ref: d,
                enqueue: f,
                close: h
            }
        }, [h, f]);
        return n.default.createElement(n.default.Fragment, null, n.default.createElement(r.Provider, {
            value: I
        }, u), n.default.createElement(i.S, (0, t._)({}, (null == (o = E[0]) ? void 0 : o.props) || {}, c, {
            TransitionProps: (0, t._)((0, t._)({}, (null == (s = null == (a = E[0]) ? void 0 : a.props) ? void 0 : s.TransitionProps) || {}), {
                onExited: function(e) {
                    var n, i, r, o;
                    A(function(e) {
                        var n = e.slice(1);
                        return (0, t.b)([], n, !0)
                    }), (null == (i = null == (n = E[0]) ? void 0 : n.props.TransitionProps) ? void 0 : i.onExited) && (null == (o = null == (r = E[0]) ? void 0 : r.props.TransitionProps) || o.onExited(e))
                }
            }),
            onClose: function(e, t) {
                var n, i, r;
                (null == (n = E[0]) ? void 0 : n.shouldClose(t)) && v(!1), (null == (i = E[0]) ? void 0 : i.props.onClose) && (null == (r = E[0]) || r.props.onClose(e, t))
            },
            open: p
        }), null == (l = E[0]) ? void 0 : l.props.children))
    }, "useSnackbar", 0, function() {
        var e = (0, n.useContext)(r);
        return {
            ref: e.ref,
            enqueue: e.enqueue,
            close: e.close
        }
    }])
}, 718389, e => {
    "use strict";
    e.s(["default", 0, function e(t) {
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
}, 515210, (e, t, n) => {
    "use strict";
    var i = e.r(416340).__CLIENT_INTERNALS_DO_NOT_USE_OR_WARN_USERS_THEY_CANNOT_UPGRADE;
    n.c = function(e) {
        return i.H.useMemoCache(e)
    }
}, 999061, (e, t, n) => {
    "use strict";
    t.exports = e.r(515210)
}]);

//# debugId=b23396a2-752b-b6b1-3a69-0b0966f1c2a9
//# sourceMappingURL=2dn63xjd7vq3b.js.map
;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "b66e40d7-37d3-c4f1-43b4-abdbd6f0dbcf")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 36826, 61925, e => {
    "use strict";
    var t, r, n, i, o, s, a = e.i(677753),
        f = function(e, t) {
            return (f = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
            })(e, t)
        };

    function u(e, t, r, n) {
        return new(r || (r = Promise))(function(i, o) {
            function s(e) {
                try {
                    f(n.next(e))
                } catch (e) {
                    o(e)
                }
            }

            function a(e) {
                try {
                    f(n.throw(e))
                } catch (e) {
                    o(e)
                }
            }

            function f(e) {
                var t;
                e.done ? i(e.value) : ((t = e.value) instanceof r ? t : new r(function(e) {
                    e(t)
                })).then(s, a)
            }
            f((n = n.apply(e, t || [])).next())
        })
    }

    function l(e, t) {
        var r, n, i, o = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            },
            s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return s.next = a(0), s.throw = a(1), s.return = a(2), "function" == typeof Symbol && (s[Symbol.iterator] = function() {
            return this
        }), s;

        function a(a) {
            return function(f) {
                var u = [a, f];
                if (r) throw TypeError("Generator is already executing.");
                for (; s && (s = 0, u[0] && (o = 0)), o;) try {
                    if (r = 1, n && (i = 2 & u[0] ? n.return : u[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, u[1])).done) return i;
                    switch (n = 0, i && (u = [2 & u[0], i.value]), u[0]) {
                        case 0:
                        case 1:
                            i = u;
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
                            if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                o = 0;
                                continue
                            }
                            if (3 === u[0] && (!i || u[1] > i[0] && u[1] < i[3])) {
                                o.label = u[1];
                                break
                            }
                            if (6 === u[0] && o.label < i[1]) {
                                o.label = i[1], i = u;
                                break
                            }
                            if (i && o.label < i[2]) {
                                o.label = i[2], o.ops.push(u);
                                break
                            }
                            i[2] && o.ops.pop(), o.trys.pop();
                            continue
                    }
                    u = t.call(e, o)
                } catch (e) {
                    u = [6, e], n = 0
                } finally {
                    r = i = 0
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
    var h = {
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

    function c(e) {
        var t, r, n, i, o, s, f, u, l, h, c, p, d, v, g, y, E, m;
        return null == (t = e) ? t : {
            id: (0, a.exists)(t, "id") ? t.id : void 0,
            annotationType: (0, a.exists)(t, "annotationType") ? t.annotationType : void 0,
            metadata: (0, a.exists)(t, "metadata") ? null == (r = t.metadata) ? r : {
                placeIcon: (0, a.exists)(r, "placeIcon") ? null == (n = r.placeIcon) ? n : {
                    iconAssetId: (0, a.exists)(n, "iconAssetId") ? n.iconAssetId : void 0
                } : void 0,
                devProduct: (0, a.exists)(r, "devProduct") ? null == (i = r.devProduct) ? i : {
                    name: (0, a.exists)(i, "name") ? i.name : void 0,
                    imageAssetId: (0, a.exists)(i, "imageAssetId") ? i.imageAssetId : void 0,
                    priceInRobux: (0, a.exists)(i, "priceInRobux") ? i.priceInRobux : void 0
                } : void 0,
                gamePass: (0, a.exists)(r, "gamePass") ? null == (o = r.gamePass) ? o : {
                    name: (0, a.exists)(o, "name") ? o.name : void 0,
                    imageAssetId: (0, a.exists)(o, "imageAssetId") ? o.imageAssetId : void 0,
                    priceInRobux: (0, a.exists)(o, "priceInRobux") ? o.priceInRobux : void 0,
                    isForSale: (0, a.exists)(o, "isForSale") ? o.isForSale : void 0
                } : void 0,
                placeThumbnail: (0, a.exists)(r, "placeThumbnail") ? null == (s = r.placeThumbnail) ? s : {
                    thumbnailAssetId: (0, a.exists)(s, "thumbnailAssetId") ? s.thumbnailAssetId : void 0,
                    thumbnailAssetIds: (0, a.exists)(s, "thumbnailAssetIds") ? s.thumbnailAssetIds : void 0
                } : void 0,
                placeVersion: (0, a.exists)(r, "placeVersion") ? null == (f = r.placeVersion) ? f : {
                    versionNumber: (0, a.exists)(f, "versionNumber") ? f.versionNumber : void 0,
                    isPublished: (0, a.exists)(f, "isPublished") ? f.isPublished : void 0
                } : void 0,
                benchmarkChange: (0, a.exists)(r, "benchmarkChange") ? null == (u = r.benchmarkChange) ? u : {
                    fromBenchmarkType: (0, a.exists)(u, "fromBenchmarkType") ? u.fromBenchmarkType : void 0,
                    toBenchmarkType: (0, a.exists)(u, "toBenchmarkType") ? u.toBenchmarkType : void 0
                } : void 0,
                funnelStepNameChange: (0, a.exists)(r, "funnelStepNameChange") ? null == (l = r.funnelStepNameChange) ? l : {
                    minStep: (0, a.exists)(l, "minStep") ? l.minStep : void 0
                } : void 0,
                experienceEventState: (0, a.exists)(r, "experienceEventState") ? null == (h = r.experienceEventState) ? h : {
                    eventId: (0, a.exists)(h, "eventId") ? h.eventId : void 0,
                    eventName: (0, a.exists)(h, "eventName") ? h.eventName : void 0,
                    imageAssetId: (0, a.exists)(h, "imageAssetId") ? h.imageAssetId : void 0,
                    eventStateType: (0, a.exists)(h, "eventStateType") ? h.eventStateType : void 0
                } : void 0,
                customMatchmaking: (0, a.exists)(r, "customMatchmaking") ? null == (c = r.customMatchmaking) ? c : {
                    stateChange: (0, a.exists)(c, "stateChange") ? c.stateChange : void 0,
                    scoringConfigurationName: (0, a.exists)(c, "scoringConfigurationName") ? c.scoringConfigurationName : void 0
                } : void 0,
                engineRelease: (0, a.exists)(r, "engineRelease") ? null == (p = r.engineRelease) ? p : {
                    platform: (0, a.exists)(p, "platform") ? p.platform : void 0,
                    releaseMajorVersion: (0, a.exists)(p, "releaseMajorVersion") ? p.releaseMajorVersion : void 0
                } : void 0,
                gamePreviewVideoStateChange: (0, a.exists)(r, "gamePreviewVideoStateChange") ? null == (d = r.gamePreviewVideoStateChange) ? d : {
                    videoAssetId: (0, a.exists)(d, "videoAssetId") ? d.videoAssetId : void 0,
                    universeId: (0, a.exists)(d, "universeId") ? d.universeId : void 0,
                    gamePreviewVideoStateType: (0, a.exists)(d, "gamePreviewVideoStateType") ? d.gamePreviewVideoStateType : void 0
                } : void 0,
                configChange: (0, a.exists)(r, "configChange") ? null == (v = r.configChange) ? v : {
                    version: (0, a.exists)(v, "version") ? v.version : void 0
                } : void 0,
                experimentationOperation: (0, a.exists)(r, "experimentationOperation") ? null == (g = r.experimentationOperation) ? g : {
                    status: (0, a.exists)(g, "status") ? g.status : void 0,
                    experimentName: (0, a.exists)(g, "experimentName") ? g.experimentName : void 0,
                    exposurePercent: (0, a.exists)(g, "exposurePercent") ? g.exposurePercent : void 0,
                    rampedVariantLabel: (0, a.exists)(g, "rampedVariantLabel") ? g.rampedVariantLabel : void 0,
                    experimentId: (0, a.exists)(g, "experimentId") ? g.experimentId : void 0
                } : void 0,
                globalAnnouncement: (0, a.exists)(r, "globalAnnouncement") ? null == (y = r.globalAnnouncement) ? y : {
                    forAllPages: (0, a.exists)(y, "forAllPages") ? y.forAllPages : void 0,
                    appliedMetrics: (0, a.exists)(y, "appliedMetrics") ? y.appliedMetrics : void 0,
                    translationKey: (0, a.exists)(y, "translationKey") ? y.translationKey : void 0,
                    links: (0, a.exists)(y, "links") ? y.links : void 0
                } : void 0,
                extendedServicesEnablement: (0, a.exists)(r, "extendedServicesEnablement") ? null == (E = r.extendedServicesEnablement) ? E : {
                    service: (0, a.exists)(E, "service") ? E.service : void 0,
                    resource: (0, a.exists)(E, "resource") ? E.resource : void 0,
                    enabled: (0, a.exists)(E, "enabled") ? E.enabled : void 0,
                    enablementType: (0, a.exists)(E, "enablementType") ? E.enablementType : void 0
                } : void 0,
                creatorRegexChange: (0, a.exists)(r, "creatorRegexChange") ? null == (m = r.creatorRegexChange) ? m : {
                    regexOperation: (0, a.exists)(m, "regexOperation") ? m.regexOperation : void 0
                } : void 0
            } : void 0,
            createdUtcTime: (0, a.exists)(t, "createdUtcTime") ? t.createdUtcTime : void 0
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
            f(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
        }(t, e), t.prototype.v1UniversesUniverseIdAnnotationsGetRaw = function(e, t) {
            return u(this, void 0, void 0, function() {
                var r, n, i;
                return l(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new a.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdAnnotationsGet.");
                            return r = {}, void 0 !== e.annotationType && (r.annotationType = e.annotationType), void 0 !== e.inclusiveStartUtcTime && (r.inclusiveStartUtcTime = e.inclusiveStartUtcTime), void 0 !== e.inclusiveEndUtcTime && (r.inclusiveEndUtcTime = e.inclusiveEndUtcTime), void 0 !== e.cursor && (r.cursor = e.cursor), void 0 !== e.reverse && (r.reverse = e.reverse), void 0 !== e.resultsPerPage && (r.resultsPerPage = e.resultsPerPage), void 0 !== e.placeId && (r.placeId = e.placeId), void 0 !== e.developerProductId && (r.developerProductId = e.developerProductId), void 0 !== e.gamePassId && (r.gamePassId = e.gamePassId), void 0 !== e.funnelName && (r.funnelName = e.funnelName), n = {}, [4, this.request({
                                path: "/v1/universes/{universeId}/annotations".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/universes/{universeId}/annotations",
                                method: "GET",
                                headers: n,
                                query: r
                            }, t)];
                        case 1:
                            return i = o.sent(), [2, new a.JSONApiResponse(i, function(e) {
                                return null == e ? e : {
                                    annotations: (0, a.exists)(e, "annotations") ? e.annotations.map(c) : void 0,
                                    nextCursor: (0, a.exists)(e, "nextCursor") ? e.nextCursor : void 0,
                                    previousCursor: (0, a.exists)(e, "previousCursor") ? e.previousCursor : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1UniversesUniverseIdAnnotationsGet = function(e, t) {
            return u(this, void 0, void 0, function() {
                return l(this, function(r) {
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
    }(a.BaseAPI);
    e.s(["AnalyticsAnnotationsAPIApi", 0, p, "AnnotationType", 0, h, "CustomMatchmakingChange", 0, {
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
    let v = {
        PlaceIcon: h.NUMBER_1,
        PlaceThumbnail: h.NUMBER_4,
        PlaceVersion: h.NUMBER_5,
        Benchmark: h.NUMBER_6,
        FunnelStepNameChange: h.NUMBER_7,
        LiveEvent: h.NUMBER_8,
        CustomMatchmaking: h.NUMBER_9,
        EngineRelease: h.NUMBER_10,
        PlaceVideo: h.NUMBER_11,
        ConfigVersion: h.NUMBER_12,
        ExtendedServicesEnablement: h.NUMBER_15,
        CreatorRegexChange: h.NUMBER_16
    };
    var g = ((r = {}).Similarity = "SIMILARITY", r.Genre = "GENRE", r),
        y = ((n = {}).Enrollment = "Enrollment", n.Unenrollment = "Unenrollment", n.WeightsUpdate = "WeightsUpdate", n),
        E = ((i = {}).Rcc = "RCC", i.WindowsPlayer = "WindowsPlayer", i.MacPlayer = "MacPlayer", i),
        m = ((o = {}).IgnoreAdd = "REGEX_OPERATION_IGNORE_ADD", o.IgnoreRemove = "REGEX_OPERATION_IGNORE_REMOVE", o),
        A = ((s = {}).Standard = "ENABLEMENT_TYPE_STANDARD", s.Extended = "ENABLEMENT_TYPE_EXTENDED", s);
    e.s(["AnnotationBenchmarkType", () => g, "AnnotationCreatorRegexOperation", () => m, "AnnotationCustomMatchmakingChangeType", () => y, "AnnotationEnablementType", () => A, "AnnotationEngineReleasePlatform", () => E, "AnnotationType", () => d, "UIAnnotationTypeToApiAnnotation", 0, v, "isAnnotationAlertType", 0, e => "MemoryStoreMemoryUsageAlert" === e || "MemoryStoreRequestsAlert" === e || "ClientCrashRateNotStableAlert" === e], 36826)
}, 619130, e => {
    "use strict";
    var t = e.i(677753);
    e.s(["default", () => t.createFetchClient])
}, 352421, (e, t, r) => {
    var n = {
            872: function(e, t) {
                "use strict";
                t.byteLength = function(e) {
                    var t = f(e),
                        r = t[0],
                        n = t[1];
                    return (r + n) * 3 / 4 - n
                }, t.toByteArray = function(e) {
                    var t, r, o = f(e),
                        s = o[0],
                        a = o[1],
                        u = new i((s + a) * 3 / 4 - a),
                        l = 0,
                        h = a > 0 ? s - 4 : s;
                    for (r = 0; r < h; r += 4) t = n[e.charCodeAt(r)] << 18 | n[e.charCodeAt(r + 1)] << 12 | n[e.charCodeAt(r + 2)] << 6 | n[e.charCodeAt(r + 3)], u[l++] = t >> 16 & 255, u[l++] = t >> 8 & 255, u[l++] = 255 & t;
                    return 2 === a && (t = n[e.charCodeAt(r)] << 2 | n[e.charCodeAt(r + 1)] >> 4, u[l++] = 255 & t), 1 === a && (t = n[e.charCodeAt(r)] << 10 | n[e.charCodeAt(r + 1)] << 4 | n[e.charCodeAt(r + 2)] >> 2, u[l++] = t >> 8 & 255, u[l++] = 255 & t), u
                }, t.fromByteArray = function(e) {
                    for (var t, n = e.length, i = n % 3, o = [], s = 0, a = n - i; s < a; s += 16383) o.push(function(e, t, n) {
                        for (var i, o = [], s = t; s < n; s += 3) i = (e[s] << 16 & 0xff0000) + (e[s + 1] << 8 & 65280) + (255 & e[s + 2]), o.push(r[i >> 18 & 63] + r[i >> 12 & 63] + r[i >> 6 & 63] + r[63 & i]);
                        return o.join("")
                    }(e, s, s + 16383 > a ? a : s + 16383));
                    return 1 === i ? o.push(r[(t = e[n - 1]) >> 2] + r[t << 4 & 63] + "==") : 2 === i && o.push(r[(t = (e[n - 2] << 8) + e[n - 1]) >> 10] + r[t >> 4 & 63] + r[t << 2 & 63] + "="), o.join("")
                };
                for (var r = [], n = [], i = "u" > typeof Uint8Array ? Uint8Array : Array, o = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", s = 0, a = o.length; s < a; ++s) r[s] = o[s], n[o.charCodeAt(s)] = s;

                function f(e) {
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

                function s(e) {
                    if (e > 0x7fffffff) throw RangeError('The value "' + e + '" is invalid for option "size"');
                    var t = new Uint8Array(e);
                    return Object.setPrototypeOf(t, a.prototype), t
                }

                function a(e, t, r) {
                    if ("number" == typeof e) {
                        if ("string" == typeof t) throw TypeError('The "string" argument must be of type string. Received type number');
                        return l(e)
                    }
                    return f(e, t, r)
                }

                function f(e, t, r) {
                    if ("string" == typeof e) {
                        var n = e,
                            i = t;
                        if (("string" != typeof i || "" === i) && (i = "utf8"), !a.isEncoding(i)) throw TypeError("Unknown encoding: " + i);
                        var o = 0 | p(n, i),
                            f = s(o),
                            u = f.write(n, i);
                        return u !== o && (f = f.slice(0, u)), f
                    }
                    if (ArrayBuffer.isView(e)) return h(e);
                    if (null == e) throw TypeError("The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type " + typeof e);
                    if (S(e, ArrayBuffer) || e && S(e.buffer, ArrayBuffer) || "u" > typeof SharedArrayBuffer && (S(e, SharedArrayBuffer) || e && S(e.buffer, SharedArrayBuffer))) return function(e, t, r) {
                        var n;
                        if (t < 0 || e.byteLength < t) throw RangeError('"offset" is outside of buffer bounds');
                        if (e.byteLength < t + (r || 0)) throw RangeError('"length" is outside of buffer bounds');
                        return Object.setPrototypeOf(n = void 0 === t && void 0 === r ? new Uint8Array(e) : void 0 === r ? new Uint8Array(e, t) : new Uint8Array(e, t, r), a.prototype), n
                    }(e, t, r);
                    if ("number" == typeof e) throw TypeError('The "value" argument must not be of type number. Received type number');
                    var l = e.valueOf && e.valueOf();
                    if (null != l && l !== e) return a.from(l, t, r);
                    var d = function(e) {
                        if (a.isBuffer(e)) {
                            var t = 0 | c(e.length),
                                r = s(t);
                            return 0 === r.length || e.copy(r, 0, 0, t), r
                        }
                        return void 0 !== e.length ? "number" != typeof e.length || function(e) {
                            return e != e
                        }(e.length) ? s(0) : h(e) : "Buffer" === e.type && Array.isArray(e.data) ? h(e.data) : void 0
                    }(e);
                    if (d) return d;
                    if ("u" > typeof Symbol && null != Symbol.toPrimitive && "function" == typeof e[Symbol.toPrimitive]) return a.from(e[Symbol.toPrimitive]("string"), t, r);
                    throw TypeError("The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type " + typeof e)
                }

                function u(e) {
                    if ("number" != typeof e) throw TypeError('"size" argument must be of type number');
                    if (e < 0) throw RangeError('The value "' + e + '" is invalid for option "size"')
                }

                function l(e) {
                    return u(e), s(e < 0 ? 0 : 0 | c(e))
                }

                function h(e) {
                    for (var t = e.length < 0 ? 0 : 0 | c(e.length), r = s(t), n = 0; n < t; n += 1) r[n] = 255 & e[n];
                    return r
                }
                t.Buffer = a, t.SlowBuffer = function(e) {
                    return +e != e && (e = 0), a.alloc(+e)
                }, t.INSPECT_MAX_BYTES = 50, t.kMaxLength = 0x7fffffff, a.TYPED_ARRAY_SUPPORT = function() {
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
                }(), !a.TYPED_ARRAY_SUPPORT && "u" > typeof console && "function" == typeof console.error && console.error("This browser lacks typed array (Uint8Array) support which is required by `buffer` v5.x. Use `buffer` v4.x if you require old browser support."), Object.defineProperty(a.prototype, "parent", {
                    enumerable: !0,
                    get: function() {
                        if (a.isBuffer(this)) return this.buffer
                    }
                }), Object.defineProperty(a.prototype, "offset", {
                    enumerable: !0,
                    get: function() {
                        if (a.isBuffer(this)) return this.byteOffset
                    }
                }), a.poolSize = 8192, a.from = function(e, t, r) {
                    return f(e, t, r)
                }, Object.setPrototypeOf(a.prototype, Uint8Array.prototype), Object.setPrototypeOf(a, Uint8Array), a.alloc = function(e, t, r) {
                    return (u(e), e <= 0) ? s(e) : void 0 !== t ? "string" == typeof r ? s(e).fill(t, r) : s(e).fill(t) : s(e)
                }, a.allocUnsafe = function(e) {
                    return l(e)
                }, a.allocUnsafeSlow = function(e) {
                    return l(e)
                };

                function c(e) {
                    if (e >= 0x7fffffff) throw RangeError("Attempt to allocate Buffer larger than maximum size: 0x7fffffff bytes");
                    return 0 | e
                }

                function p(e, t) {
                    if (a.isBuffer(e)) return e.length;
                    if (ArrayBuffer.isView(e) || S(e, ArrayBuffer)) return e.byteLength;
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
                            return x(e).length;
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return 2 * r;
                        case "hex":
                            return r >>> 1;
                        case "base64":
                            return N(e).length;
                        default:
                            if (i) return n ? -1 : x(e).length;
                            t = ("" + t).toLowerCase(), i = !0
                    }
                }

                function d(e, t, r) {
                    var i, o, s, a = !1;
                    if ((void 0 === t || t < 0) && (t = 0), t > this.length || ((void 0 === r || r > this.length) && (r = this.length), r <= 0 || (r >>>= 0) <= (t >>>= 0))) return "";
                    for (e || (e = "utf8");;) switch (e) {
                        case "hex":
                            return function(e, t, r) {
                                var n = e.length;
                                (!t || t < 0) && (t = 0), (!r || r < 0 || r > n) && (r = n);
                                for (var i = "", o = t; o < r; ++o) i += M[e[o]];
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
                            return i = this, o = t, s = r, 0 === o && s === i.length ? n.fromByteArray(i) : n.fromByteArray(i.slice(o, s));
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return function(e, t, r) {
                                for (var n = e.slice(t, r), i = "", o = 0; o < n.length; o += 2) i += String.fromCharCode(n[o] + 256 * n[o + 1]);
                                return i
                            }(this, t, r);
                        default:
                            if (a) throw TypeError("Unknown encoding: " + e);
                            e = (e + "").toLowerCase(), a = !0
                    }
                }

                function v(e, t, r) {
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
                    if ("string" == typeof t && (t = a.from(t, n)), a.isBuffer(t)) return 0 === t.length ? -1 : y(e, t, r, n, i);
                    if ("number" == typeof t) {
                        if (t &= 255, "function" == typeof Uint8Array.prototype.indexOf)
                            if (i) return Uint8Array.prototype.indexOf.call(e, t, r);
                            else return Uint8Array.prototype.lastIndexOf.call(e, t, r);
                        return y(e, [t], r, n, i)
                    }
                    throw TypeError("val must be string, number or Buffer")
                }

                function y(e, t, r, n, i) {
                    var o, s = 1,
                        a = e.length,
                        f = t.length;
                    if (void 0 !== n && ("ucs2" === (n = String(n).toLowerCase()) || "ucs-2" === n || "utf16le" === n || "utf-16le" === n)) {
                        if (e.length < 2 || t.length < 2) return -1;
                        s = 2, a /= 2, f /= 2, r /= 2
                    }

                    function u(e, t) {
                        return 1 === s ? e[t] : e.readUInt16BE(t * s)
                    }
                    if (i) {
                        var l = -1;
                        for (o = r; o < a; o++)
                            if (u(e, o) === u(t, -1 === l ? 0 : o - l)) {
                                if (-1 === l && (l = o), o - l + 1 === f) return l * s
                            } else - 1 !== l && (o -= o - l), l = -1
                    } else
                        for (r + f > a && (r = a - f), o = r; o >= 0; o--) {
                            for (var h = !0, c = 0; c < f; c++)
                                if (u(e, o + c) !== u(t, c)) {
                                    h = !1;
                                    break
                                } if (h) return o
                        }
                    return -1
                }
                a.isBuffer = function(e) {
                    return null != e && !0 === e._isBuffer && e !== a.prototype
                }, a.compare = function(e, t) {
                    if (S(e, Uint8Array) && (e = a.from(e, e.offset, e.byteLength)), S(t, Uint8Array) && (t = a.from(t, t.offset, t.byteLength)), !a.isBuffer(e) || !a.isBuffer(t)) throw TypeError('The "buf1", "buf2" arguments must be one of type Buffer or Uint8Array');
                    if (e === t) return 0;
                    for (var r = e.length, n = t.length, i = 0, o = Math.min(r, n); i < o; ++i)
                        if (e[i] !== t[i]) {
                            r = e[i], n = t[i];
                            break
                        } return r < n ? -1 : +(n < r)
                }, a.isEncoding = function(e) {
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
                }, a.concat = function(e, t) {
                    if (!Array.isArray(e)) throw TypeError('"list" argument must be an Array of Buffers');
                    if (0 === e.length) return a.alloc(0);
                    if (void 0 === t)
                        for (r = 0, t = 0; r < e.length; ++r) t += e[r].length;
                    var r, n = a.allocUnsafe(t),
                        i = 0;
                    for (r = 0; r < e.length; ++r) {
                        var o = e[r];
                        if (S(o, Uint8Array) && (o = a.from(o)), !a.isBuffer(o)) throw TypeError('"list" argument must be an Array of Buffers');
                        o.copy(n, i), i += o.length
                    }
                    return n
                }, a.byteLength = p, a.prototype._isBuffer = !0, a.prototype.swap16 = function() {
                    var e = this.length;
                    if (e % 2 != 0) throw RangeError("Buffer size must be a multiple of 16-bits");
                    for (var t = 0; t < e; t += 2) v(this, t, t + 1);
                    return this
                }, a.prototype.swap32 = function() {
                    var e = this.length;
                    if (e % 4 != 0) throw RangeError("Buffer size must be a multiple of 32-bits");
                    for (var t = 0; t < e; t += 4) v(this, t, t + 3), v(this, t + 1, t + 2);
                    return this
                }, a.prototype.swap64 = function() {
                    var e = this.length;
                    if (e % 8 != 0) throw RangeError("Buffer size must be a multiple of 64-bits");
                    for (var t = 0; t < e; t += 8) v(this, t, t + 7), v(this, t + 1, t + 6), v(this, t + 2, t + 5), v(this, t + 3, t + 4);
                    return this
                }, a.prototype.toString = function() {
                    var e = this.length;
                    return 0 === e ? "" : 0 == arguments.length ? E(this, 0, e) : d.apply(this, arguments)
                }, a.prototype.toLocaleString = a.prototype.toString, a.prototype.equals = function(e) {
                    if (!a.isBuffer(e)) throw TypeError("Argument must be a Buffer");
                    return this === e || 0 === a.compare(this, e)
                }, a.prototype.inspect = function() {
                    var e = "",
                        r = t.INSPECT_MAX_BYTES;
                    return e = this.toString("hex", 0, r).replace(/(.{2})/g, "$1 ").trim(), this.length > r && (e += " ... "), "<Buffer " + e + ">"
                }, o && (a.prototype[o] = a.prototype.inspect), a.prototype.compare = function(e, t, r, n, i) {
                    if (S(e, Uint8Array) && (e = a.from(e, e.offset, e.byteLength)), !a.isBuffer(e)) throw TypeError('The "target" argument must be one of type Buffer or Uint8Array. Received type ' + typeof e);
                    if (void 0 === t && (t = 0), void 0 === r && (r = e ? e.length : 0), void 0 === n && (n = 0), void 0 === i && (i = this.length), t < 0 || r > e.length || n < 0 || i > this.length) throw RangeError("out of range index");
                    if (n >= i && t >= r) return 0;
                    if (n >= i) return -1;
                    if (t >= r) return 1;
                    if (t >>>= 0, r >>>= 0, n >>>= 0, i >>>= 0, this === e) return 0;
                    for (var o = i - n, s = r - t, f = Math.min(o, s), u = this.slice(n, i), l = e.slice(t, r), h = 0; h < f; ++h)
                        if (u[h] !== l[h]) {
                            o = u[h], s = l[h];
                            break
                        } return o < s ? -1 : +(s < o)
                }, a.prototype.includes = function(e, t, r) {
                    return -1 !== this.indexOf(e, t, r)
                }, a.prototype.indexOf = function(e, t, r) {
                    return g(this, e, t, r, !0)
                }, a.prototype.lastIndexOf = function(e, t, r) {
                    return g(this, e, t, r, !1)
                };

                function E(e, t, r) {
                    r = Math.min(e.length, r);
                    for (var n = [], i = t; i < r;) {
                        var o, s, a, f, u = e[i],
                            l = null,
                            h = u > 239 ? 4 : u > 223 ? 3 : u > 191 ? 2 : 1;
                        if (i + h <= r) switch (h) {
                            case 1:
                                u < 128 && (l = u);
                                break;
                            case 2:
                                (192 & (o = e[i + 1])) == 128 && (f = (31 & u) << 6 | 63 & o) > 127 && (l = f);
                                break;
                            case 3:
                                o = e[i + 1], s = e[i + 2], (192 & o) == 128 && (192 & s) == 128 && (f = (15 & u) << 12 | (63 & o) << 6 | 63 & s) > 2047 && (f < 55296 || f > 57343) && (l = f);
                                break;
                            case 4:
                                o = e[i + 1], s = e[i + 2], a = e[i + 3], (192 & o) == 128 && (192 & s) == 128 && (192 & a) == 128 && (f = (15 & u) << 18 | (63 & o) << 12 | (63 & s) << 6 | 63 & a) > 65535 && f < 1114112 && (l = f)
                        }
                        null === l ? (l = 65533, h = 1) : l > 65535 && (l -= 65536, n.push(l >>> 10 & 1023 | 55296), l = 56320 | 1023 & l), n.push(l), i += h
                    }
                    var c = n,
                        p = c.length;
                    if (p <= 4096) return String.fromCharCode.apply(String, c);
                    for (var d = "", v = 0; v < p;) d += String.fromCharCode.apply(String, c.slice(v, v += 4096));
                    return d
                }

                function m(e, t, r) {
                    if (e % 1 != 0 || e < 0) throw RangeError("offset is not uint");
                    if (e + t > r) throw RangeError("Trying to access beyond buffer length")
                }

                function A(e, t, r, n, i, o) {
                    if (!a.isBuffer(e)) throw TypeError('"buffer" argument must be a Buffer instance');
                    if (t > i || t < o) throw RangeError('"value" argument is out of bounds');
                    if (r + n > e.length) throw RangeError("Index out of range")
                }

                function b(e, t, r, n, i, o) {
                    if (r + n > e.length || r < 0) throw RangeError("Index out of range")
                }

                function I(e, t, r, n, o) {
                    return t *= 1, r >>>= 0, o || b(e, t, r, 4, 34028234663852886e22, -34028234663852886e22), i.write(e, t, r, n, 23, 4), r + 4
                }

                function T(e, t, r, n, o) {
                    return t *= 1, r >>>= 0, o || b(e, t, r, 8, 17976931348623157e292, -17976931348623157e292), i.write(e, t, r, n, 52, 8), r + 8
                }
                a.prototype.write = function(e, t, r, n) {
                    if (void 0 === t) n = "utf8", r = this.length, t = 0;
                    else if (void 0 === r && "string" == typeof t) n = t, r = this.length, t = 0;
                    else if (isFinite(t)) t >>>= 0, isFinite(r) ? (r >>>= 0, void 0 === n && (n = "utf8")) : (n = r, r = void 0);
                    else throw Error("Buffer.write(string, encoding, offset[, length]) is no longer supported");
                    var i, o, s, a, f, u, l, h, c = this.length - t;
                    if ((void 0 === r || r > c) && (r = c), e.length > 0 && (r < 0 || t < 0) || t > this.length) throw RangeError("Attempt to write outside buffer bounds");
                    n || (n = "utf8");
                    for (var p = !1;;) switch (n) {
                        case "hex":
                            return function(e, t, r, n) {
                                r = Number(r) || 0;
                                var i = e.length - r;
                                n ? (n = Number(n)) > i && (n = i) : n = i;
                                var o = t.length;
                                n > o / 2 && (n = o / 2);
                                for (var s = 0; s < n; ++s) {
                                    var a, f = parseInt(t.substr(2 * s, 2), 16);
                                    if ((a = f) != a) break;
                                    e[r + s] = f
                                }
                                return s
                            }(this, e, t, r);
                        case "utf8":
                        case "utf-8":
                            return i = t, o = r, w(x(e, this.length - i), this, i, o);
                        case "ascii":
                            return s = t, a = r, w(R(e), this, s, a);
                        case "latin1":
                        case "binary":
                            return function(e, t, r, n) {
                                return w(R(t), e, r, n)
                            }(this, e, t, r);
                        case "base64":
                            return f = t, u = r, w(N(e), this, f, u);
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return l = t, h = r, w(function(e, t) {
                                for (var r, n, i = [], o = 0; o < e.length && !((t -= 2) < 0); ++o) n = (r = e.charCodeAt(o)) >> 8, i.push(r % 256), i.push(n);
                                return i
                            }(e, this.length - l), this, l, h);
                        default:
                            if (p) throw TypeError("Unknown encoding: " + n);
                            n = ("" + n).toLowerCase(), p = !0
                    }
                }, a.prototype.toJSON = function() {
                    return {
                        type: "Buffer",
                        data: Array.prototype.slice.call(this._arr || this, 0)
                    }
                }, a.prototype.slice = function(e, t) {
                    var r = this.length;
                    e = ~~e, t = void 0 === t ? r : ~~t, e < 0 ? (e += r) < 0 && (e = 0) : e > r && (e = r), t < 0 ? (t += r) < 0 && (t = 0) : t > r && (t = r), t < e && (t = e);
                    var n = this.subarray(e, t);
                    return Object.setPrototypeOf(n, a.prototype), n
                }, a.prototype.readUIntLE = function(e, t, r) {
                    e >>>= 0, t >>>= 0, r || m(e, t, this.length);
                    for (var n = this[e], i = 1, o = 0; ++o < t && (i *= 256);) n += this[e + o] * i;
                    return n
                }, a.prototype.readUIntBE = function(e, t, r) {
                    e >>>= 0, t >>>= 0, r || m(e, t, this.length);
                    for (var n = this[e + --t], i = 1; t > 0 && (i *= 256);) n += this[e + --t] * i;
                    return n
                }, a.prototype.readUInt8 = function(e, t) {
                    return e >>>= 0, t || m(e, 1, this.length), this[e]
                }, a.prototype.readUInt16LE = function(e, t) {
                    return e >>>= 0, t || m(e, 2, this.length), this[e] | this[e + 1] << 8
                }, a.prototype.readUInt16BE = function(e, t) {
                    return e >>>= 0, t || m(e, 2, this.length), this[e] << 8 | this[e + 1]
                }, a.prototype.readUInt32LE = function(e, t) {
                    return e >>>= 0, t || m(e, 4, this.length), (this[e] | this[e + 1] << 8 | this[e + 2] << 16) + 0x1000000 * this[e + 3]
                }, a.prototype.readUInt32BE = function(e, t) {
                    return e >>>= 0, t || m(e, 4, this.length), 0x1000000 * this[e] + (this[e + 1] << 16 | this[e + 2] << 8 | this[e + 3])
                }, a.prototype.readIntLE = function(e, t, r) {
                    e >>>= 0, t >>>= 0, r || m(e, t, this.length);
                    for (var n = this[e], i = 1, o = 0; ++o < t && (i *= 256);) n += this[e + o] * i;
                    return n >= (i *= 128) && (n -= Math.pow(2, 8 * t)), n
                }, a.prototype.readIntBE = function(e, t, r) {
                    e >>>= 0, t >>>= 0, r || m(e, t, this.length);
                    for (var n = t, i = 1, o = this[e + --n]; n > 0 && (i *= 256);) o += this[e + --n] * i;
                    return o >= (i *= 128) && (o -= Math.pow(2, 8 * t)), o
                }, a.prototype.readInt8 = function(e, t) {
                    return (e >>>= 0, t || m(e, 1, this.length), 128 & this[e]) ? -((255 - this[e] + 1) * 1) : this[e]
                }, a.prototype.readInt16LE = function(e, t) {
                    e >>>= 0, t || m(e, 2, this.length);
                    var r = this[e] | this[e + 1] << 8;
                    return 32768 & r ? 0xffff0000 | r : r
                }, a.prototype.readInt16BE = function(e, t) {
                    e >>>= 0, t || m(e, 2, this.length);
                    var r = this[e + 1] | this[e] << 8;
                    return 32768 & r ? 0xffff0000 | r : r
                }, a.prototype.readInt32LE = function(e, t) {
                    return e >>>= 0, t || m(e, 4, this.length), this[e] | this[e + 1] << 8 | this[e + 2] << 16 | this[e + 3] << 24
                }, a.prototype.readInt32BE = function(e, t) {
                    return e >>>= 0, t || m(e, 4, this.length), this[e] << 24 | this[e + 1] << 16 | this[e + 2] << 8 | this[e + 3]
                }, a.prototype.readFloatLE = function(e, t) {
                    return e >>>= 0, t || m(e, 4, this.length), i.read(this, e, !0, 23, 4)
                }, a.prototype.readFloatBE = function(e, t) {
                    return e >>>= 0, t || m(e, 4, this.length), i.read(this, e, !1, 23, 4)
                }, a.prototype.readDoubleLE = function(e, t) {
                    return e >>>= 0, t || m(e, 8, this.length), i.read(this, e, !0, 52, 8)
                }, a.prototype.readDoubleBE = function(e, t) {
                    return e >>>= 0, t || m(e, 8, this.length), i.read(this, e, !1, 52, 8)
                }, a.prototype.writeUIntLE = function(e, t, r, n) {
                    if (e *= 1, t >>>= 0, r >>>= 0, !n) {
                        var i = Math.pow(2, 8 * r) - 1;
                        A(this, e, t, r, i, 0)
                    }
                    var o = 1,
                        s = 0;
                    for (this[t] = 255 & e; ++s < r && (o *= 256);) this[t + s] = e / o & 255;
                    return t + r
                }, a.prototype.writeUIntBE = function(e, t, r, n) {
                    if (e *= 1, t >>>= 0, r >>>= 0, !n) {
                        var i = Math.pow(2, 8 * r) - 1;
                        A(this, e, t, r, i, 0)
                    }
                    var o = r - 1,
                        s = 1;
                    for (this[t + o] = 255 & e; --o >= 0 && (s *= 256);) this[t + o] = e / s & 255;
                    return t + r
                }, a.prototype.writeUInt8 = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || A(this, e, t, 1, 255, 0), this[t] = 255 & e, t + 1
                }, a.prototype.writeUInt16LE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || A(this, e, t, 2, 65535, 0), this[t] = 255 & e, this[t + 1] = e >>> 8, t + 2
                }, a.prototype.writeUInt16BE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || A(this, e, t, 2, 65535, 0), this[t] = e >>> 8, this[t + 1] = 255 & e, t + 2
                }, a.prototype.writeUInt32LE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || A(this, e, t, 4, 0xffffffff, 0), this[t + 3] = e >>> 24, this[t + 2] = e >>> 16, this[t + 1] = e >>> 8, this[t] = 255 & e, t + 4
                }, a.prototype.writeUInt32BE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || A(this, e, t, 4, 0xffffffff, 0), this[t] = e >>> 24, this[t + 1] = e >>> 16, this[t + 2] = e >>> 8, this[t + 3] = 255 & e, t + 4
                }, a.prototype.writeIntLE = function(e, t, r, n) {
                    if (e *= 1, t >>>= 0, !n) {
                        var i = Math.pow(2, 8 * r - 1);
                        A(this, e, t, r, i - 1, -i)
                    }
                    var o = 0,
                        s = 1,
                        a = 0;
                    for (this[t] = 255 & e; ++o < r && (s *= 256);) e < 0 && 0 === a && 0 !== this[t + o - 1] && (a = 1), this[t + o] = (e / s | 0) - a & 255;
                    return t + r
                }, a.prototype.writeIntBE = function(e, t, r, n) {
                    if (e *= 1, t >>>= 0, !n) {
                        var i = Math.pow(2, 8 * r - 1);
                        A(this, e, t, r, i - 1, -i)
                    }
                    var o = r - 1,
                        s = 1,
                        a = 0;
                    for (this[t + o] = 255 & e; --o >= 0 && (s *= 256);) e < 0 && 0 === a && 0 !== this[t + o + 1] && (a = 1), this[t + o] = (e / s | 0) - a & 255;
                    return t + r
                }, a.prototype.writeInt8 = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || A(this, e, t, 1, 127, -128), e < 0 && (e = 255 + e + 1), this[t] = 255 & e, t + 1
                }, a.prototype.writeInt16LE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || A(this, e, t, 2, 32767, -32768), this[t] = 255 & e, this[t + 1] = e >>> 8, t + 2
                }, a.prototype.writeInt16BE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || A(this, e, t, 2, 32767, -32768), this[t] = e >>> 8, this[t + 1] = 255 & e, t + 2
                }, a.prototype.writeInt32LE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || A(this, e, t, 4, 0x7fffffff, -0x80000000), this[t] = 255 & e, this[t + 1] = e >>> 8, this[t + 2] = e >>> 16, this[t + 3] = e >>> 24, t + 4
                }, a.prototype.writeInt32BE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || A(this, e, t, 4, 0x7fffffff, -0x80000000), e < 0 && (e = 0xffffffff + e + 1), this[t] = e >>> 24, this[t + 1] = e >>> 16, this[t + 2] = e >>> 8, this[t + 3] = 255 & e, t + 4
                }, a.prototype.writeFloatLE = function(e, t, r) {
                    return I(this, e, t, !0, r)
                }, a.prototype.writeFloatBE = function(e, t, r) {
                    return I(this, e, t, !1, r)
                }, a.prototype.writeDoubleLE = function(e, t, r) {
                    return T(this, e, t, !0, r)
                }, a.prototype.writeDoubleBE = function(e, t, r) {
                    return T(this, e, t, !1, r)
                }, a.prototype.copy = function(e, t, r, n) {
                    if (!a.isBuffer(e)) throw TypeError("argument should be a Buffer");
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
                }, a.prototype.fill = function(e, t, r, n) {
                    if ("string" == typeof e) {
                        if ("string" == typeof t ? (n = t, t = 0, r = this.length) : "string" == typeof r && (n = r, r = this.length), void 0 !== n && "string" != typeof n) throw TypeError("encoding must be a string");
                        if ("string" == typeof n && !a.isEncoding(n)) throw TypeError("Unknown encoding: " + n);
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
                        var s = a.isBuffer(e) ? e : a.from(e, n),
                            f = s.length;
                        if (0 === f) throw TypeError('The value "' + e + '" is invalid for argument "value"');
                        for (i = 0; i < r - t; ++i) this[i + t] = s[i % f]
                    }
                    return this
                };
                var _ = /[^+/0-9A-Za-z-_]/g;

                function x(e, t) {
                    t = t || 1 / 0;
                    for (var r, n = e.length, i = null, o = [], s = 0; s < n; ++s) {
                        if ((r = e.charCodeAt(s)) > 55295 && r < 57344) {
                            if (!i) {
                                if (r > 56319 || s + 1 === n) {
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

                function R(e) {
                    for (var t = [], r = 0; r < e.length; ++r) t.push(255 & e.charCodeAt(r));
                    return t
                }

                function N(e) {
                    return n.toByteArray(function(e) {
                        if ((e = (e = e.split("=")[0]).trim().replace(_, "")).length < 2) return "";
                        for (; e.length % 4 != 0;) e += "=";
                        return e
                    }(e))
                }

                function w(e, t, r, n) {
                    for (var i = 0; i < n && !(i + r >= t.length) && !(i >= e.length); ++i) t[i + r] = e[i];
                    return i
                }

                function S(e, t) {
                    return e instanceof t || null != e && null != e.constructor && null != e.constructor.name && e.constructor.name === t.name
                }
                var M = function() {
                    for (var e = "0123456789abcdef", t = Array(256), r = 0; r < 16; ++r)
                        for (var n = 16 * r, i = 0; i < 16; ++i) t[n + i] = e[r] + e[i];
                    return t
                }()
            },
            321: function(e, t) {
                t.read = function(e, t, r, n, i) {
                    var o, s, a = 8 * i - n - 1,
                        f = (1 << a) - 1,
                        u = f >> 1,
                        l = -7,
                        h = r ? i - 1 : 0,
                        c = r ? -1 : 1,
                        p = e[t + h];
                    for (h += c, o = p & (1 << -l) - 1, p >>= -l, l += a; l > 0; o = 256 * o + e[t + h], h += c, l -= 8);
                    for (s = o & (1 << -l) - 1, o >>= -l, l += n; l > 0; s = 256 * s + e[t + h], h += c, l -= 8);
                    if (0 === o) o = 1 - u;
                    else {
                        if (o === f) return s ? NaN : 1 / 0 * (p ? -1 : 1);
                        s += Math.pow(2, n), o -= u
                    }
                    return (p ? -1 : 1) * s * Math.pow(2, o - n)
                }, t.write = function(e, t, r, n, i, o) {
                    var s, a, f, u = 8 * o - i - 1,
                        l = (1 << u) - 1,
                        h = l >> 1,
                        c = 5960464477539062e-23 * (23 === i),
                        p = n ? 0 : o - 1,
                        d = n ? 1 : -1,
                        v = +(t < 0 || 0 === t && 1 / t < 0);
                    for (isNaN(t = Math.abs(t)) || t === 1 / 0 ? (a = +!!isNaN(t), s = l) : (s = Math.floor(Math.log(t) / Math.LN2), t * (f = Math.pow(2, -s)) < 1 && (s--, f *= 2), s + h >= 1 ? t += c / f : t += c * Math.pow(2, 1 - h), t * f >= 2 && (s++, f /= 2), s + h >= l ? (a = 0, s = l) : s + h >= 1 ? (a = (t * f - 1) * Math.pow(2, i), s += h) : (a = t * Math.pow(2, h - 1) * Math.pow(2, i), s = 0)); i >= 8; e[r + p] = 255 & a, p += d, a /= 256, i -= 8);
                    for (s = s << i | a, u += i; u > 0; e[r + p] = 255 & s, p += d, s /= 256, u -= 8);
                    e[r + p - d] |= 128 * v
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
            s = !0;
        try {
            n[e](r, r.exports, o), s = !1
        } finally {
            s && delete i[e]
        }
        return r.exports
    }
    o.ab = "/ROOT/node_modules/.pnpm/next@16.3.0_@babel+core@7.29.0_@opentelemetry+api@1.9.1_@playwright+test@1.61.1_@types+_379fb98fecc9fc5f7bce6eca48d1b2a5/node_modules/next/dist/compiled/buffer/", t.exports = o(230)
}]);

//# debugId=b66e40d7-37d3-c4f1-43b4-abdbd6f0dbcf
//# sourceMappingURL=1cc0dhnwg2s0j.js.map
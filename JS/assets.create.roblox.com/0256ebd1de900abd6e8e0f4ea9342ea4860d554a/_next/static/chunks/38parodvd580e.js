;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "7dd8abd0-de82-b4e3-4efd-674993c9216c")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 118413, e => {
    "use strict";
    var t = e.i(157700);
    let n = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isLimitedAnalyticsAdminMonitoringNavigationEnabled",
            defaultValue: !1
        }),
        a = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "visibleAssetIdInPersonalizationEnabled",
            defaultValue: !1
        }),
        r = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isExperienceAlertsEnabled",
            defaultValue: !0
        }),
        i = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isOwnershipWatermarkEnabled",
            defaultValue: !0
        }),
        s = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isExperimentationTemplatesEnabled",
            defaultValue: !1
        }),
        o = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isExperimentTargetingEnabled",
            defaultValue: !0
        }),
        l = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isErrorReportV2Enabled",
            defaultValue: !0
        }),
        u = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isErrorReportNewPlaceVersionLiveBannerEnabled",
            defaultValue: !0
        }),
        d = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isErrorReportSuggestedRulesEnabled",
            defaultValue: !0
        }),
        c = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isFirstSeenColumnEnabled",
            defaultValue: !0
        }),
        p = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isAceL7SmoothingEnabled",
            defaultValue: !0
        }),
        m = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "sentryChartTracingEnabled",
            defaultValue: !1
        }),
        v = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "acquisitionMigrationMetricsEnabled",
            defaultValue: !1
        }),
        f = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isTargetingConfigsEnabled",
            defaultValue: !0
        }),
        h = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isExperimentNullControlValueEnabled",
            defaultValue: !0
        }),
        y = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isExperimentRolloutEnabled",
            defaultValue: !0
        }),
        g = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "IsGeneralBreakGlassBannerEnabled",
            defaultValue: !1
        }),
        w = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "IsMonetizationBreakGlassBannerEnabled",
            defaultValue: !1
        }),
        I = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isPlayerFeedbackExampleCommentsEnabled",
            defaultValue: !1
        }),
        T = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isAnalyticsAssistantChatEnabled",
            defaultValue: !1
        }),
        b = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isAnalyticsAssistantIssueBannerEnabled",
            defaultValue: !1
        }),
        R = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "showCreatorRewardsReportingDisclaimer",
            defaultValue: !1
        }),
        S = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isClientScriptCPUTimeEnabled",
            defaultValue: !0
        }),
        E = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isRotraceMetricEnabled",
            defaultValue: !1
        }),
        x = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isTelemetryMigrationEnabled",
            defaultValue: !1
        }),
        M = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "showVideoServiceDashboard",
            defaultValue: !1
        }),
        A = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isTreemapColorBySiblingProportionEnabled",
            defaultValue: !1
        }),
        q = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isAssistantChartOverflowMenuEnabled",
            defaultValue: !1
        }),
        P = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isAnalyticsMetricAwareYAxisFormatterEnabled",
            defaultValue: !1
        }),
        C = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isCustomDashboardsEnabled",
            defaultValue: !1
        }),
        D = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isCustomDashboardsLocalStorageEnabled",
            defaultValue: !1
        }),
        F = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isCustomDashboardsApiBackendEnabled",
            defaultValue: !1
        }),
        O = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isFunnelCohortCompletionRateEnabled",
            defaultValue: !0
        }),
        z = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isJourneyEventsEnabled",
            defaultValue: !1
        }),
        V = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isClientSessionsEnabled",
            defaultValue: !1
        });
    e.s(["acquisitionMigrationMetricsEnabled", 0, v, "isAceL7SmoothingEnabled", 0, p, "isAnalyticsAssistantChatEnabled", 0, T, "isAnalyticsAssistantIssueBannerEnabled", 0, b, "isAnalyticsMetricAwareYAxisFormatterEnabled", 0, P, "isAssistantChartOverflowMenuEnabled", 0, q, "isClientScriptCpuTimeEnabled", 0, S, "isClientSessionsEnabled", 0, V, "isCustomDashboardsApiBackendEnabled", 0, F, "isCustomDashboardsEnabled", 0, C, "isCustomDashboardsLocalStorageEnabled", 0, D, "isErrorReportNewPlaceVersionLiveBannerEnabled", 0, u, "isErrorReportSuggestedRulesEnabled", 0, d, "isErrorReportV2Enabled", 0, l, "isExperienceAlertsEnabled", 0, r, "isExperimentNullControlValueEnabled", 0, h, "isExperimentRolloutEnabled", 0, y, "isExperimentTargetingEnabled", 0, o, "isExperimentationTemplatesEnabled", 0, s, "isFirstSeenColumnEnabled", 0, c, "isFunnelCohortCompletionRateEnabled", 0, O, "isGeneralBreakGlassBannerEnabled", 0, g, "isJourneyEventsEnabled", 0, z, "isLimitedAnalyticsAdminMonitoringNavigationEnabled", 0, n, "isMonetizationBreakGlassBannerEnabled", 0, w, "isOwnershipWatermarkEnabled", 0, i, "isPlayerFeedbackExampleCommentsEnabled", 0, I, "isRotraceMetricEnabled", 0, E, "isTargetingConfigsEnabled", 0, f, "isTelemetryMigrationEnabled", 0, x, "isTreemapColorBySiblingProportionEnabled", 0, A, "sentryChartTracingEnabled", 0, m, "showCreatorRewardsReportingDisclaimer", 0, R, "showVideoServiceDashboard", 0, M, "visibleAssetIdInPersonalizationEnabled", 0, a])
}, 846854, e => {
    "use strict";
    var t = e.i(677753),
        n = function(e, t) {
            return (n = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
            })(e, t)
        };

    function a(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function a() {
            this.constructor = e
        }
        n(e, t), e.prototype = null === t ? Object.create(t) : (a.prototype = t.prototype, new a)
    }

    function r(e, t, n, a) {
        return new(n || (n = Promise))(function(r, i) {
            function s(e) {
                try {
                    l(a.next(e))
                } catch (e) {
                    i(e)
                }
            }

            function o(e) {
                try {
                    l(a.throw(e))
                } catch (e) {
                    i(e)
                }
            }

            function l(e) {
                var t;
                e.done ? r(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(s, o)
            }
            l((a = a.apply(e, t || [])).next())
        })
    }

    function i(e, t) {
        var n, a, r, i = {
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
                var u = [o, l];
                if (n) throw TypeError("Generator is already executing.");
                for (; s && (s = 0, u[0] && (i = 0)), i;) try {
                    if (n = 1, a && (r = 2 & u[0] ? a.return : u[0] ? a.throw || ((r = a.return) && r.call(a), 0) : a.next) && !(r = r.call(a, u[1])).done) return r;
                    switch (a = 0, r && (u = [2 & u[0], r.value]), u[0]) {
                        case 0:
                        case 1:
                            r = u;
                            break;
                        case 4:
                            return i.label++, {
                                value: u[1],
                                done: !1
                            };
                        case 5:
                            i.label++, a = u[1], u = [0];
                            continue;
                        case 7:
                            u = i.ops.pop(), i.trys.pop();
                            continue;
                        default:
                            if (!(r = (r = i.trys).length > 0 && r[r.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                i = 0;
                                continue
                            }
                            if (3 === u[0] && (!r || u[1] > r[0] && u[1] < r[3])) {
                                i.label = u[1];
                                break
                            }
                            if (6 === u[0] && i.label < r[1]) {
                                i.label = r[1], r = u;
                                break
                            }
                            if (r && i.label < r[2]) {
                                i.label = r[2], i.ops.push(u);
                                break
                            }
                            r[2] && i.ops.pop(), i.trys.pop();
                            continue
                    }
                    u = t.call(e, i)
                } catch (e) {
                    u = [6, e], a = 0
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

    function s(e) {
        return e
    }

    function o(e) {
        var n;
        return null == (n = e) ? n : {
            metrics: (0, t.exists)(n, "metrics") ? null === n.metrics ? null : n.metrics.map(s) : void 0,
            startDate: (0, t.exists)(n, "startDate") ? new Date(n.startDate) : void 0,
            endDate: (0, t.exists)(n, "endDate") ? n.endDate : void 0
        }
    }

    function l(e) {
        return e
    }

    function u(e) {
        var n;
        return null == (n = e) ? n : {
            name: (0, t.exists)(n, "name") ? n.name : void 0,
            salesType: (0, t.exists)(n, "salesType") ? n.salesType : void 0,
            targetIdString: (0, t.exists)(n, "targetIdString") ? n.targetIdString : void 0,
            totalQuantity: (0, t.exists)(n, "totalQuantity") ? n.totalQuantity : void 0,
            quantityLeft: (0, t.exists)(n, "quantityLeft") ? n.quantityLeft : void 0,
            targetId: (0, t.exists)(n, "targetId") ? n.targetId : void 0,
            targetType: (0, t.exists)(n, "targetType") ? n.targetType : void 0,
            salesCount: (0, t.exists)(n, "salesCount") ? n.salesCount : void 0,
            revenue: (0, t.exists)(n, "revenue") ? n.revenue : void 0,
            price: (0, t.exists)(n, "price") ? n.price : void 0,
            isOnSale: (0, t.exists)(n, "isOnSale") ? n.isOnSale : void 0,
            createdTime: (0, t.exists)(n, "createdTime") ? new Date(n.createdTime) : void 0
        }
    }

    function d(e) {
        if (void 0 !== e) return null === e ? null : {
            dimension: e.dimension,
            values: e.values
        }
    }

    function c(e) {
        return e
    }

    function p(e) {
        if (void 0 !== e) return null === e ? null : {
            dimension: e.dimension,
            values: e.values
        }
    }

    function m(e) {
        var n;
        return null == (n = e) ? n : {
            dimension: (0, t.exists)(n, "dimension") ? n.dimension : void 0,
            value: (0, t.exists)(n, "value") ? n.value : void 0,
            displayValue: (0, t.exists)(n, "displayValue") ? n.displayValue : void 0
        }
    }

    function v(e) {
        var n;
        return null == (n = e) ? n : {
            timestamp: (0, t.exists)(n, "timestamp") ? new Date(n.timestamp) : void 0,
            value: (0, t.exists)(n, "value") ? n.value : void 0,
            tag: (0, t.exists)(n, "tag") ? n.tag : void 0
        }
    }

    function f(e) {
        var n;
        return null == (n = e) ? n : {
            percentile: (0, t.exists)(n, "percentile") ? n.percentile : void 0,
            curValue: (0, t.exists)(n, "curValue") ? n.curValue : void 0,
            prevValue: (0, t.exists)(n, "prevValue") ? n.prevValue : void 0,
            delta: (0, t.exists)(n, "delta") ? n.delta : void 0,
            periodStartDate: (0, t.exists)(n, "periodStartDate") ? new Date(n.periodStartDate) : void 0,
            periodEndDate: (0, t.exists)(n, "periodEndDate") ? new Date(n.periodEndDate) : void 0,
            universeCreatedDate: (0, t.exists)(n, "universeCreatedDate") ? new Date(n.universeCreatedDate) : void 0
        }
    }

    function h(e) {
        var n;
        return null == (n = e) ? n : {
            universeId: n.universeId,
            insight: n.insight,
            data: (0, t.mapValues)(n.data, f),
            entryIds: n.entryIds
        }
    }

    function y(e) {
        var n;
        return null == (n = e) ? n : {
            breakdowns: (0, t.exists)(n, "breakdowns") ? null === n.breakdowns ? null : n.breakdowns.map(m) : void 0,
            datapoints: (0, t.exists)(n, "datapoints") ? null === n.datapoints ? null : n.datapoints.map(v) : void 0
        }
    }

    function g(e) {
        var n;
        return null == (n = e) ? n : {
            name: (0, t.exists)(n, "name") ? n.name : void 0,
            targetIdString: (0, t.exists)(n, "targetIdString") ? n.targetIdString : void 0,
            targetId: (0, t.exists)(n, "targetId") ? n.targetId : void 0,
            productId: (0, t.exists)(n, "productId") ? n.productId : void 0,
            targetType: (0, t.exists)(n, "targetType") ? n.targetType : void 0,
            price: (0, t.exists)(n, "price") ? n.price : void 0,
            salesCount: (0, t.exists)(n, "salesCount") ? n.salesCount : void 0,
            revenue: (0, t.exists)(n, "revenue") ? n.revenue : void 0,
            isOnSale: (0, t.exists)(n, "isOnSale") ? n.isOnSale : void 0
        }
    }

    function w(e) {
        if (void 0 !== e) return null === e ? null : {
            dimension: e.dimension,
            values: e.values
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function I(e, n) {
        return null == e ? e : {
            values: (0, t.exists)(e, "values") ? null === e.values ? null : e.values.map(y) : void 0,
            inProgress: (0, t.exists)(e, "inProgress") ? e.inProgress : void 0
        }
    }
    var T = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return a(n, e), n.prototype.analyticsHomeGetAnalyticsHomeTabOrderRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, s;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.ownerType || void 0 === e.ownerType) throw new t.RequiredError("ownerType", "Required parameter requestParameters.ownerType was null or undefined when calling analyticsHomeGetAnalyticsHomeTabOrder.");
                                if (null === e.ownerId || void 0 === e.ownerId) throw new t.RequiredError("ownerId", "Required parameter requestParameters.ownerId was null or undefined when calling analyticsHomeGetAnalyticsHomeTabOrder.");
                                return a = {}, r = {}, [4, this.request({
                                    path: "/v1/analytics-home/order/{ownerType}/{ownerId}".replace("{".concat("ownerType", "}"), encodeURIComponent(String(e.ownerType))).replace("{".concat("ownerId", "}"), encodeURIComponent(String(e.ownerId))),
                                    schemaPath: "/v1/analytics-home/order/{ownerType}/{ownerId}",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return s = i.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        homeTabOrders: e.homeTabOrders.map(l)
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.analyticsHomeGetAnalyticsHomeTabOrder = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.analyticsHomeGetAnalyticsHomeTabOrderRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t.BaseAPI),
        b = (function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            a(n, e), n.prototype.avatarMonetizationDetailsGetTopAvatarItemsRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, s;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.ownerType || void 0 === e.ownerType) throw new t.RequiredError("ownerType", "Required parameter requestParameters.ownerType was null or undefined when calling avatarMonetizationDetailsGetTopAvatarItems.");
                                if (null === e.ownerId || void 0 === e.ownerId) throw new t.RequiredError("ownerId", "Required parameter requestParameters.ownerId was null or undefined when calling avatarMonetizationDetailsGetTopAvatarItems.");
                                if (null === e.avatarMonetizationDetailsGetTopAvatarItemsRequest || void 0 === e.avatarMonetizationDetailsGetTopAvatarItemsRequest) throw new t.RequiredError("avatarMonetizationDetailsGetTopAvatarItemsRequest", "Required parameter requestParameters.avatarMonetizationDetailsGetTopAvatarItemsRequest was null or undefined when calling avatarMonetizationDetailsGetTopAvatarItems.");
                                return a = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/details/avatar/owner/{ownerType}/{ownerId}".replace("{".concat("ownerType", "}"), encodeURIComponent(String(e.ownerType))).replace("{".concat("ownerId", "}"), encodeURIComponent(String(e.ownerId))),
                                    schemaPath: "/v1/details/avatar/owner/{ownerType}/{ownerId}",
                                    method: "POST",
                                    headers: r,
                                    query: a,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            startTime: void 0 === e.startTime ? void 0 : e.startTime.toISOString(),
                                            endTime: void 0 === e.endTime ? void 0 : e.endTime.toISOString(),
                                            sortOrder: e.sortOrder,
                                            filters: void 0 === e.filters ? void 0 : null === e.filters ? null : e.filters.map(d),
                                            pagination: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    pageSize: e.pageSize,
                                                    paginationToken: e.paginationToken
                                                }
                                            }(e.pagination)
                                        }
                                    }(e.avatarMonetizationDetailsGetTopAvatarItemsRequest)
                                }, n)];
                            case 1:
                                return s = i.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        values: (0, t.exists)(e, "values") ? null === e.values ? null : e.values.map(u) : void 0,
                                        total: (0, t.exists)(e, "total") ? e.total : void 0,
                                        nextPaginationToken: (0, t.exists)(e, "nextPaginationToken") ? e.nextPaginationToken : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.avatarMonetizationDetailsGetTopAvatarItems = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.avatarMonetizationDetailsGetTopAvatarItemsRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }
        }(t.BaseAPI), function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            a(n, e), n.prototype.avatarMonetizationMetricsQueryMetricRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, s;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.ownerType || void 0 === e.ownerType) throw new t.RequiredError("ownerType", "Required parameter requestParameters.ownerType was null or undefined when calling avatarMonetizationMetricsQueryMetric.");
                                if (null === e.ownerId || void 0 === e.ownerId) throw new t.RequiredError("ownerId", "Required parameter requestParameters.ownerId was null or undefined when calling avatarMonetizationMetricsQueryMetric.");
                                if (null === e.avatarMonetizationMetricsQueryMetricRequest || void 0 === e.avatarMonetizationMetricsQueryMetricRequest) throw new t.RequiredError("avatarMonetizationMetricsQueryMetricRequest", "Required parameter requestParameters.avatarMonetizationMetricsQueryMetricRequest was null or undefined when calling avatarMonetizationMetricsQueryMetric.");
                                return a = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/metrics/avatar/owner/{ownerType}/{ownerId}".replace("{".concat("ownerType", "}"), encodeURIComponent(String(e.ownerType))).replace("{".concat("ownerId", "}"), encodeURIComponent(String(e.ownerId))),
                                    schemaPath: "/v1/metrics/avatar/owner/{ownerType}/{ownerId}",
                                    method: "POST",
                                    headers: r,
                                    query: a,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            metric: e.metric,
                                            aggregationType: e.aggregationType,
                                            granularity: e.granularity,
                                            startTime: void 0 === e.startTime ? void 0 : e.startTime.toISOString(),
                                            endTime: void 0 === e.endTime ? void 0 : e.endTime.toISOString(),
                                            breakdown: void 0 === e.breakdown ? void 0 : null === e.breakdown ? null : e.breakdown.map(c),
                                            filters: void 0 === e.filters ? void 0 : null === e.filters ? null : e.filters.map(p)
                                        }
                                    }(e.avatarMonetizationMetricsQueryMetricRequest)
                                }, n)];
                            case 1:
                                return s = i.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return I(e)
                                })]
                        }
                    })
                })
            }, n.prototype.avatarMonetizationMetricsQueryMetric = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.avatarMonetizationMetricsQueryMetricRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }
        }(t.BaseAPI), function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return a(n, e), n.prototype.featurePermissionsGetFeatureFlagsRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, s;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return a = {}, e.flags && (a["flags[]"] = e.flags), r = {}, [4, this.request({
                                    path: "/v1/feature-flags",
                                    schemaPath: "/v1/feature-flags",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return s = i.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        flags: e.flags
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.featurePermissionsGetFeatureFlags = function() {
                return r(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.featurePermissionsGetFeatureFlagsRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.featurePermissionsGetFeaturePermissionRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, s;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return a = {}, void 0 !== e.universeId && (a.universeId = e.universeId), e.flags && (a["flags[]"] = e.flags), r = {}, [4, this.request({
                                    path: "/v1/feature-permissions",
                                    schemaPath: "/v1/feature-permissions",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return s = i.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        userCanViewAnalyticsForUniverse: e.userCanViewAnalyticsForUniverse,
                                        userCanManageAnalyticsAlertForUniverse: e.userCanManageAnalyticsAlertForUniverse,
                                        canSaveCustomDashboards: e.canSaveCustomDashboards,
                                        experienceHasPerformanceMonitoringAccess: e.experienceHasPerformanceMonitoringAccess,
                                        newCreatorOverviewPageAccess: e.newCreatorOverviewPageAccess,
                                        experienceHasInsightsAccess: (0, t.exists)(e, "experienceHasInsightsAccess") ? e.experienceHasInsightsAccess : void 0,
                                        experienceHasPersonalizationDynamicPrior: (0, t.exists)(e, "experienceHasPersonalizationDynamicPrior") ? e.experienceHasPersonalizationDynamicPrior : void 0,
                                        experienceHasExperimentationMinDau: (0, t.exists)(e, "experienceHasExperimentationMinDau") ? e.experienceHasExperimentationMinDau : void 0,
                                        experienceHasNoInGameExperiment: (0, t.exists)(e, "experienceHasNoInGameExperiment") ? e.experienceHasNoInGameExperiment : void 0,
                                        flags: e.flags
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.featurePermissionsGetFeaturePermission = function() {
                return r(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.featurePermissionsGetFeaturePermissionRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t.BaseAPI)),
        R = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return a(n, e), n.prototype.modalHistoryRecordUserSeenModalRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, s;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.modalId || void 0 === e.modalId) throw new t.RequiredError("modalId", "Required parameter requestParameters.modalId was null or undefined when calling modalHistoryRecordUserSeenModal.");
                                return a = {}, r = {}, [4, this.request({
                                    path: "/v1/modal-history/modals/{modalId}/views".replace("{".concat("modalId", "}"), encodeURIComponent(String(e.modalId))),
                                    schemaPath: "/v1/modal-history/modals/{modalId}/views",
                                    method: "POST",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return s = i.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        shouldSeeModal: e.shouldSeeModal
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.modalHistoryRecordUserSeenModal = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.modalHistoryRecordUserSeenModalRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.modalHistoryShouldUserSeeModalRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, s;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.modalId || void 0 === e.modalId) throw new t.RequiredError("modalId", "Required parameter requestParameters.modalId was null or undefined when calling modalHistoryShouldUserSeeModal.");
                                return a = {}, r = {}, [4, this.request({
                                    path: "/v1/modal-history/modals/{modalId}/visibility".replace("{".concat("modalId", "}"), encodeURIComponent(String(e.modalId))),
                                    schemaPath: "/v1/modal-history/modals/{modalId}/visibility",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return s = i.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        shouldSeeModal: e.shouldSeeModal
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.modalHistoryShouldUserSeeModal = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.modalHistoryShouldUserSeeModalRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t.BaseAPI),
        S = (function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            a(n, e), n.prototype.monetizationDetailsGetTopItemsRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, s;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling monetizationDetailsGetTopItems.");
                                if (null === e.monetizationDetailsGetTopItemsRequest || void 0 === e.monetizationDetailsGetTopItemsRequest) throw new t.RequiredError("monetizationDetailsGetTopItemsRequest", "Required parameter requestParameters.monetizationDetailsGetTopItemsRequest was null or undefined when calling monetizationDetailsGetTopItems.");
                                return a = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/details/monetization/topitems/universes/{universeId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/details/monetization/topitems/universes/{universeId}",
                                    method: "POST",
                                    headers: r,
                                    query: a,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            monetizationDetailType: e.monetizationDetailType,
                                            startTime: void 0 === e.startTime ? void 0 : e.startTime.toISOString(),
                                            endTime: void 0 === e.endTime ? void 0 : e.endTime.toISOString(),
                                            sortOrder: e.sortOrder,
                                            filters: void 0 === e.filters ? void 0 : null === e.filters ? null : e.filters.map(w),
                                            pagination: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    pageSize: e.pageSize,
                                                    paginationToken: e.paginationToken
                                                }
                                            }(e.pagination),
                                            granularity: e.granularity
                                        }
                                    }(e.monetizationDetailsGetTopItemsRequest)
                                }, n)];
                            case 1:
                                return s = i.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        values: (0, t.exists)(e, "values") ? null === e.values ? null : e.values.map(g) : void 0,
                                        total: (0, t.exists)(e, "total") ? e.total : void 0,
                                        nextPaginationToken: (0, t.exists)(e, "nextPaginationToken") ? e.nextPaginationToken : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.monetizationDetailsGetTopItems = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.monetizationDetailsGetTopItemsRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }
        }(t.BaseAPI), function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            a(n, e), n.prototype.monetizationMetricsControllerV2QueryMetricRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, s;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling monetizationMetricsControllerV2QueryMetric.");
                                if (null === e.monetizationMetricsControllerV2QueryMetricRequest || void 0 === e.monetizationMetricsControllerV2QueryMetricRequest) throw new t.RequiredError("monetizationMetricsControllerV2QueryMetricRequest", "Required parameter requestParameters.monetizationMetricsControllerV2QueryMetricRequest was null or undefined when calling monetizationMetricsControllerV2QueryMetric.");
                                return a = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v2/metrics/monetization/universes/{universeId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v2/metrics/monetization/universes/{universeId}",
                                    method: "POST",
                                    headers: r,
                                    query: a,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            metric: e.metric,
                                            aggregationType: e.aggregationType,
                                            granularity: e.granularity,
                                            startTime: void 0 === e.startTime ? void 0 : e.startTime.toISOString(),
                                            endTime: void 0 === e.endTime ? void 0 : e.endTime.toISOString(),
                                            breakdown: void 0 === e.breakdown ? void 0 : null === e.breakdown ? null : e.breakdown.map(c),
                                            filters: void 0 === e.filters ? void 0 : null === e.filters ? null : e.filters.map(p)
                                        }
                                    }(e.monetizationMetricsControllerV2QueryMetricRequest)
                                }, n)];
                            case 1:
                                return s = i.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return I(e)
                                })]
                        }
                    })
                })
            }, n.prototype.monetizationMetricsControllerV2QueryMetric = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.monetizationMetricsControllerV2QueryMetricRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }
        }(t.BaseAPI), function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return a(n, e), n.prototype.universeAnalyticsAggregationsGetMetadataRaw = function(e) {
                return r(this, void 0, void 0, function() {
                    var n, a, r;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return n = {}, a = {}, [4, this.request({
                                    path: "/v1/metadata",
                                    schemaPath: "/v1/metadata",
                                    method: "GET",
                                    headers: a,
                                    query: n
                                }, e)];
                            case 1:
                                return r = i.sent(), [2, new t.JSONApiResponse(r, function(e) {
                                    return null == e ? e : {
                                        maxDataPointsForQuerying: (0, t.exists)(e, "maxDataPointsForQuerying") ? e.maxDataPointsForQuerying : void 0,
                                        minimalDateForQuerying: (0, t.exists)(e, "minimalDateForQuerying") ? new Date(e.minimalDateForQuerying) : void 0,
                                        maximalDateForQuerying: (0, t.exists)(e, "maximalDateForQuerying") ? new Date(e.maximalDateForQuerying) : void 0,
                                        defaultDataPointsForQuerying: (0, t.exists)(e, "defaultDataPointsForQuerying") ? e.defaultDataPointsForQuerying : void 0,
                                        openIssues: (0, t.exists)(e, "openIssues") ? null === e.openIssues ? null : e.openIssues.map(o) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.universeAnalyticsAggregationsGetMetadata = function(e) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.universeAnalyticsAggregationsGetMetadataRaw(e)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, n
        }(t.BaseAPI));
    (function(e) {
        function n() {
            return null !== e && e.apply(this, arguments) || this
        }
        a(n, e), n.prototype.universeInsightsGetUniverseInsightsRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var a, r, s;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling universeInsightsGetUniverseInsights.");
                            return a = {}, r = {}, [4, this.request({
                                path: "/v1/insights/universes/{universeId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/insights/universes/{universeId}",
                                method: "GET",
                                headers: r,
                                query: a
                            }, n)];
                        case 1:
                            return s = i.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return null == e ? e : {
                                    insightSummaries: e.insightSummaries.map(h),
                                    startTime: new Date(e.startTime),
                                    endTime: new Date(e.endTime)
                                }
                            })]
                    }
                })
            })
        }, n.prototype.universeInsightsGetUniverseInsights = function(e, t) {
            return r(this, void 0, void 0, function() {
                return i(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.universeInsightsGetUniverseInsightsRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.universeInsightsSnoozeInsightRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var a, r, s;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling universeInsightsSnoozeInsight.");
                            return a = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/insights/universes/{universeId}/snooze".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/insights/universes/{universeId}/snooze",
                                method: "POST",
                                headers: r,
                                query: a,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        insightType: e.insightType
                                    }
                                }(e.universeInsightsSnoozeInsightRequest)
                            }, n)];
                        case 1:
                            return s = i.sent(), [2, new t.JSONApiResponse(s)]
                    }
                })
            })
        }, n.prototype.universeInsightsSnoozeInsight = function(e, t) {
            return r(this, void 0, void 0, function() {
                return i(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.universeInsightsSnoozeInsightRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }
    })(t.BaseAPI), e.s(["AnalyticsHomeApi", 0, T, "AnalyticsHomeTab", 0, {
        Experience: "Experience",
        Avatar: "Avatar"
    }, "AvatarMonetizationDetailsSortOrder", 0, {
        SalesCount: "SalesCount",
        Revenue: "Revenue",
        CreatedTime: "CreatedTime"
    }, "Dimension", 0, {
        Country: "Country",
        Locale: "Locale",
        AgeGroup: "AgeGroup",
        OperatingSystem: "OperatingSystem",
        Platform: "Platform",
        RevenueSource: "RevenueSource",
        Gender: "Gender",
        Product: "Product",
        Source: "Source",
        FunnelSource: "FunnelSource",
        IsNewUser: "IsNewUser",
        SessionTimeBucket: "SessionTimeBucket",
        TopCountries: "TopCountries",
        TopLocales: "TopLocales"
    }, "FeaturePermissionsApi", 0, b, "MetricGranularity", 0, {
        OneHour: "OneHour",
        OneDay: "OneDay",
        OneWeek: "OneWeek",
        WithoutGrouping: "WithoutGrouping"
    }, "ModalHistoryApi", 0, R, "OwnerType", 0, {
        User: "User",
        Group: "Group"
    }, "SalesType", 0, {
        Unlimited: "Unlimited",
        Limited: "Limited"
    }, "UniverseAnalyticsAggregationsApi", 0, S])
}]);

//# debugId=7dd8abd0-de82-b4e3-4efd-674993c9216c
//# sourceMappingURL=296su4padddrs.js.map
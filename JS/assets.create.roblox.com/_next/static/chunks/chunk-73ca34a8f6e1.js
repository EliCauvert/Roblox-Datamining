;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "6e099c8f-c818-b2dc-1b52-b04b665e6999")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 626473, e => {
    "use strict";
    var t = e.i(415858),
        i = function(e, t) {
            return (i = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var i in t) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i])
            })(e, t)
        };

    function n(e, t, i, n) {
        return new(i || (i = Promise))(function(a, r) {
            function o(e) {
                try {
                    l(n.next(e))
                } catch (e) {
                    r(e)
                }
            }

            function u(e) {
                try {
                    l(n.throw(e))
                } catch (e) {
                    r(e)
                }
            }

            function l(e) {
                var t;
                e.done ? a(e.value) : ((t = e.value) instanceof i ? t : new i(function(e) {
                    e(t)
                })).then(o, u)
            }
            l((n = n.apply(e, t || [])).next())
        })
    }

    function a(e, t) {
        var i, n, a, r = {
                label: 0,
                sent: function() {
                    if (1 & a[0]) throw a[1];
                    return a[1]
                },
                trys: [],
                ops: []
            },
            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return o.next = u(0), o.throw = u(1), o.return = u(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
            return this
        }), o;

        function u(u) {
            return function(l) {
                var s = [u, l];
                if (i) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, s[0] && (r = 0)), r;) try {
                    if (i = 1, n && (a = 2 & s[0] ? n.return : s[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, s[1])).done) return a;
                    switch (n = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                        case 0:
                        case 1:
                            a = s;
                            break;
                        case 4:
                            return r.label++, {
                                value: s[1],
                                done: !1
                            };
                        case 5:
                            r.label++, n = s[1], s = [0];
                            continue;
                        case 7:
                            s = r.ops.pop(), r.trys.pop();
                            continue;
                        default:
                            if (!(a = (a = r.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                r = 0;
                                continue
                            }
                            if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                r.label = s[1];
                                break
                            }
                            if (6 === s[0] && r.label < a[1]) {
                                r.label = a[1], a = s;
                                break
                            }
                            if (a && r.label < a[2]) {
                                r.label = a[2], r.ops.push(s);
                                break
                            }
                            a[2] && r.ops.pop(), r.trys.pop();
                            continue
                    }
                    s = t.call(e, r)
                } catch (e) {
                    s = [6, e], n = 0
                } finally {
                    i = a = 0
                }
                if (5 & s[0]) throw s[1];
                return {
                    value: s[0] ? s[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function r(e) {
        return e
    }

    function o(e) {
        var i;
        return null == (i = e) ? i : {
            key: (0, t.u)(i, "key") ? i.key : void 0,
            targets: (0, t.u)(i, "targets") ? i.targets : void 0,
            unixStartTime: (0, t.u)(i, "unixStartTime") ? i.unixStartTime : void 0,
            links: (0, t.u)(i, "links") ? i.links : void 0,
            dimensions: (0, t.u)(i, "dimensions") ? i.dimensions : void 0,
            unixEndTime: (0, t.u)(i, "unixEndTime") ? i.unixEndTime : void 0
        }
    }

    function u(e) {
        var i;
        return null == (i = e) ? i : {
            key: (0, t.u)(i, "key") ? i.key : void 0,
            targets: (0, t.u)(i, "targets") ? i.targets : void 0,
            category: (0, t.u)(i, "category") ? i.category : void 0
        }
    }

    function l(e) {
        if (void 0 !== e) return null === e ? null : {
            dimension: e.dimension,
            values: e.values,
            operation: e.operation
        }
    }

    function s(e) {
        if (void 0 !== e) return null === e ? null : {
            dimensionBreakdown: function(e) {
                if (void 0 !== e) return null === e ? null : {
                    dimension: e.dimension,
                    rank: function(e) {
                        if (void 0 !== e) return null === e ? null : {
                            direction: e.direction,
                            n: e.n,
                            orderByMetric: function(e) {
                                if (void 0 !== e) return null === e ? null : {
                                    metric: e.metric,
                                    variant: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            kind: e.kind,
                                            key: e.key
                                        }
                                    }(e.variant)
                                }
                            }(e.orderByMetric),
                            orderFilters: void 0 === e.orderFilters ? void 0 : e.orderFilters.map(l),
                            orderTimeRange: function(e) {
                                if (void 0 !== e) return null === e ? null : {
                                    query: e.query,
                                    trailingDays: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            days: e.days
                                        }
                                    }(e.trailingDays),
                                    trailingPeriods: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            periods: e.periods
                                        }
                                    }(e.trailingPeriods)
                                }
                            }(e.orderTimeRange)
                        }
                    }(e.rank),
                    excludeOtherSeries: e.excludeOtherSeries,
                    excludedValues: e.excludedValues,
                    otherSeries: e.otherSeries
                }
            }(e.dimensionBreakdown),
            variant: function(e) {
                if (void 0 !== e) return null === e ? null : {
                    kind: e.kind,
                    keys: e.keys
                }
            }(e.variant)
        }
    }

    function c(e) {
        var i;
        return null == (i = e) ? i : {
            dimension: (0, t.u)(i, "dimension") ? i.dimension : void 0,
            value: (0, t.u)(i, "value") ? i.value : void 0,
            displayValue: (0, t.u)(i, "displayValue") ? i.displayValue : void 0,
            variantKey: (0, t.u)(i, "variantKey") ? i.variantKey : void 0
        }
    }

    function d(e) {
        var i;
        return null == (i = e) ? i : {
            key: (0, t.u)(i, "key") ? i.key : void 0,
            targets: (0, t.u)(i, "targets") ? i.targets : void 0
        }
    }

    function y(e) {
        if (void 0 !== e) return null === e ? null : {
            dimensionKey: e.dimensionKey,
            values: e.values
        }
    }

    function p(e) {
        if (void 0 !== e) return null === e ? null : {
            pseudoDimensionKey: e.pseudoDimensionKey,
            variantKey: e.variantKey
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function m(e) {
        var i;
        return null == (i = e) ? i : {
            code: (0, t.u)(i, "code") ? i.code : void 0,
            severity: (0, t.u)(i, "severity") ? i.severity : void 0,
            message: (0, t.u)(i, "message") ? i.message : void 0,
            nodeId: (0, t.u)(i, "nodeId") ? i.nodeId : void 0,
            suggestion: (0, t.u)(i, "suggestion") ? i.suggestion : void 0,
            context: (0, t.u)(i, "context") ? i.context : void 0
        }
    }

    function f(e) {
        var i;
        return null == (i = e) ? i : {
            nodeId: (0, t.u)(i, "nodeId") ? i.nodeId : void 0,
            nodeType: (0, t.u)(i, "nodeType") ? i.nodeType : void 0,
            startOffsetMs: (0, t.u)(i, "startOffsetMs") ? i.startOffsetMs : void 0,
            durationMs: (0, t.u)(i, "durationMs") ? i.durationMs : void 0,
            success: (0, t.u)(i, "success") ? i.success : void 0,
            error: (0, t.u)(i, "error") ? i.error : void 0,
            failedDueTo: (0, t.u)(i, "failedDueTo") ? i.failedDueTo : void 0,
            skipped: (0, t.u)(i, "skipped") ? i.skipped : void 0,
            errorCode: (0, t.u)(i, "errorCode") ? i.errorCode : void 0
        }
    }

    function T(e) {
        if (void 0 !== e) return null === e ? null : {
            input: e.input,
            dimension: e.dimension,
            sourceDimension: e.sourceDimension,
            operation: e.operation,
            maxValues: e.maxValues
        }
    }

    function v(e) {
        if (void 0 !== e) return null === e ? null : {
            dimensions: e.dimensions,
            function: e._function,
            functionParams: e.functionParams
        }
    }

    function S(e) {
        if (void 0 !== e) return null === e ? null : {
            id: e.id,
            type: e.type,
            queryConfig: function(e) {
                if (void 0 !== e) return null === e ? null : {
                    metric: e.metric,
                    resourceType: e.resourceType,
                    resourceId: e.resourceId,
                    granularity: e.granularity,
                    breakdown: void 0 === e.breakdown ? void 0 : e.breakdown.map(v),
                    filters: void 0 === e.filters ? void 0 : e.filters.map(l),
                    topN: function(e) {
                        if (void 0 !== e) return null === e ? null : {
                            n: e.n,
                            orderByMetric: e.orderByMetric,
                            orderFilters: void 0 === e.orderFilters ? void 0 : e.orderFilters.map(l),
                            excludeOtherSeries: e.excludeOtherSeries,
                            orderTimeRangeDays: e.orderTimeRangeDays,
                            otherLabel: e.otherLabel,
                            dimension: e.dimension,
                            excludedValues: e.excludedValues
                        }
                    }(e.topN),
                    pseudoDimensionValues: e.pseudoDimensionValues,
                    breakdownSpecs: void 0 === e.breakdownSpecs ? void 0 : e.breakdownSpecs.map(s),
                    dynamicFilterBindings: void 0 === e.dynamicFilterBindings ? void 0 : e.dynamicFilterBindings.map(T),
                    limit: e.limit,
                    rollingWindowDays: e.rollingWindowDays
                }
            }(e.queryConfig),
            mathConfig: function(e) {
                if (void 0 !== e) return null === e ? null : {
                    inputs: e.inputs
                }
            }(e.mathConfig),
            rollingWindowConfig: function(e) {
                if (void 0 !== e) return null === e ? null : {
                    input: e.input,
                    windowSize: e.windowSize,
                    reducer: e.reducer,
                    avgMode: e.avgMode
                }
            }(e.rollingWindowConfig),
            aggregationConfig: function(e) {
                if (void 0 !== e) return null === e ? null : {
                    input: e.input,
                    percentile: e.percentile
                }
            }(e.aggregationConfig),
            outputConfig: function(e) {
                if (void 0 !== e) return null === e ? null : {
                    input: e.input,
                    alias: e.alias
                }
            }(e.outputConfig),
            constantConfig: function(e) {
                if (void 0 !== e) return null === e ? null : {
                    value: e.value
                }
            }(e.constantConfig),
            poisonedConfig: function(e) {
                if (void 0 !== e) return null === e ? null : {
                    errorCode: e.errorCode,
                    errorMessage: e.errorMessage,
                    suggestion: e.suggestion
                }
            }(e.poisonedConfig)
        }
    }

    function g(e, i) {
        var n;
        return null == e ? e : {
            totalExecutionTimeMs: (0, t.u)(e, "totalExecutionTimeMs") ? e.totalExecutionTimeMs : void 0,
            traceId: (0, t.u)(e, "traceId") ? e.traceId : void 0,
            totalNodes: (0, t.u)(e, "totalNodes") ? e.totalNodes : void 0,
            complexity: (0, t.u)(e, "complexity") ? null == (n = e.complexity) ? n : {
                queryCount: (0, t.u)(n, "queryCount") ? n.queryCount : void 0,
                transformCount: (0, t.u)(n, "transformCount") ? n.transformCount : void 0,
                aggregationCount: (0, t.u)(n, "aggregationCount") ? n.aggregationCount : void 0,
                maxDepth: (0, t.u)(n, "maxDepth") ? n.maxDepth : void 0,
                estimatedCost: (0, t.u)(n, "estimatedCost") ? n.estimatedCost : void 0,
                maxFanOut: (0, t.u)(n, "maxFanOut") ? n.maxFanOut : void 0,
                rootCount: (0, t.u)(n, "rootCount") ? n.rootCount : void 0
            } : void 0,
            nodeTimings: (0, t.u)(e, "nodeTimings") ? e.nodeTimings.map(f) : void 0
        }
    }

    function D(e) {
        var i;
        return null == (i = e) ? i : {
            time: (0, t.u)(i, "time") ? i.time : void 0,
            value: (0, t.u)(i, "value") ? i.value : void 0,
            stringValues: (0, t.u)(i, "stringValues") ? i.stringValues : void 0,
            status: (0, t.u)(i, "status") ? i.status : void 0
        }
    }

    function R(e) {
        var i, n;
        return null == (i = e) ? i : {
            breakdownValue: (0, t.u)(i, "breakdownValue") ? i.breakdownValue.map(c) : void 0,
            dataPoints: (0, t.u)(i, "dataPoints") ? i.dataPoints.map(D) : void 0,
            periodSummary: (0, t.u)(i, "periodSummary") ? null == (n = i.periodSummary) ? n : {
                value: (0, t.u)(n, "value") ? n.value : void 0,
                method: (0, t.u)(n, "method") ? n.method : void 0
            } : void 0
        }
    }

    function C(e) {
        var i, n;
        return null == (i = e) ? i : {
            nodeId: (0, t.u)(i, "nodeId") ? i.nodeId : void 0,
            success: (0, t.u)(i, "success") ? i.success : void 0,
            error: (0, t.u)(i, "error") ? i.error : void 0,
            timeSeries: (0, t.u)(i, "timeSeries") ? null == (n = i.timeSeries) ? n : {
                values: (0, t.u)(n, "values") ? n.values.map(R) : void 0,
                truncated: (0, t.u)(n, "truncated") ? n.truncated : void 0
            } : void 0,
            scalarValue: (0, t.u)(i, "scalarValue") ? i.scalarValue : void 0,
            executionTimeMs: (0, t.u)(i, "executionTimeMs") ? i.executionTimeMs : void 0,
            errorCode: (0, t.u)(i, "errorCode") ? i.errorCode : void 0,
            failedDueTo: (0, t.u)(i, "failedDueTo") ? i.failedDueTo : void 0,
            skipped: (0, t.u)(i, "skipped") ? i.skipped : void 0
        }
    }

    function h(e) {
        if (void 0 !== e) return null === e ? null : {
            sourceKey: e.sourceKey,
            metric: function(e) {
                if (void 0 !== e) return null === e ? null : {
                    metricKey: e.metricKey,
                    customEventMetric: function(e) {
                        if (void 0 !== e) return null === e ? null : {
                            metricKey: e.metricKey,
                            customEventName: e.customEventName,
                            aggregation: e.aggregation
                        }
                    }(e.customEventMetric)
                }
            }(e.metric),
            filters: void 0 === e.filters ? void 0 : e.filters.map(y),
            variantSelections: void 0 === e.variantSelections ? void 0 : e.variantSelections.map(p),
            metricKey: e.metricKey
        }
    }

    function A(e) {
        if (void 0 !== e) return null === e ? null : {
            namespace: e.namespace,
            name: e.name,
            filterOnly: e.filterOnly,
            requiredFilter: e.requiredFilter
        }
    }

    function P(e) {
        var i, n;
        return null == (i = e) ? i : {
            dimension: (0, t.u)(i, "dimension") ? null == (n = i.dimension) ? n : {
                namespace: (0, t.u)(n, "namespace") ? n.namespace : void 0,
                name: (0, t.u)(n, "name") ? n.name : void 0,
                filterOnly: (0, t.u)(n, "filterOnly") ? n.filterOnly : void 0,
                requiredFilter: (0, t.u)(n, "requiredFilter") ? n.requiredFilter : void 0
            } : void 0,
            values: (0, t.u)(i, "values") ? i.values.map(c) : void 0,
            truncated: (0, t.u)(i, "truncated") ? i.truncated : void 0
        }
    }

    function b(e, i) {
        return null == e ? e : {
            values: (0, t.u)(e, "values") ? e.values.map(P) : void 0
        }
    }

    function O(e, i) {
        var n;
        return null == e ? e : {
            code: (0, t.u)(e, "code") ? e.code : void 0,
            message: (0, t.u)(e, "message") ? e.message : void 0,
            validationDetails: (0, t.u)(e, "validationDetails") ? null == (n = e.validationDetails) ? n : {
                field: (0, t.u)(n, "field") ? n.field : void 0,
                subject: (0, t.u)(n, "subject") ? n.subject : void 0,
                rejectedValues: (0, t.u)(n, "rejectedValues") ? n.rejectedValues : void 0
            } : void 0
        }
    }

    function E(e, i) {
        return null == e ? e : {
            createdTime: (0, t.u)(e, "createdTime") ? e.createdTime : void 0
        }
    }

    function M(e, i) {
        var n;
        return null == e ? e : {
            kind: (0, t.u)(e, "kind") ? e.kind : void 0,
            unit: (0, t.u)(e, "unit") ? e.unit : void 0,
            clientFoldable: (0, t.u)(e, "clientFoldable") ? e.clientFoldable : void 0,
            deltaMode: (0, t.u)(e, "deltaMode") ? e.deltaMode : void 0,
            clamp: (0, t.u)(e, "clamp") ? e.clamp : void 0,
            bucketMean: (0, t.u)(e, "bucketMean") ? null == (n = e.bucketMean) ? n : {
                granularity: (0, t.u)(n, "granularity") ? r(n.granularity) : void 0,
                weighted: (0, t.u)(n, "weighted") ? n.weighted : void 0
            } : void 0
        }
    }

    function I(e) {
        var i;
        return null == (i = e) ? i : {
            metric: (0, t.u)(i, "metric") ? i.metric : void 0,
            latestAvailableTime: (0, t.u)(i, "latestAvailableTime") ? i.latestAvailableTime : void 0,
            algebra: (0, t.u)(i, "algebra") ? M(i.algebra) : void 0,
            meanOfBucketsGranularities: (0, t.u)(i, "meanOfBucketsGranularities") ? i.meanOfBucketsGranularities.map(r) : void 0
        }
    }

    function k(e, i) {
        return null == e ? e : {
            metadata: (0, t.u)(e, "metadata") ? e.metadata.map(I) : void 0
        }
    }

    function w(e, i) {
        return null == e ? e : {
            values: (0, t.u)(e, "values") ? e.values.map(R) : void 0,
            truncated: (0, t.u)(e, "truncated") ? e.truncated : void 0
        }
    }

    function Q(e) {
        var i;
        return null == (i = e) ? i : {
            time: (0, t.u)(i, "time") ? i.time : void 0,
            breakdownValues: (0, t.u)(i, "breakdownValues") ? i.breakdownValues.map(c) : void 0,
            value: (0, t.u)(i, "value") ? i.value : void 0,
            state: (0, t.u)(i, "state") ? i.state : void 0
        }
    }

    function L(e, i) {
        return null == e ? e : {
            startTime: (0, t.u)(e, "startTime") ? e.startTime : void 0,
            endTime: (0, t.u)(e, "endTime") ? e.endTime : void 0
        }
    }

    function K(e) {
        var i, n, a, r;
        return null == (i = e) ? i : {
            id: (0, t.u)(i, "id") ? i.id : void 0,
            values: (0, t.u)(i, "values") ? null == (n = i.values) ? n : {
                points: (0, t.u)(n, "points") ? n.points.map(Q) : void 0
            } : void 0,
            unavailable: (0, t.u)(i, "unavailable") ? null == (a = i.unavailable) ? a : {
                reason: (0, t.u)(a, "reason") ? a.reason : void 0,
                lookaheadDuration: (0, t.u)(a, "lookaheadDuration") ? a.lookaheadDuration : void 0
            } : void 0,
            window: (0, t.u)(i, "window") ? null == (r = i.window) ? r : {
                resolved: (0, t.u)(r, "resolved") ? L(r.resolved) : void 0,
                evaluated: (0, t.u)(r, "evaluated") ? L(r.evaluated) : void 0,
                matureThroughTime: (0, t.u)(r, "matureThroughTime") ? r.matureThroughTime : void 0,
                latestAvailableTime: (0, t.u)(r, "latestAvailableTime") ? r.latestAvailableTime : void 0
            } : void 0,
            algebra: (0, t.u)(i, "algebra") ? M(i.algebra) : void 0
        }
    }

    function _(e, i) {
        return null == e ? e : {
            algebra: (0, t.u)(e, "algebra") ? M(e.algebra) : void 0,
            results: (0, t.u)(e, "results") ? e.results.map(K) : void 0
        }
    }

    function U(e, i) {
        return null == e ? e : {
            path: (0, t.u)(e, "path") ? e.path : void 0,
            metadata: (0, t.u)(e, "metadata") ? E(e.metadata) : void 0,
            done: (0, t.u)(e, "done") ? e.done : void 0,
            error: (0, t.u)(e, "error") ? O(e.error) : void 0,
            queryResult: (0, t.u)(e, "queryResult") ? w(e.queryResult) : void 0,
            dimensionValuesResult: (0, t.u)(e, "dimensionValuesResult") ? b(e.dimensionValuesResult) : void 0,
            metricMetadataResult: (0, t.u)(e, "metricMetadataResult") ? k(e.metricMetadataResult) : void 0,
            rollupQueryResult: (0, t.u)(e, "rollupQueryResult") ? _(e.rollupQueryResult) : void 0
        }
    }

    function x(e) {
        if (void 0 !== e) return null === e ? null : {
            sources: void 0 === e.sources ? void 0 : e.sources.map(h),
            formula: e.formula,
            displayName: e.displayName,
            l7Smoothing: e.l7Smoothing
        }
    }

    function V(e) {
        if (void 0 !== e) return null === e ? null : {
            resourceType: e.resourceType,
            resourceId: e.resourceId,
            granularity: e.granularity,
            startTime: e.startTime,
            endTime: e.endTime,
            traceId: e.traceId
        }
    }

    function N(e) {
        var i;
        return null == (i = e) ? i : {
            path: (0, t.u)(i, "path") ? i.path : void 0,
            metadata: (0, t.u)(i, "metadata") ? E(i.metadata) : void 0,
            done: (0, t.u)(i, "done") ? i.done : void 0,
            error: (0, t.u)(i, "error") ? O(i.error) : void 0,
            queryResult: (0, t.u)(i, "queryResult") ? w(i.queryResult) : void 0,
            dimensionValuesResult: (0, t.u)(i, "dimensionValuesResult") ? b(i.dimensionValuesResult) : void 0,
            metricMetadataResult: (0, t.u)(i, "metricMetadataResult") ? k(i.metricMetadataResult) : void 0,
            rollupQueryResult: (0, t.u)(i, "rollupQueryResult") ? _(i.rollupQueryResult) : void 0
        }
    }

    function B(e) {
        if (void 0 !== e) return null === e ? null : {
            id: e.id,
            bucket: e.bucket,
            scope: e.scope,
            meanOfBuckets: function(e) {
                if (void 0 !== e) return null === e ? null : {
                    granularity: e.granularity
                }
            }(e.meanOfBuckets)
        }
    }

    function q(e) {
        if (void 0 !== e) return null === e ? null : {
            resourceType: e.resourceType,
            resourceId: e.resourceId,
            query: function(e) {
                if (void 0 !== e) return null === e ? null : {
                    resourceType: e.resourceType,
                    resourceId: e.resourceId,
                    metric: e.metric,
                    granularity: e.granularity,
                    breakdown: void 0 === e.breakdown ? void 0 : e.breakdown.map(v),
                    filter: void 0 === e.filter ? void 0 : e.filter.map(l),
                    startTime: e.startTime,
                    endTime: e.endTime,
                    limit: e.limit,
                    pseudoDimensionValues: e.pseudoDimensionValues,
                    requestSummary: e.requestSummary
                }
            }(e.query),
            rollups: void 0 === e.rollups ? void 0 : e.rollups.map(B),
            rollingWindowDays: e.rollingWindowDays
        }
    }
    var F = function(e) {
        function r() {
            return null !== e && e.apply(this, arguments) || this
        }
        return function(e, t) {
            if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

            function n() {
                this.constructor = e
            }
            i(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
        }(r, e), r.prototype.v1ComputedMetricsExecutePostRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var n, r, o;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/computed-metrics/execute",
                                schemaPath: "/v1/computed-metrics/execute",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        computedMetric: x(e.computedMetric),
                                        context: V(e.context),
                                        globalFilters: void 0 === e.globalFilters ? void 0 : e.globalFilters.map(l),
                                        includeTotalBranch: e.includeTotalBranch,
                                        breakdownSpecs: void 0 === e.breakdownSpecs ? void 0 : e.breakdownSpecs.map(s)
                                    }
                                }(e.v1ComputedMetricsExecutePostRequest)
                            }, i)];
                        case 1:
                            return o = a.sent(), [2, new t.H(o, function(e) {
                                var i;
                                return null == e ? e : {
                                    result: (0, t.u)(e, "result") ? null == (i = e.result) ? i : {
                                        success: (0, t.u)(i, "success") ? i.success : void 0,
                                        outputs: (0, t.u)(i, "outputs") ? i.outputs.map(C) : void 0,
                                        metadata: (0, t.u)(i, "metadata") ? g(i.metadata) : void 0,
                                        errors: (0, t.u)(i, "errors") ? i.errors.map(m) : void 0,
                                        warnings: (0, t.u)(i, "warnings") ? i.warnings : void 0,
                                        partialSuccess: (0, t.u)(i, "partialSuccess") ? i.partialSuccess : void 0
                                    } : void 0,
                                    operationId: (0, t.u)(e, "operationId") ? e.operationId : void 0,
                                    pending: (0, t.u)(e, "pending") ? e.pending : void 0
                                }
                            })]
                    }
                })
            })
        }, r.prototype.v1ComputedMetricsExecutePost = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.v1ComputedMetricsExecutePostRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, r.prototype.v1ComputedMetricsValidatePostRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var n, r, o;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/computed-metrics/validate",
                                schemaPath: "/v1/computed-metrics/validate",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        computedMetric: x(e.computedMetric),
                                        context: V(e.context),
                                        globalFilters: void 0 === e.globalFilters ? void 0 : e.globalFilters.map(l),
                                        includeTotalBranch: e.includeTotalBranch,
                                        breakdownSpecs: void 0 === e.breakdownSpecs ? void 0 : e.breakdownSpecs.map(s)
                                    }
                                }(e.v1ComputedMetricsValidatePostRequest)
                            }, i)];
                        case 1:
                            return o = a.sent(), [2, new t.H(o, function(e) {
                                return null == e ? e : {
                                    isValid: (0, t.u)(e, "isValid") ? e.isValid : void 0,
                                    errors: (0, t.u)(e, "errors") ? e.errors.map(m) : void 0,
                                    warnings: (0, t.u)(e, "warnings") ? e.warnings : void 0
                                }
                            })]
                    }
                })
            })
        }, r.prototype.v1ComputedMetricsValidatePost = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.v1ComputedMetricsValidatePostRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, r.prototype.v1DagExecutePostRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var n, r, o;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/dag/execute",
                                schemaPath: "/v1/dag/execute",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        graph: function(e) {
                                            if (void 0 !== e) return null === e ? null : {
                                                id: e.id,
                                                name: e.name,
                                                nodes: void 0 === e.nodes ? void 0 : e.nodes.map(S)
                                            }
                                        }(e.graph),
                                        context: function(e) {
                                            if (void 0 !== e) return null === e ? null : {
                                                resourceType: e.resourceType,
                                                resourceId: e.resourceId,
                                                granularity: e.granularity,
                                                startTime: e.startTime,
                                                endTime: e.endTime,
                                                traceId: e.traceId
                                            }
                                        }(e.context),
                                        includeDebug: e.includeDebug
                                    }
                                }(e.v1DagExecutePostRequest)
                            }, i)];
                        case 1:
                            return o = a.sent(), [2, new t.H(o, function(e) {
                                var i;
                                return null == e ? e : {
                                    result: (0, t.u)(e, "result") ? null == (i = e.result) ? i : {
                                        success: (0, t.u)(i, "success") ? i.success : void 0,
                                        outputs: (0, t.u)(i, "outputs") ? i.outputs.map(C) : void 0,
                                        metadata: (0, t.u)(i, "metadata") ? g(i.metadata) : void 0,
                                        errors: (0, t.u)(i, "errors") ? i.errors.map(m) : void 0,
                                        warnings: (0, t.u)(i, "warnings") ? i.warnings : void 0,
                                        partialSuccess: (0, t.u)(i, "partialSuccess") ? i.partialSuccess : void 0
                                    } : void 0,
                                    operationId: (0, t.u)(e, "operationId") ? e.operationId : void 0,
                                    pending: (0, t.u)(e, "pending") ? e.pending : void 0
                                }
                            })]
                    }
                })
            })
        }, r.prototype.v1DagExecutePost = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.v1DagExecutePostRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, r.prototype.v1DagValidatePostRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var n, r, o;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/dag/validate",
                                schemaPath: "/v1/dag/validate",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        graph: function(e) {
                                            if (void 0 !== e) return null === e ? null : {
                                                id: e.id,
                                                name: e.name,
                                                nodes: void 0 === e.nodes ? void 0 : e.nodes.map(S)
                                            }
                                        }(e.graph),
                                        context: function(e) {
                                            if (void 0 !== e) return null === e ? null : {
                                                resourceType: e.resourceType,
                                                resourceId: e.resourceId,
                                                granularity: e.granularity,
                                                startTime: e.startTime,
                                                endTime: e.endTime,
                                                traceId: e.traceId
                                            }
                                        }(e.context)
                                    }
                                }(e.v1DagValidatePostRequest)
                            }, i)];
                        case 1:
                            return o = a.sent(), [2, new t.H(o, function(e) {
                                return null == e ? e : {
                                    isValid: (0, t.u)(e, "isValid") ? e.isValid : void 0,
                                    errors: (0, t.u)(e, "errors") ? e.errors.map(m) : void 0,
                                    warnings: (0, t.u)(e, "warnings") ? e.warnings : void 0
                                }
                            })]
                    }
                })
            })
        }, r.prototype.v1DagValidatePost = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.v1DagValidatePostRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, r.prototype.v1DimensionsResourceResourceTypeIdResourceIdPostRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var n, r, o;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.resourceType || void 0 === e.resourceType) throw new t.w("resourceType", "Required parameter requestParameters.resourceType was null or undefined when calling v1DimensionsResourceResourceTypeIdResourceIdPost.");
                            if (null === e.resourceId || void 0 === e.resourceId) throw new t.w("resourceId", "Required parameter requestParameters.resourceId was null or undefined when calling v1DimensionsResourceResourceTypeIdResourceIdPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/dimensions/resource/{resourceType}/id/{resourceId}".replace("{".concat("resourceType", "}"), encodeURIComponent(String(e.resourceType))).replace("{".concat("resourceId", "}"), encodeURIComponent(String(e.resourceId))),
                                schemaPath: "/v1/dimensions/resource/{resourceType}/id/{resourceId}",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        resourceType: e.resourceType,
                                        resourceId: e.resourceId,
                                        query: function(e) {
                                            if (void 0 !== e) return null === e ? null : {
                                                resourceType: e.resourceType,
                                                resourceId: e.resourceId,
                                                dimensions: void 0 === e.dimensions ? void 0 : e.dimensions.map(A),
                                                startTime: e.startTime,
                                                endTime: e.endTime,
                                                limit: e.limit,
                                                filters: void 0 === e.filters ? void 0 : e.filters.map(l),
                                                granularity: e.granularity
                                            }
                                        }(e.query)
                                    }
                                }(e.dimensionValuesRequest)
                            }, i)];
                        case 1:
                            return o = a.sent(), [2, new t.H(o, function(e) {
                                return null == e ? e : {
                                    operation: (0, t.u)(e, "operation") ? U(e.operation) : void 0
                                }
                            })]
                    }
                })
            })
        }, r.prototype.v1DimensionsResourceResourceTypeIdResourceIdPost = function(e, t) {
            return n(this, void 0, void 0, function() {
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.v1DimensionsResourceResourceTypeIdResourceIdPostRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, r.prototype.v1MetricsMetadataPostRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var n, r, o;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/metrics/metadata",
                                schemaPath: "/v1/metrics/metadata",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        query: function(e) {
                                            if (void 0 !== e) return null === e ? null : {
                                                metrics: e.metrics
                                            }
                                        }(e.query)
                                    }
                                }(e.v1MetricsMetadataPostRequest)
                            }, i)];
                        case 1:
                            return o = a.sent(), [2, new t.H(o, function(e) {
                                return null == e ? e : {
                                    operation: (0, t.u)(e, "operation") ? U(e.operation) : void 0
                                }
                            })]
                    }
                })
            })
        }, r.prototype.v1MetricsMetadataPost = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.v1MetricsMetadataPostRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, r.prototype.v1MetricsResourceResourceTypeIdResourceIdPostRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var n, r, o;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.resourceType || void 0 === e.resourceType) throw new t.w("resourceType", "Required parameter requestParameters.resourceType was null or undefined when calling v1MetricsResourceResourceTypeIdResourceIdPost.");
                            if (null === e.resourceId || void 0 === e.resourceId) throw new t.w("resourceId", "Required parameter requestParameters.resourceId was null or undefined when calling v1MetricsResourceResourceTypeIdResourceIdPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/metrics/resource/{resourceType}/id/{resourceId}".replace("{".concat("resourceType", "}"), encodeURIComponent(String(e.resourceType))).replace("{".concat("resourceId", "}"), encodeURIComponent(String(e.resourceId))),
                                schemaPath: "/v1/metrics/resource/{resourceType}/id/{resourceId}",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: q(e.queryRequest)
                            }, i)];
                        case 1:
                            return o = a.sent(), [2, new t.H(o, function(e) {
                                return null == e ? e : {
                                    operation: (0, t.u)(e, "operation") ? U(e.operation) : void 0
                                }
                            })]
                    }
                })
            })
        }, r.prototype.v1MetricsResourceResourceTypeIdResourceIdPost = function(e, t) {
            return n(this, void 0, void 0, function() {
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.v1MetricsResourceResourceTypeIdResourceIdPostRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, r.prototype.v1MetricsqueryBatchPostRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var n, r, o;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/metrics:queryBatch",
                                schemaPath: "/v1/metrics:queryBatch",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        queries: void 0 === e.queries ? void 0 : e.queries.map(q)
                                    }
                                }(e.v1MetricsQueryBatchPostRequest)
                            }, i)];
                        case 1:
                            return o = a.sent(), [2, new t.H(o, function(e) {
                                return null == e ? e : {
                                    operations: (0, t.u)(e, "operations") ? e.operations.map(N) : void 0
                                }
                            })]
                    }
                })
            })
        }, r.prototype.v1MetricsqueryBatchPost = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.v1MetricsqueryBatchPostRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, r.prototype.v1OperationsOperationIdGetRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var n, r, o;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.operationId || void 0 === e.operationId) throw new t.w("operationId", "Required parameter requestParameters.operationId was null or undefined when calling v1OperationsOperationIdGet.");
                            return n = {}, void 0 !== e.resourceType && (n.resourceType = e.resourceType), void 0 !== e.resourceId && (n.resourceId = e.resourceId), r = {}, [4, this.request({
                                path: "/v1/operations/{operationId}".replace("{".concat("operationId", "}"), encodeURIComponent(String(e.operationId))),
                                schemaPath: "/v1/operations/{operationId}",
                                method: "GET",
                                headers: r,
                                query: n
                            }, i)];
                        case 1:
                            return o = a.sent(), [2, new t.H(o, function(e) {
                                return null == e ? e : {
                                    operation: (0, t.u)(e, "operation") ? U(e.operation) : void 0
                                }
                            })]
                    }
                })
            })
        }, r.prototype.v1OperationsOperationIdGet = function(e, t) {
            return n(this, void 0, void 0, function() {
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.v1OperationsOperationIdGetRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, r.prototype.v1StatusConfigGetRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var n, r, l;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return n = {}, void 0 !== e.universeId && (n.universeId = e.universeId), r = {}, [4, this.request({
                                path: "/v1/status-config",
                                schemaPath: "/v1/status-config",
                                method: "GET",
                                headers: r,
                                query: n
                            }, i)];
                        case 1:
                            return l = a.sent(), [2, new t.H(l, function(e) {
                                return null == e ? e : {
                                    bannerConfigurations: (0, t.u)(e, "bannerConfigurations") ? e.bannerConfigurations.map(u) : void 0,
                                    annotationConfigurations: (0, t.u)(e, "annotationConfigurations") ? e.annotationConfigurations.map(o) : void 0,
                                    chartWarningConfigurations: (0, t.u)(e, "chartWarningConfigurations") ? e.chartWarningConfigurations.map(d) : void 0
                                }
                            })]
                    }
                })
            })
        }, r.prototype.v1StatusConfigGet = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.v1StatusConfigGetRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, r
    }(t._);
    e.s(["m", 0, F, "K", 0, {
        Invalid: "DATA_STATUS_INVALID",
        Valid: "DATA_STATUS_VALID",
        InProgress: "DATA_STATUS_IN_PROGRESS",
        Incomplete: "DATA_STATUS_INCOMPLETE",
        NotMeaningful: "DATA_STATUS_NOT_MEANINGFUL",
        Projected: "DATA_STATUS_PROJECTED",
        NotStatisticallySignificant: "DATA_STATUS_NOT_STATISTICALLY_SIGNIFICANT",
        InsufficientSampleSize: "DATA_STATUS_INSUFFICIENT_SAMPLE_SIZE"
    }, "n", 0, {
        Invalid: "FILTER_OPERATION_INVALID",
        Contains: "FILTER_OPERATION_CONTAINS",
        NotContains: "FILTER_OPERATION_NOT_CONTAINS",
        Gt: "FILTER_OPERATION_GT",
        Gte: "FILTER_OPERATION_GTE",
        Lt: "FILTER_OPERATION_LT",
        Lte: "FILTER_OPERATION_LTE",
        Match: "FILTER_OPERATION_MATCH",
        Equals: "FILTER_OPERATION_EQUALS",
        NotEqual: "FILTER_OPERATION_NOT_EQUAL"
    }, "Q", 0, {
        Invalid: "NODE_TYPE_INVALID",
        Query: "NODE_TYPE_QUERY",
        Constant: "NODE_TYPE_CONSTANT",
        Add: "NODE_TYPE_ADD",
        Subtract: "NODE_TYPE_SUBTRACT",
        Multiply: "NODE_TYPE_MULTIPLY",
        Divide: "NODE_TYPE_DIVIDE",
        Power: "NODE_TYPE_POWER",
        Log: "NODE_TYPE_LOG",
        RollingWindow: "NODE_TYPE_ROLLING_WINDOW",
        SeriesSum: "NODE_TYPE_SERIES_SUM",
        SeriesAvg: "NODE_TYPE_SERIES_AVG",
        SeriesMin: "NODE_TYPE_SERIES_MIN",
        SeriesMax: "NODE_TYPE_SERIES_MAX",
        Percentile: "NODE_TYPE_PERCENTILE",
        Output: "NODE_TYPE_OUTPUT",
        Poisoned: "NODE_TYPE_POISONED"
    }, "U", 0, {
        Invalid: "RANK_DIRECTION_INVALID",
        Top: "RANK_DIRECTION_TOP",
        Bottom: "RANK_DIRECTION_BOTTOM"
    }, "x", 0, {
        Invalid: "RESOURCE_TYPE_INVALID",
        Universe: "RESOURCE_TYPE_UNIVERSE",
        Creator: "RESOURCE_TYPE_CREATOR",
        Group: "RESOURCE_TYPE_GROUP",
        Organization: "RESOURCE_TYPE_ORGANIZATION",
        AdAccountId: "RESOURCE_TYPE_AD_ACCOUNT_ID"
    }, "S", 0, {
        Invalid: "VARIANT_KIND_INVALID",
        Percentile: "VARIANT_KIND_PERCENTILE",
        Aggregation: "VARIANT_KIND_AGGREGATION"
    }, "y", 0, {
        Invalid: "WINDOW_AVG_MODE_INVALID",
        ActualCount: "WINDOW_AVG_MODE_ACTUAL_COUNT",
        WindowSize: "WINDOW_AVG_MODE_WINDOW_SIZE"
    }, "O", 0, {
        Invalid: "WINDOW_REDUCER_INVALID",
        Sum: "WINDOW_REDUCER_SUM",
        Avg: "WINDOW_REDUCER_AVG",
        Min: "WINDOW_REDUCER_MIN",
        Max: "WINDOW_REDUCER_MAX",
        Count: "WINDOW_REDUCER_COUNT",
        First: "WINDOW_REDUCER_FIRST",
        Last: "WINDOW_REDUCER_LAST"
    }])
}, 531007, e => {
    "use strict";
    var t, i = ((t = {}).Spline = "spline", t.Area = "area", t.Column = "column", t.Map = "map", t.Bar = "bar", t.Pie = "pie", t.DurationSpline = "duration_spline", t.DurationArea = "duration_area", t.MultipleMetricSpline = "multiple_metric_spline", t.Table = "Table", t);
    e.s(["f", () => i])
}, 577038, e => {
    "use strict";
    var t, i = ((t = i || {}).Average = "Average", t.Total = "Total", t.TotalAbsoluteValue = "TotalAbsoluteValue", t.SinglePoint = "SinglePoint", t.GrowthRate = "GrowthRate", t.QuotaPercentageUsage = "QuotaPercentageUsage", t.TopBreakdown = "TopBreakdown", t.LastValue = "LastValue", t);
    e.s(["f", 0, i])
}, 908374, 510785, 548152, 875907, e => {
    "use strict";
    var t, i, n, a = e.i(31611),
        r = e.i(730530),
        o = e.i(531007),
        u = e.i(923319),
        l = e.i(447311),
        s = e.i(881670),
        c = e.i(927868),
        d = e.i(577038);
    let y = [d.f.QuotaPercentageUsage];
    d.f.TopBreakdown;
    let p = e => (0, c.I)(y, e.type),
        m = d.f,
        f = d.f;
    e.s(["d", 0, m, "U", 0, f, "m", 0, p, "A", 0, e => !p(e)], 510785);
    var T = ((t = T || {}).InExperienceCurrency = "inExperienceCurrency", t);
    e.s(["f", 0, T], 548152);
    var v = ((i = {}).PercentageOfFirstPoint = "PercentageOfFirstPoint", i.ScaleBackBy100 = "ScaleBackBy100", i.ScaleBackBy60 = "ScaleBackBy60", i.ScaleBackBy3600 = "ScaleBackBy3600", i.ScaleBackBy1000 = "ScaleBackBy1000", i.ScaleBackBy1000000000 = "ScaleBackBy1000000000", i);

    function S(e) {
        return (t, i) => {
            let [n, a, r] = i[t];
            return [n, null === a ? null : a * e, r]
        }
    }
    let g = {
        PercentageOfFirstPoint: (e, t) => {
            let [, i] = t[0], [n, a, r] = t[e], o = null;
            return i && null !== a && (o = a / i), [n, o, r]
        },
        ScaleBackBy100: S(.01),
        ScaleBackBy60: S(1 / 60),
        ScaleBackBy3600: S(1 / 3600),
        ScaleBackBy1000: S(.001),
        ScaleBackBy1000000000: S(1e-9)
    };
    e.s(["A", () => v, "U", 0, g], 875907);
    let D = {
        defaultTotalSummaryTypes: [{
            type: f.Average
        }]
    };
    a.ST.ThumbnailWinningSegments;
    let R = e => (0, c.s)(a.ST, e) || (0, c.s)(a.Ea, e),
        C = {
            [a.ST.VideoServiceExclusivePlaybackSeconds]: {
                unit: a.OJ.Hours,
                decimalPrecision: 1
            },
            [a.ST.BandwidthTotalRecvMaxBytes]: {
                unit: a.OJ.Kilobytes,
                decimalPrecision: 1
            },
            [a.ST.BandwidthTotalSendMaxBytes]: {
                unit: a.OJ.Kilobytes,
                decimalPrecision: 1
            }
        };
    var h = ((n = {}).WinningSegments = "WinningSegments", n);
    let A = [{
            type: f.Total
        }],
        P = [{
            type: f.LastValue
        }],
        b = [10, 50],
        O = {
            [a.ST.CreatorRewardsAverageRobuxBookingsPerSpender]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.Q)("Description.CreatorRewardsAverageRobuxBookingsPerSpender", s.f.Analytics)
                }
            },
            [a.ST.CreatorRewardsLifetimeEstimatedAffiliatePayoutRobux]: {
                defaultTotalSummaryTypes: A,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.Q)("Description.CreatorRewardsLifetimeEstimatedAffiliatePayoutRobux", s.f.Analytics)
                }
            },
            [a.ST.CreatorRewardsLifetimeQualifiedReactivations]: {
                defaultTotalSummaryTypes: A,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.Q)("Description.CreatorRewardsLifetimeQualifiedReactivations", s.f.Analytics)
                }
            },
            [a.ST.CreatorRewardsLifetimeQualifiedSignups]: {
                defaultTotalSummaryTypes: A,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.Q)("Description.CreatorRewardsLifetimeQualifiedSignups", s.f.Analytics)
                }
            },
            [a.ST.CreatorRewardsLifetimeQualifiedSpenders]: {
                defaultTotalSummaryTypes: A,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.Q)("Description.CreatorRewardsLifetimeQualifiedSpenders", s.f.Analytics)
                }
            },
            [a.ST.CommunityAnnouncementEventCount]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.CommunityAnnouncementUniqueUsers]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.CommunityAnnouncementNotificationCTR]: {
                defaultTotalSummaryTypes: P
            },
            [a.ST.EconomyTransactionAmount]: {
                defaultTotalSummaryTypes: A,
                exploreModeChartType: o.f.Column,
                specialNumberFormatting: T.InExperienceCurrency
            },
            [a.ST.EconomyTransactionAmountSinks]: {
                defaultTotalSummaryTypes: A,
                exploreModeChartType: o.f.Column,
                specialNumberFormatting: T.InExperienceCurrency
            },
            [a.ST.EconomyTransactionCount]: {
                defaultTotalSummaryTypes: A,
                exploreModeChartType: o.f.Column
            },
            [a.ST.EconomyAverageWalletBalance]: {
                exploreModeChartType: o.f.Spline,
                specialNumberFormatting: T.InExperienceCurrency
            },
            [a.ST.FunnelStepCompletionRate]: {
                columnDisplayConfigOverrides: {
                    cellBackground: {
                        type: u.k.ValueOpacityFill,
                        color: l.f.Positive
                    }
                }
            },
            [a.ST.FunnelUserStepCompletionRate]: {
                columnDisplayConfigOverrides: {
                    cellBackground: {
                        type: u.k.ValueOpacityFill,
                        color: l.f.Positive
                    }
                }
            },
            [a.ST.FunnelStepChurnRate]: {
                columnDisplayConfigOverrides: {
                    cellBackground: {
                        type: u.k.ValueOpacityFill,
                        color: l.f.Negative
                    }
                }
            },
            [a.ST.FunnelUserChurnRate]: {
                columnDisplayConfigOverrides: {
                    cellBackground: {
                        type: u.k.ValueOpacityFill,
                        color: l.f.Negative
                    }
                }
            },
            [a.ST.FunnelStepOverallCompletionRate]: {
                defaultTotalSummaryTypes: A,
                columnDisplayConfigOverrides: {
                    cellBackground: {
                        type: u.k.ValuePercentageWidthFill,
                        color: l.f.Progression
                    },
                    widthWeight: 40
                }
            },
            [a.ST.FunnelUserOverallCompletionRate]: {
                defaultTotalSummaryTypes: A,
                columnDisplayConfigOverrides: {
                    cellBackground: {
                        type: u.k.ValuePercentageWidthFill,
                        color: l.f.Progression
                    },
                    widthWeight: 40
                }
            },
            [a.ST.FunnelUserTotalCount]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.FunnelStepTotalCount]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.JourneyTotalUsers]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.JourneyCompletionUsers]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.JourneyEntryTransitions]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.JourneyLastStageTransitions]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.JourneyStageUserCount]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.JourneyStageTransitionCount]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.JourneyNodeUserCount]: {
                defaultTotalSummaryTypes: A,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.Q)("Description.JourneyNodeUserCount", s.f.Analytics)
                }
            },
            [a.ST.JourneyNodeUserChurnCount]: {
                defaultTotalSummaryTypes: A,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.Q)("Description.JourneyNodeUserChurnCount", s.f.Analytics)
                }
            },
            [a.ST.JourneyNodeUserChurnRate]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.Q)("Description.JourneyNodeUserChurnRate", s.f.Analytics)
                }
            },
            [a.ST.JourneyNodeTransitionCount]: {
                defaultTotalSummaryTypes: A,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.Q)("Description.JourneyNodeTransitionCount", s.f.Analytics)
                }
            },
            [a.ST.JourneyNodeTransitionChurnCount]: {
                defaultTotalSummaryTypes: A,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.Q)("Description.JourneyNodeTransitionChurnCount", s.f.Analytics)
                }
            },
            [a.ST.JourneyNodeTransitionChurnRate]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.Q)("Description.JourneyNodeTransitionChurnRate", s.f.Analytics)
                }
            },
            [a.ST.JourneyUserPctOfSource]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.Q)("Description.JourneyUserPctOfSource", s.f.Analytics)
                }
            },
            [a.ST.JourneyUserPctOfStart]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.Q)("Description.JourneyUserPctOfStart", s.f.Analytics)
                }
            },
            [a.ST.JourneyTransitionPctOfSource]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.Q)("Description.JourneyTransitionPctOfSource", s.f.Analytics)
                }
            },
            [a.ST.JourneyTransitionPctOfStart]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.Q)("Description.JourneyTransitionPctOfStart", s.f.Analytics)
                }
            },
            [a.ST.UniqueUsersWithPlaySessions]: {
                defaultTotalSummaryTypes: [{
                    type: f.Average
                }, {
                    type: f.Total
                }],
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Title.Table.UsersWithPlays", s.f.Analytics)
                }
            },
            [a.ST.UniqueUsersWithImpressions]: {
                defaultTotalSummaryTypes: [{
                    type: f.Average
                }, {
                    type: f.Total
                }],
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Title.Table.UsersWithImpressions", s.f.Analytics),
                    tooltipKey: (0, r.o)("Description.Table.UsersWithImpressions")
                }
            },
            [a.ST.EndToEndCVR]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Title.Table.ConversionRate", s.f.Analytics),
                    tooltipKey: (0, r.o)("Description.Table.ConversionRate")
                }
            },
            [a.ST.QualifiedUniqueUsersWithPlaySessions]: {
                defaultTotalSummaryTypes: [{
                    type: f.Average
                }, {
                    type: f.Total
                }],
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Title.Table.QualifiedUsersWithPlays", s.f.Analytics),
                    tooltipKey: (0, r.o)("Description.Table.QualifiedUsersWithPlays")
                }
            },
            [a.ST.QualifiedEndToEndCVR]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Title.Table.QualifiedPTR", s.f.Analytics),
                    tooltipKey: (0, r.o)("Description.Table.QualifiedPTR")
                }
            },
            [a.ST.ErrorCount]: {
                columnDisplayConfigOverrides: {
                    columnAlignment: "left"
                }
            },
            [a.ST.ComputeEfficiency]: {
                dataPointTransformerType: v.ScaleBackBy100
            },
            [a.ST.Attribution1DPayerConversionRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Title.Table.PayerConversion1D", s.f.Analytics),
                    tooltipKey: (0, r.o)("Description.Table.PayerConversion1D")
                }
            },
            [a.ST.Attribution1DPlaytimePerUserInMinutes]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Title.Table.PlaytimePerUser1D", s.f.Analytics),
                    tooltipKey: (0, r.o)("Description.Table.PlaytimePerUser1D")
                }
            },
            [a.ST.Attribution1DRobuxPerUser]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Title.Table.RevenuePerUser1D", s.f.Analytics),
                    tooltipKey: (0, r.o)("Description.Table.RevenuePerUser1D")
                }
            },
            [a.ST.Attribution30DPayerConversionRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Title.Table.PayerConversion30D", s.f.Analytics),
                    tooltipKey: (0, r.o)("Description.Table.PayerConversion30D")
                }
            },
            [a.ST.Attribution30DPlaytimePerUserInMinutes]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Title.Table.PlaytimePerUser30D", s.f.Analytics),
                    tooltipKey: (0, r.o)("Description.Table.PlaytimePerUser30D")
                }
            },
            [a.ST.Attribution30DRobuxPerUser]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Title.Table.RevenuePerUser30D", s.f.Analytics),
                    tooltipKey: (0, r.o)("Description.Table.RevenuePerUser30D")
                }
            },
            [a.ST.Attribution7DPayerConversionRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Title.Table.PayerConversion7D", s.f.Analytics),
                    tooltipKey: (0, r.o)("Description.Table.PayerConversion7D")
                }
            },
            [a.ST.Attribution7DPlaytimePerUserInMinutes]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Title.Table.PlaytimePerUser7D", s.f.Analytics),
                    tooltipKey: (0, r.o)("Description.Table.PlaytimePerUser7D")
                }
            },
            [a.ST.Attribution7DRobuxPerUser]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Title.Table.RevenuePerUser7D", s.f.Analytics),
                    tooltipKey: (0, r.o)("Description.Table.RevenuePerUser7D")
                }
            },
            [a.ST.AttributionD1RetentionRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Title.Table.D1Retention", s.f.Analytics),
                    tooltipKey: (0, r.o)("Description.Table.D1Retention")
                }
            },
            [a.ST.AttributionD30RetentionRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Title.Table.D30Retention", s.f.Analytics),
                    tooltipKey: (0, r.o)("Description.Table.D30Retention")
                }
            },
            [a.ST.AttributionD7RetentionRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Title.Table.D7Retention", s.f.Analytics),
                    tooltipKey: (0, r.o)("Description.Table.D7Retention")
                }
            },
            [a.ST.UniqueUsersWithClicks]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Title.Table.UsersWithDetailPageVisits", s.f.Analytics),
                    tooltipKey: (0, r.o)("Description.Table.UsersWithDetailPageVisits")
                }
            },
            [a.ST.ImpressionCVR]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Title.Table.UsersImpressionCTR", s.f.Analytics),
                    tooltipKey: (0, r.o)("Description.Table.UsersImpressionCTR")
                }
            },
            [a.ST.ClickCVR]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Title.Table.UsersDetailPageCTR", s.f.Analytics),
                    tooltipKey: (0, r.o)("Description.Table.UsersDetailPageCTR")
                }
            },
            [a.ST.DailyRevenue]: {
                defaultTotalSummaryTypes: [{
                    type: f.Average
                }, {
                    type: f.Total
                }],
                loggingMetricOverride: "Robux"
            },
            [a.ST.ItemMonetizationRevenue]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.ItemMonetizationSales]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.AverageSessionLengthMinutes]: {
                loggingMetricOverride: "AveragePlayTime"
            },
            [a.ST.AveragePlayTimeMinutesPerDAU]: {
                loggingMetricOverride: "AveragePlayTime"
            },
            [a.ST.ThumbnailImpressions]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.ThumbnailQualifiedPlays]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.TotalSessionsEndedInBucket]: {
                defaultTotalSummaryTypes: [{
                    type: f.SinglePoint,
                    selectedXValue: 300,
                    specificLabel: {
                        translationKey: (0, r.Q)("Label.PercentageInSummary", s.f.Analytics),
                        arguments: {
                            minute: "5"
                        }
                    }
                }],
                dataPointTransformerType: v.PercentageOfFirstPoint,
                exploreModeChartType: o.f.DurationSpline,
                exploreModeSpecOverride: {
                    breakdown: {
                        intersect: [a.zA.SessionTimeBucket]
                    },
                    granularity: {
                        override: a.L1.None
                    }
                },
                totalSeriesNameOverride: (0, r.Q)("Label.PlayersPercentage", s.f.Analytics)
            },
            [a.ST.RFYDuration0To60]: {
                exploreModeSpecOverride: {
                    benchmarkPercentiles: {
                        override: b
                    }
                }
            },
            [a.ST.RFYDuration61To180]: {
                exploreModeSpecOverride: {
                    benchmarkPercentiles: {
                        override: b
                    }
                }
            },
            [a.Ea.ClientMemoryUsage]: {
                dataPointTransformerType: v.ScaleBackBy1000000000
            },
            [a.Ea.SessionDurationSeconds]: {
                dataPointTransformerType: v.ScaleBackBy60
            },
            [a.Ea.ServerMemoryUsage]: {
                dataPointTransformerType: v.ScaleBackBy1000000000
            },
            [a.Ea.ServerCpuTime]: {
                exploreModeChartType: o.f.Area
            },
            [a.Ea.ServerMemoryUsageV2]: {
                exploreModeChartType: o.f.Area
            },
            [a.ST.ClientCpuTimeAvg]: {
                exploreModeChartType: o.f.Area
            },
            [a.Ea.ServerMemoryUsageByServerAge]: {
                exploreModeChartType: o.f.DurationArea,
                exploreModeSpecOverride: {
                    granularity: {
                        override: a.L1.None
                    },
                    breakdown: {
                        intersect: [a.zA.ServerAgeBucket]
                    }
                }
            },
            [a.ST.ItemAvatar3dLimitedAvailableQuantity]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.ItemAvatar3dLimitedTotalQuantity]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.ItemLifetimeCreatorEarning]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.ItemLifetimeRebateAmount]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.ItemLifetimeRobuxSpent]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.ItemLifetimeTransactionCount]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.ItemLimitedSoldPercentage]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.ItemPublishAdvance]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.ItemTotalCreatorEarning]: {
                defaultTotalSummaryTypes: A,
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Label.Revenue", s.f.AvatarAnalytics)
                }
            },
            [a.ST.ItemTotalRobuxSpent]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.ItemTotalTransactionCount]: {
                defaultTotalSummaryTypes: A,
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Title.Table.ItemTotalTransactionCount", s.f.Analytics)
                }
            },
            [a.ST.StoreTransactions]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.StoreRevenue]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.ShareLinkAttribution1DPayerConversionRatio]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.ShareLinkAttribution1DPlaytimePerUserInMinutes]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.ShareLinkAttribution1DRobuxPerUser]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.ShareLinkAttribution30DPayerConversionRatio]: {
                defaultTotalSummaryTypes: A,
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Title.Table.PayerConversion30D", s.f.Analytics),
                    tooltipKey: (0, r.o)("Description.Table.PayerConversion30D")
                }
            },
            [a.ST.ShareLinkAttribution30DPlaytimePerUserInMinutes]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.ShareLinkAttribution30DRobuxPerUser]: {
                defaultTotalSummaryTypes: A,
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Title.Table.RevenuePerUser30D", s.f.Analytics),
                    tooltipKey: (0, r.o)("Description.Table.RevenuePerUser30D")
                }
            },
            [a.ST.ShareLinkAttribution7DPayerConversionRatio]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.ShareLinkAttribution7DPlaytimePerUserInMinutes]: {
                defaultTotalSummaryTypes: A,
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Title.Table.PlaytimePerUser7D", s.f.Analytics),
                    tooltipKey: (0, r.o)("Description.Table.PlaytimePerUser7D")
                }
            },
            [a.ST.ShareLinkAttribution7DRobuxPerUser]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.ShareLinkAttributionD1RetentionRatio]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.ShareLinkAttributionD30RetentionRatio]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.ShareLinkAttributionD7RetentionRatio]: {
                defaultTotalSummaryTypes: A,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.o)("Description.Table.D7Retention")
                }
            },
            [a.ST.ShareLinkQualifiedClickCVR]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.o)("Description.Table.UsersDetailPageCTR")
                }
            },
            [a.ST.ShareLinkQualifiedUniqueUsersWithPlaySessions]: {
                defaultTotalSummaryTypes: A,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.o)("Description.Table.QualifiedUsersWithPlays")
                }
            },
            [a.ST.ShareLinkUniqueUsersWithClicks]: {
                defaultTotalSummaryTypes: A,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.o)("Description.Table.UsersWithDetailPageVisits")
                }
            },
            [a.ST.ShareLinkUniqueUsersWithPlaySessions]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.AffiliateLinkDailyAverageRobuxBookingsPerReactivationSpender]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.Q)("Description.AverageRobuxBookingsPerReactivationSpenderV3", s.f.Analytics),
                    titleKey: (0, r.Q)("Label.Metric.AverageRobuxBookingsPerReactivationSpenderV3", s.f.Analytics)
                }
            },
            [a.ST.AffiliateLinkDailyAffiliateActiveSpenderReactivationsPayoutRobux]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.Q)("Description.LifetimeEstimatedAffiliateActiveSpenderReactivationsPayoutRobuxV3", s.f.Analytics),
                    titleKey: (0, r.Q)("Label.Metric.LifetimeEstimatedAffiliateActiveSpenderReactivationsPayoutRobuxV3", s.f.Analytics)
                }
            },
            [a.ST.AffiliateLinkDailyQualifiedActiveSpenderReactivations]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.Q)("Description.LifetimeQualifiedActiveSpenderReactivationsV3", s.f.Analytics),
                    titleKey: (0, r.Q)("Label.Metric.LifetimeQualifiedActiveSpenderReactivationsV3", s.f.Analytics)
                }
            },
            [a.ST.AffiliateLinkDailyQualifiedReactivationsSpenders]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.Q)("Description.LifetimeQualifiedReactivationsSpendersV3", s.f.Analytics),
                    titleKey: (0, r.Q)("Label.Metric.LifetimeQualifiedReactivationsSpendersV3", s.f.Analytics)
                }
            },
            [a.ST.AffiliateLinkDailyAffiliateReactivationsPayoutRobux]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.Q)("Description.LifetimeEstimatedAffiliateReactivationsPayoutRobuxV3", s.f.Analytics),
                    titleKey: (0, r.Q)("Label.Metric.LifetimeEstimatedAffiliateReactivationsPayoutRobuxV3", s.f.Analytics)
                }
            },
            [a.ST.AffiliateLinkDailyQualifiedSignupSpenders]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.Q)("Description.LifetimeQualifiedSignupSpendersV3", s.f.Analytics),
                    titleKey: (0, r.Q)("Label.Metric.LifetimeQualifiedSignupSpendersV3", s.f.Analytics)
                }
            },
            [a.ST.AffiliateLinkDailyAverageRobuxBookingsPerSignupSpender]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.Q)("Description.AverageRobuxBookingsPerSignupSpenderV3", s.f.Analytics),
                    titleKey: (0, r.Q)("Label.Metric.AverageRobuxBookingsPerSignupSpenderV3", s.f.Analytics)
                }
            },
            [a.ST.AffiliateLinkDailyAffiliateSignupsPayoutRobux]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.Q)("Description.LifetimeEstimatedAffiliateSignupsPayoutRobuxV3", s.f.Analytics),
                    titleKey: (0, r.Q)("Label.Metric.LifetimeEstimatedAffiliateSignupsPayoutRobuxV3", s.f.Analytics)
                }
            },
            [a.ST.AffiliateLinkDailyBookingsPerSpenderCombined]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.Q)("Description.BookingsPerSpenderCombinedV3", s.f.Analytics),
                    titleKey: (0, r.Q)("Label.Metric.BookingsPerSpenderCombinedV3", s.f.Analytics)
                }
            },
            [a.ST.AffiliateLinkDailyVisits]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.Q)("Description.Metric.AffiliateLinkDailyVisits", s.f.Analytics)
                }
            },
            [a.ST.AffiliateLinkDailyQualifiedSignups]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.Q)("Description.LifetimeQualifiedSignupsV3", s.f.Analytics)
                }
            },
            [a.ST.AffiliateLinkDailyQualifiedReactivations]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.Q)("Description.LifetimeQualifiedReactivationsV3", s.f.Analytics)
                }
            },
            [a.ST.AffiliateLinkDailyTotalPayoutRobux]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.Q)("Description.LifetimeEstimatedAffiliateCombinedPayoutRobuxV3", s.f.Analytics),
                    titleKey: (0, r.Q)("Label.Metric.LifetimeEstimatedAffiliateCombinedPayoutRobuxV3", s.f.Analytics)
                }
            },
            [a.ST.CreatorRewardsAudienceExpansionFunnelSignups]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.Q)("Description.Metric.AESignups", s.f.Analytics)
                }
            },
            [a.ST.CreatorRewardsAudienceExpansionFunnelReactivations]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Label.Metric.LifetimeQualifiedReactivationsV3", s.f.Analytics),
                    tooltipKey: (0, r.Q)("Description.Metric.AEReactivations", s.f.Analytics)
                }
            },
            [a.ST.CreatorRewardsAudienceExpansionFunnelPercentOfNewUsers]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Label.Metric.AEAudienceExpansionPercentage", s.f.Analytics),
                    tooltipKey: (0, r.Q)("Description.Metric.AEAudienceExpansionPercentage", s.f.Analytics)
                }
            },
            [a.ST.CreatorRewardsAudienceExpansionFunnelRetentionD1]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Label.Metric.AERetentionD1", s.f.Analytics),
                    tooltipKey: (0, r.Q)("Description.Metric.AERetentionD1", s.f.Analytics)
                }
            },
            [a.ST.CreatorRewardsAudienceExpansionFunnelRetentionD7]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Label.Metric.AERetentionD7", s.f.Analytics),
                    tooltipKey: (0, r.Q)("Description.Metric.AERetentionD7", s.f.Analytics)
                }
            },
            [a.ST.CreatorRewardsAudienceExpansionFunnelPayerConversion7D]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Label.Metric.AEPayerConversion7D", s.f.Analytics),
                    tooltipKey: (0, r.Q)("Description.Metric.AEPayerConversion7D", s.f.Analytics)
                }
            },
            [a.ST.CreatorRewardsAudienceExpansionFunnelRevenuePerPayer7D]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Label.Metric.AERevenuePerPayer7D", s.f.Analytics),
                    tooltipKey: (0, r.Q)("Description.Metric.AERevenuePerPayer7D", s.f.Analytics)
                }
            },
            [a.ST.CreatorRewardsAudienceExpansionFunnelRevenuePerUser7D]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Label.Metric.AERevenuePerUser7D", s.f.Analytics),
                    tooltipKey: (0, r.Q)("Description.Metric.AERevenuePerUser7D", s.f.Analytics)
                }
            },
            [a.ST.CreatorRewardsAudienceExpansionFunnelPayerConversion60D]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Label.Metric.AEPayerConversion60D", s.f.Analytics),
                    tooltipKey: (0, r.Q)("Label.Description.AEPayerConversion60D", s.f.Analytics)
                }
            },
            [a.ST.CreatorRewardsAudienceExpansionFunnelRevenuePerPayer60D]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Label.Metric.AERevenuePerPayer60D", s.f.Analytics),
                    tooltipKey: (0, r.Q)("Label.Description.AERevenuePerPayer60D", s.f.Analytics)
                }
            },
            [a.ST.CreatorRewardsAudienceExpansionFunnelRevenuePerUser60D]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Label.Metric.AERevenuePerUser60D", s.f.Analytics),
                    tooltipKey: (0, r.Q)("Label.Description.AERevenuePerUser60D", s.f.Analytics)
                }
            },
            [a.ST.CreatorRewardsAudienceExpansionFunnelEstimatedPayout]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Label.Metric.CreatorRewardsLifetimeEstimatedAffiliatePayoutRobux", s.f.Analytics),
                    tooltipKey: (0, r.Q)("Label.Description.AERevenuePerPayer60D", s.f.Analytics)
                }
            },
            [a.ST.FriendReferralAverageRobuxBookingsPerSpender]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.FriendReferralLifetimeEstimatedAffiliatePayoutRobux]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.FriendReferralLifetimeQualifiedSignups]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.FriendReferralLifetimeQualifiedSpenders]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.FriendReferralLifetimeVisits]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.PlayerFeedbackVotesCount]: {
                defaultTotalSummaryTypes: [],
                exploreModeChartType: o.f.Column
            },
            [a.Ea.MatchmakingCategoricalCustomSignalsSimilarityRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Label.Metric.MatchmakingCategoricalCustomSignalsSimilarityRatio", s.f.Matchmaking),
                    tooltipKey: (0, r.Q)("Description.MatchmakingCategoricalCustomSignalsSimilarityRatio", s.f.Matchmaking)
                }
            },
            [a.Ea.MatchmakingNumericCustomSignalsDifference]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Label.Metric.MatchmakingNumericCustomSignalsDifference", s.f.Matchmaking),
                    tooltipKey: (0, r.Q)("Description.MatchmakingNumericCustomSignalsDifference", s.f.Matchmaking)
                }
            },
            [a.ST.MatchmakingPlayerAttributesLoadingStatusAvg]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Label.Metric.MatchmakingPlayerAttributesLoadingStatusAvg", s.f.Matchmaking),
                    tooltipKey: (0, r.Q)("Description.MatchmakingPlayerAttributesLoadingStatusAvg", s.f.Matchmaking)
                }
            },
            [a.Ea.MatchmakingSignalsAgeDifference]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Label.Metric.MatchmakingSignalsAgeDifference", s.f.Matchmaking),
                    tooltipKey: (0, r.Q)("Description.MatchmakingSignalsAgeDifference", s.f.Matchmaking)
                }
            },
            [a.Ea.MatchmakingSignalsCommonChatGroupRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Label.Metric.MatchmakingSignalsCommonChatGroupRatio", s.f.Matchmaking),
                    tooltipKey: (0, r.Q)("Description.MatchmakingSignalsCommonChatGroupRatio", s.f.Matchmaking)
                }
            },
            [a.Ea.MatchmakingSignalsCommonDeviceTypeRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Label.Metric.MatchmakingSignalsCommonDeviceTypeRatio", s.f.Matchmaking),
                    tooltipKey: (0, r.Q)("Description.MatchmakingSignalsCommonDeviceTypeRatio", s.f.Matchmaking)
                }
            },
            [a.Ea.MatchmakingSignalsCommonLanguageRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Label.Metric.MatchmakingSignalsCommonLanguageRatio", s.f.Matchmaking),
                    tooltipKey: (0, r.Q)("Description.MatchmakingSignalsCommonLanguageRatio", s.f.Matchmaking)
                }
            },
            [a.Ea.MatchmakingSignalsDeltaPing]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Label.Metric.MatchmakingSignalsDeltaPing", s.f.Matchmaking),
                    tooltipKey: (0, r.Q)("Description.MatchmakingSignalsDeltaPing", s.f.Matchmaking)
                }
            },
            [a.Ea.MatchmakingSignalsEstimatePing]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Label.Metric.MatchmakingSignalsEstimatedPing", s.f.Matchmaking),
                    tooltipKey: (0, r.Q)("Description.MatchmakingSignalsEstimatedPing", s.f.Matchmaking)
                }
            },
            [a.Ea.MatchmakingSignalsOccupancyRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Label.Metric.MatchmakingSignalsOccupancyRatio", s.f.Matchmaking),
                    tooltipKey: (0, r.Q)("Description.MatchmakingSignalsOccupancyRatio", s.f.Matchmaking)
                }
            },
            [a.Ea.MatchmakingSignalsPlayHistoryDifference]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Label.Metric.MatchmakingSignalsPlayHistoryDifference", s.f.Matchmaking),
                    tooltipKey: (0, r.Q)("Description.MatchmakingSignalsPlayHistoryDifference", s.f.Matchmaking)
                }
            },
            [a.ST.MatchmakingSignalsPreferredPlayerMatchRatioAvg]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Label.Metric.MatchmakingSignalsFriendsMatchRatioAvg", s.f.Matchmaking),
                    tooltipKey: (0, r.Q)("Description.MatchmakingSignalsFriendsMatchRatioAvg", s.f.Matchmaking)
                }
            },
            [a.Ea.MatchmakingSignalsVoiceChatRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.Q)("Label.Metric.MatchmakingSignalsVoiceChatRatio", s.f.Matchmaking),
                    tooltipKey: (0, r.Q)("Description.MatchmakingSignalsVoiceChatRatio", s.f.Matchmaking)
                }
            },
            [a.ST.DataStoreListRequests]: {
                defaultTotalSummaryTypes: [{
                    type: f.Average
                }],
                exploreModeChartType: o.f.Spline
            },
            [a.ST.DataStoreReadRequestsQuotaStandard]: {
                defaultTotalSummaryTypes: []
            },
            [a.ST.DataStoreWriteRequestsQuotaOrdered]: {
                defaultTotalSummaryTypes: []
            },
            [a.ST.DataStoreStorageQuotaBytes]: {
                defaultTotalSummaryTypes: []
            },
            [a.ST.DataStoreStorageUsageBytes]: {
                defaultTotalSummaryTypes: [],
                exploreModeChartType: o.f.Spline
            },
            [a.ST.DataStoreWriteRequests]: {
                defaultTotalSummaryTypes: [{
                    type: f.Average
                }],
                exploreModeChartType: o.f.Spline
            },
            [a.ST.DataStoreRequestsByStatus]: {
                exploreModeChartType: o.f.Spline
            },
            [a.ST.DataStoreRequestsByEndpoint]: {
                exploreModeChartType: o.f.Spline
            },
            [a.ST.DataStoreRemoveRequests]: {
                defaultTotalSummaryTypes: [{
                    type: f.Average
                }],
                exploreModeChartType: o.f.Spline
            },
            [a.ST.DataStoreRemoveRequestsQuotaStandard]: {
                defaultTotalSummaryTypes: []
            },
            [a.ST.DataStoreRemoveRequestsQuotaOrdered]: {
                defaultTotalSummaryTypes: []
            },
            [a.ST.DataStoreReadRequestsQuotaOrdered]: {
                defaultTotalSummaryTypes: []
            },
            [a.ST.DataStoreWriteRequestsQuotaStandard]: {
                defaultTotalSummaryTypes: []
            },
            [a.ST.DataStoreListRequestsQuotaStandard]: {
                defaultTotalSummaryTypes: []
            },
            [a.ST.DataStoreListRequestsQuotaOrdered]: {
                defaultTotalSummaryTypes: []
            },
            [a.ST.DataStoreListRequestsQuota]: {
                defaultTotalSummaryTypes: []
            },
            [a.ST.DataStoreReadRequests]: {
                exploreModeChartType: o.f.Spline,
                defaultTotalSummaryTypes: [{
                    type: f.Average
                }]
            },
            [a.ST.DataStoreConsumedReadRequests]: {
                defaultTotalSummaryTypes: [{
                    type: f.QuotaPercentageUsage
                }],
                exploreModeChartType: o.f.Spline
            },
            [a.ST.DataStoreConsumedWriteRequests]: {
                defaultTotalSummaryTypes: [{
                    type: f.QuotaPercentageUsage
                }],
                exploreModeChartType: o.f.Spline
            },
            [a.ST.DataStoreConsumedListRequests]: {
                defaultTotalSummaryTypes: [{
                    type: f.QuotaPercentageUsage
                }],
                exploreModeChartType: o.f.Spline
            },
            [a.ST.DataStoreConsumedRemoveRequests]: {
                defaultTotalSummaryTypes: [{
                    type: f.QuotaPercentageUsage
                }],
                exploreModeChartType: o.f.Spline
            },
            [a.ST.CommerceGMV]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.CommerceQuantitySold]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.CommerceClicks]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.CommerceImpressions]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.CommerceOrders]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.CommerceCheckouts]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.CommerceUniqueClicks]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.CommerceUniqueImpressions]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.CommerceUniqueCheckouts]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.CommerceUniqueOrders]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.AdsPublisherReportingTotalRevenueRobux]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.AdsPublisherReportingTotalImpressions]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.AdsPublisherReportingVideo2DRevenueRobux]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.AdsPublisherReportingVideo2DImpressions]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.AdsPublisherReportingVideo2DDailyUniqueViewer]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.CommunityGroupPageViews]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.CommunityGroupPageUniqueVisitors]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.CommunityMembershipChangeEvents]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.CommunityForumContentEventCount]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.CommunityForumContentUniqueUsers]: {
                defaultTotalSummaryTypes: A
            },
            [a.ST.CommunityMembershipCount]: {
                defaultTotalSummaryTypes: P
            },
            [a.ST.VideoServiceExclusivePlaybackSeconds]: {
                defaultTotalSummaryTypes: A,
                dataPointTransformerType: v.ScaleBackBy3600
            },
            [a.ST.BandwidthTotalRecvMaxBytes]: {
                dataPointTransformerType: v.ScaleBackBy1000
            },
            [a.ST.BandwidthTotalSendMaxBytes]: {
                dataPointTransformerType: v.ScaleBackBy1000
            }
        },
        E = {
            [a.ST.ThumbnailWinningSegments]: {
                rendererType: "WinningSegments",
                valueTranslationKeys: {
                    male_below_13: {
                        name: (0, r.Q)("Label.WinningSegment.MaleBelow13", s.f.Analytics)
                    },
                    female_below_13: {
                        name: (0, r.Q)("Label.WinningSegment.FemaleBelow13", s.f.Analytics)
                    },
                    male_above_13: {
                        name: (0, r.Q)("Label.WinningSegment.MaleAbove13", s.f.Analytics)
                    },
                    female_above_13: {
                        name: (0, r.Q)("Label.WinningSegment.FemaleAbove13", s.f.Analytics)
                    },
                    below_18: {
                        name: (0, r.Q)("Label.WinningSegment.Below18", s.f.Analytics)
                    },
                    above_or_equal_18: {
                        name: (0, r.Q)("Label.WinningSegment.AboveOrEqual18", s.f.Analytics)
                    }
                }
            }
        },
        M = e => {
            let t = a.Ib[e],
                i = t.valueType === a.eK.Numeric ? O[e] : E[e],
                n = {
                    ...D,
                    ...t,
                    ...i
                },
                r = C[e];
            return null != r && (n.unit = r.unit, n.decimalPrecision = r.decimalPrecision), n
        };
    e.s(["l", () => h, "U", 0, M, "J", 0, e => {
        var t;
        return e && null != (t = M(e).exploreModeChartType) ? t : o.f.Spline
    }, "y", 0, e => {
        var t;
        return R(e) && (null == (t = a.Ib[e]) ? void 0 : t.valueType) === a.eK.Numeric
    }, "z", 0, R, "P", 0, b], 908374)
}, 11517, e => {
    "use strict";
    var t = e.i(31611),
        i = e.i(908374);
    let n = e => "string" == typeof e && e.trim().length > 0,
        a = e => !!e && "object" == typeof e && e.metric === t.Ea.CustomEventsV2 && n(e.customEventName) && (void 0 === e.aggregationType || Object.values(t.W4).includes(e.aggregationType)),
        r = e => a(e) ? e.metric : e,
        o = e => {
            var t;
            let r;
            return !!e && "object" == typeof e && n(e.key) && (n(r = t = e.metric) && (0, i.y)(r) || a(t))
        },
        u = e => !!e && "object" == typeof e && "sources" in e && !!Array.isArray(e.sources) && 0 !== e.sources.length && !!n(e.formula) && e.sources.every(o),
        l = e => {
            if (!u(e)) return [r(e)];
            let t = new Set;
            return e.sources.forEach(e => {
                t.add(r(e.metric))
            }), Array.from(t)
        },
        s = e => {
            if (!u(e)) return r(e);
            let t = [...new Set(l(e))].sort();
            return "ACEComputed:".concat(t.join("|"))
        };
    e.s(["q", 0, l, "R", 0, s, "S", 0, e => {
        let t = [...new Set(e.map(s))].sort().join("|");
        return "MetricSet:".concat(t)
    }, "Y", 0, r, "t", 0, l, "Z", 0, u, "Q", 0, a])
}, 606662, e => {
    "use strict";
    var t = e.i(31611),
        i = e.i(927868);
    let n = (e, t) => e.some(e => e === t);
    e.s(["d", 0, (e, i) => {
        let n = t.V6[e],
            a = n.dimension;
        switch (a) {
            case t.EM.PercentileType:
                var r;
                if (!i.percentile) return n.defaultMetric;
                return null != (r = n.byPercentileType[i.percentile]) ? r : n.defaultMetric;
            case t.EM.AggregationType:
                if (!i.aggregationType) return n.defaultMetric;
                return n.byAggregationType[i.aggregationType];
            default:
                throw Error("Unhandled fanout dimension: ".concat(String(a)))
        }
    }, "E", 0, e => {
        let i = t.V6[e],
            n = i.dimension;
        switch (n) {
            case t.EM.PercentileType:
                return Object.values(i.byPercentileType);
            case t.EM.AggregationType:
                return Object.values(i.byAggregationType);
            default:
                throw Error("Unhandled fanout dimension: ".concat(String(n)))
        }
    }, "b", 0, (e, a) => {
        if (a !== t.EM.PercentileType && a !== t.EM.AggregationType) return;
        let r = e.flatMap(e => {
            let n;
            return (0, i.s)(t.Ea, e) ? t.V6[e].dimension === a ? ["percentileTypes" in (n = t.xy[e]) ? n.percentileTypes : n.aggregationTypes] : [] : []
        });
        if (0 === r.length) return;
        let [o, ...u] = r;
        if (void 0 !== o) return u.reduce((e, t) => e.filter(e => n(t, e)), [...o])
    }, "u", 0, n])
}]);

//# debugId=6e099c8f-c818-b2dc-1b52-b04b665e6999
//# sourceMappingURL=41n_phk2jmeoa.js.map
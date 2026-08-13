;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "22edf025-28a0-d793-627d-b2d9ec2dc631")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 956154, e => {
    "use strict";
    e.s(["COMPARISON_RELATIVE_OFFSET_TO_MS", 0, {
        "7d": 6048e5,
        "14d": 12096e5,
        "28d": 24192e5
    }, "ComparisonOffset", 0, ["7d", "14d", "28d"]])
}, 973005, e => {
    "use strict";
    var t = e.i(31611),
        i = e.i(927868);
    let r = e => (0, i.isValidEnumValue)(t.RAQIV2UIPseudoDimension, e) && t.RAQIV2DimensionDisplayConfig[e].pseudoDimensionConfig.type === t.RAQIV2UIPseudoDimensionType.MetricFanout;
    e.s(["default", 0, r, "hasMetricFanoutBreakdown", 0, e => {
        var t;
        return null != (t = null == e ? void 0 : e.some(r)) && t
    }])
}, 339923, e => {
    "use strict";
    var t = e.i(31611),
        i = e.i(730530),
        r = e.i(577038),
        n = e.i(881670),
        o = e.i(927868),
        s = e.i(908374),
        u = e.i(11517);
    let a = e => "string" == typeof e && e.trim().length > 0,
        d = e => (0, i.brandUntranslatableText)(e),
        l = (0, i.translationKey)("Label.ExploreMode.UntitledFormula", n.TranslationNamespace.Analytics);
    e.s(["brandUserSuppliedText", 0, d, "getDisplayUnitFromMetricLike", 0, (e, t) => {
        let {
            translate: r
        } = t;
        if ((0, u.isComputedMetric)(e)) return (0, i.brandUntranslatableText)("");
        let {
            localizedName: n
        } = (0, s.default)((0, u.getUIMetricFromAtomicMetricLike)(e));
        return r(n)
    }, "getIsAverageAggregationMetric", 0, e => {
        var t;
        if ((0, u.isComputedMetric)(e)) return !1;
        let {
            defaultTotalSummaryTypes: i
        } = (0, s.default)((0, u.getUIMetricFromAtomicMetricLike)(e));
        return (null == i || null == (t = i[0]) ? void 0 : t.type) === r.default.Average
    }, "getIsPositiveGoodFromMetricLike", 0, e => !!(0, u.isComputedMetric)(e) || (0, s.default)((0, u.getUIMetricFromAtomicMetricLike)(e)).isPositiveGood, "getMetricLabelFromMetricLike", 0, (e, t) => {
        if (!(0, u.isComputedMetric)(e)) {
            if ((0, u.isCustomEventsAtomicMetricLike)(e)) return d(e.customEventName);
            let {
                localizedName: i
            } = (0, s.default)((0, u.getUIMetricFromAtomicMetricLike)(e));
            return t ? t.translate(i) : d(i.key)
        }
        return d(a(e.name) ? e.name : e.formula)
    }, "getMetricTitleKeyFromMetricLike", 0, e => (0, u.isComputedMetric)(e) ? a(e.name) ? d(e.name) : l : (0, u.isCustomEventsAtomicMetricLike)(e) ? d(e.customEventName) : (0, s.default)((0, u.getUIMetricFromAtomicMetricLike)(e)).localizedName, "getRAQIV2BenchmarkMetricFromMetricLike", 0, e => {
        if ((0, u.isComputedMetric)(e)) return null;
        let i = (0, u.getUIMetricFromAtomicMetricLike)(e);
        return (0, o.isValidEnumValue)(t.RAQIV2Metric, i) ? i : null
    }])
}, 860504, e => {
    "use strict";
    var t = e.i(677753),
        i = function(e, t) {
            return (i = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var i in t) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i])
            })(e, t)
        };

    function r(e, t, i, r) {
        return new(i || (i = Promise))(function(n, o) {
            function s(e) {
                try {
                    a(r.next(e))
                } catch (e) {
                    o(e)
                }
            }

            function u(e) {
                try {
                    a(r.throw(e))
                } catch (e) {
                    o(e)
                }
            }

            function a(e) {
                var t;
                e.done ? n(e.value) : ((t = e.value) instanceof i ? t : new i(function(e) {
                    e(t)
                })).then(s, u)
            }
            a((r = r.apply(e, t || [])).next())
        })
    }

    function n(e, t) {
        var i, r, n, o = {
                label: 0,
                sent: function() {
                    if (1 & n[0]) throw n[1];
                    return n[1]
                },
                trys: [],
                ops: []
            },
            s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return s.next = u(0), s.throw = u(1), s.return = u(2), "function" == typeof Symbol && (s[Symbol.iterator] = function() {
            return this
        }), s;

        function u(u) {
            return function(a) {
                var d = [u, a];
                if (i) throw TypeError("Generator is already executing.");
                for (; s && (s = 0, d[0] && (o = 0)), o;) try {
                    if (i = 1, r && (n = 2 & d[0] ? r.return : d[0] ? r.throw || ((n = r.return) && n.call(r), 0) : r.next) && !(n = n.call(r, d[1])).done) return n;
                    switch (r = 0, n && (d = [2 & d[0], n.value]), d[0]) {
                        case 0:
                        case 1:
                            n = d;
                            break;
                        case 4:
                            return o.label++, {
                                value: d[1],
                                done: !1
                            };
                        case 5:
                            o.label++, r = d[1], d = [0];
                            continue;
                        case 7:
                            d = o.ops.pop(), o.trys.pop();
                            continue;
                        default:
                            if (!(n = (n = o.trys).length > 0 && n[n.length - 1]) && (6 === d[0] || 2 === d[0])) {
                                o = 0;
                                continue
                            }
                            if (3 === d[0] && (!n || d[1] > n[0] && d[1] < n[3])) {
                                o.label = d[1];
                                break
                            }
                            if (6 === d[0] && o.label < n[1]) {
                                o.label = n[1], n = d;
                                break
                            }
                            if (n && o.label < n[2]) {
                                o.label = n[2], o.ops.push(d);
                                break
                            }
                            n[2] && o.ops.pop(), o.trys.pop();
                            continue
                    }
                    d = t.call(e, o)
                } catch (e) {
                    d = [6, e], r = 0
                } finally {
                    i = n = 0
                }
                if (5 & d[0]) throw d[1];
                return {
                    value: d[0] ? d[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function o(e) {
        var i;
        return null == (i = e) ? i : {
            key: (0, t.exists)(i, "key") ? i.key : void 0,
            targets: (0, t.exists)(i, "targets") ? i.targets : void 0,
            unixStartTime: (0, t.exists)(i, "unixStartTime") ? i.unixStartTime : void 0,
            links: (0, t.exists)(i, "links") ? i.links : void 0,
            dimensions: (0, t.exists)(i, "dimensions") ? i.dimensions : void 0
        }
    }

    function s(e) {
        var i;
        return null == (i = e) ? i : {
            key: (0, t.exists)(i, "key") ? i.key : void 0,
            targets: (0, t.exists)(i, "targets") ? i.targets : void 0,
            category: (0, t.exists)(i, "category") ? i.category : void 0
        }
    }

    function u(e) {
        if (void 0 !== e) return null === e ? null : {
            dimension: e.dimension,
            values: e.values,
            operation: e.operation
        }
    }

    function a(e) {
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
                            orderFilters: void 0 === e.orderFilters ? void 0 : e.orderFilters.map(u),
                            orderTimeRange: function(e) {
                                if (void 0 !== e) return null === e ? null : {
                                    query: e.query,
                                    trailingDays: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            days: e.days
                                        }
                                    }(e.trailingDays)
                                }
                            }(e.orderTimeRange)
                        }
                    }(e.rank),
                    excludeOtherSeries: e.excludeOtherSeries,
                    excludedValues: e.excludedValues
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

    function d(e) {
        var i;
        return null == (i = e) ? i : {
            dimension: (0, t.exists)(i, "dimension") ? i.dimension : void 0,
            value: (0, t.exists)(i, "value") ? i.value : void 0,
            displayValue: (0, t.exists)(i, "displayValue") ? i.displayValue : void 0,
            variantKey: (0, t.exists)(i, "variantKey") ? i.variantKey : void 0
        }
    }

    function l(e) {
        var i;
        return null == (i = e) ? i : {
            key: (0, t.exists)(i, "key") ? i.key : void 0,
            targets: (0, t.exists)(i, "targets") ? i.targets : void 0
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function c(e) {
        var i;
        return null == (i = e) ? i : {
            code: (0, t.exists)(i, "code") ? i.code : void 0,
            severity: (0, t.exists)(i, "severity") ? i.severity : void 0,
            message: (0, t.exists)(i, "message") ? i.message : void 0,
            nodeId: (0, t.exists)(i, "nodeId") ? i.nodeId : void 0,
            suggestion: (0, t.exists)(i, "suggestion") ? i.suggestion : void 0,
            context: (0, t.exists)(i, "context") ? i.context : void 0
        }
    }

    function v(e) {
        if (void 0 !== e) return null === e ? null : {
            resourceType: e.resourceType,
            resourceId: e.resourceId,
            granularity: e.granularity,
            startTime: e.startTime,
            endTime: e.endTime,
            traceId: e.traceId
        }
    }

    function p(e) {
        var i;
        return null == (i = e) ? i : {
            nodeId: (0, t.exists)(i, "nodeId") ? i.nodeId : void 0,
            nodeType: (0, t.exists)(i, "nodeType") ? i.nodeType : void 0,
            startOffsetMs: (0, t.exists)(i, "startOffsetMs") ? i.startOffsetMs : void 0,
            durationMs: (0, t.exists)(i, "durationMs") ? i.durationMs : void 0,
            success: (0, t.exists)(i, "success") ? i.success : void 0,
            error: (0, t.exists)(i, "error") ? i.error : void 0,
            failedDueTo: (0, t.exists)(i, "failedDueTo") ? i.failedDueTo : void 0,
            skipped: (0, t.exists)(i, "skipped") ? i.skipped : void 0,
            errorCode: (0, t.exists)(i, "errorCode") ? i.errorCode : void 0
        }
    }

    function m(e) {
        if (void 0 !== e) return null === e ? null : {
            input: e.input,
            dimension: e.dimension,
            sourceDimension: e.sourceDimension,
            operation: e.operation,
            maxValues: e.maxValues
        }
    }

    function f(e) {
        if (void 0 !== e) return null === e ? null : {
            dimensions: e.dimensions,
            function: e._function,
            functionParams: e.functionParams
        }
    }

    function T(e) {
        if (void 0 !== e) return null === e ? null : {
            id: e.id,
            type: e.type,
            queryConfig: function(e) {
                if (void 0 !== e) return null === e ? null : {
                    metric: e.metric,
                    resourceType: e.resourceType,
                    resourceId: e.resourceId,
                    granularity: e.granularity,
                    breakdown: void 0 === e.breakdown ? void 0 : e.breakdown.map(f),
                    filters: void 0 === e.filters ? void 0 : e.filters.map(u),
                    topN: function(e) {
                        if (void 0 !== e) return null === e ? null : {
                            n: e.n,
                            orderByMetric: e.orderByMetric,
                            orderFilters: void 0 === e.orderFilters ? void 0 : e.orderFilters.map(u),
                            excludeOtherSeries: e.excludeOtherSeries,
                            orderTimeRangeDays: e.orderTimeRangeDays,
                            otherLabel: e.otherLabel,
                            dimension: e.dimension,
                            excludedValues: e.excludedValues
                        }
                    }(e.topN),
                    pseudoDimensionValues: e.pseudoDimensionValues,
                    breakdownSpecs: void 0 === e.breakdownSpecs ? void 0 : e.breakdownSpecs.map(a),
                    dynamicFilterBindings: void 0 === e.dynamicFilterBindings ? void 0 : e.dynamicFilterBindings.map(m)
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

    function I(e) {
        if (void 0 !== e) return null === e ? null : {
            id: e.id,
            name: e.name,
            nodes: void 0 === e.nodes ? void 0 : e.nodes.map(T)
        }
    }

    function y(e) {
        var i;
        return null == (i = e) ? i : {
            time: (0, t.exists)(i, "time") ? i.time : void 0,
            value: (0, t.exists)(i, "value") ? i.value : void 0,
            stringValues: (0, t.exists)(i, "stringValues") ? i.stringValues : void 0,
            status: (0, t.exists)(i, "status") ? i.status : void 0
        }
    }

    function g(e) {
        var i;
        return null == (i = e) ? i : {
            breakdownValue: (0, t.exists)(i, "breakdownValue") ? i.breakdownValue.map(d) : void 0,
            dataPoints: (0, t.exists)(i, "dataPoints") ? i.dataPoints.map(y) : void 0
        }
    }

    function R(e, i) {
        return null == e ? e : {
            values: (0, t.exists)(e, "values") ? e.values.map(g) : void 0
        }
    }

    function E(e) {
        var i;
        return null == (i = e) ? i : {
            nodeId: (0, t.exists)(i, "nodeId") ? i.nodeId : void 0,
            success: (0, t.exists)(i, "success") ? i.success : void 0,
            error: (0, t.exists)(i, "error") ? i.error : void 0,
            timeSeries: (0, t.exists)(i, "timeSeries") ? R(i.timeSeries) : void 0,
            scalarValue: (0, t.exists)(i, "scalarValue") ? i.scalarValue : void 0,
            executionTimeMs: (0, t.exists)(i, "executionTimeMs") ? i.executionTimeMs : void 0,
            errorCode: (0, t.exists)(i, "errorCode") ? i.errorCode : void 0,
            failedDueTo: (0, t.exists)(i, "failedDueTo") ? i.failedDueTo : void 0,
            skipped: (0, t.exists)(i, "skipped") ? i.skipped : void 0
        }
    }

    function x(e) {
        if (void 0 !== e) return null === e ? null : {
            namespace: e.namespace,
            name: e.name
        }
    }

    function h(e) {
        var i, r;
        return null == (i = e) ? i : {
            dimension: (0, t.exists)(i, "dimension") ? null == (r = i.dimension) ? r : {
                namespace: (0, t.exists)(r, "namespace") ? r.namespace : void 0,
                name: (0, t.exists)(r, "name") ? r.name : void 0
            } : void 0,
            values: (0, t.exists)(i, "values") ? i.values.map(d) : void 0
        }
    }

    function _(e) {
        var i;
        return null == (i = e) ? i : {
            metric: (0, t.exists)(i, "metric") ? i.metric : void 0,
            latestAvailableTime: (0, t.exists)(i, "latestAvailableTime") ? i.latestAvailableTime : void 0
        }
    }

    function O(e, i) {
        var r, n, o, s, u;
        return null == e ? e : {
            path: (0, t.exists)(e, "path") ? e.path : void 0,
            metadata: (0, t.exists)(e, "metadata") ? null == (r = e.metadata) ? r : {
                createdTime: (0, t.exists)(r, "createdTime") ? r.createdTime : void 0
            } : void 0,
            done: (0, t.exists)(e, "done") ? e.done : void 0,
            error: (0, t.exists)(e, "error") ? null == (n = e.error) ? n : {
                code: (0, t.exists)(n, "code") ? n.code : void 0,
                message: (0, t.exists)(n, "message") ? n.message : void 0,
                validationDetails: (0, t.exists)(n, "validationDetails") ? null == (o = n.validationDetails) ? o : {
                    field: (0, t.exists)(o, "field") ? o.field : void 0,
                    subject: (0, t.exists)(o, "subject") ? o.subject : void 0,
                    rejectedValues: (0, t.exists)(o, "rejectedValues") ? o.rejectedValues : void 0
                } : void 0
            } : void 0,
            queryResult: (0, t.exists)(e, "queryResult") ? R(e.queryResult) : void 0,
            dimensionValuesResult: (0, t.exists)(e, "dimensionValuesResult") ? null == (s = e.dimensionValuesResult) ? s : {
                values: (0, t.exists)(s, "values") ? s.values.map(h) : void 0
            } : void 0,
            metricMetadataResult: (0, t.exists)(e, "metricMetadataResult") ? null == (u = e.metricMetadataResult) ? u : {
                metadata: (0, t.exists)(u, "metadata") ? u.metadata.map(_) : void 0
            } : void 0
        }
    }
    var A = function(e) {
        function a() {
            return null !== e && e.apply(this, arguments) || this
        }
        return function(e, t) {
            if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

            function r() {
                this.constructor = e
            }
            i(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
        }(a, e), a.prototype.v1DagExecutePostRaw = function(e, i) {
            return r(this, void 0, void 0, function() {
                var r, o, s;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return r = {}, (o = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/dag/execute",
                                schemaPath: "/v1/dag/execute",
                                method: "POST",
                                headers: o,
                                query: r,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        graph: I(e.graph),
                                        context: v(e.context),
                                        includeDebug: e.includeDebug
                                    }
                                }(e.executeDagRequest)
                            }, i)];
                        case 1:
                            return s = n.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                var i, r, n;
                                return null == e ? e : {
                                    result: (0, t.exists)(e, "result") ? null == (i = e.result) ? i : {
                                        success: (0, t.exists)(i, "success") ? i.success : void 0,
                                        outputs: (0, t.exists)(i, "outputs") ? i.outputs.map(E) : void 0,
                                        metadata: (0, t.exists)(i, "metadata") ? null == (r = i.metadata) ? r : {
                                            totalExecutionTimeMs: (0, t.exists)(r, "totalExecutionTimeMs") ? r.totalExecutionTimeMs : void 0,
                                            traceId: (0, t.exists)(r, "traceId") ? r.traceId : void 0,
                                            totalNodes: (0, t.exists)(r, "totalNodes") ? r.totalNodes : void 0,
                                            complexity: (0, t.exists)(r, "complexity") ? null == (n = r.complexity) ? n : {
                                                queryCount: (0, t.exists)(n, "queryCount") ? n.queryCount : void 0,
                                                transformCount: (0, t.exists)(n, "transformCount") ? n.transformCount : void 0,
                                                aggregationCount: (0, t.exists)(n, "aggregationCount") ? n.aggregationCount : void 0,
                                                maxDepth: (0, t.exists)(n, "maxDepth") ? n.maxDepth : void 0,
                                                estimatedCost: (0, t.exists)(n, "estimatedCost") ? n.estimatedCost : void 0,
                                                maxFanOut: (0, t.exists)(n, "maxFanOut") ? n.maxFanOut : void 0,
                                                rootCount: (0, t.exists)(n, "rootCount") ? n.rootCount : void 0
                                            } : void 0,
                                            nodeTimings: (0, t.exists)(r, "nodeTimings") ? r.nodeTimings.map(p) : void 0
                                        } : void 0,
                                        errors: (0, t.exists)(i, "errors") ? i.errors.map(c) : void 0,
                                        warnings: (0, t.exists)(i, "warnings") ? i.warnings : void 0,
                                        partialSuccess: (0, t.exists)(i, "partialSuccess") ? i.partialSuccess : void 0
                                    } : void 0,
                                    operationId: (0, t.exists)(e, "operationId") ? e.operationId : void 0,
                                    pending: (0, t.exists)(e, "pending") ? e.pending : void 0
                                }
                            })]
                    }
                })
            })
        }, a.prototype.v1DagExecutePost = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), n(this, function(i) {
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
        }, a.prototype.v1DagValidatePostRaw = function(e, i) {
            return r(this, void 0, void 0, function() {
                var r, o, s;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return r = {}, (o = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/dag/validate",
                                schemaPath: "/v1/dag/validate",
                                method: "POST",
                                headers: o,
                                query: r,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        graph: I(e.graph),
                                        context: v(e.context)
                                    }
                                }(e.validateDagRequest)
                            }, i)];
                        case 1:
                            return s = n.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return null == e ? e : {
                                    isValid: (0, t.exists)(e, "isValid") ? e.isValid : void 0,
                                    errors: (0, t.exists)(e, "errors") ? e.errors.map(c) : void 0,
                                    warnings: (0, t.exists)(e, "warnings") ? e.warnings : void 0
                                }
                            })]
                    }
                })
            })
        }, a.prototype.v1DagValidatePost = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), n(this, function(i) {
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
        }, a.prototype.v1DimensionsResourceResourceTypeIdResourceIdPostRaw = function(e, i) {
            return r(this, void 0, void 0, function() {
                var r, o, s;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.resourceType || void 0 === e.resourceType) throw new t.RequiredError("resourceType", "Required parameter requestParameters.resourceType was null or undefined when calling v1DimensionsResourceResourceTypeIdResourceIdPost.");
                            if (null === e.resourceId || void 0 === e.resourceId) throw new t.RequiredError("resourceId", "Required parameter requestParameters.resourceId was null or undefined when calling v1DimensionsResourceResourceTypeIdResourceIdPost.");
                            return r = {}, (o = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/dimensions/resource/{resourceType}/id/{resourceId}".replace("{".concat("resourceType", "}"), encodeURIComponent(String(e.resourceType))).replace("{".concat("resourceId", "}"), encodeURIComponent(String(e.resourceId))),
                                schemaPath: "/v1/dimensions/resource/{resourceType}/id/{resourceId}",
                                method: "POST",
                                headers: o,
                                query: r,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        resourceType: e.resourceType,
                                        resourceId: e.resourceId,
                                        query: function(e) {
                                            if (void 0 !== e) return null === e ? null : {
                                                resourceType: e.resourceType,
                                                resourceId: e.resourceId,
                                                dimensions: void 0 === e.dimensions ? void 0 : e.dimensions.map(x),
                                                startTime: e.startTime,
                                                endTime: e.endTime,
                                                limit: e.limit,
                                                filters: void 0 === e.filters ? void 0 : e.filters.map(u),
                                                granularity: e.granularity
                                            }
                                        }(e.query)
                                    }
                                }(e.dimensionValuesRequest)
                            }, i)];
                        case 1:
                            return s = n.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return null == e ? e : {
                                    operation: (0, t.exists)(e, "operation") ? O(e.operation) : void 0
                                }
                            })]
                    }
                })
            })
        }, a.prototype.v1DimensionsResourceResourceTypeIdResourceIdPost = function(e, t) {
            return r(this, void 0, void 0, function() {
                return n(this, function(i) {
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
        }, a.prototype.v1MetricsMetadataPostRaw = function(e, i) {
            return r(this, void 0, void 0, function() {
                var r, o, s;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return r = {}, (o = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/metrics/metadata",
                                schemaPath: "/v1/metrics/metadata",
                                method: "POST",
                                headers: o,
                                query: r,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        query: function(e) {
                                            if (void 0 !== e) return null === e ? null : {
                                                metrics: e.metrics
                                            }
                                        }(e.query)
                                    }
                                }(e.metricMetadataRequest)
                            }, i)];
                        case 1:
                            return s = n.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return null == e ? e : {
                                    operation: (0, t.exists)(e, "operation") ? O(e.operation) : void 0
                                }
                            })]
                    }
                })
            })
        }, a.prototype.v1MetricsMetadataPost = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), n(this, function(i) {
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
        }, a.prototype.v1MetricsResourceResourceTypeIdResourceIdPostRaw = function(e, i) {
            return r(this, void 0, void 0, function() {
                var r, o, s;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.resourceType || void 0 === e.resourceType) throw new t.RequiredError("resourceType", "Required parameter requestParameters.resourceType was null or undefined when calling v1MetricsResourceResourceTypeIdResourceIdPost.");
                            if (null === e.resourceId || void 0 === e.resourceId) throw new t.RequiredError("resourceId", "Required parameter requestParameters.resourceId was null or undefined when calling v1MetricsResourceResourceTypeIdResourceIdPost.");
                            return r = {}, (o = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/metrics/resource/{resourceType}/id/{resourceId}".replace("{".concat("resourceType", "}"), encodeURIComponent(String(e.resourceType))).replace("{".concat("resourceId", "}"), encodeURIComponent(String(e.resourceId))),
                                schemaPath: "/v1/metrics/resource/{resourceType}/id/{resourceId}",
                                method: "POST",
                                headers: o,
                                query: r,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        resourceType: e.resourceType,
                                        resourceId: e.resourceId,
                                        query: function(e) {
                                            if (void 0 !== e) return null === e ? null : {
                                                resourceType: e.resourceType,
                                                resourceId: e.resourceId,
                                                metric: e.metric,
                                                granularity: e.granularity,
                                                breakdown: void 0 === e.breakdown ? void 0 : e.breakdown.map(f),
                                                filter: void 0 === e.filter ? void 0 : e.filter.map(u),
                                                startTime: e.startTime,
                                                endTime: e.endTime,
                                                limit: e.limit
                                            }
                                        }(e.query)
                                    }
                                }(e.queryRequest)
                            }, i)];
                        case 1:
                            return s = n.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return null == e ? e : {
                                    operation: (0, t.exists)(e, "operation") ? O(e.operation) : void 0
                                }
                            })]
                    }
                })
            })
        }, a.prototype.v1MetricsResourceResourceTypeIdResourceIdPost = function(e, t) {
            return r(this, void 0, void 0, function() {
                return n(this, function(i) {
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
        }, a.prototype.v1OperationsOperationIdGetRaw = function(e, i) {
            return r(this, void 0, void 0, function() {
                var r, o, s;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.operationId || void 0 === e.operationId) throw new t.RequiredError("operationId", "Required parameter requestParameters.operationId was null or undefined when calling v1OperationsOperationIdGet.");
                            return r = {}, void 0 !== e.resourceType && (r.resourceType = e.resourceType), void 0 !== e.resourceId && (r.resourceId = e.resourceId), o = {}, [4, this.request({
                                path: "/v1/operations/{operationId}".replace("{".concat("operationId", "}"), encodeURIComponent(String(e.operationId))),
                                schemaPath: "/v1/operations/{operationId}",
                                method: "GET",
                                headers: o,
                                query: r
                            }, i)];
                        case 1:
                            return s = n.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return null == e ? e : {
                                    operation: (0, t.exists)(e, "operation") ? O(e.operation) : void 0
                                }
                            })]
                    }
                })
            })
        }, a.prototype.v1OperationsOperationIdGet = function(e, t) {
            return r(this, void 0, void 0, function() {
                return n(this, function(i) {
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
        }, a.prototype.v1StatusConfigGetRaw = function(e, i) {
            return r(this, void 0, void 0, function() {
                var r, u, a;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return r = {}, void 0 !== e.universeId && (r.universeId = e.universeId), u = {}, [4, this.request({
                                path: "/v1/status-config",
                                schemaPath: "/v1/status-config",
                                method: "GET",
                                headers: u,
                                query: r
                            }, i)];
                        case 1:
                            return a = n.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    bannerConfigurations: (0, t.exists)(e, "bannerConfigurations") ? e.bannerConfigurations.map(s) : void 0,
                                    annotationConfigurations: (0, t.exists)(e, "annotationConfigurations") ? e.annotationConfigurations.map(o) : void 0,
                                    chartWarningConfigurations: (0, t.exists)(e, "chartWarningConfigurations") ? e.chartWarningConfigurations.map(l) : void 0
                                }
                            })]
                    }
                })
            })
        }, a.prototype.v1StatusConfigGet = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), n(this, function(i) {
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
        }, a
    }(t.BaseAPI);
    e.s(["AnalyticsQueryGatewayAPIApi", 0, A, "DataStatus", 0, {
        Invalid: "DATA_STATUS_INVALID",
        Valid: "DATA_STATUS_VALID",
        InProgress: "DATA_STATUS_IN_PROGRESS",
        Incomplete: "DATA_STATUS_INCOMPLETE",
        NotMeaningful: "DATA_STATUS_NOT_MEANINGFUL",
        Projected: "DATA_STATUS_PROJECTED",
        NotStatisticallySignificant: "DATA_STATUS_NOT_STATISTICALLY_SIGNIFICANT"
    }, "FilterOperation", 0, {
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
    }, "NodeType", 0, {
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
    }, "RankDirection", 0, {
        Invalid: "RANK_DIRECTION_INVALID",
        Top: "RANK_DIRECTION_TOP",
        Bottom: "RANK_DIRECTION_BOTTOM"
    }, "ResourceType", 0, {
        Invalid: "RESOURCE_TYPE_INVALID",
        Universe: "RESOURCE_TYPE_UNIVERSE",
        Creator: "RESOURCE_TYPE_CREATOR",
        Group: "RESOURCE_TYPE_GROUP",
        Organization: "RESOURCE_TYPE_ORGANIZATION",
        AdAccountId: "RESOURCE_TYPE_AD_ACCOUNT_ID"
    }, "VariantKind", 0, {
        Invalid: "VARIANT_KIND_INVALID",
        Percentile: "VARIANT_KIND_PERCENTILE",
        Aggregation: "VARIANT_KIND_AGGREGATION"
    }, "WindowAvgMode", 0, {
        Invalid: "WINDOW_AVG_MODE_INVALID",
        ActualCount: "WINDOW_AVG_MODE_ACTUAL_COUNT",
        WindowSize: "WINDOW_AVG_MODE_WINDOW_SIZE"
    }, "WindowReducer", 0, {
        Invalid: "WINDOW_REDUCER_INVALID",
        Sum: "WINDOW_REDUCER_SUM",
        Avg: "WINDOW_REDUCER_AVG",
        Min: "WINDOW_REDUCER_MIN",
        Max: "WINDOW_REDUCER_MAX",
        Count: "WINDOW_REDUCER_COUNT",
        First: "WINDOW_REDUCER_FIRST",
        Last: "WINDOW_REDUCER_LAST"
    }])
}, 847579, e => {
    "use strict";
    var t = e.i(860504);
    e.s(["AnalyticsQueryGatewayAPIFilterOperation", () => t.FilterOperation])
}]);

//# debugId=22edf025-28a0-d793-627d-b2d9ec2dc631
//# sourceMappingURL=3hpp-t_qox785.js.map
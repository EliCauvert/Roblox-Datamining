;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "b67c6c58-80a3-5e17-2f48-c1537952e922")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 531007, e => {
    "use strict";
    var t, i = ((t = {}).Spline = "spline", t.Area = "area", t.Column = "column", t.Map = "map", t.Bar = "bar", t.Pie = "pie", t.DurationSpline = "duration_spline", t.DurationArea = "duration_area", t.MultipleMetricSpline = "multiple_metric_spline", t.Table = "Table", t);
    e.s(["ChartType", () => i])
}, 577038, e => {
    "use strict";
    var t, i = ((t = i || {}).Average = "Average", t.Total = "Total", t.TotalAbsoluteValue = "TotalAbsoluteValue", t.SinglePoint = "SinglePoint", t.GrowthRate = "GrowthRate", t.QuotaPercentageUsage = "QuotaPercentageUsage", t.TopBreakdown = "TopBreakdown", t.LastValue = "LastValue", t);
    e.s(["default", 0, i])
}, 908374, 510785, 548152, 875907, e => {
    "use strict";
    var t, i, a, n = e.i(31611),
        r = e.i(730530),
        o = e.i(531007),
        s = e.i(923319),
        l = e.i(447311),
        u = e.i(881670),
        c = e.i(927868),
        d = e.i(577038);
    let y = [d.default.QuotaPercentageUsage];
    d.default.TopBreakdown;
    let p = e => (0, c.isValidArrayEnumValue)(y, e.type),
        m = d.default,
        T = d.default;
    e.s(["RAQIV2SummaryType", 0, m, "default", 0, T, "isRAQIV2DoubleMetricSummaryType", 0, p, "isRAQIV2SingleMetricSummaryType", 0, e => !p(e)], 510785);
    var v = ((t = v || {}).InExperienceCurrency = "inExperienceCurrency", t);
    e.s(["default", 0, v], 548152);
    var f = ((i = {}).PercentageOfFirstPoint = "PercentageOfFirstPoint", i.ScaleBackBy100 = "ScaleBackBy100", i.ScaleBackBy60 = "ScaleBackBy60", i.ScaleBackBy3600 = "ScaleBackBy3600", i.ScaleBackBy1000 = "ScaleBackBy1000", i.ScaleBackBy1000000000 = "ScaleBackBy1000000000", i);

    function g(e) {
        return (t, i) => {
            let [a, n, r] = i[t];
            return [a, null === n ? null : n * e, r]
        }
    }
    let R = {
        PercentageOfFirstPoint: (e, t) => {
            let [, i] = t[0], [a, n, r] = t[e], o = null;
            return i && null !== n && (o = n / i), [a, o, r]
        },
        ScaleBackBy100: g(.01),
        ScaleBackBy60: g(1 / 60),
        ScaleBackBy3600: g(1 / 3600),
        ScaleBackBy1000: g(.001),
        ScaleBackBy1000000000: g(1e-9)
    };
    e.s(["NumericDataPointTransformerType", () => f, "default", 0, R], 875907);
    let A = {
        defaultTotalSummaryTypes: [{
            type: T.Average
        }]
    };
    n.RAQIV2Metric.ThumbnailWinningSegments;
    let I = e => (0, c.isValidEnumValue)(n.RAQIV2Metric, e) || (0, c.isValidEnumValue)(n.RAQIV2UIMetric, e),
        M = {
            [n.RAQIV2Metric.VideoServiceExclusivePlaybackSeconds]: {
                unit: n.RAQIV2MetricUnit.Hours,
                decimalPrecision: 1
            },
            [n.RAQIV2Metric.BandwidthTotalRecvMaxBytes]: {
                unit: n.RAQIV2MetricUnit.Kilobytes,
                decimalPrecision: 1
            },
            [n.RAQIV2Metric.BandwidthTotalSendMaxBytes]: {
                unit: n.RAQIV2MetricUnit.Kilobytes,
                decimalPrecision: 1
            }
        };
    var S = ((a = {}).WinningSegments = "WinningSegments", a);
    let D = [{
            type: T.Total
        }],
        C = [{
            type: T.LastValue
        }],
        h = [10, 50],
        V = {
            [n.RAQIV2Metric.CreatorRewardsAverageRobuxBookingsPerSpender]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.CreatorRewardsAverageRobuxBookingsPerSpender", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.CreatorRewardsLifetimeEstimatedAffiliatePayoutRobux]: {
                defaultTotalSummaryTypes: D,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.CreatorRewardsLifetimeEstimatedAffiliatePayoutRobux", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.CreatorRewardsLifetimeQualifiedReactivations]: {
                defaultTotalSummaryTypes: D,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.CreatorRewardsLifetimeQualifiedReactivations", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.CreatorRewardsLifetimeQualifiedSignups]: {
                defaultTotalSummaryTypes: D,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.CreatorRewardsLifetimeQualifiedSignups", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.CreatorRewardsLifetimeQualifiedSpenders]: {
                defaultTotalSummaryTypes: D,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.CreatorRewardsLifetimeQualifiedSpenders", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.CommunityAnnouncementEventCount]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.CommunityAnnouncementUniqueUsers]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.CommunityAnnouncementNotificationCTR]: {
                defaultTotalSummaryTypes: C
            },
            [n.RAQIV2Metric.EconomyTransactionAmount]: {
                defaultTotalSummaryTypes: D,
                exploreModeChartType: o.ChartType.Column,
                specialNumberFormatting: v.InExperienceCurrency
            },
            [n.RAQIV2Metric.EconomyTransactionAmountSinks]: {
                defaultTotalSummaryTypes: D,
                exploreModeChartType: o.ChartType.Column,
                specialNumberFormatting: v.InExperienceCurrency
            },
            [n.RAQIV2Metric.EconomyTransactionCount]: {
                defaultTotalSummaryTypes: D,
                exploreModeChartType: o.ChartType.Column
            },
            [n.RAQIV2Metric.EconomyAverageWalletBalance]: {
                exploreModeChartType: o.ChartType.Spline,
                specialNumberFormatting: v.InExperienceCurrency
            },
            [n.RAQIV2Metric.FunnelStepCompletionRate]: {
                columnDisplayConfigOverrides: {
                    cellBackground: {
                        type: s.CellBackgroundType.ValueOpacityFill,
                        color: l.TableCellBackgroundColor.Positive
                    }
                }
            },
            [n.RAQIV2Metric.FunnelUserStepCompletionRate]: {
                columnDisplayConfigOverrides: {
                    cellBackground: {
                        type: s.CellBackgroundType.ValueOpacityFill,
                        color: l.TableCellBackgroundColor.Positive
                    }
                }
            },
            [n.RAQIV2Metric.FunnelStepChurnRate]: {
                columnDisplayConfigOverrides: {
                    cellBackground: {
                        type: s.CellBackgroundType.ValueOpacityFill,
                        color: l.TableCellBackgroundColor.Negative
                    }
                }
            },
            [n.RAQIV2Metric.FunnelUserChurnRate]: {
                columnDisplayConfigOverrides: {
                    cellBackground: {
                        type: s.CellBackgroundType.ValueOpacityFill,
                        color: l.TableCellBackgroundColor.Negative
                    }
                }
            },
            [n.RAQIV2Metric.FunnelStepOverallCompletionRate]: {
                defaultTotalSummaryTypes: D,
                columnDisplayConfigOverrides: {
                    cellBackground: {
                        type: s.CellBackgroundType.ValuePercentageWidthFill,
                        color: l.TableCellBackgroundColor.Progression
                    },
                    widthWeight: 40
                }
            },
            [n.RAQIV2Metric.FunnelUserOverallCompletionRate]: {
                defaultTotalSummaryTypes: D,
                columnDisplayConfigOverrides: {
                    cellBackground: {
                        type: s.CellBackgroundType.ValuePercentageWidthFill,
                        color: l.TableCellBackgroundColor.Progression
                    },
                    widthWeight: 40
                }
            },
            [n.RAQIV2Metric.FunnelUserTotalCount]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.FunnelStepTotalCount]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.JourneyTotalUsers]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.JourneyCompletionUsers]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.JourneyEntryTransitions]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.JourneyLastStageTransitions]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.JourneyStageUserCount]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.JourneyStageTransitionCount]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.JourneyNodeUserCount]: {
                defaultTotalSummaryTypes: D,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.JourneyNodeUserCount", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.JourneyNodeUserChurnCount]: {
                defaultTotalSummaryTypes: D,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.JourneyNodeUserChurnCount", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.JourneyNodeUserChurnRate]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.JourneyNodeUserChurnRate", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.JourneyNodeTransitionCount]: {
                defaultTotalSummaryTypes: D,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.JourneyNodeTransitionCount", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.JourneyNodeTransitionChurnCount]: {
                defaultTotalSummaryTypes: D,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.JourneyNodeTransitionChurnCount", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.JourneyNodeTransitionChurnRate]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.JourneyNodeTransitionChurnRate", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.JourneyUserPctOfSource]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.JourneyUserPctOfSource", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.JourneyUserPctOfStart]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.JourneyUserPctOfStart", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.JourneyTransitionPctOfSource]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.JourneyTransitionPctOfSource", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.JourneyTransitionPctOfStart]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.JourneyTransitionPctOfStart", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.UniqueUsersWithPlaySessions]: {
                defaultTotalSummaryTypes: [{
                    type: T.Average
                }, {
                    type: T.Total
                }],
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.UsersWithPlays", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.UniqueUsersWithImpressions]: {
                defaultTotalSummaryTypes: [{
                    type: T.Average
                }, {
                    type: T.Total
                }],
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.UsersWithImpressions", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.UsersWithImpressions")
                }
            },
            [n.RAQIV2Metric.EndToEndCVR]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.ConversionRate", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.ConversionRate")
                }
            },
            [n.RAQIV2Metric.QualifiedUniqueUsersWithPlaySessions]: {
                defaultTotalSummaryTypes: [{
                    type: T.Average
                }, {
                    type: T.Total
                }],
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.QualifiedUsersWithPlays", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.QualifiedUsersWithPlays")
                }
            },
            [n.RAQIV2Metric.QualifiedEndToEndCVR]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.QualifiedPTR", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.QualifiedPTR")
                }
            },
            [n.RAQIV2Metric.ErrorCount]: {
                columnDisplayConfigOverrides: {
                    columnAlignment: "left"
                }
            },
            [n.RAQIV2Metric.ComputeEfficiency]: {
                dataPointTransformerType: f.ScaleBackBy100
            },
            [n.RAQIV2Metric.Attribution1DPayerConversionRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.PayerConversion1D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.PayerConversion1D")
                }
            },
            [n.RAQIV2Metric.Attribution1DPlaytimePerUserInMinutes]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.PlaytimePerUser1D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.PlaytimePerUser1D")
                }
            },
            [n.RAQIV2Metric.Attribution1DRobuxPerUser]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.RevenuePerUser1D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.RevenuePerUser1D")
                }
            },
            [n.RAQIV2Metric.Attribution30DPayerConversionRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.PayerConversion30D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.PayerConversion30D")
                }
            },
            [n.RAQIV2Metric.Attribution30DPlaytimePerUserInMinutes]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.PlaytimePerUser30D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.PlaytimePerUser30D")
                }
            },
            [n.RAQIV2Metric.Attribution30DRobuxPerUser]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.RevenuePerUser30D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.RevenuePerUser30D")
                }
            },
            [n.RAQIV2Metric.Attribution7DPayerConversionRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.PayerConversion7D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.PayerConversion7D")
                }
            },
            [n.RAQIV2Metric.Attribution7DPlaytimePerUserInMinutes]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.PlaytimePerUser7D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.PlaytimePerUser7D")
                }
            },
            [n.RAQIV2Metric.Attribution7DRobuxPerUser]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.RevenuePerUser7D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.RevenuePerUser7D")
                }
            },
            [n.RAQIV2Metric.AttributionD1RetentionRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.D1Retention", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.D1Retention")
                }
            },
            [n.RAQIV2Metric.AttributionD30RetentionRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.D30Retention", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.D30Retention")
                }
            },
            [n.RAQIV2Metric.AttributionD7RetentionRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.D7Retention", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.D7Retention")
                }
            },
            [n.RAQIV2Metric.UniqueUsersWithClicks]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.UsersWithDetailPageVisits", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.UsersWithDetailPageVisits")
                }
            },
            [n.RAQIV2Metric.ImpressionCVR]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.UsersImpressionCTR", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.UsersImpressionCTR")
                }
            },
            [n.RAQIV2Metric.ClickCVR]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.UsersDetailPageCTR", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.UsersDetailPageCTR")
                }
            },
            [n.RAQIV2Metric.DailyRevenue]: {
                defaultTotalSummaryTypes: [{
                    type: T.Average
                }, {
                    type: T.Total
                }],
                loggingMetricOverride: "Robux"
            },
            [n.RAQIV2Metric.ItemMonetizationRevenue]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.ItemMonetizationSales]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.AverageSessionLengthMinutes]: {
                loggingMetricOverride: "AveragePlayTime"
            },
            [n.RAQIV2Metric.AveragePlayTimeMinutesPerDAU]: {
                loggingMetricOverride: "AveragePlayTime"
            },
            [n.RAQIV2Metric.ThumbnailImpressions]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.ThumbnailQualifiedPlays]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.TotalSessionsEndedInBucket]: {
                defaultTotalSummaryTypes: [{
                    type: T.SinglePoint,
                    selectedXValue: 300,
                    specificLabel: {
                        translationKey: (0, r.translationKey)("Label.PercentageInSummary", u.TranslationNamespace.Analytics),
                        arguments: {
                            minute: Math.floor(5).toString()
                        }
                    }
                }],
                dataPointTransformerType: f.PercentageOfFirstPoint,
                exploreModeChartType: o.ChartType.DurationSpline,
                exploreModeSpecOverride: {
                    breakdown: {
                        intersect: [n.RAQIV2Dimension.SessionTimeBucket]
                    },
                    granularity: {
                        override: n.RAQIV2MetricGranularity.None
                    }
                },
                totalSeriesNameOverride: (0, r.translationKey)("Label.PlayersPercentage", u.TranslationNamespace.Analytics)
            },
            [n.RAQIV2Metric.RFYDuration0To60]: {
                exploreModeSpecOverride: {
                    benchmarkPercentiles: {
                        override: h
                    }
                }
            },
            [n.RAQIV2Metric.RFYDuration61To180]: {
                exploreModeSpecOverride: {
                    benchmarkPercentiles: {
                        override: h
                    }
                }
            },
            [n.RAQIV2UIMetric.ClientMemoryUsage]: {
                dataPointTransformerType: f.ScaleBackBy1000000000
            },
            [n.RAQIV2UIMetric.SessionDurationSeconds]: {
                dataPointTransformerType: f.ScaleBackBy60
            },
            [n.RAQIV2UIMetric.ServerMemoryUsage]: {
                dataPointTransformerType: f.ScaleBackBy1000000000
            },
            [n.RAQIV2UIMetric.ServerCpuTime]: {
                exploreModeChartType: o.ChartType.Area
            },
            [n.RAQIV2UIMetric.ServerMemoryUsageV2]: {
                exploreModeChartType: o.ChartType.Area
            },
            [n.RAQIV2Metric.ClientCpuTimeAvg]: {
                exploreModeChartType: o.ChartType.Area
            },
            [n.RAQIV2UIMetric.ServerMemoryUsageByServerAge]: {
                exploreModeChartType: o.ChartType.DurationArea,
                exploreModeSpecOverride: {
                    granularity: {
                        override: n.RAQIV2MetricGranularity.None
                    },
                    breakdown: {
                        intersect: [n.RAQIV2Dimension.ServerAgeBucket]
                    }
                }
            },
            [n.RAQIV2Metric.ItemAvatar3dLimitedAvailableQuantity]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.ItemAvatar3dLimitedTotalQuantity]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.ItemLifetimeCreatorEarning]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.ItemLifetimeRebateAmount]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.ItemLifetimeRobuxSpent]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.ItemLifetimeTransactionCount]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.ItemLimitedSoldPercentage]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.ItemPublishAdvance]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.ItemTotalCreatorEarning]: {
                defaultTotalSummaryTypes: D,
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Revenue", u.TranslationNamespace.AvatarAnalytics)
                }
            },
            [n.RAQIV2Metric.ItemTotalRobuxSpent]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.ItemTotalTransactionCount]: {
                defaultTotalSummaryTypes: D,
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.ItemTotalTransactionCount", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.StoreTransactions]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.StoreRevenue]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.ShareLinkAttribution1DPayerConversionRatio]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.ShareLinkAttribution1DPlaytimePerUserInMinutes]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.ShareLinkAttribution1DRobuxPerUser]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.ShareLinkAttribution30DPayerConversionRatio]: {
                defaultTotalSummaryTypes: D,
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.PayerConversion30D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.PayerConversion30D")
                }
            },
            [n.RAQIV2Metric.ShareLinkAttribution30DPlaytimePerUserInMinutes]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.ShareLinkAttribution30DRobuxPerUser]: {
                defaultTotalSummaryTypes: D,
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.RevenuePerUser30D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.RevenuePerUser30D")
                }
            },
            [n.RAQIV2Metric.ShareLinkAttribution7DPayerConversionRatio]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.ShareLinkAttribution7DPlaytimePerUserInMinutes]: {
                defaultTotalSummaryTypes: D,
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.PlaytimePerUser7D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.PlaytimePerUser7D")
                }
            },
            [n.RAQIV2Metric.ShareLinkAttribution7DRobuxPerUser]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.ShareLinkAttributionD1RetentionRatio]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.ShareLinkAttributionD30RetentionRatio]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.ShareLinkAttributionD7RetentionRatio]: {
                defaultTotalSummaryTypes: D,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.D7Retention")
                }
            },
            [n.RAQIV2Metric.ShareLinkQualifiedClickCVR]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.UsersDetailPageCTR")
                }
            },
            [n.RAQIV2Metric.ShareLinkQualifiedUniqueUsersWithPlaySessions]: {
                defaultTotalSummaryTypes: D,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.QualifiedUsersWithPlays")
                }
            },
            [n.RAQIV2Metric.ShareLinkUniqueUsersWithClicks]: {
                defaultTotalSummaryTypes: D,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.UsersWithDetailPageVisits")
                }
            },
            [n.RAQIV2Metric.ShareLinkUniqueUsersWithPlaySessions]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.AffiliateLinkDailyAverageRobuxBookingsPerReactivationSpender]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.AverageRobuxBookingsPerReactivationSpenderV3", u.TranslationNamespace.Analytics),
                    titleKey: (0, r.translationKey)("Label.Metric.AverageRobuxBookingsPerReactivationSpenderV3", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.AffiliateLinkDailyAffiliateActiveSpenderReactivationsPayoutRobux]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.LifetimeEstimatedAffiliateActiveSpenderReactivationsPayoutRobuxV3", u.TranslationNamespace.Analytics),
                    titleKey: (0, r.translationKey)("Label.Metric.LifetimeEstimatedAffiliateActiveSpenderReactivationsPayoutRobuxV3", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.AffiliateLinkDailyQualifiedActiveSpenderReactivations]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.LifetimeQualifiedActiveSpenderReactivationsV3", u.TranslationNamespace.Analytics),
                    titleKey: (0, r.translationKey)("Label.Metric.LifetimeQualifiedActiveSpenderReactivationsV3", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.AffiliateLinkDailyQualifiedReactivationsSpenders]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.LifetimeQualifiedReactivationsSpendersV3", u.TranslationNamespace.Analytics),
                    titleKey: (0, r.translationKey)("Label.Metric.LifetimeQualifiedReactivationsSpendersV3", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.AffiliateLinkDailyAffiliateReactivationsPayoutRobux]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.LifetimeEstimatedAffiliateReactivationsPayoutRobuxV3", u.TranslationNamespace.Analytics),
                    titleKey: (0, r.translationKey)("Label.Metric.LifetimeEstimatedAffiliateReactivationsPayoutRobuxV3", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.AffiliateLinkDailyQualifiedSignupSpenders]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.LifetimeQualifiedSignupSpendersV3", u.TranslationNamespace.Analytics),
                    titleKey: (0, r.translationKey)("Label.Metric.LifetimeQualifiedSignupSpendersV3", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.AffiliateLinkDailyAverageRobuxBookingsPerSignupSpender]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.AverageRobuxBookingsPerSignupSpenderV3", u.TranslationNamespace.Analytics),
                    titleKey: (0, r.translationKey)("Label.Metric.AverageRobuxBookingsPerSignupSpenderV3", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.AffiliateLinkDailyAffiliateSignupsPayoutRobux]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.LifetimeEstimatedAffiliateSignupsPayoutRobuxV3", u.TranslationNamespace.Analytics),
                    titleKey: (0, r.translationKey)("Label.Metric.LifetimeEstimatedAffiliateSignupsPayoutRobuxV3", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.AffiliateLinkDailyBookingsPerSpenderCombined]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.BookingsPerSpenderCombinedV3", u.TranslationNamespace.Analytics),
                    titleKey: (0, r.translationKey)("Label.Metric.BookingsPerSpenderCombinedV3", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.AffiliateLinkDailyVisits]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.Metric.AffiliateLinkDailyVisits", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.AffiliateLinkDailyQualifiedSignups]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.LifetimeQualifiedSignupsV3", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.AffiliateLinkDailyQualifiedReactivations]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.LifetimeQualifiedReactivationsV3", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.AffiliateLinkDailyTotalPayoutRobux]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.LifetimeEstimatedAffiliateCombinedPayoutRobuxV3", u.TranslationNamespace.Analytics),
                    titleKey: (0, r.translationKey)("Label.Metric.LifetimeEstimatedAffiliateCombinedPayoutRobuxV3", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.CreatorRewardsAudienceExpansionFunnelSignups]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.Metric.AESignups", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.CreatorRewardsAudienceExpansionFunnelReactivations]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.LifetimeQualifiedReactivationsV3", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKey)("Description.Metric.AEReactivations", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.CreatorRewardsAudienceExpansionFunnelPercentOfNewUsers]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.AEAudienceExpansionPercentage", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKey)("Description.Metric.AEAudienceExpansionPercentage", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.CreatorRewardsAudienceExpansionFunnelRetentionD1]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.AERetentionD1", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKey)("Description.Metric.AERetentionD1", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.CreatorRewardsAudienceExpansionFunnelRetentionD7]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.AERetentionD7", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKey)("Description.Metric.AERetentionD7", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.CreatorRewardsAudienceExpansionFunnelPayerConversion7D]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.AEPayerConversion7D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKey)("Description.Metric.AEPayerConversion7D", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.CreatorRewardsAudienceExpansionFunnelRevenuePerPayer7D]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.AERevenuePerPayer7D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKey)("Description.Metric.AERevenuePerPayer7D", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.CreatorRewardsAudienceExpansionFunnelRevenuePerUser7D]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.AERevenuePerUser7D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKey)("Description.Metric.AERevenuePerUser7D", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.CreatorRewardsAudienceExpansionFunnelPayerConversion60D]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.AEPayerConversion60D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKey)("Label.Description.AEPayerConversion60D", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.CreatorRewardsAudienceExpansionFunnelRevenuePerPayer60D]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.AERevenuePerPayer60D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKey)("Label.Description.AERevenuePerPayer60D", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.CreatorRewardsAudienceExpansionFunnelRevenuePerUser60D]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.AERevenuePerUser60D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKey)("Label.Description.AERevenuePerUser60D", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.CreatorRewardsAudienceExpansionFunnelEstimatedPayout]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.CreatorRewardsLifetimeEstimatedAffiliatePayoutRobux", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKey)("Label.Description.AERevenuePerPayer60D", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.FriendReferralAverageRobuxBookingsPerSpender]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.FriendReferralLifetimeEstimatedAffiliatePayoutRobux]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.FriendReferralLifetimeQualifiedSignups]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.FriendReferralLifetimeQualifiedSpenders]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.FriendReferralLifetimeVisits]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.PlayerFeedbackVotesCount]: {
                defaultTotalSummaryTypes: [],
                exploreModeChartType: o.ChartType.Column
            },
            [n.RAQIV2UIMetric.MatchmakingCategoricalCustomSignalsSimilarityRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.MatchmakingCategoricalCustomSignalsSimilarityRatio", u.TranslationNamespace.Matchmaking),
                    tooltipKey: (0, r.translationKey)("Description.MatchmakingCategoricalCustomSignalsSimilarityRatio", u.TranslationNamespace.Matchmaking)
                }
            },
            [n.RAQIV2UIMetric.MatchmakingNumericCustomSignalsDifference]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.MatchmakingNumericCustomSignalsDifference", u.TranslationNamespace.Matchmaking),
                    tooltipKey: (0, r.translationKey)("Description.MatchmakingNumericCustomSignalsDifference", u.TranslationNamespace.Matchmaking)
                }
            },
            [n.RAQIV2Metric.MatchmakingPlayerAttributesLoadingStatusAvg]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.MatchmakingPlayerAttributesLoadingStatusAvg", u.TranslationNamespace.Matchmaking),
                    tooltipKey: (0, r.translationKey)("Description.MatchmakingPlayerAttributesLoadingStatusAvg", u.TranslationNamespace.Matchmaking)
                }
            },
            [n.RAQIV2UIMetric.MatchmakingSignalsAgeDifference]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.MatchmakingSignalsAgeDifference", u.TranslationNamespace.Matchmaking),
                    tooltipKey: (0, r.translationKey)("Description.MatchmakingSignalsAgeDifference", u.TranslationNamespace.Matchmaking)
                }
            },
            [n.RAQIV2UIMetric.MatchmakingSignalsCommonChatGroupRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.MatchmakingSignalsCommonChatGroupRatio", u.TranslationNamespace.Matchmaking),
                    tooltipKey: (0, r.translationKey)("Description.MatchmakingSignalsCommonChatGroupRatio", u.TranslationNamespace.Matchmaking)
                }
            },
            [n.RAQIV2UIMetric.MatchmakingSignalsCommonDeviceTypeRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.MatchmakingSignalsCommonDeviceTypeRatio", u.TranslationNamespace.Matchmaking),
                    tooltipKey: (0, r.translationKey)("Description.MatchmakingSignalsCommonDeviceTypeRatio", u.TranslationNamespace.Matchmaking)
                }
            },
            [n.RAQIV2UIMetric.MatchmakingSignalsCommonLanguageRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.MatchmakingSignalsCommonLanguageRatio", u.TranslationNamespace.Matchmaking),
                    tooltipKey: (0, r.translationKey)("Description.MatchmakingSignalsCommonLanguageRatio", u.TranslationNamespace.Matchmaking)
                }
            },
            [n.RAQIV2UIMetric.MatchmakingSignalsDeltaPing]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.MatchmakingSignalsDeltaPing", u.TranslationNamespace.Matchmaking),
                    tooltipKey: (0, r.translationKey)("Description.MatchmakingSignalsDeltaPing", u.TranslationNamespace.Matchmaking)
                }
            },
            [n.RAQIV2UIMetric.MatchmakingSignalsEstimatePing]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.MatchmakingSignalsEstimatedPing", u.TranslationNamespace.Matchmaking),
                    tooltipKey: (0, r.translationKey)("Description.MatchmakingSignalsEstimatedPing", u.TranslationNamespace.Matchmaking)
                }
            },
            [n.RAQIV2UIMetric.MatchmakingSignalsOccupancyRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.MatchmakingSignalsOccupancyRatio", u.TranslationNamespace.Matchmaking),
                    tooltipKey: (0, r.translationKey)("Description.MatchmakingSignalsOccupancyRatio", u.TranslationNamespace.Matchmaking)
                }
            },
            [n.RAQIV2UIMetric.MatchmakingSignalsPlayHistoryDifference]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.MatchmakingSignalsPlayHistoryDifference", u.TranslationNamespace.Matchmaking),
                    tooltipKey: (0, r.translationKey)("Description.MatchmakingSignalsPlayHistoryDifference", u.TranslationNamespace.Matchmaking)
                }
            },
            [n.RAQIV2Metric.MatchmakingSignalsPreferredPlayerMatchRatioAvg]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.MatchmakingSignalsFriendsMatchRatioAvg", u.TranslationNamespace.Matchmaking),
                    tooltipKey: (0, r.translationKey)("Description.MatchmakingSignalsFriendsMatchRatioAvg", u.TranslationNamespace.Matchmaking)
                }
            },
            [n.RAQIV2UIMetric.MatchmakingSignalsVoiceChatRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.MatchmakingSignalsVoiceChatRatio", u.TranslationNamespace.Matchmaking),
                    tooltipKey: (0, r.translationKey)("Description.MatchmakingSignalsVoiceChatRatio", u.TranslationNamespace.Matchmaking)
                }
            },
            [n.RAQIV2Metric.DataStoreListRequests]: {
                defaultTotalSummaryTypes: [{
                    type: T.Average
                }],
                exploreModeChartType: o.ChartType.Spline
            },
            [n.RAQIV2Metric.DataStoreReadRequestsQuotaStandard]: {
                defaultTotalSummaryTypes: []
            },
            [n.RAQIV2Metric.DataStoreWriteRequestsQuotaOrdered]: {
                defaultTotalSummaryTypes: []
            },
            [n.RAQIV2Metric.DataStoreStorageQuotaBytes]: {
                defaultTotalSummaryTypes: []
            },
            [n.RAQIV2Metric.DataStoreStorageUsageBytes]: {
                defaultTotalSummaryTypes: [],
                exploreModeChartType: o.ChartType.Spline
            },
            [n.RAQIV2Metric.DataStoreWriteRequests]: {
                defaultTotalSummaryTypes: [{
                    type: T.Average
                }],
                exploreModeChartType: o.ChartType.Spline
            },
            [n.RAQIV2Metric.DataStoreRequestsByStatus]: {
                exploreModeChartType: o.ChartType.Spline
            },
            [n.RAQIV2Metric.DataStoreRequestsByEndpoint]: {
                exploreModeChartType: o.ChartType.Spline
            },
            [n.RAQIV2Metric.DataStoreRemoveRequests]: {
                defaultTotalSummaryTypes: [{
                    type: T.Average
                }],
                exploreModeChartType: o.ChartType.Spline
            },
            [n.RAQIV2Metric.DataStoreRemoveRequestsQuotaStandard]: {
                defaultTotalSummaryTypes: []
            },
            [n.RAQIV2Metric.DataStoreRemoveRequestsQuotaOrdered]: {
                defaultTotalSummaryTypes: []
            },
            [n.RAQIV2Metric.DataStoreReadRequestsQuotaOrdered]: {
                defaultTotalSummaryTypes: []
            },
            [n.RAQIV2Metric.DataStoreWriteRequestsQuotaStandard]: {
                defaultTotalSummaryTypes: []
            },
            [n.RAQIV2Metric.DataStoreListRequestsQuotaStandard]: {
                defaultTotalSummaryTypes: []
            },
            [n.RAQIV2Metric.DataStoreListRequestsQuotaOrdered]: {
                defaultTotalSummaryTypes: []
            },
            [n.RAQIV2Metric.DataStoreListRequestsQuota]: {
                defaultTotalSummaryTypes: []
            },
            [n.RAQIV2Metric.DataStoreReadRequests]: {
                exploreModeChartType: o.ChartType.Spline,
                defaultTotalSummaryTypes: [{
                    type: T.Average
                }]
            },
            [n.RAQIV2Metric.DataStoreConsumedReadRequests]: {
                defaultTotalSummaryTypes: [{
                    type: T.QuotaPercentageUsage
                }],
                exploreModeChartType: o.ChartType.Spline
            },
            [n.RAQIV2Metric.DataStoreConsumedWriteRequests]: {
                defaultTotalSummaryTypes: [{
                    type: T.QuotaPercentageUsage
                }],
                exploreModeChartType: o.ChartType.Spline
            },
            [n.RAQIV2Metric.DataStoreConsumedListRequests]: {
                defaultTotalSummaryTypes: [{
                    type: T.QuotaPercentageUsage
                }],
                exploreModeChartType: o.ChartType.Spline
            },
            [n.RAQIV2Metric.DataStoreConsumedRemoveRequests]: {
                defaultTotalSummaryTypes: [{
                    type: T.QuotaPercentageUsage
                }],
                exploreModeChartType: o.ChartType.Spline
            },
            [n.RAQIV2Metric.CommerceGMV]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.CommerceQuantitySold]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.CommerceClicks]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.CommerceImpressions]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.CommerceOrders]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.CommerceCheckouts]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.CommerceUniqueClicks]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.CommerceUniqueImpressions]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.CommerceUniqueCheckouts]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.CommerceUniqueOrders]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.AdsPublisherReportingTotalRevenueRobux]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.AdsPublisherReportingTotalImpressions]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.AdsPublisherReportingVideo2DRevenueRobux]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.AdsPublisherReportingVideo2DImpressions]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.AdsPublisherReportingVideo2DDailyUniqueViewer]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.CommunityGroupPageViews]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.CommunityGroupPageUniqueVisitors]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.CommunityMembershipChangeEvents]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.CommunityForumContentEventCount]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.CommunityForumContentUniqueUsers]: {
                defaultTotalSummaryTypes: D
            },
            [n.RAQIV2Metric.CommunityMembershipCount]: {
                defaultTotalSummaryTypes: C
            },
            [n.RAQIV2Metric.VideoServiceExclusivePlaybackSeconds]: {
                defaultTotalSummaryTypes: D,
                dataPointTransformerType: f.ScaleBackBy3600
            },
            [n.RAQIV2Metric.BandwidthTotalRecvMaxBytes]: {
                dataPointTransformerType: f.ScaleBackBy1000
            },
            [n.RAQIV2Metric.BandwidthTotalSendMaxBytes]: {
                dataPointTransformerType: f.ScaleBackBy1000
            }
        },
        P = {
            [n.RAQIV2Metric.ThumbnailWinningSegments]: {
                rendererType: "WinningSegments",
                valueTranslationKeys: {
                    male_below_13: {
                        name: (0, r.translationKey)("Label.WinningSegment.MaleBelow13", u.TranslationNamespace.Analytics)
                    },
                    female_below_13: {
                        name: (0, r.translationKey)("Label.WinningSegment.FemaleBelow13", u.TranslationNamespace.Analytics)
                    },
                    male_above_13: {
                        name: (0, r.translationKey)("Label.WinningSegment.MaleAbove13", u.TranslationNamespace.Analytics)
                    },
                    female_above_13: {
                        name: (0, r.translationKey)("Label.WinningSegment.FemaleAbove13", u.TranslationNamespace.Analytics)
                    },
                    below_18: {
                        name: (0, r.translationKey)("Label.WinningSegment.Below18", u.TranslationNamespace.Analytics)
                    },
                    above_or_equal_18: {
                        name: (0, r.translationKey)("Label.WinningSegment.AboveOrEqual18", u.TranslationNamespace.Analytics)
                    }
                }
            }
        },
        b = e => {
            let t = n.RAQIV2MetricDisplayConfig[e],
                i = t.valueType === n.RAQIV2MetricValueType.Numeric ? V[e] : P[e],
                a = {
                    ...A,
                    ...t,
                    ...i
                },
                r = M[e];
            return null != r && (a.unit = r.unit, a.decimalPrecision = r.decimalPrecision), a
        };
    e.s(["RAQIV2MetricValueRendererType", () => S, "default", 0, b, "getPreferredChartType", 0, e => {
        var t;
        return e && null != (t = b(e).exploreModeChartType) ? t : o.ChartType.Spline
    }, "isNumericUIMetric", 0, e => {
        var t;
        return I(e) && (null == (t = n.RAQIV2MetricDisplayConfig[e]) ? void 0 : t.valueType) === n.RAQIV2MetricValueType.Numeric
    }, "isRAQIV2UIMetric", 0, I, "p10AndP50BenchmarkPercentiles", 0, h], 908374)
}, 11517, e => {
    "use strict";
    var t = e.i(31611),
        i = e.i(908374);
    let a = e => "string" == typeof e && e.trim().length > 0,
        n = e => !!e && "object" == typeof e && e.metric === t.RAQIV2UIMetric.CustomEventsV2 && a(e.customEventName) && (void 0 === e.aggregationType || Object.values(t.RAQIV2AggregationType).includes(e.aggregationType)),
        r = e => n(e) ? e.metric : e,
        o = e => {
            var t;
            let r;
            return !!e && "object" == typeof e && a(e.key) && (a(r = t = e.metric) && (0, i.isNumericUIMetric)(r) || n(t))
        },
        s = e => !!e && "object" == typeof e && "sources" in e && !!Array.isArray(e.sources) && 0 !== e.sources.length && !!a(e.formula) && e.sources.every(o),
        l = e => {
            if (!s(e)) return [r(e)];
            let t = new Set;
            return e.sources.forEach(e => {
                t.add(r(e.metric))
            }), Array.from(t)
        },
        u = e => {
            if (!s(e)) return r(e);
            let t = [...new Set(l(e))].sort();
            return "ACEComputed:".concat(t.join("|"))
        };
    e.s(["getAtomicMetricsFromMetricLike", 0, l, "getTelemetryMetricNameFromMetricLike", 0, u, "getTelemetryMetricNameFromMetricLikes", 0, e => {
        let t = [...new Set(e.map(u))].sort().join("|");
        return "MetricSet:".concat(t)
    }, "getUIMetricFromAtomicMetricLike", 0, r, "getUIMetricsFromMetricLike", 0, l, "isComputedMetric", 0, s, "isCustomEventsAtomicMetricLike", 0, n])
}, 606662, e => {
    "use strict";
    var t = e.i(31611),
        i = e.i(927868);
    let a = (e, t) => e.some(e => e === t);
    e.s(["getAPIMetricFromUIMetric", 0, (e, i) => {
        let a = t.RAQIV2UIMetricToAPIConfig[e],
            n = a.dimension;
        switch (n) {
            case t.RAQIV2UIPseudoDimension.PercentileType:
                var r;
                if (!i.percentile) return a.defaultMetric;
                return null != (r = a.byPercentileType[i.percentile]) ? r : a.defaultMetric;
            case t.RAQIV2UIPseudoDimension.AggregationType:
                if (!i.aggregationType) return a.defaultMetric;
                return a.byAggregationType[i.aggregationType];
            default:
                throw Error("Unhandled fanout dimension: ".concat(String(n)))
        }
    }, "getAllAPIMetricsFromUIMetric", 0, e => {
        let i = t.RAQIV2UIMetricToAPIConfig[e],
            a = i.dimension;
        switch (a) {
            case t.RAQIV2UIPseudoDimension.PercentileType:
                return Object.values(i.byPercentileType);
            case t.RAQIV2UIPseudoDimension.AggregationType:
                return Object.values(i.byAggregationType);
            default:
                throw Error("Unhandled fanout dimension: ".concat(String(a)))
        }
    }, "getSupportedFilterDimensionOptions", 0, (e, n) => {
        if (n !== t.RAQIV2UIPseudoDimension.PercentileType && n !== t.RAQIV2UIPseudoDimension.AggregationType) return;
        let r = e.flatMap(e => {
            let a;
            return (0, i.isValidEnumValue)(t.RAQIV2UIMetric, e) ? t.RAQIV2UIMetricToAPIConfig[e].dimension === n ? ["percentileTypes" in (a = t.RAQIV2UIMetricToSupportedMetricTypes[e]) ? a.percentileTypes : a.aggregationTypes] : [] : []
        });
        if (0 === r.length) return;
        let [o, ...s] = r;
        if (void 0 !== o) return s.reduce((e, t) => e.filter(e => a(t, e)), [...o])
    }, "isSupportedMetricFanoutDimensionValue", 0, a])
}, 859617, e => {
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

    function a(e, t, i, a) {
        return new(i || (i = Promise))(function(n, r) {
            function o(e) {
                try {
                    l(a.next(e))
                } catch (e) {
                    r(e)
                }
            }

            function s(e) {
                try {
                    l(a.throw(e))
                } catch (e) {
                    r(e)
                }
            }

            function l(e) {
                var t;
                e.done ? n(e.value) : ((t = e.value) instanceof i ? t : new i(function(e) {
                    e(t)
                })).then(o, s)
            }
            l((a = a.apply(e, t || [])).next())
        })
    }

    function n(e, t) {
        var i, a, n, r = {
                label: 0,
                sent: function() {
                    if (1 & n[0]) throw n[1];
                    return n[1]
                },
                trys: [],
                ops: []
            },
            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return o.next = s(0), o.throw = s(1), o.return = s(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
            return this
        }), o;

        function s(s) {
            return function(l) {
                var u = [s, l];
                if (i) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, u[0] && (r = 0)), r;) try {
                    if (i = 1, a && (n = 2 & u[0] ? a.return : u[0] ? a.throw || ((n = a.return) && n.call(a), 0) : a.next) && !(n = n.call(a, u[1])).done) return n;
                    switch (a = 0, n && (u = [2 & u[0], n.value]), u[0]) {
                        case 0:
                        case 1:
                            n = u;
                            break;
                        case 4:
                            return r.label++, {
                                value: u[1],
                                done: !1
                            };
                        case 5:
                            r.label++, a = u[1], u = [0];
                            continue;
                        case 7:
                            u = r.ops.pop(), r.trys.pop();
                            continue;
                        default:
                            if (!(n = (n = r.trys).length > 0 && n[n.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                r = 0;
                                continue
                            }
                            if (3 === u[0] && (!n || u[1] > n[0] && u[1] < n[3])) {
                                r.label = u[1];
                                break
                            }
                            if (6 === u[0] && r.label < n[1]) {
                                r.label = n[1], n = u;
                                break
                            }
                            if (n && r.label < n[2]) {
                                r.label = n[2], r.ops.push(u);
                                break
                            }
                            n[2] && r.ops.pop(), r.trys.pop();
                            continue
                    }
                    u = t.call(e, r)
                } catch (e) {
                    u = [6, e], a = 0
                } finally {
                    i = n = 0
                }
                if (5 & u[0]) throw u[1];
                return {
                    value: u[0] ? u[1] : void 0,
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
            key: (0, t.exists)(i, "key") ? i.key : void 0,
            targets: (0, t.exists)(i, "targets") ? i.targets : void 0,
            unixStartTime: (0, t.exists)(i, "unixStartTime") ? i.unixStartTime : void 0,
            links: (0, t.exists)(i, "links") ? i.links : void 0,
            dimensions: (0, t.exists)(i, "dimensions") ? i.dimensions : void 0,
            unixEndTime: (0, t.exists)(i, "unixEndTime") ? i.unixEndTime : void 0
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

    function l(e) {
        if (void 0 !== e) return null === e ? null : {
            dimension: e.dimension,
            values: e.values,
            operation: e.operation
        }
    }

    function u(e) {
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
            dimension: (0, t.exists)(i, "dimension") ? i.dimension : void 0,
            value: (0, t.exists)(i, "value") ? i.value : void 0,
            displayValue: (0, t.exists)(i, "displayValue") ? i.displayValue : void 0,
            variantKey: (0, t.exists)(i, "variantKey") ? i.variantKey : void 0
        }
    }

    function d(e) {
        var i;
        return null == (i = e) ? i : {
            key: (0, t.exists)(i, "key") ? i.key : void 0,
            targets: (0, t.exists)(i, "targets") ? i.targets : void 0
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
            code: (0, t.exists)(i, "code") ? i.code : void 0,
            severity: (0, t.exists)(i, "severity") ? i.severity : void 0,
            message: (0, t.exists)(i, "message") ? i.message : void 0,
            nodeId: (0, t.exists)(i, "nodeId") ? i.nodeId : void 0,
            suggestion: (0, t.exists)(i, "suggestion") ? i.suggestion : void 0,
            context: (0, t.exists)(i, "context") ? i.context : void 0
        }
    }

    function T(e) {
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

    function v(e) {
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

    function g(e) {
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
                    breakdownSpecs: void 0 === e.breakdownSpecs ? void 0 : e.breakdownSpecs.map(u),
                    dynamicFilterBindings: void 0 === e.dynamicFilterBindings ? void 0 : e.dynamicFilterBindings.map(v),
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

    function R(e, i) {
        var a;
        return null == e ? e : {
            totalExecutionTimeMs: (0, t.exists)(e, "totalExecutionTimeMs") ? e.totalExecutionTimeMs : void 0,
            traceId: (0, t.exists)(e, "traceId") ? e.traceId : void 0,
            totalNodes: (0, t.exists)(e, "totalNodes") ? e.totalNodes : void 0,
            complexity: (0, t.exists)(e, "complexity") ? null == (a = e.complexity) ? a : {
                queryCount: (0, t.exists)(a, "queryCount") ? a.queryCount : void 0,
                transformCount: (0, t.exists)(a, "transformCount") ? a.transformCount : void 0,
                aggregationCount: (0, t.exists)(a, "aggregationCount") ? a.aggregationCount : void 0,
                maxDepth: (0, t.exists)(a, "maxDepth") ? a.maxDepth : void 0,
                estimatedCost: (0, t.exists)(a, "estimatedCost") ? a.estimatedCost : void 0,
                maxFanOut: (0, t.exists)(a, "maxFanOut") ? a.maxFanOut : void 0,
                rootCount: (0, t.exists)(a, "rootCount") ? a.rootCount : void 0
            } : void 0,
            nodeTimings: (0, t.exists)(e, "nodeTimings") ? e.nodeTimings.map(T) : void 0
        }
    }

    function A(e) {
        var i;
        return null == (i = e) ? i : {
            time: (0, t.exists)(i, "time") ? i.time : void 0,
            value: (0, t.exists)(i, "value") ? i.value : void 0,
            stringValues: (0, t.exists)(i, "stringValues") ? i.stringValues : void 0,
            status: (0, t.exists)(i, "status") ? i.status : void 0
        }
    }

    function I(e) {
        var i, a;
        return null == (i = e) ? i : {
            breakdownValue: (0, t.exists)(i, "breakdownValue") ? i.breakdownValue.map(c) : void 0,
            dataPoints: (0, t.exists)(i, "dataPoints") ? i.dataPoints.map(A) : void 0,
            periodSummary: (0, t.exists)(i, "periodSummary") ? null == (a = i.periodSummary) ? a : {
                value: (0, t.exists)(a, "value") ? a.value : void 0,
                method: (0, t.exists)(a, "method") ? a.method : void 0
            } : void 0
        }
    }

    function M(e) {
        var i, a;
        return null == (i = e) ? i : {
            nodeId: (0, t.exists)(i, "nodeId") ? i.nodeId : void 0,
            success: (0, t.exists)(i, "success") ? i.success : void 0,
            error: (0, t.exists)(i, "error") ? i.error : void 0,
            timeSeries: (0, t.exists)(i, "timeSeries") ? null == (a = i.timeSeries) ? a : {
                values: (0, t.exists)(a, "values") ? a.values.map(I) : void 0,
                truncated: (0, t.exists)(a, "truncated") ? a.truncated : void 0
            } : void 0,
            scalarValue: (0, t.exists)(i, "scalarValue") ? i.scalarValue : void 0,
            executionTimeMs: (0, t.exists)(i, "executionTimeMs") ? i.executionTimeMs : void 0,
            errorCode: (0, t.exists)(i, "errorCode") ? i.errorCode : void 0,
            failedDueTo: (0, t.exists)(i, "failedDueTo") ? i.failedDueTo : void 0,
            skipped: (0, t.exists)(i, "skipped") ? i.skipped : void 0
        }
    }

    function S(e) {
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

    function D(e) {
        if (void 0 !== e) return null === e ? null : {
            namespace: e.namespace,
            name: e.name,
            filterOnly: e.filterOnly,
            requiredFilter: e.requiredFilter
        }
    }

    function C(e) {
        var i, a;
        return null == (i = e) ? i : {
            dimension: (0, t.exists)(i, "dimension") ? null == (a = i.dimension) ? a : {
                namespace: (0, t.exists)(a, "namespace") ? a.namespace : void 0,
                name: (0, t.exists)(a, "name") ? a.name : void 0,
                filterOnly: (0, t.exists)(a, "filterOnly") ? a.filterOnly : void 0,
                requiredFilter: (0, t.exists)(a, "requiredFilter") ? a.requiredFilter : void 0
            } : void 0,
            values: (0, t.exists)(i, "values") ? i.values.map(c) : void 0,
            truncated: (0, t.exists)(i, "truncated") ? i.truncated : void 0
        }
    }

    function h(e, i) {
        return null == e ? e : {
            values: (0, t.exists)(e, "values") ? e.values.map(C) : void 0
        }
    }

    function V(e, i) {
        var a;
        return null == e ? e : {
            code: (0, t.exists)(e, "code") ? e.code : void 0,
            message: (0, t.exists)(e, "message") ? e.message : void 0,
            validationDetails: (0, t.exists)(e, "validationDetails") ? null == (a = e.validationDetails) ? a : {
                field: (0, t.exists)(a, "field") ? a.field : void 0,
                subject: (0, t.exists)(a, "subject") ? a.subject : void 0,
                rejectedValues: (0, t.exists)(a, "rejectedValues") ? a.rejectedValues : void 0
            } : void 0
        }
    }

    function P(e, i) {
        return null == e ? e : {
            createdTime: (0, t.exists)(e, "createdTime") ? e.createdTime : void 0
        }
    }

    function b(e, i) {
        var a;
        return null == e ? e : {
            kind: (0, t.exists)(e, "kind") ? e.kind : void 0,
            unit: (0, t.exists)(e, "unit") ? e.unit : void 0,
            clientFoldable: (0, t.exists)(e, "clientFoldable") ? e.clientFoldable : void 0,
            deltaMode: (0, t.exists)(e, "deltaMode") ? e.deltaMode : void 0,
            clamp: (0, t.exists)(e, "clamp") ? e.clamp : void 0,
            bucketMean: (0, t.exists)(e, "bucketMean") ? null == (a = e.bucketMean) ? a : {
                granularity: (0, t.exists)(a, "granularity") ? r(a.granularity) : void 0,
                weighted: (0, t.exists)(a, "weighted") ? a.weighted : void 0
            } : void 0
        }
    }

    function K(e) {
        var i;
        return null == (i = e) ? i : {
            metric: (0, t.exists)(i, "metric") ? i.metric : void 0,
            latestAvailableTime: (0, t.exists)(i, "latestAvailableTime") ? i.latestAvailableTime : void 0,
            algebra: (0, t.exists)(i, "algebra") ? b(i.algebra) : void 0,
            meanOfBucketsGranularities: (0, t.exists)(i, "meanOfBucketsGranularities") ? i.meanOfBucketsGranularities.map(r) : void 0
        }
    }

    function x(e, i) {
        return null == e ? e : {
            metadata: (0, t.exists)(e, "metadata") ? e.metadata.map(K) : void 0
        }
    }

    function N(e, i) {
        return null == e ? e : {
            values: (0, t.exists)(e, "values") ? e.values.map(I) : void 0,
            truncated: (0, t.exists)(e, "truncated") ? e.truncated : void 0
        }
    }

    function Q(e) {
        var i;
        return null == (i = e) ? i : {
            time: (0, t.exists)(i, "time") ? i.time : void 0,
            breakdownValues: (0, t.exists)(i, "breakdownValues") ? i.breakdownValues.map(c) : void 0,
            value: (0, t.exists)(i, "value") ? i.value : void 0,
            state: (0, t.exists)(i, "state") ? i.state : void 0
        }
    }

    function O(e, i) {
        return null == e ? e : {
            startTime: (0, t.exists)(e, "startTime") ? e.startTime : void 0,
            endTime: (0, t.exists)(e, "endTime") ? e.endTime : void 0
        }
    }

    function k(e) {
        var i, a, n, r;
        return null == (i = e) ? i : {
            id: (0, t.exists)(i, "id") ? i.id : void 0,
            values: (0, t.exists)(i, "values") ? null == (a = i.values) ? a : {
                points: (0, t.exists)(a, "points") ? a.points.map(Q) : void 0
            } : void 0,
            unavailable: (0, t.exists)(i, "unavailable") ? null == (n = i.unavailable) ? n : {
                reason: (0, t.exists)(n, "reason") ? n.reason : void 0,
                lookaheadDuration: (0, t.exists)(n, "lookaheadDuration") ? n.lookaheadDuration : void 0
            } : void 0,
            window: (0, t.exists)(i, "window") ? null == (r = i.window) ? r : {
                resolved: (0, t.exists)(r, "resolved") ? O(r.resolved) : void 0,
                evaluated: (0, t.exists)(r, "evaluated") ? O(r.evaluated) : void 0,
                matureThroughTime: (0, t.exists)(r, "matureThroughTime") ? r.matureThroughTime : void 0,
                latestAvailableTime: (0, t.exists)(r, "latestAvailableTime") ? r.latestAvailableTime : void 0
            } : void 0,
            algebra: (0, t.exists)(i, "algebra") ? b(i.algebra) : void 0
        }
    }

    function E(e, i) {
        return null == e ? e : {
            algebra: (0, t.exists)(e, "algebra") ? b(e.algebra) : void 0,
            results: (0, t.exists)(e, "results") ? e.results.map(k) : void 0
        }
    }

    function w(e, i) {
        return null == e ? e : {
            path: (0, t.exists)(e, "path") ? e.path : void 0,
            metadata: (0, t.exists)(e, "metadata") ? P(e.metadata) : void 0,
            done: (0, t.exists)(e, "done") ? e.done : void 0,
            error: (0, t.exists)(e, "error") ? V(e.error) : void 0,
            queryResult: (0, t.exists)(e, "queryResult") ? N(e.queryResult) : void 0,
            dimensionValuesResult: (0, t.exists)(e, "dimensionValuesResult") ? h(e.dimensionValuesResult) : void 0,
            metricMetadataResult: (0, t.exists)(e, "metricMetadataResult") ? x(e.metricMetadataResult) : void 0,
            rollupQueryResult: (0, t.exists)(e, "rollupQueryResult") ? E(e.rollupQueryResult) : void 0
        }
    }

    function U(e) {
        if (void 0 !== e) return null === e ? null : {
            sources: void 0 === e.sources ? void 0 : e.sources.map(S),
            formula: e.formula,
            displayName: e.displayName,
            l7Smoothing: e.l7Smoothing
        }
    }

    function L(e) {
        if (void 0 !== e) return null === e ? null : {
            resourceType: e.resourceType,
            resourceId: e.resourceId,
            granularity: e.granularity,
            startTime: e.startTime,
            endTime: e.endTime,
            traceId: e.traceId
        }
    }

    function _(e) {
        var i;
        return null == (i = e) ? i : {
            path: (0, t.exists)(i, "path") ? i.path : void 0,
            metadata: (0, t.exists)(i, "metadata") ? P(i.metadata) : void 0,
            done: (0, t.exists)(i, "done") ? i.done : void 0,
            error: (0, t.exists)(i, "error") ? V(i.error) : void 0,
            queryResult: (0, t.exists)(i, "queryResult") ? N(i.queryResult) : void 0,
            dimensionValuesResult: (0, t.exists)(i, "dimensionValuesResult") ? h(i.dimensionValuesResult) : void 0,
            metricMetadataResult: (0, t.exists)(i, "metricMetadataResult") ? x(i.metricMetadataResult) : void 0,
            rollupQueryResult: (0, t.exists)(i, "rollupQueryResult") ? E(i.rollupQueryResult) : void 0
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
                    breakdown: void 0 === e.breakdown ? void 0 : e.breakdown.map(f),
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
    var W = function(e) {
        function r() {
            return null !== e && e.apply(this, arguments) || this
        }
        return function(e, t) {
            if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

            function a() {
                this.constructor = e
            }
            i(e, t), e.prototype = null === t ? Object.create(t) : (a.prototype = t.prototype, new a)
        }(r, e), r.prototype.v1ComputedMetricsExecutePostRaw = function(e, i) {
            return a(this, void 0, void 0, function() {
                var a, r, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return a = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/computed-metrics/execute",
                                schemaPath: "/v1/computed-metrics/execute",
                                method: "POST",
                                headers: r,
                                query: a,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        computedMetric: U(e.computedMetric),
                                        context: L(e.context),
                                        globalFilters: void 0 === e.globalFilters ? void 0 : e.globalFilters.map(l),
                                        includeTotalBranch: e.includeTotalBranch,
                                        breakdownSpecs: void 0 === e.breakdownSpecs ? void 0 : e.breakdownSpecs.map(u)
                                    }
                                }(e.v1ComputedMetricsExecutePostRequest)
                            }, i)];
                        case 1:
                            return o = n.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                var i;
                                return null == e ? e : {
                                    result: (0, t.exists)(e, "result") ? null == (i = e.result) ? i : {
                                        success: (0, t.exists)(i, "success") ? i.success : void 0,
                                        outputs: (0, t.exists)(i, "outputs") ? i.outputs.map(M) : void 0,
                                        metadata: (0, t.exists)(i, "metadata") ? R(i.metadata) : void 0,
                                        errors: (0, t.exists)(i, "errors") ? i.errors.map(m) : void 0,
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
        }, r.prototype.v1ComputedMetricsExecutePost = function() {
            return a(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), n(this, function(i) {
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
            return a(this, void 0, void 0, function() {
                var a, r, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return a = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/computed-metrics/validate",
                                schemaPath: "/v1/computed-metrics/validate",
                                method: "POST",
                                headers: r,
                                query: a,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        computedMetric: U(e.computedMetric),
                                        context: L(e.context),
                                        globalFilters: void 0 === e.globalFilters ? void 0 : e.globalFilters.map(l),
                                        includeTotalBranch: e.includeTotalBranch,
                                        breakdownSpecs: void 0 === e.breakdownSpecs ? void 0 : e.breakdownSpecs.map(u)
                                    }
                                }(e.v1ComputedMetricsValidatePostRequest)
                            }, i)];
                        case 1:
                            return o = n.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    isValid: (0, t.exists)(e, "isValid") ? e.isValid : void 0,
                                    errors: (0, t.exists)(e, "errors") ? e.errors.map(m) : void 0,
                                    warnings: (0, t.exists)(e, "warnings") ? e.warnings : void 0
                                }
                            })]
                    }
                })
            })
        }, r.prototype.v1ComputedMetricsValidatePost = function() {
            return a(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), n(this, function(i) {
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
            return a(this, void 0, void 0, function() {
                var a, r, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return a = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/dag/execute",
                                schemaPath: "/v1/dag/execute",
                                method: "POST",
                                headers: r,
                                query: a,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        graph: function(e) {
                                            if (void 0 !== e) return null === e ? null : {
                                                id: e.id,
                                                name: e.name,
                                                nodes: void 0 === e.nodes ? void 0 : e.nodes.map(g)
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
                            return o = n.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                var i;
                                return null == e ? e : {
                                    result: (0, t.exists)(e, "result") ? null == (i = e.result) ? i : {
                                        success: (0, t.exists)(i, "success") ? i.success : void 0,
                                        outputs: (0, t.exists)(i, "outputs") ? i.outputs.map(M) : void 0,
                                        metadata: (0, t.exists)(i, "metadata") ? R(i.metadata) : void 0,
                                        errors: (0, t.exists)(i, "errors") ? i.errors.map(m) : void 0,
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
        }, r.prototype.v1DagExecutePost = function() {
            return a(this, arguments, void 0, function(e, t) {
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
        }, r.prototype.v1DagValidatePostRaw = function(e, i) {
            return a(this, void 0, void 0, function() {
                var a, r, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return a = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/dag/validate",
                                schemaPath: "/v1/dag/validate",
                                method: "POST",
                                headers: r,
                                query: a,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        graph: function(e) {
                                            if (void 0 !== e) return null === e ? null : {
                                                id: e.id,
                                                name: e.name,
                                                nodes: void 0 === e.nodes ? void 0 : e.nodes.map(g)
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
                            return o = n.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    isValid: (0, t.exists)(e, "isValid") ? e.isValid : void 0,
                                    errors: (0, t.exists)(e, "errors") ? e.errors.map(m) : void 0,
                                    warnings: (0, t.exists)(e, "warnings") ? e.warnings : void 0
                                }
                            })]
                    }
                })
            })
        }, r.prototype.v1DagValidatePost = function() {
            return a(this, arguments, void 0, function(e, t) {
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
        }, r.prototype.v1DimensionsResourceResourceTypeIdResourceIdPostRaw = function(e, i) {
            return a(this, void 0, void 0, function() {
                var a, r, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.resourceType || void 0 === e.resourceType) throw new t.RequiredError("resourceType", "Required parameter requestParameters.resourceType was null or undefined when calling v1DimensionsResourceResourceTypeIdResourceIdPost.");
                            if (null === e.resourceId || void 0 === e.resourceId) throw new t.RequiredError("resourceId", "Required parameter requestParameters.resourceId was null or undefined when calling v1DimensionsResourceResourceTypeIdResourceIdPost.");
                            return a = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/dimensions/resource/{resourceType}/id/{resourceId}".replace("{".concat("resourceType", "}"), encodeURIComponent(String(e.resourceType))).replace("{".concat("resourceId", "}"), encodeURIComponent(String(e.resourceId))),
                                schemaPath: "/v1/dimensions/resource/{resourceType}/id/{resourceId}",
                                method: "POST",
                                headers: r,
                                query: a,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        resourceType: e.resourceType,
                                        resourceId: e.resourceId,
                                        query: function(e) {
                                            if (void 0 !== e) return null === e ? null : {
                                                resourceType: e.resourceType,
                                                resourceId: e.resourceId,
                                                dimensions: void 0 === e.dimensions ? void 0 : e.dimensions.map(D),
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
                            return o = n.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    operation: (0, t.exists)(e, "operation") ? w(e.operation) : void 0
                                }
                            })]
                    }
                })
            })
        }, r.prototype.v1DimensionsResourceResourceTypeIdResourceIdPost = function(e, t) {
            return a(this, void 0, void 0, function() {
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
        }, r.prototype.v1MetricsMetadataPostRaw = function(e, i) {
            return a(this, void 0, void 0, function() {
                var a, r, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return a = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/metrics/metadata",
                                schemaPath: "/v1/metrics/metadata",
                                method: "POST",
                                headers: r,
                                query: a,
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
                            return o = n.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    operation: (0, t.exists)(e, "operation") ? w(e.operation) : void 0
                                }
                            })]
                    }
                })
            })
        }, r.prototype.v1MetricsMetadataPost = function() {
            return a(this, arguments, void 0, function(e, t) {
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
        }, r.prototype.v1MetricsResourceResourceTypeIdResourceIdPostRaw = function(e, i) {
            return a(this, void 0, void 0, function() {
                var a, r, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.resourceType || void 0 === e.resourceType) throw new t.RequiredError("resourceType", "Required parameter requestParameters.resourceType was null or undefined when calling v1MetricsResourceResourceTypeIdResourceIdPost.");
                            if (null === e.resourceId || void 0 === e.resourceId) throw new t.RequiredError("resourceId", "Required parameter requestParameters.resourceId was null or undefined when calling v1MetricsResourceResourceTypeIdResourceIdPost.");
                            return a = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/metrics/resource/{resourceType}/id/{resourceId}".replace("{".concat("resourceType", "}"), encodeURIComponent(String(e.resourceType))).replace("{".concat("resourceId", "}"), encodeURIComponent(String(e.resourceId))),
                                schemaPath: "/v1/metrics/resource/{resourceType}/id/{resourceId}",
                                method: "POST",
                                headers: r,
                                query: a,
                                body: q(e.queryRequest)
                            }, i)];
                        case 1:
                            return o = n.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    operation: (0, t.exists)(e, "operation") ? w(e.operation) : void 0
                                }
                            })]
                    }
                })
            })
        }, r.prototype.v1MetricsResourceResourceTypeIdResourceIdPost = function(e, t) {
            return a(this, void 0, void 0, function() {
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
        }, r.prototype.v1MetricsqueryBatchPostRaw = function(e, i) {
            return a(this, void 0, void 0, function() {
                var a, r, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return a = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/metrics:queryBatch",
                                schemaPath: "/v1/metrics:queryBatch",
                                method: "POST",
                                headers: r,
                                query: a,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        queries: void 0 === e.queries ? void 0 : e.queries.map(q)
                                    }
                                }(e.v1MetricsQueryBatchPostRequest)
                            }, i)];
                        case 1:
                            return o = n.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    operations: (0, t.exists)(e, "operations") ? e.operations.map(_) : void 0
                                }
                            })]
                    }
                })
            })
        }, r.prototype.v1MetricsqueryBatchPost = function() {
            return a(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), n(this, function(i) {
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
            return a(this, void 0, void 0, function() {
                var a, r, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.operationId || void 0 === e.operationId) throw new t.RequiredError("operationId", "Required parameter requestParameters.operationId was null or undefined when calling v1OperationsOperationIdGet.");
                            return a = {}, void 0 !== e.resourceType && (a.resourceType = e.resourceType), void 0 !== e.resourceId && (a.resourceId = e.resourceId), r = {}, [4, this.request({
                                path: "/v1/operations/{operationId}".replace("{".concat("operationId", "}"), encodeURIComponent(String(e.operationId))),
                                schemaPath: "/v1/operations/{operationId}",
                                method: "GET",
                                headers: r,
                                query: a
                            }, i)];
                        case 1:
                            return o = n.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    operation: (0, t.exists)(e, "operation") ? w(e.operation) : void 0
                                }
                            })]
                    }
                })
            })
        }, r.prototype.v1OperationsOperationIdGet = function(e, t) {
            return a(this, void 0, void 0, function() {
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
        }, r.prototype.v1StatusConfigGetRaw = function(e, i) {
            return a(this, void 0, void 0, function() {
                var a, r, l;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return a = {}, void 0 !== e.universeId && (a.universeId = e.universeId), r = {}, [4, this.request({
                                path: "/v1/status-config",
                                schemaPath: "/v1/status-config",
                                method: "GET",
                                headers: r,
                                query: a
                            }, i)];
                        case 1:
                            return l = n.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return null == e ? e : {
                                    bannerConfigurations: (0, t.exists)(e, "bannerConfigurations") ? e.bannerConfigurations.map(s) : void 0,
                                    annotationConfigurations: (0, t.exists)(e, "annotationConfigurations") ? e.annotationConfigurations.map(o) : void 0,
                                    chartWarningConfigurations: (0, t.exists)(e, "chartWarningConfigurations") ? e.chartWarningConfigurations.map(d) : void 0
                                }
                            })]
                    }
                })
            })
        }, r.prototype.v1StatusConfigGet = function() {
            return a(this, arguments, void 0, function(e, t) {
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
        }, r
    }(t.BaseAPI);
    e.s(["AnalyticsQueryGatewayAPIApi", 0, W, "DataStatus", 0, {
        Invalid: "DATA_STATUS_INVALID",
        Valid: "DATA_STATUS_VALID",
        InProgress: "DATA_STATUS_IN_PROGRESS",
        Incomplete: "DATA_STATUS_INCOMPLETE",
        NotMeaningful: "DATA_STATUS_NOT_MEANINGFUL",
        Projected: "DATA_STATUS_PROJECTED",
        NotStatisticallySignificant: "DATA_STATUS_NOT_STATISTICALLY_SIGNIFICANT",
        InsufficientSampleSize: "DATA_STATUS_INSUFFICIENT_SAMPLE_SIZE"
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
}]);

//# debugId=b67c6c58-80a3-5e17-2f48-c1537952e922
//# sourceMappingURL=1p28q1d86l4w3.js.map
;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "054685c3-16c3-6386-b5a7-37f0db1697ed")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 531007, e => {
    "use strict";
    var t, a = ((t = {}).Spline = "spline", t.Area = "area", t.Column = "column", t.Map = "map", t.Bar = "bar", t.Pie = "pie", t.DurationSpline = "duration_spline", t.DurationArea = "duration_area", t.MultipleMetricSpline = "multiple_metric_spline", t.Table = "Table", t);
    e.s(["ChartType", () => a])
}, 577038, e => {
    "use strict";
    var t, a = ((t = a || {}).Average = "Average", t.Total = "Total", t.TotalAbsoluteValue = "TotalAbsoluteValue", t.SinglePoint = "SinglePoint", t.GrowthRate = "GrowthRate", t.QuotaPercentageUsage = "QuotaPercentageUsage", t.TopBreakdown = "TopBreakdown", t.LastValue = "LastValue", t);
    e.s(["default", 0, a])
}, 923319, e => {
    "use strict";
    var t, a, i = e.i(730530),
        n = ((t = {}).BoldText = "boldText", t.Text = "text", t.TextWithDisplayValue = "textWithDisplayValue", t.Number = "number", t.Timestamp = "timestamp", t.RawJSONString = "RawJSONString", t.CodeDiff = "codeDiff", t.TextWithTooltip = "textWithTooltip", t.Other = "other", t.Selection = "selection", t.Actions = "actions", t.TextWithLink = "textWithLink", t.Image = "image", t.Date = "date", t.Status = "status", t.TextWithIcon = "TextWithIcon", t.Code = "code", t),
        r = ((a = {}).ValueOpacityFill = "valueOpacityFill", a.ValuePercentageWidthFill = "valuePercentageWidthFill", a.ConstantFill = "constantFill", a);
    e.s(["CellBackgroundType", () => r, "ColumnType", () => n, "ColumnTypeToAlign", 0, {
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
    }, "resolveTableColumnTitle", 0, (e, t, a) => void 0 !== a ? (0, i.brandUntranslatableText)(a) : "string" == typeof t ? t : e(t)])
}, 447311, e => {
    "use strict";
    var t, a = ((t = {}).Positive = "Positive", t.Negative = "Negative", t.Progression = "Progression", t.Highlight = "Highlight", t);
    e.s(["TableCellBackgroundColor", () => a])
}, 11517, 510785, 548152, 875907, 908374, e => {
    "use strict";
    var t, a, i, n = e.i(31611),
        r = e.i(730530),
        o = e.i(531007),
        l = e.i(923319),
        s = e.i(447311),
        c = e.i(881670),
        y = e.i(927868),
        u = e.i(577038);
    let m = [u.default.QuotaPercentageUsage];
    u.default.TopBreakdown;
    let p = e => (0, y.isValidArrayEnumValue)(m, e.type),
        T = u.default,
        A = u.default;
    e.s(["RAQIV2SummaryType", 0, T, "default", 0, A, "isRAQIV2DoubleMetricSummaryType", 0, p, "isRAQIV2SingleMetricSummaryType", 0, e => !p(e)], 510785);
    var d = ((t = d || {}).InExperienceCurrency = "inExperienceCurrency", t);
    e.s(["default", 0, d], 548152);
    var R = ((a = {}).PercentageOfFirstPoint = "PercentageOfFirstPoint", a.ScaleBackBy100 = "ScaleBackBy100", a.ScaleBackBy60 = "ScaleBackBy60", a.ScaleBackBy3600 = "ScaleBackBy3600", a.ScaleBackBy1000000000 = "ScaleBackBy1000000000", a);

    function g(e) {
        return (t, a) => {
            let [i, n, r] = a[t];
            return [i, null === n ? null : n * e, r]
        }
    }
    let f = {
        PercentageOfFirstPoint: (e, t) => {
            let [, a] = t[0], [i, n, r] = t[e], o = null;
            return a && null !== n && (o = n / a), [i, o, r]
        },
        ScaleBackBy100: g(.01),
        ScaleBackBy60: g(1 / 60),
        ScaleBackBy3600: g(1 / 3600),
        ScaleBackBy1000000000: g(1e-9)
    };
    e.s(["NumericDataPointTransformerType", () => R, "default", 0, f], 875907);
    let M = {
        defaultTotalSummaryTypes: [{
            type: A.Average
        }]
    };
    n.RAQIV2Metric.ThumbnailWinningSegments;
    let D = e => (0, y.isValidEnumValue)(n.RAQIV2Metric, e) || (0, y.isValidEnumValue)(n.RAQIV2UIMetric, e),
        C = e => {
            var t;
            return D(e) && (null == (t = n.RAQIV2MetricDisplayConfig[e]) ? void 0 : t.valueType) === n.RAQIV2MetricValueType.Numeric
        },
        K = {
            [n.RAQIV2Metric.VideoServiceExclusivePlaybackSeconds]: {
                unit: n.RAQIV2MetricUnit.Hours,
                decimalPrecision: 1
            }
        };
    var S = ((i = {}).WinningSegments = "WinningSegments", i);
    let v = [{
            type: A.Total
        }],
        V = [{
            type: A.LastValue
        }],
        I = {
            [n.RAQIV2Metric.CreatorRewardsAverageRobuxBookingsPerSpender]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.CreatorRewardsAverageRobuxBookingsPerSpender", c.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.CreatorRewardsLifetimeEstimatedAffiliatePayoutRobux]: {
                defaultTotalSummaryTypes: v,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.CreatorRewardsLifetimeEstimatedAffiliatePayoutRobux", c.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.CreatorRewardsLifetimeQualifiedReactivations]: {
                defaultTotalSummaryTypes: v,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.CreatorRewardsLifetimeQualifiedReactivations", c.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.CreatorRewardsLifetimeQualifiedSignups]: {
                defaultTotalSummaryTypes: v,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.CreatorRewardsLifetimeQualifiedSignups", c.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.CreatorRewardsLifetimeQualifiedSpenders]: {
                defaultTotalSummaryTypes: v,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.CreatorRewardsLifetimeQualifiedSpenders", c.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.CommunityAnnouncementEventCount]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.CommunityAnnouncementUniqueUsers]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.CommunityAnnouncementNotificationCTR]: {
                defaultTotalSummaryTypes: V
            },
            [n.RAQIV2Metric.EconomyTransactionAmount]: {
                defaultTotalSummaryTypes: v,
                exploreModeChartType: o.ChartType.Column,
                specialNumberFormatting: d.InExperienceCurrency
            },
            [n.RAQIV2Metric.EconomyTransactionAmountSinks]: {
                defaultTotalSummaryTypes: v,
                exploreModeChartType: o.ChartType.Column,
                specialNumberFormatting: d.InExperienceCurrency
            },
            [n.RAQIV2Metric.EconomyTransactionCount]: {
                defaultTotalSummaryTypes: v,
                exploreModeChartType: o.ChartType.Column
            },
            [n.RAQIV2Metric.EconomyAverageWalletBalance]: {
                exploreModeChartType: o.ChartType.Spline,
                specialNumberFormatting: d.InExperienceCurrency
            },
            [n.RAQIV2Metric.FunnelStepCompletionRate]: {
                columnDisplayConfigOverrides: {
                    cellBackground: {
                        type: l.CellBackgroundType.ValueOpacityFill,
                        color: s.TableCellBackgroundColor.Positive
                    }
                }
            },
            [n.RAQIV2Metric.FunnelUserStepCompletionRate]: {
                columnDisplayConfigOverrides: {
                    cellBackground: {
                        type: l.CellBackgroundType.ValueOpacityFill,
                        color: s.TableCellBackgroundColor.Positive
                    }
                }
            },
            [n.RAQIV2Metric.FunnelStepChurnRate]: {
                columnDisplayConfigOverrides: {
                    cellBackground: {
                        type: l.CellBackgroundType.ValueOpacityFill,
                        color: s.TableCellBackgroundColor.Negative
                    }
                }
            },
            [n.RAQIV2Metric.FunnelUserChurnRate]: {
                columnDisplayConfigOverrides: {
                    cellBackground: {
                        type: l.CellBackgroundType.ValueOpacityFill,
                        color: s.TableCellBackgroundColor.Negative
                    }
                }
            },
            [n.RAQIV2Metric.FunnelStepOverallCompletionRate]: {
                defaultTotalSummaryTypes: v,
                columnDisplayConfigOverrides: {
                    cellBackground: {
                        type: l.CellBackgroundType.ValuePercentageWidthFill,
                        color: s.TableCellBackgroundColor.Progression
                    },
                    widthWeight: 40
                }
            },
            [n.RAQIV2Metric.FunnelUserOverallCompletionRate]: {
                defaultTotalSummaryTypes: v,
                columnDisplayConfigOverrides: {
                    cellBackground: {
                        type: l.CellBackgroundType.ValuePercentageWidthFill,
                        color: s.TableCellBackgroundColor.Progression
                    },
                    widthWeight: 40
                }
            },
            [n.RAQIV2Metric.FunnelUserTotalCount]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.FunnelStepTotalCount]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.JourneyTotalUsers]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.JourneyCompletionUsers]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.JourneyEntryTransitions]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.JourneyLastStageTransitions]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.JourneyStageUserCount]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.JourneyStageTransitionCount]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.JourneyNodeUserCount]: {
                defaultTotalSummaryTypes: v,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.JourneyNodeUserCount", c.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.JourneyNodeUserChurnCount]: {
                defaultTotalSummaryTypes: v,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.JourneyNodeUserChurnCount", c.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.JourneyNodeUserChurnRate]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.JourneyNodeUserChurnRate", c.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.JourneyNodeTransitionCount]: {
                defaultTotalSummaryTypes: v,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.JourneyNodeTransitionCount", c.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.JourneyNodeTransitionChurnCount]: {
                defaultTotalSummaryTypes: v,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.JourneyNodeTransitionChurnCount", c.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.JourneyNodeTransitionChurnRate]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.JourneyNodeTransitionChurnRate", c.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.JourneyUserPctOfSource]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.JourneyUserPctOfSource", c.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.JourneyUserPctOfStart]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.JourneyUserPctOfStart", c.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.JourneyTransitionPctOfSource]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.JourneyTransitionPctOfSource", c.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.JourneyTransitionPctOfStart]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.JourneyTransitionPctOfStart", c.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.UniqueUsersWithPlaySessions]: {
                defaultTotalSummaryTypes: [{
                    type: A.Average
                }, {
                    type: A.Total
                }],
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.UsersWithPlays", c.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.UniqueUsersWithImpressions]: {
                defaultTotalSummaryTypes: [{
                    type: A.Average
                }, {
                    type: A.Total
                }],
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.UsersWithImpressions", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.UsersWithImpressions")
                }
            },
            [n.RAQIV2Metric.EndToEndCVR]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.ConversionRate", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.ConversionRate")
                }
            },
            [n.RAQIV2Metric.QualifiedUniqueUsersWithPlaySessions]: {
                defaultTotalSummaryTypes: [{
                    type: A.Average
                }, {
                    type: A.Total
                }],
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.QualifiedUsersWithPlays", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.QualifiedUsersWithPlays")
                }
            },
            [n.RAQIV2Metric.QualifiedEndToEndCVR]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.QualifiedPTR", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.QualifiedPTR")
                }
            },
            [n.RAQIV2Metric.UniqueUsersWithPlaySessionsMigration]: {
                defaultTotalSummaryTypes: [{
                    type: A.Average
                }, {
                    type: A.Total
                }],
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.UsersWithPlays", c.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.UniqueUsersWithImpressionsMigration]: {
                defaultTotalSummaryTypes: [{
                    type: A.Average
                }, {
                    type: A.Total
                }],
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.UsersWithImpressions", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.UsersWithImpressions")
                }
            },
            [n.RAQIV2Metric.EndToEndCVRMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.ConversionRate", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.ConversionRate")
                }
            },
            [n.RAQIV2Metric.ErrorCount]: {
                columnDisplayConfigOverrides: {
                    columnAlignment: "left"
                }
            },
            [n.RAQIV2Metric.QualifiedUniqueUsersWithPlaySessionsMigration]: {
                defaultTotalSummaryTypes: [{
                    type: A.Average
                }, {
                    type: A.Total
                }],
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.QualifiedUsersWithPlays", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.QualifiedUsersWithPlays")
                }
            },
            [n.RAQIV2Metric.QualifiedEndToEndCVRMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.QualifiedPTR", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.QualifiedPTR")
                }
            },
            [n.RAQIV2Metric.ComputeEfficiency]: {
                dataPointTransformerType: R.ScaleBackBy100
            },
            [n.RAQIV2Metric.Attribution1DPayerConversionRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.PayerConversion1D", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.PayerConversion1D")
                }
            },
            [n.RAQIV2Metric.Attribution1DPlaytimePerUserInMinutes]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.PlaytimePerUser1D", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.PlaytimePerUser1D")
                }
            },
            [n.RAQIV2Metric.Attribution1DRobuxPerUser]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.RevenuePerUser1D", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.RevenuePerUser1D")
                }
            },
            [n.RAQIV2Metric.Attribution30DPayerConversionRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.PayerConversion30D", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.PayerConversion30D")
                }
            },
            [n.RAQIV2Metric.Attribution30DPlaytimePerUserInMinutes]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.PlaytimePerUser30D", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.PlaytimePerUser30D")
                }
            },
            [n.RAQIV2Metric.Attribution30DRobuxPerUser]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.RevenuePerUser30D", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.RevenuePerUser30D")
                }
            },
            [n.RAQIV2Metric.Attribution7DPayerConversionRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.PayerConversion7D", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.PayerConversion7D")
                }
            },
            [n.RAQIV2Metric.Attribution7DPlaytimePerUserInMinutes]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.PlaytimePerUser7D", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.PlaytimePerUser7D")
                }
            },
            [n.RAQIV2Metric.Attribution7DRobuxPerUser]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.RevenuePerUser7D", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.RevenuePerUser7D")
                }
            },
            [n.RAQIV2Metric.AttributionD1RetentionRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.D1Retention", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.D1Retention")
                }
            },
            [n.RAQIV2Metric.AttributionD30RetentionRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.D30Retention", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.D30Retention")
                }
            },
            [n.RAQIV2Metric.AttributionD7RetentionRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.D7Retention", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.D7Retention")
                }
            },
            [n.RAQIV2Metric.UniqueUsersWithClicks]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.UsersWithDetailPageVisits", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.UsersWithDetailPageVisits")
                }
            },
            [n.RAQIV2Metric.ImpressionCVR]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.UsersImpressionCTR", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.UsersImpressionCTR")
                }
            },
            [n.RAQIV2Metric.ClickCVR]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.UsersDetailPageCTR", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.UsersDetailPageCTR")
                }
            },
            [n.RAQIV2Metric.Attribution1DPayerConversionRatioMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.PayerConversion1D", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.PayerConversion1D")
                }
            },
            [n.RAQIV2Metric.Attribution1DPlaytimePerUserInMinutesMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.PlaytimePerUser1D", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.PlaytimePerUser1D")
                }
            },
            [n.RAQIV2Metric.Attribution1DRobuxPerUserMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.RevenuePerUser1D", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.RevenuePerUser1D")
                }
            },
            [n.RAQIV2Metric.Attribution30DPayerConversionRatioMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.PayerConversion30D", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.PayerConversion30D")
                }
            },
            [n.RAQIV2Metric.Attribution30DPlaytimePerUserInMinutesMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.PlaytimePerUser30D", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.PlaytimePerUser30D")
                }
            },
            [n.RAQIV2Metric.Attribution30DRobuxPerUserMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.RevenuePerUser30D", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.RevenuePerUser30D")
                }
            },
            [n.RAQIV2Metric.Attribution7DPayerConversionRatioMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.PayerConversion7D", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.PayerConversion7D")
                }
            },
            [n.RAQIV2Metric.Attribution7DPlaytimePerUserInMinutesMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.PlaytimePerUser7D", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.PlaytimePerUser7D")
                }
            },
            [n.RAQIV2Metric.Attribution7DRobuxPerUserMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.RevenuePerUser7D", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.RevenuePerUser7D")
                }
            },
            [n.RAQIV2Metric.AttributionD1RetentionRatioMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.D1Retention", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.D1Retention")
                }
            },
            [n.RAQIV2Metric.AttributionD30RetentionRatioMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.D30Retention", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.D30Retention")
                }
            },
            [n.RAQIV2Metric.AttributionD7RetentionRatioMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.D7Retention", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.D7Retention")
                }
            },
            [n.RAQIV2Metric.UniqueUsersWithClicksMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.UsersWithDetailPageVisits", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.UsersWithDetailPageVisits")
                }
            },
            [n.RAQIV2Metric.ImpressionCVRMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.UsersImpressionCTR", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.UsersImpressionCTR")
                }
            },
            [n.RAQIV2Metric.ClickCVRMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.UsersDetailPageCTR", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.UsersDetailPageCTR")
                }
            },
            [n.RAQIV2Metric.DailyRevenue]: {
                defaultTotalSummaryTypes: [{
                    type: A.Average
                }, {
                    type: A.Total
                }],
                loggingMetricOverride: "Robux"
            },
            [n.RAQIV2Metric.L7AverageDailyRevenue]: {
                defaultTotalSummaryTypes: [{
                    type: A.Average
                }, {
                    type: A.Total
                }],
                loggingMetricOverride: "Robux"
            },
            [n.RAQIV2Metric.ItemMonetizationRevenue]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.ItemMonetizationSales]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.AverageSessionLengthMinutes]: {
                loggingMetricOverride: "AveragePlayTime"
            },
            [n.RAQIV2Metric.AveragePlayTimeMinutesPerDAU]: {
                loggingMetricOverride: "AveragePlayTime"
            },
            [n.RAQIV2Metric.ThumbnailImpressions]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.ThumbnailQualifiedPlays]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.TotalSessionsEndedInBucket]: {
                defaultTotalSummaryTypes: [{
                    type: A.SinglePoint,
                    selectedXValue: 300,
                    specificLabel: {
                        translationKey: (0, r.translationKey)("Label.PercentageInSummary", c.TranslationNamespace.Analytics),
                        arguments: {
                            minute: Math.floor(5).toString()
                        }
                    }
                }],
                dataPointTransformerType: R.PercentageOfFirstPoint,
                exploreModeChartType: o.ChartType.DurationSpline,
                exploreModeSpecOverride: {
                    breakdown: {
                        intersect: [n.RAQIV2Dimension.SessionTimeBucket]
                    },
                    granularity: {
                        override: n.RAQIV2MetricGranularity.None
                    }
                },
                totalSeriesNameOverride: (0, r.translationKey)("Label.PlayersPercentage", c.TranslationNamespace.Analytics)
            },
            [n.RAQIV2UIMetric.ClientMemoryUsage]: {
                dataPointTransformerType: R.ScaleBackBy1000000000
            },
            [n.RAQIV2UIMetric.SessionDurationSeconds]: {
                dataPointTransformerType: R.ScaleBackBy60
            },
            [n.RAQIV2UIMetric.ServerMemoryUsage]: {
                dataPointTransformerType: R.ScaleBackBy1000000000
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
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.ItemAvatar3dLimitedTotalQuantity]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.ItemLifetimeCreatorEarning]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.ItemLifetimeRebateAmount]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.ItemLifetimeRobuxSpent]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.ItemLifetimeTransactionCount]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.ItemLimitedSoldPercentage]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.ItemPublishAdvance]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.ItemTotalCreatorEarning]: {
                defaultTotalSummaryTypes: v,
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Revenue", c.TranslationNamespace.AvatarAnalytics)
                }
            },
            [n.RAQIV2Metric.ItemTotalRobuxSpent]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.ItemTotalTransactionCount]: {
                defaultTotalSummaryTypes: v,
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.ItemTotalTransactionCount", c.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.StoreTransactions]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.StoreRevenue]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.ShareLinkAttribution1DPayerConversionRatio]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.ShareLinkAttribution1DPlaytimePerUserInMinutes]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.ShareLinkAttribution1DRobuxPerUser]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.ShareLinkAttribution30DPayerConversionRatio]: {
                defaultTotalSummaryTypes: v,
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.PayerConversion30D", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.PayerConversion30D")
                }
            },
            [n.RAQIV2Metric.ShareLinkAttribution30DPlaytimePerUserInMinutes]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.ShareLinkAttribution30DRobuxPerUser]: {
                defaultTotalSummaryTypes: v,
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.RevenuePerUser30D", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.RevenuePerUser30D")
                }
            },
            [n.RAQIV2Metric.ShareLinkAttribution7DPayerConversionRatio]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.ShareLinkAttribution7DPlaytimePerUserInMinutes]: {
                defaultTotalSummaryTypes: v,
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.PlaytimePerUser7D", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.PlaytimePerUser7D")
                }
            },
            [n.RAQIV2Metric.ShareLinkAttribution7DRobuxPerUser]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.ShareLinkAttributionD1RetentionRatio]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.ShareLinkAttributionD30RetentionRatio]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.ShareLinkAttributionD7RetentionRatio]: {
                defaultTotalSummaryTypes: v,
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
                defaultTotalSummaryTypes: v,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.QualifiedUsersWithPlays")
                }
            },
            [n.RAQIV2Metric.ShareLinkUniqueUsersWithClicks]: {
                defaultTotalSummaryTypes: v,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.UsersWithDetailPageVisits")
                }
            },
            [n.RAQIV2Metric.ShareLinkUniqueUsersWithPlaySessions]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.AffiliateLinkDailyAverageRobuxBookingsPerReactivationSpender]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.AverageRobuxBookingsPerReactivationSpenderV3", c.TranslationNamespace.Analytics),
                    titleKey: (0, r.translationKey)("Label.Metric.AverageRobuxBookingsPerReactivationSpenderV3", c.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.AffiliateLinkDailyAffiliateActiveSpenderReactivationsPayoutRobux]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.LifetimeEstimatedAffiliateActiveSpenderReactivationsPayoutRobuxV3", c.TranslationNamespace.Analytics),
                    titleKey: (0, r.translationKey)("Label.Metric.LifetimeEstimatedAffiliateActiveSpenderReactivationsPayoutRobuxV3", c.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.AffiliateLinkDailyQualifiedActiveSpenderReactivations]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.LifetimeQualifiedActiveSpenderReactivationsV3", c.TranslationNamespace.Analytics),
                    titleKey: (0, r.translationKey)("Label.Metric.LifetimeQualifiedActiveSpenderReactivationsV3", c.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.AffiliateLinkDailyQualifiedReactivationsSpenders]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.LifetimeQualifiedReactivationsSpendersV3", c.TranslationNamespace.Analytics),
                    titleKey: (0, r.translationKey)("Label.Metric.LifetimeQualifiedReactivationsSpendersV3", c.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.AffiliateLinkDailyAffiliateReactivationsPayoutRobux]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.LifetimeEstimatedAffiliateReactivationsPayoutRobuxV3", c.TranslationNamespace.Analytics),
                    titleKey: (0, r.translationKey)("Label.Metric.LifetimeEstimatedAffiliateReactivationsPayoutRobuxV3", c.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.AffiliateLinkDailyQualifiedSignupSpenders]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.LifetimeQualifiedSignupSpendersV3", c.TranslationNamespace.Analytics),
                    titleKey: (0, r.translationKey)("Label.Metric.LifetimeQualifiedSignupSpendersV3", c.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.AffiliateLinkDailyAverageRobuxBookingsPerSignupSpender]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.AverageRobuxBookingsPerSignupSpenderV3", c.TranslationNamespace.Analytics),
                    titleKey: (0, r.translationKey)("Label.Metric.AverageRobuxBookingsPerSignupSpenderV3", c.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.AffiliateLinkDailyAffiliateSignupsPayoutRobux]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.LifetimeEstimatedAffiliateSignupsPayoutRobuxV3", c.TranslationNamespace.Analytics),
                    titleKey: (0, r.translationKey)("Label.Metric.LifetimeEstimatedAffiliateSignupsPayoutRobuxV3", c.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.AffiliateLinkDailyBookingsPerSpenderCombined]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.BookingsPerSpenderCombinedV3", c.TranslationNamespace.Analytics),
                    titleKey: (0, r.translationKey)("Label.Metric.BookingsPerSpenderCombinedV3", c.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.AffiliateLinkDailyVisits]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.Metric.AffiliateLinkDailyVisits", c.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.AffiliateLinkDailyQualifiedSignups]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.LifetimeQualifiedSignupsV3", c.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.AffiliateLinkDailyQualifiedReactivations]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.LifetimeQualifiedReactivationsV3", c.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.AffiliateLinkDailyTotalPayoutRobux]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.LifetimeEstimatedAffiliateCombinedPayoutRobuxV3", c.TranslationNamespace.Analytics),
                    titleKey: (0, r.translationKey)("Label.Metric.LifetimeEstimatedAffiliateCombinedPayoutRobuxV3", c.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.CreatorRewardsAudienceExpansionFunnelSignups]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.Metric.AESignups", c.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.CreatorRewardsAudienceExpansionFunnelReactivations]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.LifetimeQualifiedReactivationsV3", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKey)("Description.Metric.AEReactivations", c.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.CreatorRewardsAudienceExpansionFunnelPercentOfNewUsers]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.AEAudienceExpansionPercentage", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKey)("Description.Metric.AEAudienceExpansionPercentage", c.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.CreatorRewardsAudienceExpansionFunnelRetentionD1]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.AERetentionD1", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKey)("Description.Metric.AERetentionD1", c.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.CreatorRewardsAudienceExpansionFunnelRetentionD7]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.AERetentionD7", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKey)("Description.Metric.AERetentionD7", c.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.CreatorRewardsAudienceExpansionFunnelPayerConversion7D]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.AEPayerConversion7D", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKey)("Description.Metric.AEPayerConversion7D", c.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.CreatorRewardsAudienceExpansionFunnelRevenuePerPayer7D]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.AERevenuePerPayer7D", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKey)("Description.Metric.AERevenuePerPayer7D", c.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.CreatorRewardsAudienceExpansionFunnelRevenuePerUser7D]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.AERevenuePerUser7D", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKey)("Description.Metric.AERevenuePerUser7D", c.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.CreatorRewardsAudienceExpansionFunnelPayerConversion60D]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.AEPayerConversion60D", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKey)("Label.Description.AEPayerConversion60D", c.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.CreatorRewardsAudienceExpansionFunnelRevenuePerPayer60D]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.AERevenuePerPayer60D", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKey)("Label.Description.AERevenuePerPayer60D", c.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.CreatorRewardsAudienceExpansionFunnelRevenuePerUser60D]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.AERevenuePerUser60D", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKey)("Label.Description.AERevenuePerUser60D", c.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.CreatorRewardsAudienceExpansionFunnelEstimatedPayout]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.CreatorRewardsLifetimeEstimatedAffiliatePayoutRobux", c.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKey)("Label.Description.AERevenuePerPayer60D", c.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.FriendReferralAverageRobuxBookingsPerSpender]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.FriendReferralLifetimeEstimatedAffiliatePayoutRobux]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.FriendReferralLifetimeQualifiedSignups]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.FriendReferralLifetimeQualifiedSpenders]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.FriendReferralLifetimeVisits]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.PlayerFeedbackVotesCount]: {
                defaultTotalSummaryTypes: [],
                exploreModeChartType: o.ChartType.Column
            },
            [n.RAQIV2UIMetric.MatchmakingCategoricalCustomSignalsSimilarityRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.MatchmakingCategoricalCustomSignalsSimilarityRatio", c.TranslationNamespace.Matchmaking),
                    tooltipKey: (0, r.translationKey)("Description.MatchmakingCategoricalCustomSignalsSimilarityRatio", c.TranslationNamespace.Matchmaking)
                }
            },
            [n.RAQIV2UIMetric.MatchmakingNumericCustomSignalsDifference]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.MatchmakingNumericCustomSignalsDifference", c.TranslationNamespace.Matchmaking),
                    tooltipKey: (0, r.translationKey)("Description.MatchmakingNumericCustomSignalsDifference", c.TranslationNamespace.Matchmaking)
                }
            },
            [n.RAQIV2Metric.MatchmakingPlayerAttributesLoadingStatusAvg]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.MatchmakingPlayerAttributesLoadingStatusAvg", c.TranslationNamespace.Matchmaking),
                    tooltipKey: (0, r.translationKey)("Description.MatchmakingPlayerAttributesLoadingStatusAvg", c.TranslationNamespace.Matchmaking)
                }
            },
            [n.RAQIV2UIMetric.MatchmakingSignalsAgeDifference]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.MatchmakingSignalsAgeDifference", c.TranslationNamespace.Matchmaking),
                    tooltipKey: (0, r.translationKey)("Description.MatchmakingSignalsAgeDifference", c.TranslationNamespace.Matchmaking)
                }
            },
            [n.RAQIV2UIMetric.MatchmakingSignalsCommonChatGroupRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.MatchmakingSignalsCommonChatGroupRatio", c.TranslationNamespace.Matchmaking),
                    tooltipKey: (0, r.translationKey)("Description.MatchmakingSignalsCommonChatGroupRatio", c.TranslationNamespace.Matchmaking)
                }
            },
            [n.RAQIV2UIMetric.MatchmakingSignalsCommonDeviceTypeRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.MatchmakingSignalsCommonDeviceTypeRatio", c.TranslationNamespace.Matchmaking),
                    tooltipKey: (0, r.translationKey)("Description.MatchmakingSignalsCommonDeviceTypeRatio", c.TranslationNamespace.Matchmaking)
                }
            },
            [n.RAQIV2UIMetric.MatchmakingSignalsCommonLanguageRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.MatchmakingSignalsCommonLanguageRatio", c.TranslationNamespace.Matchmaking),
                    tooltipKey: (0, r.translationKey)("Description.MatchmakingSignalsCommonLanguageRatio", c.TranslationNamespace.Matchmaking)
                }
            },
            [n.RAQIV2UIMetric.MatchmakingSignalsDeltaPing]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.MatchmakingSignalsDeltaPing", c.TranslationNamespace.Matchmaking),
                    tooltipKey: (0, r.translationKey)("Description.MatchmakingSignalsDeltaPing", c.TranslationNamespace.Matchmaking)
                }
            },
            [n.RAQIV2UIMetric.MatchmakingSignalsEstimatePing]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.MatchmakingSignalsEstimatedPing", c.TranslationNamespace.Matchmaking),
                    tooltipKey: (0, r.translationKey)("Description.MatchmakingSignalsEstimatedPing", c.TranslationNamespace.Matchmaking)
                }
            },
            [n.RAQIV2UIMetric.MatchmakingSignalsOccupancyRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.MatchmakingSignalsOccupancyRatio", c.TranslationNamespace.Matchmaking),
                    tooltipKey: (0, r.translationKey)("Description.MatchmakingSignalsOccupancyRatio", c.TranslationNamespace.Matchmaking)
                }
            },
            [n.RAQIV2UIMetric.MatchmakingSignalsPlayHistoryDifference]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.MatchmakingSignalsPlayHistoryDifference", c.TranslationNamespace.Matchmaking),
                    tooltipKey: (0, r.translationKey)("Description.MatchmakingSignalsPlayHistoryDifference", c.TranslationNamespace.Matchmaking)
                }
            },
            [n.RAQIV2Metric.MatchmakingSignalsPreferredPlayerMatchRatioAvg]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.MatchmakingSignalsFriendsMatchRatioAvg", c.TranslationNamespace.Matchmaking),
                    tooltipKey: (0, r.translationKey)("Description.MatchmakingSignalsFriendsMatchRatioAvg", c.TranslationNamespace.Matchmaking)
                }
            },
            [n.RAQIV2UIMetric.MatchmakingSignalsVoiceChatRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.MatchmakingSignalsVoiceChatRatio", c.TranslationNamespace.Matchmaking),
                    tooltipKey: (0, r.translationKey)("Description.MatchmakingSignalsVoiceChatRatio", c.TranslationNamespace.Matchmaking)
                }
            },
            [n.RAQIV2Metric.DataStoreListRequests]: {
                defaultTotalSummaryTypes: [{
                    type: A.Average
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
                    type: A.Average
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
                    type: A.Average
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
                    type: A.Average
                }]
            },
            [n.RAQIV2Metric.DataStoreConsumedReadRequests]: {
                defaultTotalSummaryTypes: [{
                    type: A.QuotaPercentageUsage
                }],
                exploreModeChartType: o.ChartType.Spline
            },
            [n.RAQIV2Metric.DataStoreConsumedWriteRequests]: {
                defaultTotalSummaryTypes: [{
                    type: A.QuotaPercentageUsage
                }],
                exploreModeChartType: o.ChartType.Spline
            },
            [n.RAQIV2Metric.DataStoreConsumedListRequests]: {
                defaultTotalSummaryTypes: [{
                    type: A.QuotaPercentageUsage
                }],
                exploreModeChartType: o.ChartType.Spline
            },
            [n.RAQIV2Metric.DataStoreConsumedRemoveRequests]: {
                defaultTotalSummaryTypes: [{
                    type: A.QuotaPercentageUsage
                }],
                exploreModeChartType: o.ChartType.Spline
            },
            [n.RAQIV2Metric.CommerceGMV]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.CommerceQuantitySold]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.CommerceClicks]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.CommerceImpressions]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.CommerceOrders]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.CommerceCheckouts]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.CommerceUniqueClicks]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.CommerceUniqueImpressions]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.CommerceUniqueCheckouts]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.CommerceUniqueOrders]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.AdsPublisherReportingTotalRevenueRobux]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.AdsPublisherReportingTotalImpressions]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.AdsPublisherReportingVideo2DRevenueRobux]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.AdsPublisherReportingVideo2DImpressions]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.AdsPublisherReportingVideo2DDailyUniqueViewer]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.CommunityGroupPageViews]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.CommunityGroupPageUniqueVisitors]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.CommunityMembershipChangeEvents]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.CommunityForumContentEventCount]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.CommunityForumContentUniqueUsers]: {
                defaultTotalSummaryTypes: v
            },
            [n.RAQIV2Metric.CommunityMembershipCount]: {
                defaultTotalSummaryTypes: V
            },
            [n.RAQIV2Metric.VideoServiceExclusivePlaybackSeconds]: {
                defaultTotalSummaryTypes: v,
                dataPointTransformerType: R.ScaleBackBy3600
            }
        },
        Q = {
            [n.RAQIV2Metric.ThumbnailWinningSegments]: {
                rendererType: "WinningSegments",
                valueTranslationKeys: {
                    male_below_13: {
                        name: (0, r.translationKey)("Label.WinningSegment.MaleBelow13", c.TranslationNamespace.Analytics)
                    },
                    female_below_13: {
                        name: (0, r.translationKey)("Label.WinningSegment.FemaleBelow13", c.TranslationNamespace.Analytics)
                    },
                    male_above_13: {
                        name: (0, r.translationKey)("Label.WinningSegment.MaleAbove13", c.TranslationNamespace.Analytics)
                    },
                    female_above_13: {
                        name: (0, r.translationKey)("Label.WinningSegment.FemaleAbove13", c.TranslationNamespace.Analytics)
                    },
                    below_18: {
                        name: (0, r.translationKey)("Label.WinningSegment.Below18", c.TranslationNamespace.Analytics)
                    },
                    above_or_equal_18: {
                        name: (0, r.translationKey)("Label.WinningSegment.AboveOrEqual18", c.TranslationNamespace.Analytics)
                    }
                }
            }
        };
    e.s(["RAQIV2MetricValueRendererType", () => S, "default", 0, e => {
        let t = n.RAQIV2MetricDisplayConfig[e],
            a = t.valueType === n.RAQIV2MetricValueType.Numeric ? I[e] : Q[e],
            i = {
                ...M,
                ...t,
                ...a
            },
            r = K[e];
        return null != r && (i.unit = r.unit, i.decimalPrecision = r.decimalPrecision), i
    }, "isNumericUIMetric", 0, C, "isRAQIV2UIMetric", 0, D], 908374);
    let b = e => "string" == typeof e && e.trim().length > 0,
        h = e => !!e && "object" == typeof e && e.metric === n.RAQIV2UIMetric.CustomEventsV2 && b(e.customEventName) && (void 0 === e.aggregationType || Object.values(n.RAQIV2AggregationType).includes(e.aggregationType)),
        P = e => h(e) ? e.metric : e,
        N = e => {
            var t;
            let a;
            return !!e && "object" == typeof e && b(e.key) && (b(a = t = e.metric) && C(a) || h(t))
        },
        k = e => !!e && "object" == typeof e && "sources" in e && !!Array.isArray(e.sources) && 0 !== e.sources.length && !!b(e.formula) && e.sources.every(N),
        U = e => {
            if (!k(e)) return [P(e)];
            let t = new Set;
            return e.sources.forEach(e => {
                t.add(P(e.metric))
            }), Array.from(t)
        },
        O = e => {
            var t;
            if (!h(e)) return e;
            let a = null != (t = e.aggregationType) ? t : n.RAQIV2AggregationType.Sum;
            return "".concat(e.metric, ":").concat(e.customEventName, ":").concat(a)
        },
        L = e => k(e) ? "ACEComputed:".concat((e => {
            if (!k(e)) return [e];
            let t = new Set,
                a = [];
            return e.sources.forEach(e => {
                let i = O(e.metric);
                t.has(i) || (t.add(i), a.push(e.metric))
            }), a
        })(e).map(e => O(e)).sort().join("|")) : O(e);
    e.s(["getAtomicMetricsFromMetricLike", 0, U, "getMetricCacheKeyFromMetricLike", 0, L, "getSentryMetricNameFromMetricLike", 0, e => L(e), "getUIMetricFromAtomicMetricLike", 0, P, "getUIMetricsFromMetricLike", 0, U, "isComputedMetric", 0, k, "isCustomEventsAtomicMetricLike", 0, h], 11517)
}, 718389, e => {
    "use strict";
    e.s(["default", 0, function e(t) {
        let a = t;
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
            for (var n in a = Array.isArray(t) ? [] : {}, t) a[n] = e(t[n]);
        return a
    }])
}]);

//# debugId=054685c3-16c3-6386-b5a7-37f0db1697ed
//# sourceMappingURL=1eck2s_qfby9n.js.map
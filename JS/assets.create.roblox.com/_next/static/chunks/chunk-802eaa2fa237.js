;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "e4811615-d035-9c1b-75ed-e6d2ab5a3b98")
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
}, 923319, e => {
    "use strict";
    var t, i, n = e.i(730530),
        a = ((t = {}).BoldText = "boldText", t.Text = "text", t.TextWithDisplayValue = "textWithDisplayValue", t.Number = "number", t.Timestamp = "timestamp", t.RawJSONString = "RawJSONString", t.CodeDiff = "codeDiff", t.TextWithTooltip = "textWithTooltip", t.Other = "other", t.Selection = "selection", t.Actions = "actions", t.TextWithLink = "textWithLink", t.Image = "image", t.Date = "date", t.Status = "status", t.TextWithIcon = "TextWithIcon", t.Code = "code", t),
        r = ((i = {}).ValueOpacityFill = "valueOpacityFill", i.ValuePercentageWidthFill = "valuePercentageWidthFill", i.ConstantFill = "constantFill", i);
    e.s(["CellBackgroundType", () => r, "ColumnType", () => a, "ColumnTypeToAlign", 0, {
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
}, 908374, 510785, 548152, 875907, e => {
    "use strict";
    var t, i, n, a = e.i(31611),
        r = e.i(730530),
        o = e.i(531007),
        s = e.i(923319),
        l = e.i(447311),
        u = e.i(881670),
        c = e.i(927868),
        d = e.i(577038);
    let p = [d.default.QuotaPercentageUsage];
    d.default.TopBreakdown;
    let y = e => (0, c.isValidArrayEnumValue)(p, e.type),
        m = d.default,
        T = d.default;
    e.s(["RAQIV2SummaryType", 0, m, "default", 0, T, "isRAQIV2DoubleMetricSummaryType", 0, y, "isRAQIV2SingleMetricSummaryType", 0, e => !y(e)], 510785);
    var v = ((t = v || {}).InExperienceCurrency = "inExperienceCurrency", t);
    e.s(["default", 0, v], 548152);
    var f = ((i = {}).PercentageOfFirstPoint = "PercentageOfFirstPoint", i.ScaleBackBy100 = "ScaleBackBy100", i.ScaleBackBy60 = "ScaleBackBy60", i.ScaleBackBy3600 = "ScaleBackBy3600", i.ScaleBackBy1000000000 = "ScaleBackBy1000000000", i);

    function g(e) {
        return (t, i) => {
            let [n, a, r] = i[t];
            return [n, null === a ? null : a * e, r]
        }
    }
    let R = {
        PercentageOfFirstPoint: (e, t) => {
            let [, i] = t[0], [n, a, r] = t[e], o = null;
            return i && null !== a && (o = a / i), [n, o, r]
        },
        ScaleBackBy100: g(.01),
        ScaleBackBy60: g(1 / 60),
        ScaleBackBy3600: g(1 / 3600),
        ScaleBackBy1000000000: g(1e-9)
    };
    e.s(["NumericDataPointTransformerType", () => f, "default", 0, R], 875907);
    let A = {
        defaultTotalSummaryTypes: [{
            type: T.Average
        }]
    };
    a.RAQIV2Metric.ThumbnailWinningSegments;
    let h = e => (0, c.isValidEnumValue)(a.RAQIV2Metric, e) || (0, c.isValidEnumValue)(a.RAQIV2UIMetric, e),
        I = {
            [a.RAQIV2Metric.VideoServiceExclusivePlaybackSeconds]: {
                unit: a.RAQIV2MetricUnit.Hours,
                decimalPrecision: 1
            }
        };
    var D = ((n = {}).WinningSegments = "WinningSegments", n);
    let M = [{
            type: T.Total
        }],
        S = [{
            type: T.LastValue
        }],
        C = {
            [a.RAQIV2Metric.CreatorRewardsAverageRobuxBookingsPerSpender]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.CreatorRewardsAverageRobuxBookingsPerSpender", u.TranslationNamespace.Analytics)
                }
            },
            [a.RAQIV2Metric.CreatorRewardsLifetimeEstimatedAffiliatePayoutRobux]: {
                defaultTotalSummaryTypes: M,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.CreatorRewardsLifetimeEstimatedAffiliatePayoutRobux", u.TranslationNamespace.Analytics)
                }
            },
            [a.RAQIV2Metric.CreatorRewardsLifetimeQualifiedReactivations]: {
                defaultTotalSummaryTypes: M,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.CreatorRewardsLifetimeQualifiedReactivations", u.TranslationNamespace.Analytics)
                }
            },
            [a.RAQIV2Metric.CreatorRewardsLifetimeQualifiedSignups]: {
                defaultTotalSummaryTypes: M,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.CreatorRewardsLifetimeQualifiedSignups", u.TranslationNamespace.Analytics)
                }
            },
            [a.RAQIV2Metric.CreatorRewardsLifetimeQualifiedSpenders]: {
                defaultTotalSummaryTypes: M,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.CreatorRewardsLifetimeQualifiedSpenders", u.TranslationNamespace.Analytics)
                }
            },
            [a.RAQIV2Metric.CommunityAnnouncementEventCount]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.CommunityAnnouncementUniqueUsers]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.CommunityAnnouncementNotificationCTR]: {
                defaultTotalSummaryTypes: S
            },
            [a.RAQIV2Metric.EconomyTransactionAmount]: {
                defaultTotalSummaryTypes: M,
                exploreModeChartType: o.ChartType.Column,
                specialNumberFormatting: v.InExperienceCurrency
            },
            [a.RAQIV2Metric.EconomyTransactionAmountSinks]: {
                defaultTotalSummaryTypes: M,
                exploreModeChartType: o.ChartType.Column,
                specialNumberFormatting: v.InExperienceCurrency
            },
            [a.RAQIV2Metric.EconomyTransactionCount]: {
                defaultTotalSummaryTypes: M,
                exploreModeChartType: o.ChartType.Column
            },
            [a.RAQIV2Metric.EconomyAverageWalletBalance]: {
                exploreModeChartType: o.ChartType.Spline,
                specialNumberFormatting: v.InExperienceCurrency
            },
            [a.RAQIV2Metric.FunnelStepCompletionRate]: {
                columnDisplayConfigOverrides: {
                    cellBackground: {
                        type: s.CellBackgroundType.ValueOpacityFill,
                        color: l.TableCellBackgroundColor.Positive
                    }
                }
            },
            [a.RAQIV2Metric.FunnelUserStepCompletionRate]: {
                columnDisplayConfigOverrides: {
                    cellBackground: {
                        type: s.CellBackgroundType.ValueOpacityFill,
                        color: l.TableCellBackgroundColor.Positive
                    }
                }
            },
            [a.RAQIV2Metric.FunnelStepChurnRate]: {
                columnDisplayConfigOverrides: {
                    cellBackground: {
                        type: s.CellBackgroundType.ValueOpacityFill,
                        color: l.TableCellBackgroundColor.Negative
                    }
                }
            },
            [a.RAQIV2Metric.FunnelUserChurnRate]: {
                columnDisplayConfigOverrides: {
                    cellBackground: {
                        type: s.CellBackgroundType.ValueOpacityFill,
                        color: l.TableCellBackgroundColor.Negative
                    }
                }
            },
            [a.RAQIV2Metric.FunnelStepOverallCompletionRate]: {
                defaultTotalSummaryTypes: M,
                columnDisplayConfigOverrides: {
                    cellBackground: {
                        type: s.CellBackgroundType.ValuePercentageWidthFill,
                        color: l.TableCellBackgroundColor.Progression
                    },
                    widthWeight: 40
                }
            },
            [a.RAQIV2Metric.FunnelUserOverallCompletionRate]: {
                defaultTotalSummaryTypes: M,
                columnDisplayConfigOverrides: {
                    cellBackground: {
                        type: s.CellBackgroundType.ValuePercentageWidthFill,
                        color: l.TableCellBackgroundColor.Progression
                    },
                    widthWeight: 40
                }
            },
            [a.RAQIV2Metric.FunnelUserTotalCount]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.FunnelStepTotalCount]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.JourneyTotalUsers]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.JourneyCompletionUsers]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.JourneyEntryTransitions]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.JourneyLastStageTransitions]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.JourneyStageUserCount]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.JourneyStageTransitionCount]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.JourneyNodeUserCount]: {
                defaultTotalSummaryTypes: M,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.JourneyNodeUserCount", u.TranslationNamespace.Analytics)
                }
            },
            [a.RAQIV2Metric.JourneyNodeUserChurnCount]: {
                defaultTotalSummaryTypes: M,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.JourneyNodeUserChurnCount", u.TranslationNamespace.Analytics)
                }
            },
            [a.RAQIV2Metric.JourneyNodeUserChurnRate]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.JourneyNodeUserChurnRate", u.TranslationNamespace.Analytics)
                }
            },
            [a.RAQIV2Metric.JourneyNodeTransitionCount]: {
                defaultTotalSummaryTypes: M,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.JourneyNodeTransitionCount", u.TranslationNamespace.Analytics)
                }
            },
            [a.RAQIV2Metric.JourneyNodeTransitionChurnCount]: {
                defaultTotalSummaryTypes: M,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.JourneyNodeTransitionChurnCount", u.TranslationNamespace.Analytics)
                }
            },
            [a.RAQIV2Metric.JourneyNodeTransitionChurnRate]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.JourneyNodeTransitionChurnRate", u.TranslationNamespace.Analytics)
                }
            },
            [a.RAQIV2Metric.JourneyUserPctOfSource]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.JourneyUserPctOfSource", u.TranslationNamespace.Analytics)
                }
            },
            [a.RAQIV2Metric.JourneyUserPctOfStart]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.JourneyUserPctOfStart", u.TranslationNamespace.Analytics)
                }
            },
            [a.RAQIV2Metric.JourneyTransitionPctOfSource]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.JourneyTransitionPctOfSource", u.TranslationNamespace.Analytics)
                }
            },
            [a.RAQIV2Metric.JourneyTransitionPctOfStart]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.JourneyTransitionPctOfStart", u.TranslationNamespace.Analytics)
                }
            },
            [a.RAQIV2Metric.UniqueUsersWithPlaySessions]: {
                defaultTotalSummaryTypes: [{
                    type: T.Average
                }, {
                    type: T.Total
                }],
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.UsersWithPlays", u.TranslationNamespace.Analytics)
                }
            },
            [a.RAQIV2Metric.UniqueUsersWithImpressions]: {
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
            [a.RAQIV2Metric.EndToEndCVR]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.ConversionRate", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.ConversionRate")
                }
            },
            [a.RAQIV2Metric.QualifiedUniqueUsersWithPlaySessions]: {
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
            [a.RAQIV2Metric.QualifiedEndToEndCVR]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.QualifiedPTR", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.QualifiedPTR")
                }
            },
            [a.RAQIV2Metric.UniqueUsersWithPlaySessionsMigration]: {
                defaultTotalSummaryTypes: [{
                    type: T.Average
                }, {
                    type: T.Total
                }],
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.UsersWithPlays", u.TranslationNamespace.Analytics)
                }
            },
            [a.RAQIV2Metric.UniqueUsersWithImpressionsMigration]: {
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
            [a.RAQIV2Metric.EndToEndCVRMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.ConversionRate", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.ConversionRate")
                }
            },
            [a.RAQIV2Metric.ErrorCount]: {
                columnDisplayConfigOverrides: {
                    columnAlignment: "left"
                }
            },
            [a.RAQIV2Metric.QualifiedUniqueUsersWithPlaySessionsMigration]: {
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
            [a.RAQIV2Metric.QualifiedEndToEndCVRMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.QualifiedPTR", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.QualifiedPTR")
                }
            },
            [a.RAQIV2Metric.ComputeEfficiency]: {
                dataPointTransformerType: f.ScaleBackBy100
            },
            [a.RAQIV2Metric.Attribution1DPayerConversionRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.PayerConversion1D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.PayerConversion1D")
                }
            },
            [a.RAQIV2Metric.Attribution1DPlaytimePerUserInMinutes]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.PlaytimePerUser1D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.PlaytimePerUser1D")
                }
            },
            [a.RAQIV2Metric.Attribution1DRobuxPerUser]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.RevenuePerUser1D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.RevenuePerUser1D")
                }
            },
            [a.RAQIV2Metric.Attribution30DPayerConversionRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.PayerConversion30D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.PayerConversion30D")
                }
            },
            [a.RAQIV2Metric.Attribution30DPlaytimePerUserInMinutes]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.PlaytimePerUser30D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.PlaytimePerUser30D")
                }
            },
            [a.RAQIV2Metric.Attribution30DRobuxPerUser]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.RevenuePerUser30D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.RevenuePerUser30D")
                }
            },
            [a.RAQIV2Metric.Attribution7DPayerConversionRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.PayerConversion7D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.PayerConversion7D")
                }
            },
            [a.RAQIV2Metric.Attribution7DPlaytimePerUserInMinutes]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.PlaytimePerUser7D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.PlaytimePerUser7D")
                }
            },
            [a.RAQIV2Metric.Attribution7DRobuxPerUser]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.RevenuePerUser7D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.RevenuePerUser7D")
                }
            },
            [a.RAQIV2Metric.AttributionD1RetentionRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.D1Retention", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.D1Retention")
                }
            },
            [a.RAQIV2Metric.AttributionD30RetentionRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.D30Retention", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.D30Retention")
                }
            },
            [a.RAQIV2Metric.AttributionD7RetentionRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.D7Retention", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.D7Retention")
                }
            },
            [a.RAQIV2Metric.UniqueUsersWithClicks]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.UsersWithDetailPageVisits", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.UsersWithDetailPageVisits")
                }
            },
            [a.RAQIV2Metric.ImpressionCVR]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.UsersImpressionCTR", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.UsersImpressionCTR")
                }
            },
            [a.RAQIV2Metric.ClickCVR]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.UsersDetailPageCTR", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.UsersDetailPageCTR")
                }
            },
            [a.RAQIV2Metric.Attribution1DPayerConversionRatioMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.PayerConversion1D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.PayerConversion1D")
                }
            },
            [a.RAQIV2Metric.Attribution1DPlaytimePerUserInMinutesMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.PlaytimePerUser1D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.PlaytimePerUser1D")
                }
            },
            [a.RAQIV2Metric.Attribution1DRobuxPerUserMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.RevenuePerUser1D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.RevenuePerUser1D")
                }
            },
            [a.RAQIV2Metric.Attribution30DPayerConversionRatioMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.PayerConversion30D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.PayerConversion30D")
                }
            },
            [a.RAQIV2Metric.Attribution30DPlaytimePerUserInMinutesMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.PlaytimePerUser30D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.PlaytimePerUser30D")
                }
            },
            [a.RAQIV2Metric.Attribution30DRobuxPerUserMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.RevenuePerUser30D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.RevenuePerUser30D")
                }
            },
            [a.RAQIV2Metric.Attribution7DPayerConversionRatioMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.PayerConversion7D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.PayerConversion7D")
                }
            },
            [a.RAQIV2Metric.Attribution7DPlaytimePerUserInMinutesMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.PlaytimePerUser7D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.PlaytimePerUser7D")
                }
            },
            [a.RAQIV2Metric.Attribution7DRobuxPerUserMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.RevenuePerUser7D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.RevenuePerUser7D")
                }
            },
            [a.RAQIV2Metric.AttributionD1RetentionRatioMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.D1Retention", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.D1Retention")
                }
            },
            [a.RAQIV2Metric.AttributionD30RetentionRatioMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.D30Retention", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.D30Retention")
                }
            },
            [a.RAQIV2Metric.AttributionD7RetentionRatioMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.D7Retention", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.D7Retention")
                }
            },
            [a.RAQIV2Metric.UniqueUsersWithClicksMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.UsersWithDetailPageVisits", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.UsersWithDetailPageVisits")
                }
            },
            [a.RAQIV2Metric.ImpressionCVRMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.UsersImpressionCTR", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.UsersImpressionCTR")
                }
            },
            [a.RAQIV2Metric.ClickCVRMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.UsersDetailPageCTR", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.UsersDetailPageCTR")
                }
            },
            [a.RAQIV2Metric.DailyRevenue]: {
                defaultTotalSummaryTypes: [{
                    type: T.Average
                }, {
                    type: T.Total
                }],
                loggingMetricOverride: "Robux"
            },
            [a.RAQIV2Metric.L7AverageDailyRevenue]: {
                defaultTotalSummaryTypes: [{
                    type: T.Average
                }, {
                    type: T.Total
                }],
                loggingMetricOverride: "Robux"
            },
            [a.RAQIV2Metric.ItemMonetizationRevenue]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.ItemMonetizationSales]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.AverageSessionLengthMinutes]: {
                loggingMetricOverride: "AveragePlayTime"
            },
            [a.RAQIV2Metric.AveragePlayTimeMinutesPerDAU]: {
                loggingMetricOverride: "AveragePlayTime"
            },
            [a.RAQIV2Metric.ThumbnailImpressions]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.ThumbnailQualifiedPlays]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.TotalSessionsEndedInBucket]: {
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
                        intersect: [a.RAQIV2Dimension.SessionTimeBucket]
                    },
                    granularity: {
                        override: a.RAQIV2MetricGranularity.None
                    }
                },
                totalSeriesNameOverride: (0, r.translationKey)("Label.PlayersPercentage", u.TranslationNamespace.Analytics)
            },
            [a.RAQIV2UIMetric.ClientMemoryUsage]: {
                dataPointTransformerType: f.ScaleBackBy1000000000
            },
            [a.RAQIV2UIMetric.SessionDurationSeconds]: {
                dataPointTransformerType: f.ScaleBackBy60
            },
            [a.RAQIV2UIMetric.ServerMemoryUsage]: {
                dataPointTransformerType: f.ScaleBackBy1000000000
            },
            [a.RAQIV2UIMetric.ServerCpuTime]: {
                exploreModeChartType: o.ChartType.Area
            },
            [a.RAQIV2UIMetric.ServerMemoryUsageV2]: {
                exploreModeChartType: o.ChartType.Area
            },
            [a.RAQIV2Metric.ClientCpuTimeAvg]: {
                exploreModeChartType: o.ChartType.Area
            },
            [a.RAQIV2UIMetric.ServerMemoryUsageByServerAge]: {
                exploreModeChartType: o.ChartType.DurationArea,
                exploreModeSpecOverride: {
                    granularity: {
                        override: a.RAQIV2MetricGranularity.None
                    },
                    breakdown: {
                        intersect: [a.RAQIV2Dimension.ServerAgeBucket]
                    }
                }
            },
            [a.RAQIV2Metric.ItemAvatar3dLimitedAvailableQuantity]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.ItemAvatar3dLimitedTotalQuantity]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.ItemLifetimeCreatorEarning]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.ItemLifetimeRebateAmount]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.ItemLifetimeRobuxSpent]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.ItemLifetimeTransactionCount]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.ItemLimitedSoldPercentage]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.ItemPublishAdvance]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.ItemTotalCreatorEarning]: {
                defaultTotalSummaryTypes: M,
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Revenue", u.TranslationNamespace.AvatarAnalytics)
                }
            },
            [a.RAQIV2Metric.ItemTotalRobuxSpent]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.ItemTotalTransactionCount]: {
                defaultTotalSummaryTypes: M,
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.ItemTotalTransactionCount", u.TranslationNamespace.Analytics)
                }
            },
            [a.RAQIV2Metric.StoreTransactions]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.StoreRevenue]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.ShareLinkAttribution1DPayerConversionRatio]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.ShareLinkAttribution1DPlaytimePerUserInMinutes]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.ShareLinkAttribution1DRobuxPerUser]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.ShareLinkAttribution30DPayerConversionRatio]: {
                defaultTotalSummaryTypes: M,
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.PayerConversion30D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.PayerConversion30D")
                }
            },
            [a.RAQIV2Metric.ShareLinkAttribution30DPlaytimePerUserInMinutes]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.ShareLinkAttribution30DRobuxPerUser]: {
                defaultTotalSummaryTypes: M,
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.RevenuePerUser30D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.RevenuePerUser30D")
                }
            },
            [a.RAQIV2Metric.ShareLinkAttribution7DPayerConversionRatio]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.ShareLinkAttribution7DPlaytimePerUserInMinutes]: {
                defaultTotalSummaryTypes: M,
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.PlaytimePerUser7D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.PlaytimePerUser7D")
                }
            },
            [a.RAQIV2Metric.ShareLinkAttribution7DRobuxPerUser]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.ShareLinkAttributionD1RetentionRatio]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.ShareLinkAttributionD30RetentionRatio]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.ShareLinkAttributionD7RetentionRatio]: {
                defaultTotalSummaryTypes: M,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.D7Retention")
                }
            },
            [a.RAQIV2Metric.ShareLinkQualifiedClickCVR]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.UsersDetailPageCTR")
                }
            },
            [a.RAQIV2Metric.ShareLinkQualifiedUniqueUsersWithPlaySessions]: {
                defaultTotalSummaryTypes: M,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.QualifiedUsersWithPlays")
                }
            },
            [a.RAQIV2Metric.ShareLinkUniqueUsersWithClicks]: {
                defaultTotalSummaryTypes: M,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.UsersWithDetailPageVisits")
                }
            },
            [a.RAQIV2Metric.ShareLinkUniqueUsersWithPlaySessions]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.AffiliateLinkDailyAverageRobuxBookingsPerReactivationSpender]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.AverageRobuxBookingsPerReactivationSpenderV3", u.TranslationNamespace.Analytics),
                    titleKey: (0, r.translationKey)("Label.Metric.AverageRobuxBookingsPerReactivationSpenderV3", u.TranslationNamespace.Analytics)
                }
            },
            [a.RAQIV2Metric.AffiliateLinkDailyAffiliateActiveSpenderReactivationsPayoutRobux]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.LifetimeEstimatedAffiliateActiveSpenderReactivationsPayoutRobuxV3", u.TranslationNamespace.Analytics),
                    titleKey: (0, r.translationKey)("Label.Metric.LifetimeEstimatedAffiliateActiveSpenderReactivationsPayoutRobuxV3", u.TranslationNamespace.Analytics)
                }
            },
            [a.RAQIV2Metric.AffiliateLinkDailyQualifiedActiveSpenderReactivations]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.LifetimeQualifiedActiveSpenderReactivationsV3", u.TranslationNamespace.Analytics),
                    titleKey: (0, r.translationKey)("Label.Metric.LifetimeQualifiedActiveSpenderReactivationsV3", u.TranslationNamespace.Analytics)
                }
            },
            [a.RAQIV2Metric.AffiliateLinkDailyQualifiedReactivationsSpenders]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.LifetimeQualifiedReactivationsSpendersV3", u.TranslationNamespace.Analytics),
                    titleKey: (0, r.translationKey)("Label.Metric.LifetimeQualifiedReactivationsSpendersV3", u.TranslationNamespace.Analytics)
                }
            },
            [a.RAQIV2Metric.AffiliateLinkDailyAffiliateReactivationsPayoutRobux]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.LifetimeEstimatedAffiliateReactivationsPayoutRobuxV3", u.TranslationNamespace.Analytics),
                    titleKey: (0, r.translationKey)("Label.Metric.LifetimeEstimatedAffiliateReactivationsPayoutRobuxV3", u.TranslationNamespace.Analytics)
                }
            },
            [a.RAQIV2Metric.AffiliateLinkDailyQualifiedSignupSpenders]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.LifetimeQualifiedSignupSpendersV3", u.TranslationNamespace.Analytics),
                    titleKey: (0, r.translationKey)("Label.Metric.LifetimeQualifiedSignupSpendersV3", u.TranslationNamespace.Analytics)
                }
            },
            [a.RAQIV2Metric.AffiliateLinkDailyAverageRobuxBookingsPerSignupSpender]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.AverageRobuxBookingsPerSignupSpenderV3", u.TranslationNamespace.Analytics),
                    titleKey: (0, r.translationKey)("Label.Metric.AverageRobuxBookingsPerSignupSpenderV3", u.TranslationNamespace.Analytics)
                }
            },
            [a.RAQIV2Metric.AffiliateLinkDailyAffiliateSignupsPayoutRobux]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.LifetimeEstimatedAffiliateSignupsPayoutRobuxV3", u.TranslationNamespace.Analytics),
                    titleKey: (0, r.translationKey)("Label.Metric.LifetimeEstimatedAffiliateSignupsPayoutRobuxV3", u.TranslationNamespace.Analytics)
                }
            },
            [a.RAQIV2Metric.AffiliateLinkDailyBookingsPerSpenderCombined]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.BookingsPerSpenderCombinedV3", u.TranslationNamespace.Analytics),
                    titleKey: (0, r.translationKey)("Label.Metric.BookingsPerSpenderCombinedV3", u.TranslationNamespace.Analytics)
                }
            },
            [a.RAQIV2Metric.AffiliateLinkDailyVisits]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.Metric.AffiliateLinkDailyVisits", u.TranslationNamespace.Analytics)
                }
            },
            [a.RAQIV2Metric.AffiliateLinkDailyQualifiedSignups]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.LifetimeQualifiedSignupsV3", u.TranslationNamespace.Analytics)
                }
            },
            [a.RAQIV2Metric.AffiliateLinkDailyQualifiedReactivations]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.LifetimeQualifiedReactivationsV3", u.TranslationNamespace.Analytics)
                }
            },
            [a.RAQIV2Metric.AffiliateLinkDailyTotalPayoutRobux]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.LifetimeEstimatedAffiliateCombinedPayoutRobuxV3", u.TranslationNamespace.Analytics),
                    titleKey: (0, r.translationKey)("Label.Metric.LifetimeEstimatedAffiliateCombinedPayoutRobuxV3", u.TranslationNamespace.Analytics)
                }
            },
            [a.RAQIV2Metric.CreatorRewardsAudienceExpansionFunnelSignups]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.Metric.AESignups", u.TranslationNamespace.Analytics)
                }
            },
            [a.RAQIV2Metric.CreatorRewardsAudienceExpansionFunnelReactivations]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.LifetimeQualifiedReactivationsV3", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKey)("Description.Metric.AEReactivations", u.TranslationNamespace.Analytics)
                }
            },
            [a.RAQIV2Metric.CreatorRewardsAudienceExpansionFunnelPercentOfNewUsers]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.AEAudienceExpansionPercentage", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKey)("Description.Metric.AEAudienceExpansionPercentage", u.TranslationNamespace.Analytics)
                }
            },
            [a.RAQIV2Metric.CreatorRewardsAudienceExpansionFunnelRetentionD1]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.AERetentionD1", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKey)("Description.Metric.AERetentionD1", u.TranslationNamespace.Analytics)
                }
            },
            [a.RAQIV2Metric.CreatorRewardsAudienceExpansionFunnelRetentionD7]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.AERetentionD7", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKey)("Description.Metric.AERetentionD7", u.TranslationNamespace.Analytics)
                }
            },
            [a.RAQIV2Metric.CreatorRewardsAudienceExpansionFunnelPayerConversion7D]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.AEPayerConversion7D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKey)("Description.Metric.AEPayerConversion7D", u.TranslationNamespace.Analytics)
                }
            },
            [a.RAQIV2Metric.CreatorRewardsAudienceExpansionFunnelRevenuePerPayer7D]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.AERevenuePerPayer7D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKey)("Description.Metric.AERevenuePerPayer7D", u.TranslationNamespace.Analytics)
                }
            },
            [a.RAQIV2Metric.CreatorRewardsAudienceExpansionFunnelRevenuePerUser7D]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.AERevenuePerUser7D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKey)("Description.Metric.AERevenuePerUser7D", u.TranslationNamespace.Analytics)
                }
            },
            [a.RAQIV2Metric.CreatorRewardsAudienceExpansionFunnelPayerConversion60D]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.AEPayerConversion60D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKey)("Label.Description.AEPayerConversion60D", u.TranslationNamespace.Analytics)
                }
            },
            [a.RAQIV2Metric.CreatorRewardsAudienceExpansionFunnelRevenuePerPayer60D]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.AERevenuePerPayer60D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKey)("Label.Description.AERevenuePerPayer60D", u.TranslationNamespace.Analytics)
                }
            },
            [a.RAQIV2Metric.CreatorRewardsAudienceExpansionFunnelRevenuePerUser60D]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.AERevenuePerUser60D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKey)("Label.Description.AERevenuePerUser60D", u.TranslationNamespace.Analytics)
                }
            },
            [a.RAQIV2Metric.CreatorRewardsAudienceExpansionFunnelEstimatedPayout]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.CreatorRewardsLifetimeEstimatedAffiliatePayoutRobux", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKey)("Label.Description.AERevenuePerPayer60D", u.TranslationNamespace.Analytics)
                }
            },
            [a.RAQIV2Metric.FriendReferralAverageRobuxBookingsPerSpender]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.FriendReferralLifetimeEstimatedAffiliatePayoutRobux]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.FriendReferralLifetimeQualifiedSignups]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.FriendReferralLifetimeQualifiedSpenders]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.FriendReferralLifetimeVisits]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.PlayerFeedbackVotesCount]: {
                defaultTotalSummaryTypes: [],
                exploreModeChartType: o.ChartType.Column
            },
            [a.RAQIV2UIMetric.MatchmakingCategoricalCustomSignalsSimilarityRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.MatchmakingCategoricalCustomSignalsSimilarityRatio", u.TranslationNamespace.Matchmaking),
                    tooltipKey: (0, r.translationKey)("Description.MatchmakingCategoricalCustomSignalsSimilarityRatio", u.TranslationNamespace.Matchmaking)
                }
            },
            [a.RAQIV2UIMetric.MatchmakingNumericCustomSignalsDifference]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.MatchmakingNumericCustomSignalsDifference", u.TranslationNamespace.Matchmaking),
                    tooltipKey: (0, r.translationKey)("Description.MatchmakingNumericCustomSignalsDifference", u.TranslationNamespace.Matchmaking)
                }
            },
            [a.RAQIV2Metric.MatchmakingPlayerAttributesLoadingStatusAvg]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.MatchmakingPlayerAttributesLoadingStatusAvg", u.TranslationNamespace.Matchmaking),
                    tooltipKey: (0, r.translationKey)("Description.MatchmakingPlayerAttributesLoadingStatusAvg", u.TranslationNamespace.Matchmaking)
                }
            },
            [a.RAQIV2UIMetric.MatchmakingSignalsAgeDifference]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.MatchmakingSignalsAgeDifference", u.TranslationNamespace.Matchmaking),
                    tooltipKey: (0, r.translationKey)("Description.MatchmakingSignalsAgeDifference", u.TranslationNamespace.Matchmaking)
                }
            },
            [a.RAQIV2UIMetric.MatchmakingSignalsCommonChatGroupRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.MatchmakingSignalsCommonChatGroupRatio", u.TranslationNamespace.Matchmaking),
                    tooltipKey: (0, r.translationKey)("Description.MatchmakingSignalsCommonChatGroupRatio", u.TranslationNamespace.Matchmaking)
                }
            },
            [a.RAQIV2UIMetric.MatchmakingSignalsCommonDeviceTypeRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.MatchmakingSignalsCommonDeviceTypeRatio", u.TranslationNamespace.Matchmaking),
                    tooltipKey: (0, r.translationKey)("Description.MatchmakingSignalsCommonDeviceTypeRatio", u.TranslationNamespace.Matchmaking)
                }
            },
            [a.RAQIV2UIMetric.MatchmakingSignalsCommonLanguageRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.MatchmakingSignalsCommonLanguageRatio", u.TranslationNamespace.Matchmaking),
                    tooltipKey: (0, r.translationKey)("Description.MatchmakingSignalsCommonLanguageRatio", u.TranslationNamespace.Matchmaking)
                }
            },
            [a.RAQIV2UIMetric.MatchmakingSignalsDeltaPing]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.MatchmakingSignalsDeltaPing", u.TranslationNamespace.Matchmaking),
                    tooltipKey: (0, r.translationKey)("Description.MatchmakingSignalsDeltaPing", u.TranslationNamespace.Matchmaking)
                }
            },
            [a.RAQIV2UIMetric.MatchmakingSignalsEstimatePing]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.MatchmakingSignalsEstimatedPing", u.TranslationNamespace.Matchmaking),
                    tooltipKey: (0, r.translationKey)("Description.MatchmakingSignalsEstimatedPing", u.TranslationNamespace.Matchmaking)
                }
            },
            [a.RAQIV2UIMetric.MatchmakingSignalsOccupancyRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.MatchmakingSignalsOccupancyRatio", u.TranslationNamespace.Matchmaking),
                    tooltipKey: (0, r.translationKey)("Description.MatchmakingSignalsOccupancyRatio", u.TranslationNamespace.Matchmaking)
                }
            },
            [a.RAQIV2UIMetric.MatchmakingSignalsPlayHistoryDifference]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.MatchmakingSignalsPlayHistoryDifference", u.TranslationNamespace.Matchmaking),
                    tooltipKey: (0, r.translationKey)("Description.MatchmakingSignalsPlayHistoryDifference", u.TranslationNamespace.Matchmaking)
                }
            },
            [a.RAQIV2Metric.MatchmakingSignalsPreferredPlayerMatchRatioAvg]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.MatchmakingSignalsFriendsMatchRatioAvg", u.TranslationNamespace.Matchmaking),
                    tooltipKey: (0, r.translationKey)("Description.MatchmakingSignalsFriendsMatchRatioAvg", u.TranslationNamespace.Matchmaking)
                }
            },
            [a.RAQIV2UIMetric.MatchmakingSignalsVoiceChatRatio]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Metric.MatchmakingSignalsVoiceChatRatio", u.TranslationNamespace.Matchmaking),
                    tooltipKey: (0, r.translationKey)("Description.MatchmakingSignalsVoiceChatRatio", u.TranslationNamespace.Matchmaking)
                }
            },
            [a.RAQIV2Metric.DataStoreListRequests]: {
                defaultTotalSummaryTypes: [{
                    type: T.Average
                }],
                exploreModeChartType: o.ChartType.Spline
            },
            [a.RAQIV2Metric.DataStoreReadRequestsQuotaStandard]: {
                defaultTotalSummaryTypes: []
            },
            [a.RAQIV2Metric.DataStoreWriteRequestsQuotaOrdered]: {
                defaultTotalSummaryTypes: []
            },
            [a.RAQIV2Metric.DataStoreStorageQuotaBytes]: {
                defaultTotalSummaryTypes: []
            },
            [a.RAQIV2Metric.DataStoreStorageUsageBytes]: {
                defaultTotalSummaryTypes: [],
                exploreModeChartType: o.ChartType.Spline
            },
            [a.RAQIV2Metric.DataStoreWriteRequests]: {
                defaultTotalSummaryTypes: [{
                    type: T.Average
                }],
                exploreModeChartType: o.ChartType.Spline
            },
            [a.RAQIV2Metric.DataStoreRequestsByStatus]: {
                exploreModeChartType: o.ChartType.Spline
            },
            [a.RAQIV2Metric.DataStoreRequestsByEndpoint]: {
                exploreModeChartType: o.ChartType.Spline
            },
            [a.RAQIV2Metric.DataStoreRemoveRequests]: {
                defaultTotalSummaryTypes: [{
                    type: T.Average
                }],
                exploreModeChartType: o.ChartType.Spline
            },
            [a.RAQIV2Metric.DataStoreRemoveRequestsQuotaStandard]: {
                defaultTotalSummaryTypes: []
            },
            [a.RAQIV2Metric.DataStoreRemoveRequestsQuotaOrdered]: {
                defaultTotalSummaryTypes: []
            },
            [a.RAQIV2Metric.DataStoreReadRequestsQuotaOrdered]: {
                defaultTotalSummaryTypes: []
            },
            [a.RAQIV2Metric.DataStoreWriteRequestsQuotaStandard]: {
                defaultTotalSummaryTypes: []
            },
            [a.RAQIV2Metric.DataStoreListRequestsQuotaStandard]: {
                defaultTotalSummaryTypes: []
            },
            [a.RAQIV2Metric.DataStoreListRequestsQuotaOrdered]: {
                defaultTotalSummaryTypes: []
            },
            [a.RAQIV2Metric.DataStoreListRequestsQuota]: {
                defaultTotalSummaryTypes: []
            },
            [a.RAQIV2Metric.DataStoreReadRequests]: {
                exploreModeChartType: o.ChartType.Spline,
                defaultTotalSummaryTypes: [{
                    type: T.Average
                }]
            },
            [a.RAQIV2Metric.DataStoreConsumedReadRequests]: {
                defaultTotalSummaryTypes: [{
                    type: T.QuotaPercentageUsage
                }],
                exploreModeChartType: o.ChartType.Spline
            },
            [a.RAQIV2Metric.DataStoreConsumedWriteRequests]: {
                defaultTotalSummaryTypes: [{
                    type: T.QuotaPercentageUsage
                }],
                exploreModeChartType: o.ChartType.Spline
            },
            [a.RAQIV2Metric.DataStoreConsumedListRequests]: {
                defaultTotalSummaryTypes: [{
                    type: T.QuotaPercentageUsage
                }],
                exploreModeChartType: o.ChartType.Spline
            },
            [a.RAQIV2Metric.DataStoreConsumedRemoveRequests]: {
                defaultTotalSummaryTypes: [{
                    type: T.QuotaPercentageUsage
                }],
                exploreModeChartType: o.ChartType.Spline
            },
            [a.RAQIV2Metric.CommerceGMV]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.CommerceQuantitySold]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.CommerceClicks]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.CommerceImpressions]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.CommerceOrders]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.CommerceCheckouts]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.CommerceUniqueClicks]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.CommerceUniqueImpressions]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.CommerceUniqueCheckouts]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.CommerceUniqueOrders]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.AdsPublisherReportingTotalRevenueRobux]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.AdsPublisherReportingTotalImpressions]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.AdsPublisherReportingVideo2DRevenueRobux]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.AdsPublisherReportingVideo2DImpressions]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.AdsPublisherReportingVideo2DDailyUniqueViewer]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.CommunityGroupPageViews]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.CommunityGroupPageUniqueVisitors]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.CommunityMembershipChangeEvents]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.CommunityForumContentEventCount]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.CommunityForumContentUniqueUsers]: {
                defaultTotalSummaryTypes: M
            },
            [a.RAQIV2Metric.CommunityMembershipCount]: {
                defaultTotalSummaryTypes: S
            },
            [a.RAQIV2Metric.VideoServiceExclusivePlaybackSeconds]: {
                defaultTotalSummaryTypes: M,
                dataPointTransformerType: f.ScaleBackBy3600
            }
        },
        P = {
            [a.RAQIV2Metric.ThumbnailWinningSegments]: {
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
            let t = a.RAQIV2MetricDisplayConfig[e],
                i = t.valueType === a.RAQIV2MetricValueType.Numeric ? C[e] : P[e],
                n = {
                    ...A,
                    ...t,
                    ...i
                },
                r = I[e];
            return null != r && (n.unit = r.unit, n.decimalPrecision = r.decimalPrecision), n
        };
    e.s(["RAQIV2MetricValueRendererType", () => D, "default", 0, b, "getPreferredChartType", 0, e => {
        var t;
        return e && null != (t = b(e).exploreModeChartType) ? t : o.ChartType.Spline
    }, "isNumericUIMetric", 0, e => {
        var t;
        return h(e) && (null == (t = a.RAQIV2MetricDisplayConfig[e]) ? void 0 : t.valueType) === a.RAQIV2MetricValueType.Numeric
    }, "isRAQIV2UIMetric", 0, h], 908374)
}, 11517, e => {
    "use strict";
    var t = e.i(31611),
        i = e.i(908374);
    let n = e => "string" == typeof e && e.trim().length > 0,
        a = e => !!e && "object" == typeof e && e.metric === t.RAQIV2UIMetric.CustomEventsV2 && n(e.customEventName) && (void 0 === e.aggregationType || Object.values(t.RAQIV2AggregationType).includes(e.aggregationType)),
        r = e => a(e) ? e.metric : e,
        o = e => {
            var t;
            let r;
            return !!e && "object" == typeof e && n(e.key) && (n(r = t = e.metric) && (0, i.isNumericUIMetric)(r) || a(t))
        },
        s = e => !!e && "object" == typeof e && "sources" in e && !!Array.isArray(e.sources) && 0 !== e.sources.length && !!n(e.formula) && e.sources.every(o),
        l = e => {
            if (!s(e)) return [r(e)];
            let t = new Set;
            return e.sources.forEach(e => {
                t.add(r(e.metric))
            }), Array.from(t)
        },
        u = e => {
            var i;
            if (!a(e)) return e;
            let n = null != (i = e.aggregationType) ? i : t.RAQIV2AggregationType.Sum;
            return "".concat(e.metric, ":").concat(e.customEventName, ":").concat(n)
        },
        c = e => {
            if (!s(e)) return r(e);
            let t = [...new Set(l(e))].sort();
            return "ACEComputed:".concat(t.join("|"))
        };
    e.s(["getAtomicMetricsFromMetricLike", 0, l, "getMetricCacheKeyFromMetricLike", 0, e => s(e) ? "ACEComputed:".concat((e => {
        if (!s(e)) return [e];
        let t = new Set,
            i = [];
        return e.sources.forEach(e => {
            let n = u(e.metric);
            t.has(n) || (t.add(n), i.push(e.metric))
        }), i
    })(e).map(e => u(e)).sort().join("|")) : u(e), "getTelemetryMetricNameFromMetricLike", 0, c, "getTelemetryMetricNameFromMetricLikes", 0, e => {
        let t = [...new Set(e.map(c))].sort().join("|");
        return "MetricSet:".concat(t)
    }, "getUIMetricFromAtomicMetricLike", 0, r, "getUIMetricsFromMetricLike", 0, l, "isComputedMetric", 0, s, "isCustomEventsAtomicMetricLike", 0, a])
}, 405005, e => {
    "use strict";
    var t = e.i(552140),
        i = e.i(31611);
    let n = {
            percentile: i.RAQIV2UIPseudoDimension.PercentileType,
            aggregation: i.RAQIV2UIPseudoDimension.AggregationType
        },
        a = i.RAQIV2PercentileType.AVG,
        r = e => (null == e ? void 0 : e.mode) === "fanout",
        o = e => n[e],
        s = (e, t) => {
            let n = t.replaceAll(/([a-z0-9])([A-Z])/g, "$1_$2").replaceAll(/[^A-Za-z0-9]+/g, "_").toUpperCase().replaceAll(/^_+|_+$/g, "");
            if (n === a || "AVERAGE" === n) return "AVERAGE";
            if (e === i.RAQIV2UIPseudoDimension.PercentileType) {
                let e = /^P?(\d+)$/.exec(n);
                if (e) return "P".concat(e[1])
            }
            return n
        },
        l = e => e === i.RAQIV2UIPseudoDimension.PercentileType ? t.VariantKind.Percentile : e === i.RAQIV2UIPseudoDimension.AggregationType ? t.VariantKind.Aggregation : null,
        u = (e, t) => {
            let n = [],
                a = [];
            if (null == t || t.forEach(e => {
                    let t = e === i.RAQIV2UIPseudoDimension.PercentileType ? "percentile" : e === i.RAQIV2UIPseudoDimension.AggregationType ? "aggregation" : void 0;
                    if (void 0 !== t) {
                        a.includes(t) || a.push(t);
                        return
                    }
                    n.push(e)
                }), r(e)) return {
                metricVariant: e,
                breakdown: n
            };
            let o = a[0];
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
                metricVariant: i
            } = u(e, t);
            return r(i)
        };
    e.s(["buildVariantBreakdownSpec", 0, e => {
        let t = l(e.dimension);
        if (null == t) throw Error("Unsupported metric variant breakdown ".concat(e.dimension));
        return {
            variant: {
                kind: t,
                keys: e.config.supportedDimensionValues.map(t => s(e.dimension, t))
            }
        }
    }, "deserializeMetricVariantFanout", 0, e => {
        let t = Array.isArray(e) ? e[0] : e;
        if ("percentile" === t || "aggregation" === t) return {
            mode: "fanout",
            kind: t
        }
    }, "getFanoutOwnedDimension", 0, e => r(e) ? o(e.kind) : void 0, "getMetricFanoutDimensionInfo", 0, e => {
        let t = o(e.kind),
            n = i.RAQIV2DimensionDisplayConfig[t].pseudoDimensionConfig;
        if (n.type === i.RAQIV2UIPseudoDimensionType.MetricFanout) return {
            dimension: t,
            config: n
        }
    }, "getStableVariantKey", 0, s, "getVariantKind", 0, l, "hasChartBreakdown", 0, (e, t) => {
        var i;
        return (null != (i = null == e ? void 0 : e.length) ? i : 0) > 0 || c(t, e)
    }, "hasMetricVariantFanout", 0, c, "isMetricVariantFanout", 0, r, "mergeMetricVariantIntoBreakdown", 0, (e, t) => {
        if (!r(t)) return [...e];
        let i = o(t.kind);
        return e.includes(i) ? [...e] : [...e, i]
    }, "metricVariantAllowedForFilterOnlyDimensions", 0, (e, t) => {
        if (!r(e)) return;
        let n = o(e.kind);
        return n === i.RAQIV2UIPseudoDimension.AggregationType ? e : t.includes(n) ? void 0 : e
    }, "serializeMetricVariantFanout", 0, e => r(e) ? e.kind : null, "splitMetricVariantFromBreakdown", 0, u, "supportedMetricVariantForDimensions", 0, (e, t) => {
        if (r(e)) return t.includes(o(e.kind)) ? e : void 0
    }])
}, 552140, e => {
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

    function n(e, t, i, n) {
        return new(i || (i = Promise))(function(a, r) {
            function o(e) {
                try {
                    l(n.next(e))
                } catch (e) {
                    r(e)
                }
            }

            function s(e) {
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
                })).then(o, s)
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
        return o.next = s(0), o.throw = s(1), o.return = s(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
            return this
        }), o;

        function s(s) {
            return function(l) {
                var u = [s, l];
                if (i) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, u[0] && (r = 0)), r;) try {
                    if (i = 1, n && (a = 2 & u[0] ? n.return : u[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, u[1])).done) return a;
                    switch (n = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                        case 0:
                        case 1:
                            a = u;
                            break;
                        case 4:
                            return r.label++, {
                                value: u[1],
                                done: !1
                            };
                        case 5:
                            r.label++, n = u[1], u = [0];
                            continue;
                        case 7:
                            u = r.ops.pop(), r.trys.pop();
                            continue;
                        default:
                            if (!(a = (a = r.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                r = 0;
                                continue
                            }
                            if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                r.label = u[1];
                                break
                            }
                            if (6 === u[0] && r.label < a[1]) {
                                r.label = a[1], a = u;
                                break
                            }
                            if (a && r.label < a[2]) {
                                r.label = a[2], r.ops.push(u);
                                break
                            }
                            a[2] && r.ops.pop(), r.trys.pop();
                            continue
                    }
                    u = t.call(e, r)
                } catch (e) {
                    u = [6, e], n = 0
                } finally {
                    i = a = 0
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
        var i;
        return null == (i = e) ? i : {
            key: (0, t.exists)(i, "key") ? i.key : void 0,
            targets: (0, t.exists)(i, "targets") ? i.targets : void 0,
            unixStartTime: (0, t.exists)(i, "unixStartTime") ? i.unixStartTime : void 0,
            links: (0, t.exists)(i, "links") ? i.links : void 0,
            dimensions: (0, t.exists)(i, "dimensions") ? i.dimensions : void 0
        }
    }

    function o(e) {
        var i;
        return null == (i = e) ? i : {
            key: (0, t.exists)(i, "key") ? i.key : void 0,
            targets: (0, t.exists)(i, "targets") ? i.targets : void 0,
            category: (0, t.exists)(i, "category") ? i.category : void 0
        }
    }

    function s(e) {
        if (void 0 !== e) return null === e ? null : {
            dimension: e.dimension,
            values: e.values,
            operation: e.operation
        }
    }

    function l(e) {
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
                            orderFilters: void 0 === e.orderFilters ? void 0 : e.orderFilters.map(s),
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

    function u(e) {
        var i;
        return null == (i = e) ? i : {
            dimension: (0, t.exists)(i, "dimension") ? i.dimension : void 0,
            value: (0, t.exists)(i, "value") ? i.value : void 0,
            displayValue: (0, t.exists)(i, "displayValue") ? i.displayValue : void 0,
            variantKey: (0, t.exists)(i, "variantKey") ? i.variantKey : void 0
        }
    }

    function c(e) {
        var i;
        return null == (i = e) ? i : {
            key: (0, t.exists)(i, "key") ? i.key : void 0,
            targets: (0, t.exists)(i, "targets") ? i.targets : void 0
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function d(e) {
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

    function p(e) {
        if (void 0 !== e) return null === e ? null : {
            resourceType: e.resourceType,
            resourceId: e.resourceId,
            granularity: e.granularity,
            startTime: e.startTime,
            endTime: e.endTime,
            traceId: e.traceId
        }
    }

    function y(e) {
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

    function T(e) {
        if (void 0 !== e) return null === e ? null : {
            dimensions: e.dimensions,
            function: e._function,
            functionParams: e.functionParams
        }
    }

    function v(e) {
        if (void 0 !== e) return null === e ? null : {
            id: e.id,
            type: e.type,
            queryConfig: function(e) {
                if (void 0 !== e) return null === e ? null : {
                    metric: e.metric,
                    resourceType: e.resourceType,
                    resourceId: e.resourceId,
                    granularity: e.granularity,
                    breakdown: void 0 === e.breakdown ? void 0 : e.breakdown.map(T),
                    filters: void 0 === e.filters ? void 0 : e.filters.map(s),
                    topN: function(e) {
                        if (void 0 !== e) return null === e ? null : {
                            n: e.n,
                            orderByMetric: e.orderByMetric,
                            orderFilters: void 0 === e.orderFilters ? void 0 : e.orderFilters.map(s),
                            excludeOtherSeries: e.excludeOtherSeries,
                            orderTimeRangeDays: e.orderTimeRangeDays,
                            otherLabel: e.otherLabel,
                            dimension: e.dimension,
                            excludedValues: e.excludedValues
                        }
                    }(e.topN),
                    pseudoDimensionValues: e.pseudoDimensionValues,
                    breakdownSpecs: void 0 === e.breakdownSpecs ? void 0 : e.breakdownSpecs.map(l),
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

    function f(e) {
        if (void 0 !== e) return null === e ? null : {
            id: e.id,
            name: e.name,
            nodes: void 0 === e.nodes ? void 0 : e.nodes.map(v)
        }
    }

    function g(e) {
        var i;
        return null == (i = e) ? i : {
            time: (0, t.exists)(i, "time") ? i.time : void 0,
            value: (0, t.exists)(i, "value") ? i.value : void 0,
            stringValues: (0, t.exists)(i, "stringValues") ? i.stringValues : void 0,
            status: (0, t.exists)(i, "status") ? i.status : void 0
        }
    }

    function R(e) {
        var i;
        return null == (i = e) ? i : {
            breakdownValue: (0, t.exists)(i, "breakdownValue") ? i.breakdownValue.map(u) : void 0,
            dataPoints: (0, t.exists)(i, "dataPoints") ? i.dataPoints.map(g) : void 0
        }
    }

    function A(e, i) {
        return null == e ? e : {
            values: (0, t.exists)(e, "values") ? e.values.map(R) : void 0
        }
    }

    function h(e) {
        var i;
        return null == (i = e) ? i : {
            nodeId: (0, t.exists)(i, "nodeId") ? i.nodeId : void 0,
            success: (0, t.exists)(i, "success") ? i.success : void 0,
            error: (0, t.exists)(i, "error") ? i.error : void 0,
            timeSeries: (0, t.exists)(i, "timeSeries") ? A(i.timeSeries) : void 0,
            scalarValue: (0, t.exists)(i, "scalarValue") ? i.scalarValue : void 0,
            executionTimeMs: (0, t.exists)(i, "executionTimeMs") ? i.executionTimeMs : void 0,
            errorCode: (0, t.exists)(i, "errorCode") ? i.errorCode : void 0,
            failedDueTo: (0, t.exists)(i, "failedDueTo") ? i.failedDueTo : void 0,
            skipped: (0, t.exists)(i, "skipped") ? i.skipped : void 0
        }
    }

    function I(e) {
        if (void 0 !== e) return null === e ? null : {
            namespace: e.namespace,
            name: e.name
        }
    }

    function D(e) {
        var i, n;
        return null == (i = e) ? i : {
            dimension: (0, t.exists)(i, "dimension") ? null == (n = i.dimension) ? n : {
                namespace: (0, t.exists)(n, "namespace") ? n.namespace : void 0,
                name: (0, t.exists)(n, "name") ? n.name : void 0
            } : void 0,
            values: (0, t.exists)(i, "values") ? i.values.map(u) : void 0
        }
    }

    function M(e) {
        var i;
        return null == (i = e) ? i : {
            metric: (0, t.exists)(i, "metric") ? i.metric : void 0,
            latestAvailableTime: (0, t.exists)(i, "latestAvailableTime") ? i.latestAvailableTime : void 0
        }
    }

    function S(e, i) {
        var n, a, r, o, s;
        return null == e ? e : {
            path: (0, t.exists)(e, "path") ? e.path : void 0,
            metadata: (0, t.exists)(e, "metadata") ? null == (n = e.metadata) ? n : {
                createdTime: (0, t.exists)(n, "createdTime") ? n.createdTime : void 0
            } : void 0,
            done: (0, t.exists)(e, "done") ? e.done : void 0,
            error: (0, t.exists)(e, "error") ? null == (a = e.error) ? a : {
                code: (0, t.exists)(a, "code") ? a.code : void 0,
                message: (0, t.exists)(a, "message") ? a.message : void 0,
                validationDetails: (0, t.exists)(a, "validationDetails") ? null == (r = a.validationDetails) ? r : {
                    field: (0, t.exists)(r, "field") ? r.field : void 0,
                    subject: (0, t.exists)(r, "subject") ? r.subject : void 0,
                    rejectedValues: (0, t.exists)(r, "rejectedValues") ? r.rejectedValues : void 0
                } : void 0
            } : void 0,
            queryResult: (0, t.exists)(e, "queryResult") ? A(e.queryResult) : void 0,
            dimensionValuesResult: (0, t.exists)(e, "dimensionValuesResult") ? null == (o = e.dimensionValuesResult) ? o : {
                values: (0, t.exists)(o, "values") ? o.values.map(D) : void 0
            } : void 0,
            metricMetadataResult: (0, t.exists)(e, "metricMetadataResult") ? null == (s = e.metricMetadataResult) ? s : {
                metadata: (0, t.exists)(s, "metadata") ? s.metadata.map(M) : void 0
            } : void 0
        }
    }
    var C = function(e) {
        function l() {
            return null !== e && e.apply(this, arguments) || this
        }
        return function(e, t) {
            if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

            function n() {
                this.constructor = e
            }
            i(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
        }(l, e), l.prototype.v1DagExecutePostRaw = function(e, i) {
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
                                        graph: f(e.graph),
                                        context: p(e.context),
                                        includeDebug: e.includeDebug
                                    }
                                }(e.executeDagRequest)
                            }, i)];
                        case 1:
                            return o = a.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                var i, n, a;
                                return null == e ? e : {
                                    result: (0, t.exists)(e, "result") ? null == (i = e.result) ? i : {
                                        success: (0, t.exists)(i, "success") ? i.success : void 0,
                                        outputs: (0, t.exists)(i, "outputs") ? i.outputs.map(h) : void 0,
                                        metadata: (0, t.exists)(i, "metadata") ? null == (n = i.metadata) ? n : {
                                            totalExecutionTimeMs: (0, t.exists)(n, "totalExecutionTimeMs") ? n.totalExecutionTimeMs : void 0,
                                            traceId: (0, t.exists)(n, "traceId") ? n.traceId : void 0,
                                            totalNodes: (0, t.exists)(n, "totalNodes") ? n.totalNodes : void 0,
                                            complexity: (0, t.exists)(n, "complexity") ? null == (a = n.complexity) ? a : {
                                                queryCount: (0, t.exists)(a, "queryCount") ? a.queryCount : void 0,
                                                transformCount: (0, t.exists)(a, "transformCount") ? a.transformCount : void 0,
                                                aggregationCount: (0, t.exists)(a, "aggregationCount") ? a.aggregationCount : void 0,
                                                maxDepth: (0, t.exists)(a, "maxDepth") ? a.maxDepth : void 0,
                                                estimatedCost: (0, t.exists)(a, "estimatedCost") ? a.estimatedCost : void 0,
                                                maxFanOut: (0, t.exists)(a, "maxFanOut") ? a.maxFanOut : void 0,
                                                rootCount: (0, t.exists)(a, "rootCount") ? a.rootCount : void 0
                                            } : void 0,
                                            nodeTimings: (0, t.exists)(n, "nodeTimings") ? n.nodeTimings.map(y) : void 0
                                        } : void 0,
                                        errors: (0, t.exists)(i, "errors") ? i.errors.map(d) : void 0,
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
        }, l.prototype.v1DagExecutePost = function() {
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
        }, l.prototype.v1DagValidatePostRaw = function(e, i) {
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
                                        graph: f(e.graph),
                                        context: p(e.context)
                                    }
                                }(e.validateDagRequest)
                            }, i)];
                        case 1:
                            return o = a.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    isValid: (0, t.exists)(e, "isValid") ? e.isValid : void 0,
                                    errors: (0, t.exists)(e, "errors") ? e.errors.map(d) : void 0,
                                    warnings: (0, t.exists)(e, "warnings") ? e.warnings : void 0
                                }
                            })]
                    }
                })
            })
        }, l.prototype.v1DagValidatePost = function() {
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
        }, l.prototype.v1DimensionsResourceResourceTypeIdResourceIdPostRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var n, r, o;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.resourceType || void 0 === e.resourceType) throw new t.RequiredError("resourceType", "Required parameter requestParameters.resourceType was null or undefined when calling v1DimensionsResourceResourceTypeIdResourceIdPost.");
                            if (null === e.resourceId || void 0 === e.resourceId) throw new t.RequiredError("resourceId", "Required parameter requestParameters.resourceId was null or undefined when calling v1DimensionsResourceResourceTypeIdResourceIdPost.");
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
                                                dimensions: void 0 === e.dimensions ? void 0 : e.dimensions.map(I),
                                                startTime: e.startTime,
                                                endTime: e.endTime,
                                                limit: e.limit,
                                                filters: void 0 === e.filters ? void 0 : e.filters.map(s),
                                                granularity: e.granularity
                                            }
                                        }(e.query)
                                    }
                                }(e.dimensionValuesRequest)
                            }, i)];
                        case 1:
                            return o = a.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    operation: (0, t.exists)(e, "operation") ? S(e.operation) : void 0
                                }
                            })]
                    }
                })
            })
        }, l.prototype.v1DimensionsResourceResourceTypeIdResourceIdPost = function(e, t) {
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
        }, l.prototype.v1MetricsMetadataPostRaw = function(e, i) {
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
                                }(e.metricMetadataRequest)
                            }, i)];
                        case 1:
                            return o = a.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    operation: (0, t.exists)(e, "operation") ? S(e.operation) : void 0
                                }
                            })]
                    }
                })
            })
        }, l.prototype.v1MetricsMetadataPost = function() {
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
        }, l.prototype.v1MetricsResourceResourceTypeIdResourceIdPostRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var n, r, o;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.resourceType || void 0 === e.resourceType) throw new t.RequiredError("resourceType", "Required parameter requestParameters.resourceType was null or undefined when calling v1MetricsResourceResourceTypeIdResourceIdPost.");
                            if (null === e.resourceId || void 0 === e.resourceId) throw new t.RequiredError("resourceId", "Required parameter requestParameters.resourceId was null or undefined when calling v1MetricsResourceResourceTypeIdResourceIdPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/metrics/resource/{resourceType}/id/{resourceId}".replace("{".concat("resourceType", "}"), encodeURIComponent(String(e.resourceType))).replace("{".concat("resourceId", "}"), encodeURIComponent(String(e.resourceId))),
                                schemaPath: "/v1/metrics/resource/{resourceType}/id/{resourceId}",
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
                                                metric: e.metric,
                                                granularity: e.granularity,
                                                breakdown: void 0 === e.breakdown ? void 0 : e.breakdown.map(T),
                                                filter: void 0 === e.filter ? void 0 : e.filter.map(s),
                                                startTime: e.startTime,
                                                endTime: e.endTime,
                                                limit: e.limit
                                            }
                                        }(e.query)
                                    }
                                }(e.queryRequest)
                            }, i)];
                        case 1:
                            return o = a.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    operation: (0, t.exists)(e, "operation") ? S(e.operation) : void 0
                                }
                            })]
                    }
                })
            })
        }, l.prototype.v1MetricsResourceResourceTypeIdResourceIdPost = function(e, t) {
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
        }, l.prototype.v1OperationsOperationIdGetRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var n, r, o;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.operationId || void 0 === e.operationId) throw new t.RequiredError("operationId", "Required parameter requestParameters.operationId was null or undefined when calling v1OperationsOperationIdGet.");
                            return n = {}, void 0 !== e.resourceType && (n.resourceType = e.resourceType), void 0 !== e.resourceId && (n.resourceId = e.resourceId), r = {}, [4, this.request({
                                path: "/v1/operations/{operationId}".replace("{".concat("operationId", "}"), encodeURIComponent(String(e.operationId))),
                                schemaPath: "/v1/operations/{operationId}",
                                method: "GET",
                                headers: r,
                                query: n
                            }, i)];
                        case 1:
                            return o = a.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    operation: (0, t.exists)(e, "operation") ? S(e.operation) : void 0
                                }
                            })]
                    }
                })
            })
        }, l.prototype.v1OperationsOperationIdGet = function(e, t) {
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
        }, l.prototype.v1StatusConfigGetRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var n, s, l;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return n = {}, void 0 !== e.universeId && (n.universeId = e.universeId), s = {}, [4, this.request({
                                path: "/v1/status-config",
                                schemaPath: "/v1/status-config",
                                method: "GET",
                                headers: s,
                                query: n
                            }, i)];
                        case 1:
                            return l = a.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return null == e ? e : {
                                    bannerConfigurations: (0, t.exists)(e, "bannerConfigurations") ? e.bannerConfigurations.map(o) : void 0,
                                    annotationConfigurations: (0, t.exists)(e, "annotationConfigurations") ? e.annotationConfigurations.map(r) : void 0,
                                    chartWarningConfigurations: (0, t.exists)(e, "chartWarningConfigurations") ? e.chartWarningConfigurations.map(c) : void 0
                                }
                            })]
                    }
                })
            })
        }, l.prototype.v1StatusConfigGet = function() {
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
        }, l
    }(t.BaseAPI);
    e.s(["AnalyticsQueryGatewayAPIApi", 0, C, "DataStatus", 0, {
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
}, 846854, e => {
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

    function n(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function n() {
            this.constructor = e
        }
        i(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
    }

    function a(e, t, i, n) {
        return new(i || (i = Promise))(function(a, r) {
            function o(e) {
                try {
                    l(n.next(e))
                } catch (e) {
                    r(e)
                }
            }

            function s(e) {
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
                })).then(o, s)
            }
            l((n = n.apply(e, t || [])).next())
        })
    }

    function r(e, t) {
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
        return o.next = s(0), o.throw = s(1), o.return = s(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
            return this
        }), o;

        function s(s) {
            return function(l) {
                var u = [s, l];
                if (i) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, u[0] && (r = 0)), r;) try {
                    if (i = 1, n && (a = 2 & u[0] ? n.return : u[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, u[1])).done) return a;
                    switch (n = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                        case 0:
                        case 1:
                            a = u;
                            break;
                        case 4:
                            return r.label++, {
                                value: u[1],
                                done: !1
                            };
                        case 5:
                            r.label++, n = u[1], u = [0];
                            continue;
                        case 7:
                            u = r.ops.pop(), r.trys.pop();
                            continue;
                        default:
                            if (!(a = (a = r.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                r = 0;
                                continue
                            }
                            if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                r.label = u[1];
                                break
                            }
                            if (6 === u[0] && r.label < a[1]) {
                                r.label = a[1], a = u;
                                break
                            }
                            if (a && r.label < a[2]) {
                                r.label = a[2], r.ops.push(u);
                                break
                            }
                            a[2] && r.ops.pop(), r.trys.pop();
                            continue
                    }
                    u = t.call(e, r)
                } catch (e) {
                    u = [6, e], n = 0
                } finally {
                    i = a = 0
                }
                if (5 & u[0]) throw u[1];
                return {
                    value: u[0] ? u[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function o(e) {
        return e
    }

    function s(e) {
        var i;
        return null == (i = e) ? i : {
            metrics: (0, t.exists)(i, "metrics") ? null === i.metrics ? null : i.metrics.map(o) : void 0,
            startDate: (0, t.exists)(i, "startDate") ? new Date(i.startDate) : void 0,
            endDate: (0, t.exists)(i, "endDate") ? i.endDate : void 0
        }
    }

    function l(e) {
        return e
    }

    function u(e) {
        var i;
        return null == (i = e) ? i : {
            name: (0, t.exists)(i, "name") ? i.name : void 0,
            salesType: (0, t.exists)(i, "salesType") ? i.salesType : void 0,
            targetIdString: (0, t.exists)(i, "targetIdString") ? i.targetIdString : void 0,
            totalQuantity: (0, t.exists)(i, "totalQuantity") ? i.totalQuantity : void 0,
            quantityLeft: (0, t.exists)(i, "quantityLeft") ? i.quantityLeft : void 0,
            targetId: (0, t.exists)(i, "targetId") ? i.targetId : void 0,
            targetType: (0, t.exists)(i, "targetType") ? i.targetType : void 0,
            salesCount: (0, t.exists)(i, "salesCount") ? i.salesCount : void 0,
            revenue: (0, t.exists)(i, "revenue") ? i.revenue : void 0,
            price: (0, t.exists)(i, "price") ? i.price : void 0,
            isOnSale: (0, t.exists)(i, "isOnSale") ? i.isOnSale : void 0,
            createdTime: (0, t.exists)(i, "createdTime") ? new Date(i.createdTime) : void 0
        }
    }

    function c(e) {
        if (void 0 !== e) return null === e ? null : {
            dimension: e.dimension,
            values: e.values
        }
    }

    function d(e) {
        return e
    }

    function p(e) {
        if (void 0 !== e) return null === e ? null : {
            dimension: e.dimension,
            values: e.values
        }
    }

    function y(e) {
        var i;
        return null == (i = e) ? i : {
            dimension: (0, t.exists)(i, "dimension") ? i.dimension : void 0,
            value: (0, t.exists)(i, "value") ? i.value : void 0,
            displayValue: (0, t.exists)(i, "displayValue") ? i.displayValue : void 0
        }
    }

    function m(e) {
        var i;
        return null == (i = e) ? i : {
            timestamp: (0, t.exists)(i, "timestamp") ? new Date(i.timestamp) : void 0,
            value: (0, t.exists)(i, "value") ? i.value : void 0,
            tag: (0, t.exists)(i, "tag") ? i.tag : void 0
        }
    }

    function T(e) {
        var i;
        return null == (i = e) ? i : {
            percentile: (0, t.exists)(i, "percentile") ? i.percentile : void 0,
            curValue: (0, t.exists)(i, "curValue") ? i.curValue : void 0,
            prevValue: (0, t.exists)(i, "prevValue") ? i.prevValue : void 0,
            delta: (0, t.exists)(i, "delta") ? i.delta : void 0,
            periodStartDate: (0, t.exists)(i, "periodStartDate") ? new Date(i.periodStartDate) : void 0,
            periodEndDate: (0, t.exists)(i, "periodEndDate") ? new Date(i.periodEndDate) : void 0,
            universeCreatedDate: (0, t.exists)(i, "universeCreatedDate") ? new Date(i.universeCreatedDate) : void 0
        }
    }

    function v(e) {
        var i;
        return null == (i = e) ? i : {
            universeId: i.universeId,
            insight: i.insight,
            data: (0, t.mapValues)(i.data, T),
            entryIds: i.entryIds
        }
    }

    function f(e) {
        var i;
        return null == (i = e) ? i : {
            breakdowns: (0, t.exists)(i, "breakdowns") ? null === i.breakdowns ? null : i.breakdowns.map(y) : void 0,
            datapoints: (0, t.exists)(i, "datapoints") ? null === i.datapoints ? null : i.datapoints.map(m) : void 0
        }
    }

    function g(e) {
        var i;
        return null == (i = e) ? i : {
            name: (0, t.exists)(i, "name") ? i.name : void 0,
            targetIdString: (0, t.exists)(i, "targetIdString") ? i.targetIdString : void 0,
            targetId: (0, t.exists)(i, "targetId") ? i.targetId : void 0,
            productId: (0, t.exists)(i, "productId") ? i.productId : void 0,
            targetType: (0, t.exists)(i, "targetType") ? i.targetType : void 0,
            price: (0, t.exists)(i, "price") ? i.price : void 0,
            salesCount: (0, t.exists)(i, "salesCount") ? i.salesCount : void 0,
            revenue: (0, t.exists)(i, "revenue") ? i.revenue : void 0,
            isOnSale: (0, t.exists)(i, "isOnSale") ? i.isOnSale : void 0
        }
    }

    function R(e) {
        if (void 0 !== e) return null === e ? null : {
            dimension: e.dimension,
            values: e.values
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function A(e, i) {
        return null == e ? e : {
            values: (0, t.exists)(e, "values") ? null === e.values ? null : e.values.map(f) : void 0,
            inProgress: (0, t.exists)(e, "inProgress") ? e.inProgress : void 0
        }
    }
    var h = function(e) {
            function i() {
                return null !== e && e.apply(this, arguments) || this
            }
            return n(i, e), i.prototype.analyticsHomeGetAnalyticsHomeTabOrderRaw = function(e, i) {
                return a(this, void 0, void 0, function() {
                    var n, a, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.ownerType || void 0 === e.ownerType) throw new t.RequiredError("ownerType", "Required parameter requestParameters.ownerType was null or undefined when calling analyticsHomeGetAnalyticsHomeTabOrder.");
                                if (null === e.ownerId || void 0 === e.ownerId) throw new t.RequiredError("ownerId", "Required parameter requestParameters.ownerId was null or undefined when calling analyticsHomeGetAnalyticsHomeTabOrder.");
                                return n = {}, a = {}, [4, this.request({
                                    path: "/v1/analytics-home/order/{ownerType}/{ownerId}".replace("{".concat("ownerType", "}"), encodeURIComponent(String(e.ownerType))).replace("{".concat("ownerId", "}"), encodeURIComponent(String(e.ownerId))),
                                    schemaPath: "/v1/analytics-home/order/{ownerType}/{ownerId}",
                                    method: "GET",
                                    headers: a,
                                    query: n
                                }, i)];
                            case 1:
                                return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        homeTabOrders: e.homeTabOrders.map(l)
                                    }
                                })]
                        }
                    })
                })
            }, i.prototype.analyticsHomeGetAnalyticsHomeTabOrder = function(e, t) {
                return a(this, void 0, void 0, function() {
                    return r(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.analyticsHomeGetAnalyticsHomeTabOrderRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, i
        }(t.BaseAPI),
        I = (function(e) {
            function i() {
                return null !== e && e.apply(this, arguments) || this
            }
            n(i, e), i.prototype.avatarMonetizationDetailsGetTopAvatarItemsRaw = function(e, i) {
                return a(this, void 0, void 0, function() {
                    var n, a, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.ownerType || void 0 === e.ownerType) throw new t.RequiredError("ownerType", "Required parameter requestParameters.ownerType was null or undefined when calling avatarMonetizationDetailsGetTopAvatarItems.");
                                if (null === e.ownerId || void 0 === e.ownerId) throw new t.RequiredError("ownerId", "Required parameter requestParameters.ownerId was null or undefined when calling avatarMonetizationDetailsGetTopAvatarItems.");
                                if (null === e.avatarMonetizationDetailsGetTopAvatarItemsRequest || void 0 === e.avatarMonetizationDetailsGetTopAvatarItemsRequest) throw new t.RequiredError("avatarMonetizationDetailsGetTopAvatarItemsRequest", "Required parameter requestParameters.avatarMonetizationDetailsGetTopAvatarItemsRequest was null or undefined when calling avatarMonetizationDetailsGetTopAvatarItems.");
                                return n = {}, (a = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/details/avatar/owner/{ownerType}/{ownerId}".replace("{".concat("ownerType", "}"), encodeURIComponent(String(e.ownerType))).replace("{".concat("ownerId", "}"), encodeURIComponent(String(e.ownerId))),
                                    schemaPath: "/v1/details/avatar/owner/{ownerType}/{ownerId}",
                                    method: "POST",
                                    headers: a,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            startTime: void 0 === e.startTime ? void 0 : e.startTime.toISOString(),
                                            endTime: void 0 === e.endTime ? void 0 : e.endTime.toISOString(),
                                            sortOrder: e.sortOrder,
                                            filters: void 0 === e.filters ? void 0 : null === e.filters ? null : e.filters.map(c),
                                            pagination: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    pageSize: e.pageSize,
                                                    paginationToken: e.paginationToken
                                                }
                                            }(e.pagination)
                                        }
                                    }(e.avatarMonetizationDetailsGetTopAvatarItemsRequest)
                                }, i)];
                            case 1:
                                return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        values: (0, t.exists)(e, "values") ? null === e.values ? null : e.values.map(u) : void 0,
                                        total: (0, t.exists)(e, "total") ? e.total : void 0,
                                        nextPaginationToken: (0, t.exists)(e, "nextPaginationToken") ? e.nextPaginationToken : void 0
                                    }
                                })]
                        }
                    })
                })
            }, i.prototype.avatarMonetizationDetailsGetTopAvatarItems = function(e, t) {
                return a(this, void 0, void 0, function() {
                    return r(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.avatarMonetizationDetailsGetTopAvatarItemsRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }
        }(t.BaseAPI), function(e) {
            function i() {
                return null !== e && e.apply(this, arguments) || this
            }
            n(i, e), i.prototype.avatarMonetizationMetricsQueryMetricRaw = function(e, i) {
                return a(this, void 0, void 0, function() {
                    var n, a, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.ownerType || void 0 === e.ownerType) throw new t.RequiredError("ownerType", "Required parameter requestParameters.ownerType was null or undefined when calling avatarMonetizationMetricsQueryMetric.");
                                if (null === e.ownerId || void 0 === e.ownerId) throw new t.RequiredError("ownerId", "Required parameter requestParameters.ownerId was null or undefined when calling avatarMonetizationMetricsQueryMetric.");
                                if (null === e.avatarMonetizationMetricsQueryMetricRequest || void 0 === e.avatarMonetizationMetricsQueryMetricRequest) throw new t.RequiredError("avatarMonetizationMetricsQueryMetricRequest", "Required parameter requestParameters.avatarMonetizationMetricsQueryMetricRequest was null or undefined when calling avatarMonetizationMetricsQueryMetric.");
                                return n = {}, (a = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/metrics/avatar/owner/{ownerType}/{ownerId}".replace("{".concat("ownerType", "}"), encodeURIComponent(String(e.ownerType))).replace("{".concat("ownerId", "}"), encodeURIComponent(String(e.ownerId))),
                                    schemaPath: "/v1/metrics/avatar/owner/{ownerType}/{ownerId}",
                                    method: "POST",
                                    headers: a,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            metric: e.metric,
                                            aggregationType: e.aggregationType,
                                            granularity: e.granularity,
                                            startTime: void 0 === e.startTime ? void 0 : e.startTime.toISOString(),
                                            endTime: void 0 === e.endTime ? void 0 : e.endTime.toISOString(),
                                            breakdown: void 0 === e.breakdown ? void 0 : null === e.breakdown ? null : e.breakdown.map(d),
                                            filters: void 0 === e.filters ? void 0 : null === e.filters ? null : e.filters.map(p)
                                        }
                                    }(e.avatarMonetizationMetricsQueryMetricRequest)
                                }, i)];
                            case 1:
                                return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return A(e)
                                })]
                        }
                    })
                })
            }, i.prototype.avatarMonetizationMetricsQueryMetric = function(e, t) {
                return a(this, void 0, void 0, function() {
                    return r(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.avatarMonetizationMetricsQueryMetricRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }
        }(t.BaseAPI), function(e) {
            function i() {
                return null !== e && e.apply(this, arguments) || this
            }
            return n(i, e), i.prototype.featurePermissionsGetFeatureFlagsRaw = function(e, i) {
                return a(this, void 0, void 0, function() {
                    var n, a, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return n = {}, e.flags && (n["flags[]"] = e.flags), a = {}, [4, this.request({
                                    path: "/v1/feature-flags",
                                    schemaPath: "/v1/feature-flags",
                                    method: "GET",
                                    headers: a,
                                    query: n
                                }, i)];
                            case 1:
                                return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        flags: e.flags
                                    }
                                })]
                        }
                    })
                })
            }, i.prototype.featurePermissionsGetFeatureFlags = function() {
                return a(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), r(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.featurePermissionsGetFeatureFlagsRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, i.prototype.featurePermissionsGetFeaturePermissionRaw = function(e, i) {
                return a(this, void 0, void 0, function() {
                    var n, a, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return n = {}, void 0 !== e.universeId && (n.universeId = e.universeId), e.flags && (n["flags[]"] = e.flags), a = {}, [4, this.request({
                                    path: "/v1/feature-permissions",
                                    schemaPath: "/v1/feature-permissions",
                                    method: "GET",
                                    headers: a,
                                    query: n
                                }, i)];
                            case 1:
                                return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
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
            }, i.prototype.featurePermissionsGetFeaturePermission = function() {
                return a(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), r(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.featurePermissionsGetFeaturePermissionRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, i
        }(t.BaseAPI)),
        D = function(e) {
            function i() {
                return null !== e && e.apply(this, arguments) || this
            }
            return n(i, e), i.prototype.modalHistoryRecordUserSeenModalRaw = function(e, i) {
                return a(this, void 0, void 0, function() {
                    var n, a, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.modalId || void 0 === e.modalId) throw new t.RequiredError("modalId", "Required parameter requestParameters.modalId was null or undefined when calling modalHistoryRecordUserSeenModal.");
                                return n = {}, a = {}, [4, this.request({
                                    path: "/v1/modal-history/modals/{modalId}/views".replace("{".concat("modalId", "}"), encodeURIComponent(String(e.modalId))),
                                    schemaPath: "/v1/modal-history/modals/{modalId}/views",
                                    method: "POST",
                                    headers: a,
                                    query: n
                                }, i)];
                            case 1:
                                return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        shouldSeeModal: e.shouldSeeModal
                                    }
                                })]
                        }
                    })
                })
            }, i.prototype.modalHistoryRecordUserSeenModal = function(e, t) {
                return a(this, void 0, void 0, function() {
                    return r(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.modalHistoryRecordUserSeenModalRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, i.prototype.modalHistoryShouldUserSeeModalRaw = function(e, i) {
                return a(this, void 0, void 0, function() {
                    var n, a, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.modalId || void 0 === e.modalId) throw new t.RequiredError("modalId", "Required parameter requestParameters.modalId was null or undefined when calling modalHistoryShouldUserSeeModal.");
                                return n = {}, a = {}, [4, this.request({
                                    path: "/v1/modal-history/modals/{modalId}/visibility".replace("{".concat("modalId", "}"), encodeURIComponent(String(e.modalId))),
                                    schemaPath: "/v1/modal-history/modals/{modalId}/visibility",
                                    method: "GET",
                                    headers: a,
                                    query: n
                                }, i)];
                            case 1:
                                return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        shouldSeeModal: e.shouldSeeModal
                                    }
                                })]
                        }
                    })
                })
            }, i.prototype.modalHistoryShouldUserSeeModal = function(e, t) {
                return a(this, void 0, void 0, function() {
                    return r(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.modalHistoryShouldUserSeeModalRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, i
        }(t.BaseAPI),
        M = (function(e) {
            function i() {
                return null !== e && e.apply(this, arguments) || this
            }
            n(i, e), i.prototype.monetizationDetailsGetTopItemsRaw = function(e, i) {
                return a(this, void 0, void 0, function() {
                    var n, a, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling monetizationDetailsGetTopItems.");
                                if (null === e.monetizationDetailsGetTopItemsRequest || void 0 === e.monetizationDetailsGetTopItemsRequest) throw new t.RequiredError("monetizationDetailsGetTopItemsRequest", "Required parameter requestParameters.monetizationDetailsGetTopItemsRequest was null or undefined when calling monetizationDetailsGetTopItems.");
                                return n = {}, (a = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/details/monetization/topitems/universes/{universeId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/details/monetization/topitems/universes/{universeId}",
                                    method: "POST",
                                    headers: a,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            monetizationDetailType: e.monetizationDetailType,
                                            startTime: void 0 === e.startTime ? void 0 : e.startTime.toISOString(),
                                            endTime: void 0 === e.endTime ? void 0 : e.endTime.toISOString(),
                                            sortOrder: e.sortOrder,
                                            filters: void 0 === e.filters ? void 0 : null === e.filters ? null : e.filters.map(R),
                                            pagination: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    pageSize: e.pageSize,
                                                    paginationToken: e.paginationToken
                                                }
                                            }(e.pagination),
                                            granularity: e.granularity
                                        }
                                    }(e.monetizationDetailsGetTopItemsRequest)
                                }, i)];
                            case 1:
                                return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        values: (0, t.exists)(e, "values") ? null === e.values ? null : e.values.map(g) : void 0,
                                        total: (0, t.exists)(e, "total") ? e.total : void 0,
                                        nextPaginationToken: (0, t.exists)(e, "nextPaginationToken") ? e.nextPaginationToken : void 0
                                    }
                                })]
                        }
                    })
                })
            }, i.prototype.monetizationDetailsGetTopItems = function(e, t) {
                return a(this, void 0, void 0, function() {
                    return r(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.monetizationDetailsGetTopItemsRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }
        }(t.BaseAPI), function(e) {
            function i() {
                return null !== e && e.apply(this, arguments) || this
            }
            n(i, e), i.prototype.monetizationMetricsControllerV2QueryMetricRaw = function(e, i) {
                return a(this, void 0, void 0, function() {
                    var n, a, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling monetizationMetricsControllerV2QueryMetric.");
                                if (null === e.monetizationMetricsControllerV2QueryMetricRequest || void 0 === e.monetizationMetricsControllerV2QueryMetricRequest) throw new t.RequiredError("monetizationMetricsControllerV2QueryMetricRequest", "Required parameter requestParameters.monetizationMetricsControllerV2QueryMetricRequest was null or undefined when calling monetizationMetricsControllerV2QueryMetric.");
                                return n = {}, (a = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v2/metrics/monetization/universes/{universeId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v2/metrics/monetization/universes/{universeId}",
                                    method: "POST",
                                    headers: a,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            metric: e.metric,
                                            aggregationType: e.aggregationType,
                                            granularity: e.granularity,
                                            startTime: void 0 === e.startTime ? void 0 : e.startTime.toISOString(),
                                            endTime: void 0 === e.endTime ? void 0 : e.endTime.toISOString(),
                                            breakdown: void 0 === e.breakdown ? void 0 : null === e.breakdown ? null : e.breakdown.map(d),
                                            filters: void 0 === e.filters ? void 0 : null === e.filters ? null : e.filters.map(p)
                                        }
                                    }(e.monetizationMetricsControllerV2QueryMetricRequest)
                                }, i)];
                            case 1:
                                return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return A(e)
                                })]
                        }
                    })
                })
            }, i.prototype.monetizationMetricsControllerV2QueryMetric = function(e, t) {
                return a(this, void 0, void 0, function() {
                    return r(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.monetizationMetricsControllerV2QueryMetricRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }
        }(t.BaseAPI), function(e) {
            function i() {
                return null !== e && e.apply(this, arguments) || this
            }
            return n(i, e), i.prototype.universeAnalyticsAggregationsGetMetadataRaw = function(e) {
                return a(this, void 0, void 0, function() {
                    var i, n, a;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return i = {}, n = {}, [4, this.request({
                                    path: "/v1/metadata",
                                    schemaPath: "/v1/metadata",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, e)];
                            case 1:
                                return a = r.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        maxDataPointsForQuerying: (0, t.exists)(e, "maxDataPointsForQuerying") ? e.maxDataPointsForQuerying : void 0,
                                        minimalDateForQuerying: (0, t.exists)(e, "minimalDateForQuerying") ? new Date(e.minimalDateForQuerying) : void 0,
                                        maximalDateForQuerying: (0, t.exists)(e, "maximalDateForQuerying") ? new Date(e.maximalDateForQuerying) : void 0,
                                        defaultDataPointsForQuerying: (0, t.exists)(e, "defaultDataPointsForQuerying") ? e.defaultDataPointsForQuerying : void 0,
                                        openIssues: (0, t.exists)(e, "openIssues") ? null === e.openIssues ? null : e.openIssues.map(s) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, i.prototype.universeAnalyticsAggregationsGetMetadata = function(e) {
                return a(this, void 0, void 0, function() {
                    return r(this, function(t) {
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
            }, i
        }(t.BaseAPI));
    (function(e) {
        function i() {
            return null !== e && e.apply(this, arguments) || this
        }
        n(i, e), i.prototype.universeInsightsGetUniverseInsightsRaw = function(e, i) {
            return a(this, void 0, void 0, function() {
                var n, a, o;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling universeInsightsGetUniverseInsights.");
                            return n = {}, a = {}, [4, this.request({
                                path: "/v1/insights/universes/{universeId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/insights/universes/{universeId}",
                                method: "GET",
                                headers: a,
                                query: n
                            }, i)];
                        case 1:
                            return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    insightSummaries: e.insightSummaries.map(v),
                                    startTime: new Date(e.startTime),
                                    endTime: new Date(e.endTime)
                                }
                            })]
                    }
                })
            })
        }, i.prototype.universeInsightsGetUniverseInsights = function(e, t) {
            return a(this, void 0, void 0, function() {
                return r(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.universeInsightsGetUniverseInsightsRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, i.prototype.universeInsightsSnoozeInsightRaw = function(e, i) {
            return a(this, void 0, void 0, function() {
                var n, a, o;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling universeInsightsSnoozeInsight.");
                            return n = {}, (a = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/insights/universes/{universeId}/snooze".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/insights/universes/{universeId}/snooze",
                                method: "POST",
                                headers: a,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        insightType: e.insightType
                                    }
                                }(e.universeInsightsSnoozeInsightRequest)
                            }, i)];
                        case 1:
                            return o = r.sent(), [2, new t.JSONApiResponse(o)]
                    }
                })
            })
        }, i.prototype.universeInsightsSnoozeInsight = function(e, t) {
            return a(this, void 0, void 0, function() {
                return r(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.universeInsightsSnoozeInsightRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }
    })(t.BaseAPI), e.s(["AnalyticsHomeApi", 0, h, "AnalyticsHomeTab", 0, {
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
    }, "FeaturePermissionsApi", 0, I, "MetricGranularity", 0, {
        OneHour: "OneHour",
        OneDay: "OneDay",
        OneWeek: "OneWeek",
        WithoutGrouping: "WithoutGrouping"
    }, "ModalHistoryApi", 0, D, "OwnerType", 0, {
        User: "User",
        Group: "Group"
    }, "SalesType", 0, {
        Unlimited: "Unlimited",
        Limited: "Limited"
    }, "UniverseAnalyticsAggregationsApi", 0, M])
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
            for (var a in i = Array.isArray(t) ? [] : {}, t) i[a] = e(t[a]);
        return i
    }])
}]);

//# debugId=e4811615-d035-9c1b-75ed-e6d2ab5a3b98
//# sourceMappingURL=23o9r3m4ov9so.js.map
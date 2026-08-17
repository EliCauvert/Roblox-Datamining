;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "d1499164-7015-6a31-d29e-5682abf9a373")
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
    var t, i, a = e.i(730530),
        n = ((t = {}).BoldText = "boldText", t.Text = "text", t.TextWithDisplayValue = "textWithDisplayValue", t.Number = "number", t.Timestamp = "timestamp", t.RawJSONString = "RawJSONString", t.CodeDiff = "codeDiff", t.TextWithTooltip = "textWithTooltip", t.Other = "other", t.Selection = "selection", t.Actions = "actions", t.TextWithLink = "textWithLink", t.Image = "image", t.Date = "date", t.Status = "status", t.TextWithIcon = "TextWithIcon", t.Code = "code", t),
        r = ((i = {}).ValueOpacityFill = "valueOpacityFill", i.ValuePercentageWidthFill = "valuePercentageWidthFill", i.ConstantFill = "constantFill", i);
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
    }, "resolveTableColumnTitle", 0, (e, t, i) => void 0 !== i ? (0, a.brandUntranslatableText)(i) : "string" == typeof t ? t : e(t)])
}, 447311, e => {
    "use strict";
    var t, i = ((t = {}).Positive = "Positive", t.Negative = "Negative", t.Progression = "Progression", t.Highlight = "Highlight", t);
    e.s(["TableCellBackgroundColor", () => i])
}, 11517, 510785, 548152, 875907, 908374, e => {
    "use strict";
    var t, i, a, n = e.i(31611),
        r = e.i(730530),
        o = e.i(531007),
        s = e.i(923319),
        l = e.i(447311),
        u = e.i(881670),
        c = e.i(927868),
        y = e.i(577038);
    let p = [y.default.QuotaPercentageUsage];
    y.default.TopBreakdown;
    let m = e => (0, c.isValidArrayEnumValue)(p, e.type),
        d = y.default,
        T = y.default;
    e.s(["RAQIV2SummaryType", 0, d, "default", 0, T, "isRAQIV2DoubleMetricSummaryType", 0, m, "isRAQIV2SingleMetricSummaryType", 0, e => !m(e)], 510785);
    var f = ((t = f || {}).InExperienceCurrency = "inExperienceCurrency", t);
    e.s(["default", 0, f], 548152);
    var v = ((i = {}).PercentageOfFirstPoint = "PercentageOfFirstPoint", i.ScaleBackBy100 = "ScaleBackBy100", i.ScaleBackBy60 = "ScaleBackBy60", i.ScaleBackBy3600 = "ScaleBackBy3600", i.ScaleBackBy1000000000 = "ScaleBackBy1000000000", i);

    function g(e) {
        return (t, i) => {
            let [a, n, r] = i[t];
            return [a, null === n ? null : n * e, r]
        }
    }
    let A = {
        PercentageOfFirstPoint: (e, t) => {
            let [, i] = t[0], [a, n, r] = t[e], o = null;
            return i && null !== n && (o = n / i), [a, o, r]
        },
        ScaleBackBy100: g(.01),
        ScaleBackBy60: g(1 / 60),
        ScaleBackBy3600: g(1 / 3600),
        ScaleBackBy1000000000: g(1e-9)
    };
    e.s(["NumericDataPointTransformerType", () => v, "default", 0, A], 875907);
    let R = {
        defaultTotalSummaryTypes: [{
            type: T.Average
        }]
    };
    n.RAQIV2Metric.ThumbnailWinningSegments;
    let h = e => (0, c.isValidEnumValue)(n.RAQIV2Metric, e) || (0, c.isValidEnumValue)(n.RAQIV2UIMetric, e),
        M = e => {
            var t;
            return h(e) && (null == (t = n.RAQIV2MetricDisplayConfig[e]) ? void 0 : t.valueType) === n.RAQIV2MetricValueType.Numeric
        },
        D = {
            [n.RAQIV2Metric.VideoServiceExclusivePlaybackSeconds]: {
                unit: n.RAQIV2MetricUnit.Hours,
                decimalPrecision: 1
            }
        };
    var I = ((a = {}).WinningSegments = "WinningSegments", a);
    let S = [{
            type: T.Total
        }],
        C = [{
            type: T.LastValue
        }],
        K = {
            [n.RAQIV2Metric.CreatorRewardsAverageRobuxBookingsPerSpender]: {
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.CreatorRewardsAverageRobuxBookingsPerSpender", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.CreatorRewardsLifetimeEstimatedAffiliatePayoutRobux]: {
                defaultTotalSummaryTypes: S,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.CreatorRewardsLifetimeEstimatedAffiliatePayoutRobux", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.CreatorRewardsLifetimeQualifiedReactivations]: {
                defaultTotalSummaryTypes: S,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.CreatorRewardsLifetimeQualifiedReactivations", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.CreatorRewardsLifetimeQualifiedSignups]: {
                defaultTotalSummaryTypes: S,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.CreatorRewardsLifetimeQualifiedSignups", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.CreatorRewardsLifetimeQualifiedSpenders]: {
                defaultTotalSummaryTypes: S,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.CreatorRewardsLifetimeQualifiedSpenders", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.CommunityAnnouncementEventCount]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.CommunityAnnouncementUniqueUsers]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.CommunityAnnouncementNotificationCTR]: {
                defaultTotalSummaryTypes: C
            },
            [n.RAQIV2Metric.EconomyTransactionAmount]: {
                defaultTotalSummaryTypes: S,
                exploreModeChartType: o.ChartType.Column,
                specialNumberFormatting: f.InExperienceCurrency
            },
            [n.RAQIV2Metric.EconomyTransactionAmountSinks]: {
                defaultTotalSummaryTypes: S,
                exploreModeChartType: o.ChartType.Column,
                specialNumberFormatting: f.InExperienceCurrency
            },
            [n.RAQIV2Metric.EconomyTransactionCount]: {
                defaultTotalSummaryTypes: S,
                exploreModeChartType: o.ChartType.Column
            },
            [n.RAQIV2Metric.EconomyAverageWalletBalance]: {
                exploreModeChartType: o.ChartType.Spline,
                specialNumberFormatting: f.InExperienceCurrency
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
                defaultTotalSummaryTypes: S,
                columnDisplayConfigOverrides: {
                    cellBackground: {
                        type: s.CellBackgroundType.ValuePercentageWidthFill,
                        color: l.TableCellBackgroundColor.Progression
                    },
                    widthWeight: 40
                }
            },
            [n.RAQIV2Metric.FunnelUserOverallCompletionRate]: {
                defaultTotalSummaryTypes: S,
                columnDisplayConfigOverrides: {
                    cellBackground: {
                        type: s.CellBackgroundType.ValuePercentageWidthFill,
                        color: l.TableCellBackgroundColor.Progression
                    },
                    widthWeight: 40
                }
            },
            [n.RAQIV2Metric.FunnelUserTotalCount]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.FunnelStepTotalCount]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.JourneyTotalUsers]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.JourneyCompletionUsers]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.JourneyEntryTransitions]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.JourneyLastStageTransitions]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.JourneyStageUserCount]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.JourneyStageTransitionCount]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.JourneyNodeUserCount]: {
                defaultTotalSummaryTypes: S,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.JourneyNodeUserCount", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.JourneyNodeUserChurnCount]: {
                defaultTotalSummaryTypes: S,
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
                defaultTotalSummaryTypes: S,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKey)("Description.JourneyNodeTransitionCount", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.JourneyNodeTransitionChurnCount]: {
                defaultTotalSummaryTypes: S,
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
            [n.RAQIV2Metric.UniqueUsersWithPlaySessionsMigration]: {
                defaultTotalSummaryTypes: [{
                    type: T.Average
                }, {
                    type: T.Total
                }],
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.UsersWithPlays", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.UniqueUsersWithImpressionsMigration]: {
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
            [n.RAQIV2Metric.EndToEndCVRMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.ConversionRate", u.TranslationNamespace.Analytics),
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
                    type: T.Average
                }, {
                    type: T.Total
                }],
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.QualifiedUsersWithPlays", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.QualifiedUsersWithPlays")
                }
            },
            [n.RAQIV2Metric.QualifiedEndToEndCVRMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.QualifiedPTR", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.QualifiedPTR")
                }
            },
            [n.RAQIV2Metric.ComputeEfficiency]: {
                dataPointTransformerType: v.ScaleBackBy100
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
            [n.RAQIV2Metric.Attribution1DPayerConversionRatioMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.PayerConversion1D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.PayerConversion1D")
                }
            },
            [n.RAQIV2Metric.Attribution1DPlaytimePerUserInMinutesMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.PlaytimePerUser1D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.PlaytimePerUser1D")
                }
            },
            [n.RAQIV2Metric.Attribution1DRobuxPerUserMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.RevenuePerUser1D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.RevenuePerUser1D")
                }
            },
            [n.RAQIV2Metric.Attribution30DPayerConversionRatioMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.PayerConversion30D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.PayerConversion30D")
                }
            },
            [n.RAQIV2Metric.Attribution30DPlaytimePerUserInMinutesMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.PlaytimePerUser30D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.PlaytimePerUser30D")
                }
            },
            [n.RAQIV2Metric.Attribution30DRobuxPerUserMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.RevenuePerUser30D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.RevenuePerUser30D")
                }
            },
            [n.RAQIV2Metric.Attribution7DPayerConversionRatioMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.PayerConversion7D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.PayerConversion7D")
                }
            },
            [n.RAQIV2Metric.Attribution7DPlaytimePerUserInMinutesMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.PlaytimePerUser7D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.PlaytimePerUser7D")
                }
            },
            [n.RAQIV2Metric.Attribution7DRobuxPerUserMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.RevenuePerUser7D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.RevenuePerUser7D")
                }
            },
            [n.RAQIV2Metric.AttributionD1RetentionRatioMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.D1Retention", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.D1Retention")
                }
            },
            [n.RAQIV2Metric.AttributionD30RetentionRatioMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.D30Retention", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.D30Retention")
                }
            },
            [n.RAQIV2Metric.AttributionD7RetentionRatioMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.D7Retention", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.D7Retention")
                }
            },
            [n.RAQIV2Metric.UniqueUsersWithClicksMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.UsersWithDetailPageVisits", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.UsersWithDetailPageVisits")
                }
            },
            [n.RAQIV2Metric.ImpressionCVRMigration]: {
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.UsersImpressionCTR", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.UsersImpressionCTR")
                }
            },
            [n.RAQIV2Metric.ClickCVRMigration]: {
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
            [n.RAQIV2Metric.L7AverageDailyRevenue]: {
                defaultTotalSummaryTypes: [{
                    type: T.Average
                }, {
                    type: T.Total
                }],
                loggingMetricOverride: "Robux"
            },
            [n.RAQIV2Metric.ItemMonetizationRevenue]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.ItemMonetizationSales]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.AverageSessionLengthMinutes]: {
                loggingMetricOverride: "AveragePlayTime"
            },
            [n.RAQIV2Metric.AveragePlayTimeMinutesPerDAU]: {
                loggingMetricOverride: "AveragePlayTime"
            },
            [n.RAQIV2Metric.ThumbnailImpressions]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.ThumbnailQualifiedPlays]: {
                defaultTotalSummaryTypes: S
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
                dataPointTransformerType: v.PercentageOfFirstPoint,
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
            [n.RAQIV2UIMetric.ClientMemoryUsage]: {
                dataPointTransformerType: v.ScaleBackBy1000000000
            },
            [n.RAQIV2UIMetric.SessionDurationSeconds]: {
                dataPointTransformerType: v.ScaleBackBy60
            },
            [n.RAQIV2UIMetric.ServerMemoryUsage]: {
                dataPointTransformerType: v.ScaleBackBy1000000000
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
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.ItemAvatar3dLimitedTotalQuantity]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.ItemLifetimeCreatorEarning]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.ItemLifetimeRebateAmount]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.ItemLifetimeRobuxSpent]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.ItemLifetimeTransactionCount]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.ItemLimitedSoldPercentage]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.ItemPublishAdvance]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.ItemTotalCreatorEarning]: {
                defaultTotalSummaryTypes: S,
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Label.Revenue", u.TranslationNamespace.AvatarAnalytics)
                }
            },
            [n.RAQIV2Metric.ItemTotalRobuxSpent]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.ItemTotalTransactionCount]: {
                defaultTotalSummaryTypes: S,
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.ItemTotalTransactionCount", u.TranslationNamespace.Analytics)
                }
            },
            [n.RAQIV2Metric.StoreTransactions]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.StoreRevenue]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.ShareLinkAttribution1DPayerConversionRatio]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.ShareLinkAttribution1DPlaytimePerUserInMinutes]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.ShareLinkAttribution1DRobuxPerUser]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.ShareLinkAttribution30DPayerConversionRatio]: {
                defaultTotalSummaryTypes: S,
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.PayerConversion30D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.PayerConversion30D")
                }
            },
            [n.RAQIV2Metric.ShareLinkAttribution30DPlaytimePerUserInMinutes]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.ShareLinkAttribution30DRobuxPerUser]: {
                defaultTotalSummaryTypes: S,
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.RevenuePerUser30D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.RevenuePerUser30D")
                }
            },
            [n.RAQIV2Metric.ShareLinkAttribution7DPayerConversionRatio]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.ShareLinkAttribution7DPlaytimePerUserInMinutes]: {
                defaultTotalSummaryTypes: S,
                columnDisplayConfigOverrides: {
                    titleKey: (0, r.translationKey)("Title.Table.PlaytimePerUser7D", u.TranslationNamespace.Analytics),
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.PlaytimePerUser7D")
                }
            },
            [n.RAQIV2Metric.ShareLinkAttribution7DRobuxPerUser]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.ShareLinkAttributionD1RetentionRatio]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.ShareLinkAttributionD30RetentionRatio]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.ShareLinkAttributionD7RetentionRatio]: {
                defaultTotalSummaryTypes: S,
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
                defaultTotalSummaryTypes: S,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.QualifiedUsersWithPlays")
                }
            },
            [n.RAQIV2Metric.ShareLinkUniqueUsersWithClicks]: {
                defaultTotalSummaryTypes: S,
                columnDisplayConfigOverrides: {
                    tooltipKey: (0, r.translationKeyWithoutNamespace)("Description.Table.UsersWithDetailPageVisits")
                }
            },
            [n.RAQIV2Metric.ShareLinkUniqueUsersWithPlaySessions]: {
                defaultTotalSummaryTypes: S
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
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.FriendReferralLifetimeEstimatedAffiliatePayoutRobux]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.FriendReferralLifetimeQualifiedSignups]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.FriendReferralLifetimeQualifiedSpenders]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.FriendReferralLifetimeVisits]: {
                defaultTotalSummaryTypes: S
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
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.CommerceQuantitySold]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.CommerceClicks]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.CommerceImpressions]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.CommerceOrders]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.CommerceCheckouts]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.CommerceUniqueClicks]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.CommerceUniqueImpressions]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.CommerceUniqueCheckouts]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.CommerceUniqueOrders]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.AdsPublisherReportingTotalRevenueRobux]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.AdsPublisherReportingTotalImpressions]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.AdsPublisherReportingVideo2DRevenueRobux]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.AdsPublisherReportingVideo2DImpressions]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.AdsPublisherReportingVideo2DDailyUniqueViewer]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.CommunityGroupPageViews]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.CommunityGroupPageUniqueVisitors]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.CommunityMembershipChangeEvents]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.CommunityForumContentEventCount]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.CommunityForumContentUniqueUsers]: {
                defaultTotalSummaryTypes: S
            },
            [n.RAQIV2Metric.CommunityMembershipCount]: {
                defaultTotalSummaryTypes: C
            },
            [n.RAQIV2Metric.VideoServiceExclusivePlaybackSeconds]: {
                defaultTotalSummaryTypes: S,
                dataPointTransformerType: v.ScaleBackBy3600
            }
        },
        b = {
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
        };
    e.s(["RAQIV2MetricValueRendererType", () => I, "default", 0, e => {
        let t = n.RAQIV2MetricDisplayConfig[e],
            i = t.valueType === n.RAQIV2MetricValueType.Numeric ? K[e] : b[e],
            a = {
                ...R,
                ...t,
                ...i
            },
            r = D[e];
        return null != r && (a.unit = r.unit, a.decimalPrecision = r.decimalPrecision), a
    }, "isNumericUIMetric", 0, M, "isRAQIV2UIMetric", 0, h], 908374);
    let P = e => "string" == typeof e && e.trim().length > 0,
        V = e => !!e && "object" == typeof e && e.metric === n.RAQIV2UIMetric.CustomEventsV2 && P(e.customEventName) && (void 0 === e.aggregationType || Object.values(n.RAQIV2AggregationType).includes(e.aggregationType)),
        Q = e => V(e) ? e.metric : e,
        w = e => {
            var t;
            let i;
            return !!e && "object" == typeof e && P(e.key) && (P(i = t = e.metric) && M(i) || V(t))
        },
        N = e => !!e && "object" == typeof e && "sources" in e && !!Array.isArray(e.sources) && 0 !== e.sources.length && !!P(e.formula) && e.sources.every(w),
        O = e => {
            if (!N(e)) return [Q(e)];
            let t = new Set;
            return e.sources.forEach(e => {
                t.add(Q(e.metric))
            }), Array.from(t)
        },
        k = e => {
            var t;
            if (!V(e)) return e;
            let i = null != (t = e.aggregationType) ? t : n.RAQIV2AggregationType.Sum;
            return "".concat(e.metric, ":").concat(e.customEventName, ":").concat(i)
        },
        U = e => N(e) ? "ACEComputed:".concat((e => {
            if (!N(e)) return [e];
            let t = new Set,
                i = [];
            return e.sources.forEach(e => {
                let a = k(e.metric);
                t.has(a) || (t.add(a), i.push(e.metric))
            }), i
        })(e).map(e => k(e)).sort().join("|")) : k(e);
    e.s(["getAtomicMetricsFromMetricLike", 0, O, "getMetricCacheKeyFromMetricLike", 0, U, "getSentryMetricNameFromMetricLike", 0, e => U(e), "getUIMetricFromAtomicMetricLike", 0, Q, "getUIMetricsFromMetricLike", 0, O, "isComputedMetric", 0, N, "isCustomEventsAtomicMetricLike", 0, V], 11517)
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

    function a(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function a() {
            this.constructor = e
        }
        i(e, t), e.prototype = null === t ? Object.create(t) : (a.prototype = t.prototype, new a)
    }

    function n(e, t, i, a) {
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

    function r(e, t) {
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

    function y(e) {
        return e
    }

    function p(e) {
        if (void 0 !== e) return null === e ? null : {
            dimension: e.dimension,
            values: e.values
        }
    }

    function m(e) {
        var i;
        return null == (i = e) ? i : {
            dimension: (0, t.exists)(i, "dimension") ? i.dimension : void 0,
            value: (0, t.exists)(i, "value") ? i.value : void 0,
            displayValue: (0, t.exists)(i, "displayValue") ? i.displayValue : void 0
        }
    }

    function d(e) {
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

    function f(e) {
        var i;
        return null == (i = e) ? i : {
            universeId: i.universeId,
            insight: i.insight,
            data: (0, t.mapValues)(i.data, T),
            entryIds: i.entryIds
        }
    }

    function v(e) {
        var i;
        return null == (i = e) ? i : {
            breakdowns: (0, t.exists)(i, "breakdowns") ? null === i.breakdowns ? null : i.breakdowns.map(m) : void 0,
            datapoints: (0, t.exists)(i, "datapoints") ? null === i.datapoints ? null : i.datapoints.map(d) : void 0
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

    function A(e) {
        if (void 0 !== e) return null === e ? null : {
            dimension: e.dimension,
            values: e.values
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function R(e, i) {
        return null == e ? e : {
            values: (0, t.exists)(e, "values") ? null === e.values ? null : e.values.map(v) : void 0,
            inProgress: (0, t.exists)(e, "inProgress") ? e.inProgress : void 0
        }
    }
    var h = function(e) {
            function i() {
                return null !== e && e.apply(this, arguments) || this
            }
            return a(i, e), i.prototype.analyticsHomeGetAnalyticsHomeTabOrderRaw = function(e, i) {
                return n(this, void 0, void 0, function() {
                    var a, n, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.ownerType || void 0 === e.ownerType) throw new t.RequiredError("ownerType", "Required parameter requestParameters.ownerType was null or undefined when calling analyticsHomeGetAnalyticsHomeTabOrder.");
                                if (null === e.ownerId || void 0 === e.ownerId) throw new t.RequiredError("ownerId", "Required parameter requestParameters.ownerId was null or undefined when calling analyticsHomeGetAnalyticsHomeTabOrder.");
                                return a = {}, n = {}, [4, this.request({
                                    path: "/v1/analytics-home/order/{ownerType}/{ownerId}".replace("{".concat("ownerType", "}"), encodeURIComponent(String(e.ownerType))).replace("{".concat("ownerId", "}"), encodeURIComponent(String(e.ownerId))),
                                    schemaPath: "/v1/analytics-home/order/{ownerType}/{ownerId}",
                                    method: "GET",
                                    headers: n,
                                    query: a
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
                return n(this, void 0, void 0, function() {
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
        M = (function(e) {
            function i() {
                return null !== e && e.apply(this, arguments) || this
            }
            a(i, e), i.prototype.avatarMonetizationDetailsGetTopAvatarItemsRaw = function(e, i) {
                return n(this, void 0, void 0, function() {
                    var a, n, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.ownerType || void 0 === e.ownerType) throw new t.RequiredError("ownerType", "Required parameter requestParameters.ownerType was null or undefined when calling avatarMonetizationDetailsGetTopAvatarItems.");
                                if (null === e.ownerId || void 0 === e.ownerId) throw new t.RequiredError("ownerId", "Required parameter requestParameters.ownerId was null or undefined when calling avatarMonetizationDetailsGetTopAvatarItems.");
                                if (null === e.avatarMonetizationDetailsGetTopAvatarItemsRequest || void 0 === e.avatarMonetizationDetailsGetTopAvatarItemsRequest) throw new t.RequiredError("avatarMonetizationDetailsGetTopAvatarItemsRequest", "Required parameter requestParameters.avatarMonetizationDetailsGetTopAvatarItemsRequest was null or undefined when calling avatarMonetizationDetailsGetTopAvatarItems.");
                                return a = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/details/avatar/owner/{ownerType}/{ownerId}".replace("{".concat("ownerType", "}"), encodeURIComponent(String(e.ownerType))).replace("{".concat("ownerId", "}"), encodeURIComponent(String(e.ownerId))),
                                    schemaPath: "/v1/details/avatar/owner/{ownerType}/{ownerId}",
                                    method: "POST",
                                    headers: n,
                                    query: a,
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
                return n(this, void 0, void 0, function() {
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
            a(i, e), i.prototype.avatarMonetizationMetricsQueryMetricRaw = function(e, i) {
                return n(this, void 0, void 0, function() {
                    var a, n, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.ownerType || void 0 === e.ownerType) throw new t.RequiredError("ownerType", "Required parameter requestParameters.ownerType was null or undefined when calling avatarMonetizationMetricsQueryMetric.");
                                if (null === e.ownerId || void 0 === e.ownerId) throw new t.RequiredError("ownerId", "Required parameter requestParameters.ownerId was null or undefined when calling avatarMonetizationMetricsQueryMetric.");
                                if (null === e.avatarMonetizationMetricsQueryMetricRequest || void 0 === e.avatarMonetizationMetricsQueryMetricRequest) throw new t.RequiredError("avatarMonetizationMetricsQueryMetricRequest", "Required parameter requestParameters.avatarMonetizationMetricsQueryMetricRequest was null or undefined when calling avatarMonetizationMetricsQueryMetric.");
                                return a = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/metrics/avatar/owner/{ownerType}/{ownerId}".replace("{".concat("ownerType", "}"), encodeURIComponent(String(e.ownerType))).replace("{".concat("ownerId", "}"), encodeURIComponent(String(e.ownerId))),
                                    schemaPath: "/v1/metrics/avatar/owner/{ownerType}/{ownerId}",
                                    method: "POST",
                                    headers: n,
                                    query: a,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            metric: e.metric,
                                            aggregationType: e.aggregationType,
                                            granularity: e.granularity,
                                            startTime: void 0 === e.startTime ? void 0 : e.startTime.toISOString(),
                                            endTime: void 0 === e.endTime ? void 0 : e.endTime.toISOString(),
                                            breakdown: void 0 === e.breakdown ? void 0 : null === e.breakdown ? null : e.breakdown.map(y),
                                            filters: void 0 === e.filters ? void 0 : null === e.filters ? null : e.filters.map(p)
                                        }
                                    }(e.avatarMonetizationMetricsQueryMetricRequest)
                                }, i)];
                            case 1:
                                return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return R(e)
                                })]
                        }
                    })
                })
            }, i.prototype.avatarMonetizationMetricsQueryMetric = function(e, t) {
                return n(this, void 0, void 0, function() {
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
            return a(i, e), i.prototype.featurePermissionsGetFeatureFlagsRaw = function(e, i) {
                return n(this, void 0, void 0, function() {
                    var a, n, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return a = {}, e.flags && (a["flags[]"] = e.flags), n = {}, [4, this.request({
                                    path: "/v1/feature-flags",
                                    schemaPath: "/v1/feature-flags",
                                    method: "GET",
                                    headers: n,
                                    query: a
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
                return n(this, arguments, void 0, function(e, t) {
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
                return n(this, void 0, void 0, function() {
                    var a, n, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return a = {}, void 0 !== e.universeId && (a.universeId = e.universeId), e.flags && (a["flags[]"] = e.flags), n = {}, [4, this.request({
                                    path: "/v1/feature-permissions",
                                    schemaPath: "/v1/feature-permissions",
                                    method: "GET",
                                    headers: n,
                                    query: a
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
                return n(this, arguments, void 0, function(e, t) {
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
            return a(i, e), i.prototype.modalHistoryRecordUserSeenModalRaw = function(e, i) {
                return n(this, void 0, void 0, function() {
                    var a, n, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.modalId || void 0 === e.modalId) throw new t.RequiredError("modalId", "Required parameter requestParameters.modalId was null or undefined when calling modalHistoryRecordUserSeenModal.");
                                return a = {}, n = {}, [4, this.request({
                                    path: "/v1/modal-history/modals/{modalId}/views".replace("{".concat("modalId", "}"), encodeURIComponent(String(e.modalId))),
                                    schemaPath: "/v1/modal-history/modals/{modalId}/views",
                                    method: "POST",
                                    headers: n,
                                    query: a
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
                return n(this, void 0, void 0, function() {
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
                return n(this, void 0, void 0, function() {
                    var a, n, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.modalId || void 0 === e.modalId) throw new t.RequiredError("modalId", "Required parameter requestParameters.modalId was null or undefined when calling modalHistoryShouldUserSeeModal.");
                                return a = {}, n = {}, [4, this.request({
                                    path: "/v1/modal-history/modals/{modalId}/visibility".replace("{".concat("modalId", "}"), encodeURIComponent(String(e.modalId))),
                                    schemaPath: "/v1/modal-history/modals/{modalId}/visibility",
                                    method: "GET",
                                    headers: n,
                                    query: a
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
                return n(this, void 0, void 0, function() {
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
        I = (function(e) {
            function i() {
                return null !== e && e.apply(this, arguments) || this
            }
            a(i, e), i.prototype.monetizationDetailsGetTopItemsRaw = function(e, i) {
                return n(this, void 0, void 0, function() {
                    var a, n, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling monetizationDetailsGetTopItems.");
                                if (null === e.monetizationDetailsGetTopItemsRequest || void 0 === e.monetizationDetailsGetTopItemsRequest) throw new t.RequiredError("monetizationDetailsGetTopItemsRequest", "Required parameter requestParameters.monetizationDetailsGetTopItemsRequest was null or undefined when calling monetizationDetailsGetTopItems.");
                                return a = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/details/monetization/topitems/universes/{universeId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/details/monetization/topitems/universes/{universeId}",
                                    method: "POST",
                                    headers: n,
                                    query: a,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            monetizationDetailType: e.monetizationDetailType,
                                            startTime: void 0 === e.startTime ? void 0 : e.startTime.toISOString(),
                                            endTime: void 0 === e.endTime ? void 0 : e.endTime.toISOString(),
                                            sortOrder: e.sortOrder,
                                            filters: void 0 === e.filters ? void 0 : null === e.filters ? null : e.filters.map(A),
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
                return n(this, void 0, void 0, function() {
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
            a(i, e), i.prototype.monetizationMetricsControllerV2QueryMetricRaw = function(e, i) {
                return n(this, void 0, void 0, function() {
                    var a, n, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling monetizationMetricsControllerV2QueryMetric.");
                                if (null === e.monetizationMetricsControllerV2QueryMetricRequest || void 0 === e.monetizationMetricsControllerV2QueryMetricRequest) throw new t.RequiredError("monetizationMetricsControllerV2QueryMetricRequest", "Required parameter requestParameters.monetizationMetricsControllerV2QueryMetricRequest was null or undefined when calling monetizationMetricsControllerV2QueryMetric.");
                                return a = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v2/metrics/monetization/universes/{universeId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v2/metrics/monetization/universes/{universeId}",
                                    method: "POST",
                                    headers: n,
                                    query: a,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            metric: e.metric,
                                            aggregationType: e.aggregationType,
                                            granularity: e.granularity,
                                            startTime: void 0 === e.startTime ? void 0 : e.startTime.toISOString(),
                                            endTime: void 0 === e.endTime ? void 0 : e.endTime.toISOString(),
                                            breakdown: void 0 === e.breakdown ? void 0 : null === e.breakdown ? null : e.breakdown.map(y),
                                            filters: void 0 === e.filters ? void 0 : null === e.filters ? null : e.filters.map(p)
                                        }
                                    }(e.monetizationMetricsControllerV2QueryMetricRequest)
                                }, i)];
                            case 1:
                                return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return R(e)
                                })]
                        }
                    })
                })
            }, i.prototype.monetizationMetricsControllerV2QueryMetric = function(e, t) {
                return n(this, void 0, void 0, function() {
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
            return a(i, e), i.prototype.universeAnalyticsAggregationsGetMetadataRaw = function(e) {
                return n(this, void 0, void 0, function() {
                    var i, a, n;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return i = {}, a = {}, [4, this.request({
                                    path: "/v1/metadata",
                                    schemaPath: "/v1/metadata",
                                    method: "GET",
                                    headers: a,
                                    query: i
                                }, e)];
                            case 1:
                                return n = r.sent(), [2, new t.JSONApiResponse(n, function(e) {
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
                return n(this, void 0, void 0, function() {
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
        a(i, e), i.prototype.universeInsightsGetUniverseInsightsRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var a, n, o;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling universeInsightsGetUniverseInsights.");
                            return a = {}, n = {}, [4, this.request({
                                path: "/v1/insights/universes/{universeId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/insights/universes/{universeId}",
                                method: "GET",
                                headers: n,
                                query: a
                            }, i)];
                        case 1:
                            return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    insightSummaries: e.insightSummaries.map(f),
                                    startTime: new Date(e.startTime),
                                    endTime: new Date(e.endTime)
                                }
                            })]
                    }
                })
            })
        }, i.prototype.universeInsightsGetUniverseInsights = function(e, t) {
            return n(this, void 0, void 0, function() {
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
            return n(this, void 0, void 0, function() {
                var a, n, o;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling universeInsightsSnoozeInsight.");
                            return a = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/insights/universes/{universeId}/snooze".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/insights/universes/{universeId}/snooze",
                                method: "POST",
                                headers: n,
                                query: a,
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
            return n(this, void 0, void 0, function() {
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
    }, "FeaturePermissionsApi", 0, M, "MetricGranularity", 0, {
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
    }, "UniverseAnalyticsAggregationsApi", 0, I])
}, 718389, e => {
    "use strict";
    e.s(["default", 0, function e(t) {
        let i = t;
        var a = ({}).toString.call(t).slice(8, -1);
        if ("Set" == a) return new Set([...t].map(t => e(t)));
        if ("Map" == a) return new Map([...t].map(t => [e(t[0]), e(t[1])]));
        if ("Date" == a) return new Date(t.getTime());
        if ("RegExp" == a) return RegExp(t.source, function(e) {
            if ("string" == typeof e.source.flags) return e.source.flags;
            var t = [];
            return e.global && t.push("g"), e.ignoreCase && t.push("i"), e.multiline && t.push("m"), e.sticky && t.push("y"), e.unicode && t.push("u"), t.join("")
        }(t));
        if ("Array" == a || "Object" == a)
            for (var n in i = Array.isArray(t) ? [] : {}, t) i[n] = e(t[n]);
        return i
    }])
}]);

//# debugId=d1499164-7015-6a31-d29e-5682abf9a373
//# sourceMappingURL=1ia02-7e7-3wt.js.map
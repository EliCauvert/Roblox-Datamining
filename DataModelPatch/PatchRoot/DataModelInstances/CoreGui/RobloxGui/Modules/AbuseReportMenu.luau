return {
	AbuseReportMenu = require(script.Components.AbuseReportMenuNew),
	AbuseReportMenuV2 = if require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).FFlagAbuseReportMenuV2 then require(script.V2.AbuseReportMenu) else nil,
	ReportAbuseAnalytics = require(script.Analytics.ReportAbuseAnalytics),
	["jest.config"] = script["jest.config"]
}
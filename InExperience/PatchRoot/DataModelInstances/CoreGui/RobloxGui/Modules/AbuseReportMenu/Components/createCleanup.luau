local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local _ = require(AbuseReportMenu.Components.Types)
local CorePackages = game:GetService("CorePackages")
local ConstantsModule = require(AbuseReportMenu.Components.Constants)
local ReportTypes = ConstantsModule.ReportTypes
local ReportAnythingAnalyticsModule = require(AbuseReportMenu.ReportAnything.Utility.ReportAnythingAnalytics)
local ReportAbuseAnalyticsModule = require(AbuseReportMenu.Analytics.ReportAbuseAnalytics)
local CollectAnalyticsParametersModule = require(AbuseReportMenu.Analytics.collectAnalyticsParameters)
local NewReportAbuseAnalytics = ReportAbuseAnalyticsModule.new(require(CorePackages.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest.new((game:GetService("EventIngestService"))), require(CorePackages.Workspace.Packages.Analytics).Analytics.new((game:GetService("RbxAnalyticsService"))).Diag, ReportAbuseAnalyticsModule.MenuContexts.NewMenu)

return function(p1, Callback, Callback1, Person) --[[ Line: 22 ]]
	-- upvalues: ReportTypes (copy), CollectAnalyticsParametersModule (copy), ReportAnythingAnalyticsModule (copy), NewReportAbuseAnalytics (copy), ConstantsModule (copy)
	return function(p2, Callback2: (any) -> ()) --[[ Line: 28 ]]
		-- upvalues: p1 (copy), Person (copy), ReportTypes (upval), CollectAnalyticsParametersModule (upval), ReportAnythingAnalyticsModule (upval), NewReportAbuseAnalytics (upval), ConstantsModule (upval), Callback (copy), Callback1 (copy)
		if p1.menuEverShown then
			NewReportAbuseAnalytics:reportInGameAbuseReportInteraction(if Person == ReportTypes.Person then CollectAnalyticsParametersModule.forPersonReport(p1, p2, ReportAnythingAnalyticsModule.getAccumulatedParameters()) else CollectAnalyticsParametersModule.forExperienceReport(p1, p2, ReportAnythingAnalyticsModule.getAccumulatedParameters()))
			Callback2({
				type = ConstantsModule.ReportAnythingActions.ClearAnnotationFlowProperties
			})
			Callback({ type = ConstantsModule.AnalyticsActions.Reset })
			ReportAnythingAnalyticsModule.clear()
			Callback1(nil)
			NewReportAbuseAnalytics:endAbuseReportSession()
			
			return
		end
	end
end
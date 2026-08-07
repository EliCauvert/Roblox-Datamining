local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local _ = require(abuseReportMenu.Components.Types)
local corePackagesService = game:GetService("CorePackages")
local constantsModule = require(abuseReportMenu.Components.Constants)
local reportTypes = constantsModule.ReportTypes
local eventIngestService = game:GetService("EventIngestService")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local reportAnythingAnalyticsModule = require(abuseReportMenu.ReportAnything.Utility.ReportAnythingAnalytics)
local eventIngest = require(corePackagesService.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest
local var6 = require(corePackagesService.Workspace.Packages.Analytics).Analytics.new(rbxAnalyticsService)
local reportAbuseAnalyticsModule = require(abuseReportMenu.Analytics.ReportAbuseAnalytics)
local collectAnalyticsParametersModule = require(abuseReportMenu.Analytics.collectAnalyticsParameters)
local var9 = reportAbuseAnalyticsModule.new(eventIngest.new(eventIngestService), var6.Diag, reportAbuseAnalyticsModule.MenuContexts.NewMenu)

return function(p0, p1, p2, p3) --[[ line: 22 ]]
	-- upvalues: reportTypes (ref), collectAnalyticsParametersModule (ref), reportAnythingAnalyticsModule (ref), var9 (ref), constantsModule (ref)
	return function(p4, p5) --[[ line: 28 ]]
		-- upvalues: p0 (ref), p3 (ref), reportTypes (copy), collectAnalyticsParametersModule (copy), reportAnythingAnalyticsModule (copy), var9 (copy), constantsModule (copy), p1 (ref), p2 (ref)
		if p0.menuEverShown then
			var9:reportInGameAbuseReportInteraction(if p3 == reportTypes.Person then collectAnalyticsParametersModule.forPersonReport(p0, p4, reportAnythingAnalyticsModule.getAccumulatedParameters()) else collectAnalyticsParametersModule.forExperienceReport(p0, p4, reportAnythingAnalyticsModule.getAccumulatedParameters()))
			p5({
				type = constantsModule.ReportAnythingActions.ClearAnnotationFlowProperties
			})
			p1({ type = constantsModule.AnalyticsActions.Reset })
			reportAnythingAnalyticsModule.clear()
			p2(nil)
			var9:endAbuseReportSession()
			
			return
		end
	end
end
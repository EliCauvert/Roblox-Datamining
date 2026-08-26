local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local _ = require(abuseReportMenu.Components.Types)
local corePackagesService = game:GetService("CorePackages")
local constantsModule = require(abuseReportMenu.Components.Constants)
local reportTypes = constantsModule.ReportTypes
local eventIngestService = game:GetService("EventIngestService")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local reportAnythingAnalyticsModule = require(abuseReportMenu.ReportAnything.Utility.ReportAnythingAnalytics)
local eventIngest = require(corePackagesService.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest
local var1 = require(corePackagesService.Workspace.Packages.Analytics).Analytics.new(rbxAnalyticsService)
local reportAbuseAnalyticsModule = require(abuseReportMenu.Analytics.ReportAbuseAnalytics)
local collectAnalyticsParametersModule = require(abuseReportMenu.Analytics.collectAnalyticsParameters)
local var2 = reportAbuseAnalyticsModule.new(eventIngest.new(eventIngestService), var1.Diag, reportAbuseAnalyticsModule.MenuContexts.NewMenu)

return function(p1, p2, p3, p4)
	-- upvalues: reportTypes (ref), collectAnalyticsParametersModule (ref), reportAnythingAnalyticsModule (ref), var2 (ref), constantsModule (ref)
	return function(p5, p6)
		-- upvalues: p1 (ref), p4 (ref), reportTypes (copy), collectAnalyticsParametersModule (copy), reportAnythingAnalyticsModule (copy), var2 (copy), constantsModule (copy), p2 (ref), p3 (ref)
		if p1.menuEverShown then
			var2:reportInGameAbuseReportInteraction(if p4 == reportTypes.Person then collectAnalyticsParametersModule.forPersonReport(p1, p5, reportAnythingAnalyticsModule.getAccumulatedParameters()) else collectAnalyticsParametersModule.forExperienceReport(p1, p5, reportAnythingAnalyticsModule.getAccumulatedParameters()))
			p6({
				type = constantsModule.ReportAnythingActions.ClearAnnotationFlowProperties
			})
			p2({ type = constantsModule.AnalyticsActions.Reset })
			reportAnythingAnalyticsModule.clear()
			p3(nil)
			var2:endAbuseReportSession()
			
			return
		end
	end
end
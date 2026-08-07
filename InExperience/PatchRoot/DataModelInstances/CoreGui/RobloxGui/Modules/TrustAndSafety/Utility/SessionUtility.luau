local sessionService = game:GetService("SessionService")
local parent = script.Parent.Parent
local constantsModule = require(parent.Resources.Constants)
local getFFlagEnableARFlowSessionModule = require(parent.Flags.GetFFlagEnableARFlowSession)
local sendAnalyticsModule = require(parent.Utility.SendAnalytics)

return {
	startAbuseReportSession = function(p0) --[[ line: 12 ]]
		-- upvalues: getFFlagEnableARFlowSessionModule (ref), sessionService (ref), constantsModule (ref), sendAnalyticsModule (ref)
		if getFFlagEnableARFlowSessionModule() then
			if not sessionService:SessionExists(constantsModule.Session.StructuralIdentifier.AbuseReport) then
				sessionService:SetSession(constantsModule.Session.StructuralIdentifier.Level1, constantsModule.Session.StructuralIdentifier.AbuseReport, constantsModule.Session.StructuralIdentifier.AbuseReport)
			end
			sessionService:SetMetadata(constantsModule.Session.StructuralIdentifier.AbuseReport, constantsModule.Session.Metadata.EntryPoint, p0)
			sessionService:SetMetadata(constantsModule.Session.StructuralIdentifier.AbuseReport, constantsModule.Session.Metadata.DeleteOnGameLeave, "True")
			sendAnalyticsModule(constantsModule.Analytics.ReportFlowOpened, constantsModule.Analytics.ReportFlowOpened, { source = p0 })
		end
	end,
	endAbuseReportSession = function() --[[ line: 43 ]]
		-- upvalues: getFFlagEnableARFlowSessionModule (ref), sessionService (ref), constantsModule (ref)
		if getFFlagEnableARFlowSessionModule() and sessionService:SessionExists(constantsModule.Session.StructuralIdentifier.AbuseReport) then
			sessionService:RemoveSession(constantsModule.Session.StructuralIdentifier.AbuseReport)
		end
	end
}
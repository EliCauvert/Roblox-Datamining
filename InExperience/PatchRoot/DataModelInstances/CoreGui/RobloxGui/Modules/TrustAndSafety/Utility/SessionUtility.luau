local SessionService = game:GetService("SessionService")
local Parent = script.Parent.Parent
local ConstantsModule = require(Parent.Resources.Constants)
local GetFFlagEnableARFlowSessionModule = require(Parent.Flags.GetFFlagEnableARFlowSession)
local SendAnalyticsModule = require(Parent.Utility.SendAnalytics)

return {
	startAbuseReportSession = function(Source) --[[ Line: 12 ]]
		-- upvalues: GetFFlagEnableARFlowSessionModule (copy), SessionService (copy), ConstantsModule (copy), SendAnalyticsModule (copy)
		if GetFFlagEnableARFlowSessionModule() then
			if not SessionService:SessionExists(ConstantsModule.Session.StructuralIdentifier.AbuseReport) then
				SessionService:SetSession(ConstantsModule.Session.StructuralIdentifier.Level1, ConstantsModule.Session.StructuralIdentifier.AbuseReport, ConstantsModule.Session.StructuralIdentifier.AbuseReport)
			end
			SessionService:SetMetadata(ConstantsModule.Session.StructuralIdentifier.AbuseReport, ConstantsModule.Session.Metadata.EntryPoint, Source)
			SessionService:SetMetadata(ConstantsModule.Session.StructuralIdentifier.AbuseReport, ConstantsModule.Session.Metadata.DeleteOnGameLeave, "True")
			SendAnalyticsModule(ConstantsModule.Analytics.ReportFlowOpened, ConstantsModule.Analytics.ReportFlowOpened, { source = Source })
		end
	end,
	endAbuseReportSession = function() --[[ Line: 43 ]]
		-- upvalues: GetFFlagEnableARFlowSessionModule (copy), SessionService (copy), ConstantsModule (copy)
		if GetFFlagEnableARFlowSessionModule() and SessionService:SessionExists(ConstantsModule.Session.StructuralIdentifier.AbuseReport) then
			SessionService:RemoveSession(ConstantsModule.Session.StructuralIdentifier.AbuseReport)
		end
	end
}
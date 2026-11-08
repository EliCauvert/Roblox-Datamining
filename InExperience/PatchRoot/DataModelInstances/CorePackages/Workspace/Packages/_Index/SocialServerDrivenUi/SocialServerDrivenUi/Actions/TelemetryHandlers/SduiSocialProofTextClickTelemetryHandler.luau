local SocialServerDrivenUi = script:FindFirstAncestor("SocialServerDrivenUi")
local SduiCoreSystemModule = require(SocialServerDrivenUi.Parent.SduiCoreSystem)
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local GetActionTelemetryFieldValueFunction = SduiCoreSystemModule.getActionTelemetryFieldValue
local FFlagSduiSocialProofTextAnalyticsModule = require(SocialServerDrivenUi.Flags.FFlagSduiSocialProofTextAnalytics)
local BuildSocialProofTextEventParamsModule = require(SocialServerDrivenUi.Analytics.SocialProofText.buildSocialProofTextEventParams)
local SendSocialProofTextClickedEventModule = require(SocialServerDrivenUi.Analytics.SocialProofText.sendSocialProofTextClickedEvent)

return function(p1, p2, p3)
	-- upvalues: FFlagSduiSocialProofTextAnalyticsModule (copy), BuildSocialProofTextEventParamsModule (copy), GetActionTelemetryFieldValueFunction (copy), SduiErrorType (copy), SendSocialProofTextClickedEventModule (copy)
	if not FFlagSduiSocialProofTextAnalyticsModule then return end
	local SocialProofTextEventParamsModule = BuildSocialProofTextEventParamsModule({
		universeId = GetActionTelemetryFieldValueFunction(p1, p2, "universeId"),
		placeId = GetActionTelemetryFieldValueFunction(p1, p2, "placeId"),
		totalConnections = GetActionTelemetryFieldValueFunction(p1, p2, "totalConnections"),
		users = p1 and (p1.actionParams and p1.actionParams.userIds),
		avatarMax = GetActionTelemetryFieldValueFunction(p1, p2, "avatarMax"),
		page = p3.appPage
	})
	
	if SocialProofTextEventParamsModule == nil then
		p3.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "SocialProofTextClick telemetry missing `universeId`"
		}, p3.appPage)
		
		return
	else
		SendSocialProofTextClickedEventModule(SocialProofTextEventParamsModule)
	end
end
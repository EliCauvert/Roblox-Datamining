local SocialServerDrivenUi = script:FindFirstAncestor("SocialServerDrivenUi")
local Parent = SocialServerDrivenUi.Parent
local SduiErrors = require(Parent.SduiCoreSystem).SduiErrors
local _ = require(Parent.UnifiedLogging)
local FFlagSduiSocialProofTextAnalyticsModule = require(SocialServerDrivenUi.Flags.FFlagSduiSocialProofTextAnalytics)
local BuildSocialProofTextEventParamsModule = require(SocialServerDrivenUi.Analytics.SocialProofText.buildSocialProofTextEventParams)
local SendSocialProofTextImpressionEventModule = require(SocialServerDrivenUi.Analytics.SocialProofText.sendSocialProofTextImpressionEvent)

return function(p1, List, p2, _, _)
	-- upvalues: FFlagSduiSocialProofTextAnalyticsModule (copy), BuildSocialProofTextEventParamsModule (copy), SendSocialProofTextImpressionEventModule (copy), SduiErrors (copy)
	if not FFlagSduiSocialProofTextAnalyticsModule then return end
	for _, value in List do
		local v1 = p2[value] or nil
		local SocialProofTextEventParamsModule = if v1 then BuildSocialProofTextEventParamsModule({
			universeId = v1.universeId,
			placeId = v1.placeId,
			totalConnections = v1.totalConnections,
			users = v1.connectionPlayedUsers,
			avatarMax = v1.avatarMax,
			page = p1.appPage
		}) else nil
		
		if SocialProofTextEventParamsModule then
			SendSocialProofTextImpressionEventModule(SocialProofTextEventParamsModule)
		else
			p1.dependencies.logger.reportError(SduiErrors.SduiErrorType.FailedToLogSocialProofTextImpressions, {
				name = "SduiSocialProofTextImpressionsHandler",
				message = `Missing universeId for impression index {value}`
			}, p1.appPage)
		end
	end
end
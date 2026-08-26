local squads = script:FindFirstAncestor("Squads")
local httpService = game:GetService("HttpService")
local abuseReportingModule = require(squads.Parent.AbuseReporting)
local _ = require(squads.Common.ModelTypes)
local dependenciesModule = require(squads.dependencies)
local loggerModule = require(squads.Logger)
local react = dependenciesModule.React
local defaultTwoStepReportFlow = abuseReportingModule.UXFlows.DefaultTwoStepReportFlow
local networkingSquads = dependenciesModule.NetworkingSquads
local useDispatch = dependenciesModule.Hooks.useDispatch
local list = {
	{
		localizationKey = "Feature.ReportAbuse.Label.CategoryInappropriate",
		value = "Swearing"
	},
	{
		localizationKey = "Feature.ReportAbuse.Label.CategoryBullyingV2",
		value = "Bullying"
	},
	{
		localizationKey = "Feature.ReportAbuse.Label.CategoryTheft",
		value = "Scamming"
	},
	{
		localizationKey = "Feature.ReportAbuse.Label.CategoryDating",
		value = "Dating"
	},
	{
		localizationKey = "Feature.ReportAbuse.Label.CategoryScamming",
		value = "Cheating/Exploiting"
	},
	{
		localizationKey = "Feature.ReportAbuse.Label.CategoryPrivateInfo",
		value = "Personal Question"
	}
}

return function(p1)
	-- upvalues: useDispatch (ref), react (ref), loggerModule (ref), httpService (ref), networkingSquads (ref), defaultTwoStepReportFlow (ref), list (ref)
	local var1 = useDispatch()
	
	return react.createElement(defaultTwoStepReportFlow, {
		analyticsContext = "Squad",
		onSubmitProps = {
			hasNextSteps = false,
			onSubmit = react.useCallback(function(p2, p3)
				-- upvalues: loggerModule (copy), httpService (copy), p1 (ref), var1 (ref), networkingSquads (copy)
				loggerModule:info("Submitting abuse report. Reason: {}, Comment: {}, Data: {}", p2, p3, httpService:JSONEncode(p1.reportData))
				local var2, var3 = var1(networkingSquads.SendSquadVoiceAbuseReport.API({
					submitterUserId = p1.reportData.submitterUserId,
					abuserUserId = p1.reportData.abuserUserId,
					reportBeginTimestampMs = p1.reportData.reportBeginTimestampMs,
					voiceChannelId = p1.reportData.voiceChannelId,
					voiceUserIds = p1.reportData.voiceUserIds,
					voiceUserCount = p1.reportData.voiceUserCount,
					abuseReason = p2,
					abuseComment = p3
				})):await()
				
				if var2 then
					loggerModule:info("Abuse report submitted successfully. Response: {}", httpService:JSONEncode(var3))
					
					return var2
				end
				loggerModule:error("Failed to submit abuse report. Response: {}", httpService:JSONEncode(var3))
				
				return var2
			end, { p1.reportData, var1 })
		},
		onCloseProps = { hasPreviousSteps = false, onAbandon = p1.onAbandon },
		onComplete = p1.onComplete,
		reportCategories = list
	})
end
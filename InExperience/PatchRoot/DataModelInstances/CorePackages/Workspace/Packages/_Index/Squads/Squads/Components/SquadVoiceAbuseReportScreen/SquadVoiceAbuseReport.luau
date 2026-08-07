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

return function(p0) --[[ line: 33 | named "SquadVoiceAbuseReport" ]]
	-- upvalues: useDispatch (ref), react (ref), loggerModule (ref), httpService (ref), networkingSquads (ref), defaultTwoStepReportFlow (ref), list (ref)
	local var6 = useDispatch()
	
	return react.createElement(defaultTwoStepReportFlow, {
		analyticsContext = "Squad",
		onSubmitProps = {
			hasNextSteps = false,
			onSubmit = react.useCallback(function(p1, p2) --[[ line: 35 ]]
				-- upvalues: loggerModule (copy), httpService (copy), p0 (ref), var6 (ref), networkingSquads (copy)
				loggerModule:info("Submitting abuse report. Reason: {}, Comment: {}, Data: {}", p1, p2, httpService:JSONEncode(p0.reportData))
				local var7, var8 = var6(networkingSquads.SendSquadVoiceAbuseReport.API({
					submitterUserId = p0.reportData.submitterUserId,
					abuserUserId = p0.reportData.abuserUserId,
					reportBeginTimestampMs = p0.reportData.reportBeginTimestampMs,
					voiceChannelId = p0.reportData.voiceChannelId,
					voiceUserIds = p0.reportData.voiceUserIds,
					voiceUserCount = p0.reportData.voiceUserCount,
					abuseReason = p1,
					abuseComment = p2
				})):await()
				
				if var7 then
					loggerModule:info("Abuse report submitted successfully. Response: {}", httpService:JSONEncode(var8))
					
					return var7
				end
				loggerModule:error("Failed to submit abuse report. Response: {}", httpService:JSONEncode(var8))
				
				return var7
			end, { p0.reportData, var6 })
		},
		onCloseProps = { hasPreviousSteps = false, onAbandon = p0.onAbandon },
		onComplete = p0.onComplete,
		reportCategories = list
	})
end
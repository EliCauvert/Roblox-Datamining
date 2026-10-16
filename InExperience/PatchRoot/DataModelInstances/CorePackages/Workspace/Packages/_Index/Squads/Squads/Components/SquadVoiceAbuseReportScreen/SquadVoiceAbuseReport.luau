local Squads = script:FindFirstAncestor("Squads")
local HttpService = game:GetService("HttpService")
local _ = require(Squads.Common.ModelTypes)
local DependenciesModule = require(Squads.dependencies)
local LoggerModule = require(Squads.Logger)
local React = DependenciesModule.React
local DefaultTwoStepReportFlow = require(Squads.Parent.AbuseReporting).UXFlows.DefaultTwoStepReportFlow
local NetworkingSquads = DependenciesModule.NetworkingSquads
local UseDispatchFunction = DependenciesModule.Hooks.useDispatch
local ReportCategories = {
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

return function(p1) --[[ Line: 33 | Named "SquadVoiceAbuseReport" ]]
	-- upvalues: UseDispatchFunction (copy), React (copy), LoggerModule (copy), HttpService (copy), NetworkingSquads (copy), DefaultTwoStepReportFlow (copy), ReportCategories (copy)
	local UseDispatchResult = UseDispatchFunction()
	
	return React.createElement(DefaultTwoStepReportFlow, {
		analyticsContext = "Squad",
		onSubmitProps = {
			hasNextSteps = false,
			onSubmit = React.useCallback(function(AbuseReason, AbuseComment) --[[ Line: 35 ]]
				-- upvalues: LoggerModule (upval), HttpService (upval), p1 (copy), UseDispatchResult (copy), NetworkingSquads (upval)
				LoggerModule:info("Submitting abuse report. Reason: {}, Comment: {}, Data: {}", AbuseReason, AbuseComment, HttpService:JSONEncode(p1.reportData))
				local v1, Input = UseDispatchResult(NetworkingSquads.SendSquadVoiceAbuseReport.API({
					submitterUserId = p1.reportData.submitterUserId,
					abuserUserId = p1.reportData.abuserUserId,
					reportBeginTimestampMs = p1.reportData.reportBeginTimestampMs,
					voiceChannelId = p1.reportData.voiceChannelId,
					voiceUserIds = p1.reportData.voiceUserIds,
					voiceUserCount = p1.reportData.voiceUserCount,
					abuseReason = AbuseReason,
					abuseComment = AbuseComment
				})):await()
				
				if v1 then
					LoggerModule:info("Abuse report submitted successfully. Response: {}", HttpService:JSONEncode(Input))
					
					return v1
				else
					LoggerModule:error("Failed to submit abuse report. Response: {}", HttpService:JSONEncode(Input))
					
					return v1
				end
			end, { p1.reportData, UseDispatchResult })
		},
		onCloseProps = { hasPreviousSteps = false, onAbandon = p1.onAbandon },
		onComplete = p1.onComplete,
		reportCategories = ReportCategories
	})
end
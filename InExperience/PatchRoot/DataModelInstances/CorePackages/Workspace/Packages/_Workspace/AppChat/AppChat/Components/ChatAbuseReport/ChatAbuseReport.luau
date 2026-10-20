local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local DefaultTwoStepReportFlow = require(Parent.AbuseReporting).UXFlows.DefaultTwoStepReportFlow
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local NewResult = require(AppChat.Logger):new(script.Name)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local Players = game:GetService("Players")
local ReportCategories = {
	{
		localizationKey = "Feature.ReportAbuse.Label.CategoryInappropriate",
		value = "ABUSE_TYPE_PROFANITY"
	},
	{
		localizationKey = "Feature.ReportAbuse.Label.CategoryPrivateInfo",
		value = "ABUSE_TYPE_PRIVACY_ASKING_FOR_PII"
	},
	{
		localizationKey = "Feature.ReportAbuse.Label.CategoryBullyingV2",
		value = "ABUSE_TYPE_HARASSMENT"
	},
	{
		localizationKey = "Feature.ReportAbuse.Label.CategoryDating",
		value = "ABUSE_TYPE_DATING_AND_ROMANTIC_CONTENT"
	},
	{
		localizationKey = "Feature.ReportAbuse.Label.CategoryScamming",
		value = "ABUSE_TYPE_CHEAT_AND_EXPLOITS"
	},
	{
		localizationKey = "Feature.ReportAbuse.Label.CategoryTheft",
		value = "ABUSE_TYPE_SCAMMING"
	},
	{
		localizationKey = "Feature.ReportAbuse.Label.CategoryContent",
		value = "ABUSE_TYPE_SEXUAL_CONTENT"
	},
	{
		localizationKey = "Feature.ReportAbuse.Label.CategoryThreats",
		value = "ABUSE_TYPE_REAL_LIFE_THREATS"
	},
	{
		localizationKey = "Feature.ReportAbuse.Label.CategoryOther",
		value = "ABUSE_TYPE_OTHER"
	}
}

local function _()
	-- upvalues: Players (copy)
	local LocalPlayer = Players.LocalPlayer
	
	return if LocalPlayer then LocalPlayer.UserId else 0
end

return function(p1)
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), AppChatNetworkingModule (copy), Players (copy), NewResult (copy), DefaultTwoStepReportFlow (copy), ReportCategories (copy)
	local UseDispatchResult = UseDispatchFunction()
	
	return ReactModule.createElement(DefaultTwoStepReportFlow, {
		analyticsContext = "AppChat",
		onSubmitProps = {
			hasNextSteps = false,
			onSubmit = ReactModule.useCallback(function(ReportCategory, Comment)
				-- upvalues: UseDispatchResult (copy), AppChatNetworkingModule (upval), p1 (copy), Players (upval), NewResult (upval)
				local LocalPlayer = Players.LocalPlayer
				local v1, v2 = UseDispatchResult(AppChatNetworkingModule.rodux.SubmitAppChatAbuseReport.API({
					comment = Comment,
					reportedUserId = p1.participantId,
					reportCategory = ReportCategory,
					conversationId = p1.conversationId,
					submitterUserId = if LocalPlayer then LocalPlayer.UserId else 0
				})):await()
				
				if v1 then
					NewResult:info("Abuse report submitted successfully. Response: {}", (tostring(v2)))
					
					return v1
				else
					NewResult:error("Failed to submit abuse report. Response: {}", (tostring(v2)))
					
					return v1
				end
			end, { UseDispatchResult, p1.conversationId, p1.participantId })
		},
		onCloseProps = { hasPreviousSteps = false, onAbandon = p1.onAbandon },
		onComplete = p1.onComplete,
		reportCategories = ReportCategories
	})
end
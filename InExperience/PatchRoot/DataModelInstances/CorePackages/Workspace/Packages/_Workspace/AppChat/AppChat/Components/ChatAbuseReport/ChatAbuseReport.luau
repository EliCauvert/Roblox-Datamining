local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local defaultTwoStepReportFlow = require(parent.AbuseReporting).UXFlows.DefaultTwoStepReportFlow
local appChatNetworkingModule = require(parent.AppChatNetworking)
local name = require(appChat.Logger):new(script.Name)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local playersService = game:GetService("Players")
local list = {
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

local function _() --[[ line: 44 | named "getLocalPlayerUserId" ]]
	-- upvalues: playersService (ref)
	local localPlayer = playersService.LocalPlayer
	
	return if localPlayer then localPlayer.UserId else 0
end

return function(p0) --[[ line: 49 | named "ChatAbuseReport" ]]
	-- upvalues: useDispatch (ref), reactModule (ref), appChatNetworkingModule (ref), playersService (ref), name (ref), defaultTwoStepReportFlow (ref), list (ref)
	local var6 = useDispatch()
	
	return reactModule.createElement(defaultTwoStepReportFlow, {
		analyticsContext = "AppChat",
		onSubmitProps = {
			hasNextSteps = false,
			onSubmit = reactModule.useCallback(function(p1, p2) --[[ line: 52 ]]
				-- upvalues: var6 (ref), appChatNetworkingModule (copy), p0 (ref), playersService (copy), name (copy)
				local API = appChatNetworkingModule.rodux.SubmitAppChatAbuseReport.API
				local t = {
					comment = p2,
					reportedUserId = p0.participantId,
					reportCategory = p1,
					conversationId = p0.conversationId
				}
				local localPlayer = playersService.LocalPlayer
				t.submitterUserId = if localPlayer then localPlayer.UserId else 0
				var8, API = var6(API(t)):await()
				
				if var8 then
					name:info("Abuse report submitted successfully. Response: {}", tostring(API))
					
					return var8
				end
				name:error("Failed to submit abuse report. Response: {}", tostring(API))
				
				return var8
			end, { var6, p0.conversationId, p0.participantId })
		},
		onCloseProps = { hasPreviousSteps = false, onAbandon = p0.onAbandon },
		onComplete = p0.onComplete,
		reportCategories = list
	})
end
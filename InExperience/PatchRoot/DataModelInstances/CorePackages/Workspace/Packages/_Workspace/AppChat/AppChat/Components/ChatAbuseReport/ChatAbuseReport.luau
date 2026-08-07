local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local defaultTwoStepReportFlow = require(parent.AbuseReporting).UXFlows.DefaultTwoStepReportFlow
local appChatNetworkingModule = require(parent.AppChatNetworking)
local fFlagAppChatUseAbuseReportingApi = require(appChat.Flags).FFlagAppChatUseAbuseReportingApi
local name = require(appChat.Logger):new(script.Name)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local playersService = game:GetService("Players")
local useChatPlacementContext = require(appChat.Contexts.ChatPlacementContext).useChatPlacementContext
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

local function _() --[[ line: 48 | named "getLocalPlayerUserId" ]]
	-- upvalues: playersService (ref)
	local localPlayer = playersService.LocalPlayer
	
	return if localPlayer then localPlayer.UserId else 0
end

return function(p0) --[[ line: 53 | named "ChatAbuseReport" ]]
	-- upvalues: useDispatch (ref), useChatPlacementContext (ref), reactModule (ref), fFlagAppChatUseAbuseReportingApi (ref), appChatNetworkingModule (ref), playersService (ref), name (ref), defaultTwoStepReportFlow (ref), list (ref)
	local var6 = useDispatch()
	local chatPlacement = useChatPlacementContext().chatPlacement
	
	return reactModule.createElement(defaultTwoStepReportFlow, {
		analyticsContext = "AppChat",
		onSubmitProps = {
			hasNextSteps = false,
			onSubmit = reactModule.useCallback(function(p1, p2) --[[ line: 58 ]]
				-- upvalues: p0 (ref), chatPlacement (ref), fFlagAppChatUseAbuseReportingApi (copy), var6 (ref), appChatNetworkingModule (copy), playersService (copy), name (copy)
				local var10, var11
				local t = {
					comment = p2,
					reportedUserId = p0.participantId,
					reportCategory = p1,
					conversationId = p0.conversationId,
					entryPoint = chatPlacement
				}
				local _ = nil
				local _ = nil
				
				if fFlagAppChatUseAbuseReportingApi then
					local API = appChatNetworkingModule.rodux.SubmitAppChatAbuseReport.API
					local t_1 = {
						comment = t.comment,
						reportedUserId = t.reportedUserId,
						reportCategory = t.reportCategory,
						conversationId = t.conversationId
					}
					local localPlayer = playersService.LocalPlayer
					t_1.submitterUserId = if localPlayer then localPlayer.UserId else 0
					var9, API = var6(API(t_1)):await()
					var10 = var9
					var11 = API
				else
					local var12, var13 = var6(appChatNetworkingModule.rodux.CreateChatAbuseReport.API(t)):await()
					var10 = var12
					var11 = var13
				end
				if var10 then
					name:info("Abuse report submitted successfully. Response: {}", tostring(var11))
					
					return var10
				end
				name:error("Failed to submit abuse report. Response: {}", tostring(var11))
				
				return var10
			end, { var6, p0.conversationId, p0.participantId, chatPlacement })
		},
		onCloseProps = { hasPreviousSteps = false, onAbandon = p0.onAbandon },
		onComplete = p0.onComplete,
		reportCategories = list
	})
end
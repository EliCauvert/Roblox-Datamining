local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local ConstantsModule = require(AbuseReportMenu.Components.Constants)
local TnSIXPWrapperModule = require(AbuseReportMenu.IXP.TnSIXPWrapper)
local Default = require(game:GetService("CoreGui").RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default

local function _(Player): boolean --[[ Line: 11 ]]
	-- upvalues: Default (copy)
	return Default:getRecentUsersInteractionData()[tostring(Player.UserId)] ~= nil
end

function handlePreselectedPlayer(Player: Player, p1, Callback: (any) -> (), Callback1: (any) -> ()) --[[ Line: 16 ]]
	-- upvalues: Default (copy), ConstantsModule (copy), TnSIXPWrapperModule (copy)
	if p1 and Default:getRecentUsersInteractionData()[tostring(Player.UserId)] ~= nil then
		Callback({
			type = ConstantsModule.PlayerMenuActions.UpdateMethodOfAbuse,
			methodOfAbuse = ConstantsModule.AbuseMethods.VoiceChat
		})
		Callback1({
			type = ConstantsModule.AnalyticsActions.SetTypeOfAbuseSelection,
			selection = ConstantsModule.AbuseMethods.VoiceChat
		})
		Callback1({
			type = ConstantsModule.AnalyticsActions.SetPreselectedAbuseSelection,
			selection = ConstantsModule.AbuseMethods.VoiceChat
		})
	elseif TnSIXPWrapperModule.getReportAnythingAvatarEnabled() then
		Callback({
			type = ConstantsModule.PlayerMenuActions.UpdateMethodOfAbuse,
			methodOfAbuse = ConstantsModule.AbuseMethods.TextChat
		})
		Callback1({
			type = ConstantsModule.AnalyticsActions.SetTypeOfAbuseSelection,
			selection = ConstantsModule.AbuseMethods.TextChat
		})
		Callback1({
			type = ConstantsModule.AnalyticsActions.SetPreselectedAbuseSelection,
			selection = ConstantsModule.AbuseMethods.TextChat
		})
	else
		Callback1({
			selection = "None",
			type = ConstantsModule.AnalyticsActions.SetPreselectedAbuseSelection
		})
	end
	Callback({
		type = ConstantsModule.PlayerMenuActions.SetPreselectedPlayer,
		player = Player
	})
end

return handlePreselectedPlayer
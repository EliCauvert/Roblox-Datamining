local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local ConstantsModule = require(AbuseReportMenu.Components.Constants)
local TnSIXPWrapperModule = require(AbuseReportMenu.IXP.TnSIXPWrapper)
local FFlagAddPreselectedAbuseTypeAnalytics = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).FFlagAddPreselectedAbuseTypeAnalytics
local Default = require(game:GetService("CoreGui").RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default

local function _(Player): boolean
	-- upvalues: Default (copy)
	return Default:getRecentUsersInteractionData()[tostring(Player.UserId)] ~= nil
end

function handlePreselectedPlayer(Player: Player, p1, Callback: (any) -> (), Callback1: (any) -> ())
	-- upvalues: Default (copy), ConstantsModule (copy), FFlagAddPreselectedAbuseTypeAnalytics (copy), TnSIXPWrapperModule (copy)
	if p1 and Default:getRecentUsersInteractionData()[tostring(Player.UserId)] ~= nil then
		Callback({
			type = ConstantsModule.PlayerMenuActions.UpdateMethodOfAbuse,
			methodOfAbuse = ConstantsModule.AbuseMethods.VoiceChat
		})
		Callback1({
			type = ConstantsModule.AnalyticsActions.SetTypeOfAbuseSelection,
			selection = ConstantsModule.AbuseMethods.VoiceChat
		})
		
		if FFlagAddPreselectedAbuseTypeAnalytics then
			Callback1({
				type = ConstantsModule.AnalyticsActions.SetPreselectedAbuseSelection,
				selection = ConstantsModule.AbuseMethods.VoiceChat
			})
		end
	elseif TnSIXPWrapperModule.getReportAnythingAvatarEnabled() then
		Callback({
			type = ConstantsModule.PlayerMenuActions.UpdateMethodOfAbuse,
			methodOfAbuse = ConstantsModule.AbuseMethods.TextChat
		})
		Callback1({
			type = ConstantsModule.AnalyticsActions.SetTypeOfAbuseSelection,
			selection = ConstantsModule.AbuseMethods.TextChat
		})
		
		if FFlagAddPreselectedAbuseTypeAnalytics then
			Callback1({
				type = ConstantsModule.AnalyticsActions.SetPreselectedAbuseSelection,
				selection = ConstantsModule.AbuseMethods.TextChat
			})
		end
	elseif FFlagAddPreselectedAbuseTypeAnalytics then
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
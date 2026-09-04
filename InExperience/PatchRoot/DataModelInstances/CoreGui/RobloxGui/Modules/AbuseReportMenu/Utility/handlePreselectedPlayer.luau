local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local robloxGui = game:GetService("CoreGui").RobloxGui
local constantsModule = require(abuseReportMenu.Components.Constants)
local tnSIXPWrapperModule = require(abuseReportMenu.IXP.TnSIXPWrapper)
local default = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default

local _ = function(p1)
	-- upvalues: default (ref)
	return default:getRecentUsersInteractionData()[tostring(p1.UserId)] ~= nil
end

function handlePreselectedPlayer(p1, p2, p3, p4)
	-- upvalues: default (ref), constantsModule (ref), tnSIXPWrapperModule (ref)
	if p2 and default:getRecentUsersInteractionData()[tostring(p1.UserId)] ~= nil then
		p3({
			type = constantsModule.PlayerMenuActions.UpdateMethodOfAbuse,
			methodOfAbuse = constantsModule.AbuseMethods.VoiceChat
		})
		p4({
			type = constantsModule.AnalyticsActions.SetTypeOfAbuseSelection,
			selection = constantsModule.AbuseMethods.VoiceChat
		})
		p4({
			type = constantsModule.AnalyticsActions.SetPreselectedAbuseSelection,
			selection = constantsModule.AbuseMethods.VoiceChat
		})
	elseif tnSIXPWrapperModule.getReportAnythingAvatarEnabled() then
		p3({
			type = constantsModule.PlayerMenuActions.UpdateMethodOfAbuse,
			methodOfAbuse = constantsModule.AbuseMethods.TextChat
		})
		p4({
			type = constantsModule.AnalyticsActions.SetTypeOfAbuseSelection,
			selection = constantsModule.AbuseMethods.TextChat
		})
		p4({
			type = constantsModule.AnalyticsActions.SetPreselectedAbuseSelection,
			selection = constantsModule.AbuseMethods.TextChat
		})
	else
		p4({
			selection = "None",
			type = constantsModule.AnalyticsActions.SetPreselectedAbuseSelection
		})
	end
	p3({
		type = constantsModule.PlayerMenuActions.SetPreselectedPlayer,
		player = p1
	})
end

return handlePreselectedPlayer
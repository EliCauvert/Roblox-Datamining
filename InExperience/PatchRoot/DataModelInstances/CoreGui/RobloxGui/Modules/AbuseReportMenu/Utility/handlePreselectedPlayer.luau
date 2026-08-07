local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui").RobloxGui
local constantsModule = require(abuseReportMenu.Components.Constants)
local tnSIXPWrapperModule = require(abuseReportMenu.IXP.TnSIXPWrapper)
local fFlagAddPreselectedAbuseTypeAnalytics = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagAddPreselectedAbuseTypeAnalytics
local default = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default

local _ = function(p0) --[[ line: 14 ]]
	-- upvalues: default (ref)
	return default:getRecentUsersInteractionData()[tostring(p0.UserId)] ~= nil
end

function handlePreselectedPlayer(p1, p2, p3, p4) --[[ line: 19 ]]
	-- upvalues: default (ref), constantsModule (ref), fFlagAddPreselectedAbuseTypeAnalytics (ref), tnSIXPWrapperModule (ref)
	if p2 and default:getRecentUsersInteractionData()[tostring(p1.UserId)] ~= nil then
		p3({
			type = constantsModule.PlayerMenuActions.UpdateMethodOfAbuse,
			methodOfAbuse = constantsModule.AbuseMethods.VoiceChat
		})
		p4({
			type = constantsModule.AnalyticsActions.SetTypeOfAbuseSelection,
			selection = constantsModule.AbuseMethods.VoiceChat
		})
		
		if fFlagAddPreselectedAbuseTypeAnalytics then
			p4({
				type = constantsModule.AnalyticsActions.SetPreselectedAbuseSelection,
				selection = constantsModule.AbuseMethods.VoiceChat
			})
		end
	elseif tnSIXPWrapperModule.getReportAnythingAvatarEnabled() then
		p3({
			type = constantsModule.PlayerMenuActions.UpdateMethodOfAbuse,
			methodOfAbuse = constantsModule.AbuseMethods.TextChat
		})
		p4({
			type = constantsModule.AnalyticsActions.SetTypeOfAbuseSelection,
			selection = constantsModule.AbuseMethods.TextChat
		})
		
		if fFlagAddPreselectedAbuseTypeAnalytics then
			p4({
				type = constantsModule.AnalyticsActions.SetPreselectedAbuseSelection,
				selection = constantsModule.AbuseMethods.TextChat
			})
		end
	elseif fFlagAddPreselectedAbuseTypeAnalytics then
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
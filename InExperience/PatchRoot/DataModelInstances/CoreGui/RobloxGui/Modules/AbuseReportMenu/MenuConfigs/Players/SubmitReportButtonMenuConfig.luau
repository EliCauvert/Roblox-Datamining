local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local robloxGui = game:GetService("CoreGui").RobloxGui
local _ = require(abuseReportMenu.Components.Types)
local getToastMessageFromAbuseReasonModule = require(abuseReportMenu.MenuConfigs.getToastMessageFromAbuseReason)
local createVoiceAbuseReportRequestModule = require(robloxGui.Modules.VoiceChat.createVoiceAbuseReportRequest)
local default = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local abuseReportBuilderModule = require(abuseReportMenu.ReportAnything.Utility.AbuseReportBuilder)
local reportAbuseAnalyticsModule = require(abuseReportMenu.Analytics.ReportAbuseAnalytics)
local constantsModule = require(abuseReportMenu.Components.Constants)
local tnSIXPWrapperModule = require(abuseReportMenu.IXP.TnSIXPWrapper)
local cryoModule = require(corePackagesService.Packages.Cryo)
local submitChatLineReportModule = require(abuseReportMenu.Utility.submitChatLineReport)
local fFlagInGameMenuAddChatLineReporting = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagInGameMenuAddChatLineReporting

function isEligibleForVoiceSubmit(p0, p1) --[[ line: 22 ]]
	-- upvalues: playersService (ref)
	return p0.allegedAbuser ~= nil and (p0.allegedAbuserId ~= nil and (p0.abuseReason ~= nil and (p0.methodOfAbuse ~= nil and (p1.analyticsState.menuOpenedUnixTimestampMilliseconds ~= nil and playersService.LocalPlayer ~= nil))))
end

function isEligibleForRAOtherSubmit(p2) --[[ line: 31 ]]
	-- upvalues: playersService (ref)
	return p2.allegedAbuser ~= nil and (p2.allegedAbuserId ~= nil and (p2.abuseReason ~= nil and playersService.LocalPlayer ~= nil))
end

function isEligibleForTextSubmit(p3) --[[ line: 37 ]]
	-- upvalues: fFlagInGameMenuAddChatLineReporting (ref)
	return if fFlagInGameMenuAddChatLineReporting then if p3.selectedMessage == nil then false else p3.abuseReason ~= nil else p3.allegedAbuser ~= nil and p3.abuseReason ~= nil
end

return {
	componentType = "button",
	variant = "primary",
	fieldLabel = "",
	componentName = "SubmitButton",
	getIsVisible = function(_) --[[ line: 48 ]]
		return true
	end,
	getIconSrc = function(_) --[[ line: 52 ]]
		return ""
	end,
	getButtonLabel = function(_) --[[ line: 55 ]]
		return "SubmitButton"
	end,
	getIsDisabled = function(p4, p5) --[[ line: 58 ]]
		-- upvalues: constantsModule (ref), tnSIXPWrapperModule (ref)
		local methodOfAbuse = p4.methodOfAbuse
		
		return if methodOfAbuse == constantsModule.AbuseMethods.VoiceChat then not isEligibleForVoiceSubmit(p4, p5) elseif methodOfAbuse == constantsModule.AbuseMethods.TextChat or methodOfAbuse == nil or methodOfAbuse == constantsModule.AbuseMethods.Other and not tnSIXPWrapperModule.getReportAnythingAvatarEnabled() then not isEligibleForTextSubmit(p4) else (methodOfAbuse == constantsModule.AbuseMethods.Other or methodOfAbuse == constantsModule.AbuseMethods.Avatar) and not isEligibleForRAOtherSubmit(p4)
	end,
	onClick = function(p6, _, p7) --[[ line: 73 ]]
		-- upvalues: constantsModule (ref), createVoiceAbuseReportRequestModule (ref), playersService (ref), default (ref), cryoModule (ref), tnSIXPWrapperModule (ref), fFlagInGameMenuAddChatLineReporting (ref), submitChatLineReportModule (ref), getToastMessageFromAbuseReasonModule (ref), abuseReportBuilderModule (ref), reportAbuseAnalyticsModule (ref)
		local allegedAbuser = p6.allegedAbuser
		local allegedAbuserId = p6.allegedAbuserId
		local abuseReason = p6.abuseReason
		local methodOfAbuse = p6.methodOfAbuse
		local menuOpenedUnixTimestampMilliseconds = p7.analyticsState.menuOpenedUnixTimestampMilliseconds
		
		if methodOfAbuse == constantsModule.AbuseMethods.VoiceChat then
			if isEligibleForVoiceSubmit(p6, p7) then
				pcall(function() --[[ line: 86 ]]
					-- upvalues: createVoiceAbuseReportRequestModule (copy), playersService (copy), default (copy), allegedAbuserId (ref), p6 (ref), abuseReason (ref), menuOpenedUnixTimestampMilliseconds (ref), cryoModule (copy), constantsModule (copy), p7 (ref), allegedAbuser (ref)
					task.spawn(function() --[[ line: 87 ]]
						-- upvalues: createVoiceAbuseReportRequestModule (copy), playersService (copy), default (copy), allegedAbuserId (copy), p6 (copy), abuseReason (copy), menuOpenedUnixTimestampMilliseconds (copy), cryoModule (copy), constantsModule (copy), p7 (copy), allegedAbuser (copy)
						playersService:ReportAbuseV3(playersService.LocalPlayer, createVoiceAbuseReportRequestModule(playersService, default, {
							localUserId = playersService.LocalPlayer.UserId,
							abuserUserId = allegedAbuserId,
							abuseComment = p6.comment,
							abuseReason = abuseReason,
							inExpMenuOpenedUnixMilli = menuOpenedUnixTimestampMilliseconds,
							sortedPlayerListUserIds = cryoModule.List.map(p6.playerObjects, function(p8) --[[ line: 94 ]]
								return p8.UserId
							end),
							abuseVector = constantsModule.AbuseVector.Voice
						}))
						p7.analyticsDispatch({
							type = constantsModule.AnalyticsActions.SetSubmissionCompleted
						})
						p7.showReportSentPage(allegedAbuser)
					end)
				end)
				
				return
			end
		elseif methodOfAbuse == constantsModule.AbuseMethods.TextChat or methodOfAbuse == constantsModule.AbuseMethods.Other and not tnSIXPWrapperModule.getReportAnythingAvatarEnabled() or methodOfAbuse == nil then
			if not isEligibleForTextSubmit(p6) then return end
			if fFlagInGameMenuAddChatLineReporting and p6.selectedMessage then
				submitChatLineReportModule({
					localPlayerUserId = playersService.LocalPlayer.UserId,
					abuserUserId = p6.selectedMessage.userId,
					abuseReason = abuseReason,
					selectedMessage = p6.selectedMessage,
					abuseDescription = p6.comment,
					orderedMessages = p6.orderedMessages,
					reportTargetUser = p6.selectedMessage.userId
				})
			else
				spawn(function() --[[ line: 125 ]]
					-- upvalues: playersService (copy), allegedAbuser (ref), abuseReason (ref), p6 (ref)
					playersService:ReportAbuse(allegedAbuser, abuseReason, p6.comment)
				end)
			end
			p7.analyticsDispatch({
				type = constantsModule.AnalyticsActions.SetSubmissionCompleted
			})
			p7.onReportComplete(getToastMessageFromAbuseReasonModule(abuseReason))
			
			return
		elseif (methodOfAbuse == constantsModule.AbuseMethods.Other or methodOfAbuse == constantsModule.AbuseMethods.Avatar) and isEligibleForRAOtherSubmit(p6) then
			pcall(function() --[[ line: 135 ]]
				-- upvalues: abuseReportBuilderModule (copy), playersService (copy), allegedAbuserId (ref), p6 (ref), abuseReason (ref), reportAbuseAnalyticsModule (copy), p7 (ref), methodOfAbuse (ref), constantsModule (copy), getToastMessageFromAbuseReasonModule (copy)
				task.spawn(function() --[[ line: 136 ]]
					-- upvalues: abuseReportBuilderModule (copy), playersService (copy), allegedAbuserId (copy), p6 (copy), abuseReason (copy), reportAbuseAnalyticsModule (copy), p7 (copy), methodOfAbuse (copy), constantsModule (copy), getToastMessageFromAbuseReasonModule (copy)
					local var11 = abuseReportBuilderModule.buildOtherReportRequest({
						localUserId = playersService.LocalPlayer.UserId,
						formSelectedAbuserUserId = allegedAbuserId,
						abuseComment = p6.comment,
						abuseReason = abuseReason,
						menuEntryPoint = reportAbuseAnalyticsModule:getAbuseReportSessionEntryPoint(),
						variant = abuseReportBuilderModule.Constants.Variant.NM
					}, p7.reportAnythingState, p7.reportAnythingAnalytics.getAccumulatedParameters())
					
					if game:GetEngineFeature("WHAM2165") and methodOfAbuse == constantsModule.AbuseMethods.Avatar then
						playersService:ReportAvatarAbuse(allegedAbuserId, var11)
					else
						playersService:ReportAbuseV3(playersService.LocalPlayer, var11)
					end
					p7.analyticsDispatch({
						type = constantsModule.AnalyticsActions.SetSubmissionCompleted
					})
					p7.onReportComplete(getToastMessageFromAbuseReasonModule(abuseReason, true))
				end)
			end)
		end
	end
}
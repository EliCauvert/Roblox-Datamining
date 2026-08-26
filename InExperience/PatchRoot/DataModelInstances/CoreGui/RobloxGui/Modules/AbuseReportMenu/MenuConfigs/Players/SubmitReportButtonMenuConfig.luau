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

function isEligibleForVoiceSubmit(p1, p2)
	-- upvalues: playersService (ref)
	return p1.allegedAbuser ~= nil and (p1.allegedAbuserId ~= nil and (p1.abuseReason ~= nil and (p1.methodOfAbuse ~= nil and (p2.analyticsState.menuOpenedUnixTimestampMilliseconds ~= nil and playersService.LocalPlayer ~= nil))))
end

function isEligibleForRAOtherSubmit(p1)
	-- upvalues: playersService (ref)
	return p1.allegedAbuser ~= nil and (p1.allegedAbuserId ~= nil and (p1.abuseReason ~= nil and playersService.LocalPlayer ~= nil))
end

function isEligibleForTextSubmit(p1)
	return p1.allegedAbuser ~= nil and p1.abuseReason ~= nil
end

return {
	componentType = "button",
	variant = "primary",
	fieldLabel = "",
	componentName = "SubmitButton",
	getIsVisible = function(_)
		return true
	end,
	getIconSrc = function(_)
		return ""
	end,
	getButtonLabel = function(_)
		return "SubmitButton"
	end,
	getIsDisabled = function(p1, p2)
		-- upvalues: constantsModule (ref), tnSIXPWrapperModule (ref)
		local methodOfAbuse = p1.methodOfAbuse
		
		return if methodOfAbuse == constantsModule.AbuseMethods.VoiceChat then not isEligibleForVoiceSubmit(p1, p2) elseif methodOfAbuse == constantsModule.AbuseMethods.TextChat or methodOfAbuse == nil or methodOfAbuse == constantsModule.AbuseMethods.Other and not tnSIXPWrapperModule.getReportAnythingAvatarEnabled() then not isEligibleForTextSubmit(p1) else (methodOfAbuse == constantsModule.AbuseMethods.Other or methodOfAbuse == constantsModule.AbuseMethods.Avatar) and not isEligibleForRAOtherSubmit(p1)
	end,
	onClick = function(p1, _, p2)
		-- upvalues: constantsModule (ref), createVoiceAbuseReportRequestModule (ref), playersService (ref), default (ref), cryoModule (ref), tnSIXPWrapperModule (ref), getToastMessageFromAbuseReasonModule (ref), abuseReportBuilderModule (ref), reportAbuseAnalyticsModule (ref)
		local allegedAbuser = p1.allegedAbuser
		local allegedAbuserId = p1.allegedAbuserId
		local abuseReason = p1.abuseReason
		local methodOfAbuse = p1.methodOfAbuse
		local menuOpenedUnixTimestampMilliseconds = p2.analyticsState.menuOpenedUnixTimestampMilliseconds
		
		if methodOfAbuse == constantsModule.AbuseMethods.VoiceChat then
			if isEligibleForVoiceSubmit(p1, p2) then
				pcall(function()
					-- upvalues: createVoiceAbuseReportRequestModule (copy), playersService (copy), default (copy), allegedAbuserId (ref), p1 (ref), abuseReason (ref), menuOpenedUnixTimestampMilliseconds (ref), cryoModule (copy), constantsModule (copy), p2 (ref), allegedAbuser (ref)
					task.spawn(function()
						-- upvalues: createVoiceAbuseReportRequestModule (copy), playersService (copy), default (copy), allegedAbuserId (copy), p1 (copy), abuseReason (copy), menuOpenedUnixTimestampMilliseconds (copy), cryoModule (copy), constantsModule (copy), p2 (copy), allegedAbuser (copy)
						playersService:ReportAbuseV3(playersService.LocalPlayer, createVoiceAbuseReportRequestModule(playersService, default, {
							localUserId = playersService.LocalPlayer.UserId,
							abuserUserId = allegedAbuserId,
							abuseComment = p1.comment,
							abuseReason = abuseReason,
							inExpMenuOpenedUnixMilli = menuOpenedUnixTimestampMilliseconds,
							sortedPlayerListUserIds = cryoModule.List.map(p1.playerObjects, function(p3)
								return p3.UserId
							end),
							abuseVector = constantsModule.AbuseVector.Voice
						}))
						p2.analyticsDispatch({
							type = constantsModule.AnalyticsActions.SetSubmissionCompleted
						})
						p2.showReportSentPage(allegedAbuser)
					end)
				end)
				
				return
			end
		elseif methodOfAbuse == constantsModule.AbuseMethods.TextChat or methodOfAbuse == constantsModule.AbuseMethods.Other and not tnSIXPWrapperModule.getReportAnythingAvatarEnabled() or methodOfAbuse == nil then
			if isEligibleForTextSubmit(p1) then
				spawn(function()
					-- upvalues: playersService (copy), allegedAbuser (ref), abuseReason (ref), p1 (ref)
					playersService:ReportAbuse(allegedAbuser, abuseReason, p1.comment)
				end)
				p2.analyticsDispatch({
					type = constantsModule.AnalyticsActions.SetSubmissionCompleted
				})
				p2.onReportComplete(getToastMessageFromAbuseReasonModule(abuseReason))
				
				return
			end
		elseif (methodOfAbuse == constantsModule.AbuseMethods.Other or methodOfAbuse == constantsModule.AbuseMethods.Avatar) and isEligibleForRAOtherSubmit(p1) then
			pcall(function()
				-- upvalues: abuseReportBuilderModule (copy), playersService (copy), allegedAbuserId (ref), p1 (ref), abuseReason (ref), reportAbuseAnalyticsModule (copy), p2 (ref), methodOfAbuse (ref), constantsModule (copy), getToastMessageFromAbuseReasonModule (copy)
				task.spawn(function()
					-- upvalues: abuseReportBuilderModule (copy), playersService (copy), allegedAbuserId (copy), p1 (copy), abuseReason (copy), reportAbuseAnalyticsModule (copy), p2 (copy), methodOfAbuse (copy), constantsModule (copy), getToastMessageFromAbuseReasonModule (copy)
					local var1 = abuseReportBuilderModule.buildOtherReportRequest({
						localUserId = playersService.LocalPlayer.UserId,
						formSelectedAbuserUserId = allegedAbuserId,
						abuseComment = p1.comment,
						abuseReason = abuseReason,
						menuEntryPoint = reportAbuseAnalyticsModule:getAbuseReportSessionEntryPoint(),
						variant = abuseReportBuilderModule.Constants.Variant.NM
					}, p2.reportAnythingState, p2.reportAnythingAnalytics.getAccumulatedParameters())
					
					if game:GetEngineFeature("WHAM2165") and methodOfAbuse == constantsModule.AbuseMethods.Avatar then
						playersService:ReportAvatarAbuse(allegedAbuserId, var1)
					else
						playersService:ReportAbuseV3(playersService.LocalPlayer, var1)
					end
					p2.analyticsDispatch({
						type = constantsModule.AnalyticsActions.SetSubmissionCompleted
					})
					p2.onReportComplete(getToastMessageFromAbuseReasonModule(abuseReason, true))
				end)
			end)
		end
	end
}
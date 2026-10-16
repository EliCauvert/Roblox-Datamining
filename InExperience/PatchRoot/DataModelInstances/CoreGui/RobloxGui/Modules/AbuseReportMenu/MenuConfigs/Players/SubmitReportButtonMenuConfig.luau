local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local Players = game:GetService("Players")
local RobloxGui = game:GetService("CoreGui").RobloxGui
local _ = require(AbuseReportMenu.Components.Types)
local GetToastMessageFromAbuseReasonModule = require(AbuseReportMenu.MenuConfigs.getToastMessageFromAbuseReason)
local CreateVoiceAbuseReportRequestModule = require(RobloxGui.Modules.VoiceChat.createVoiceAbuseReportRequest)
local Default = require(RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local AbuseReportBuilderModule = require(AbuseReportMenu.ReportAnything.Utility.AbuseReportBuilder)
local ReportAbuseAnalyticsModule = require(AbuseReportMenu.Analytics.ReportAbuseAnalytics)
local ConstantsModule = require(AbuseReportMenu.Components.Constants)
local TnSIXPWrapperModule = require(AbuseReportMenu.IXP.TnSIXPWrapper)
local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)

function isEligibleForVoiceSubmit(p1, p2): boolean --[[ Line: 17 ]]
	-- upvalues: Players (copy)
	return p1.allegedAbuser ~= nil and (p1.allegedAbuserId ~= nil and (p1.abuseReason ~= nil and (p1.methodOfAbuse ~= nil and (p2.analyticsState.menuOpenedUnixTimestampMilliseconds ~= nil and Players.LocalPlayer ~= nil))))
end

function isEligibleForRAOtherSubmit(p1): boolean --[[ Line: 26 ]]
	-- upvalues: Players (copy)
	return p1.allegedAbuser ~= nil and (p1.allegedAbuserId ~= nil and (p1.abuseReason ~= nil and Players.LocalPlayer ~= nil))
end

function isEligibleForTextSubmit(p1): boolean --[[ Line: 32 ]]
	return p1.allegedAbuser ~= nil and p1.abuseReason ~= nil
end

return {
	componentType = "button",
	variant = "primary",
	fieldLabel = "",
	componentName = "SubmitButton",
	getIsVisible = function(_): boolean --[[ Line: 38 ]]
		return true
	end,
	getIconSrc = function(_): string --[[ Line: 42 ]]
		return ""
	end,
	getButtonLabel = function(_): string --[[ Line: 45 ]]
		return "SubmitButton"
	end,
	getIsDisabled = function(p1, p2): boolean --[[ Line: 48 ]]
		-- upvalues: ConstantsModule (copy), TnSIXPWrapperModule (copy)
		local MethodOfAbuse = p1.methodOfAbuse
		
		return if MethodOfAbuse == ConstantsModule.AbuseMethods.VoiceChat then not isEligibleForVoiceSubmit(p1, p2) elseif MethodOfAbuse == ConstantsModule.AbuseMethods.TextChat or MethodOfAbuse == nil or MethodOfAbuse == ConstantsModule.AbuseMethods.Other and not TnSIXPWrapperModule.getReportAnythingAvatarEnabled() then not isEligibleForTextSubmit(p1) else (MethodOfAbuse == ConstantsModule.AbuseMethods.Other or MethodOfAbuse == ConstantsModule.AbuseMethods.Avatar) and not isEligibleForRAOtherSubmit(p1)
	end,
	onClick = function(p1, _, p2) --[[ Line: 63 ]]
		-- upvalues: ConstantsModule (copy), CreateVoiceAbuseReportRequestModule (copy), Players (copy), Default (copy), CryoModule (copy), TnSIXPWrapperModule (copy), GetToastMessageFromAbuseReasonModule (copy), AbuseReportBuilderModule (copy), ReportAbuseAnalyticsModule (copy)
		local AllegedAbuser = p1.allegedAbuser
		local AllegedAbuserId = p1.allegedAbuserId
		local AbuseReason = p1.abuseReason
		local MethodOfAbuse = p1.methodOfAbuse
		local MenuOpenedUnixTimestampMilliseconds = p2.analyticsState.menuOpenedUnixTimestampMilliseconds
		
		if MethodOfAbuse == ConstantsModule.AbuseMethods.VoiceChat then
			if isEligibleForVoiceSubmit(p1, p2) then
				pcall(function() --[[ Line: 76 ]]
					-- upvalues: CreateVoiceAbuseReportRequestModule (upval), Players (upval), Default (upval), AllegedAbuserId (copy), p1 (copy), AbuseReason (copy), MenuOpenedUnixTimestampMilliseconds (copy), CryoModule (upval), ConstantsModule (upval), p2 (copy), AllegedAbuser (copy)
					task.spawn(function() --[[ Line: 77 ]]
						-- upvalues: CreateVoiceAbuseReportRequestModule (upval), Players (upval), Default (upval), AllegedAbuserId (upval), p1 (upval), AbuseReason (upval), MenuOpenedUnixTimestampMilliseconds (upval), CryoModule (upval), ConstantsModule (upval), p2 (upval), AllegedAbuser (upval)
						Players:ReportAbuseV3(Players.LocalPlayer, (CreateVoiceAbuseReportRequestModule(Players, Default, {
							localUserId = Players.LocalPlayer.UserId,
							abuserUserId = AllegedAbuserId,
							abuseComment = p1.comment,
							abuseReason = AbuseReason,
							inExpMenuOpenedUnixMilli = MenuOpenedUnixTimestampMilliseconds,
							sortedPlayerListUserIds = CryoModule.List.map(p1.playerObjects, function(Player) --[[ Line: 84 ]]
								return Player.UserId
							end),
							abuseVector = ConstantsModule.AbuseVector.Voice
						})))
						p2.analyticsDispatch({
							type = ConstantsModule.AnalyticsActions.SetSubmissionCompleted
						})
						p2.showReportSentPage(AllegedAbuser)
					end)
				end)
				
				return
			end
		elseif MethodOfAbuse == ConstantsModule.AbuseMethods.TextChat or MethodOfAbuse == ConstantsModule.AbuseMethods.Other and not TnSIXPWrapperModule.getReportAnythingAvatarEnabled() or MethodOfAbuse == nil then
			if isEligibleForTextSubmit(p1) then
				spawn(function() --[[ Line: 104 ]]
					-- upvalues: Players (upval), AllegedAbuser (copy), AbuseReason (copy), p1 (copy)
					Players:ReportAbuse(AllegedAbuser, AbuseReason, p1.comment)
				end)
				p2.analyticsDispatch({
					type = ConstantsModule.AnalyticsActions.SetSubmissionCompleted
				})
				p2.onReportComplete((GetToastMessageFromAbuseReasonModule(AbuseReason)))
				
				return
			end
		elseif (MethodOfAbuse == ConstantsModule.AbuseMethods.Other or MethodOfAbuse == ConstantsModule.AbuseMethods.Avatar) and isEligibleForRAOtherSubmit(p1) then
			pcall(function() --[[ Line: 113 ]]
				-- upvalues: AbuseReportBuilderModule (upval), Players (upval), AllegedAbuserId (copy), p1 (copy), AbuseReason (copy), ReportAbuseAnalyticsModule (upval), p2 (copy), MethodOfAbuse (copy), ConstantsModule (upval), GetToastMessageFromAbuseReasonModule (upval)
				task.spawn(function() --[[ Line: 114 ]]
					-- upvalues: AbuseReportBuilderModule (upval), Players (upval), AllegedAbuserId (upval), p1 (upval), AbuseReason (upval), ReportAbuseAnalyticsModule (upval), p2 (upval), MethodOfAbuse (upval), ConstantsModule (upval), GetToastMessageFromAbuseReasonModule (upval)
					local OtherReportRequest = AbuseReportBuilderModule.buildOtherReportRequest({
						localUserId = Players.LocalPlayer.UserId,
						formSelectedAbuserUserId = AllegedAbuserId,
						abuseComment = p1.comment,
						abuseReason = AbuseReason,
						menuEntryPoint = ReportAbuseAnalyticsModule:getAbuseReportSessionEntryPoint(),
						variant = AbuseReportBuilderModule.Constants.Variant.NM
					}, p2.reportAnythingState, p2.reportAnythingAnalytics.getAccumulatedParameters())
					
					if game:GetEngineFeature("WHAM2165") and MethodOfAbuse == ConstantsModule.AbuseMethods.Avatar then
						Players:ReportAvatarAbuse(AllegedAbuserId, OtherReportRequest)
					else
						Players:ReportAbuseV3(Players.LocalPlayer, OtherReportRequest)
					end
					p2.analyticsDispatch({
						type = ConstantsModule.AnalyticsActions.SetSubmissionCompleted
					})
					p2.onReportComplete((GetToastMessageFromAbuseReasonModule(AbuseReason, true)))
				end)
			end)
		end
	end
}
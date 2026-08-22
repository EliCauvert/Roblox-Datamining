local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local marketplaceService = game:GetService("MarketplaceService")
local playersService = game:GetService("Players")
local _ = require(abuseReportMenu.Components.Types)
local constantsModule = require(abuseReportMenu.Components.Constants)
local tnSIXPWrapperModule = require(abuseReportMenu.IXP.TnSIXPWrapper)
local abuseReportBuilderModule = require(abuseReportMenu.ReportAnything.Utility.AbuseReportBuilder)
local reportAbuseAnalyticsModule = require(abuseReportMenu.Analytics.ReportAbuseAnalytics)
local getToastMessageFromAbuseReasonModule = require(abuseReportMenu.MenuConfigs.getToastMessageFromAbuseReason)

return {
	componentType = "button",
	variant = "primary",
	fieldLabel = "",
	componentName = "SubmitButton",
	getIsVisible = function(_) --[[ line: 14 ]]
		return true
	end,
	getIconSrc = function(_) --[[ line: 18 ]]
		return ""
	end,
	getButtonLabel = function(_) --[[ line: 21 ]]
		return "SubmitButton"
	end,
	onClick = function(p0, _, p1) --[[ line: 24 ]]
		-- upvalues: playersService (ref), tnSIXPWrapperModule (ref), abuseReportBuilderModule (ref), reportAbuseAnalyticsModule (ref), constantsModule (ref), getToastMessageFromAbuseReasonModule (ref), marketplaceService (ref)
		local abuseReason = p0.abuseReason
		
		if abuseReason ~= nil and playersService.LocalPlayer ~= nil then
			if tnSIXPWrapperModule.getReportAnythingExperienceEnabled() then
				playersService:ReportAbuseV3(playersService.LocalPlayer, abuseReportBuilderModule.buildExperienceReportRequest({
					localUserId = playersService.LocalPlayer.UserId,
					placeId = game.PlaceId,
					abuseComment = p0.comment,
					abuseReason = abuseReason,
					menuEntryPoint = reportAbuseAnalyticsModule:getAbuseReportSessionEntryPoint(),
					variant = abuseReportBuilderModule.Constants.Variant.NM
				}, p1.reportAnythingState, p1.reportAnythingAnalytics.getAccumulatedParameters()))
				p1.analyticsDispatch({
					type = constantsModule.AnalyticsActions.SetSubmissionCompleted
				})
				p1.onReportComplete(getToastMessageFromAbuseReasonModule(abuseReason, true))
				
				return
			end
			spawn(function() --[[ line: 49 ]]
				-- upvalues: marketplaceService (copy), p0 (ref), playersService (copy), abuseReason (ref)
				local var8 = tostring(game.PlaceId)
				local var9 = "N/A"
				local var10 = "N/A"
				pcall(function() --[[ line: 51 ]]
					-- upvalues: marketplaceService (copy), var9 (write), var10 (write)
					local placeIdProductInfoAsync = marketplaceService:GetProductInfoAsync(game.PlaceId, Enum.InfoType.Asset)
					var9 = placeIdProductInfoAsync.Name
					var10 = placeIdProductInfoAsync.Description
				end)
				playersService:ReportAbuse(nil, abuseReason, string.format("User Report: \n    %s \nPlace Title: \n    %s \nPlaceId: \n    %s \nPlace Description: \n    %s \n", p0.comment, var9, var8, var10))
			end)
			p1.analyticsDispatch({
				type = constantsModule.AnalyticsActions.SetSubmissionCompleted
			})
			p1.onReportComplete(getToastMessageFromAbuseReasonModule(abuseReason))
		end
	end
}
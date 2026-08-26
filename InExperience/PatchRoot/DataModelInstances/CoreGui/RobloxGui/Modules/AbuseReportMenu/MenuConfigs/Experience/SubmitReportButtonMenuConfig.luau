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
	getIsVisible = function(_)
		return true
	end,
	getIconSrc = function(_)
		return ""
	end,
	getButtonLabel = function(_)
		return "SubmitButton"
	end,
	onClick = function(p1, _, p2)
		-- upvalues: playersService (ref), tnSIXPWrapperModule (ref), abuseReportBuilderModule (ref), reportAbuseAnalyticsModule (ref), constantsModule (ref), getToastMessageFromAbuseReasonModule (ref), marketplaceService (ref)
		local abuseReason = p1.abuseReason
		
		if abuseReason ~= nil and playersService.LocalPlayer ~= nil then
			if tnSIXPWrapperModule.getReportAnythingExperienceEnabled() then
				playersService:ReportAbuseV3(playersService.LocalPlayer, abuseReportBuilderModule.buildExperienceReportRequest({
					localUserId = playersService.LocalPlayer.UserId,
					placeId = game.PlaceId,
					abuseComment = p1.comment,
					abuseReason = abuseReason,
					menuEntryPoint = reportAbuseAnalyticsModule:getAbuseReportSessionEntryPoint(),
					variant = abuseReportBuilderModule.Constants.Variant.NM
				}, p2.reportAnythingState, p2.reportAnythingAnalytics.getAccumulatedParameters()))
				p2.analyticsDispatch({
					type = constantsModule.AnalyticsActions.SetSubmissionCompleted
				})
				p2.onReportComplete(getToastMessageFromAbuseReasonModule(abuseReason, true))
				
				return
			end
			spawn(function()
				-- upvalues: marketplaceService (copy), p1 (ref), playersService (copy), abuseReason (ref)
				local var1 = tostring(game.PlaceId)
				local var2 = "N/A"
				local var3 = "N/A"
				pcall(function()
					-- upvalues: marketplaceService (copy), var2 (write), var3 (write)
					local placeIdProductInfoAsync = marketplaceService:GetProductInfoAsync(game.PlaceId, Enum.InfoType.Asset)
					var2 = placeIdProductInfoAsync.Name
					var3 = placeIdProductInfoAsync.Description
				end)
				playersService:ReportAbuse(nil, abuseReason, string.format("User Report: \n    %s \nPlace Title: \n    %s \nPlaceId: \n    %s \nPlace Description: \n    %s \n", p1.comment, var2, var1, var3))
			end)
			p2.analyticsDispatch({
				type = constantsModule.AnalyticsActions.SetSubmissionCompleted
			})
			p2.onReportComplete(getToastMessageFromAbuseReasonModule(abuseReason))
		end
	end
}
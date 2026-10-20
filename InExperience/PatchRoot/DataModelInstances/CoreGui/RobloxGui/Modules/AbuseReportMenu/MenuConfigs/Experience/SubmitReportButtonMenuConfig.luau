local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local _ = require(AbuseReportMenu.Components.Types)
local ConstantsModule = require(AbuseReportMenu.Components.Constants)
local TnSIXPWrapperModule = require(AbuseReportMenu.IXP.TnSIXPWrapper)
local AbuseReportBuilderModule = require(AbuseReportMenu.ReportAnything.Utility.AbuseReportBuilder)
local ReportAbuseAnalyticsModule = require(AbuseReportMenu.Analytics.ReportAbuseAnalytics)
local GetToastMessageFromAbuseReasonModule = require(AbuseReportMenu.MenuConfigs.getToastMessageFromAbuseReason)

return {
	componentType = "button",
	variant = "primary",
	fieldLabel = "",
	componentName = "SubmitButton",
	getIsVisible = function(_): boolean
		return true
	end,
	getIconSrc = function(_): string
		return ""
	end,
	getButtonLabel = function(_): string
		return "SubmitButton"
	end,
	onClick = function(p1, _, p2)
		-- upvalues: Players (copy), TnSIXPWrapperModule (copy), AbuseReportBuilderModule (copy), ReportAbuseAnalyticsModule (copy), ConstantsModule (copy), GetToastMessageFromAbuseReasonModule (copy), MarketplaceService (copy)
		local AbuseReason = p1.abuseReason
		
		if AbuseReason ~= nil and Players.LocalPlayer ~= nil then
			if TnSIXPWrapperModule.getReportAnythingExperienceEnabled() then
				Players:ReportAbuseV3(Players.LocalPlayer, (AbuseReportBuilderModule.buildExperienceReportRequest({
					localUserId = Players.LocalPlayer.UserId,
					placeId = game.PlaceId,
					abuseComment = p1.comment,
					abuseReason = AbuseReason,
					menuEntryPoint = ReportAbuseAnalyticsModule:getAbuseReportSessionEntryPoint(),
					variant = AbuseReportBuilderModule.Constants.Variant.NM
				}, p2.reportAnythingState, p2.reportAnythingAnalytics.getAccumulatedParameters())))
				p2.analyticsDispatch({
					type = ConstantsModule.AnalyticsActions.SetSubmissionCompleted
				})
				p2.onReportComplete((GetToastMessageFromAbuseReasonModule(AbuseReason, true)))
				
				return
			end
			spawn(function()
				-- upvalues: MarketplaceService (upval), p1 (copy), Players (upval), AbuseReason (copy)
				local Text = tostring(game.PlaceId)
				local Name = "N/A"
				local Description = "N/A"
				pcall(function()
					-- upvalues: MarketplaceService (upval), Name (ref), Description (ref)
					local ProductInfoAsync = MarketplaceService:GetProductInfoAsync(game.PlaceId, Enum.InfoType.Asset)
					Name = ProductInfoAsync.Name
					Description = ProductInfoAsync.Description
				end)
				Players:ReportAbuse(nil, AbuseReason, (string.format("User Report: \n    %s \nPlace Title: \n    %s \nPlaceId: \n    %s \nPlace Description: \n    %s \n", p1.comment, Name, Text, Description)))
			end)
			p2.analyticsDispatch({
				type = ConstantsModule.AnalyticsActions.SetSubmissionCompleted
			})
			p2.onReportComplete((GetToastMessageFromAbuseReasonModule(AbuseReason)))
		end
	end
}
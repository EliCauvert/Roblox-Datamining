local Parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FoundationModule = require(Parent.Foundation)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local ButtonSize = FoundationModule.Enums.ButtonSize
local FlyoutAnalyticsModule = require(script.Parent.Parent.Analytics.FlyoutAnalytics)
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local AppEventIngestService = require(Parent.RoactServiceTags).AppEventIngestService
local FlyoutContentSettingsModule = require(script.Parent.Parent.Config.FlyoutContentSettings)
local FFlagCTAChangeMorePageFlyoutButtonText = require(Parent.SharedFlags).FFlagCTAChangeMorePageFlyoutButtonText

return function(p1)
	-- upvalues: UseRoactServiceFunction (copy), AppEventIngestService (copy), ReactModule (copy), FlyoutContentSettingsModule (copy), FlyoutAnalyticsModule (copy), UseLocalizationFunction (copy), FFlagCTAChangeMorePageFlyoutButtonText (copy), FoundationModule (copy), ButtonVariant (copy), ButtonSize (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(AppEventIngestService)
	
	return ReactModule.createElement(FoundationModule.Button, {
		testId = "--core-ui-flyout-button-report-logs",
		isDisabled = false,
		text = UseLocalizationFunction({
			text = if FFlagCTAChangeMorePageFlyoutButtonText then "CommonUI.Features.Label.ReportLogsSentenceCase" else "CommonUI.Features.Label.ReportLogs"
		}).text,
		variant = ButtonVariant.Standard,
		LayoutOrder = p1.layoutOrder,
		size = ButtonSize.Large,
		width = UDim.new(1, 0),
		onActivated = ReactModule.useCallback(function()
			-- upvalues: p1 (copy), FlyoutContentSettingsModule (upval), FlyoutAnalyticsModule (upval), UseRoactServiceResult (copy)
			p1.closeDrawer()
			
			if p1.openReportLogConfirmation then
				p1.openReportLogConfirmation()
			end
			FlyoutAnalyticsModule.sendMoreLegacyAndFlyoutItemClickEvent(UseRoactServiceResult, FlyoutContentSettingsModule.ItemType.ReportLogs)
		end, {
			p1.openReportLogConfirmation,
			p1.closeDrawer,
			UseRoactServiceResult
		})
	})
end
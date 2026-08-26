local parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local foundationModule = require(parent.Foundation)
local buttonVariant = foundationModule.Enums.ButtonVariant
local buttonSize = foundationModule.Enums.ButtonSize
local flyoutAnalyticsModule = require(script.Parent.Parent.Analytics.FlyoutAnalytics)
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local appEventIngestService = require(parent.RoactServiceTags).AppEventIngestService
local flyoutContentSettingsModule = require(script.Parent.Parent.Config.FlyoutContentSettings)
local fFlagCTAChangeMorePageFlyoutButtonText = require(parent.SharedFlags).FFlagCTAChangeMorePageFlyoutButtonText

return function(p1)
	-- upvalues: useRoactService (ref), appEventIngestService (ref), reactModule (ref), flyoutContentSettingsModule (ref), flyoutAnalyticsModule (ref), useLocalization (ref), fFlagCTAChangeMorePageFlyoutButtonText (ref), foundationModule (ref), buttonVariant (ref), buttonSize (ref)
	local var1 = useRoactService(appEventIngestService)
	
	return reactModule.createElement(foundationModule.Button, {
		isDisabled = false,
		text = useLocalization({
			text = if fFlagCTAChangeMorePageFlyoutButtonText then "CommonUI.Features.Label.ReportLogsSentenceCase" else "CommonUI.Features.Label.ReportLogs"
		}).text,
		variant = buttonVariant.Standard,
		LayoutOrder = p1.layoutOrder,
		size = buttonSize.Large,
		width = UDim.new(1, 0),
		onActivated = reactModule.useCallback(function()
			-- upvalues: p1 (ref), flyoutContentSettingsModule (copy), flyoutAnalyticsModule (copy), var1 (ref)
			p1.closeDrawer()
			
			if p1.openReportLogConfirmation then
				p1.openReportLogConfirmation()
			end
			flyoutAnalyticsModule.sendMoreLegacyAndFlyoutItemClickEvent(var1, flyoutContentSettingsModule.ItemType.ReportLogs)
		end, { p1.openReportLogConfirmation, p1.closeDrawer, var1 })
	})
end
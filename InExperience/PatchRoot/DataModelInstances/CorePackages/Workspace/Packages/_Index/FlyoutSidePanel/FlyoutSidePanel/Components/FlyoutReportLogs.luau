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

return function(p0)
	-- upvalues: useRoactService (ref), appEventIngestService (ref), reactModule (ref), flyoutContentSettingsModule (ref), flyoutAnalyticsModule (ref), useLocalization (ref), fFlagCTAChangeMorePageFlyoutButtonText (ref), foundationModule (ref), buttonVariant (ref), buttonSize (ref)
	local var4 = useRoactService(appEventIngestService)
	
	return reactModule.createElement(foundationModule.Button, {
		isDisabled = false,
		text = useLocalization({
			text = if fFlagCTAChangeMorePageFlyoutButtonText then "CommonUI.Features.Label.ReportLogsSentenceCase" else "CommonUI.Features.Label.ReportLogs"
		}).text,
		variant = buttonVariant.Standard,
		LayoutOrder = p0.layoutOrder,
		size = buttonSize.Large,
		width = UDim.new(1, 0),
		onActivated = reactModule.useCallback(function()
			-- upvalues: p0 (ref), flyoutContentSettingsModule (copy), flyoutAnalyticsModule (copy), var4 (ref)
			p0.closeDrawer()
			
			if p0.openReportLogConfirmation then
				p0.openReportLogConfirmation()
			end
			flyoutAnalyticsModule.sendMoreLegacyAndFlyoutItemClickEvent(var4, flyoutContentSettingsModule.ItemType.ReportLogs)
		end, { p0.openReportLogConfirmation, p0.closeDrawer, var4 })
	})
end
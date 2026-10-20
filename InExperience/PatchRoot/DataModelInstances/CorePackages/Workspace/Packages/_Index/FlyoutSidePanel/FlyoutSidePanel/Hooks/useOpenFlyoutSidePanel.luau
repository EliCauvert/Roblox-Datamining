local Parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local ReactModule = require(Parent.React)
local UseSetDrawerVisibleFunction = require(Parent.Drawer).Hooks.useSetDrawerVisible
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local AppEventIngestService = require(Parent.RoactServiceTags).AppEventIngestService
local FlyoutAnalyticsModule = require(script.Parent.Parent.Analytics.FlyoutAnalytics)
local FlyoutTooltipManagerModule = require(script.Parent.Parent.FlyoutTooltipManager)

return function(p1)
	-- upvalues: UseSetDrawerVisibleFunction (copy), UseRoactServiceFunction (copy), AppEventIngestService (copy), ReactModule (copy), FlyoutAnalyticsModule (copy), FlyoutTooltipManagerModule (copy)
	local UseSetDrawerVisibleResult = UseSetDrawerVisibleFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(AppEventIngestService)
	
	return ReactModule.useCallback(function()
		-- upvalues: FlyoutAnalyticsModule (upval), UseRoactServiceResult (copy), p1 (copy), UseSetDrawerVisibleResult (copy), FlyoutTooltipManagerModule (upval)
		FlyoutAnalyticsModule.sendPageLoadEvent(UseRoactServiceResult, p1)
		UseSetDrawerVisibleResult(true)
		FlyoutTooltipManagerModule:flyoutSidePanelOpened()
	end, { UseSetDrawerVisibleResult, UseRoactServiceResult, p1 })
end
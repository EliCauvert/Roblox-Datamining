local parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local reactModule = require(parent.React)
local useSetDrawerVisible = require(parent.Drawer).Hooks.useSetDrawerVisible
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local appEventIngestService = require(parent.RoactServiceTags).AppEventIngestService
local flyoutAnalyticsModule = require(script.Parent.Parent.Analytics.FlyoutAnalytics)
local flyoutTooltipManagerModule = require(script.Parent.Parent.FlyoutTooltipManager)

return function(p0)
	-- upvalues: useSetDrawerVisible (ref), useRoactService (ref), appEventIngestService (ref), reactModule (ref), flyoutAnalyticsModule (ref), flyoutTooltipManagerModule (ref)
	local var3 = useSetDrawerVisible()
	local var4 = useRoactService(appEventIngestService)
	
	return reactModule.useCallback(function()
		-- upvalues: flyoutAnalyticsModule (copy), var4 (ref), p0 (ref), var3 (ref), flyoutTooltipManagerModule (copy)
		flyoutAnalyticsModule.sendPageLoadEvent(var4, p0)
		var3(true)
		flyoutTooltipManagerModule:flyoutSidePanelOpened()
	end, { var3, var4, p0 })
end
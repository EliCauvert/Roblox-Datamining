local parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local reactModule = require(parent.React)
local useSetDrawerVisible = require(parent.Drawer).Hooks.useSetDrawerVisible
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local appEventIngestService = require(parent.RoactServiceTags).AppEventIngestService
local flyoutAnalyticsModule = require(script.Parent.Parent.Analytics.FlyoutAnalytics)
local flyoutTooltipManagerModule = require(script.Parent.Parent.FlyoutTooltipManager)

return function(p1)
	-- upvalues: useSetDrawerVisible (ref), useRoactService (ref), appEventIngestService (ref), reactModule (ref), flyoutAnalyticsModule (ref), flyoutTooltipManagerModule (ref)
	local var1 = useSetDrawerVisible()
	local var2 = useRoactService(appEventIngestService)
	
	return reactModule.useCallback(function()
		-- upvalues: flyoutAnalyticsModule (copy), var2 (ref), p1 (ref), var1 (ref), flyoutTooltipManagerModule (copy)
		flyoutAnalyticsModule.sendPageLoadEvent(var2, p1)
		var1(true)
		flyoutTooltipManagerModule:flyoutSidePanelOpened()
	end, { var1, var2, p1 })
end
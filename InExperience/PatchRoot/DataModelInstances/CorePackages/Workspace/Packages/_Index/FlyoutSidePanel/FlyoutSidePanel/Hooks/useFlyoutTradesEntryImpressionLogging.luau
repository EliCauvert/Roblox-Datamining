local FlyoutSidePanel = script:FindFirstAncestor("FlyoutSidePanel")
local Parent = FlyoutSidePanel.Parent
local ReactModule = require(Parent.React)
local UseDrawerVisibleFunction = require(Parent.Drawer).Hooks.useDrawerVisible
local FlyoutAnalyticsModule = require(FlyoutSidePanel.Analytics.FlyoutAnalytics)
local FlyoutContentSettingsModule = require(FlyoutSidePanel.Config.FlyoutContentSettings)

return function(List)
	-- upvalues: UseDrawerVisibleFunction (copy), ReactModule (copy), FlyoutContentSettingsModule (copy), FlyoutAnalyticsModule (copy)
	local UseDrawerVisibleResult = UseDrawerVisibleFunction()
	local UseRefResult = ReactModule.useRef(false)
	local Flag = false
	
	for _, value in List do
		if value.itemType == FlyoutContentSettingsModule.ItemType.Trades then
			Flag = true
			break
		end
	end
	ReactModule.useEffect(function()
		-- upvalues: UseDrawerVisibleResult (copy), UseRefResult (copy), Flag (ref), FlyoutAnalyticsModule (upval), FlyoutContentSettingsModule (upval)
		if not UseDrawerVisibleResult then
			UseRefResult.current = false
			
			return
		end
		if Flag and not UseRefResult.current then
			UseRefResult.current = true
			FlyoutAnalyticsModule.onFlyoutContentItemImpressed({
				source = "impression",
				integrationId = FlyoutContentSettingsModule.ItemType.Trades
			})
		end
	end, { UseDrawerVisibleResult, Flag })
end
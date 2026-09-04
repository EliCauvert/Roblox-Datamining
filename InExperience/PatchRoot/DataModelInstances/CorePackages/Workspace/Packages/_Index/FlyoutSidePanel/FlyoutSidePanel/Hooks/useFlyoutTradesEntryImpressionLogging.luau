local flyoutSidePanel = script:FindFirstAncestor("FlyoutSidePanel")
local parent = flyoutSidePanel.Parent
local reactModule = require(parent.React)
local useDrawerVisible = require(parent.Drawer).Hooks.useDrawerVisible
local flyoutAnalyticsModule = require(flyoutSidePanel.Analytics.FlyoutAnalytics)
local flyoutContentSettingsModule = require(flyoutSidePanel.Config.FlyoutContentSettings)

return function(p1)
	-- upvalues: useDrawerVisible (ref), reactModule (ref), flyoutContentSettingsModule (ref), flyoutAnalyticsModule (ref)
	local var1 = useDrawerVisible()
	local var2 = reactModule.useRef(false)
	local var3 = false
	
	for i, v in p1 do
		if v.itemType == flyoutContentSettingsModule.ItemType.Trades then
			var3 = true
			break
		end
	end
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var2 (ref), var3 (write), flyoutAnalyticsModule (copy), flyoutContentSettingsModule (copy)
		if not var1 then
			var2.current = false
			
			return
		elseif var3 and not var2.current then
			var2.current = true
			flyoutAnalyticsModule.onFlyoutContentItemImpressed({
				source = "impression",
				integrationId = flyoutContentSettingsModule.ItemType.Trades
			})
		end
	end, { var1, var3 })
end
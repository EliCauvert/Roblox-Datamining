local flyoutSidePanel = script:FindFirstAncestor("FlyoutSidePanel")
local parent = flyoutSidePanel.Parent
local reactModule = require(parent.React)
local useDrawerVisible = require(parent.Drawer).Hooks.useDrawerVisible
local logCTAChangeMorePageFlyoutButtonTextExposureModule = require(flyoutSidePanel.Utils.logCTAChangeMorePageFlyoutButtonTextExposure)

return function()
	-- upvalues: useDrawerVisible (ref), reactModule (ref), logCTAChangeMorePageFlyoutButtonTextExposureModule (ref)
	local var1 = useDrawerVisible()
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), logCTAChangeMorePageFlyoutButtonTextExposureModule (copy)
		if var1 then
			logCTAChangeMorePageFlyoutButtonTextExposureModule()
		end
	end, { var1 })
end
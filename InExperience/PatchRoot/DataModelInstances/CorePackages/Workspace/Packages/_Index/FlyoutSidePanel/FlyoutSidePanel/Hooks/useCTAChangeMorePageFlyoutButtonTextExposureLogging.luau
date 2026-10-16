local FlyoutSidePanel = script:FindFirstAncestor("FlyoutSidePanel")
local Parent = FlyoutSidePanel.Parent
local ReactModule = require(Parent.React)
local UseDrawerVisibleFunction = require(Parent.Drawer).Hooks.useDrawerVisible
local LogCTAChangeMorePageFlyoutButtonTextExposureModule = require(FlyoutSidePanel.Utils.logCTAChangeMorePageFlyoutButtonTextExposure)

return function() --[[ Line: 8 | Named "useCTAChangeMorePageFlyoutButtonTextExposureLogging" ]]
	-- upvalues: UseDrawerVisibleFunction (copy), ReactModule (copy), LogCTAChangeMorePageFlyoutButtonTextExposureModule (copy)
	local UseDrawerVisibleResult = UseDrawerVisibleFunction()
	ReactModule.useEffect(function() --[[ Line: 10 ]]
		-- upvalues: UseDrawerVisibleResult (copy), LogCTAChangeMorePageFlyoutButtonTextExposureModule (upval)
		if UseDrawerVisibleResult then
			LogCTAChangeMorePageFlyoutButtonTextExposureModule()
		end
	end, { UseDrawerVisibleResult })
end
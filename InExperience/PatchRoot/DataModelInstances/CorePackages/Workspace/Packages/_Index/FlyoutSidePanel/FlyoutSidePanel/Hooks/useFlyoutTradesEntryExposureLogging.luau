local FlyoutSidePanel = script:FindFirstAncestor("FlyoutSidePanel")
local Parent = FlyoutSidePanel.Parent
local ReactModule = require(Parent.React)
local UseDrawerVisibleFunction = require(Parent.Drawer).Hooks.useDrawerVisible
local LogFlyoutTradesEntryExposureModule = require(FlyoutSidePanel.Utils.logFlyoutTradesEntryExposure)

return function() --[[ Line: 8 | Named "useFlyoutTradesEntryExposureLogging" ]]
	-- upvalues: UseDrawerVisibleFunction (copy), ReactModule (copy), LogFlyoutTradesEntryExposureModule (copy)
	local UseDrawerVisibleResult = UseDrawerVisibleFunction()
	ReactModule.useEffect(function() --[[ Line: 10 ]]
		-- upvalues: UseDrawerVisibleResult (copy), LogFlyoutTradesEntryExposureModule (upval)
		if UseDrawerVisibleResult then
			LogFlyoutTradesEntryExposureModule()
		end
	end, { UseDrawerVisibleResult })
end
local flyoutSidePanel = script:FindFirstAncestor("FlyoutSidePanel")
local parent = flyoutSidePanel.Parent
local reactModule = require(parent.React)
local useDrawerVisible = require(parent.Drawer).Hooks.useDrawerVisible
local logFlyoutTradesEntryExposureModule = require(flyoutSidePanel.Utils.logFlyoutTradesEntryExposure)

return function() --[[ line: 8 | named "useFlyoutTradesEntryExposureLogging" ]]
	-- upvalues: useDrawerVisible (ref), reactModule (ref), logFlyoutTradesEntryExposureModule (ref)
	local var3 = useDrawerVisible()
	reactModule.useEffect(function() --[[ line: 10 ]]
		-- upvalues: var3 (ref), logFlyoutTradesEntryExposureModule (copy)
		if var3 then
			logFlyoutTradesEntryExposureModule()
		end
	end, { var3 })
end
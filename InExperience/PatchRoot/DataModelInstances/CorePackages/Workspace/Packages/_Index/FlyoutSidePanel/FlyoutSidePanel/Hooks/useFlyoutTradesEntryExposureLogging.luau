local flyoutSidePanel = script:FindFirstAncestor("FlyoutSidePanel")
local parent = flyoutSidePanel.Parent
local reactModule = require(parent.React)
local useDrawerVisible = require(parent.Drawer).Hooks.useDrawerVisible
local logFlyoutTradesEntryExposureModule = require(flyoutSidePanel.Utils.logFlyoutTradesEntryExposure)

return function()
	-- upvalues: useDrawerVisible (ref), reactModule (ref), logFlyoutTradesEntryExposureModule (ref)
	local var1 = useDrawerVisible()
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), logFlyoutTradesEntryExposureModule (copy)
		if var1 then
			logFlyoutTradesEntryExposureModule()
		end
	end, { var1 })
end
local FlyoutSidePanel = script:FindFirstAncestor("FlyoutSidePanel")
local Parent = FlyoutSidePanel.Parent
local ReactModule = require(Parent.React)
local FlyoutAccountSwitcherIXP = require(Parent.SharedExperimentDefinition).FlyoutAccountSwitcherIXP
local FlyoutAnalyticsModule = require(FlyoutSidePanel.Analytics.FlyoutAnalytics)

return function(Callback1, Callback)
	-- upvalues: ReactModule (copy), FlyoutAnalyticsModule (copy), FlyoutAccountSwitcherIXP (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), Callback (copy), FlyoutAnalyticsModule (upval), FlyoutAccountSwitcherIXP (upval), Callback1 (copy)
		local CurrentFunction: () -> () = UseRefResult.current
		
		if CurrentFunction then
			CurrentFunction()
		end
		Callback()
		FlyoutAnalyticsModule.onFlyoutSwitchAccountClicked({ source = FlyoutAccountSwitcherIXP.getClickSource() })
		
		if Callback1 then
			Callback1()
		end
	end, { Callback, Callback1 })
	
	return {
		onActivated = if Callback1 then UseResult else nil,
		anchorRef = ReactModule.useRef(nil),
		dismissRef = UseRefResult
	}
end
local FlyoutSidePanel = script:FindFirstAncestor("FlyoutSidePanel")
local Parent = FlyoutSidePanel.Parent
local ReactModule = require(Parent.React)
local FlyoutAccountSwitcherIXP = require(Parent.SharedExperimentDefinition).FlyoutAccountSwitcherIXP
local FlyoutAnalyticsModule = require(FlyoutSidePanel.Analytics.FlyoutAnalytics)
local FFlagFlyoutKeepSwitchAccountBottomButton = require(Parent.SharedFlags).FFlagFlyoutKeepSwitchAccountBottomButton

return function(Callback1, Callback)
	-- upvalues: ReactModule (copy), FlyoutAnalyticsModule (copy), FFlagFlyoutKeepSwitchAccountBottomButton (copy), FlyoutAccountSwitcherIXP (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function(p1)
		-- upvalues: UseRefResult (copy), Callback (copy), FlyoutAnalyticsModule (upval), FFlagFlyoutKeepSwitchAccountBottomButton (upval), FlyoutAccountSwitcherIXP (upval), Callback1 (copy)
		local CurrentFunction: () -> () = UseRefResult.current
		
		if CurrentFunction then
			CurrentFunction()
		end
		Callback()
		FlyoutAnalyticsModule.onFlyoutSwitchAccountClicked({
			source = if FFlagFlyoutKeepSwitchAccountBottomButton then p1 else FlyoutAccountSwitcherIXP.getClickSource()
		})
		
		if Callback1 then
			Callback1()
		end
	end, { Callback, Callback1 })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseResult (copy), FlyoutAccountSwitcherIXP (upval)
		UseResult(FlyoutAccountSwitcherIXP.getClickSource())
	end, { UseResult })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseResult (copy)
		UseResult("bottom_button")
	end, { UseResult })
	
	return {
		onProfileActivated = if Callback1 then UseResult1 else nil,
		onBottomButtonActivated = if Callback1 then UseResult2 else nil,
		anchorRef = ReactModule.useRef(nil),
		dismissRef = UseRefResult
	}
end
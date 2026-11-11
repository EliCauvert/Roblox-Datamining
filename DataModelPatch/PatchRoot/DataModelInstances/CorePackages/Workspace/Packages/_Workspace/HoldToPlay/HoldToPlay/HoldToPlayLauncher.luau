local HoldToPlay = script:FindFirstAncestor("HoldToPlay")
local Parent = HoldToPlay.Parent
local ReactModule = require(Parent.React)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local ButtonHoldStateEnum = FocusNavigationUtilsModule.ButtonHoldStateEnum
local AppShortcutBarContext = require(Parent.AppShortcutBar).AppShortcutBarContext
local HoldToPlayLoaderModule = require(HoldToPlay.HoldToPlayLoader)

return function(p1)
	-- upvalues: AppShortcutBarContext (copy), ReactModule (copy), ButtonHoldStateEnum (copy), FocusNavigationEventNameEnum (copy), HoldToPlayLoaderModule (copy)
	local UseDispatchButtonHoldStartedResult = AppShortcutBarContext.useDispatchButtonHoldStarted()
	local UseDispatchButtonHoldEndedResult = AppShortcutBarContext.useDispatchButtonHoldEnded()
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), ButtonHoldStateEnum (upval), UseDispatchButtonHoldStartedResult (copy), FocusNavigationEventNameEnum (upval), UseDispatchButtonHoldEndedResult (copy)
		if p1.holdState == ButtonHoldStateEnum.JUST_PRESSED then
			UseDispatchButtonHoldStartedResult(FocusNavigationEventNameEnum.HoldToPlay, p1.holdProgress)
			
			return
		end
		if p1.holdState == ButtonHoldStateEnum.NOT_HELD then
			UseDispatchButtonHoldEndedResult(FocusNavigationEventNameEnum.HoldToPlay)
		end
	end, {
		p1.holdState,
		p1.holdProgress,
		UseDispatchButtonHoldStartedResult,
		UseDispatchButtonHoldEndedResult
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		p1.reportExperienceLaunched(p1.selectedEntry, p1.referralSource, nil, p1.launchContext, p1.selectedIndex)
	end, {
		p1.reportExperienceLaunched,
		p1.selectedEntry,
		p1.referralSource,
		p1.selectedIndex,
		p1.launchContext
	})
	local SelectedNavigationUniverseId = p1.selectedNavigationUniverseId or (p1.selectedEntry and p1.selectedEntry.universeId or nil)
	
	return if SelectedNavigationUniverseId and (p1.holdState == ButtonHoldStateEnum.HOLDING or p1.holdState == ButtonHoldStateEnum.COMPLETED) then ReactModule.createElement(HoldToPlayLoaderModule, {
		universeId = SelectedNavigationUniverseId,
		shouldAttemptLaunch = p1.holdState == ButtonHoldStateEnum.COMPLETED,
		reportExperienceLaunched = UseResult,
		onLaunched = p1.cancelHold
	}) else nil
end
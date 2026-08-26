local holdToPlay = script:FindFirstAncestor("HoldToPlay")
local parent = holdToPlay.Parent
local reactModule = require(parent.React)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local buttonHoldStateEnum = focusNavigationUtilsModule.ButtonHoldStateEnum
local appShortcutBarContext = require(parent.AppShortcutBar).AppShortcutBarContext
local holdToPlayLoaderModule = require(holdToPlay.HoldToPlayLoader)
local fFlagLuaAppDemoModePlayButtonTelemetry = require(parent.SharedFlags).FFlagLuaAppDemoModePlayButtonTelemetry

return function(p1)
	-- upvalues: appShortcutBarContext (ref), reactModule (ref), buttonHoldStateEnum (ref), focusNavigationEventNameEnum (ref), fFlagLuaAppDemoModePlayButtonTelemetry (ref), holdToPlayLoaderModule (ref)
	local var1 = appShortcutBarContext.useDispatchButtonHoldStarted()
	local var2 = appShortcutBarContext.useDispatchButtonHoldEnded()
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), buttonHoldStateEnum (copy), var1 (ref), focusNavigationEventNameEnum (copy), var2 (ref)
		if p1.holdState == buttonHoldStateEnum.JUST_PRESSED then
			var1(focusNavigationEventNameEnum.HoldToPlay, p1.holdProgress)
			
			return
		elseif p1.holdState == buttonHoldStateEnum.NOT_HELD then
			var2(focusNavigationEventNameEnum.HoldToPlay)
		end
	end, { p1.holdState, p1.holdProgress, var1, var2 })
	local selectedNavigationUniverseId = p1.selectedNavigationUniverseId or (if p1.selectedEntry then p1.selectedEntry.universeId else nil)
	
	return if selectedNavigationUniverseId and (p1.holdState == buttonHoldStateEnum.HOLDING or p1.holdState == buttonHoldStateEnum.COMPLETED) then reactModule.createElement(holdToPlayLoaderModule, {
		universeId = selectedNavigationUniverseId,
		shouldAttemptLaunch = p1.holdState == buttonHoldStateEnum.COMPLETED,
		reportExperienceLaunched = reactModule.useCallback(function(p2)
			-- upvalues: p1 (ref), fFlagLuaAppDemoModePlayButtonTelemetry (copy)
			p1.reportExperienceLaunched(p1.selectedEntry, p1.referralSource, nil, p1.launchContext, p1.selectedIndex, if fFlagLuaAppDemoModePlayButtonTelemetry then p2 else nil)
		end, {
			p1.reportExperienceLaunched,
			p1.selectedEntry,
			p1.referralSource,
			p1.selectedIndex,
			p1.launchContext
		}),
		onLaunched = p1.cancelHold
	}) else nil
end
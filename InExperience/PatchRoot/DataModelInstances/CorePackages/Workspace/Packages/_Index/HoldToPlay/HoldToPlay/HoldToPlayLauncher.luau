local holdToPlay = script:FindFirstAncestor("HoldToPlay")
local parent = holdToPlay.Parent
local reactModule = require(parent.React)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local buttonHoldStateEnum = focusNavigationUtilsModule.ButtonHoldStateEnum
local appShortcutBarContext = require(parent.AppShortcutBar).AppShortcutBarContext
local holdToPlayLoaderModule = require(holdToPlay.HoldToPlayLoader)

return function(p0) --[[ line: 36 | named "HoldToPlayLauncher" ]]
	-- upvalues: appShortcutBarContext (ref), reactModule (ref), buttonHoldStateEnum (ref), focusNavigationEventNameEnum (ref), holdToPlayLoaderModule (ref)
	local var4 = appShortcutBarContext.useDispatchButtonHoldStarted()
	local var5 = appShortcutBarContext.useDispatchButtonHoldEnded()
	reactModule.useEffect(function() --[[ line: 40 ]]
		-- upvalues: p0 (ref), buttonHoldStateEnum (copy), var4 (ref), focusNavigationEventNameEnum (copy), var5 (ref)
		if p0.holdState == buttonHoldStateEnum.JUST_PRESSED then
			var4(focusNavigationEventNameEnum.HoldToPlay, p0.holdProgress)
			
			return
		elseif p0.holdState == buttonHoldStateEnum.NOT_HELD then
			var5(focusNavigationEventNameEnum.HoldToPlay)
		end
	end, { p0.holdState, p0.holdProgress, var4, var5 })
	local selectedNavigationUniverseId = p0.selectedNavigationUniverseId or (if p0.selectedEntry then p0.selectedEntry.universeId else nil)
	
	return if selectedNavigationUniverseId and (p0.holdState == buttonHoldStateEnum.HOLDING or p0.holdState == buttonHoldStateEnum.COMPLETED) then reactModule.createElement(holdToPlayLoaderModule, {
		universeId = selectedNavigationUniverseId,
		shouldAttemptLaunch = p0.holdState == buttonHoldStateEnum.COMPLETED,
		reportExperienceLaunched = reactModule.useCallback(function() --[[ line: 49 ]]
			-- upvalues: p0 (ref)
			p0.reportExperienceLaunched(p0.selectedEntry, p0.referralSource, nil, p0.launchContext, p0.selectedIndex)
		end, {
			p0.reportExperienceLaunched,
			p0.selectedEntry,
			p0.referralSource,
			p0.selectedIndex,
			p0.launchContext
		}),
		onLaunched = p0.cancelHold
	}) else nil
end
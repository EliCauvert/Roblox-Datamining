local parent = script:FindFirstAncestor("Moments").Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local navigationRoduxModule = require(parent.NavigationRodux)
local selectors = navigationRoduxModule.Selectors
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagUseNavigationSelectors = sharedFlagsModule.FFlagUseNavigationSelectors
local fFlagSignalsNavP3hMisc = sharedFlagsModule.FFlagSignalsNavP3hMisc
local fFlagMomentsWatchSessionalization = sharedFlagsModule.FFlagMomentsWatchSessionalization
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useSignalState = require(parent.SignalsReact).useSignalState
local reactModule = require(parent.React)
local var1 = if fFlagSignalsNavP3hMisc then navigationRoduxModule.GetLegacyNavigationStore else nil
local var2 = if fFlagSignalsNavP3hMisc then require(parent.RobloxAppNavigation).isNavigationAvailable else nil

local function routeContainsMoments(p1)
	-- upvalues: appPage (ref)
	if type(p1) ~= "table" then
		return false
	end
	for i, v in p1 do
		if type(v) == "table" and v.name == appPage.Moments then
			return true
		end
	end
	return false
end

return function()
	-- upvalues: fFlagSignalsNavP3hMisc (ref), var1 (ref), reactModule (ref), fFlagMomentsWatchSessionalization (ref), appPage (ref), useSignalState (ref), var2 (ref), useSelector (ref), fFlagUseNavigationSelectors (ref), routeContainsMoments (ref), selectors (ref)
	if not fFlagSignalsNavP3hMisc then
		return useSelector(function(p2)
			-- upvalues: fFlagUseNavigationSelectors (copy), fFlagMomentsWatchSessionalization (copy), routeContainsMoments (copy), selectors (copy), appPage (copy)
			if not p2.Navigation then
				return true
			elseif fFlagUseNavigationSelectors then
				return if fFlagMomentsWatchSessionalization then routeContainsMoments(selectors.selectCurrentLegacyRoute(p2)) else selectors.selectCurrentPageName(p2) == appPage.Moments
			end
			local history = p2.Navigation.history
			
			if not history then
				return false
			end
			local var3 = history[#history]
			
			return if fFlagMomentsWatchSessionalization then routeContainsMoments(var3) else (var3[#var3] and var3[#var3].name) == appPage.Moments
		end)
	end
	local var3 = var1(false)
	
	return if var2() then useSignalState(reactModule.useMemo(function()
		-- upvalues: fFlagMomentsWatchSessionalization (copy), var3 (ref), appPage (copy)
		return if fFlagMomentsWatchSessionalization then var3.getRouteContainsPageSignal(appPage.Moments) else var3.getIsCurrentPageSignal(appPage.Moments)
	end, {})) else true
end
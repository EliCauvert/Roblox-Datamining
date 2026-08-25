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
local var3 = if fFlagSignalsNavP3hMisc then navigationRoduxModule.GetLegacyNavigationStore else nil
local var4 = if fFlagSignalsNavP3hMisc then require(parent.RobloxAppNavigation).isNavigationAvailable else nil

local function routeContainsMoments(p0)
	-- upvalues: appPage (ref)
	if type(p0) ~= "table" then
		return false
	end
	for i, v in p0 do
		if type(v) == "table" and v.name == appPage.Moments then
			return true
		end
	end
	return false
end

return function()
	-- upvalues: fFlagSignalsNavP3hMisc (ref), var3 (ref), reactModule (ref), fFlagMomentsWatchSessionalization (ref), appPage (ref), useSignalState (ref), var4 (ref), useSelector (ref), fFlagUseNavigationSelectors (ref), routeContainsMoments (ref), selectors (ref)
	if not fFlagSignalsNavP3hMisc then
		return useSelector(function(p1)
			-- upvalues: fFlagUseNavigationSelectors (copy), fFlagMomentsWatchSessionalization (copy), routeContainsMoments (copy), selectors (copy), appPage (copy)
			if not p1.Navigation then
				return true
			elseif fFlagUseNavigationSelectors then
				return if fFlagMomentsWatchSessionalization then routeContainsMoments(selectors.selectCurrentLegacyRoute(p1)) else selectors.selectCurrentPageName(p1) == appPage.Moments
			end
			local history = p1.Navigation.history
			
			if not history then
				return false
			end
			local var7 = history[#history]
			
			return if fFlagMomentsWatchSessionalization then routeContainsMoments(var7) else (var7[#var7] and var7[#var7].name) == appPage.Moments
		end)
	end
	local var6 = var3(false)
	
	return if var4() then useSignalState(reactModule.useMemo(function()
		-- upvalues: fFlagMomentsWatchSessionalization (copy), var6 (ref), appPage (copy)
		return if fFlagMomentsWatchSessionalization then var6.getRouteContainsPageSignal(appPage.Moments) else var6.getIsCurrentPageSignal(appPage.Moments)
	end, {})) else true
end
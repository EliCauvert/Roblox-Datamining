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
local var2 = if fFlagSignalsNavP3hMisc then navigationRoduxModule.GetLegacyNavigationStore else nil

local function routeContainsMoments(p0) --[[ line: 32 ]]
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

return function() --[[ line: 44 | named "useMomentsTabIsVisible" ]]
	-- upvalues: fFlagSignalsNavP3hMisc (ref), useSelector (ref), var2 (ref), useSignalState (ref), fFlagMomentsWatchSessionalization (ref), routeContainsMoments (ref), appPage (ref), fFlagUseNavigationSelectors (ref), selectors (ref)
	if not fFlagSignalsNavP3hMisc then
		return useSelector(function(p1) --[[ line: 61 ]]
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
			local var6 = history[#history]
			
			return if fFlagMomentsWatchSessionalization then routeContainsMoments(var6) else (var6[#var6] and var6[#var6].name) == appPage.Moments
		end)
	end
	local var4 = useSignalState(var2(false).getCurrentLegacyRoute)
	
	if not useSelector(function(p2) --[[ line: 46 ]]
		return p2.Navigation ~= nil
	end) then
		return true
	elseif fFlagMomentsWatchSessionalization then
		return routeContainsMoments(var4)
	end
	local var5 = if var4 then var4[#var4] else nil
	
	return var5 ~= nil and var5.name == appPage.Moments
end
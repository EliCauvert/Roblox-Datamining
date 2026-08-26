local parent = script:FindFirstAncestor("DiscoveryRouting").Parent
local reactModule = require(parent.React)
local useStore = require(parent.RoactUtils).Hooks.RoactRodux.useStore
local navigationRoduxModule = require(parent.NavigationRodux)
local selectCurrentLegacyRoute = navigationRoduxModule.Selectors.selectCurrentLegacyRoute
local getLegacyNavigationStore = navigationRoduxModule.GetLegacyNavigationStore
local fFlagSignalsNavP2NavigationPrimitives = require(parent.SharedFlags).FFlagSignalsNavP2NavigationPrimitives

local function getCurrentLegacyRouteFromSignals()
	-- upvalues: getLegacyNavigationStore (ref)
	return getLegacyNavigationStore(false).getCurrentLegacyRoute(false)
end

return function()
	-- upvalues: fFlagSignalsNavP2NavigationPrimitives (ref), getCurrentLegacyRouteFromSignals (ref), useStore (ref), reactModule (ref), selectCurrentLegacyRoute (ref)
	if fFlagSignalsNavP2NavigationPrimitives then
		return getCurrentLegacyRouteFromSignals
	end
	local var1 = useStore()
	
	return reactModule.useCallback(function()
		-- upvalues: selectCurrentLegacyRoute (copy), var1 (ref)
		return selectCurrentLegacyRoute(var1:getState())
	end, { var1 })
end
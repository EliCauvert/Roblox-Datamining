local Parent = script:FindFirstAncestor("DiscoveryRouting").Parent
local ReactModule = require(Parent.React)
local UseStoreFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useStore
local NavigationRoduxModule = require(Parent.NavigationRodux)
local SelectCurrentLegacyRouteFunction = NavigationRoduxModule.Selectors.selectCurrentLegacyRoute
local GetLegacyNavigationStoreFunction = NavigationRoduxModule.GetLegacyNavigationStore
local FFlagSignalsNavP2NavigationPrimitives = require(Parent.SharedFlags).FFlagSignalsNavP2NavigationPrimitives

local function getCurrentLegacyRouteFromSignals() --[[ Line: 17 ]]
	-- upvalues: GetLegacyNavigationStoreFunction (copy)
	return GetLegacyNavigationStoreFunction(false).getCurrentLegacyRoute(false)
end

return function() --[[ Line: 23 | Named "useGetCurrentLegacyRoute" ]]
	-- upvalues: FFlagSignalsNavP2NavigationPrimitives (copy), getCurrentLegacyRouteFromSignals (copy), UseStoreFunction (copy), ReactModule (copy), SelectCurrentLegacyRouteFunction (copy)
	if FFlagSignalsNavP2NavigationPrimitives then
		return getCurrentLegacyRouteFromSignals
	else
		local UseStoreResult = UseStoreFunction()
		
		return ReactModule.useCallback(function() --[[ Line: 28 ]]
			-- upvalues: SelectCurrentLegacyRouteFunction (upval), UseStoreResult (copy)
			return SelectCurrentLegacyRouteFunction(UseStoreResult:getState())
		end, { UseStoreResult })
	end
end
local gameFilters = script:FindFirstAncestor("GameFilters")
local parent = gameFilters.Parent
local _ = require(parent.DiscoveryTypes)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local gameFiltersReducerModule = require(gameFilters.DataStore.GameFiltersReducer)

return function(p1)
	-- upvalues: useSelector (ref), gameFiltersReducerModule (ref)
	return useSelector(function(p2)
		-- upvalues: gameFiltersReducerModule (copy), p1 (ref)
		return p2.Personalization[gameFiltersReducerModule.key][p1]
	end)
end
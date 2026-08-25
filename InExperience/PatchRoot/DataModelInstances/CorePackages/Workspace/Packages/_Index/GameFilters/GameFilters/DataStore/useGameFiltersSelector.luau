local gameFilters = script:FindFirstAncestor("GameFilters")
local parent = gameFilters.Parent
local _ = require(parent.DiscoveryTypes)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local gameFiltersReducerModule = require(gameFilters.DataStore.GameFiltersReducer)

return function(p0)
	-- upvalues: useSelector (ref), gameFiltersReducerModule (ref)
	return useSelector(function(p1)
		-- upvalues: gameFiltersReducerModule (copy), p0 (ref)
		return p1.Personalization[gameFiltersReducerModule.key][p0]
	end)
end
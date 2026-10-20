local GameFilters = script:FindFirstAncestor("GameFilters")
local Parent = GameFilters.Parent
local _ = require(Parent.DiscoveryTypes)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local GameFiltersReducerModule = require(GameFilters.DataStore.GameFiltersReducer)

return function(p1)
	-- upvalues: UseSelectorFunction (copy), GameFiltersReducerModule (copy)
	return (UseSelectorFunction(function(p2)
		-- upvalues: GameFiltersReducerModule (upval), p1 (copy)
		return p2.Personalization[GameFiltersReducerModule.key][p1]
	end))
end
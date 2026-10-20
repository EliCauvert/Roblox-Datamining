local GameFilters = script:FindFirstAncestor("GameFilters")
local SetGameFiltersModule = require(GameFilters.DataStore.SetGameFilters)
local Parent = GameFilters.Parent
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.DiscoveryTypes)

return {
	key = "GameFiltersKey",
	reducer = function(p1, p2)
		-- upvalues: SetGameFiltersModule (copy), CryoModule (copy)
		local P0 = p1 or {}
		
		if p2.type == SetGameFiltersModule.name then
			P0 = CryoModule.Dictionary.join(P0, {
				[p2.groupId] = {
					allFilters = p2.filters,
					updatedTimestamp = p2.updatedTimestamp
				}
			})
		end
		return P0
	end
}
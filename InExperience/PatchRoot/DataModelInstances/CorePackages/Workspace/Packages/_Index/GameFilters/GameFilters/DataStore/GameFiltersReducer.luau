local gameFilters = script:FindFirstAncestor("GameFilters")
local setGameFiltersModule = require(gameFilters.DataStore.SetGameFilters)
local parent = gameFilters.Parent
local cryoModule = require(parent.Cryo)
local _ = require(parent.DiscoveryTypes)

return {
	key = "GameFiltersKey",
	reducer = function(p1, p2)
		-- upvalues: setGameFiltersModule (ref), cryoModule (ref)
		local var1 = p1 or {}
		
		if p2.type == setGameFiltersModule.name then
			var1 = cryoModule.Dictionary.join(var1, {
				[p2.groupId] = {
					allFilters = p2.filters,
					updatedTimestamp = p2.updatedTimestamp
				}
			})
		end
		return var1
	end
}
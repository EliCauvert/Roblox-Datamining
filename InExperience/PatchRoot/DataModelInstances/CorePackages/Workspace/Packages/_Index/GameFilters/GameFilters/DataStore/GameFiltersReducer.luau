local gameFilters = script:FindFirstAncestor("GameFilters")
local setGameFiltersModule = require(gameFilters.DataStore.SetGameFilters)
local parent = gameFilters.Parent
local cryoModule = require(parent.Cryo)
local _ = require(parent.DiscoveryTypes)

return {
	key = "GameFiltersKey",
	reducer = function(p0, p1) --[[ line: 11 ]]
		-- upvalues: setGameFiltersModule (ref), cryoModule (ref)
		local var3 = p0 or {}
		
		if p1.type == setGameFiltersModule.name then
			var3 = cryoModule.Dictionary.join(var3, {
				[p1.groupId] = {
					allFilters = p1.filters,
					updatedTimestamp = p1.updatedTimestamp
				}
			})
		end
		return var3
	end
}
local dataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(dataHydration.Parent.HttpClient)
local fetchUniverseCreateModule = require(script.Parent.fetchUniverseCreate)
local _ = require(script.Parent.UniverseCreateStoreTypes)
local universeSearchModule = require(dataHydration.UniverseSearch)

return function(p0) --[[ line: 20 | named "createUniverseCreateStore" ]]
	-- upvalues: universeSearchModule (ref), fetchUniverseCreateModule (ref)
	p0 = p0 or {}
	local getSearchStore = p0.getSearchStore or function() --[[ line: 22 ]]
		-- upvalues: universeSearchModule (copy)
		return universeSearchModule.getUniverseSearchStore()
	end
	
	return {
		createUniverse = function(p1) --[[ line: 26 ]]
			-- upvalues: fetchUniverseCreateModule (copy), p0 (ref), getSearchStore (ref)
			return fetchUniverseCreateModule(p1, { network = p0.network, baseUrl = p0.baseUrl }):andThen(function(p2) --[[ line: 30 ]]
				-- upvalues: getSearchStore (copy)
				getSearchStore().invalidateAll()
				
				return p2
			end)
		end
	}
end
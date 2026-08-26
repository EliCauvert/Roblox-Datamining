local dataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(dataHydration.Parent.HttpClient)
local fetchUniverseCreateModule = require(script.Parent.fetchUniverseCreate)
local _ = require(script.Parent.UniverseCreateStoreTypes)
local universeSearchModule = require(dataHydration.UniverseSearch)

return function(p1)
	-- upvalues: universeSearchModule (ref), fetchUniverseCreateModule (ref)
	p1 = p1 or {}
	local getSearchStore = p1.getSearchStore or function()
		-- upvalues: universeSearchModule (copy)
		return universeSearchModule.getUniverseSearchStore()
	end
	
	return {
		createUniverse = function(p2)
			-- upvalues: fetchUniverseCreateModule (copy), p1 (ref), getSearchStore (ref)
			return fetchUniverseCreateModule(p2, { network = p1.network, baseUrl = p1.baseUrl }):andThen(function(p3)
				-- upvalues: getSearchStore (copy)
				getSearchStore().invalidateAll()
				
				return p3
			end)
		end
	}
end
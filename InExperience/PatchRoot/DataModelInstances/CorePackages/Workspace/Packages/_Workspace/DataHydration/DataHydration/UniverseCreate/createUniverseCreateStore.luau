local DataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(DataHydration.Parent.HttpClient)
local FetchUniverseCreateModule = require(script.Parent.fetchUniverseCreate)
local _ = require(script.Parent.UniverseCreateStoreTypes)
local UniverseSearchModule = require(DataHydration.UniverseSearch)

return function(p1) --[[ Line: 20 | Named "createUniverseCreateStore" ]]
	-- upvalues: UniverseSearchModule (copy), FetchUniverseCreateModule (copy)
	local P0 = p1 or {}
	local GetSearchStore = P0.getSearchStore or function() --[[ Line: 22 ]]
		-- upvalues: UniverseSearchModule (upval)
		return UniverseSearchModule.getUniverseSearchStore()
	end
	
	return {
		createUniverse = function(p2) --[[ Line: 26 ]]
			-- upvalues: FetchUniverseCreateModule (upval), P0 (copy), GetSearchStore (copy)
			return FetchUniverseCreateModule(p2, { network = P0.network, baseUrl = P0.baseUrl }):andThen(function(Result) --[[ Line: 30 ]]
				-- upvalues: GetSearchStore (upval)
				GetSearchStore().invalidateAll()
				
				return Result
			end)
		end
	}
end
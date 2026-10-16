local DataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(DataHydration.Parent.HttpClient)
local CreateSingleEntityResolverModule = require(DataHydration.createSingleEntityResolver)
local FetchCreatorEligibilityModule = require(script.Parent.fetchCreatorEligibility)
local _ = require(script.Parent.CreatorEligibilityStoreTypes)

return function(p1) --[[ Line: 18 | Named "createCreatorEligibilityStore" ]]
	-- upvalues: CreateSingleEntityResolverModule (copy), FetchCreatorEligibilityModule (copy)
	local P0 = p1 or {}
	local config = { network = P0.network, baseUrl = P0.baseUrl }
	local SingleEntityResolverModule = CreateSingleEntityResolverModule(function(p2) --[[ Line: 22 ]]
		-- upvalues: FetchCreatorEligibilityModule (upval), config (copy)
		return FetchCreatorEligibilityModule.fetchEligibility(p2, config)
	end)
	
	return {
		getEligibility = SingleEntityResolverModule.get,
		fetchEligibility = SingleEntityResolverModule.fetch,
		getAndFetchEligibility = SingleEntityResolverModule.getAndFetch,
		updateEligibility = SingleEntityResolverModule.update,
		clear = SingleEntityResolverModule.clear,
		dispose = SingleEntityResolverModule.dispose
	}
end
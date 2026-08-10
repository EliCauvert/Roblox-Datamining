local dataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(dataHydration.Parent.HttpClient)
local createSingleEntityResolverModule = require(dataHydration.createSingleEntityResolver)
local fetchCreatorEligibilityModule = require(script.Parent.fetchCreatorEligibility)
local _ = require(script.Parent.CreatorEligibilityStoreTypes)

return function(p0) --[[ line: 18 | named "createCreatorEligibilityStore" ]]
	-- upvalues: createSingleEntityResolverModule (ref), fetchCreatorEligibilityModule (ref)
	p0 = p0 or {}
	local t = { network = p0.network, baseUrl = p0.baseUrl }
	local var5 = createSingleEntityResolverModule(function(p1) --[[ line: 22 ]]
		-- upvalues: fetchCreatorEligibilityModule (copy), t (ref)
		return fetchCreatorEligibilityModule.fetchEligibility(p1, t)
	end)
	
	return {
		getEligibility = var5.get,
		fetchEligibility = var5.fetch,
		getAndFetchEligibility = var5.getAndFetch,
		updateEligibility = var5.update,
		clear = var5.clear,
		dispose = var5.dispose
	}
end
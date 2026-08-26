local dataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(dataHydration.Parent.HttpClient)
local createSingleEntityResolverModule = require(dataHydration.createSingleEntityResolver)
local fetchCreatorEligibilityModule = require(script.Parent.fetchCreatorEligibility)
local _ = require(script.Parent.CreatorEligibilityStoreTypes)

return function(p1)
	-- upvalues: createSingleEntityResolverModule (ref), fetchCreatorEligibilityModule (ref)
	p1 = p1 or {}
	local t = { network = p1.network, baseUrl = p1.baseUrl }
	local var1 = createSingleEntityResolverModule(function(p2)
		-- upvalues: fetchCreatorEligibilityModule (copy), t (ref)
		return fetchCreatorEligibilityModule.fetchEligibility(p2, t)
	end)
	
	return {
		getEligibility = var1.get,
		fetchEligibility = var1.fetch,
		getAndFetchEligibility = var1.getAndFetch,
		updateEligibility = var1.update,
		clear = var1.clear,
		dispose = var1.dispose
	}
end
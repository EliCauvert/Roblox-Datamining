local dataHydration = script:FindFirstAncestor("DataHydration")
local createSingleEntityResolverModule = require(dataHydration.createSingleEntityResolver)
local _ = require(dataHydration.DataHydrationTypes)
local fetchLookByOutfitModule = require(script.Parent.Requests.fetchLookByOutfit)

return function(p1)
	-- upvalues: createSingleEntityResolverModule (ref), fetchLookByOutfitModule (ref)
	local var1 = createSingleEntityResolverModule(function(p2)
		-- upvalues: fetchLookByOutfitModule (copy), p1 (ref)
		return fetchLookByOutfitModule(p2, p1)
	end, { resolver = { replaceItems = true } })
	
	return {
		getCachedLookByOutfit = var1.get,
		getAndFetchLookByOutfit = var1.getAndFetch,
		clear = var1.clear,
		dispose = var1.dispose
	}
end
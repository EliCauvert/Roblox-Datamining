local dataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(dataHydration.Parent.HttpClient)
local createSingleEntityResolverModule = require(dataHydration.createSingleEntityResolver)
local fetchPlaceMediaModule = require(script.Parent.fetchPlaceMedia)
local _ = require(script.Parent.PlaceMediaStoreTypes)

return function(p1)
	-- upvalues: createSingleEntityResolverModule (ref), fetchPlaceMediaModule (ref)
	p1 = p1 or {}
	local t = { network = p1.network, baseUrl = p1.baseUrl }
	local var1 = createSingleEntityResolverModule(function(p2)
		-- upvalues: fetchPlaceMediaModule (copy), t (ref)
		return fetchPlaceMediaModule.fetchMedia(p2, t)
	end)
	
	return {
		getMedia = var1.get,
		fetchMedia = var1.fetch,
		getAndFetchMedia = var1.getAndFetch,
		updateMedia = var1.update,
		clear = var1.clear,
		dispose = var1.dispose
	}
end
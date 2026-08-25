local dataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(dataHydration.Parent.HttpClient)
local createSingleEntityResolverModule = require(dataHydration.createSingleEntityResolver)
local fetchPlaceMediaModule = require(script.Parent.fetchPlaceMedia)
local _ = require(script.Parent.PlaceMediaStoreTypes)

return function(p0)
	-- upvalues: createSingleEntityResolverModule (ref), fetchPlaceMediaModule (ref)
	p0 = p0 or {}
	local t = { network = p0.network, baseUrl = p0.baseUrl }
	local var5 = createSingleEntityResolverModule(function(p1)
		-- upvalues: fetchPlaceMediaModule (copy), t (ref)
		return fetchPlaceMediaModule.fetchMedia(p1, t)
	end)
	
	return {
		getMedia = var5.get,
		fetchMedia = var5.fetch,
		getAndFetchMedia = var5.getAndFetch,
		updateMedia = var5.update,
		clear = var5.clear,
		dispose = var5.dispose
	}
end
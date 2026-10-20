local DataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(DataHydration.Parent.HttpClient)
local CreateSingleEntityResolverModule = require(DataHydration.createSingleEntityResolver)
local FetchPlaceMediaModule = require(script.Parent.fetchPlaceMedia)
local _ = require(script.Parent.PlaceMediaStoreTypes)

return function(p1)
	-- upvalues: CreateSingleEntityResolverModule (copy), FetchPlaceMediaModule (copy)
	local P0 = p1 or {}
	local config = { network = P0.network, baseUrl = P0.baseUrl }
	local SingleEntityResolverModule = CreateSingleEntityResolverModule(function(p2)
		-- upvalues: FetchPlaceMediaModule (upval), config (copy)
		return FetchPlaceMediaModule.fetchMedia(p2, config)
	end)
	
	return {
		getMedia = SingleEntityResolverModule.get,
		fetchMedia = SingleEntityResolverModule.fetch,
		getAndFetchMedia = SingleEntityResolverModule.getAndFetch,
		updateMedia = SingleEntityResolverModule.update,
		clear = SingleEntityResolverModule.clear,
		dispose = SingleEntityResolverModule.dispose
	}
end
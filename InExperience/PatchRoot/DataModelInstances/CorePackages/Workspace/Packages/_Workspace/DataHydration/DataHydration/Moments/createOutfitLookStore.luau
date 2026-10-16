local DataHydration = script:FindFirstAncestor("DataHydration")
local CreateSingleEntityResolverModule = require(DataHydration.createSingleEntityResolver)
local _ = require(DataHydration.DataHydrationTypes)
local FetchLookByOutfitModule = require(script.Parent.Requests.fetchLookByOutfit)

return function(p1) --[[ Line: 25 | Named "createOutfitLookStore" ]]
	-- upvalues: CreateSingleEntityResolverModule (copy), FetchLookByOutfitModule (copy)
	local SingleEntityResolverModule = CreateSingleEntityResolverModule(function(p2) --[[ Line: 26 ]]
		-- upvalues: FetchLookByOutfitModule (upval), p1 (copy)
		return FetchLookByOutfitModule(p2, p1)
	end, { resolver = { replaceItems = true } })
	
	return {
		getCachedLookByOutfit = SingleEntityResolverModule.get,
		getAndFetchLookByOutfit = SingleEntityResolverModule.getAndFetch,
		clear = SingleEntityResolverModule.clear,
		dispose = SingleEntityResolverModule.dispose
	}
end
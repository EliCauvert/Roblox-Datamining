local DataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(DataHydration.Parent.HttpClient)
local CreateSingleEntityResolverModule = require(DataHydration.createSingleEntityResolver)
local FetchIsPrivatePlaytesterModule = require(script.Parent.fetchIsPrivatePlaytester)
local _ = require(script.Parent.IsPrivatePlaytesterStoreTypes)

return function(p1) --[[ Line: 18 | Named "createIsPrivatePlaytesterStore" ]]
	-- upvalues: CreateSingleEntityResolverModule (copy), FetchIsPrivatePlaytesterModule (copy)
	local P0 = p1 or {}
	local config = { network = P0.network, baseUrl = P0.baseUrl }
	local SingleEntityResolverModule = CreateSingleEntityResolverModule(function(p2) --[[ Line: 22 ]]
		-- upvalues: FetchIsPrivatePlaytesterModule (upval), config (copy)
		return FetchIsPrivatePlaytesterModule(p2, config)
	end)
	
	return {
		get = SingleEntityResolverModule.get,
		fetch = SingleEntityResolverModule.fetch,
		getAndFetch = SingleEntityResolverModule.getAndFetch,
		update = SingleEntityResolverModule.update,
		clear = SingleEntityResolverModule.clear,
		dispose = SingleEntityResolverModule.dispose
	}
end
local dataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(dataHydration.Parent.HttpClient)
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local fetchCreatorGroupsModule = require(script.Parent.fetchCreatorGroups)
local _ = require(script.Parent.CreatorGroupsStoreTypes)

return function(p1)
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), fetchCreatorGroupsModule (ref)
	p1 = p1 or {}
	local var1 = createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = createDataCacheModule(),
		fetchFn = function(p2, _)
			-- upvalues: fetchCreatorGroupsModule (copy), p1 (ref)
			return fetchCreatorGroupsModule(p2, { network = p1.network, baseUrl = p1.baseUrl })
		end
	})
	
	return {
		getGroups = function(p2)
			-- upvalues: var1 (ref)
			return var1.getCachedItem(p2)
		end,
		fetchGroups = function(p2)
			-- upvalues: var1 (ref)
			return var1.fetchItem(p2)
		end,
		getAndFetchGroups = function(p2)
			-- upvalues: var1 (ref)
			return var1.getAndFetchItem(p2)
		end,
		clear = var1.clear,
		dispose = var1.dispose
	}
end
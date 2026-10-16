local DataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(DataHydration.Parent.HttpClient)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local FetchCreatorGroupsModule = require(script.Parent.fetchCreatorGroups)
local _ = require(script.Parent.CreatorGroupsStoreTypes)

return function(p1) --[[ Line: 22 | Named "createCreatorGroupsStore" ]]
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), FetchCreatorGroupsModule (copy)
	local P0 = p1 or {}
	local DataResolverModule = CreateDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = CreateDataCacheModule(),
		fetchFn = function(p2, _) --[[ Line: 30 ]]
			-- upvalues: FetchCreatorGroupsModule (upval), P0 (copy)
			return FetchCreatorGroupsModule(p2, { network = P0.network, baseUrl = P0.baseUrl })
		end
	})
	
	return {
		getGroups = function(p2) --[[ Line: 39 ]]
			-- upvalues: DataResolverModule (copy)
			return DataResolverModule.getCachedItem(p2)
		end,
		fetchGroups = function(p2) --[[ Line: 42 ]]
			-- upvalues: DataResolverModule (copy)
			return DataResolverModule.fetchItem(p2)
		end,
		getAndFetchGroups = function(p2) --[[ Line: 45 ]]
			-- upvalues: DataResolverModule (copy)
			return DataResolverModule.getAndFetchItem(p2)
		end,
		clear = DataResolverModule.clear,
		dispose = DataResolverModule.dispose
	}
end
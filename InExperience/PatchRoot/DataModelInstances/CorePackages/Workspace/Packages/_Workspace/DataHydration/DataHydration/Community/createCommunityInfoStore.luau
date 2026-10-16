local DataHydration = script:FindFirstAncestor("DataHydration")
local PromiseModule = require(DataHydration.Parent.Promise)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local _ = require(DataHydration.DataHydrationTypes)
local _ = require(script.Parent.CommunityInfoStoreTypes)
local CreateDataResolverModule = require(DataHydration.createDataResolver)

return function() --[[ Line: 10 | Named "createCommunityInfoStore" ]]
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), PromiseModule (copy)
	local DataCacheModule = CreateDataCacheModule()
	local DataResolverModule = CreateDataResolverModule({
		cache = DataCacheModule,
		fetchFn = function(_) --[[ Line: 14 ]]
			-- upvalues: PromiseModule (upval)
			return PromiseModule.resolve({})
		end
	})
	
	return {
		getCommunityInfo = DataResolverModule.getCachedItem,
		getCommunityInfos = DataResolverModule.getCachedItems,
		updateCommunityInfo = DataCacheModule.updateItem,
		updateCommunityInfos = DataCacheModule.updateItems,
		clear = DataResolverModule.clear,
		dispose = DataResolverModule.dispose
	}
end
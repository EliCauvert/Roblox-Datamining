local DataHydration = script:FindFirstAncestor("DataHydration")
local PromiseModule = require(DataHydration.Parent.Promise)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local _ = require(DataHydration.DataHydrationTypes)
local _ = require(script.Parent.CreatorInfoStoreTypes)
local CreateDataResolverModule = require(DataHydration.createDataResolver)

return function() --[[ Line: 10 | Named "createCreatorInfoStore" ]]
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
		getCreatorInfo = DataResolverModule.getCachedItem,
		getCreatorInfos = DataResolverModule.getCachedItems,
		updateCreatorInfo = DataCacheModule.updateItem,
		updateCreatorInfos = DataCacheModule.updateItems,
		clear = DataCacheModule.clear,
		dispose = DataCacheModule.dispose
	}
end
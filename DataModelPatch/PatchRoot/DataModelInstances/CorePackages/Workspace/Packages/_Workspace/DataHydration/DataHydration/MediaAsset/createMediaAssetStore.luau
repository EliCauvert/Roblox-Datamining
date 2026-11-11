local DataHydration = script:FindFirstAncestor("DataHydration")
local PromiseModule = require(DataHydration.Parent.Promise)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local _ = require(script.Parent.MediaAssetStoreTypes)

return function()
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), PromiseModule (copy)
	local DataCacheModule = CreateDataCacheModule()
	local DataResolverModule = CreateDataResolverModule({
		cache = DataCacheModule,
		fetchFn = function(_)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.resolve({})
		end
	})
	
	return {
		getMediaAsset = DataResolverModule.getCachedItem,
		getMediaAssets = DataResolverModule.getCachedItems,
		updateMediaAssets = DataCacheModule.updateItems,
		updateMediaAsset = DataCacheModule.updateItem,
		clear = DataResolverModule.clear,
		dispose = DataResolverModule.dispose
	}
end
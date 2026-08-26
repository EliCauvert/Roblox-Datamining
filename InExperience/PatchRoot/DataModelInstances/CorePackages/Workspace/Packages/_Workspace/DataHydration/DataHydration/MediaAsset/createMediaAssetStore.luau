local dataHydration = script:FindFirstAncestor("DataHydration")
local promiseModule = require(dataHydration.Parent.Promise)
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local _ = require(script.Parent.MediaAssetStoreTypes)

return function()
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), promiseModule (ref)
	local var1 = createDataCacheModule()
	local var2 = createDataResolverModule({
		cache = var1,
		fetchFn = function(_)
			-- upvalues: promiseModule (copy)
			return promiseModule.resolve({})
		end
	})
	
	return {
		getMediaAsset = var2.getCachedItem,
		getMediaAssets = var2.getCachedItems,
		updateMediaAssets = var1.updateItems,
		updateMediaAsset = var1.updateItem,
		clear = var2.clear,
		dispose = var2.dispose
	}
end
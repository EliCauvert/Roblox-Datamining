local dataHydration = script:FindFirstAncestor("DataHydration")
local promiseModule = require(dataHydration.Parent.Promise)
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local _ = require(script.Parent.MediaAssetStoreTypes)

return function() --[[ line: 17 | named "createMediaAssetStore" ]]
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), promiseModule (ref)
	local var4 = createDataCacheModule()
	local var5 = createDataResolverModule({
		cache = var4,
		fetchFn = function(_) --[[ line: 21 ]]
			-- upvalues: promiseModule (copy)
			return promiseModule.resolve({})
		end
	})
	
	return {
		getMediaAsset = var5.getCachedItem,
		getMediaAssets = var5.getCachedItems,
		updateMediaAssets = var4.updateItems,
		updateMediaAsset = var4.updateItem,
		clear = var5.clear,
		dispose = var5.dispose
	}
end
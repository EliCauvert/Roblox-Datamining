local dataHydration = script:FindFirstAncestor("DataHydration")
local promiseModule = require(dataHydration.Parent.Promise)
local createDataCacheModule = require(dataHydration.createDataCache)
local _ = require(dataHydration.DataHydrationTypes)
local _ = require(script.Parent.MarketplaceBundleStoreTypes)
local createDataResolverModule = require(dataHydration.createDataResolver)

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
		getMarketplaceBundleInfo = var2.getCachedItem,
		getMarketplaceBundleInfos = var2.getCachedItems,
		updateMarketplaceBundleInfo = var1.updateItem,
		updateMarketplaceBundleInfos = var1.updateItems,
		clear = var1.clear,
		dispose = var1.dispose
	}
end
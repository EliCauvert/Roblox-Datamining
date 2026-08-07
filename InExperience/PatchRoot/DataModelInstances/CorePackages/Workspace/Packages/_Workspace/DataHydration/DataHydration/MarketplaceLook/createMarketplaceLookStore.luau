local dataHydration = script:FindFirstAncestor("DataHydration")
local promiseModule = require(dataHydration.Parent.Promise)
local createDataCacheModule = require(dataHydration.createDataCache)
local _ = require(dataHydration.DataHydrationTypes)
local _ = require(script.Parent.MarketplaceLookStoreTypes)
local createDataResolverModule = require(dataHydration.createDataResolver)

return function() --[[ line: 10 | named "createMarketplaceLookStore" ]]
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), promiseModule (ref)
	local var4 = createDataCacheModule()
	local var5 = createDataResolverModule({
		cache = var4,
		fetchFn = function(_) --[[ line: 15 ]]
			-- upvalues: promiseModule (copy)
			return promiseModule.resolve({})
		end
	})
	
	return {
		getMarketplaceLookInfo = var5.getCachedItem,
		getMarketplaceLookInfos = var5.getCachedItems,
		updateMarketplaceLookInfo = var4.updateItem,
		updateMarketplaceLookInfos = var4.updateItems,
		clear = var4.clear,
		dispose = var4.dispose
	}
end
local dataHydration = script:FindFirstAncestor("DataHydration")
local promiseModule = require(dataHydration.Parent.Promise)
local createDataCacheModule = require(dataHydration.createDataCache)
local _ = require(dataHydration.DataHydrationTypes)
local _ = require(script.Parent.CreatorInfoStoreTypes)
local createDataResolverModule = require(dataHydration.createDataResolver)

return function()
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), promiseModule (ref)
	local var4 = createDataCacheModule()
	local var5 = createDataResolverModule({
		cache = var4,
		fetchFn = function(_)
			-- upvalues: promiseModule (copy)
			return promiseModule.resolve({})
		end
	})
	
	return {
		getCreatorInfo = var5.getCachedItem,
		getCreatorInfos = var5.getCachedItems,
		updateCreatorInfo = var4.updateItem,
		updateCreatorInfos = var4.updateItems,
		clear = var4.clear,
		dispose = var4.dispose
	}
end
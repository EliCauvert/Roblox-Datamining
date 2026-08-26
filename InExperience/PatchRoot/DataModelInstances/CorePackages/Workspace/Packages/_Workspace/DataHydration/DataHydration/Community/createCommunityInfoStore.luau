local dataHydration = script:FindFirstAncestor("DataHydration")
local promiseModule = require(dataHydration.Parent.Promise)
local createDataCacheModule = require(dataHydration.createDataCache)
local _ = require(dataHydration.DataHydrationTypes)
local _ = require(script.Parent.CommunityInfoStoreTypes)
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
		getCommunityInfo = var2.getCachedItem,
		getCommunityInfos = var2.getCachedItems,
		updateCommunityInfo = var1.updateItem,
		updateCommunityInfos = var1.updateItems,
		clear = var2.clear,
		dispose = var2.dispose
	}
end
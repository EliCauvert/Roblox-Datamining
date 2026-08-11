local dataHydration = script:FindFirstAncestor("DataHydration")
local promiseModule = require(dataHydration.Parent.Promise)
local createDataCacheModule = require(dataHydration.createDataCache)
local _ = require(dataHydration.DataHydrationTypes)
local _ = require(script.Parent.CommunityInfoStoreTypes)
local createDataResolverModule = require(dataHydration.createDataResolver)

return function() --[[ line: 10 | named "createCommunityInfoStore" ]]
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), promiseModule (ref)
	local var4 = createDataCacheModule()
	local var5 = createDataResolverModule({
		cache = var4,
		fetchFn = function(_) --[[ line: 14 ]]
			-- upvalues: promiseModule (copy)
			return promiseModule.resolve({})
		end
	})
	
	return {
		getCommunityInfo = var5.getCachedItem,
		getCommunityInfos = var5.getCachedItems,
		updateCommunityInfo = var4.updateItem,
		updateCommunityInfos = var4.updateItems,
		clear = var5.clear,
		dispose = var5.dispose
	}
end
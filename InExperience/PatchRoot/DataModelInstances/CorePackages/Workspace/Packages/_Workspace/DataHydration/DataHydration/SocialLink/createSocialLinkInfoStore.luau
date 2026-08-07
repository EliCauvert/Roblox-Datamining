local dataHydration = script:FindFirstAncestor("DataHydration")
local promiseModule = require(dataHydration.Parent.Promise)
local createDataCacheModule = require(dataHydration.createDataCache)
local _ = require(dataHydration.DataHydrationTypes)
local _ = require(script.Parent.SocialLinkInfoStoreTypes)
local createDataResolverModule = require(dataHydration.createDataResolver)

return function() --[[ line: 10 | named "createSocialLinkInfoStore" ]]
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
		getSocialLinkInfo = var5.getCachedItem,
		getSocialLinkInfos = var5.getCachedItems,
		updateSocialLinkInfo = var4.updateItem,
		updateSocialLinkInfos = var4.updateItems,
		clear = var4.clear,
		dispose = var4.dispose
	}
end
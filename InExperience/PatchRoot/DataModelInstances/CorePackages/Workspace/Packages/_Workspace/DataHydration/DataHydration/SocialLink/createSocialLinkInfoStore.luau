local dataHydration = script:FindFirstAncestor("DataHydration")
local promiseModule = require(dataHydration.Parent.Promise)
local createDataCacheModule = require(dataHydration.createDataCache)
local _ = require(dataHydration.DataHydrationTypes)
local _ = require(script.Parent.SocialLinkInfoStoreTypes)
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
		getSocialLinkInfo = var2.getCachedItem,
		getSocialLinkInfos = var2.getCachedItems,
		updateSocialLinkInfo = var1.updateItem,
		updateSocialLinkInfos = var1.updateItems,
		clear = var1.clear,
		dispose = var1.dispose
	}
end
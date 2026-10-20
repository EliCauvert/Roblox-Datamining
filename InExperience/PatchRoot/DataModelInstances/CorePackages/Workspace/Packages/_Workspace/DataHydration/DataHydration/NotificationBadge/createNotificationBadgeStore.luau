local DataHydration = script:FindFirstAncestor("DataHydration")
local PromiseModule = require(DataHydration.Parent.Promise)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local _ = require(DataHydration.DataHydrationTypes)
local _ = require(script.Parent.NotificationBadgeStoreTypes)
local CreateDataResolverModule = require(DataHydration.createDataResolver)

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
		getNotificationBadge = DataResolverModule.getCachedItem,
		getNotificationBadges = DataResolverModule.getCachedItems,
		updateNotificationBadge = DataCacheModule.updateItem,
		updateNotificationBadges = DataCacheModule.updateItems,
		clear = DataResolverModule.clear,
		dispose = DataResolverModule.dispose
	}
end
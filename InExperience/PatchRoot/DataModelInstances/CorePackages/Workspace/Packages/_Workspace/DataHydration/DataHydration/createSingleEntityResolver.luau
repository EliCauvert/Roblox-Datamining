local DataHydration = script:FindFirstAncestor("DataHydration")
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local t = {}
local t1 = {}

return function(Callback, p1) --[[ Line: 49 | Named "createSingleEntityResolver" ]]
	-- upvalues: t (copy), t1 (copy), CreateDataCacheModule (copy), CreateDataResolverModule (copy)
	local Cache = p1 and p1.cache or t
	local Resolver = p1 and p1.resolver or t1
	local DataCacheModule = CreateDataCacheModule(Cache.ttlSeconds, Cache.failedTtlSeconds, { ttlSecondsForItem = Cache.ttlSecondsForItem })
	local DataResolverModule = CreateDataResolverModule({
		supportsMultiGet = false,
		cache = DataCacheModule,
		fetchFn = function(p2, _) --[[ Line: 61 ]]
			-- upvalues: Callback (copy)
			return Callback((tonumber(p2)))
		end,
		queueProcessDelaySec = Resolver.queueProcessDelaySec,
		requestTimeoutSec = Resolver.requestTimeoutSec,
		replaceItems = Resolver.replaceItems,
		logError = Resolver.logError,
		onClear = Resolver.onClear
	})
	
	return {
		cache = DataCacheModule,
		get = function(p2) --[[ Line: 73 ]]
			-- upvalues: DataResolverModule (copy)
			return DataResolverModule.getCachedItem((tostring(p2)))
		end,
		fetch = function(p2) --[[ Line: 76 ]]
			-- upvalues: DataResolverModule (copy)
			return DataResolverModule.fetchItem((tostring(p2)))
		end,
		getAndFetch = function(p2) --[[ Line: 79 ]]
			-- upvalues: DataResolverModule (copy)
			return DataResolverModule.getAndFetchItem((tostring(p2)))
		end,
		update = function(p2, p3) --[[ Line: 82 ]]
			-- upvalues: DataCacheModule (copy)
			DataCacheModule.updateItem(tostring(p2), p3)
		end,
		getAccountResetGeneration = DataResolverModule.getAccountResetGeneration,
		clear = DataResolverModule.clear,
		dispose = DataResolverModule.dispose
	}
end
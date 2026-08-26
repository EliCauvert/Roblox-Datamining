local dataHydration = script:FindFirstAncestor("DataHydration")
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local t = {}
local t_1 = {}

return function(p1, p2)
	-- upvalues: t (ref), t_1 (ref), createDataCacheModule (ref), createDataResolverModule (ref)
	local var1 = if p2 then p2.cache else t
	local var2 = if p2 then p2.resolver else t_1
	local var3 = createDataCacheModule(var1.ttlSeconds, var1.failedTtlSeconds)
	local var4 = createDataResolverModule({
		supportsMultiGet = false,
		cache = var3,
		fetchFn = function(p3, _)
			-- upvalues: p1 (ref)
			return p1(tonumber(p3))
		end,
		queueProcessDelaySec = var2.queueProcessDelaySec,
		requestTimeoutSec = var2.requestTimeoutSec,
		logError = var2.logError,
		onClear = var2.onClear
	})
	
	return {
		cache = var3,
		get = function(p3)
			-- upvalues: var4 (ref)
			return var4.getCachedItem(tostring(p3))
		end,
		fetch = function(p3)
			-- upvalues: var4 (ref)
			return var4.fetchItem(tostring(p3))
		end,
		getAndFetch = function(p3)
			-- upvalues: var4 (ref)
			return var4.getAndFetchItem(tostring(p3))
		end,
		update = function(p3, p4)
			-- upvalues: var3 (ref)
			var3.updateItem(tostring(p3), p4)
		end,
		clear = var4.clear,
		dispose = var4.dispose
	}
end
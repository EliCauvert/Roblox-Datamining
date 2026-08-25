local dataHydration = script:FindFirstAncestor("DataHydration")
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local t = {}
local t_1 = {}

return function(p0, p1)
	-- upvalues: t (ref), t_1 (ref), createDataCacheModule (ref), createDataResolverModule (ref)
	local var5 = if p1 then p1.cache else t
	local var6 = if p1 then p1.resolver else t_1
	local var7 = createDataCacheModule(var5.ttlSeconds, var5.failedTtlSeconds)
	local var8 = createDataResolverModule({
		supportsMultiGet = false,
		cache = var7,
		fetchFn = function(p2, _)
			-- upvalues: p0 (ref)
			return p0(tonumber(p2))
		end,
		queueProcessDelaySec = var6.queueProcessDelaySec,
		requestTimeoutSec = var6.requestTimeoutSec,
		logError = var6.logError,
		onClear = var6.onClear
	})
	
	return {
		cache = var7,
		get = function(p3)
			-- upvalues: var8 (ref)
			return var8.getCachedItem(tostring(p3))
		end,
		fetch = function(p4)
			-- upvalues: var8 (ref)
			return var8.fetchItem(tostring(p4))
		end,
		getAndFetch = function(p5)
			-- upvalues: var8 (ref)
			return var8.getAndFetchItem(tostring(p5))
		end,
		update = function(p6, p7)
			-- upvalues: var7 (ref)
			var7.updateItem(tostring(p6), p7)
		end,
		clear = var8.clear,
		dispose = var8.dispose
	}
end
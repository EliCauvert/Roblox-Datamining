local dataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(dataHydration.Parent.HttpClient)
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local fetchCampaignStatsModule = require(script.Parent.fetchCampaignStats)
local _ = require(script.Parent.CampaignStatsTypes)

return function(p1)
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), fetchCampaignStatsModule (ref)
	p1 = p1 or {}
	local t = {
		network = p1.network,
		baseUrl = p1.baseUrl,
		nowMs = p1.nowMs
	}
	local var1 = createDataCacheModule(p1.ttlSeconds or 300)
	local var2 = createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = var1,
		fetchFn = function(p2, _)
			-- upvalues: fetchCampaignStatsModule (copy), t (ref)
			return fetchCampaignStatsModule.fetchCampaignStats(tonumber(p2), t)
		end
	})
	
	return {
		getCampaignStats = function(p2)
			-- upvalues: var2 (ref)
			return var2.getCachedItem(tostring(p2))
		end,
		fetchCampaignStats = function(p2)
			-- upvalues: var2 (ref)
			return var2.fetchItem(tostring(p2))
		end,
		getAndFetchCampaignStats = function(p2)
			-- upvalues: var2 (ref)
			return var2.getAndFetchItem(tostring(p2))
		end,
		isCampaignStatsRequestInQueueOrInFlight = function(p2)
			-- upvalues: var2 (ref)
			return var2.isRequestInQueueOrInFlight(tostring(p2))
		end,
		updateCampaignStats = function(p2, p3)
			-- upvalues: var1 (ref)
			var1.replaceItem(tostring(p2), p3)
		end,
		clear = var2.clear,
		dispose = var2.dispose
	}
end
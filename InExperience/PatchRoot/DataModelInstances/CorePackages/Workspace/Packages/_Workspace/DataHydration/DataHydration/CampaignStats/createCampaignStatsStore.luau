local DataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(DataHydration.Parent.HttpClient)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local FetchCampaignStatsModule = require(script.Parent.fetchCampaignStats)
local _ = require(script.Parent.CampaignStatsTypes)

return function(p1)
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), FetchCampaignStatsModule (copy)
	local P0 = p1 or {}
	local config = {
		network = P0.network,
		baseUrl = P0.baseUrl,
		nowMs = P0.nowMs
	}
	local DataCacheModule = CreateDataCacheModule(P0.ttlSeconds or 300)
	local DataResolverModule = CreateDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = DataCacheModule,
		fetchFn = function(p2, _)
			-- upvalues: FetchCampaignStatsModule (upval), config (copy)
			return FetchCampaignStatsModule.fetchCampaignStats(tonumber(p2), config)
		end
	})
	
	return {
		getCampaignStats = function(p2)
			-- upvalues: DataResolverModule (copy)
			return DataResolverModule.getCachedItem((tostring(p2)))
		end,
		fetchCampaignStats = function(Number)
			-- upvalues: DataResolverModule (copy)
			return DataResolverModule.fetchItem((tostring(Number)))
		end,
		getAndFetchCampaignStats = function(p2, p3)
			-- upvalues: DataResolverModule (copy)
			return DataResolverModule.getAndFetchItem(tostring(p2), p3)
		end,
		isCampaignStatsRequestInQueueOrInFlight = function(p2)
			-- upvalues: DataResolverModule (copy)
			return DataResolverModule.isRequestInQueueOrInFlight((tostring(p2)))
		end,
		updateCampaignStats = function(p2, ByCampaign)
			-- upvalues: DataCacheModule (copy)
			DataCacheModule.replaceItem(tostring(p2), {
				byCampaign = ByCampaign,
				failedMetrics = {
					plays = false,
					adClicks = false,
					adViews = false,
					playtimeSeconds = false
				}
			})
		end,
		clear = DataResolverModule.clear,
		dispose = DataResolverModule.dispose
	}
end
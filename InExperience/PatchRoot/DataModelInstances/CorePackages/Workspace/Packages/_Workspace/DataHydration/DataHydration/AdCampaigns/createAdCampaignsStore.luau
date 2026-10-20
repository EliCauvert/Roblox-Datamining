local DataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(DataHydration.Parent.HttpClient)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local FetchAdCampaignsModule = require(script.Parent.fetchAdCampaigns)
local _ = require(script.Parent.AdCampaignsTypes)

return function(p1)
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), FetchAdCampaignsModule (copy)
	local P0 = p1 or {}
	local config = { network = P0.network, baseUrl = P0.baseUrl }
	local DataCacheModule = CreateDataCacheModule(P0.ttlSeconds or 300)
	local DataResolverModule = CreateDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = DataCacheModule,
		fetchFn = function(_, _)
			-- upvalues: FetchAdCampaignsModule (upval), config (copy)
			return FetchAdCampaignsModule.fetchAdCampaigns(config)
		end
	})
	
	return {
		getAdCampaigns = function()
			-- upvalues: DataResolverModule (copy)
			return DataResolverModule.getCachedItem("0")
		end,
		fetchAdCampaigns = function()
			-- upvalues: DataResolverModule (copy)
			return DataResolverModule.fetchItem("0")
		end,
		getAndFetchAdCampaigns = function()
			-- upvalues: DataResolverModule (copy)
			return DataResolverModule.getAndFetchItem("0")
		end,
		isAdCampaignsRequestInQueueOrInFlight = function()
			-- upvalues: DataResolverModule (copy)
			return DataResolverModule.isRequestInQueueOrInFlight("0")
		end,
		updateAdCampaigns = function(p2)
			-- upvalues: DataCacheModule (copy)
			DataCacheModule.replaceItem("0", p2)
		end,
		clear = DataResolverModule.clear,
		dispose = DataResolverModule.dispose
	}
end
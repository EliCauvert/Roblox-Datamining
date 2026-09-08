local dataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(dataHydration.Parent.HttpClient)
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local fetchAdCampaignsModule = require(script.Parent.fetchAdCampaigns)
local _ = require(script.Parent.AdCampaignsTypes)

return function(p1)
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), fetchAdCampaignsModule (ref)
	p1 = p1 or {}
	local t = { network = p1.network, baseUrl = p1.baseUrl }
	local var1 = createDataCacheModule(p1.ttlSeconds or 300)
	local var2 = createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = var1,
		fetchFn = function(_, _)
			-- upvalues: fetchAdCampaignsModule (copy), t (ref)
			return fetchAdCampaignsModule.fetchAdCampaigns(t)
		end
	})
	
	return {
		getAdCampaigns = function()
			-- upvalues: var2 (ref)
			return var2.getCachedItem("0")
		end,
		fetchAdCampaigns = function()
			-- upvalues: var2 (ref)
			return var2.fetchItem("0")
		end,
		getAndFetchAdCampaigns = function()
			-- upvalues: var2 (ref)
			return var2.getAndFetchItem("0")
		end,
		isAdCampaignsRequestInQueueOrInFlight = function()
			-- upvalues: var2 (ref)
			return var2.isRequestInQueueOrInFlight("0")
		end,
		updateAdCampaigns = function(p2)
			-- upvalues: var1 (ref)
			var1.replaceItem("0", p2)
		end,
		clear = var2.clear,
		dispose = var2.dispose
	}
end
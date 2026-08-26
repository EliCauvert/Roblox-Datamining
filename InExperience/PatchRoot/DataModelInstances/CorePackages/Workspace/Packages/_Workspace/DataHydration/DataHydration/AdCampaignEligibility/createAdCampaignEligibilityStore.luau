local dataHydration = script:FindFirstAncestor("DataHydration")
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local fetchAdCampaignEligibilityModule = require(script.Parent.fetchAdCampaignEligibility)
local _ = require(script.Parent.AdCampaignEligibilityStoreTypes)

return function(p1)
	-- upvalues: fetchAdCampaignEligibilityModule (ref), createDataCacheModule (ref), createDataResolverModule (ref)
	local var1 = if p1 and p1.fetchEligibility then p1.fetchEligibility else fetchAdCampaignEligibilityModule
	local var2 = createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = createDataCacheModule(),
		fetchFn = function(p2, _)
			-- upvalues: var1 (write)
			return var1(tonumber(p2))
		end
	})
	
	return {
		getEligibility = function(p2)
			-- upvalues: var2 (ref)
			return var2.getCachedItem(tostring(p2))
		end,
		fetchEligibility = function(p2)
			-- upvalues: var2 (ref)
			return var2.fetchItem(tostring(p2))
		end,
		getAndFetchEligibility = function(p2)
			-- upvalues: var2 (ref)
			return var2.getAndFetchItem(tostring(p2))
		end,
		clear = var2.clear,
		dispose = var2.dispose
	}
end
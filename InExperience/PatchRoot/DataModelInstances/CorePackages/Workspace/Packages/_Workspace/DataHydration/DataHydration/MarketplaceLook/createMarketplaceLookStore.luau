local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local PromiseModule = require(Parent.Promise)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local _ = require(DataHydration.DataHydrationTypes)
local _ = require(script.Parent.MarketplaceLookStoreTypes)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local FFlagDataHydrationAccountReset = require(Parent.SharedFlags).FFlagDataHydrationAccountReset

return function()
	-- upvalues: CreateDataCacheModule (copy), FFlagDataHydrationAccountReset (copy), CreateDataResolverModule (copy), PromiseModule (copy)
	local DataCacheModule = CreateDataCacheModule(nil, nil, if FFlagDataHydrationAccountReset then { observeLocalUser = false } else nil)
	local DataResolverModule = CreateDataResolverModule({
		cache = DataCacheModule,
		fetchFn = function(_)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.resolve({})
		end,
		keepCacheOnAccountReset = if FFlagDataHydrationAccountReset then true else nil
	})
	
	return {
		getMarketplaceLookInfo = DataResolverModule.getCachedItem,
		getMarketplaceLookInfos = DataResolverModule.getCachedItems,
		updateMarketplaceLookInfo = DataCacheModule.updateItem,
		updateMarketplaceLookInfos = DataCacheModule.updateItems,
		clear = DataCacheModule.clear,
		dispose = DataCacheModule.dispose
	}
end
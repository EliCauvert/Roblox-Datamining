local DataHydration = script:FindFirstAncestor("DataHydration")
local PromiseModule = require(DataHydration.Parent.Promise)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local _ = require(DataHydration.DataHydrationTypes)
local _ = require(script.Parent.MarketplaceLookStoreTypes)
local CreateDataResolverModule = require(DataHydration.createDataResolver)

return function() --[[ Line: 10 | Named "createMarketplaceLookStore" ]]
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), PromiseModule (copy)
	local DataCacheModule = CreateDataCacheModule()
	local DataResolverModule = CreateDataResolverModule({
		cache = DataCacheModule,
		fetchFn = function(_) --[[ Line: 15 ]]
			-- upvalues: PromiseModule (upval)
			return PromiseModule.resolve({})
		end
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
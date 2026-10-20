local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local PromiseModule = require(Parent.Promise)
local SignalsModule = require(Parent.Signals)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local _ = require(script.Parent.MarketplaceCatalogSortStoreTypes)
local FFlagMarketplaceCatalogSortTrackLastReceived = require(Parent.SharedFlags).FFlagMarketplaceCatalogSortTrackLastReceived

return function()
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), PromiseModule (copy), FFlagMarketplaceCatalogSortTrackLastReceived (copy), SignalsModule (copy)
	local DataCacheModule = CreateDataCacheModule()
	local DataResolverModule = CreateDataResolverModule({
		cache = DataCacheModule,
		fetchFn = function(_)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.resolve({})
		end
	})
	local GetLastReceivedSorts = nil
	local Callback = nil
	
	if FFlagMarketplaceCatalogSortTrackLastReceived then
		GetLastReceivedSorts, Callback = SignalsModule.createSignal({})
	end
	local function updateMarketplaceCatalogSorts(p1)
		-- upvalues: Callback (ref), DataCacheModule (copy)
		Callback(p1)
		DataCacheModule.updateItems(p1)
	end
	
	local function clear()
		-- upvalues: Callback (ref), DataResolverModule (copy)
		if Callback then
			Callback({})
		end
		DataResolverModule.clear()
	end
	
	return {
		getMarketplaceCatalogSort = DataResolverModule.getCachedItem,
		getMarketplaceCatalogSorts = DataResolverModule.getCachedItems,
		updateMarketplaceCatalogSorts = if FFlagMarketplaceCatalogSortTrackLastReceived then updateMarketplaceCatalogSorts else DataCacheModule.updateItems,
		updateMarketplaceCatalogSort = DataCacheModule.updateItem,
		getLastReceivedSorts = GetLastReceivedSorts,
		clear = if FFlagMarketplaceCatalogSortTrackLastReceived then clear else DataResolverModule.clear,
		dispose = DataResolverModule.dispose
	}
end
local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local PromiseModule = require(Parent.Promise)
local SignalsModule = require(Parent.Signals)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local _ = require(script.Parent.MarketplaceCatalogCategoryStoreTypes)
local FFlagMarketplaceCatalogCategoryTrackLastReceived = require(Parent.SharedFlags).FFlagMarketplaceCatalogCategoryTrackLastReceived

return function()
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), PromiseModule (copy), FFlagMarketplaceCatalogCategoryTrackLastReceived (copy), SignalsModule (copy)
	local DataCacheModule = CreateDataCacheModule()
	local DataResolverModule = CreateDataResolverModule({
		cache = DataCacheModule,
		fetchFn = function(_)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.resolve({})
		end
	})
	local GetLastReceivedCategories = nil
	local Callback = nil
	
	if FFlagMarketplaceCatalogCategoryTrackLastReceived then
		GetLastReceivedCategories, Callback = SignalsModule.createSignal({})
	end
	local function updateMarketplaceCatalogCategories(p1)
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
		getMarketplaceCatalogCategory = DataResolverModule.getCachedItem,
		getMarketplaceCatalogCategories = DataResolverModule.getCachedItems,
		updateMarketplaceCatalogCategories = if FFlagMarketplaceCatalogCategoryTrackLastReceived then updateMarketplaceCatalogCategories else DataCacheModule.updateItems,
		updateMarketplaceCatalogCategory = DataCacheModule.updateItem,
		getLastReceivedCategories = GetLastReceivedCategories,
		clear = if FFlagMarketplaceCatalogCategoryTrackLastReceived then clear else DataResolverModule.clear,
		dispose = DataResolverModule.dispose
	}
end
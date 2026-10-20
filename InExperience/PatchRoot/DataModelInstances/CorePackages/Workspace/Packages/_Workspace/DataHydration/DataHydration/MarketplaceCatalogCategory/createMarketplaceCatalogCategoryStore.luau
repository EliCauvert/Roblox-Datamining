local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local PromiseModule = require(Parent.Promise)
local SignalsModule = require(Parent.Signals)
local SharedFlagsModule = require(Parent.SharedFlags)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local _ = require(script.Parent.MarketplaceCatalogCategoryStoreTypes)
local FFlagMarketplaceCatalogCategoryTrackLastReceived = SharedFlagsModule.FFlagMarketplaceCatalogCategoryTrackLastReceived
local FFlagSduiSkipEmptyCatalogCategoryHydration = SharedFlagsModule.FFlagSduiSkipEmptyCatalogCategoryHydration

return function()
	-- upvalues: FFlagMarketplaceCatalogCategoryTrackLastReceived (copy), SignalsModule (copy), CreateDataCacheModule (copy), CreateDataResolverModule (copy), PromiseModule (copy), FFlagSduiSkipEmptyCatalogCategoryHydration (copy)
	local GetLastReceivedCategories = nil
	local Callback = nil
	
	if FFlagMarketplaceCatalogCategoryTrackLastReceived then
		GetLastReceivedCategories, Callback = SignalsModule.createSignal({})
	end
	local DataCacheModule = CreateDataCacheModule()
	local DataResolverModule = CreateDataResolverModule({
		cache = DataCacheModule,
		fetchFn = function(_)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.resolve({})
		end,
		onClear = if FFlagSduiSkipEmptyCatalogCategoryHydration then function()
			-- upvalues: Callback (ref)
			if Callback then
				Callback({})
			end
		end else nil
	})
	
	local function updateMarketplaceCatalogCategories(p1)
		-- upvalues: FFlagSduiSkipEmptyCatalogCategoryHydration (upval), Callback (ref), DataCacheModule (copy)
		if not FFlagSduiSkipEmptyCatalogCategoryHydration or next(p1) ~= nil then
			Callback(p1)
			DataCacheModule.updateItems(p1)
			
			return
		end
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
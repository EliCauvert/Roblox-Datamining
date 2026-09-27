local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local promiseModule = require(parent.Promise)
local signalsModule = require(parent.Signals)
local sharedFlagsModule = require(parent.SharedFlags)
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local _ = require(script.Parent.MarketplaceCatalogCategoryStoreTypes)
local fFlagMarketplaceCatalogCategoryTrackLastReceived = sharedFlagsModule.FFlagMarketplaceCatalogCategoryTrackLastReceived
local fFlagSduiSkipEmptyCatalogCategoryHydration = sharedFlagsModule.FFlagSduiSkipEmptyCatalogCategoryHydration

return function()
	-- upvalues: fFlagMarketplaceCatalogCategoryTrackLastReceived (ref), signalsModule (ref), createDataCacheModule (ref), createDataResolverModule (ref), promiseModule (ref), fFlagSduiSkipEmptyCatalogCategoryHydration (ref)
	local var1 = nil
	local var2 = nil
	
	if fFlagMarketplaceCatalogCategoryTrackLastReceived then
		local var3, var4 = signalsModule.createSignal({})
		var1 = var3
		var2 = var4
	end
	local var5 = createDataCacheModule()
	local var6 = createDataResolverModule({
		cache = var5,
		fetchFn = function(_)
			-- upvalues: promiseModule (copy)
			return promiseModule.resolve({})
		end,
		onClear = if fFlagSduiSkipEmptyCatalogCategoryHydration then function()
			-- upvalues: var2 (write)
			if var2 then
				var2({})
			end
		end else nil
	})
	
	return {
		getMarketplaceCatalogCategory = var6.getCachedItem,
		getMarketplaceCatalogCategories = var6.getCachedItems,
		updateMarketplaceCatalogCategories = if fFlagMarketplaceCatalogCategoryTrackLastReceived then function(p1)
			-- upvalues: fFlagSduiSkipEmptyCatalogCategoryHydration (copy), var2 (write), var5 (ref)
			if fFlagSduiSkipEmptyCatalogCategoryHydration and next(p1) == nil then
				return
			end
			var2(p1)
			var5.updateItems(p1)
		end else var5.updateItems,
		updateMarketplaceCatalogCategory = var5.updateItem,
		getLastReceivedCategories = var1,
		clear = if fFlagMarketplaceCatalogCategoryTrackLastReceived then function()
			-- upvalues: var2 (write), var6 (ref)
			if var2 then
				var2({})
			end
			var6.clear()
		end else var6.clear,
		dispose = var6.dispose
	}
end
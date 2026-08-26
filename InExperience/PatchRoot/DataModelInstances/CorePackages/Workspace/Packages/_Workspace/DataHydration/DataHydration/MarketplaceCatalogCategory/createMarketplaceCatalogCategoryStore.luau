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

return function()
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), promiseModule (ref), fFlagMarketplaceCatalogCategoryTrackLastReceived (ref), signalsModule (ref)
	local var1 = createDataCacheModule()
	local var2 = createDataResolverModule({
		cache = var1,
		fetchFn = function(_)
			-- upvalues: promiseModule (copy)
			return promiseModule.resolve({})
		end
	})
	local var3 = nil
	local var4 = nil
	
	if fFlagMarketplaceCatalogCategoryTrackLastReceived then
		local var5, var6 = signalsModule.createSignal({})
		var3 = var5
		var4 = var6
	end
	return {
		getMarketplaceCatalogCategory = var2.getCachedItem,
		getMarketplaceCatalogCategories = var2.getCachedItems,
		updateMarketplaceCatalogCategories = if fFlagMarketplaceCatalogCategoryTrackLastReceived then function(p1)
			-- upvalues: var4 (write), var1 (ref)
			var4(p1)
			var1.updateItems(p1)
		end else var1.updateItems,
		updateMarketplaceCatalogCategory = var1.updateItem,
		getLastReceivedCategories = var3,
		clear = if fFlagMarketplaceCatalogCategoryTrackLastReceived then function()
			-- upvalues: var4 (write), var2 (ref)
			if var4 then
				var4({})
			end
			var2.clear()
		end else var2.clear,
		dispose = var2.dispose
	}
end
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
	local var6 = createDataCacheModule()
	local var7 = createDataResolverModule({
		cache = var6,
		fetchFn = function(_)
			-- upvalues: promiseModule (copy)
			return promiseModule.resolve({})
		end
	})
	local var8 = nil
	local var9 = nil
	
	if fFlagMarketplaceCatalogCategoryTrackLastReceived then
		local var10, var11 = signalsModule.createSignal({})
		var8 = var10
		var9 = var11
	end
	return {
		getMarketplaceCatalogCategory = var7.getCachedItem,
		getMarketplaceCatalogCategories = var7.getCachedItems,
		updateMarketplaceCatalogCategories = if fFlagMarketplaceCatalogCategoryTrackLastReceived then function(p0)
			-- upvalues: var9 (write), var6 (ref)
			var9(p0)
			var6.updateItems(p0)
		end else var6.updateItems,
		updateMarketplaceCatalogCategory = var6.updateItem,
		getLastReceivedCategories = var8,
		clear = if fFlagMarketplaceCatalogCategoryTrackLastReceived then function()
			-- upvalues: var9 (write), var7 (ref)
			if var9 then
				var9({})
			end
			var7.clear()
		end else var7.clear,
		dispose = var7.dispose
	}
end
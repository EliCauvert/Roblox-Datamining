local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local promiseModule = require(parent.Promise)
local signalsModule = require(parent.Signals)
local sharedFlagsModule = require(parent.SharedFlags)
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local _ = require(script.Parent.MarketplaceCatalogSortStoreTypes)
local fFlagMarketplaceCatalogSortTrackLastReceived = sharedFlagsModule.FFlagMarketplaceCatalogSortTrackLastReceived

return function() --[[ line: 22 | named "createMarketplaceCatalogSortStore" ]]
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), promiseModule (ref), fFlagMarketplaceCatalogSortTrackLastReceived (ref), signalsModule (ref)
	local var6 = createDataCacheModule()
	local var7 = createDataResolverModule({
		cache = var6,
		fetchFn = function(_) --[[ line: 26 ]]
			-- upvalues: promiseModule (copy)
			return promiseModule.resolve({})
		end
	})
	local var8 = nil
	local var9 = nil
	
	if fFlagMarketplaceCatalogSortTrackLastReceived then
		local var10, var11 = signalsModule.createSignal({})
		var8 = var10
		var9 = var11
	end
	return {
		getMarketplaceCatalogSort = var7.getCachedItem,
		getMarketplaceCatalogSorts = var7.getCachedItems,
		updateMarketplaceCatalogSorts = if fFlagMarketplaceCatalogSortTrackLastReceived then function(p0) --[[ line: 41 | named "updateMarketplaceCatalogSorts" ]]
			-- upvalues: var9 (write), var6 (ref)
			var9(p0)
			var6.updateItems(p0)
		end else var6.updateItems,
		updateMarketplaceCatalogSort = var6.updateItem,
		getLastReceivedSorts = var8,
		clear = if fFlagMarketplaceCatalogSortTrackLastReceived then function() --[[ line: 51 | named "clear" ]]
			-- upvalues: var9 (write), var7 (ref)
			if var9 then
				var9({})
			end
			var7.clear()
		end else var7.clear,
		dispose = var7.dispose
	}
end
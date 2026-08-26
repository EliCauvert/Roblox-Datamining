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

local function normalizeCardFooters(p1)
	if not p1 then
		return nil
	end
	local list = table.create(#p1)
	
	for i, v in p1 do
		table.insert(list, { contentType = v.contentType or v.content_type })
	end
	return list
end

local function _(p2)
	return {
		thumbnailAspectRatio = p2.thumbnailAspectRatio or p2.thumbnail_aspect_ratio
	}
end

local _ = function(p2)
	-- upvalues: normalizeCardFooters (ref)
	if not p2.cardFooters and not p2.cardStyle then
		return p2
	end
	local cloned = table.clone(p2)
	
	if p2.cardFooters then
		cloned.cardFooters = normalizeCardFooters(p2.cardFooters)
	end
	if p2.cardStyle then
		local cardStyle = p2.cardStyle
		cloned.cardStyle = {
			thumbnailAspectRatio = cardStyle.thumbnailAspectRatio or cardStyle.thumbnail_aspect_ratio
		}
	end
	return cloned
end

return function()
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), promiseModule (ref), fFlagMarketplaceCatalogSortTrackLastReceived (ref), signalsModule (ref), normalizeCardFooters (ref)
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
	
	if fFlagMarketplaceCatalogSortTrackLastReceived then
		local var5, var6 = signalsModule.createSignal({})
		var3 = var5
		var4 = var6
	end
	return {
		getMarketplaceCatalogSort = var2.getCachedItem,
		getMarketplaceCatalogSorts = var2.getCachedItems,
		getNormalizedMarketplaceCatalogSort = function(p2)
			-- upvalues: var2 (ref), normalizeCardFooters (copy)
			local cachedItem = var2.getCachedItem(p2)
			
			return {
				data = function(p3)
					-- upvalues: cachedItem (ref), normalizeCardFooters (copy)
					local var7 = cachedItem.data(p3)
					
					if not var7 then
						return nil
					elseif not var7.cardFooters and not var7.cardStyle then
						return var7
					end
					local cloned = table.clone(var7)
					
					if var7.cardFooters then
						cloned.cardFooters = normalizeCardFooters(var7.cardFooters)
					end
					if var7.cardStyle then
						local cardStyle = var7.cardStyle
						cloned.cardStyle = {
							thumbnailAspectRatio = cardStyle.thumbnailAspectRatio or cardStyle.thumbnail_aspect_ratio
						}
					end
					return cloned
				end,
				status = cachedItem.status
			}
		end,
		updateMarketplaceCatalogSorts = if fFlagMarketplaceCatalogSortTrackLastReceived then function(p2)
			-- upvalues: var4 (write), var1 (ref)
			var4(p2)
			var1.updateItems(p2)
		end else var1.updateItems,
		updateMarketplaceCatalogSort = var1.updateItem,
		getLastReceivedSorts = var3,
		clear = if fFlagMarketplaceCatalogSortTrackLastReceived then function()
			-- upvalues: var4 (write), var2 (ref)
			if var4 then
				var4({})
			end
			var2.clear()
		end else var2.clear,
		dispose = var2.dispose
	}
end
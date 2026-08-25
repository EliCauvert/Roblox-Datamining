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

local function normalizeCardFooters(p0)
	if not p0 then
		return nil
	end
	local list = table.create(#p0)
	
	for i, v in p0 do
		table.insert(list, { contentType = v.contentType or v.content_type })
	end
	return list
end

local function _(p1)
	return {
		thumbnailAspectRatio = p1.thumbnailAspectRatio or p1.thumbnail_aspect_ratio
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
	local var9 = createDataCacheModule()
	local var10 = createDataResolverModule({
		cache = var9,
		fetchFn = function(_)
			-- upvalues: promiseModule (copy)
			return promiseModule.resolve({})
		end
	})
	local var11 = nil
	local var12 = nil
	
	if fFlagMarketplaceCatalogSortTrackLastReceived then
		local var13, var14 = signalsModule.createSignal({})
		var11 = var13
		var12 = var14
	end
	return {
		getMarketplaceCatalogSort = var10.getCachedItem,
		getMarketplaceCatalogSorts = var10.getCachedItems,
		getNormalizedMarketplaceCatalogSort = function(p3)
			-- upvalues: var10 (ref), normalizeCardFooters (copy)
			local cachedItem = var10.getCachedItem(p3)
			
			return {
				data = function(p4)
					-- upvalues: cachedItem (ref), normalizeCardFooters (copy)
					local var16 = cachedItem.data(p4)
					
					if not var16 then
						return nil
					elseif not var16.cardFooters and not var16.cardStyle then
						return var16
					end
					local cloned = table.clone(var16)
					
					if var16.cardFooters then
						cloned.cardFooters = normalizeCardFooters(var16.cardFooters)
					end
					if var16.cardStyle then
						local cardStyle = var16.cardStyle
						cloned.cardStyle = {
							thumbnailAspectRatio = cardStyle.thumbnailAspectRatio or cardStyle.thumbnail_aspect_ratio
						}
					end
					return cloned
				end,
				status = cachedItem.status
			}
		end,
		updateMarketplaceCatalogSorts = if fFlagMarketplaceCatalogSortTrackLastReceived then function(p5)
			-- upvalues: var12 (write), var9 (ref)
			var12(p5)
			var9.updateItems(p5)
		end else var9.updateItems,
		updateMarketplaceCatalogSort = var9.updateItem,
		getLastReceivedSorts = var11,
		clear = if fFlagMarketplaceCatalogSortTrackLastReceived then function()
			-- upvalues: var12 (write), var10 (ref)
			if var12 then
				var12({})
			end
			var10.clear()
		end else var10.clear,
		dispose = var10.dispose
	}
end
local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local PromiseModule = require(Parent.Promise)
local SignalsModule = require(Parent.Signals)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local _ = require(script.Parent.MarketplaceCatalogSortStoreTypes)
local FFlagMarketplaceCatalogSortTrackLastReceived = require(Parent.SharedFlags).FFlagMarketplaceCatalogSortTrackLastReceived
local FFlagAXSduiNilEmptyTagIdModule = require(DataHydration.Flags.FFlagAXSduiNilEmptyTagId)

local function normalizeCardFooters(CardFooters) --[[ Line: 35 ]]
	if not CardFooters then
		return nil
	end
	local Buffer = table.create(#CardFooters)
	
	for _, cardFooter in CardFooters do
		table.insert(Buffer, {
			contentType = cardFooter.contentType or cardFooter.content_type
		})
	end
	return Buffer
end

local function _(p1) --[[ Line: 48 | Named "normalizeCardStyle" ]]
	return {
		thumbnailAspectRatio = p1.thumbnailAspectRatio or p1.thumbnail_aspect_ratio
	}
end

local _ = function(Tbl) --[[ Line: 54 | Named "normalizeSort" ]]
	-- upvalues: normalizeCardFooters (copy)
	if not Tbl.cardFooters and not Tbl.cardStyle then
		return Tbl
	end
	local Copy = table.clone(Tbl)
	
	if Tbl.cardFooters then
		Copy.cardFooters = normalizeCardFooters(Tbl.cardFooters)
	end
	if Tbl.cardStyle then
		local CardStyle = Tbl.cardStyle
		Copy.cardStyle = {
			thumbnailAspectRatio = CardStyle.thumbnailAspectRatio or CardStyle.thumbnail_aspect_ratio
		}
	end
	return Copy
end

local function clearEmptyTagId(Tbl) --[[ Line: 72 ]]
	if Tbl.tagId == "" then
		local Copy = table.clone(Tbl)
		Copy.tagId = nil
		
		return Copy
	else
		return Tbl
	end
end

return function() --[[ Line: 81 | Named "createMarketplaceCatalogSortStore" ]]
	-- upvalues: FFlagAXSduiNilEmptyTagIdModule (copy), CreateDataCacheModule (copy), clearEmptyTagId (copy), CreateDataResolverModule (copy), PromiseModule (copy), FFlagMarketplaceCatalogSortTrackLastReceived (copy), SignalsModule (copy), normalizeCardFooters (copy)
	local DataCacheModule = if FFlagAXSduiNilEmptyTagIdModule then CreateDataCacheModule(nil, nil, { sanitizeItem = clearEmptyTagId }) else CreateDataCacheModule()
	local DataResolverModule = CreateDataResolverModule({
		cache = DataCacheModule,
		fetchFn = function(_) --[[ Line: 87 ]]
			-- upvalues: PromiseModule (upval)
			return PromiseModule.resolve({})
		end
	})
	local GetLastReceivedSorts = nil
	local Callback = nil
	
	if FFlagMarketplaceCatalogSortTrackLastReceived then
		GetLastReceivedSorts, Callback = SignalsModule.createSignal({})
	end
	local function updateMarketplaceCatalogSorts(p1) --[[ Line: 104 ]]
		-- upvalues: Callback (ref), DataCacheModule (copy)
		Callback(p1)
		DataCacheModule.updateItems(p1)
	end
	
	local function clear() --[[ Line: 128 ]]
		-- upvalues: Callback (ref), DataResolverModule (copy)
		if Callback then
			Callback({})
		end
		DataResolverModule.clear()
	end
	
	return {
		getMarketplaceCatalogSort = DataResolverModule.getCachedItem,
		getMarketplaceCatalogSorts = DataResolverModule.getCachedItems,
		getNormalizedMarketplaceCatalogSort = function(p1) --[[ Line: 112 ]]
			-- upvalues: DataResolverModule (copy), normalizeCardFooters (upval)
			local CachedItem = DataResolverModule.getCachedItem(p1)
			
			return {
				data = function(p2) --[[ Line: 115 ]]
					-- upvalues: CachedItem (copy), normalizeCardFooters (upval)
					local DataResult = CachedItem.data(p2)
					
					if not DataResult then
						return nil
					end
					if not DataResult.cardFooters and not DataResult.cardStyle then
						return DataResult
					end
					local Copy = table.clone(DataResult)
					
					if DataResult.cardFooters then
						Copy.cardFooters = normalizeCardFooters(DataResult.cardFooters)
					end
					if DataResult.cardStyle then
						local CardStyle = DataResult.cardStyle
						Copy.cardStyle = {
							thumbnailAspectRatio = CardStyle.thumbnailAspectRatio or CardStyle.thumbnail_aspect_ratio
						}
					end
					return Copy
				end,
				status = CachedItem.status
			}
		end,
		updateMarketplaceCatalogSorts = if FFlagMarketplaceCatalogSortTrackLastReceived then updateMarketplaceCatalogSorts else DataCacheModule.updateItems,
		updateMarketplaceCatalogSort = DataCacheModule.updateItem,
		getLastReceivedSorts = GetLastReceivedSorts,
		clear = if FFlagMarketplaceCatalogSortTrackLastReceived then clear else DataResolverModule.clear,
		dispose = DataResolverModule.dispose
	}
end
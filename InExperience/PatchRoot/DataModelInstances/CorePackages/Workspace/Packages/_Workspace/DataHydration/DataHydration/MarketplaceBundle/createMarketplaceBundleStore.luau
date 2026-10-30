local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local PromiseModule = require(Parent.Promise)
local _ = require(Parent.Signals)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local _ = require(DataHydration.DataHydrationTypes)
local _ = require(script.Parent.MarketplaceBundleStoreTypes)
local CreateDataResolverModule = require(DataHydration.createDataResolver)

local function normalizeTaxonomy(Taxonomy)
	if not Taxonomy then
		return nil
	end
	local Buffer = table.create(#Taxonomy)
	
	for _, value in Taxonomy do
		table.insert(Buffer, {
			taxonomyId = if value.taxonomyId == nil then value.taxonomy_id else value.taxonomyId,
			taxonomyName = if value.taxonomyName == nil then value.taxonomy_name else value.taxonomyName
		})
	end
	return Buffer
end

local function normalizeBundledItems(BundledItems)
	if not BundledItems then
		return nil
	end
	local Buffer = table.create(#BundledItems)
	
	for _, bundledItem in BundledItems do
		table.insert(Buffer, {
			id = bundledItem.id,
			assetType = if bundledItem.assetType == nil then bundledItem.asset_type else bundledItem.assetType,
			type = bundledItem.type
		})
	end
	return Buffer
end

local function _(Tbl)
	-- upvalues: normalizeTaxonomy (copy), normalizeBundledItems (copy)
	if not Tbl.taxonomy and not Tbl.bundledItems then
		return Tbl
	end
	local Copy = table.clone(Tbl)
	
	if Tbl.taxonomy then
		Copy.taxonomy = normalizeTaxonomy(Tbl.taxonomy)
	end
	if Tbl.bundledItems then
		Copy.bundledItems = normalizeBundledItems(Tbl.bundledItems)
	end
	return Copy
end

return function()
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), PromiseModule (copy), normalizeTaxonomy (copy), normalizeBundledItems (copy)
	local DataCacheModule = CreateDataCacheModule()
	local DataResolverModule = CreateDataResolverModule({
		cache = DataCacheModule,
		fetchFn = function(_)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.resolve({})
		end
	})
	
	return {
		getMarketplaceBundleInfo = DataResolverModule.getCachedItem,
		getMarketplaceBundleInfos = DataResolverModule.getCachedItems,
		getNormalizedMarketplaceBundleInfo = function(p1)
			-- upvalues: DataResolverModule (copy), normalizeTaxonomy (upval), normalizeBundledItems (upval)
			local CachedItem = DataResolverModule.getCachedItem(p1)
			
			return {
				data = function(p2)
					-- upvalues: CachedItem (copy), normalizeTaxonomy (upval), normalizeBundledItems (upval)
					local DataResult = CachedItem.data(p2)
					
					if not DataResult then
						return nil
					end
					if not DataResult.taxonomy and not DataResult.bundledItems then
						return DataResult
					end
					local Copy = table.clone(DataResult)
					
					if DataResult.taxonomy then
						Copy.taxonomy = normalizeTaxonomy(DataResult.taxonomy)
					end
					if DataResult.bundledItems then
						Copy.bundledItems = normalizeBundledItems(DataResult.bundledItems)
					end
					return Copy
				end,
				status = CachedItem.status
			}
		end,
		getCreatingUniverseId = function(p1)
			-- upvalues: DataResolverModule (copy)
			local DataFunction = DataResolverModule.getCachedItem(p1).data
			
			return function(p2)
				-- upvalues: DataFunction (copy)
				local DataResult = DataFunction(p2)
				local CreatingUniverseId = if DataResult then DataResult.creatingUniverseId else nil
				
				return if typeof(CreatingUniverseId) == "number" then tostring(CreatingUniverseId) elseif typeof(CreatingUniverseId) == "string" and CreatingUniverseId ~= "" then CreatingUniverseId else nil
			end
		end,
		updateMarketplaceBundleInfo = DataCacheModule.updateItem,
		updateMarketplaceBundleInfos = DataCacheModule.updateItems,
		clear = DataCacheModule.clear,
		dispose = DataCacheModule.dispose
	}
end
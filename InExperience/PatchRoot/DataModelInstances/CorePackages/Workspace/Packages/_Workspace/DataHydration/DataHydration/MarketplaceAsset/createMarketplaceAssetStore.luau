local DataHydration = script:FindFirstAncestor("DataHydration")
local PromiseModule = require(DataHydration.Parent.Promise)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local _ = require(DataHydration.DataHydrationTypes)
local _ = require(script.Parent.MarketplaceAssetStoreTypes)
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

local function _(Tbl)
	-- upvalues: normalizeTaxonomy (copy)
	if Tbl.taxonomy then
		local Copy = table.clone(Tbl)
		Copy.taxonomy = normalizeTaxonomy(Tbl.taxonomy)
		
		return Copy
	else
		return Tbl
	end
end

return function()
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), PromiseModule (copy), normalizeTaxonomy (copy)
	local DataCacheModule = CreateDataCacheModule()
	local DataResolverModule = CreateDataResolverModule({
		cache = DataCacheModule,
		fetchFn = function(_)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.resolve({})
		end
	})
	
	return {
		getMarketplaceAssetInfo = DataResolverModule.getCachedItem,
		getMarketplaceAssetInfos = DataResolverModule.getCachedItems,
		getNormalizedMarketplaceAssetInfo = function(p1)
			-- upvalues: DataResolverModule (copy), normalizeTaxonomy (upval)
			local CachedItem = DataResolverModule.getCachedItem(p1)
			
			return {
				data = function(p2)
					-- upvalues: CachedItem (copy), normalizeTaxonomy (upval)
					local DataResult = CachedItem.data(p2)
					
					if not DataResult then
						return nil
					elseif DataResult.taxonomy then
						local Copy = table.clone(DataResult)
						Copy.taxonomy = normalizeTaxonomy(DataResult.taxonomy)
						
						return Copy
					else
						return DataResult
					end
				end,
				status = CachedItem.status
			}
		end,
		updateMarketplaceAssetInfo = DataCacheModule.updateItem,
		updateMarketplaceAssetInfos = DataCacheModule.updateItems,
		clear = DataCacheModule.clear,
		dispose = DataCacheModule.dispose
	}
end
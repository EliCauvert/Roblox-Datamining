local dataHydration = script:FindFirstAncestor("DataHydration")
local promiseModule = require(dataHydration.Parent.Promise)
local createDataCacheModule = require(dataHydration.createDataCache)
local _ = require(dataHydration.DataHydrationTypes)
local _ = require(script.Parent.MarketplaceAssetStoreTypes)
local createDataResolverModule = require(dataHydration.createDataResolver)

local function normalizeTaxonomy(p1)
	if not p1 then
		return nil
	end
	local list = table.create(#p1)
	
	for i, v in p1 do
		table.insert(list, {
			taxonomyId = if v.taxonomyId ~= nil then v.taxonomy_id else v.taxonomyId,
			taxonomyName = if v.taxonomyName ~= nil then v.taxonomy_name else v.taxonomyName
		})
	end
	return list
end

local function _(value)
	-- upvalues: normalizeTaxonomy (ref)
	if value.taxonomy then
		local cloned = table.clone(value)
		cloned.taxonomy = normalizeTaxonomy(value.taxonomy)
		
		return cloned
	end
	return value
end

return function()
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), promiseModule (ref), normalizeTaxonomy (ref)
	local var1 = createDataCacheModule()
	local var2 = createDataResolverModule({
		cache = var1,
		fetchFn = function(_)
			-- upvalues: promiseModule (copy)
			return promiseModule.resolve({})
		end
	})
	
	return {
		getMarketplaceAssetInfo = var2.getCachedItem,
		getMarketplaceAssetInfos = var2.getCachedItems,
		getNormalizedMarketplaceAssetInfo = function(value)
			-- upvalues: var2 (ref), normalizeTaxonomy (copy)
			local cachedItem = var2.getCachedItem(value)
			
			return {
				data = function(p2)
					-- upvalues: cachedItem (ref), normalizeTaxonomy (copy)
					local var3 = cachedItem.data(p2)
					
					if not var3 then
						return nil
					elseif var3.taxonomy then
						local cloned = table.clone(var3)
						cloned.taxonomy = normalizeTaxonomy(var3.taxonomy)
						
						return cloned
					end
					return var3
				end,
				status = cachedItem.status
			}
		end,
		updateMarketplaceAssetInfo = var1.updateItem,
		updateMarketplaceAssetInfos = var1.updateItems,
		clear = var1.clear,
		dispose = var1.dispose
	}
end
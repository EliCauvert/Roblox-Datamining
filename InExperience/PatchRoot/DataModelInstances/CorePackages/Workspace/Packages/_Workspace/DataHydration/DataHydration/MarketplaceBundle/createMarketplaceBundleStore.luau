local dataHydration = script:FindFirstAncestor("DataHydration")
local promiseModule = require(dataHydration.Parent.Promise)
local createDataCacheModule = require(dataHydration.createDataCache)
local _ = require(dataHydration.DataHydrationTypes)
local _ = require(script.Parent.MarketplaceBundleStoreTypes)
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

local function normalizeBundledItems(p2)
	if not p2 then
		return nil
	end
	local list = table.create(#p2)
	
	for i, v in p2 do
		table.insert(list, {
			id = v.id,
			assetType = if v.assetType ~= nil then v.asset_type else v.assetType,
			type = v.type
		})
	end
	return list
end

local function _(p3)
	-- upvalues: normalizeTaxonomy (ref), normalizeBundledItems (ref)
	if not p3.taxonomy and not p3.bundledItems then
		return p3
	end
	local cloned = table.clone(p3)
	
	if p3.taxonomy then
		cloned.taxonomy = normalizeTaxonomy(p3.taxonomy)
	end
	if p3.bundledItems then
		cloned.bundledItems = normalizeBundledItems(p3.bundledItems)
	end
	return cloned
end

return function()
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), promiseModule (ref), normalizeTaxonomy (ref), normalizeBundledItems (ref)
	local var1 = createDataCacheModule()
	local var2 = createDataResolverModule({
		cache = var1,
		fetchFn = function(_)
			-- upvalues: promiseModule (copy)
			return promiseModule.resolve({})
		end
	})
	
	return {
		getMarketplaceBundleInfo = var2.getCachedItem,
		getMarketplaceBundleInfos = var2.getCachedItems,
		getNormalizedMarketplaceBundleInfo = function(p3)
			-- upvalues: var2 (ref), normalizeTaxonomy (copy), normalizeBundledItems (copy)
			local cachedItem = var2.getCachedItem(p3)
			
			return {
				data = function(p4)
					-- upvalues: cachedItem (ref), normalizeTaxonomy (copy), normalizeBundledItems (copy)
					local var3 = cachedItem.data(p4)
					
					if not var3 then
						return nil
					elseif not var3.taxonomy and not var3.bundledItems then
						return var3
					end
					local cloned = table.clone(var3)
					
					if var3.taxonomy then
						cloned.taxonomy = normalizeTaxonomy(var3.taxonomy)
					end
					if var3.bundledItems then
						cloned.bundledItems = normalizeBundledItems(var3.bundledItems)
					end
					return cloned
				end,
				status = cachedItem.status
			}
		end,
		updateMarketplaceBundleInfo = var1.updateItem,
		updateMarketplaceBundleInfos = var1.updateItems,
		clear = var1.clear,
		dispose = var1.dispose
	}
end
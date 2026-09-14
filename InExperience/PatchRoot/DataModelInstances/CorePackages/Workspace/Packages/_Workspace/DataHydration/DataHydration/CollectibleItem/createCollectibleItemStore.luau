local dataHydration = script:FindFirstAncestor("DataHydration")
local promiseModule = require(dataHydration.Parent.Promise)
local createDataCacheModule = require(dataHydration.createDataCache)
local _ = require(dataHydration.DataHydrationTypes)
local _ = require(script.Parent.CollectibleItemStoreTypes)
local createDataResolverModule = require(dataHydration.createDataResolver)

local function normalizeCreator(p1)
	return {
		id = p1.id,
		name = p1.name,
		type = p1.type,
		targetId = if p1.targetId ~= nil then p1.target_id else p1.targetId,
		hasVerifiedBadge = if p1.hasVerifiedBadge ~= nil then p1.has_verified_badge else p1.hasVerifiedBadge
	}
end

local function normalizeExperiences(p1)
	if not p1 then
		return nil
	end
	local list = table.create(#p1)
	
	for i, v in p1 do
		table.insert(list, {
			id = v.id,
			name = v.name,
			detailPageLink = if v.detailPageLink ~= nil then v.detail_page_link else v.detailPageLink
		})
	end
	return list
end

local function _(p2)
	-- upvalues: normalizeCreator (ref), normalizeExperiences (ref)
	if not p2.creator and not p2.experiences then
		return p2
	end
	local cloned = table.clone(p2)
	
	if p2.creator then
		cloned.creator = normalizeCreator(p2.creator)
	end
	if p2.experiences then
		cloned.experiences = normalizeExperiences(p2.experiences)
	end
	return cloned
end

return function()
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), promiseModule (ref), normalizeCreator (ref), normalizeExperiences (ref)
	local var1 = createDataCacheModule()
	local var2 = createDataResolverModule({
		cache = var1,
		fetchFn = function(_)
			-- upvalues: promiseModule (copy)
			return promiseModule.resolve({})
		end
	})
	
	return {
		getCollectibleItemInfo = var2.getCachedItem,
		getCollectibleItemInfos = var2.getCachedItems,
		getNormalizedCollectibleItemInfo = function(a)
			-- upvalues: var2 (ref), normalizeCreator (copy), normalizeExperiences (copy)
			local cachedItem = var2.getCachedItem(a)
			
			return {
				data = function(p2)
					-- upvalues: cachedItem (ref), normalizeCreator (copy), normalizeExperiences (copy)
					local var3 = cachedItem.data(p2)
					
					if not var3 then
						return nil
					elseif not var3.creator and not var3.experiences then
						return var3
					end
					local cloned = table.clone(var3)
					
					if var3.creator then
						cloned.creator = normalizeCreator(var3.creator)
					end
					if var3.experiences then
						cloned.experiences = normalizeExperiences(var3.experiences)
					end
					return cloned
				end,
				status = cachedItem.status
			}
		end,
		updateCollectibleItemInfo = var1.updateItem,
		updateCollectibleItemInfos = var1.updateItems,
		clear = var1.clear,
		dispose = var1.dispose
	}
end
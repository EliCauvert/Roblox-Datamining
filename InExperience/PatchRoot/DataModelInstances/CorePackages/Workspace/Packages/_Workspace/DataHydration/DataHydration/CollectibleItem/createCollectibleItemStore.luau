local DataHydration = script:FindFirstAncestor("DataHydration")
local PromiseModule = require(DataHydration.Parent.Promise)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local _ = require(DataHydration.DataHydrationTypes)
local _ = require(script.Parent.CollectibleItemStoreTypes)
local CreateDataResolverModule = require(DataHydration.createDataResolver)

local function normalizeCreator(Creator) --[[ Line: 28 ]]
	return {
		id = Creator.id,
		name = Creator.name,
		type = Creator.type,
		targetId = if Creator.targetId == nil then Creator.target_id else Creator.targetId,
		hasVerifiedBadge = if Creator.hasVerifiedBadge == nil then Creator.has_verified_badge else Creator.hasVerifiedBadge
	}
end

local function normalizeExperiences(Experiences) --[[ Line: 40 ]]
	if not Experiences then
		return nil
	end
	local Buffer = table.create(#Experiences)
	
	for _, experience in Experiences do
		table.insert(Buffer, {
			id = experience.id,
			name = experience.name,
			detailPageLink = if experience.detailPageLink == nil then experience.detail_page_link else experience.detailPageLink
		})
	end
	return Buffer
end

local function _(Tbl) --[[ Line: 59 | Named "normalizeCollectibleItem" ]]
	-- upvalues: normalizeCreator (copy), normalizeExperiences (copy)
	if not Tbl.creator and not Tbl.experiences then
		return Tbl
	end
	local Copy = table.clone(Tbl)
	
	if Tbl.creator then
		Copy.creator = normalizeCreator(Tbl.creator)
	end
	if Tbl.experiences then
		Copy.experiences = normalizeExperiences(Tbl.experiences)
	end
	return Copy
end

return function() --[[ Line: 73 | Named "createCollectibleItemStore" ]]
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), PromiseModule (copy), normalizeCreator (copy), normalizeExperiences (copy)
	local DataCacheModule = CreateDataCacheModule()
	local DataResolverModule = CreateDataResolverModule({
		cache = DataCacheModule,
		fetchFn = function(_) --[[ Line: 77 ]]
			-- upvalues: PromiseModule (upval)
			return PromiseModule.resolve({})
		end
	})
	
	return {
		getCollectibleItemInfo = DataResolverModule.getCachedItem,
		getCollectibleItemInfos = DataResolverModule.getCachedItems,
		getNormalizedCollectibleItemInfo = function(p1) --[[ Line: 85 ]]
			-- upvalues: DataResolverModule (copy), normalizeCreator (upval), normalizeExperiences (upval)
			local CachedItem = DataResolverModule.getCachedItem(p1)
			
			return {
				data = function(p2) --[[ Line: 88 ]]
					-- upvalues: CachedItem (copy), normalizeCreator (upval), normalizeExperiences (upval)
					local DataResult = CachedItem.data(p2)
					
					if not DataResult then
						return nil
					end
					if not DataResult.creator and not DataResult.experiences then
						return DataResult
					end
					local Copy = table.clone(DataResult)
					
					if DataResult.creator then
						Copy.creator = normalizeCreator(DataResult.creator)
					end
					if DataResult.experiences then
						Copy.experiences = normalizeExperiences(DataResult.experiences)
					end
					return Copy
				end,
				status = CachedItem.status
			}
		end,
		updateCollectibleItemInfo = DataCacheModule.updateItem,
		updateCollectibleItemInfos = DataCacheModule.updateItems,
		clear = DataCacheModule.clear,
		dispose = DataCacheModule.dispose
	}
end
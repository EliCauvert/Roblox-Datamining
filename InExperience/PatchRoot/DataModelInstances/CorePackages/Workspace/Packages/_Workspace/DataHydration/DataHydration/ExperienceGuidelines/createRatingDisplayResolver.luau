local DataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(DataHydration.Parent.HttpClient)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local FetchRatingDisplayModule = require(script.Parent.fetchRatingDisplay)
local _ = require(script.Parent.ExperienceGuidelinesStoreTypes)

local function _(List)
	local Buffer = table.create(#List)
	
	for i, value in List do
		Buffer[i] = tostring(value)
	end
	return Buffer
end

return function(p1)
	-- upvalues: CreateDataResolverModule (copy), CreateDataCacheModule (copy), FetchRatingDisplayModule (copy)
	local DataResolverModule = CreateDataResolverModule({
		queueProcessDelaySec = 0,
		replaceItems = true,
		ignoreResponsesAfterTimeout = true,
		cache = CreateDataCacheModule(),
		fetchFn = function(List)
			-- upvalues: FetchRatingDisplayModule (upval), p1 (copy)
			local List1 = {}
			
			for i in List do
				table.insert(List1, (tonumber(i)))
			end
			return FetchRatingDisplayModule.fetchBatchRatingDisplay(List1, p1)
		end
	})
	
	return {
		getRatingDisplay = function(p2)
			-- upvalues: DataResolverModule (copy)
			return (DataResolverModule.getCachedItem((tostring(p2))))
		end,
		getAndFetchRatingDisplay = function(p2)
			-- upvalues: DataResolverModule (copy)
			return (DataResolverModule.getAndFetchItem((tostring(p2))))
		end,
		getAndFetchRatingDisplays = function(List)
			-- upvalues: DataResolverModule (copy)
			local GetAndFetchItemsFunction = DataResolverModule.getAndFetchItems
			local Buffer = table.create(#List)
			
			for i, value in List do
				Buffer[i] = tostring(value)
			end
			return GetAndFetchItemsFunction(Buffer)
		end,
		fetchRatingDisplay = function(p2)
			-- upvalues: DataResolverModule (copy)
			return (DataResolverModule.fetchItem((tostring(p2))))
		end,
		clear = DataResolverModule.clear,
		dispose = DataResolverModule.dispose
	}
end
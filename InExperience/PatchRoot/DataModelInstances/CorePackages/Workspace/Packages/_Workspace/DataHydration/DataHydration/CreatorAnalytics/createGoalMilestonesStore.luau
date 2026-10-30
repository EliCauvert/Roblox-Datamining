local DataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(DataHydration.Parent.HttpClient)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local FetchGoalMilestonesModule = require(script.Parent.fetchGoalMilestones)
local _ = require(script.Parent.GoalMilestonesTypes)

return function(p1)
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), FetchGoalMilestonesModule (copy)
	local P0 = p1 or {}
	local config = { network = P0.network, baseUrl = P0.baseUrl }
	local DataResolverModule = CreateDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = CreateDataCacheModule(P0.ttlSeconds),
		fetchFn = function(p2, _)
			-- upvalues: FetchGoalMilestonesModule (upval), config (copy)
			return FetchGoalMilestonesModule(tonumber(p2), config)
		end
	})
	
	return {
		getAndFetchGoalMilestones = function(p2)
			-- upvalues: DataResolverModule (copy)
			return (DataResolverModule.getAndFetchItem((tostring(p2))))
		end,
		clear = DataResolverModule.clear,
		dispose = DataResolverModule.dispose
	}
end
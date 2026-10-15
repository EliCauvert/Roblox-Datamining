local dataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(dataHydration.Parent.HttpClient)
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local fetchGoalMilestonesModule = require(script.Parent.fetchGoalMilestones)
local _ = require(script.Parent.GoalMilestonesTypes)

return function(p1)
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), fetchGoalMilestonesModule (ref)
	p1 = p1 or {}
	local t = { network = p1.network, baseUrl = p1.baseUrl }
	local var1 = createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = createDataCacheModule(p1.ttlSeconds),
		fetchFn = function(p2, _)
			-- upvalues: fetchGoalMilestonesModule (copy), t (ref)
			return fetchGoalMilestonesModule(tonumber(p2), t)
		end
	})
	
	return {
		getAndFetchGoalMilestones = function(p2)
			-- upvalues: var1 (ref)
			return var1.getAndFetchItem(tostring(p2))
		end,
		clear = var1.clear,
		dispose = var1.dispose
	}
end
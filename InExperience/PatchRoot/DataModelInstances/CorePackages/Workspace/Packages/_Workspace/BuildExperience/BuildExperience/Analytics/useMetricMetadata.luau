local Parent = script:FindFirstAncestor("BuildExperience").Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local GetExperienceAnalyticsStoreFunction = require(Parent.DataHydration.ExperienceAnalytics).getExperienceAnalyticsStore

return function(List, p1) --[[ Line: 36 | Named "useMetricMetadata" ]]
	-- upvalues: GetExperienceAnalyticsStoreFunction (copy), SignalsReactModule (copy), ReactModule (copy)
	local Joined = table.concat(List, ",")
	local AndFetchMetricMetadata = GetExperienceAnalyticsStoreFunction(false).getAndFetchMetricMetadata(List)
	local UseSignalStateResult = SignalsReactModule.useSignalState(AndFetchMetricMetadata.data)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(AndFetchMetricMetadata.status)
	local UseRefResult = ReactModule.useRef(List)
	UseRefResult.current = List
	local Delay = p1 or 600
	ReactModule.useEffect(function() --[[ Line: 49 ]]
		-- upvalues: Delay (copy), GetExperienceAnalyticsStoreFunction (upval), UseRefResult (copy)
		local DelayedThread = nil
		
		local function scheduleRefresh() --[[ Line: 55 ]]
			-- upvalues: DelayedThread (ref), Delay (upval), GetExperienceAnalyticsStoreFunction (upval), UseRefResult (upval), scheduleRefresh (copy)
			DelayedThread = task.delay(Delay, function() --[[ Line: 56 ]]
				-- upvalues: GetExperienceAnalyticsStoreFunction (upval), UseRefResult (upval), scheduleRefresh (upval)
				GetExperienceAnalyticsStoreFunction(false).getAndFetchMetricMetadata(UseRefResult.current)
				scheduleRefresh()
			end)
		end
		
		DelayedThread = task.delay(Delay, function() --[[ Line: 56 ]]
			-- upvalues: GetExperienceAnalyticsStoreFunction (upval), UseRefResult (upval), scheduleRefresh (copy)
			GetExperienceAnalyticsStoreFunction(false).getAndFetchMetricMetadata(UseRefResult.current)
			scheduleRefresh()
		end)
		
		return function() --[[ Line: 62 ]]
			-- upvalues: DelayedThread (ref)
			if DelayedThread ~= nil then
				task.cancel(DelayedThread)
			end
		end
	end, { Joined, Delay })
	
	return {
		latestByMetric = UseSignalStateResult,
		status = UseSignalStateResult1
	}
end
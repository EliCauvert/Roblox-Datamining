local Parent = script:FindFirstAncestor("BuildExperience").Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local GetCreatorAnalyticsStoreFunction = require(Parent.DataHydration.CreatorAnalytics).getCreatorAnalyticsStore

return function(List, p1)
	-- upvalues: GetCreatorAnalyticsStoreFunction (copy), SignalsReactModule (copy), ReactModule (copy)
	local Joined = table.concat(List, ",")
	local AndFetchMetricMetadata = GetCreatorAnalyticsStoreFunction(false).getAndFetchMetricMetadata(List)
	local UseSignalStateResult = SignalsReactModule.useSignalState(AndFetchMetricMetadata.data)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(AndFetchMetricMetadata.status)
	local UseRefResult = ReactModule.useRef(List)
	UseRefResult.current = List
	local Delay = p1 or 600
	ReactModule.useEffect(function()
		-- upvalues: Delay (copy), GetCreatorAnalyticsStoreFunction (upval), UseRefResult (copy)
		local DelayedThread = nil
		
		local function scheduleRefresh()
			-- upvalues: DelayedThread (ref), Delay (upval), GetCreatorAnalyticsStoreFunction (upval), UseRefResult (upval), scheduleRefresh (copy)
			DelayedThread = task.delay(Delay, function()
				-- upvalues: GetCreatorAnalyticsStoreFunction (upval), UseRefResult (upval), scheduleRefresh (upval)
				GetCreatorAnalyticsStoreFunction(false).getAndFetchMetricMetadata(UseRefResult.current)
				scheduleRefresh()
			end)
		end
		
		DelayedThread = task.delay(Delay, function()
			-- upvalues: GetCreatorAnalyticsStoreFunction (upval), UseRefResult (upval), scheduleRefresh (copy)
			GetCreatorAnalyticsStoreFunction(false).getAndFetchMetricMetadata(UseRefResult.current)
			scheduleRefresh()
		end)
		
		return function()
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
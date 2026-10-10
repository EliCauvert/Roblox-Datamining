local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local getExperienceAnalyticsStore = require(parent.DataHydration.ExperienceAnalytics).getExperienceAnalyticsStore

return function(p1, p2)
	-- upvalues: getExperienceAnalyticsStore (ref), signalsReactModule (ref), reactModule (ref)
	local joined = table.concat(p1, ",")
	local andFetchMetricMetadata = getExperienceAnalyticsStore(false).getAndFetchMetricMetadata(p1)
	local var1 = signalsReactModule.useSignalState(andFetchMetricMetadata.data)
	local var2 = signalsReactModule.useSignalState(andFetchMetricMetadata.status)
	local var3 = reactModule.useRef(p1)
	var3.current = p1
	p2 = p2 or 600
	reactModule.useEffect(function()
		-- upvalues: p2 (ref), getExperienceAnalyticsStore (copy), var3 (ref)
		local delayedThread = nil
		
		local function scheduleRefresh()
			-- upvalues: delayedThread (write), p2 (copy), getExperienceAnalyticsStore (copy), var3 (copy), scheduleRefresh (ref)
			delayedThread = task.delay(p2, function()
				-- upvalues: getExperienceAnalyticsStore (copy), var3 (copy), scheduleRefresh (copy)
				getExperienceAnalyticsStore(false).getAndFetchMetricMetadata(var3.current)
				scheduleRefresh()
			end)
		end
		
		delayedThread = task.delay(p2, function()
			-- upvalues: getExperienceAnalyticsStore (copy), var3 (copy), scheduleRefresh (ref)
			getExperienceAnalyticsStore(false).getAndFetchMetricMetadata(var3.current)
			scheduleRefresh()
		end)
		
		return function()
			-- upvalues: delayedThread (write)
			if delayedThread ~= nil then
				task.cancel(delayedThread)
			end
		end
	end, { joined, p2 })
	
	return { latestByMetric = var1, status = var2 }
end
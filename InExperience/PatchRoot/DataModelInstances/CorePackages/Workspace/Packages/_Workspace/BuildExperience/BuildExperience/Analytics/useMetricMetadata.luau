local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local getExperienceAnalyticsStore = require(parent.DataHydration.ExperienceAnalytics).getExperienceAnalyticsStore
local _ = require(buildExperience.Analytics.AnalyticsMetric)

return function(p1, p2)
	-- upvalues: getExperienceAnalyticsStore (ref), signalsReactModule (ref), reactModule (ref)
	local t = {}
	
	for i, v in p1 do
		table.insert(t, v.id)
	end
	local joined = table.concat(t, ",")
	local andFetchMetricMetadata = getExperienceAnalyticsStore(false).getAndFetchMetricMetadata(t)
	local var1 = signalsReactModule.useSignalState(andFetchMetricMetadata.data)
	local var2 = signalsReactModule.useSignalState(andFetchMetricMetadata.status)
	local var3 = reactModule.useRef(t)
	var3.current = t
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
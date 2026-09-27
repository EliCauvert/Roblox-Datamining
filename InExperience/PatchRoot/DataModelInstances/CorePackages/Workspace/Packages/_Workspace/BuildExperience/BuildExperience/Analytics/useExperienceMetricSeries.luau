local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local getExperienceAnalyticsStore = require(parent.DataHydration.ExperienceAnalytics).getExperienceAnalyticsStore
local dataStatus = require(parent.DataHydration.ExperienceAnalytics).DataStatus
local _ = require(buildExperience.Analytics.AnalyticsMetric)
local _ = require(buildExperience.Analytics.AnalyticsWindow)
local getMetricQueryParamsModule = require(buildExperience.Analytics.getMetricQueryParams)
local deriveMetricSummaryModule = require(buildExperience.Analytics.deriveMetricSummary)
local fFlagBuildAnalyticsCreatorHubWindowFixModule = require(buildExperience.Flags.FFlagBuildAnalyticsCreatorHubWindowFix)

return function(p1, p2, p3, p4, p5)
	-- upvalues: reactModule (ref), signalsModule (ref), dataStatus (ref), getMetricQueryParamsModule (ref), getExperienceAnalyticsStore (ref), signalsReactModule (ref), fFlagBuildAnalyticsCreatorHubWindowFixModule (ref), deriveMetricSummaryModule (ref)
	local var1 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), p4 (ref), dataStatus (copy), getMetricQueryParamsModule (copy), p1 (ref), p2 (ref), p3 (ref), getExperienceAnalyticsStore (copy)
		return signalsModule.createComputed(function(p6)
			-- upvalues: p4 (copy), dataStatus (copy), getMetricQueryParamsModule (copy), p1 (copy), p2 (copy), p3 (copy), getExperienceAnalyticsStore (copy)
			if p4 == nil then
				return { series = nil, status = dataStatus.NotReady }
			end
			local andFetchMetric = getExperienceAnalyticsStore(p6).getAndFetchMetric(getMetricQueryParamsModule(p1, p2, p3, p4))
			
			return {
				series = andFetchMetric.data(p6),
				status = andFetchMetric.status(p6)
			}
		end)
	end, { p1, p2, p3, p4 }))
	p5 = p5 or 600
	reactModule.useEffect(function()
		-- upvalues: fFlagBuildAnalyticsCreatorHubWindowFixModule (copy), p4 (ref), getMetricQueryParamsModule (copy), p1 (ref), p2 (ref), p3 (ref), p5 (ref), getExperienceAnalyticsStore (copy)
		if not fFlagBuildAnalyticsCreatorHubWindowFixModule then return end
		if p4 == nil then
			return
		end
		local var2 = getMetricQueryParamsModule(p1, p2, p3, p4)
		local delayedThread = nil
		
		local function scheduleRefresh()
			-- upvalues: delayedThread (write), p5 (copy), getExperienceAnalyticsStore (copy), var2 (ref), scheduleRefresh (ref)
			delayedThread = task.delay(p5, function()
				-- upvalues: getExperienceAnalyticsStore (copy), var2 (copy), scheduleRefresh (copy)
				getExperienceAnalyticsStore(false).refetchMetric(var2)
				scheduleRefresh()
			end)
		end
		
		delayedThread = task.delay(p5, function()
			-- upvalues: getExperienceAnalyticsStore (copy), var2 (ref), scheduleRefresh (ref)
			getExperienceAnalyticsStore(false).refetchMetric(var2)
			scheduleRefresh()
		end)
		
		return function()
			-- upvalues: delayedThread (write)
			if delayedThread ~= nil then
				task.cancel(delayedThread)
			end
		end
	end, {
		p1,
		p2,
		p3,
		p4,
		p5
	})
	local var2 = reactModule.useMemo(function()
		-- upvalues: p4 (ref), p3 (ref), deriveMetricSummaryModule (copy), var1 (ref)
		local t = nil
		
		if p4 ~= nil then
			local dateTime = DateTime.fromIsoDate(p4)
			
			if dateTime ~= nil then
				t = {
					lookbackSeconds = p3.lookbackSeconds,
					endUnix = dateTime.UnixTimestamp
				}
			end
		end
		return deriveMetricSummaryModule(var1.series, t)
	end, { var1.series, p3, p4 })
	
	return {
		series = var1.series,
		status = var1.status,
		hasData = var2.hasData,
		latest = var2.latest,
		trendPct = var2.trendPct,
		priorValue = var2.priorValue
	}
end
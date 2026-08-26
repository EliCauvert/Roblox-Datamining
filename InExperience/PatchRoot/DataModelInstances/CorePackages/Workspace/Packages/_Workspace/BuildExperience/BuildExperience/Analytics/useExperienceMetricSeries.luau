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

return function(p1, p2, p3, p4)
	-- upvalues: reactModule (ref), signalsModule (ref), dataStatus (ref), getMetricQueryParamsModule (ref), getExperienceAnalyticsStore (ref), signalsReactModule (ref), deriveMetricSummaryModule (ref)
	local var1 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), p4 (ref), dataStatus (copy), getMetricQueryParamsModule (copy), p1 (ref), p2 (ref), p3 (ref), getExperienceAnalyticsStore (copy)
		return signalsModule.createComputed(function(p5)
			-- upvalues: p4 (copy), dataStatus (copy), getMetricQueryParamsModule (copy), p1 (copy), p2 (copy), p3 (copy), getExperienceAnalyticsStore (copy)
			if p4 == nil then
				return { series = nil, status = dataStatus.NotReady }
			end
			local andFetchMetric = getExperienceAnalyticsStore(p5).getAndFetchMetric(getMetricQueryParamsModule(p1, p2, p3, p4))
			
			return {
				series = andFetchMetric.data(p5),
				status = andFetchMetric.status(p5)
			}
		end)
	end, { p1, p2, p3, p4 }))
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
local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local GetExperienceAnalyticsStoreFunction = require(Parent.DataHydration.ExperienceAnalytics).getExperienceAnalyticsStore
local DataStatus = require(Parent.DataHydration.ExperienceAnalytics).DataStatus
local _ = require(BuildExperience.Analytics.AnalyticsMetric)
local _ = require(BuildExperience.Analytics.AnalyticsWindow)
local GetMetricQueryParamsModule = require(BuildExperience.Analytics.getMetricQueryParams)
local DeriveMetricSummaryModule = require(BuildExperience.Analytics.deriveMetricSummary)
local FFlagBuildAnalyticsCreatorHubWindowFixModule = require(BuildExperience.Flags.FFlagBuildAnalyticsCreatorHubWindowFix)

return function(p1, p2, p3, p4, p5) --[[ Line: 46 | Named "useExperienceMetricSeries" ]]
	-- upvalues: ReactModule (copy), SignalsModule (copy), DataStatus (copy), GetMetricQueryParamsModule (copy), GetExperienceAnalyticsStoreFunction (copy), SignalsReactModule (copy), FFlagBuildAnalyticsCreatorHubWindowFixModule (copy), DeriveMetricSummaryModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function() --[[ Line: 53 ]]
		-- upvalues: SignalsModule (upval), p4 (copy), DataStatus (upval), GetMetricQueryParamsModule (upval), p1 (copy), p2 (copy), p3 (copy), GetExperienceAnalyticsStoreFunction (upval)
		return SignalsModule.createComputed(function(p6) --[[ Line: 54 ]]
			-- upvalues: p4 (upval), DataStatus (upval), GetMetricQueryParamsModule (upval), p1 (upval), p2 (upval), p3 (upval), GetExperienceAnalyticsStoreFunction (upval)
			if p4 == nil then
				return { series = nil, status = DataStatus.NotReady }
			else
				local AndFetchMetric = GetExperienceAnalyticsStoreFunction(p6).getAndFetchMetric((GetMetricQueryParamsModule(p1, p2, p3, p4)))
				
				return {
					series = AndFetchMetric.data(p6),
					status = AndFetchMetric.status(p6)
				}
			end
		end)
	end, { p1, p2, p3, p4 })))
	local Delay = p5 or 600
	ReactModule.useEffect(function() --[[ Line: 79 ]]
		-- upvalues: FFlagBuildAnalyticsCreatorHubWindowFixModule (upval), p4 (copy), GetMetricQueryParamsModule (upval), p1 (copy), p2 (copy), p3 (copy), Delay (copy), GetExperienceAnalyticsStoreFunction (upval)
		if not FFlagBuildAnalyticsCreatorHubWindowFixModule then return end
		if p4 == nil then return end
		local MetricQueryParamsModule = GetMetricQueryParamsModule(p1, p2, p3, p4)
		local DelayedThread = nil
		
		local function scheduleRefresh() --[[ Line: 88 ]]
			-- upvalues: DelayedThread (ref), Delay (upval), GetExperienceAnalyticsStoreFunction (upval), MetricQueryParamsModule (copy), scheduleRefresh (copy)
			DelayedThread = task.delay(Delay, function() --[[ Line: 89 ]]
				-- upvalues: GetExperienceAnalyticsStoreFunction (upval), MetricQueryParamsModule (upval), scheduleRefresh (upval)
				GetExperienceAnalyticsStoreFunction(false).refetchMetric(MetricQueryParamsModule)
				scheduleRefresh()
			end)
		end
		
		DelayedThread = task.delay(Delay, function() --[[ Line: 89 ]]
			-- upvalues: GetExperienceAnalyticsStoreFunction (upval), MetricQueryParamsModule (copy), scheduleRefresh (copy)
			GetExperienceAnalyticsStoreFunction(false).refetchMetric(MetricQueryParamsModule)
			scheduleRefresh()
		end)
		
		return function() --[[ Line: 95 ]]
			-- upvalues: DelayedThread (ref)
			if DelayedThread ~= nil then
				task.cancel(DelayedThread)
			end
		end
	end, {
		p1,
		p2,
		p3,
		p4,
		Delay
	})
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 102 ]]
		-- upvalues: p4 (copy), p3 (copy), DeriveMetricSummaryModule (upval), UseSignalStateResult (copy)
		local v1 = nil
		
		if p4 ~= nil then
			local _DateTime = DateTime.fromIsoDate(p4)
			
			if _DateTime ~= nil then
				v1 = {
					lookbackSeconds = p3.lookbackSeconds,
					endUnix = _DateTime.UnixTimestamp
				}
			end
		end
		return DeriveMetricSummaryModule(UseSignalStateResult.series, v1)
	end, { UseSignalStateResult.series, p3, p4 })
	
	return {
		series = UseSignalStateResult.series,
		status = UseSignalStateResult.status,
		hasData = UseMemoResult.hasData,
		latest = UseMemoResult.latest,
		trendPct = UseMemoResult.trendPct,
		priorValue = UseMemoResult.priorValue
	}
end
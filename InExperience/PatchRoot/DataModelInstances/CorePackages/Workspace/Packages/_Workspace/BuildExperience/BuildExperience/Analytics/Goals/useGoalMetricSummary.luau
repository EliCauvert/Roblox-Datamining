local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local CreatorAnalyticsModule = require(Parent.DataHydration.CreatorAnalytics)
local GetCreatorAnalyticsStoreFunction = CreatorAnalyticsModule.getCreatorAnalyticsStore
local DataStatus = CreatorAnalyticsModule.DataStatus
local _ = require(BuildExperience.Analytics.AnalyticsWindow)
local _ = require(BuildExperience.Analytics.Goals.GoalTypes)
local FFlagBuildAnalyticsGoalsModule = require(BuildExperience.Flags.FFlagBuildAnalyticsGoals)

local function toParams(UniverseId, Params, Params1, DateInfo)
	-- upvalues: FFlagBuildAnalyticsGoalsModule (copy), CreatorAnalyticsModule (copy)
	local DateInfo1: string = DateInfo
	local EndOffsetDays: number = Params.endOffsetDays
	
	if EndOffsetDays ~= nil then
		local _DateTime = DateTime.fromIsoDate(DateInfo)
		
		if _DateTime ~= nil then
			DateInfo1 = os.date("!%Y-%m-%dT%H:%M:%SZ", _DateTime.UnixTimestamp - EndOffsetDays * 86400)
		end
	end
	local ScaledLookbackSeconds = Params1.lookbackSeconds * (Params.lookbackWindows or 1)
	
	if FFlagBuildAnalyticsGoalsModule and Params.metric == CreatorAnalyticsModule.MetricId.TotalSessionsEndedInBucket then
		ScaledLookbackSeconds -= 86400
	end
	return {
		universeId = UniverseId,
		metric = Params.metric,
		granularity = Params.granularity or Params1.granularity,
		lookbackSeconds = ScaledLookbackSeconds,
		endTime = DateInfo1,
		filters = Params.filters,
		breakdowns = Params.breakdowns
	}
end

return function(UniverseId, p1, p2, p3)
	-- upvalues: ReactModule (copy), SignalsModule (copy), DataStatus (copy), GetCreatorAnalyticsStoreFunction (copy), toParams (copy), SignalsReactModule (copy)
	local Query = p1.query
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), p3 (copy), DataStatus (upval), GetCreatorAnalyticsStoreFunction (upval), toParams (upval), UniverseId (copy), Query (copy), p2 (copy)
		return SignalsModule.createComputed(function(p4)
			-- upvalues: p3 (upval), DataStatus (upval), GetCreatorAnalyticsStoreFunction (upval), toParams (upval), UniverseId (upval), Query (upval), p2 (upval)
			if p3 == nil then
				return { series = nil, status = DataStatus.NotReady }
			else
				local AndFetchMetric = GetCreatorAnalyticsStoreFunction(p4).getAndFetchMetric((toParams(UniverseId, Query, p2, p3)))
				
				return {
					series = AndFetchMetric.data(p4),
					status = AndFetchMetric.status(p4)
				}
			end
		end)
	end, { UniverseId, Query, p2, p3 })))
	
	return {
		status = UseSignalStateResult.status,
		value = ReactModule.useMemo(function()
			-- upvalues: UseSignalStateResult (copy), p3 (copy), p1 (copy), p2 (copy), Query (copy)
			if UseSignalStateResult.series == nil or p3 == nil then
				return nil
			else
				local _DateTime = DateTime.fromIsoDate(p3)
				
				return if _DateTime then p1.derive(UseSignalStateResult.series, {
					lookbackSeconds = p2.lookbackSeconds,
					endUnix = _DateTime.UnixTimestamp - (Query.endOffsetDays or 0) * 86400
				}) else nil
			end
		end, {
			UseSignalStateResult.series,
			p1,
			Query,
			p2,
			p3
		})
	}
end
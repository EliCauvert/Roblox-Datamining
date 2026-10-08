local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local experienceAnalyticsModule = require(parent.DataHydration.ExperienceAnalytics)
local getExperienceAnalyticsStore = experienceAnalyticsModule.getExperienceAnalyticsStore
local dataStatus = experienceAnalyticsModule.DataStatus
local _ = require(buildExperience.Analytics.AnalyticsWindow)
local _ = require(buildExperience.Analytics.Goals.GoalTypes)

local function _(p1, p2, p3, p4)
	return {
		universeId = p1,
		metric = p2.metric,
		granularity = p2.granularity or p3.granularity,
		lookbackSeconds = p3.lookbackSeconds * (p2.lookbackWindows or 1),
		endTime = p4,
		filters = p2.filters,
		breakdowns = p2.breakdowns
	}
end

return function(p1, p2, p3, p4)
	-- upvalues: reactModule (ref), signalsModule (ref), dataStatus (ref), getExperienceAnalyticsStore (ref), signalsReactModule (ref)
	local query = p2.query
	local var1 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), p4 (ref), dataStatus (copy), getExperienceAnalyticsStore (copy), p1 (ref), query (ref), p3 (ref)
		return signalsModule.createComputed(function(p5)
			-- upvalues: p4 (copy), dataStatus (copy), getExperienceAnalyticsStore (copy), p1 (copy), query (copy), p3 (copy)
			if p4 == nil then
				return { series = nil, status = dataStatus.NotReady }
			end
			local andFetchMetric = getExperienceAnalyticsStore(p5).getAndFetchMetric({
				universeId = p1,
				metric = query.metric,
				granularity = query.granularity or p3.granularity,
				lookbackSeconds = p3.lookbackSeconds * (query.lookbackWindows or 1),
				endTime = p4,
				filters = query.filters,
				breakdowns = query.breakdowns
			})
			
			return {
				series = andFetchMetric.data(p5),
				status = andFetchMetric.status(p5)
			}
		end)
	end, { p1, query, p3, p4 }))
	
	return {
		status = var1.status,
		value = reactModule.useMemo(function()
			-- upvalues: var1 (ref), p4 (ref), p2 (ref), p3 (ref)
			if var1.series == nil or p4 == nil then
				return nil
			end
			local dateTime = DateTime.fromIsoDate(p4)
			
			return if dateTime then p2.derive(var1.series, {
				lookbackSeconds = p3.lookbackSeconds,
				endUnix = dateTime.UnixTimestamp
			}) else nil
		end, { var1.series, p2, p3, p4 })
	}
end
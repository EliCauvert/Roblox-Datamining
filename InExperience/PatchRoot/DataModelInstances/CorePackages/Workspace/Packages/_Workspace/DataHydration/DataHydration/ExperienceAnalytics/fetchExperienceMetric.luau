local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local promiseModule = require(parent.Promise)
local _ = require(parent.HttpClient)
local urlBase = require(parent.UrlBuilder).UrlBase
local fFlagBuildExperienceAnalyticsBreakdownsModule = require(dataHydration.ExperienceAnalytics.FFlagBuildExperienceAnalyticsBreakdowns)
local pollAnalyticsOperationModule = require(script.Parent.pollAnalyticsOperation)
local experienceAnalyticsStoreTypesModule = require(script.Parent.ExperienceAnalyticsStoreTypes)
local metricGranularity = experienceAnalyticsStoreTypesModule.MetricGranularity
local filterOperation = experienceAnalyticsStoreTypesModule.FilterOperation
local t = {
	[metricGranularity.OneMinute] = "METRIC_GRANULARITY_ONE_MINUTE",
	[metricGranularity.HalfHour] = "METRIC_GRANULARITY_HALF_HOUR",
	[metricGranularity.OneHour] = "METRIC_GRANULARITY_ONE_HOUR",
	[metricGranularity.OneDay] = "METRIC_GRANULARITY_ONE_DAY",
	[metricGranularity.OneWeek] = "METRIC_GRANULARITY_ONE_WEEK",
	[metricGranularity.OneMonth] = "METRIC_GRANULARITY_ONE_MONTH",
	[metricGranularity.None] = "METRIC_GRANULARITY_NONE"
}
local t_1 = {
	[filterOperation.Contains] = "FILTER_OPERATION_CONTAINS",
	[filterOperation.NotContains] = "FILTER_OPERATION_NOT_CONTAINS",
	[filterOperation.GreaterThan] = "FILTER_OPERATION_GT",
	[filterOperation.GreaterThanOrEqual] = "FILTER_OPERATION_GTE",
	[filterOperation.LessThan] = "FILTER_OPERATION_LT",
	[filterOperation.LessThanOrEqual] = "FILTER_OPERATION_LTE",
	[filterOperation.Match] = "FILTER_OPERATION_MATCH",
	[filterOperation.Equals] = "FILTER_OPERATION_EQUALS",
	[filterOperation.NotEqual] = "FILTER_OPERATION_NOT_EQUAL"
}

local function _(p1)
	return os.date("!%Y-%m-%dT%H:%M:%SZ", p1)
end

local function toSeries(p1, p2)
	-- upvalues: fFlagBuildExperienceAnalyticsBreakdownsModule (ref)
	if p1.queryResult == nil then
		error({
			errorMessage = "analytics metric response missing queryResult"
		})
	end
	local values = p1.queryResult.values
	local var1 = if values ~= nil then nil else values[1]
	local var2 = if var1 ~= nil then nil else var1.dataPoints
	local var3 = nil
	
	if fFlagBuildExperienceAnalyticsBreakdownsModule then
		local t = {}
		
		if values ~= nil then
			for i, v in values do
				table.insert(t, {
					breakdownValues = v.breakdownValue or {},
					dataPoints = v.dataPoints or {}
				})
			end
		end
		var3 = t
	end
	return {
		dataPoints = var2 or {},
		granularity = p2,
		values = var3
	}
end

return function(p3, p4)
	-- upvalues: urlBase (ref), promiseModule (ref), t (ref), fFlagBuildExperienceAnalyticsBreakdownsModule (ref), t_1 (ref), pollAnalyticsOperationModule (ref), toSeries (ref)
	p4 = p4 or {}
	local baseUrl = p4.baseUrl or urlBase.APIS
	local dateTime = DateTime.fromIsoDate(p3.endTime)
	
	if dateTime == nil then
		return promiseModule.reject({
			errorMessage = "invalid endTime for analytics metric query: " .. tostring(p3.endTime)
		})
	end
	local unixTimestamp = dateTime.UnixTimestamp
	local t_2 = {
		resourceType = "RESOURCE_TYPE_UNIVERSE",
		resourceId = tostring(p3.universeId),
		metric = p3.metric,
		granularity = t[p3.granularity] or p3.granularity,
		startTime = os.date("!%Y-%m-%dT%H:%M:%SZ", unixTimestamp - p3.lookbackSeconds),
		endTime = os.date("!%Y-%m-%dT%H:%M:%SZ", unixTimestamp + 86400)
	}
	
	if fFlagBuildExperienceAnalyticsBreakdownsModule then
		if p3.filters ~= nil and #p3.filters > 0 then
			local t_3 = {}
			
			for i, v in p3.filters do
				table.insert(t_3, {
					dimension = v.dimension,
					values = v.values,
					operation = t_1[v.operation] or v.operation
				})
			end
			t_2.filter = t_3
		end
		if p3.breakdowns ~= nil and #p3.breakdowns > 0 then
			local t_3 = {}
			
			for i, v in p3.breakdowns do
				table.insert(t_3, { dimensions = v.dimensions })
			end
			t_2.breakdown = t_3
		end
	end
	return pollAnalyticsOperationModule({
		analyticsKey = "build-experience.experience-analytics-metric",
		timeoutMessage = "analytics metric query did not complete after polling",
		network = p4.network,
		url = baseUrl .. "/analytics-query-gateway/v1/metrics/resource/" .. "RESOURCE_TYPE_UNIVERSE" .. "/id/" .. tostring(p3.universeId),
		body = { query = t_2 },
		mapResult = function(p5)
			-- upvalues: toSeries (copy), p3 (ref)
			return toSeries(p5, p3.granularity)
		end,
		delay = p4.delay
	})
end
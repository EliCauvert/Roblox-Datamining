local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local PromiseModule = require(Parent.Promise)
local _ = require(Parent.HttpClient)
local UrlBase = require(Parent.UrlBuilder).UrlBase
local FFlagBuildExperienceAnalyticsBreakdownsModule = require(DataHydration.ExperienceAnalytics.FFlagBuildExperienceAnalyticsBreakdowns)
local PollAnalyticsOperationModule = require(script.Parent.pollAnalyticsOperation)
local ExperienceAnalyticsStoreTypesModule = require(script.Parent.ExperienceAnalyticsStoreTypes)
local MetricGranularity = ExperienceAnalyticsStoreTypesModule.MetricGranularity
local FilterOperation = ExperienceAnalyticsStoreTypesModule.FilterOperation
local config = {
	[MetricGranularity.OneMinute] = "METRIC_GRANULARITY_ONE_MINUTE",
	[MetricGranularity.HalfHour] = "METRIC_GRANULARITY_HALF_HOUR",
	[MetricGranularity.OneHour] = "METRIC_GRANULARITY_ONE_HOUR",
	[MetricGranularity.OneDay] = "METRIC_GRANULARITY_ONE_DAY",
	[MetricGranularity.OneWeek] = "METRIC_GRANULARITY_ONE_WEEK",
	[MetricGranularity.OneMonth] = "METRIC_GRANULARITY_ONE_MONTH",
	[MetricGranularity.None] = "METRIC_GRANULARITY_NONE"
}
local config1 = {
	[FilterOperation.Contains] = "FILTER_OPERATION_CONTAINS",
	[FilterOperation.NotContains] = "FILTER_OPERATION_NOT_CONTAINS",
	[FilterOperation.GreaterThan] = "FILTER_OPERATION_GT",
	[FilterOperation.GreaterThanOrEqual] = "FILTER_OPERATION_GTE",
	[FilterOperation.LessThan] = "FILTER_OPERATION_LT",
	[FilterOperation.LessThanOrEqual] = "FILTER_OPERATION_LTE",
	[FilterOperation.Match] = "FILTER_OPERATION_MATCH",
	[FilterOperation.Equals] = "FILTER_OPERATION_EQUALS",
	[FilterOperation.NotEqual] = "FILTER_OPERATION_NOT_EQUAL"
}

local function _(p1): string
	return (os.date("!%Y-%m-%dT%H:%M:%SZ", p1))
end

local function toSeries(p1, Granularity)
	-- upvalues: FFlagBuildExperienceAnalyticsBreakdownsModule (copy)
	if p1.queryResult == nil then
		error({
			errorMessage = "analytics metric response missing queryResult"
		})
	end
	local Values = p1.queryResult.values
	local Value = if Values == nil then nil else Values[1]
	local DataPoints = if Value == nil then nil else Value.dataPoints
	local Values1 = nil
	
	if FFlagBuildExperienceAnalyticsBreakdownsModule then
		local List = {}
		
		if Values ~= nil then
			for _, value in Values do
				table.insert(List, {
					breakdownValues = value.breakdownValue or {},
					dataPoints = value.dataPoints or {}
				})
			end
		end
		Values1 = List
	end
	return {
		dataPoints = DataPoints or {},
		granularity = Granularity,
		values = Values1
	}
end

return function(p2, p3)
	-- upvalues: UrlBase (copy), PromiseModule (copy), config (copy), FFlagBuildExperienceAnalyticsBreakdownsModule (copy), config1 (copy), PollAnalyticsOperationModule (copy), toSeries (copy)
	local P4 = p3 or {}
	local BaseUrl = P4.baseUrl or UrlBase.APIS
	local _DateTime = DateTime.fromIsoDate(p2.endTime)
	
	if _DateTime == nil then
		return PromiseModule.reject({
			errorMessage = "invalid endTime for analytics metric query: " .. tostring(p2.endTime)
		})
	end
	local UnixTimestamp: number = _DateTime.UnixTimestamp
	local Query = {
		resourceType = "RESOURCE_TYPE_UNIVERSE",
		resourceId = tostring(p2.universeId),
		metric = p2.metric,
		granularity = config[p2.granularity] or p2.granularity,
		startTime = os.date("!%Y-%m-%dT%H:%M:%SZ", UnixTimestamp - p2.lookbackSeconds),
		endTime = os.date("!%Y-%m-%dT%H:%M:%SZ", UnixTimestamp + 86400)
	}
	
	if FFlagBuildExperienceAnalyticsBreakdownsModule then
		if p2.filters ~= nil and #p2.filters > 0 then
			local Filter = {}
			
			for _, filter in p2.filters do
				table.insert(Filter, {
					dimension = filter.dimension,
					values = filter.values,
					operation = config1[filter.operation] or filter.operation
				})
			end
			Query.filter = Filter
		end
		if p2.breakdowns ~= nil and #p2.breakdowns > 0 then
			local Breakdown = {}
			
			for _, breakdown in p2.breakdowns do
				table.insert(Breakdown, { dimensions = breakdown.dimensions })
			end
			Query.breakdown = Breakdown
		end
	end
	return PollAnalyticsOperationModule({
		analyticsKey = "build-experience.experience-analytics-metric",
		timeoutMessage = "analytics metric query did not complete after polling",
		network = P4.network,
		url = BaseUrl .. "/analytics-query-gateway/v1/metrics/resource/" .. "RESOURCE_TYPE_UNIVERSE" .. "/id/" .. tostring(p2.universeId),
		body = { query = Query },
		mapResult = function(p4)
			-- upvalues: toSeries (upval), p2 (copy)
			return (toSeries(p4, p2.granularity))
		end,
		delay = P4.delay
	})
end
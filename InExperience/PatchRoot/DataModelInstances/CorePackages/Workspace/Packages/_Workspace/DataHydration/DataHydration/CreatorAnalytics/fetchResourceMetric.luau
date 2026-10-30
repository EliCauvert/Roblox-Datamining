local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local PromiseModule = require(Parent.Promise)
local _ = require(Parent.HttpClient)
local UrlBase = require(Parent.UrlBuilder).UrlBase
local FFlagBuildExperienceAnalyticsBreakdownsModule = require(DataHydration.CreatorAnalytics.FFlagBuildExperienceAnalyticsBreakdowns)
local PollAnalyticsOperationModule = require(script.Parent.pollAnalyticsOperation)
local CreatorAnalyticsStoreTypesModule = require(script.Parent.CreatorAnalyticsStoreTypes)
local MetricGranularity = CreatorAnalyticsStoreTypesModule.MetricGranularity
local FilterOperation = CreatorAnalyticsStoreTypesModule.FilterOperation
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

local function toSeries(p1, Granularity, IncludeAdvancedFields)
	if p1.queryResult == nil then
		error({
			errorMessage = "analytics metric response missing queryResult"
		})
	end
	local Values = p1.queryResult.values
	local Value = if Values == nil then nil else Values[1]
	local DataPoints = if Value == nil then nil else Value.dataPoints
	local Values1 = nil
	
	if IncludeAdvancedFields then
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

return function(Query, p2)
	-- upvalues: UrlBase (copy), FFlagBuildExperienceAnalyticsBreakdownsModule (copy), PromiseModule (copy), config (copy), config1 (copy), PollAnalyticsOperationModule (copy), toSeries (copy)
	local P5 = p2 or {}
	local BaseUrl = P5.baseUrl or UrlBase.APIS
	local HasResourceType = Query.resourceType ~= nil
	local ResourceType = if HasResourceType then Query.resourceType else "RESOURCE_TYPE_UNIVERSE"
	local ResourceId = if HasResourceType then Query.resourceId else tostring(Query.universeId)
	local Filters = Query.filters
	local Breakdowns = Query.breakdowns
	local HasResourceType1 = if P5.includeAdvancedFields == nil then HasResourceType or FFlagBuildExperienceAnalyticsBreakdownsModule else P5.includeAdvancedFields
	local _DateTime = DateTime.fromIsoDate(Query.endTime)
	
	if _DateTime == nil then
		return PromiseModule.reject({
			errorMessage = "invalid endTime for analytics metric query: " .. tostring(Query.endTime)
		})
	end
	local UnixTimestamp: number = _DateTime.UnixTimestamp
	local Query1 = {
		resourceType = ResourceType,
		resourceId = ResourceId,
		metric = Query.metric,
		granularity = config[Query.granularity] or Query.granularity,
		startTime = os.date("!%Y-%m-%dT%H:%M:%SZ", UnixTimestamp - Query.lookbackSeconds),
		endTime = os.date("!%Y-%m-%dT%H:%M:%SZ", UnixTimestamp + 86400)
	}
	
	if HasResourceType1 then
		if Filters ~= nil and #Filters > 0 then
			local Filter = {}
			
			for _, filter in Filters do
				table.insert(Filter, {
					dimension = filter.dimension,
					values = filter.values,
					operation = config1[filter.operation] or filter.operation
				})
			end
			Query1.filter = Filter
		end
		if Breakdowns ~= nil and #Breakdowns > 0 then
			local Breakdown = {}
			
			for _, breakdown in Breakdowns do
				table.insert(Breakdown, { dimensions = breakdown.dimensions })
			end
			Query1.breakdown = Breakdown
		end
	end
	return PollAnalyticsOperationModule({
		timeoutMessage = "analytics metric query did not complete after polling",
		network = P5.network,
		url = BaseUrl .. "/analytics-query-gateway/v1/metrics/resource/" .. ResourceType .. "/id/" .. ResourceId,
		body = { query = Query1 },
		analyticsKey = P5.analyticsKey or (if HasResourceType then "data-hydration.resource-analytics-metric" else "build-experience.experience-analytics-metric"),
		mapResult = function(p3)
			-- upvalues: toSeries (upval), Query (copy), HasResourceType1 (copy)
			return (toSeries(p3, Query.granularity, HasResourceType1))
		end,
		delay = P5.delay
	})
end
local parent = script:FindFirstAncestor("DataHydration").Parent
local promiseModule = require(parent.Promise)
local _ = require(parent.HttpClient)
local urlBase = require(parent.UrlBuilder).UrlBase
local pollAnalyticsOperationModule = require(script.Parent.pollAnalyticsOperation)
local metricGranularity = require(script.Parent.ExperienceAnalyticsStoreTypes).MetricGranularity
local t = {
	[metricGranularity.OneMinute] = "METRIC_GRANULARITY_ONE_MINUTE",
	[metricGranularity.HalfHour] = "METRIC_GRANULARITY_HALF_HOUR",
	[metricGranularity.OneHour] = "METRIC_GRANULARITY_ONE_HOUR",
	[metricGranularity.OneDay] = "METRIC_GRANULARITY_ONE_DAY",
	[metricGranularity.OneWeek] = "METRIC_GRANULARITY_ONE_WEEK",
	[metricGranularity.OneMonth] = "METRIC_GRANULARITY_ONE_MONTH",
	[metricGranularity.None] = "METRIC_GRANULARITY_NONE"
}

local function _(p1)
	return os.date("!%Y-%m-%dT%H:%M:%SZ", p1)
end

local function toSeries(p1, p2)
	if p1.queryResult == nil then
		error({
			errorMessage = "analytics metric response missing queryResult"
		})
	end
	local values = p1.queryResult.values
	local var1 = if values ~= nil then nil else values[1]
	
	return {
		dataPoints = (if var1 ~= nil then nil else var1.dataPoints) or {},
		granularity = p2
	}
end

return function(p1, p2)
	-- upvalues: urlBase (ref), promiseModule (ref), t (ref), pollAnalyticsOperationModule (ref), toSeries (ref)
	p2 = p2 or {}
	local baseUrl = p2.baseUrl or urlBase.APIS
	local dateTime = DateTime.fromIsoDate(p1.endTime)
	
	if dateTime == nil then
		return promiseModule.reject({
			errorMessage = "invalid endTime for analytics metric query: " .. tostring(p1.endTime)
		})
	end
	local unixTimestamp = dateTime.UnixTimestamp
	
	return pollAnalyticsOperationModule({
		analyticsKey = "build-experience.experience-analytics-metric",
		timeoutMessage = "analytics metric query did not complete after polling",
		network = p2.network,
		url = baseUrl .. "/analytics-query-gateway/v1/metrics/resource/" .. "RESOURCE_TYPE_UNIVERSE" .. "/id/" .. tostring(p1.universeId),
		body = {
			query = {
				resourceType = "RESOURCE_TYPE_UNIVERSE",
				resourceId = tostring(p1.universeId),
				metric = p1.metric,
				granularity = t[p1.granularity] or p1.granularity,
				startTime = os.date("!%Y-%m-%dT%H:%M:%SZ", unixTimestamp - p1.lookbackSeconds),
				endTime = os.date("!%Y-%m-%dT%H:%M:%SZ", unixTimestamp + 86400)
			}
		},
		mapResult = function(p3)
			-- upvalues: toSeries (copy), p1 (ref)
			return toSeries(p3, p1.granularity)
		end,
		delay = p2.delay
	})
end
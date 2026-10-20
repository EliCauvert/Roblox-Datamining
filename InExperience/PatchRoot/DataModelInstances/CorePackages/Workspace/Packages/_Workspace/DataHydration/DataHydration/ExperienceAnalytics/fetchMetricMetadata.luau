local Parent = script:FindFirstAncestor("DataHydration").Parent
local _ = require(Parent.HttpClient)
local UrlBase = require(Parent.UrlBuilder).UrlBase
local PollAnalyticsOperationModule = require(script.Parent.pollAnalyticsOperation)
local _ = require(script.Parent.ExperienceAnalyticsStoreTypes)

local function toMap(p1)
	if p1.metricMetadataResult == nil then
		error({
			errorMessage = "analytics metadata response missing metricMetadataResult"
		})
	end
	local Metadata = p1.metricMetadataResult.metadata
	local LatestAvailableTimes = {}
	
	if Metadata ~= nil then
		for _, value in Metadata do
			if value.metric ~= nil and value.latestAvailableTime ~= nil then
				LatestAvailableTimes[value.metric] = value.latestAvailableTime
			end
		end
	end
	return LatestAvailableTimes
end

return function(Metrics, p2)
	-- upvalues: UrlBase (copy), PollAnalyticsOperationModule (copy), toMap (copy)
	local P2 = p2 or {}
	
	return PollAnalyticsOperationModule({
		analyticsKey = "build-experience.experience-analytics-metadata",
		timeoutMessage = "analytics metadata query did not complete after polling",
		network = P2.network,
		url = (P2.baseUrl or UrlBase.APIS) .. "/analytics-query-gateway/v1/metrics/metadata",
		body = { query = { metrics = Metrics } },
		mapResult = toMap,
		delay = P2.delay
	})
end
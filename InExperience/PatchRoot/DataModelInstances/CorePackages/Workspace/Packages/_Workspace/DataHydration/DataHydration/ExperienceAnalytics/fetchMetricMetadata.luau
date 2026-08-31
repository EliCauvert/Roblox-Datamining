local parent = script:FindFirstAncestor("DataHydration").Parent
local _ = require(parent.HttpClient)
local urlBase = require(parent.UrlBuilder).UrlBase
local pollAnalyticsOperationModule = require(script.Parent.pollAnalyticsOperation)
local _ = require(script.Parent.ExperienceAnalyticsStoreTypes)

local function toMap(p1)
	if p1.metricMetadataResult == nil then
		error({
			errorMessage = "analytics metadata response missing metricMetadataResult"
		})
	end
	local metadata = p1.metricMetadataResult.metadata
	local t = {}
	
	if metadata ~= nil then
		for i, v in metadata do
			if v.metric ~= nil and v.latestAvailableTime ~= nil then
				t[v.metric] = v.latestAvailableTime
			end
		end
	end
	return t
end

return function(p2, p3)
	-- upvalues: urlBase (ref), pollAnalyticsOperationModule (ref), toMap (ref)
	p3 = p3 or {}
	
	return pollAnalyticsOperationModule({
		analyticsKey = "build-experience.experience-analytics-metadata",
		timeoutMessage = "analytics metadata query did not complete after polling",
		network = p3.network,
		url = (p3.baseUrl or urlBase.APIS) .. "/analytics-query-gateway/v1/metrics/metadata",
		body = { query = { metrics = p2 } },
		mapResult = toMap,
		delay = p3.delay
	})
end
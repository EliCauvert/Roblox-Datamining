local parent = script:FindFirstAncestor("DataHydration").Parent
local httpClientModule = require(parent.HttpClient)
local httpModule = require(parent.Http)
local _ = require(script.Parent.Parent.ProfileInsightsStoreTypes)
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise

return function(p1, p2)
	-- upvalues: fetch (ref), httpModule (ref), asPromise (ref)
	return asPromise(fetch({
		method = "POST",
		analyticsKey = "profile-insights.multi-profile-insights",
		url = `{httpModule.Url.APIS_URL}profile-insights-api/v1/multiProfileInsights`,
		body = {
			userIds = p1.userIds,
			count = p1.count,
			rankingStrategy = p1.rankingStrategy
		},
		network = p2,
		decode = function(p3)
			return p3
		end
	}))
end
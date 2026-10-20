local Parent = script:FindFirstAncestor("DataHydration").Parent
local HttpClientModule = require(Parent.HttpClient)
local HttpModule = require(Parent.Http)
local _ = require(script.Parent.Parent.ProfileInsightsStoreTypes)
local FetchFunction = HttpClientModule.fetch
local AsPromiseFunction = HttpClientModule.asPromise

return function(p1, Network)
	-- upvalues: FetchFunction (copy), HttpModule (copy), AsPromiseFunction (copy)
	return AsPromiseFunction((FetchFunction({
		method = "POST",
		analyticsKey = "profile-insights.multi-profile-insights",
		url = `{HttpModule.Url.APIS_URL}profile-insights-api/v1/multiProfileInsights`,
		body = {
			userIds = p1.userIds,
			count = p1.count,
			rankingStrategy = p1.rankingStrategy
		},
		network = Network,
		decode = function(p2)
			return p2
		end
	})))
end
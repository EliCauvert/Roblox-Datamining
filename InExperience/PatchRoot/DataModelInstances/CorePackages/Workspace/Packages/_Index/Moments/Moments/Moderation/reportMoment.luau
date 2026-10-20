local Parent = script:FindFirstAncestor("Moments").Parent
local HttpClientModule = require(Parent.HttpClient)
local Text = require(Parent.Http).Url.APIS_URL .. "content-captures-api/v1/moderate/report"

return function(FeedItemId, ReportType, Network)
	-- upvalues: HttpClientModule (copy), Text (copy)
	return HttpClientModule.asPromise(HttpClientModule.fetch({
		method = "POST",
		analyticsKey = "moments.report-moment",
		url = Text,
		body = { feedItemId = FeedItemId, reportType = ReportType },
		network = Network,
		decode = function(p1)
			return { ok = true, reportCode = p1.reportCode }
		end
	}))
end
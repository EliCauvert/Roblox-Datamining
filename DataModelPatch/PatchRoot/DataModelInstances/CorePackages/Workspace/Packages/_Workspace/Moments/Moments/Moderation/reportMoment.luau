local Parent = script:FindFirstAncestor("Moments").Parent
local HttpClientModule = require(Parent.HttpClient)
local Text = require(Parent.Http).Url.APIS_URL .. "content-captures-api/v1/moderate/report"

return function(MomentId, Network)
	-- upvalues: HttpClientModule (copy), Text (copy)
	return HttpClientModule.asPromise(HttpClientModule.fetch({
		method = "POST",
		analyticsKey = "moments.report-moment",
		url = Text,
		body = { momentId = MomentId },
		network = Network,
		decode = function(_)
			return { ok = true }
		end
	}))
end
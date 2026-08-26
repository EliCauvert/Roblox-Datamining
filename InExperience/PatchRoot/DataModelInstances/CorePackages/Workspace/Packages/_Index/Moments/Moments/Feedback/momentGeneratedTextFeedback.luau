local parent = script:FindFirstAncestor("Moments").Parent
local httpClientModule = require(parent.HttpClient)
local text = require(parent.Http).Url.APIS_URL .. "content-captures-api/v1/moment-generated-text-feedback"

return function(p1, p2, p3)
	-- upvalues: httpClientModule (ref), text (ref)
	return httpClientModule.asPromise(httpClientModule.fetch({
		method = "POST",
		analyticsKey = "moments.moment-generated-text-feedback",
		url = text,
		body = { generationToken = p1, reason = p2 },
		network = p3,
		decode = function(_)
			return { ok = true }
		end
	}))
end
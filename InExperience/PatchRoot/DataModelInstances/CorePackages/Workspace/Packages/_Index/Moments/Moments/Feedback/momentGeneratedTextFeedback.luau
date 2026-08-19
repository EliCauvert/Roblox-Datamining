local parent = script:FindFirstAncestor("Moments").Parent
local httpClientModule = require(parent.HttpClient)
local text = require(parent.Http).Url.APIS_URL .. "content-captures-api/v1/moment-generated-text-feedback"

return function(p0, p1, p2) --[[ line: 22 | named "momentGeneratedTextFeedback" ]]
	-- upvalues: httpClientModule (ref), text (ref)
	return httpClientModule.asPromise(httpClientModule.fetch({
		method = "POST",
		analyticsKey = "moments.moment-generated-text-feedback",
		url = text,
		body = { generationToken = p0, reason = p1 },
		network = p2,
		decode = function(_) --[[ line: 32 ]]
			return { ok = true }
		end
	}))
end
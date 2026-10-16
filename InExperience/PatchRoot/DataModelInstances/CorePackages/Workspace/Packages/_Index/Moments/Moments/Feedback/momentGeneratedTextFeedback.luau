local Parent = script:FindFirstAncestor("Moments").Parent
local HttpClientModule = require(Parent.HttpClient)
local Text = require(Parent.Http).Url.APIS_URL .. "content-captures-api/v1/moment-generated-text-feedback"

return function(GenerationToken, Reason, Network) --[[ Line: 22 | Named "momentGeneratedTextFeedback" ]]
	-- upvalues: HttpClientModule (copy), Text (copy)
	return HttpClientModule.asPromise(HttpClientModule.fetch({
		method = "POST",
		analyticsKey = "moments.moment-generated-text-feedback",
		url = Text,
		body = { generationToken = GenerationToken, reason = Reason },
		network = Network,
		decode = function(_) --[[ Line: 32 ]]
			return { ok = true }
		end
	}))
end
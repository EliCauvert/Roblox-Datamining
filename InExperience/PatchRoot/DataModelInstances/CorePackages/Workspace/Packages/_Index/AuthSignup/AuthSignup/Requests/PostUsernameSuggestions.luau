local httpService = game:GetService("HttpService")
local urlBuilder = require(script:FindFirstAncestor("AuthSignup").Parent.UrlBuilder).UrlBuilder

return function(p1, p2, p3)
	-- upvalues: urlBuilder (ref), httpService (ref)
	assert(type(p2) == "string", "invalid username")
	assert(type(p3) == "string", "invalid birthday")
	
	return p1(urlBuilder.fromString("auth:v1/validators/username")(), "POST", {
		maxRetryCount = 0,
		postBody = httpService:JSONEncode({ username = p2, birthday = p3 })
	})
end
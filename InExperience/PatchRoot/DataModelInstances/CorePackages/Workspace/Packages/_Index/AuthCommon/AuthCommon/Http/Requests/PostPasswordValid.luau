local httpService = game:GetService("HttpService")
local urlBuilder = require(script:FindFirstAncestor("AuthCommon").Parent.UrlBuilder).UrlBuilder

return function(p1, p2, p3)
	-- upvalues: urlBuilder (ref), httpService (ref)
	assert(type(p2) == "string", "invalid username")
	assert(type(p3) == "string", "invalid password")
	
	return p1(urlBuilder.fromString("auth:v2/passwords/validate")(), "POST", {
		postBody = httpService:JSONEncode({ username = p2, password = p3 })
	})
end
local httpService = game:GetService("HttpService")
local urlBuilder = require(script:FindFirstAncestor("AuthCommon").Parent.UrlBuilder).UrlBuilder

return function(p0, p1, p2)
	-- upvalues: urlBuilder (ref), httpService (ref)
	assert(type(p1) == "string", "invalid username")
	assert(type(p2) == "string", "invalid password")
	
	return p0(urlBuilder.fromString("auth:v2/passwords/validate")(), "POST", {
		postBody = httpService:JSONEncode({ username = p1, password = p2 })
	})
end
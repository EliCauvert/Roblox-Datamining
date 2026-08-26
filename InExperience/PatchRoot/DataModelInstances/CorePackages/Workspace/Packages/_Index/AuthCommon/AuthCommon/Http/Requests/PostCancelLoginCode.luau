local httpService = game:GetService("HttpService")
local urlBuilder = require(script:FindFirstAncestor("AuthCommon").Parent.UrlBuilder).UrlBuilder

return function(p1, p2)
	-- upvalues: urlBuilder (ref), httpService (ref)
	assert(type(p2) == "string", "invalid login code")
	
	return p1(urlBuilder.fromString("apis:auth-token-service/v1/login/cancel")(), "POST", { postBody = httpService:JSONEncode({ code = p2 }) })
end
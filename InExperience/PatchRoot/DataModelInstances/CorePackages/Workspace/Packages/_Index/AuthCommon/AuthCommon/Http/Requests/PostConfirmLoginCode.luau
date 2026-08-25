local httpService = game:GetService("HttpService")
local urlBuilder = require(script:FindFirstAncestor("AuthCommon").Parent.UrlBuilder).UrlBuilder

return function(p0, p1)
	-- upvalues: urlBuilder (ref), httpService (ref)
	assert(type(p1) == "string", "invalid login code")
	
	return p0(urlBuilder.fromString("apis:auth-token-service/v1/login/validateCode")(), "POST", { postBody = httpService:JSONEncode({ code = p1 }) })
end
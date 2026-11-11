local HttpService = game:GetService("HttpService")
local UrlBuilder = require(script:FindFirstAncestor("AuthCommon").Parent.UrlBuilder).UrlBuilder

return function(Callback, Code)
	-- upvalues: UrlBuilder (copy), HttpService (copy)
	assert(type(Code) == "string", "invalid login code")
	
	return Callback(UrlBuilder.fromString("apis:auth-token-service/v1/login/validateCode")(), "POST", { postBody = HttpService:JSONEncode({ code = Code }) })
end
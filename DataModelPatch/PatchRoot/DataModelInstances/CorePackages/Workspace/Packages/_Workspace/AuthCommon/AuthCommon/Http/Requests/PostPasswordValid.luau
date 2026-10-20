local HttpService = game:GetService("HttpService")
local UrlBuilder = require(script:FindFirstAncestor("AuthCommon").Parent.UrlBuilder).UrlBuilder

return function(Callback, Username, Password)
	-- upvalues: UrlBuilder (copy), HttpService (copy)
	assert(type(Username) == "string", "invalid username")
	assert(type(Password) == "string", "invalid password")
	
	return Callback(UrlBuilder.fromString("auth:v2/passwords/validate")(), "POST", {
		postBody = HttpService:JSONEncode({ username = Username, password = Password })
	})
end
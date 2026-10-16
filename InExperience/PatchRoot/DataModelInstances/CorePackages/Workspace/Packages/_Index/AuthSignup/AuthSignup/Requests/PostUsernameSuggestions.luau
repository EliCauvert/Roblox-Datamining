local HttpService = game:GetService("HttpService")
local UrlBuilder = require(script:FindFirstAncestor("AuthSignup").Parent.UrlBuilder).UrlBuilder

return function(Callback, Username, Birthday) --[[ Line: 12 ]]
	-- upvalues: UrlBuilder (copy), HttpService (copy)
	assert(type(Username) == "string", "invalid username")
	assert(type(Birthday) == "string", "invalid birthday")
	
	return Callback(UrlBuilder.fromString("auth:v1/validators/username")(), "POST", {
		maxRetryCount = 0,
		postBody = HttpService:JSONEncode({ username = Username, birthday = Birthday })
	})
end
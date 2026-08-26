local authCommon = script:FindFirstAncestor("AuthCommon")
local httpService = game:GetService("HttpService")
local urlBuilder = require(authCommon.Parent.UrlBuilder).UrlBuilder
local usernameValidationContextModule = require(authCommon.Enums.UsernameValidationContext)

return function(p1, p2, p3, p4)
	-- upvalues: usernameValidationContextModule (ref), urlBuilder (ref), httpService (ref)
	if not p4 then
		p4 = usernameValidationContextModule.Unknown
	end
	assert(type(p2) == "string", "invalid username")
	assert(type(p3) == "string", "invalid birthday")
	
	return p1(urlBuilder.fromString("auth:v2/usernames/validate")(), "POST", {
		postBody = httpService:JSONEncode({ username = p2, birthday = p3, context = p4 })
	})
end
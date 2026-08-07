local authCommon = script:FindFirstAncestor("AuthCommon")
local httpService = game:GetService("HttpService")
local urlBuilder = require(authCommon.Parent.UrlBuilder).UrlBuilder
local usernameValidationContextModule = require(authCommon.Enums.UsernameValidationContext)

return function(p0, p1, p2, p3) --[[ line: 12 ]]
	-- upvalues: usernameValidationContextModule (ref), urlBuilder (ref), httpService (ref)
	if not p3 then
		p3 = usernameValidationContextModule.Unknown
	end
	assert(type(p1) == "string", "invalid username")
	assert(type(p2) == "string", "invalid birthday")
	
	return p0(urlBuilder.fromString("auth:v2/usernames/validate")(), "POST", {
		postBody = httpService:JSONEncode({ username = p1, birthday = p2, context = p3 })
	})
end
local AuthCommon = script:FindFirstAncestor("AuthCommon")
local HttpService = game:GetService("HttpService")
local UrlBuilder = require(AuthCommon.Parent.UrlBuilder).UrlBuilder
local UsernameValidationContextModule = require(AuthCommon.Enums.UsernameValidationContext)

return function(Callback, Username, Birthday, Context) --[[ Line: 12 ]]
	-- upvalues: UsernameValidationContextModule (copy), UrlBuilder (copy), HttpService (copy)
	if not Context then
		Context = UsernameValidationContextModule.Unknown
	end
	assert(type(Username) == "string", "invalid username")
	assert(type(Birthday) == "string", "invalid birthday")
	
	return Callback(UrlBuilder.fromString("auth:v2/usernames/validate")(), "POST", {
		postBody = HttpService:JSONEncode({
			username = Username,
			birthday = Birthday,
			context = Context
		})
	})
end
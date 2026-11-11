local HttpService = game:GetService("HttpService")
local UrlModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url)

return function(Callback, Code, Challenge)
	-- upvalues: UrlModule (copy), HttpService (copy)
	assert(type(Challenge) == "string", "invalid challenge has been passed into PostVerifyPhoneNumber")
	assert(type(Code) == "string", "invalid code has been passed into PostVerifyPhoneNumber")
	
	return Callback(string.format("%sv1/verified-signup/voucher", UrlModule.AUTH_URL), "POST", {
		maxRetryCount = 0,
		postBody = HttpService:JSONEncode({ code = Code, challenge = Challenge })
	})
end
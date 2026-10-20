local LoginV2 = script:FindFirstAncestor("LoginV2")
local HttpService = game:GetService("HttpService")
local Url = require(LoginV2.Parent.Http).Url
local _ = require(LoginV2.Common.LoginV2RequestTypes)

function getStartAuthenticationByUserUrl(): string
	-- upvalues: Url (copy)
	return string.format("%sv1/passkey/start-authentication-by-user", Url.AUTH_URL)
end

return function(Callback, Input)
	-- upvalues: HttpService (copy)
	return Callback(getStartAuthenticationByUserUrl(), "POST", { postBody = HttpService:JSONEncode(Input) })
end
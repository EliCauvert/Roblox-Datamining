local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CredentialTypeModule = require(Modules.LuaApp.Enum.CredentialType)
local NewResult = require(Modules.LuaApp.Http.UrlBuilder).new({
	path = "v2/credentials/verification",
	query = "{credentialType}&{credentialValue}&{password}",
	base = require(Modules.LuaApp.Http.Url).AUTH_URL
})

return function(Callback, CredentialType, CredentialValue, Password)
	-- upvalues: CredentialTypeModule (copy), NewResult (copy)
	assert(CredentialType == CredentialTypeModule.Email or CredentialType == CredentialTypeModule.PhoneNumber, "AuthCanVerifyCredentials request expects credentialType to be a Email or PhoneNumber")
	assert(type(CredentialValue) == "string", "AuthCanVerifyCredentials request expects credentialType to be a string")
	assert(type(Password) == "string", "AuthCanVerifyCredentials request expects password to be a string")
	
	return Callback(NewResult({
		credentialType = CredentialType,
		credentialValue = CredentialValue,
		password = Password
	}), "GET")
end
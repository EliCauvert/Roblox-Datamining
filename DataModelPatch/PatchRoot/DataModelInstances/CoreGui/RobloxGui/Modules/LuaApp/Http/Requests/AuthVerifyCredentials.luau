local Modules = game:GetService("CoreGui").RobloxGui.Modules
local HttpService = game:GetService("HttpService")
local UrlModule = require(Modules.LuaApp.Http.Url)
local CredentialTypeModule = require(Modules.LuaApp.Enum.CredentialType)

return function(Callback, CredentialType, CredentialValue, Password)
	-- upvalues: CredentialTypeModule (copy), UrlModule (copy), HttpService (copy)
	assert(CredentialType == CredentialTypeModule.Email or CredentialType == CredentialTypeModule.PhoneNumber, "AuthVerifyCredentials request expects credentialType to be a Email or PhoneNumber")
	assert(type(CredentialValue) == "string", "AuthVerifyCredentials request expects credentialType to be a string")
	assert(type(Password) == "string", "AuthVerifyCredentials request expects password to be a string")
	
	return Callback(string.format("%sv2/credentials/verification/send", UrlModule.AUTH_URL), "POST", {
		postBody = HttpService:JSONEncode({
			credentialType = CredentialType,
			credentialValue = CredentialValue,
			password = Password
		})
	})
end
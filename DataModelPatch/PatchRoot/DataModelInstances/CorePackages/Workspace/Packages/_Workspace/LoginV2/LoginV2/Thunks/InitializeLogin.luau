local LoginV2 = script:FindFirstAncestor("LoginV2")
local HttpService = game:GetService("HttpService")
local PromiseModule = require(LoginV2.Parent.Promise)
local AuthIdentifierErrorCodesModule = require(LoginV2.Enums.AuthIdentifierErrorCodes)
local PostInitializeLoginModule = require(LoginV2.Requests.PostInitializeLogin)
local _ = require(LoginV2.Common.LoginV2RequestTypes)
local LoginV2EmailCredentialRequiredError = game:DefineFastFlag("LoginV2EmailCredentialRequiredError", false)
local LoginV2NoLoginMethodsError = game:DefineFastFlag("LoginV2NoLoginMethodsError", false)

return function(p1, p2)
	-- upvalues: PostInitializeLoginModule (copy), PromiseModule (copy), HttpService (copy), AuthIdentifierErrorCodesModule (copy), LoginV2EmailCredentialRequiredError (copy), LoginV2NoLoginMethodsError (copy)
	return function()
		-- upvalues: PostInitializeLoginModule (upval), p1 (copy), p2 (copy), PromiseModule (upval), HttpService (upval), AuthIdentifierErrorCodesModule (upval), LoginV2EmailCredentialRequiredError (upval), LoginV2NoLoginMethodsError (upval)
		return PostInitializeLoginModule(p1, p2):andThen(function(Result)
			-- upvalues: PromiseModule (upval)
			return if Result and Result.responseBody then Result.responseBody else PromiseModule.reject()
		end, function(p3)
			-- upvalues: HttpService (upval), AuthIdentifierErrorCodesModule (upval), LoginV2EmailCredentialRequiredError (upval), LoginV2NoLoginMethodsError (upval), PromiseModule (upval)
			local Code = if p3.Body then HttpService:JSONDecode(p3.Body).errors[1].code else 0
			
			return PromiseModule.reject({
				errorCode = Code,
				errorKey = if Code == AuthIdentifierErrorCodesModule.InvalidUser then "Authentication.Login.Response.AccountNotFound" elseif LoginV2EmailCredentialRequiredError and Code == AuthIdentifierErrorCodesModule.EmailCredentialRequired then "Authentication.Login.Response.EnterEmailForLoginCode" elseif LoginV2NoLoginMethodsError and Code == AuthIdentifierErrorCodesModule.NoLoginMethods then "Authentication.Login.Response.NoLoginMethods" else "Authentication.Login.Response.SomethingWentWrong"
			})
		end)
	end
end
local AccountRecovery = script:FindFirstAncestor("AccountRecovery")
local HttpService = game:GetService("HttpService")
local _ = require(AccountRecovery.Parent.Http)
local AccountRecoveryErrorCodesModule = require(AccountRecovery.Enums.AccountRecoveryErrorCodes)
local PostSendCodeModule = require(AccountRecovery.Requests.PostSendCode)
local _ = require(AccountRecovery.Common.AccountRecoveryRequestTypes)
local ConstantsModule = require(AccountRecovery.Components.Constants)

return function(p1, p2)
	-- upvalues: PostSendCodeModule (copy), ConstantsModule (copy), HttpService (copy), AccountRecoveryErrorCodesModule (copy)
	return function()
		-- upvalues: PostSendCodeModule (upval), p1 (copy), p2 (copy), ConstantsModule (upval), HttpService (upval), AccountRecoveryErrorCodesModule (upval)
		return PostSendCodeModule(p1, p2):andThen(function(Result)
			-- upvalues: ConstantsModule (upval)
			return if Result and Result.responseBody and Result.responseBody ~= "" then { isError = false, data = Result.responseBody } else {
				isError = true,
				errorCode = 0,
				errorKey = ConstantsModule.UnknownErrorKey
			}
		end, function(p3)
			-- upvalues: HttpService (upval), ConstantsModule (upval), AccountRecoveryErrorCodesModule (upval)
			local Code = if p3.Body and p3.Body ~= "" then HttpService:JSONDecode(p3.Body).errors[1].code else 0
			
			return {
				isError = true,
				errorCode = Code,
				errorKey = if Code == AccountRecoveryErrorCodesModule.IdentifierInvalid then "Authentication.AccountRecovery.Message.Error.AccountNotFound" elseif Code == AccountRecoveryErrorCodesModule.TooManyRequests then "Authentication.AccountRecovery.Message.Error.TooManyRequests" elseif Code == AccountRecoveryErrorCodesModule.TryADifferentContactMethod then "Authentication.AccountRecovery.Message.Error.TryADifferentOne" else ConstantsModule.UnknownErrorKey
			}
		end)
	end
end
local AccountRecovery = script:FindFirstAncestor("AccountRecovery")
local HttpService = game:GetService("HttpService")
local _ = require(AccountRecovery.Parent.Http)
local ResetPasswordErrorCodesModule = require(AccountRecovery.Enums.ResetPasswordErrorCodes)
local PostResetPasswordModule = require(AccountRecovery.Requests.PostResetPassword)
local _ = require(AccountRecovery.Common.AccountRecoveryRequestTypes)
local ConstantsModule = require(AccountRecovery.Components.Constants)

return function(p1, p2)
	-- upvalues: PostResetPasswordModule (copy), ConstantsModule (copy), HttpService (copy), ResetPasswordErrorCodesModule (copy)
	return function()
		-- upvalues: PostResetPasswordModule (upval), p1 (copy), p2 (copy), ConstantsModule (upval), HttpService (upval), ResetPasswordErrorCodesModule (upval)
		return PostResetPasswordModule(p1, p2):andThen(function(Result)
			-- upvalues: ConstantsModule (upval)
			return if Result and Result.responseBody and Result.responseBody ~= "" then { isError = false, data = Result.responseBody } else {
				isError = true,
				errorCode = 0,
				errorKey = ConstantsModule.UnknownErrorKey
			}
		end, function(p3)
			-- upvalues: HttpService (upval), ConstantsModule (upval), ResetPasswordErrorCodesModule (upval)
			local Code = if p3.Body and p3.Body ~= "" then HttpService:JSONDecode(p3.Body).errors[1].code else 0
			
			return {
				isError = true,
				errorCode = Code,
				errorKey = if Code == ResetPasswordErrorCodesModule.TooManyRequests then "Authentication.AccountRecovery.Message.Error.TooManyRequests" elseif Code == ResetPasswordErrorCodesModule.InvalidPassword then "Authentication.AccountRecovery.Message.Error.InvalidPassword" elseif Code == ResetPasswordErrorCodesModule.PasswordsDoNotMatch then "Authentication.AccountRecovery.MessagePasswordsDoNotMatch" elseif Code == ResetPasswordErrorCodesModule.TwoStepVerificationRequired then ConstantsModule.UnknownErrorKey else ConstantsModule.UnknownErrorKey,
				errorRaw = HttpService:JSONDecode(p3.Body)
			}
		end)
	end
end
local AccountRecovery = script:FindFirstAncestor("AccountRecovery")
local HttpService = game:GetService("HttpService")
local _ = require(AccountRecovery.Parent.Http)
local AccountRecoveryErrorCodesModule = require(AccountRecovery.Enums.AccountRecoveryErrorCodes)
local GetCurrentTwoStepMethodModule = require(AccountRecovery.Requests.GetCurrentTwoStepMethod)
local _ = require(AccountRecovery.Common.AccountRecoveryRequestTypes)
local ConstantsModule = require(AccountRecovery.Components.Constants)

return function(p1, p2)
	-- upvalues: GetCurrentTwoStepMethodModule (copy), ConstantsModule (copy), HttpService (copy), AccountRecoveryErrorCodesModule (copy)
	return function()
		-- upvalues: GetCurrentTwoStepMethodModule (upval), p1 (copy), p2 (copy), ConstantsModule (upval), HttpService (upval), AccountRecoveryErrorCodesModule (upval)
		return GetCurrentTwoStepMethodModule(p1, p2):andThen(function(Result)
			-- upvalues: ConstantsModule (upval)
			return if Result and Result.responseBody and Result.responseBody ~= "" then { isError = false, data = Result.responseBody } else {
				isError = true,
				errorCode = 0,
				errorKey = ConstantsModule.UnknownErrorKey
			}
		end, function(p3)
			-- upvalues: HttpService (upval), ConstantsModule (upval), AccountRecoveryErrorCodesModule (upval)
			local Code = 0
			
			if p3.Body and p3.Body ~= "" then
				local Success, Result = pcall(HttpService.JSONDecode, HttpService, p3.Body)
				
				if Success then
					local Error = Result.errors and Result.errors[1]
					
					if Error then
						Code = Error.code
					end
				end
			end
			return {
				isError = true,
				errorCode = Code,
				errorKey = if Code == AccountRecoveryErrorCodesModule.IdentifierInvalid then "Authentication.AccountRecovery.Message.Error.AccountNotFound" else ConstantsModule.UnknownErrorKey
			}
		end)
	end
end
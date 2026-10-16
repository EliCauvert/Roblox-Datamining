local AuthCommon = script:FindFirstAncestor("AuthCommon")
local LoginErrorCodesModule = require(AuthCommon.Enums.LoginErrorCodes)
local StatusCodes = require(AuthCommon.Parent.Http).StatusCodes
local config = {
	[LoginErrorCodesModule.IncorrectCValueOrPassword] = "invalidCredentials",
	[LoginErrorCodesModule.MultipleUsersPerCredential] = "invalidCredentials",
	[LoginErrorCodesModule.AccountLocked] = "passwordReset",
	[LoginErrorCodesModule.CTypeNotSupported] = "badRequest",
	[LoginErrorCodesModule.CValueAndPasswordRequired] = "badRequest",
	[LoginErrorCodesModule.SecurityQuestions] = "securityQuestions"
}
local config1 = {
	[StatusCodes.TOO_MANY_REQUESTS] = "throttled",
	[StatusCodes.REQUEST_TIMEOUT] = "timeout",
	[StatusCodes.BAD_REQUEST] = "badRequest",
	[StatusCodes.NOT_FOUND] = "notFound",
	[StatusCodes.INTERNAL_SERVER_ERROR] = "serverError"
}

return function(p1) --[[ Line: 25 | Named "coarseLoginErrorBucket" ]]
	-- upvalues: config (copy), config1 (copy)
	if typeof(p1) == "table" then
		local Entry = config[p1.errorCode]
		
		return if Entry then Entry else p1.HttpError == Enum.HttpError.OK and config1[p1.StatusCode] or "unknown"
	else
		return "unknown"
	end
end
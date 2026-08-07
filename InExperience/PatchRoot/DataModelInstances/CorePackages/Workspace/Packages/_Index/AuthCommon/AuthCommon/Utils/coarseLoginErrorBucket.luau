local authCommon = script:FindFirstAncestor("AuthCommon")
local loginErrorCodesModule = require(authCommon.Enums.LoginErrorCodes)
local statusCodes = require(authCommon.Parent.Http).StatusCodes
local t = {
	[loginErrorCodesModule.IncorrectCValueOrPassword] = "invalidCredentials",
	[loginErrorCodesModule.MultipleUsersPerCredential] = "invalidCredentials",
	[loginErrorCodesModule.AccountLocked] = "passwordReset",
	[loginErrorCodesModule.CTypeNotSupported] = "badRequest",
	[loginErrorCodesModule.CValueAndPasswordRequired] = "badRequest",
	[loginErrorCodesModule.SecurityQuestions] = "securityQuestions"
}
local t_1 = {
	[statusCodes.TOO_MANY_REQUESTS] = "throttled",
	[statusCodes.REQUEST_TIMEOUT] = "timeout",
	[statusCodes.BAD_REQUEST] = "badRequest",
	[statusCodes.NOT_FOUND] = "notFound",
	[statusCodes.INTERNAL_SERVER_ERROR] = "serverError"
}

return function(p0) --[[ line: 25 | named "coarseLoginErrorBucket" ]]
	-- upvalues: t (ref), t_1 (ref)
	if typeof(p0) ~= "table" then
		return "unknown"
	end
	local errorCode = t[p0.errorCode]
	
	return errorCode or (if p0.HttpError == Enum.HttpError.OK then t_1[p0.StatusCode] or "unknown" else "unknown")
end
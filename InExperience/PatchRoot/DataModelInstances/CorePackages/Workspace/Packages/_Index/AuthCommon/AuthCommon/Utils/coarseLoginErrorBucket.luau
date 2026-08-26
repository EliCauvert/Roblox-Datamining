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

return function(p1)
	-- upvalues: t (ref), t_1 (ref)
	if typeof(p1) ~= "table" then
		return "unknown"
	end
	local errorCode = t[p1.errorCode]
	
	return errorCode or (if p1.HttpError == Enum.HttpError.OK then t_1[p1.StatusCode] or "unknown" else "unknown")
end
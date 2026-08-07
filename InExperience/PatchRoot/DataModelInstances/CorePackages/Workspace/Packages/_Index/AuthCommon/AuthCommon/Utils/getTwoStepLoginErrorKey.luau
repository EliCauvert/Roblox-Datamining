local twoStepErrorCodesModule = require(script:FindFirstAncestor("AuthCommon").Enums.TwoStepErrorCodes)

return function(p0) --[[ line: 9 | named "getTwoStepLoginErrorKey" ]]
	-- upvalues: twoStepErrorCodesModule (ref)
	return if p0 == twoStepErrorCodesModule.IllegalChildAccountLinking then "Authentication.Login.LinkIllegalChildAccountLinking" else "Authentication.Login.Response.SomethingWentWrong"
end
local twoStepErrorCodesModule = require(script:FindFirstAncestor("AuthCommon").Enums.TwoStepErrorCodes)

return function(p1)
	-- upvalues: twoStepErrorCodesModule (ref)
	return if p1 == twoStepErrorCodesModule.IllegalChildAccountLinking then "Authentication.Login.LinkIllegalChildAccountLinking" else "Authentication.Login.Response.SomethingWentWrong"
end
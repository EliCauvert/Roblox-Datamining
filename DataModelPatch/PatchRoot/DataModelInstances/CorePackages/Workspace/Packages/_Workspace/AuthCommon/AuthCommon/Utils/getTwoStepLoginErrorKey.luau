local TwoStepErrorCodesModule = require(script:FindFirstAncestor("AuthCommon").Enums.TwoStepErrorCodes)

return function(IllegalChildAccountLinking): string
	-- upvalues: TwoStepErrorCodesModule (copy)
	return if IllegalChildAccountLinking == TwoStepErrorCodesModule.IllegalChildAccountLinking then "Authentication.Login.LinkIllegalChildAccountLinking" else "Authentication.Login.Response.SomethingWentWrong"
end
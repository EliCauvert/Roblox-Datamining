local LoginErrorCodesModule = require(script:FindFirstAncestor("AuthCommon").Enums.LoginErrorCodes)
local IsNonTerminalLoginErrorModule = require(script.Parent.isNonTerminalLoginError)

return function(p1, p2)
	-- upvalues: LoginErrorCodesModule (copy), IsNonTerminalLoginErrorModule (copy)
	if typeof(p1) ~= "table" or p1.errorKey ~= nil then
		return p1
	elseif p1.errorCode == LoginErrorCodesModule.AccountLocked then
		return p1
	elseif IsNonTerminalLoginErrorModule(p1, p2) then
		return p1
	else
		p1.errorKey = "Authentication.Login.Response.SomethingWentWrong"
		
		return p1
	end
end
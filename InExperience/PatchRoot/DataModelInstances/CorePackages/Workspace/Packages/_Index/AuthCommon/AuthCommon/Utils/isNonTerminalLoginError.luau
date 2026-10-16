local LoginErrorCodesModule = require(script:FindFirstAncestor("AuthCommon").Enums.LoginErrorCodes)

return function(p1, p2): boolean --[[ Line: 28 | Named "isNonTerminalLoginError" ]]
	-- upvalues: LoginErrorCodesModule (copy)
	if typeof(p1) == "table" then
		local P1 = p2 or {}
		local ErrorCode = p1.errorCode
		
		return ErrorCode == LoginErrorCodesModule.Captcha or (if ErrorCode == LoginErrorCodesModule.SecurityQuestions then P1.securityQuestionsEnabled ~= false and (p1.securityQuestionsData ~= nil and p1.securityQuestionsCallback ~= nil) elseif ErrorCode == LoginErrorCodesModule.MultipleUsersPerCredential then P1.accountSelectorEnabled ~= false and p1.usersData ~= nil and (not P1.accountSelectorRequiresCredentials or P1.credentialValue ~= nil and P1.password ~= nil) else (ErrorCode == LoginErrorCodesModule.EmptyAccountSwitchBlobRequired or ErrorCode == LoginErrorCodesModule.ParentEmptyAccountSwitchBlobRequired) and P1.accountSwitchEnabled == true)
	else
		return false
	end
end
local loginErrorCodesModule = require(script:FindFirstAncestor("AuthCommon").Enums.LoginErrorCodes)

return function(a, b)
	-- upvalues: loginErrorCodesModule (ref)
	if typeof(a) ~= "table" then
		return false
	end
	local b_1 = b or {}
	local errorCode = a.errorCode
	
	return errorCode == loginErrorCodesModule.Captcha or (if errorCode == loginErrorCodesModule.SecurityQuestions then b_1.securityQuestionsEnabled ~= false and (a.securityQuestionsData ~= nil and a.securityQuestionsCallback ~= nil) elseif errorCode == loginErrorCodesModule.MultipleUsersPerCredential then if b_1.accountSelectorEnabled == false or a.usersData == nil then false elseif b_1.accountSelectorRequiresCredentials then b_1.credentialValue ~= nil and b_1.password ~= nil else true else (errorCode == loginErrorCodesModule.EmptyAccountSwitchBlobRequired or errorCode == loginErrorCodesModule.ParentEmptyAccountSwitchBlobRequired) and b_1.accountSwitchEnabled == true)
end
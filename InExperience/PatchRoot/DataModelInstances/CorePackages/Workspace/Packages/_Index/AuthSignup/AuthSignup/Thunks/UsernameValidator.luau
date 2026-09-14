local authSignup = script:FindFirstAncestor("AuthSignup")
local parent = authSignup.Parent
local authCommonModule = require(parent.AuthCommon)
local cryoModule = require(parent.Cryo)
local argCheckModule = require(parent.ArgCheck)
local promiseModule = require(parent.Promise)
local usernameIssue = authCommonModule.Enums.UsernameIssue
local issueCondition = authCommonModule.Enums.IssueCondition
local postUsernameValid = authCommonModule.Http.Requests.PostUsernameValid
local sharedFlagsModule = require(parent.SharedFlags)
local localSignUpUsernameValidatorModule = require(authSignup.Util.LocalSignUpUsernameValidator)
local fFlagAllowCurrentUsernameOnSignup = sharedFlagsModule.FFlagAllowCurrentUsernameOnSignup
local getFFlagFixUsernameValidationAlreadyInUse = sharedFlagsModule.GetFFlagFixUsernameValidationAlreadyInUse
local getFFlagFixUsernameValidationBackendCriteria = sharedFlagsModule.GetFFlagFixUsernameValidationBackendCriteria
local t = {
	[0] = usernameIssue.None,
	[1] = usernameIssue.AlreadyInUse,
	[2] = usernameIssue.Inappropriate,
	[3] = usernameIssue.LengthTooShortOrTooLong,
	[4] = usernameIssue.BoundingUnderscore,
	[5] = usernameIssue.MultipleUnderscores,
	[6] = usernameIssue.ContainsSpaces,
	[7] = usernameIssue.ContainsInvalidCharacter,
	[10] = usernameIssue.ContainsPII
}
local t_1 = {
	[usernameIssue.ContainsInvalidCharacter] = "Authentication.SignUp.Label.UsernameError1",
	[usernameIssue.LengthTooShortOrTooLong] = "Authentication.SignUp.Label.UsernameError2",
	[usernameIssue.AlreadyInUse] = "Authentication.SignUp.Label.UsernameError3",
	[usernameIssue.Inappropriate] = "Authentication.SignUp.Label.UsernameError4",
	[usernameIssue.BoundingUnderscore] = "Authentication.SignUp.Label.UsernameError5",
	[usernameIssue.MultipleUnderscores] = "Authentication.SignUp.Label.UsernameError6",
	[usernameIssue.ContainsPII] = "Authentication.SignUp.Label.UsernameError7"
}

local function getIssueMessageList()
	-- upvalues: t_1 (ref)
	return t_1
end

local function getDefaultIssues()
	-- upvalues: t_1 (ref), usernameIssue (ref), issueCondition (ref)
	local t = {}
	
	for i in pairs(t_1) do
		if i == usernameIssue.ContainsInvalidCharacter or i == usernameIssue.LengthTooShortOrTooLong or i == usernameIssue.AlreadyInUse then
			t[i] = issueCondition.Problematic
		else
			t[i] = issueCondition.Hidden
		end
	end
	return t
end

local function resetNonHiddenIssuesToProblematic(value)
	-- upvalues: cryoModule (ref), issueCondition (ref)
	local var1 = cryoModule.Dictionary.join(value)
	
	for i, v in pairs(var1) do
		if v ~= issueCondition.Hidden then
			var1[i] = issueCondition.Problematic
		end
	end
	return var1
end

local function _(p1, p2, p3, p4, p5)
	-- upvalues: argCheckModule (ref), promiseModule (ref), resetNonHiddenIssuesToProblematic (ref), cryoModule (ref), localSignUpUsernameValidatorModule (ref), issueCondition (ref), getFFlagFixUsernameValidationBackendCriteria (ref), getFFlagFixUsernameValidationAlreadyInUse (ref), postUsernameValid (ref), t (ref), usernameIssue (ref)
	return function(_)
		-- upvalues: argCheckModule (copy), p2 (ref), p3 (ref), p4 (ref), promiseModule (copy), resetNonHiddenIssuesToProblematic (copy), cryoModule (copy), localSignUpUsernameValidatorModule (copy), issueCondition (copy), getFFlagFixUsernameValidationBackendCriteria (copy), getFFlagFixUsernameValidationAlreadyInUse (copy), postUsernameValid (copy), p1 (ref), p5 (ref), t (copy), usernameIssue (copy)
		argCheckModule.isType(p2, "string", "username passed into UsernameValidator.validateFunction")
		argCheckModule.isType(p3, "string", "birthday passed into UsernameValidator.validateFunction")
		argCheckModule.isType(p4, "table", "previousIssues passed into UsernameValidator.validateFunction")
		
		if p2 == "" then
			return promiseModule.resolve({
				InputValid = false,
				Input = p2,
				IssueCondition = resetNonHiddenIssuesToProblematic(p4)
			})
		end
		local var2 = cryoModule.Dictionary.join(p4)
		local var3 = localSignUpUsernameValidatorModule:locallyValidateUsername(p2)
		local var4 = false
		
		for i, v in pairs(var3) do
			if v then
				var4 = true
				break
			end
		end
		if var4 then
			for i_1, v in pairs(p4) do
				local var5 = var3[i_1]
				
				if v == issueCondition.Hidden and var5 then
					var2[i_1] = issueCondition.Problematic
				elseif v ~= issueCondition.Hidden then
					if getFFlagFixUsernameValidationBackendCriteria() and var5 == nil then
						var2[i_1] = issueCondition.Hidden
					elseif not getFFlagFixUsernameValidationAlreadyInUse() or var5 ~= nil then
						var2[i_1] = if var5 == false then issueCondition.Resolved else issueCondition.Problematic
					end
				end
			end
			return promiseModule.resolve({ InputValid = false, Input = p2, IssueCondition = var2 })
		else
			for i_1, v in pairs(var2) do
				var2[i_1] = if v == issueCondition.Hidden then issueCondition.Hidden else issueCondition.Resolved
			end
			return postUsernameValid(p1, p2, p3, p5):andThen(function(p6)
				-- upvalues: t (copy), usernameIssue (copy), var2 (ref), issueCondition (copy), promiseModule (copy), p2 (copy)
				local code = p6 and (p6.responseBody and p6.responseBody.code)
				local var6 = t[code]
				
				if not var6 then
					warn("UsernameValidator.validateFunction() Received unrecognized response code: ", code)
				elseif var6 == usernameIssue.ContainsSpaces then
					var2[usernameIssue.ContainsInvalidCharacter] = issueCondition.Problematic
				elseif var6 ~= usernameIssue.None then
					var2[var6] = issueCondition.Problematic
				end
				return promiseModule.resolve({
					Input = p2,
					InputValid = var6 == usernameIssue.None,
					IssueCondition = var2
				})
			end, function(_)
				-- upvalues: promiseModule (copy), p2 (copy), var2 (ref)
				return promiseModule.resolve({ InputValid = true, Input = p2, IssueCondition = var2 })
			end)
		end
	end
end

local _ = function(p6, p7)
	return p7 ~= nil and (p7 ~= "" and string.lower(p6) == string.lower(p7))
end

local function resolveAlreadyInUseIfKeptCurrentUsername(p6)
	-- upvalues: usernameIssue (ref), issueCondition (ref), cryoModule (ref)
	if p6.IssueCondition[usernameIssue.AlreadyInUse] ~= issueCondition.Problematic then
		return p6
	end
	local var6 = cryoModule.Dictionary.join(p6.IssueCondition)
	var6[usernameIssue.AlreadyInUse] = issueCondition.Resolved
	local var7 = true
	
	for i, v in pairs(var6) do
		if v == issueCondition.Problematic then
			var7 = false
			break
		end
	end
	return cryoModule.Dictionary.join(p6, { InputValid = var7, IssueCondition = var6 })
end

return {
	validateFunction = function(p7, p8, p9, p10)
		-- upvalues: argCheckModule (ref), promiseModule (ref), resetNonHiddenIssuesToProblematic (ref), cryoModule (ref), localSignUpUsernameValidatorModule (ref), issueCondition (ref), getFFlagFixUsernameValidationBackendCriteria (ref), getFFlagFixUsernameValidationAlreadyInUse (ref), postUsernameValid (ref), t (ref), usernameIssue (ref), fFlagAllowCurrentUsernameOnSignup (ref), resolveAlreadyInUseIfKeptCurrentUsername (ref)
		p10 = p10 or {}
		p10 = p10.birthday
		local context = p10.context
		
		local var8 = function(_)
			-- upvalues: argCheckModule (copy), p8 (ref), p10 (ref), p9 (ref), promiseModule (copy), resetNonHiddenIssuesToProblematic (copy), cryoModule (copy), localSignUpUsernameValidatorModule (copy), issueCondition (copy), getFFlagFixUsernameValidationBackendCriteria (copy), getFFlagFixUsernameValidationAlreadyInUse (copy), postUsernameValid (copy), p7 (ref), context (ref), t (copy), usernameIssue (copy)
			argCheckModule.isType(p8, "string", "username passed into UsernameValidator.validateFunction")
			argCheckModule.isType(p10, "string", "birthday passed into UsernameValidator.validateFunction")
			argCheckModule.isType(p9, "table", "previousIssues passed into UsernameValidator.validateFunction")
			
			if p8 == "" then
				return promiseModule.resolve({
					InputValid = false,
					Input = p8,
					IssueCondition = resetNonHiddenIssuesToProblematic(p9)
				})
			end
			local var9 = cryoModule.Dictionary.join(p9)
			local var10 = localSignUpUsernameValidatorModule:locallyValidateUsername(p8)
			local var11 = false
			
			for i, v in pairs(var10) do
				if v then
					var11 = true
					break
				end
			end
			for i_1, v in pairs(var9) do
				var9[i_1] = if v == issueCondition.Hidden then issueCondition.Hidden else issueCondition.Resolved
			end
			return postUsernameValid(p7, p8, p10, context):andThen(function(p11)
				-- upvalues: t (copy), usernameIssue (copy), var9 (ref), issueCondition (copy), promiseModule (copy), p8 (copy)
				local code = p11 and (p11.responseBody and p11.responseBody.code)
				local var12 = t[code]
				
				if not var12 then
					warn("UsernameValidator.validateFunction() Received unrecognized response code: ", code)
				elseif var12 == usernameIssue.ContainsSpaces then
					var9[usernameIssue.ContainsInvalidCharacter] = issueCondition.Problematic
				elseif var12 ~= usernameIssue.None then
					var9[var12] = issueCondition.Problematic
				end
				return promiseModule.resolve({
					Input = p8,
					InputValid = var12 == usernameIssue.None,
					IssueCondition = var9
				})
			end, function(_)
				-- upvalues: promiseModule (copy), p8 (copy), var9 (ref)
				return promiseModule.resolve({ InputValid = true, Input = p8, IssueCondition = var9 })
			end)
		end
		
		if fFlagAllowCurrentUsernameOnSignup then
			local currentUsername = p10.currentUsername
			
			return if currentUsername ~= nil and (currentUsername ~= "" and string.lower(p8) == string.lower(currentUsername)) then function(p11)
				-- upvalues: var8 (ref), resolveAlreadyInUseIfKeptCurrentUsername (copy)
				return var8(p11):andThen(resolveAlreadyInUseIfKeptCurrentUsername)
			end else var8
		end
	end,
	getIssueMessageList = getIssueMessageList,
	getDefaultIssues = getDefaultIssues
}
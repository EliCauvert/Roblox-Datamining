local AuthSignup = script:FindFirstAncestor("AuthSignup")
local Parent = AuthSignup.Parent
local AuthCommonModule = require(Parent.AuthCommon)
local CryoModule = require(Parent.Cryo)
local ArgCheckModule = require(Parent.ArgCheck)
local PromiseModule = require(Parent.Promise)
local UsernameIssue = AuthCommonModule.Enums.UsernameIssue
local IssueCondition = AuthCommonModule.Enums.IssueCondition
local PostUsernameValidFunction = AuthCommonModule.Http.Requests.PostUsernameValid
local SharedFlagsModule = require(Parent.SharedFlags)
local LocalSignUpUsernameValidatorModule = require(AuthSignup.Util.LocalSignUpUsernameValidator)
local FFlagAllowCurrentUsernameOnSignup = SharedFlagsModule.FFlagAllowCurrentUsernameOnSignup
local GetFFlagFixUsernameValidationAlreadyInUseFunction = SharedFlagsModule.GetFFlagFixUsernameValidationAlreadyInUse
local GetFFlagFixUsernameValidationBackendCriteriaFunction = SharedFlagsModule.GetFFlagFixUsernameValidationBackendCriteria
local config = {
	[0] = UsernameIssue.None,
	[1] = UsernameIssue.AlreadyInUse,
	[2] = UsernameIssue.Inappropriate,
	[3] = UsernameIssue.LengthTooShortOrTooLong,
	[4] = UsernameIssue.BoundingUnderscore,
	[5] = UsernameIssue.MultipleUnderscores,
	[6] = UsernameIssue.ContainsSpaces,
	[7] = UsernameIssue.ContainsInvalidCharacter,
	[10] = UsernameIssue.ContainsPII
}
local config1 = {
	[UsernameIssue.ContainsInvalidCharacter] = "Authentication.SignUp.Label.UsernameError1",
	[UsernameIssue.LengthTooShortOrTooLong] = "Authentication.SignUp.Label.UsernameError2",
	[UsernameIssue.AlreadyInUse] = "Authentication.SignUp.Label.UsernameError3",
	[UsernameIssue.Inappropriate] = "Authentication.SignUp.Label.UsernameError4",
	[UsernameIssue.BoundingUnderscore] = "Authentication.SignUp.Label.UsernameError5",
	[UsernameIssue.MultipleUnderscores] = "Authentication.SignUp.Label.UsernameError6",
	[UsernameIssue.ContainsPII] = "Authentication.SignUp.Label.UsernameError7"
}

local function resetNonHiddenIssuesToProblematic(Hiddens)
	-- upvalues: CryoModule (copy), IssueCondition (copy)
	local JoinResult = CryoModule.Dictionary.join(Hiddens)
	
	for i, value in pairs(JoinResult) do
		if value ~= IssueCondition.Hidden then
			JoinResult[i] = IssueCondition.Problematic
		end
	end
	return JoinResult
end

local function _(p1, Input, p2, p3, p4)
	-- upvalues: ArgCheckModule (copy), PromiseModule (copy), resetNonHiddenIssuesToProblematic (copy), CryoModule (copy), LocalSignUpUsernameValidatorModule (copy), IssueCondition (copy), GetFFlagFixUsernameValidationBackendCriteriaFunction (copy), GetFFlagFixUsernameValidationAlreadyInUseFunction (copy), PostUsernameValidFunction (copy), config (copy), UsernameIssue (copy)
	return function(_)
		-- upvalues: ArgCheckModule (upval), Input (copy), p2 (copy), p3 (copy), PromiseModule (upval), resetNonHiddenIssuesToProblematic (upval), CryoModule (upval), LocalSignUpUsernameValidatorModule (upval), IssueCondition (upval), GetFFlagFixUsernameValidationBackendCriteriaFunction (upval), GetFFlagFixUsernameValidationAlreadyInUseFunction (upval), PostUsernameValidFunction (upval), p1 (copy), p4 (copy), config (upval), UsernameIssue (upval)
		ArgCheckModule.isType(Input, "string", "username passed into UsernameValidator.validateFunction")
		ArgCheckModule.isType(p2, "string", "birthday passed into UsernameValidator.validateFunction")
		ArgCheckModule.isType(p3, "table", "previousIssues passed into UsernameValidator.validateFunction")
		
		if Input == "" then
			return PromiseModule.resolve({
				InputValid = false,
				Input = Input,
				IssueCondition = resetNonHiddenIssuesToProblematic(p3)
			})
		end
		local JoinResult = CryoModule.Dictionary.join(p3)
		local LocallyValidateUsernameResult = LocalSignUpUsernameValidatorModule:locallyValidateUsername(Input)
		local Flag = false
		
		for _, value in pairs(LocallyValidateUsernameResult) do
			if value then
				Flag = true
				break
			end
		end
		if Flag then
			for i, Hidden in pairs(p3) do
				local LocallyValidateUsernameResultEntry = LocallyValidateUsernameResult[i]
				
				if Hidden == IssueCondition.Hidden and LocallyValidateUsernameResultEntry then
					JoinResult[i] = IssueCondition.Problematic
				elseif Hidden ~= IssueCondition.Hidden then
					if GetFFlagFixUsernameValidationBackendCriteriaFunction() and LocallyValidateUsernameResultEntry == nil then
						JoinResult[i] = IssueCondition.Hidden
					elseif not GetFFlagFixUsernameValidationAlreadyInUseFunction() or LocallyValidateUsernameResultEntry ~= nil then
						JoinResult[i] = LocallyValidateUsernameResultEntry == false and IssueCondition.Resolved or IssueCondition.Problematic
					end
				end
			end
			return PromiseModule.resolve({
				InputValid = false,
				Input = Input,
				IssueCondition = JoinResult
			})
		else
			for i1, value1 in pairs(JoinResult) do
				JoinResult[i1] = value1 == IssueCondition.Hidden and IssueCondition.Hidden or IssueCondition.Resolved
			end
			return PostUsernameValidFunction(p1, Input, p2, p4):andThen(function(Result)
				-- upvalues: config (upval), UsernameIssue (upval), JoinResult (copy), IssueCondition (upval), PromiseModule (upval), Input (upval)
				local Code = Result and (Result.responseBody and Result.responseBody.code)
				local None = config[Code]
				
				if None then
					if None == UsernameIssue.ContainsSpaces then
						JoinResult[UsernameIssue.ContainsInvalidCharacter] = IssueCondition.Problematic
					elseif None ~= UsernameIssue.None then
						JoinResult[None] = IssueCondition.Problematic
					end
				else
					warn("UsernameValidator.validateFunction() Received unrecognized response code: ", Code)
				end
				return PromiseModule.resolve({
					Input = Input,
					InputValid = None == UsernameIssue.None,
					IssueCondition = JoinResult
				})
			end, function(_)
				-- upvalues: PromiseModule (upval), Input (upval), JoinResult (copy)
				return PromiseModule.resolve({
					InputValid = true,
					Input = Input,
					IssueCondition = JoinResult
				})
			end)
		end
	end
end

local _ = function(Text: string, Text1: string): boolean
	return Text1 ~= nil and (Text1 ~= "" and string.lower(Text) == string.lower(Text1))
end

local function resolveAlreadyInUseIfKeptCurrentUsername(Result)
	-- upvalues: UsernameIssue (copy), IssueCondition (copy), CryoModule (copy)
	if Result.IssueCondition[UsernameIssue.AlreadyInUse] ~= IssueCondition.Problematic then
		return Result
	end
	local JoinResult = CryoModule.Dictionary.join(Result.IssueCondition)
	JoinResult[UsernameIssue.AlreadyInUse] = IssueCondition.Resolved
	local InputValid = true
	
	for _, value in pairs(JoinResult) do
		if value == IssueCondition.Problematic then
			InputValid = false
			break
		end
	end
	return CryoModule.Dictionary.join(Result, { InputValid = InputValid, IssueCondition = JoinResult })
end

return {
	validateFunction = function(p5, Text: string, Hiddens, p6)
		-- upvalues: ArgCheckModule (copy), PromiseModule (copy), resetNonHiddenIssuesToProblematic (copy), CryoModule (copy), LocalSignUpUsernameValidatorModule (copy), IssueCondition (copy), GetFFlagFixUsernameValidationBackendCriteriaFunction (copy), GetFFlagFixUsernameValidationAlreadyInUseFunction (copy), PostUsernameValidFunction (copy), config (copy), UsernameIssue (copy), FFlagAllowCurrentUsernameOnSignup (copy), resolveAlreadyInUseIfKeptCurrentUsername (copy)
		local P12 = p6 or {}
		local Birthday = P12.birthday
		local Context = P12.context
		
		local function v30(_)
			-- upvalues: ArgCheckModule (upval), Text (copy), Birthday (copy), Hiddens (copy), PromiseModule (upval), resetNonHiddenIssuesToProblematic (upval), CryoModule (upval), LocalSignUpUsernameValidatorModule (upval), IssueCondition (upval), GetFFlagFixUsernameValidationBackendCriteriaFunction (upval), GetFFlagFixUsernameValidationAlreadyInUseFunction (upval), PostUsernameValidFunction (upval), p5 (copy), Context (copy), config (upval), UsernameIssue (upval)
			ArgCheckModule.isType(Text, "string", "username passed into UsernameValidator.validateFunction")
			ArgCheckModule.isType(Birthday, "string", "birthday passed into UsernameValidator.validateFunction")
			ArgCheckModule.isType(Hiddens, "table", "previousIssues passed into UsernameValidator.validateFunction")
			
			if Text == "" then
				return PromiseModule.resolve({
					InputValid = false,
					Input = Text,
					IssueCondition = resetNonHiddenIssuesToProblematic(Hiddens)
				})
			end
			local JoinResult = CryoModule.Dictionary.join(Hiddens)
			local LocallyValidateUsernameResult = LocalSignUpUsernameValidatorModule:locallyValidateUsername(Text)
			local Flag = false
			
			for _, value in pairs(LocallyValidateUsernameResult) do
				if value then
					Flag = true
					break
				end
			end
			if Flag then
				for i, Hidden in pairs(Hiddens) do
					local LocallyValidateUsernameResultEntry = LocallyValidateUsernameResult[i]
					
					if Hidden == IssueCondition.Hidden and LocallyValidateUsernameResultEntry then
						JoinResult[i] = IssueCondition.Problematic
					elseif Hidden ~= IssueCondition.Hidden then
						if GetFFlagFixUsernameValidationBackendCriteriaFunction() and LocallyValidateUsernameResultEntry == nil then
							JoinResult[i] = IssueCondition.Hidden
						elseif not GetFFlagFixUsernameValidationAlreadyInUseFunction() or LocallyValidateUsernameResultEntry ~= nil then
							JoinResult[i] = LocallyValidateUsernameResultEntry == false and IssueCondition.Resolved or IssueCondition.Problematic
						end
					end
				end
				return PromiseModule.resolve({
					InputValid = false,
					Input = Text,
					IssueCondition = JoinResult
				})
			else
				for i1, value1 in pairs(JoinResult) do
					JoinResult[i1] = value1 == IssueCondition.Hidden and IssueCondition.Hidden or IssueCondition.Resolved
				end
				return PostUsernameValidFunction(p5, Text, Birthday, Context):andThen(function(Result)
					-- upvalues: config (upval), UsernameIssue (upval), JoinResult (copy), IssueCondition (upval), PromiseModule (upval), Text (upval)
					local Code = Result and (Result.responseBody and Result.responseBody.code)
					local None = config[Code]
					
					if None then
						if None == UsernameIssue.ContainsSpaces then
							JoinResult[UsernameIssue.ContainsInvalidCharacter] = IssueCondition.Problematic
						elseif None ~= UsernameIssue.None then
							JoinResult[None] = IssueCondition.Problematic
						end
					else
						warn("UsernameValidator.validateFunction() Received unrecognized response code: ", Code)
					end
					return PromiseModule.resolve({
						Input = Text,
						InputValid = None == UsernameIssue.None,
						IssueCondition = JoinResult
					})
				end, function(_)
					-- upvalues: PromiseModule (upval), Text (upval), JoinResult (copy)
					return PromiseModule.resolve({
						InputValid = true,
						Input = Text,
						IssueCondition = JoinResult
					})
				end)
			end
		end
		
		if FFlagAllowCurrentUsernameOnSignup then
			local CurrentUsername: string = P12.currentUsername
			
			if CurrentUsername ~= nil and (CurrentUsername ~= "" and string.lower(Text) == string.lower(CurrentUsername)) then
				return function(p7)
					-- upvalues: v30 (copy), resolveAlreadyInUseIfKeptCurrentUsername (upval)
					return v30(p7):andThen(resolveAlreadyInUseIfKeptCurrentUsername)
				end
			end
		end
		return v30
	end,
	getIssueMessageList = function()
		-- upvalues: config1 (copy)
		return config1
	end,
	getDefaultIssues = function()
		-- upvalues: config1 (copy), UsernameIssue (copy), IssueCondition (copy)
		local Hiddens = {}
		
		for i in pairs(config1) do
			if i == UsernameIssue.ContainsInvalidCharacter or i == UsernameIssue.LengthTooShortOrTooLong or i == UsernameIssue.AlreadyInUse then
				Hiddens[i] = IssueCondition.Problematic
			else
				Hiddens[i] = IssueCondition.Hidden
			end
		end
		return Hiddens
	end
}
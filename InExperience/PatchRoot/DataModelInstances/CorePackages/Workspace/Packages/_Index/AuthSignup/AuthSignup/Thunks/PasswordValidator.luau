local Parent = script:FindFirstAncestor("AuthSignup").Parent
local AuthCommonModule = require(Parent.AuthCommon)
local PostPasswordValidFunction = AuthCommonModule.Http.Requests.PostPasswordValid
local PromiseModule = require(Parent.Promise)
local PasswordIssue = AuthCommonModule.Enums.PasswordIssue
local IssueCondition = AuthCommonModule.Enums.IssueCondition
local SharedFlagsModule = require(Parent.SharedFlags)
local GetFFlagPasswordErrorLengthFunction = SharedFlagsModule.GetFFlagPasswordErrorLength
local Config = if SharedFlagsModule.FFlagSignUpPasswordCopyV2 then {
	[PasswordIssue.Length] = "Authentication.SignUp.Label.PasswordPlaceholder",
	[PasswordIssue.UsernameMatch] = "Authentication.SignUp.Label.PasswordError2.V2",
	[PasswordIssue.Simple] = "Authentication.SignUp.Label.PasswordError3.V2"
} else {
	[PasswordIssue.Length] = if GetFFlagPasswordErrorLengthFunction() then "Authentication.SignUp.PasswordErrorLength" else "Authentication.SignUp.Label.PasswordError1",
	[PasswordIssue.UsernameMatch] = "Authentication.SignUp.Label.PasswordError2",
	[PasswordIssue.Simple] = "Authentication.SignUp.Label.PasswordError3"
}

local function _(p1, p2, Input, p3) --[[ Line: 42 | Named "validateFunction" ]]
	-- upvalues: PasswordIssue (copy), IssueCondition (copy), PromiseModule (copy), PostPasswordValidFunction (copy)
	return function(_) --[[ Line: 43 ]]
		-- upvalues: PasswordIssue (upval), IssueCondition (upval), p3 (copy), p2 (copy), Input (copy), PromiseModule (upval), PostPasswordValidFunction (upval), p1 (copy)
		local IssueCondition = {
			[PasswordIssue.Length] = IssueCondition.Resolved,
			[PasswordIssue.UsernameMatch] = IssueCondition.Resolved,
			[PasswordIssue.Simple] = if p3[PasswordIssue.Simple] == IssueCondition.Hidden then IssueCondition.Hidden else IssueCondition.Resolved or IssueCondition.Hidden
		}
		
		if p2 ~= nil and Input ~= nil and p2 ~= "" and Input ~= "" and string.match(Input, "%S") ~= nil then
			return PostPasswordValidFunction(p1, p2, Input):andThen(function(Result) --[[ Line: 72 ]]
				-- upvalues: IssueCondition (copy), PasswordIssue (upval), IssueCondition (upval), Input (upval), PromiseModule (upval)
				local t = {}
				local Code = Result and (Result.responseBody and Result.responseBody.code)
				
				if type(Code) == "number" then
					if Code == 2 then
						IssueCondition[PasswordIssue.Length] = IssueCondition.Problematic
					elseif Code == 3 then
						IssueCondition[PasswordIssue.UsernameMatch] = IssueCondition.Problematic
					elseif Code == 4 or Code == 5 then
						IssueCondition[PasswordIssue.Simple] = IssueCondition.Problematic
					end
				else
					warn("JSON failure")
				end
				t.Input = Input
				t.InputValid = Code == 0
				t.IssueCondition = IssueCondition
				
				return PromiseModule.resolve(t)
			end, function(_) --[[ Line: 94 ]]
				-- upvalues: PromiseModule (upval), Input (upval), IssueCondition (copy)
				return PromiseModule.resolve({
					InputValid = true,
					Input = Input,
					IssueCondition = IssueCondition
				})
			end)
		end
		for i in pairs(IssueCondition) do
			if IssueCondition[i] == IssueCondition.Resolved then
				IssueCondition[i] = IssueCondition.Problematic
			end
		end
		return PromiseModule.resolve({
			InputValid = false,
			Input = Input,
			IssueCondition = IssueCondition
		})
	end
end

return {
	validateFunction = function(p4, Text, p5, p6) --[[ Line: 105 ]]
		-- upvalues: PasswordIssue (copy), IssueCondition (copy), PromiseModule (copy), PostPasswordValidFunction (copy)
		local Username = (p6 or {}).username
		
		return function(_) --[[ Line: 43 ]]
			-- upvalues: PasswordIssue (upval), IssueCondition (upval), p5 (copy), Username (copy), Text (copy), PromiseModule (upval), PostPasswordValidFunction (upval), p4 (copy)
			local IssueCondition = {
				[PasswordIssue.Length] = IssueCondition.Resolved,
				[PasswordIssue.UsernameMatch] = IssueCondition.Resolved,
				[PasswordIssue.Simple] = if p5[PasswordIssue.Simple] == IssueCondition.Hidden then IssueCondition.Hidden else IssueCondition.Resolved or IssueCondition.Hidden
			}
			
			if Username ~= nil and Text ~= nil and Username ~= "" and Text ~= "" and string.match(Text, "%S") ~= nil then
				return PostPasswordValidFunction(p4, Username, Text):andThen(function(Result) --[[ Line: 72 ]]
					-- upvalues: IssueCondition (copy), PasswordIssue (upval), IssueCondition (upval), Text (upval), PromiseModule (upval)
					local t = {}
					local Code = Result and (Result.responseBody and Result.responseBody.code)
					
					if type(Code) == "number" then
						if Code == 2 then
							IssueCondition[PasswordIssue.Length] = IssueCondition.Problematic
						elseif Code == 3 then
							IssueCondition[PasswordIssue.UsernameMatch] = IssueCondition.Problematic
						elseif Code == 4 or Code == 5 then
							IssueCondition[PasswordIssue.Simple] = IssueCondition.Problematic
						end
					else
						warn("JSON failure")
					end
					t.Input = Text
					t.InputValid = Code == 0
					t.IssueCondition = IssueCondition
					
					return PromiseModule.resolve(t)
				end, function(_) --[[ Line: 94 ]]
					-- upvalues: PromiseModule (upval), Text (upval), IssueCondition (copy)
					return PromiseModule.resolve({
						InputValid = true,
						Input = Text,
						IssueCondition = IssueCondition
					})
				end)
			end
			for i in pairs(IssueCondition) do
				if IssueCondition[i] == IssueCondition.Resolved then
					IssueCondition[i] = IssueCondition.Problematic
				end
			end
			return PromiseModule.resolve({
				InputValid = false,
				Input = Text,
				IssueCondition = IssueCondition
			})
		end
	end,
	getIssueMessageList = function() --[[ Line: 28 ]]
		-- upvalues: Config (copy)
		return Config
	end,
	getDefaultIssues = function() --[[ Line: 32 ]]
		-- upvalues: Config (copy), IssueCondition (copy)
		local Problematics = {}
		
		for i in pairs(Config) do
			Problematics[i] = IssueCondition.Problematic
		end
		return Problematics
	end
}
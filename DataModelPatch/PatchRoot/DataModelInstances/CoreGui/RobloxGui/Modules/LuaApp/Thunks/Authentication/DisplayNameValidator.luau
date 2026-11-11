local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local HttpService = game:GetService("HttpService")
local CryoModule = require(CorePackages.Packages.Cryo)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local PromiseModule = require(Modules.LuaApp.Promise)
local ReportEphemeralCounterModule = require(Modules.LuaApp.Analytics.Events.reportEphemeralCounter)
local GetDisplayNamesValidModule = require(Modules.LuaApp.Http.Requests.GetDisplayNamesValid)
local UsernameIssue = require(CorePackages.Workspace.Packages.AuthCommon).Enums.UsernameIssue
local IssueCondition = require(CorePackages.Workspace.Packages.AuthCommon).Enums.IssueCondition
local LocalSignUpDisplayNameValidator = require(CorePackages.Workspace.Packages.AuthSignup).Util.LocalSignUpDisplayNameValidator
local config = {
	[0] = UsernameIssue.None,
	[1] = UsernameIssue.LengthTooShortOrTooLong,
	[2] = UsernameIssue.LengthTooShortOrTooLong,
	[3] = UsernameIssue.ContainsInvalidCharacter,
	[4] = UsernameIssue.Inappropriate
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

return {
	validateFunction = function(p1, Input, Hiddens, p2)
		-- upvalues: ArgCheckModule (copy), PromiseModule (copy), resetNonHiddenIssuesToProblematic (copy), CryoModule (copy), LocalSignUpDisplayNameValidator (copy), IssueCondition (copy), GetDisplayNamesValidModule (copy), HttpService (copy), config (copy), ReportEphemeralCounterModule (copy)
		return function(_)
			-- upvalues: ArgCheckModule (upval), Input (copy), Hiddens (copy), PromiseModule (upval), resetNonHiddenIssuesToProblematic (upval), CryoModule (upval), LocalSignUpDisplayNameValidator (upval), IssueCondition (upval), p2 (copy), GetDisplayNamesValidModule (upval), p1 (copy), HttpService (upval), config (upval), ReportEphemeralCounterModule (upval)
			ArgCheckModule.isType(Input, "string", "displayName passed into DisplayNameValidator.validateFunction")
			ArgCheckModule.isType(Hiddens, "table", "previousIssues passed into DisplayNameValidator.validateFunction")
			
			if Input == "" then
				return PromiseModule.resolve({
					InputValid = false,
					Input = Input,
					IssueCondition = resetNonHiddenIssuesToProblematic(Hiddens)
				})
			end
			local JoinResult = CryoModule.Dictionary.join(Hiddens)
			local LocallyValidateDisplayNameResult = LocalSignUpDisplayNameValidator:locallyValidateDisplayName(Input)
			local Flag = false
			
			for _, value in pairs(LocallyValidateDisplayNameResult) do
				if value then
					Flag = true
					break
				end
			end
			if Flag then
				for i, hidden in pairs(Hiddens) do
					local LocallyValidateDisplayNameResultEntry = LocallyValidateDisplayNameResult[i]
					
					if hidden == IssueCondition.Hidden and LocallyValidateDisplayNameResultEntry then
						JoinResult[i] = IssueCondition.Problematic
					elseif hidden ~= IssueCondition.Hidden then
						JoinResult[i] = LocallyValidateDisplayNameResultEntry == false and IssueCondition.Resolved or IssueCondition.Problematic
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
				return GetDisplayNamesValidModule(p1, Input, p2.birthday):andThen(function(_)
					-- upvalues: PromiseModule (upval), Input (upval), JoinResult (copy)
					return PromiseModule.resolve({
						InputValid = true,
						Input = Input,
						IssueCondition = JoinResult
					})
				end, function(p3)
					-- upvalues: HttpService (upval), config (upval), JoinResult (copy), IssueCondition (upval), PromiseModule (upval), Input (upval), ReportEphemeralCounterModule (upval)
					local Data = HttpService:JSONDecode(p3.Body)
					local v1 = nil
					
					for _, value in pairs(Data and Data.errors or {}) do
						if value.code then
							v1 = config[value.code]
							break
						end
					end
					if v1 then
						JoinResult[v1] = IssueCondition.Problematic
						
						return PromiseModule.resolve({
							InputValid = false,
							Input = Input,
							IssueCondition = JoinResult
						})
					else
						ReportEphemeralCounterModule("DisplayNameValidator_GetDisplayNamesValid_Failed", 1)
						
						return PromiseModule.resolve({
							InputValid = true,
							Input = Input,
							IssueCondition = JoinResult
						})
					end
				end)
			end
		end
	end,
	getIssueMessageList = function()
		-- upvalues: config1 (copy)
		return config1
	end,
	getDefaultIssues = function()
		-- upvalues: config1 (copy), IssueCondition (copy)
		local Hiddens = {}
		
		for i in pairs(config1) do
			Hiddens[i] = IssueCondition.Hidden
		end
		return Hiddens
	end
}
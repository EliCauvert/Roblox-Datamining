local AccountRecovery = script:FindFirstAncestor("AccountRecovery")
local Parent = AccountRecovery.Parent
local PromiseModule = require(Parent.Promise)
local ConfirmPasswordIssueModule = require(AccountRecovery.Enums.ConfirmPasswordIssue)
local IssueCondition = require(Parent.AuthCommon).Enums.IssueCondition
local config = {
	[ConfirmPasswordIssueModule.PasswordsNotMatch] = "Authentication.AccountRecovery.MessagePasswordsDoNotMatch"
}

local function _(Input, Input1)
	-- upvalues: ConfirmPasswordIssueModule (copy), IssueCondition (copy), PromiseModule (copy)
	return function(_)
		-- upvalues: ConfirmPasswordIssueModule (upval), IssueCondition (upval), Input (copy), Input1 (copy), PromiseModule (upval)
		local IssueCondition = {
			[ConfirmPasswordIssueModule.PasswordsNotMatch] = IssueCondition.Resolved
		}
		
		if Input == nil or Input1 == nil or Input == "" or Input1 == "" or string.match(Input1, "%S") == nil then
			for i in pairs(IssueCondition) do
				if IssueCondition[i] == IssueCondition.Resolved then
					IssueCondition[i] = IssueCondition.Problematic
				end
			end
			return PromiseModule.resolve({
				InputValid = false,
				Input = Input1,
				IssueCondition = IssueCondition
			})
		else
			local config = { Input = Input1 }
			
			if Input1 ~= Input then
				IssueCondition[ConfirmPasswordIssueModule.PasswordsNotMatch] = IssueCondition.Problematic
			end
			config.InputValid = Input1 == Input
			config.IssueCondition = IssueCondition
			
			return PromiseModule.resolve(config)
		end
	end
end

return {
	validateFunction = function(_, Text, _, p1)
		-- upvalues: ConfirmPasswordIssueModule (copy), IssueCondition (copy), PromiseModule (copy)
		local Password = (p1 or {}).password
		
		return function(_)
			-- upvalues: ConfirmPasswordIssueModule (upval), IssueCondition (upval), Password (copy), Text (copy), PromiseModule (upval)
			local IssueCondition = {
				[ConfirmPasswordIssueModule.PasswordsNotMatch] = IssueCondition.Resolved
			}
			
			if Password == nil or Text == nil or Password == "" or Text == "" or string.match(Text, "%S") == nil then
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
			else
				local config = { Input = Text }
				
				if Text ~= Password then
					IssueCondition[ConfirmPasswordIssueModule.PasswordsNotMatch] = IssueCondition.Problematic
				end
				config.InputValid = Text == Password
				config.IssueCondition = IssueCondition
				
				return PromiseModule.resolve(config)
			end
		end
	end,
	getIssueMessageList = function()
		-- upvalues: config (copy)
		return config
	end,
	getDefaultIssues = function()
		-- upvalues: config (copy), IssueCondition (copy)
		local Problematics = {}
		
		for i in pairs(config) do
			Problematics[i] = IssueCondition.Problematic
		end
		return Problematics
	end
}
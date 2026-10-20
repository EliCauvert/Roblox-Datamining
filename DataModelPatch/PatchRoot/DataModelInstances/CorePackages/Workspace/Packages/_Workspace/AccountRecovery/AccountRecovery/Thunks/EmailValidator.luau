local AccountRecovery = script:FindFirstAncestor("AccountRecovery")
local Parent = AccountRecovery.Parent
local AuthCommonModule = require(Parent.AuthCommon)
local IsStringEmailFunction = AuthCommonModule.Utils.isStringEmail
local PromiseModule = require(Parent.Promise)
local EmailIssueModule = require(AccountRecovery.Enums.EmailIssue)
local IssueCondition = AuthCommonModule.Enums.IssueCondition
local config = {
	[EmailIssueModule.InvalidEmail] = "Authentication.AccountRecovery.Message.Error.InvalidEmail"
}

local function _(Input)
	-- upvalues: EmailIssueModule (copy), IssueCondition (copy), PromiseModule (copy), IsStringEmailFunction (copy)
	return function(_)
		-- upvalues: EmailIssueModule (upval), IssueCondition (upval), Input (copy), PromiseModule (upval), IsStringEmailFunction (upval)
		local IssueCondition = {
			[EmailIssueModule.InvalidEmail] = IssueCondition.Resolved
		}
		
		if Input == nil or Input == "" or string.match(Input, "%S") == nil then
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
		else
			local config = { Input = Input }
			
			if not IsStringEmailFunction(Input) then
				IssueCondition[EmailIssueModule.InvalidEmail] = IssueCondition.Problematic
			end
			config.InputValid = IsStringEmailFunction(Input)
			config.IssueCondition = IssueCondition
			
			return PromiseModule.resolve(config)
		end
	end
end

return {
	validateFunction = function(_, Text, _, _)
		-- upvalues: EmailIssueModule (copy), IssueCondition (copy), PromiseModule (copy), IsStringEmailFunction (copy)
		return function(_)
			-- upvalues: EmailIssueModule (upval), IssueCondition (upval), Text (copy), PromiseModule (upval), IsStringEmailFunction (upval)
			local IssueCondition = {
				[EmailIssueModule.InvalidEmail] = IssueCondition.Resolved
			}
			
			if Text == nil or Text == "" or string.match(Text, "%S") == nil then
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
				
				if not IsStringEmailFunction(Text) then
					IssueCondition[EmailIssueModule.InvalidEmail] = IssueCondition.Problematic
				end
				config.InputValid = IsStringEmailFunction(Text)
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
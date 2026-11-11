local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)

return require(Modules.Common.Rodux).createReducer({
	isGeneric = nil,
	promptType = nil,
	metadata = nil,
	lastUpdatedPromptTypeAt = nil,
	accountPinUnlockedUntil = nil
}, {
	[require(Modules.LuaApp.Actions.AccountSecurity.UpdateAccountPinUnlockTimeout).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			accountPinUnlockedUntil = p2.accountPinUnlockedUntil or CryoModule.None
		})
	end,
	[require(Modules.LuaApp.Actions.AccountSecurity.UpdatePromptType).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		local JoinResult = CryoModule.Dictionary.join(p1, {
			isGeneric = p2.isGeneric or CryoModule.None,
			promptType = p2.promptType or CryoModule.None,
			metadata = p2.metadata or CryoModule.None
		})
		
		if p1.promptType ~= p2.promptType then
			JoinResult = CryoModule.Dictionary.join(JoinResult, { lastUpdatedPromptTypeAt = p2.lastUpdatedPromptTypeAt })
		end
		return JoinResult
	end
})
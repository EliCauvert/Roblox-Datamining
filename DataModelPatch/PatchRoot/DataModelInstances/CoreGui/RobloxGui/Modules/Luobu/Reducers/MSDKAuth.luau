local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)

return require(CorePackages.Packages.Rodux).createReducer({
	MSDKLoginErrMessageKey = nil,
	tokenAuthErrMessageKey = nil,
	loginInProgress = false,
	openId = ""
}, {
	[require(Modules.Luobu.Actions.SetMSDKLoginErrMessageKey).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { MSDKLoginErrMessageKey = p2.errMessageKey })
	end,
	[require(Modules.Luobu.Actions.SetTokenAuthErrMessageKey).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { tokenAuthErrMessageKey = p2.errMessageKey })
	end,
	[require(Modules.Luobu.Actions.SetMSDKLoginInProgress).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { loginInProgress = p2.loginInProgress })
	end,
	[require(Modules.Luobu.Actions.SetMSDKLoginOpenId).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { openId = p2.openId })
	end
})
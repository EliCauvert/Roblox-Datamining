local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)

return require(CorePackages.Packages.Rodux).createReducer({
	signUpInProgress = false,
	prefilledDisplayName = "",
	signUpVoucher = "",
	authMethod = "",
	channelId = -1,
	agreedUserAgreements = {}
}, {
	[require(Modules.Luobu.Actions.SetSignUpInProgress).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { signUpInProgress = p2.signUpInProgress })
	end,
	[require(Modules.Luobu.Actions.SetSignUpInfo).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			prefilledDisplayName = p2.prefilledDisplayName,
			signUpVoucher = p2.signUpVoucher,
			authMethod = p2.authMethod,
			channelId = p2.channelId
		})
	end,
	[require(Modules.Luobu.Actions.SetAgreedUserAgreements).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { agreedUserAgreements = p2.agreedUserAgreements })
	end
})
local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)

return require(corePackagesService.Packages.Rodux).createReducer({ bubbleChatEnabled = false, voiceEnabled = false }, {
	[require(script.Parent.Parent.Actions.BubbleChatEnabledChanged).name] = function(p0, p1)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p0, { bubbleChatEnabled = p1.enabled })
	end,
	[require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.VoiceChat.Actions.VoiceEnabledChanged).name] = function(p2, p3)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p2, { voiceEnabled = p3.enabled })
	end
})
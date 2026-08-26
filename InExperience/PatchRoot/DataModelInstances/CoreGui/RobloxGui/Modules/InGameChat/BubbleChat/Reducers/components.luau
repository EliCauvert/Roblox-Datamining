local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)

return require(corePackagesService.Packages.Rodux).createReducer({ bubbleChatEnabled = false, voiceEnabled = false }, {
	[require(script.Parent.Parent.Actions.BubbleChatEnabledChanged).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { bubbleChatEnabled = p2.enabled })
	end,
	[require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.VoiceChat.Actions.VoiceEnabledChanged).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { voiceEnabled = p2.enabled })
	end
})
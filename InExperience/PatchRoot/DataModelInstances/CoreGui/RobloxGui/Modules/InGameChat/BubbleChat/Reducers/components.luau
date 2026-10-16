local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)

return (require(CorePackages.Packages.Rodux).createReducer({ bubbleChatEnabled = false, voiceEnabled = false }, {
	[require(script.Parent.Parent.Actions.BubbleChatEnabledChanged).name] = function(p1, p2) --[[ Line: 16 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { bubbleChatEnabled = p2.enabled })
	end,
	[require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.VoiceChat.Actions.VoiceEnabledChanged).name] = function(p1, p2) --[[ Line: 23 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { voiceEnabled = p2.enabled })
	end
}))
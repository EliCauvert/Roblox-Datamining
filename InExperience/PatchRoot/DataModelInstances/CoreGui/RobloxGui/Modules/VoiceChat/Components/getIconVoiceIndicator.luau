local Default = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.VoiceChat.VoiceChatServiceManager).default

return function(p1, p2) --[[ Line: 5 ]]
	-- upvalues: Default (copy)
	return Default:GetIcon(p1, p2)
end
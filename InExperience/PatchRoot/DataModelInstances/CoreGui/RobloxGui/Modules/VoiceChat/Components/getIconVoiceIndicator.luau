local default = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.VoiceChat.VoiceChatServiceManager).default

return function(p1, p2)
	-- upvalues: default (ref)
	return default:GetIcon(p1, p2)
end
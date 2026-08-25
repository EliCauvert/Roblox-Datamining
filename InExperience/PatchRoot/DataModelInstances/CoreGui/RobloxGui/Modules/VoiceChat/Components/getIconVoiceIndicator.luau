local default = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.VoiceChat.VoiceChatServiceManager).default

return function(p0, p1)
	-- upvalues: default (ref)
	return default:GetIcon(p0, p1)
end
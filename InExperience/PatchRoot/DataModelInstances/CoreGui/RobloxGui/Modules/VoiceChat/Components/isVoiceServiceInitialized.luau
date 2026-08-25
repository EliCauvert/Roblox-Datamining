local _ = require(game:GetService("CorePackages").Packages.Promise)
local default = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.VoiceChat.VoiceChatServiceManager).default

return function()
	-- upvalues: default (ref)
	return default:asyncInit()
end
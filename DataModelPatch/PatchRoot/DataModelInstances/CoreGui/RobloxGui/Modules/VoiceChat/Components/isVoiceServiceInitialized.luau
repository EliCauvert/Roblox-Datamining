local _ = require(game:GetService("CorePackages").Packages.Promise)
local Default = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.VoiceChat.VoiceChatServiceManager).default

return function()
	-- upvalues: Default (copy)
	return Default:asyncInit()
end
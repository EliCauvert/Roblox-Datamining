local _ = require(game:GetService("CorePackages").Packages.Promise)
local Default = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.VoiceChat.VoiceChatServiceManager).default

return function() --[[ Line: 10 ]]
	-- upvalues: Default (copy)
	return Default:asyncInit()
end
local useChatPlatformModule = require(script.Parent.useChatPlatform)
local _ = require(script.Parent.ChatPlatformContext)

return function() --[[ line: 8 | named "useChatWindowSettings" ]]
	-- upvalues: useChatPlatformModule (ref)
	return useChatPlatformModule().chatWindowSettings
end
local useChatPlatformModule = require(script.Parent.useChatPlatform)
local _ = require(script.Parent.ChatPlatformContext)

return function()
	-- upvalues: useChatPlatformModule (ref)
	return useChatPlatformModule().chatWindowSettings
end
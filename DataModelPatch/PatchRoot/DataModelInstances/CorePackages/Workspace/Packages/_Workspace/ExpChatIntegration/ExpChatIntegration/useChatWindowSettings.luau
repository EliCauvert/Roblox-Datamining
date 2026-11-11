local UseChatPlatformModule = require(script.Parent.useChatPlatform)
local _ = require(script.Parent.ChatPlatformContext)

return function()
	-- upvalues: UseChatPlatformModule (copy)
	return UseChatPlatformModule().chatWindowSettings
end
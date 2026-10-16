local UseChatPlatformModule = require(script.Parent.useChatPlatform)
local _ = require(script.Parent.ChatPlatformContext)

return function() --[[ Line: 8 | Named "useChatWindowSettings" ]]
	-- upvalues: UseChatPlatformModule (copy)
	return UseChatPlatformModule().chatWindowSettings
end
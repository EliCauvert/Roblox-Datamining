local ReactModule = require(script:FindFirstAncestor("ExpChatIntegration").Parent.React)
local ChatPlatformContextModule = require(script.Parent.ChatPlatformContext)

return function() --[[ Line: 14 | Named "useChatPlatform" ]]
	-- upvalues: ReactModule (copy), ChatPlatformContextModule (copy)
	return ReactModule.useContext(ChatPlatformContextModule)
end
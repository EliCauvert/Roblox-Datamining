local reactModule = require(script:FindFirstAncestor("ExpChatIntegration").Parent.React)
local chatPlatformContextModule = require(script.Parent.ChatPlatformContext)

return function()
	-- upvalues: reactModule (ref), chatPlatformContextModule (ref)
	return reactModule.useContext(chatPlatformContextModule)
end
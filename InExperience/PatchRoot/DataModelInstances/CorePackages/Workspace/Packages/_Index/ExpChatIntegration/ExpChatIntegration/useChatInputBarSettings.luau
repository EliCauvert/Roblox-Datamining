local signalsReactModule = require(script:FindFirstAncestor("ExpChatIntegration").Parent.SignalsReact)
local useChatPlatformModule = require(script.Parent.useChatPlatform)

return function()
	-- upvalues: useChatPlatformModule (ref), signalsReactModule (ref)
	return signalsReactModule.useSignalState(useChatPlatformModule().getChatInputBarSettings)
end
local signalsReactModule = require(script:FindFirstAncestor("ExpChatIntegration").Parent.SignalsReact)
local useChatPlatformModule = require(script.Parent.useChatPlatform)

return function() --[[ line: 8 | named "useChatInputBarSettings" ]]
	-- upvalues: useChatPlatformModule (ref), signalsReactModule (ref)
	return signalsReactModule.useSignalState(useChatPlatformModule().getChatInputBarSettings)
end
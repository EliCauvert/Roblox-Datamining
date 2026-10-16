local SignalsReactModule = require(script:FindFirstAncestor("ExpChatIntegration").Parent.SignalsReact)
local UseChatPlatformModule = require(script.Parent.useChatPlatform)

return function() --[[ Line: 8 | Named "useChatInputBarSettings" ]]
	-- upvalues: UseChatPlatformModule (copy), SignalsReactModule (copy)
	return SignalsReactModule.useSignalState(UseChatPlatformModule().getChatInputBarSettings)
end
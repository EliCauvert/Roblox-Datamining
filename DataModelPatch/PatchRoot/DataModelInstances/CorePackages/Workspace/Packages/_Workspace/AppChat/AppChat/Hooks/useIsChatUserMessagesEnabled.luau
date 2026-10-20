local AppChat = script:FindFirstAncestor("AppChat")
local UseSelectorFunction = require(AppChat.Parent.RoactUtils).Hooks.RoactRodux.useSelector
local GetDeepValue2Module = require(AppChat.Utils.getDeepValue2)

return function()
	-- upvalues: UseSelectorFunction (copy), GetDeepValue2Module (copy)
	return UseSelectorFunction(function(p1)
		-- upvalues: GetDeepValue2Module (upval)
		local ChatAppReducerChatSettingsChatUserMessagesEnabled = GetDeepValue2Module(p1, "ChatAppReducer.ChatSettings.chatUserMessagesEnabled")
		
		return ChatAppReducerChatSettingsChatUserMessagesEnabled == nil or ChatAppReducerChatSettingsChatUserMessagesEnabled
	end)
end
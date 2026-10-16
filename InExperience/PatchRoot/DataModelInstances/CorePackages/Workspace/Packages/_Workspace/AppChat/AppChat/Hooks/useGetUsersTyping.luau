local AppChat = script:FindFirstAncestor("AppChat")
local UseSelectorFunction = require(AppChat.Parent.RoactUtils).Hooks.RoactRodux.useSelector
local SelectUsersTypingModule = require(AppChat.Components.ChatConversation.Conversations.Selectors.selectUsersTyping)

return function(p1) --[[ Line: 7 ]]
	-- upvalues: UseSelectorFunction (copy), SelectUsersTypingModule (copy)
	return UseSelectorFunction(function(p2) --[[ Line: 8 ]]
		-- upvalues: SelectUsersTypingModule (upval), p1 (copy)
		return SelectUsersTypingModule(p2, p1)
	end)
end
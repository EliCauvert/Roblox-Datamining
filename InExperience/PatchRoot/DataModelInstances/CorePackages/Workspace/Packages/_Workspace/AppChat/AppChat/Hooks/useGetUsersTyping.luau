local appChat = script:FindFirstAncestor("AppChat")
local useSelector = require(appChat.Parent.RoactUtils).Hooks.RoactRodux.useSelector
local selectUsersTypingModule = require(appChat.Components.ChatConversation.Conversations.Selectors.selectUsersTyping)

return function(p1)
	-- upvalues: useSelector (ref), selectUsersTypingModule (ref)
	return useSelector(function(p2)
		-- upvalues: selectUsersTypingModule (copy), p1 (ref)
		return selectUsersTypingModule(p2, p1)
	end)
end
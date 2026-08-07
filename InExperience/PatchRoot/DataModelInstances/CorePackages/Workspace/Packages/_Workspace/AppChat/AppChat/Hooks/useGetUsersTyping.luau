local appChat = script:FindFirstAncestor("AppChat")
local useSelector = require(appChat.Parent.RoactUtils).Hooks.RoactRodux.useSelector
local selectUsersTypingModule = require(appChat.Components.ChatConversation.Conversations.Selectors.selectUsersTyping)

return function(p0) --[[ line: 7 ]]
	-- upvalues: useSelector (ref), selectUsersTypingModule (ref)
	return useSelector(function(p1) --[[ line: 8 ]]
		-- upvalues: selectUsersTypingModule (copy), p0 (ref)
		return selectUsersTypingModule(p1, p0)
	end)
end
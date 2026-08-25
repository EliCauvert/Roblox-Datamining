local appChat = script:FindFirstAncestor("AppChat")
local useSelector = require(appChat.Parent.RoactUtils).Hooks.RoactRodux.useSelector
local selectConversationsModule = require(appChat.Components.ChatLanding.Conversations.Selectors.selectConversations)

return function()
	-- upvalues: useSelector (ref), selectConversationsModule (ref)
	return useSelector(function(p0)
		-- upvalues: selectConversationsModule (copy)
		return selectConversationsModule(p0)
	end)
end
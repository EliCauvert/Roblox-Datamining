local AppChat = script:FindFirstAncestor("AppChat")
local UseSelectorFunction = require(AppChat.Parent.RoactUtils).Hooks.RoactRodux.useSelector
local SelectConversationsModule = require(AppChat.Components.ChatLanding.Conversations.Selectors.selectConversations)

return function()
	-- upvalues: UseSelectorFunction (copy), SelectConversationsModule (copy)
	return UseSelectorFunction(function(p1)
		-- upvalues: SelectConversationsModule (upval)
		return SelectConversationsModule(p1)
	end)
end
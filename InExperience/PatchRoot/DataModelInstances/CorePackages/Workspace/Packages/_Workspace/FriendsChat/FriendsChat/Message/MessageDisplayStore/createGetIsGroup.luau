local Parent = script:FindFirstAncestor("FriendsChat").Parent
local SignalsModule = require(Parent.Signals)
local ConversationModule = require(Parent.AppChat.Conversation)
local GetConversationStoreModule = require(Parent.AppChat.GetConversationStore)

return function(p1)
	-- upvalues: SignalsModule (copy), GetConversationStoreModule (copy), ConversationModule (copy)
	return SignalsModule.createComputed(function(p2): boolean
		-- upvalues: p1 (copy), GetConversationStoreModule (upval), ConversationModule (upval)
		if p1 == nil then
			return false
		else
			local Conversation = GetConversationStoreModule(p2).getConversation(p1, p2)
			
			return Conversation ~= nil and Conversation.conversationType == ConversationModule.Type.MULTI_USER_CONVERSATION
		end
	end)
end
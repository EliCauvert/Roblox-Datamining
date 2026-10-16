local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local PromiseModule = require(Parent.Promise)
local _ = require(AppChat.Models.ConversationChannels)
local ReloadedMessagesForConversationsModule = require(AppChat.Conversations.Actions.ReloadedMessagesForConversations)
local MultiGetConversationDetailsModule = require(AppChat.Conversations.Thunks.multiGetConversationDetails)

return function(p1) --[[ Line: 10 | Named "reloadMessagesForConversations" ]]
	-- upvalues: CryoModule (copy), PromiseModule (copy), ReloadedMessagesForConversationsModule (copy), MultiGetConversationDetailsModule (copy)
	return function(p2) --[[ Line: 11 ]]
		-- upvalues: CryoModule (upval), p1 (copy), PromiseModule (upval), ReloadedMessagesForConversationsModule (upval), MultiGetConversationDetailsModule (upval)
		local Conversations = p2:getState().ChatAppReducer.Conversations
		local FilterResult = CryoModule.List.filter(p1, function(p3): boolean --[[ Line: 15 ]]
			-- upvalues: Conversations (copy)
			local Conversation = Conversations[p3]
			
			return Conversation and Conversation.source == "channels" or false
		end)
		
		if #FilterResult == 0 then
			return PromiseModule.resolve()
		else
			p2:dispatch(ReloadedMessagesForConversationsModule(FilterResult))
			
			return p2:dispatch(MultiGetConversationDetailsModule(FilterResult))
		end
	end
end
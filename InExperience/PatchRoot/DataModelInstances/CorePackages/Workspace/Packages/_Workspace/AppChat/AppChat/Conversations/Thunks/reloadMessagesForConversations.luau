local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local promiseModule = require(parent.Promise)
local _ = require(appChat.Models.ConversationChannels)
local reloadedMessagesForConversationsModule = require(appChat.Conversations.Actions.ReloadedMessagesForConversations)
local multiGetConversationDetailsModule = require(appChat.Conversations.Thunks.multiGetConversationDetails)

return function(p1)
	-- upvalues: cryoModule (ref), promiseModule (ref), reloadedMessagesForConversationsModule (ref), multiGetConversationDetailsModule (ref)
	return function(p2)
		-- upvalues: cryoModule (copy), p1 (ref), promiseModule (copy), reloadedMessagesForConversationsModule (copy), multiGetConversationDetailsModule (copy)
		local conversations = p2:getState().ChatAppReducer.Conversations
		local var1 = cryoModule.List.filter(p1, function(p3)
			-- upvalues: conversations (ref)
			local var2 = conversations[p3]
			
			return var2 and var2.source == "channels"
		end)
		
		if #var1 == 0 then
			return promiseModule.resolve()
		end
		p2:dispatch(reloadedMessagesForConversationsModule(var1))
		
		return p2:dispatch(multiGetConversationDetailsModule(var1))
	end
end
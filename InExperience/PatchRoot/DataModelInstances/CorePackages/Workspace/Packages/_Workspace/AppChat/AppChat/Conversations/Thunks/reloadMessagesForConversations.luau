local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local promiseModule = require(parent.Promise)
local _ = require(appChat.Models.ConversationChannels)
local reloadedMessagesForConversationsModule = require(appChat.Conversations.Actions.ReloadedMessagesForConversations)
local multiGetConversationDetailsModule = require(appChat.Conversations.Thunks.multiGetConversationDetails)

return function(p0) --[[ line: 10 | named "reloadMessagesForConversations" ]]
	-- upvalues: cryoModule (ref), promiseModule (ref), reloadedMessagesForConversationsModule (ref), multiGetConversationDetailsModule (ref)
	return function(p1) --[[ line: 11 ]]
		-- upvalues: cryoModule (copy), p0 (ref), promiseModule (copy), reloadedMessagesForConversationsModule (copy), multiGetConversationDetailsModule (copy)
		local conversations = p1:getState().ChatAppReducer.Conversations
		local var5 = cryoModule.List.filter(p0, function(p2) --[[ line: 15 ]]
			-- upvalues: conversations (ref)
			local var6 = conversations[p2]
			
			return var6 and var6.source == "channels"
		end)
		
		if #var5 == 0 then
			return promiseModule.resolve()
		end
		p1:dispatch(reloadedMessagesForConversationsModule(var5))
		
		return p1:dispatch(multiGetConversationDetailsModule(var5))
	end
end
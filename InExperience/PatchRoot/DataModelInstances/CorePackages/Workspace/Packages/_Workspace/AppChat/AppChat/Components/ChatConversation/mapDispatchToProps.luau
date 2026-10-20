local AppChat = script:FindFirstAncestor("AppChat")
local Messages = script.Parent.Messages
local GetOlderMessagesModule = require(Messages.NetworkRequests.getOlderMessages)
local MarkConversationAsReadModule = require(Messages.NetworkRequests.markConversationAsRead)
local SendTextMessageModule = require(Messages.Thunks.sendTextMessage)
local GetRemainingOlderMessagesModule = require(Messages.Thunks.getRemainingOlderMessages)
local UpdateTypingStatusModule = require(Messages.NetworkRequests.updateTypingStatus)
local CreateFriendConversationModule = require(AppChat.Conversations.Thunks.createFriendConversation)
local SendGameLinkMessageModule = require(AppChat.Conversations.Thunks.SendGameLinkMessage)

return function(Callback)
	-- upvalues: GetOlderMessagesModule (copy), GetRemainingOlderMessagesModule (copy), SendTextMessageModule (copy), SendGameLinkMessageModule (copy), CreateFriendConversationModule (copy), MarkConversationAsReadModule (copy), UpdateTypingStatusModule (copy)
	local function v9(p1, p2, p3, _)
		-- upvalues: Callback (copy), GetOlderMessagesModule (upval)
		return Callback(GetOlderMessagesModule(p1, p2, p3))
	end
	
	return {
		getOlderMessages = function(p1, _)
			-- upvalues: Callback (copy), GetRemainingOlderMessagesModule (upval), v9 (copy)
			return Callback(GetRemainingOlderMessagesModule(v9, p1))
		end,
		sendMessage = function(p1, p2, p3)
			-- upvalues: Callback (copy), SendTextMessageModule (upval)
			return Callback(SendTextMessageModule(p1, p2, p3))
		end,
		sendGameLinkChatMessage = function(p1, p2)
			-- upvalues: Callback (copy), SendGameLinkMessageModule (upval)
			return Callback(SendGameLinkMessageModule(p1, p2))
		end,
		createFriendConversation = function(p1, p2)
			-- upvalues: Callback (copy), CreateFriendConversationModule (upval)
			return Callback(CreateFriendConversationModule(p1, p2))
		end,
		markConversationAsRead = function(p1)
			-- upvalues: Callback (copy), MarkConversationAsReadModule (upval)
			Callback(MarkConversationAsReadModule(p1))
		end,
		postTypingStatus = function(p1, _)
			-- upvalues: Callback (copy), UpdateTypingStatusModule (upval)
			return Callback(UpdateTypingStatusModule(p1))
		end
	}
end
local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local messages = script.Parent.Messages
local getOlderMessagesModule = require(messages.NetworkRequests.getOlderMessages)
local markConversationAsReadModule = require(messages.NetworkRequests.markConversationAsRead)
local sendTextMessageModule = require(messages.Thunks.sendTextMessage)
local getRemainingOlderMessagesModule = require(messages.Thunks.getRemainingOlderMessages)
local updateTypingStatusModule = require(messages.NetworkRequests.updateTypingStatus)
local createFriendConversationModule = require(appChat.Conversations.Thunks.createFriendConversation)
local sendGameLinkMessageModule = require(appChat.Conversations.Thunks.SendGameLinkMessage)
local loggerModule = require(appChat.Logger)
local appChatNetworkingModule = require(parent.AppChatNetworking)

return function(p1)
	-- upvalues: getOlderMessagesModule (ref), getRemainingOlderMessagesModule (ref), sendTextMessageModule (ref), sendGameLinkMessageModule (ref), createFriendConversationModule (ref), markConversationAsReadModule (ref), updateTypingStatusModule (ref), appChatNetworkingModule (ref), loggerModule (ref)
	local var1 = function(p2, p3, p4, _)
		-- upvalues: p1 (ref), getOlderMessagesModule (copy)
		return p1(getOlderMessagesModule(p2, p3, p4))
	end
	
	return {
		getOlderMessages = function(p2, _)
			-- upvalues: p1 (ref), getRemainingOlderMessagesModule (copy), var1 (ref)
			return p1(getRemainingOlderMessagesModule(var1, p2))
		end,
		sendMessage = function(p2, p3, p4)
			-- upvalues: p1 (ref), sendTextMessageModule (copy)
			return p1(sendTextMessageModule(p2, p3, p4))
		end,
		sendGameLinkChatMessage = function(p2, p3)
			-- upvalues: p1 (ref), sendGameLinkMessageModule (copy)
			return p1(sendGameLinkMessageModule(p2, p3))
		end,
		createFriendConversation = function(p2, p3)
			-- upvalues: p1 (ref), createFriendConversationModule (copy)
			return p1(createFriendConversationModule(p2, p3))
		end,
		markConversationAsRead = function(p2)
			-- upvalues: p1 (ref), markConversationAsReadModule (copy)
			p1(markConversationAsReadModule(p2))
		end,
		postTypingStatus = function(p2, _)
			-- upvalues: p1 (ref), updateTypingStatusModule (copy)
			return p1(updateTypingStatusModule(p2))
		end,
		getUnreadConversationCount = function()
			-- upvalues: p1 (ref), appChatNetworkingModule (copy), loggerModule (copy)
			return p1(appChatNetworkingModule.rodux.GetConversationMetadata.API()):catch(function(p2)
				-- upvalues: loggerModule (copy)
				loggerModule:error(`Failure in GetConversationMetadata. Error: {tostring(p2)}`)
			end)
		end
	}
end
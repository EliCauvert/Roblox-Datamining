local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local messages = script.Parent.Messages
local getOlderMessagesModule = require(messages.NetworkRequests.getOlderMessages)
local markConversationAsReadModule = require(messages.NetworkRequests.markConversationAsRead)
local sendTextMessageModule = require(messages.Thunks.sendTextMessage)
local getRemainingOlderMessagesModule = require(messages.Thunks.getRemainingOlderMessages)
local updateTypingStatusModule = require(messages.NetworkRequests.updateTypingStatus)
local createFriendConversationModule = require(appChat.Conversations.Thunks.createFriendConversation)
local loggerModule = require(appChat.Logger)
local appChatNetworkingModule = require(parent.AppChatNetworking)

return function(p0) --[[ line: 16 ]]
	-- upvalues: getOlderMessagesModule (ref), getRemainingOlderMessagesModule (ref), sendTextMessageModule (ref), createFriendConversationModule (ref), markConversationAsReadModule (ref), updateTypingStatusModule (ref), appChatNetworkingModule (ref), loggerModule (ref)
	local var9 = function(p1, p2, p3, _) --[[ line: 17 ]]
		-- upvalues: p0 (ref), getOlderMessagesModule (copy)
		return p0(getOlderMessagesModule(p1, p2, p3))
	end
	
	return {
		getOlderMessages = function(p4, _) --[[ line: 22 ]]
			-- upvalues: p0 (ref), getRemainingOlderMessagesModule (copy), var9 (ref)
			return p0(getRemainingOlderMessagesModule(var9, p4))
		end,
		sendMessage = function(p5, p6, p7) --[[ line: 25 ]]
			-- upvalues: p0 (ref), sendTextMessageModule (copy)
			return p0(sendTextMessageModule(p5, p6, p7))
		end,
		createFriendConversation = function(p8, p9) --[[ line: 28 ]]
			-- upvalues: p0 (ref), createFriendConversationModule (copy)
			return p0(createFriendConversationModule(p8, p9))
		end,
		markConversationAsRead = function(p10) --[[ line: 31 ]]
			-- upvalues: p0 (ref), markConversationAsReadModule (copy)
			p0(markConversationAsReadModule(p10))
		end,
		postTypingStatus = function(p11, _) --[[ line: 34 ]]
			-- upvalues: p0 (ref), updateTypingStatusModule (copy)
			return p0(updateTypingStatusModule(p11))
		end,
		getUnreadConversationCount = function() --[[ line: 39 ]]
			-- upvalues: p0 (ref), appChatNetworkingModule (copy), loggerModule (copy)
			return p0(appChatNetworkingModule.rodux.GetConversationMetadata.API()):catch(function(p12) --[[ line: 40 ]]
				-- upvalues: loggerModule (copy)
				loggerModule:error(`Failure in GetConversationMetadata. Error: {tostring(p12)}`)
			end)
		end
	}
end
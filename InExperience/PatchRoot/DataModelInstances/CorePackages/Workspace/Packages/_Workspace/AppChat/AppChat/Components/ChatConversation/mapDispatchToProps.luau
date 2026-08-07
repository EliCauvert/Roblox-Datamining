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

return function(p0) --[[ line: 17 ]]
	-- upvalues: getOlderMessagesModule (ref), getRemainingOlderMessagesModule (ref), sendTextMessageModule (ref), sendGameLinkMessageModule (ref), createFriendConversationModule (ref), markConversationAsReadModule (ref), updateTypingStatusModule (ref), appChatNetworkingModule (ref), loggerModule (ref)
	local var10 = function(p1, p2, p3, _) --[[ line: 18 ]]
		-- upvalues: p0 (ref), getOlderMessagesModule (copy)
		return p0(getOlderMessagesModule(p1, p2, p3))
	end
	
	return {
		getOlderMessages = function(p4, _) --[[ line: 23 ]]
			-- upvalues: p0 (ref), getRemainingOlderMessagesModule (copy), var10 (ref)
			return p0(getRemainingOlderMessagesModule(var10, p4))
		end,
		sendMessage = function(p5, p6, p7) --[[ line: 26 ]]
			-- upvalues: p0 (ref), sendTextMessageModule (copy)
			return p0(sendTextMessageModule(p5, p6, p7))
		end,
		sendGameLinkChatMessage = function(p8, p9) --[[ line: 29 ]]
			-- upvalues: p0 (ref), sendGameLinkMessageModule (copy)
			return p0(sendGameLinkMessageModule(p8, p9))
		end,
		createFriendConversation = function(p10, p11) --[[ line: 32 ]]
			-- upvalues: p0 (ref), createFriendConversationModule (copy)
			return p0(createFriendConversationModule(p10, p11))
		end,
		markConversationAsRead = function(p12) --[[ line: 35 ]]
			-- upvalues: p0 (ref), markConversationAsReadModule (copy)
			p0(markConversationAsReadModule(p12))
		end,
		postTypingStatus = function(p13, _) --[[ line: 38 ]]
			-- upvalues: p0 (ref), updateTypingStatusModule (copy)
			return p0(updateTypingStatusModule(p13))
		end,
		getUnreadConversationCount = function() --[[ line: 43 ]]
			-- upvalues: p0 (ref), appChatNetworkingModule (copy), loggerModule (copy)
			return p0(appChatNetworkingModule.rodux.GetConversationMetadata.API()):catch(function(p14) --[[ line: 44 ]]
				-- upvalues: loggerModule (copy)
				loggerModule:error(`Failure in GetConversationMetadata. Error: {tostring(p14)}`)
			end)
		end
	}
end
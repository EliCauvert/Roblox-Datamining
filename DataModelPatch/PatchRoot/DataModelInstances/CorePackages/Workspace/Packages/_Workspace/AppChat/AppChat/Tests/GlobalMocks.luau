local AppChat = script:FindFirstAncestor("AppChat")
local AppChatNetworkingModule = require(AppChat.Parent.AppChatNetworking)
local NetworkingChatModule = require(AppChat.Http.NetworkingChat)
local NetworkingPresenceModule = require(AppChat.Http.NetworkingPresence)
local NetworkingFriendsModule = require(AppChat.Http.NetworkingFriends)

return {
	setup = function()
		-- upvalues: AppChatNetworkingModule (copy), NetworkingChatModule (copy), NetworkingPresenceModule (copy), NetworkingFriendsModule (copy)
		AppChatNetworkingModule.rodux.GetConversationMetadata.Mock.clear()
		AppChatNetworkingModule.rodux.GetConversationMetadata.Mock.reply(function()
			return { responseBody = { global_unread_message_count = 0 } }
		end)
		NetworkingChatModule.GetUnreadConversationCount.Mock.clear()
		NetworkingChatModule.GetUnreadConversationCount.Mock.reply(function()
			return { responseBody = { data = {} } }
		end)
		NetworkingChatModule.MarkAsRead.Mock.clear()
		NetworkingChatModule.MarkAsRead.Mock.reply(function()
			return { responseBody = { data = {} } }
		end)
		AppChatNetworkingModule.rodux.MarkConversation.Mock.clear()
		AppChatNetworkingModule.rodux.MarkConversation.Mock.reply(function()
			return { responseBody = { data = {} } }
		end)
		NetworkingPresenceModule.GetPresencesFromUserIds.Mock.clear()
		NetworkingPresenceModule.GetPresencesFromUserIds.Mock.reply(function()
			return { responseBody = { userPresences = {} } }
		end)
		NetworkingFriendsModule.GetFriendsFromUserId.Mock.clear()
		NetworkingFriendsModule.GetFriendsFromUserId.Mock.reply(function()
			return { responseBody = { data = {} } }
		end)
		AppChatNetworkingModule.rodux.GetOlderMessages.Mock.clear()
		AppChatNetworkingModule.rodux.GetOlderMessages.Mock.reply(function()
			return { responseBody = {} }
		end)
		AppChatNetworkingModule.rodux.GetChatModerationStatuses.Mock.clear()
		AppChatNetworkingModule.rodux.GetChatModerationStatuses.Mock.reply(function()
			return { responseBody = {} }
		end)
		AppChatNetworkingModule.rodux.RecordModalSequenceResponse.Mock.clear()
		AppChatNetworkingModule.rodux.RecordModalSequenceResponse.Mock.reply(function()
			return { responseBody = {} }
		end)
	end,
	teardown = function()
		-- upvalues: AppChatNetworkingModule (copy), NetworkingChatModule (copy), NetworkingPresenceModule (copy), NetworkingFriendsModule (copy)
		AppChatNetworkingModule.rodux.GetConversationMetadata.Mock.clear()
		NetworkingChatModule.GetUnreadConversationCount.Mock.clear()
		NetworkingChatModule.MarkAsRead.Mock.clear()
		AppChatNetworkingModule.rodux.MarkConversation.Mock.clear()
		NetworkingPresenceModule.GetPresencesFromUserIds.Mock.clear()
		NetworkingFriendsModule.GetFriendsFromUserId.Mock.clear()
		AppChatNetworkingModule.rodux.GetOlderMessages.Mock.clear()
		AppChatNetworkingModule.rodux.GetChatModerationStatuses.Mock.clear()
		AppChatNetworkingModule.rodux.RecordModalSequenceResponse.Mock.clear()
	end
}
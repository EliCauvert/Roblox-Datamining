local _ = require(script.Parent.networkingChatTypes)
local NetworkRequests = script.Parent.networkRequests
local CreateAddToConversationModule = require(NetworkRequests.createAddToConversation)
local CreateRemoveFromConversationModule = require(NetworkRequests.createRemoveFromConversation)
local CreateRenameGroupConversationModule = require(NetworkRequests.createRenameGroupConversation)
local CreateStartGroupConversationModule = require(NetworkRequests.createStartGroupConversation)
local CreateStartOneToOneConversationModule = require(NetworkRequests.createStartOneToOneConversation)
local CreateSetConversationUniverseModule = require(NetworkRequests.createSetConversationUniverse)
local CreateResetConversationUniverseModule = require(NetworkRequests.createResetConversationUniverse)
local CreateSendMessageModule = require(NetworkRequests.createSendMessage)
local CreateSendGameLinkMessageModule = require(NetworkRequests.createSendGameLinkMessage)
local CreateUpdateUserTypingStatusModule = require(NetworkRequests.createUpdateUserTypingStatus)
local CreateMarkAsReadModule = require(NetworkRequests.createMarkAsRead)
local CreateMarkAsSeenModule = require(NetworkRequests.createMarkAsSeen)
local CreateGetMessagesModule = require(NetworkRequests.createGetMessages)
local CreateGetUserConversationsModule = require(NetworkRequests.createGetUserConversations)
local CreateGetConversationsModule = require(NetworkRequests.createGetConversations)
local CreateGetLatestMessagesModule = require(NetworkRequests.createGetLatestMessages)
local CreateGetUnreadConversationCountModule = require(NetworkRequests.createGetUnreadConversationCount)
local CreateGetUnreadMessagesModule = require(NetworkRequests.createGetUnreadMessages)
local CreateGetChatSettingsModule = require(NetworkRequests.createGetChatSettings)
local CreateGetRolloutSettingsModule = require(NetworkRequests.createGetRolloutSettings)
local CreateGetMetadataModule = require(NetworkRequests.createGetMetadata)

return function(p1) --[[ Line: 26 ]]
	-- upvalues: CreateAddToConversationModule (copy), CreateRemoveFromConversationModule (copy), CreateRenameGroupConversationModule (copy), CreateStartGroupConversationModule (copy), CreateStartOneToOneConversationModule (copy), CreateSetConversationUniverseModule (copy), CreateResetConversationUniverseModule (copy), CreateSendMessageModule (copy), CreateSendGameLinkMessageModule (copy), CreateUpdateUserTypingStatusModule (copy), CreateMarkAsReadModule (copy), CreateMarkAsSeenModule (copy), CreateGetMessagesModule (copy), CreateGetUserConversationsModule (copy), CreateGetConversationsModule (copy), CreateGetLatestMessagesModule (copy), CreateGetUnreadConversationCountModule (copy), CreateGetUnreadMessagesModule (copy), CreateGetChatSettingsModule (copy), CreateGetRolloutSettingsModule (copy), CreateGetMetadataModule (copy)
	return {
		AddToConversation = CreateAddToConversationModule(p1),
		RemoveFromConversation = CreateRemoveFromConversationModule(p1),
		RenameGroupConversation = CreateRenameGroupConversationModule(p1),
		StartGroupConversation = CreateStartGroupConversationModule(p1),
		StartOneToOneConversation = CreateStartOneToOneConversationModule(p1),
		SetConversationUniverse = CreateSetConversationUniverseModule(p1),
		ResetConversationUniverse = CreateResetConversationUniverseModule(p1),
		SendMessage = CreateSendMessageModule(p1),
		SendGameLinkMessage = CreateSendGameLinkMessageModule(p1),
		UpdateUserTypingStatus = CreateUpdateUserTypingStatusModule(p1),
		MarkAsRead = CreateMarkAsReadModule(p1),
		MarkAsSeen = CreateMarkAsSeenModule(p1),
		GetMessages = CreateGetMessagesModule(p1),
		GetUserConversations = CreateGetUserConversationsModule(p1),
		GetConversations = CreateGetConversationsModule(p1),
		GetLatestMessages = CreateGetLatestMessagesModule(p1),
		GetUnreadConversationCount = CreateGetUnreadConversationCountModule(p1),
		GetUnreadMessages = CreateGetUnreadMessagesModule(p1),
		GetChatSettings = CreateGetChatSettingsModule(p1),
		GetRolloutSettings = CreateGetRolloutSettingsModule(p1),
		GetMetadata = CreateGetMetadataModule(p1)
	}
end
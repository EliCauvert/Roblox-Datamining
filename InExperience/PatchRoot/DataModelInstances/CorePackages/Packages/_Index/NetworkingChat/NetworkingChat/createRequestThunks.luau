local _ = require(script.Parent.networkingChatTypes)
local networkRequests = script.Parent.networkRequests
local createAddToConversationModule = require(networkRequests.createAddToConversation)
local createRemoveFromConversationModule = require(networkRequests.createRemoveFromConversation)
local createRenameGroupConversationModule = require(networkRequests.createRenameGroupConversation)
local createStartGroupConversationModule = require(networkRequests.createStartGroupConversation)
local createStartOneToOneConversationModule = require(networkRequests.createStartOneToOneConversation)
local createSetConversationUniverseModule = require(networkRequests.createSetConversationUniverse)
local createResetConversationUniverseModule = require(networkRequests.createResetConversationUniverse)
local createSendMessageModule = require(networkRequests.createSendMessage)
local createSendGameLinkMessageModule = require(networkRequests.createSendGameLinkMessage)
local createUpdateUserTypingStatusModule = require(networkRequests.createUpdateUserTypingStatus)
local createMarkAsReadModule = require(networkRequests.createMarkAsRead)
local createMarkAsSeenModule = require(networkRequests.createMarkAsSeen)
local createGetMessagesModule = require(networkRequests.createGetMessages)
local createGetUserConversationsModule = require(networkRequests.createGetUserConversations)
local createGetConversationsModule = require(networkRequests.createGetConversations)
local createGetLatestMessagesModule = require(networkRequests.createGetLatestMessages)
local createGetUnreadConversationCountModule = require(networkRequests.createGetUnreadConversationCount)
local createGetUnreadMessagesModule = require(networkRequests.createGetUnreadMessages)
local createGetChatSettingsModule = require(networkRequests.createGetChatSettings)
local createGetRolloutSettingsModule = require(networkRequests.createGetRolloutSettings)
local createGetMetadataModule = require(networkRequests.createGetMetadata)

return function(p1)
	-- upvalues: createAddToConversationModule (ref), createRemoveFromConversationModule (ref), createRenameGroupConversationModule (ref), createStartGroupConversationModule (ref), createStartOneToOneConversationModule (ref), createSetConversationUniverseModule (ref), createResetConversationUniverseModule (ref), createSendMessageModule (ref), createSendGameLinkMessageModule (ref), createUpdateUserTypingStatusModule (ref), createMarkAsReadModule (ref), createMarkAsSeenModule (ref), createGetMessagesModule (ref), createGetUserConversationsModule (ref), createGetConversationsModule (ref), createGetLatestMessagesModule (ref), createGetUnreadConversationCountModule (ref), createGetUnreadMessagesModule (ref), createGetChatSettingsModule (ref), createGetRolloutSettingsModule (ref), createGetMetadataModule (ref)
	return {
		AddToConversation = createAddToConversationModule(p1),
		RemoveFromConversation = createRemoveFromConversationModule(p1),
		RenameGroupConversation = createRenameGroupConversationModule(p1),
		StartGroupConversation = createStartGroupConversationModule(p1),
		StartOneToOneConversation = createStartOneToOneConversationModule(p1),
		SetConversationUniverse = createSetConversationUniverseModule(p1),
		ResetConversationUniverse = createResetConversationUniverseModule(p1),
		SendMessage = createSendMessageModule(p1),
		SendGameLinkMessage = createSendGameLinkMessageModule(p1),
		UpdateUserTypingStatus = createUpdateUserTypingStatusModule(p1),
		MarkAsRead = createMarkAsReadModule(p1),
		MarkAsSeen = createMarkAsSeenModule(p1),
		GetMessages = createGetMessagesModule(p1),
		GetUserConversations = createGetUserConversationsModule(p1),
		GetConversations = createGetConversationsModule(p1),
		GetLatestMessages = createGetLatestMessagesModule(p1),
		GetUnreadConversationCount = createGetUnreadConversationCountModule(p1),
		GetUnreadMessages = createGetUnreadMessagesModule(p1),
		GetChatSettings = createGetChatSettingsModule(p1),
		GetRolloutSettings = createGetRolloutSettingsModule(p1),
		GetMetadata = createGetMetadataModule(p1)
	}
end
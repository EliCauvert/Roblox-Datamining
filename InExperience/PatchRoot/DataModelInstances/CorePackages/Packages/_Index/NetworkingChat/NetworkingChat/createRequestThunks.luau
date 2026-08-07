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

return function(p0) --[[ line: 26 ]]
	-- upvalues: createAddToConversationModule (ref), createRemoveFromConversationModule (ref), createRenameGroupConversationModule (ref), createStartGroupConversationModule (ref), createStartOneToOneConversationModule (ref), createSetConversationUniverseModule (ref), createResetConversationUniverseModule (ref), createSendMessageModule (ref), createSendGameLinkMessageModule (ref), createUpdateUserTypingStatusModule (ref), createMarkAsReadModule (ref), createMarkAsSeenModule (ref), createGetMessagesModule (ref), createGetUserConversationsModule (ref), createGetConversationsModule (ref), createGetLatestMessagesModule (ref), createGetUnreadConversationCountModule (ref), createGetUnreadMessagesModule (ref), createGetChatSettingsModule (ref), createGetRolloutSettingsModule (ref), createGetMetadataModule (ref)
	return {
		AddToConversation = createAddToConversationModule(p0),
		RemoveFromConversation = createRemoveFromConversationModule(p0),
		RenameGroupConversation = createRenameGroupConversationModule(p0),
		StartGroupConversation = createStartGroupConversationModule(p0),
		StartOneToOneConversation = createStartOneToOneConversationModule(p0),
		SetConversationUniverse = createSetConversationUniverseModule(p0),
		ResetConversationUniverse = createResetConversationUniverseModule(p0),
		SendMessage = createSendMessageModule(p0),
		SendGameLinkMessage = createSendGameLinkMessageModule(p0),
		UpdateUserTypingStatus = createUpdateUserTypingStatusModule(p0),
		MarkAsRead = createMarkAsReadModule(p0),
		MarkAsSeen = createMarkAsSeenModule(p0),
		GetMessages = createGetMessagesModule(p0),
		GetUserConversations = createGetUserConversationsModule(p0),
		GetConversations = createGetConversationsModule(p0),
		GetLatestMessages = createGetLatestMessagesModule(p0),
		GetUnreadConversationCount = createGetUnreadConversationCountModule(p0),
		GetUnreadMessages = createGetUnreadMessagesModule(p0),
		GetChatSettings = createGetChatSettingsModule(p0),
		GetRolloutSettings = createGetRolloutSettingsModule(p0),
		GetMetadata = createGetMetadataModule(p0)
	}
end
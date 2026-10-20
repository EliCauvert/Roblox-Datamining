local AppChat = script:FindFirstAncestor("AppChat")
local CryoModule = require(AppChat.Parent.Cryo)
local Conversation = require(AppChat.SocialLibraries).Conversation
local GetConversationTitleModule = require(AppChat.Conversations.getConversationTitle)
local GetOtherParticipantFunction = Conversation.getOtherParticipant
local GetConversationGameIdFunction = Conversation.getConversationGameId
local PopulateUserIdsWithStateModule = require(script.Parent.populateUserIdsWithState)
local GetThumbnailsForUserIdsModule = require(AppChat.Users.getThumbnailsForUserIds)
local GetLastMessageContentModule = require(script.Parent.getLastMessageContent)
local RoduxPresenceModule = require(AppChat.Http.RoduxPresence)
local FFlagAppChatPresenceStoreMigrationModule = require(AppChat.Flags.FFlagAppChatPresenceStoreMigration)
local UserPresenceUtilsModule = require(AppChat.Users.userPresenceUtils)
local GetConversationTimestampModule = require(AppChat.Utils.getConversationTimestamp)

return function(p1, p2)
	-- upvalues: CryoModule (copy), FFlagAppChatPresenceStoreMigrationModule (copy), GetOtherParticipantFunction (copy), RoduxPresenceModule (copy), UserPresenceUtilsModule (copy), GetConversationTimestampModule (copy), GetConversationTitleModule (copy), PopulateUserIdsWithStateModule (copy), GetLastMessageContentModule (copy), GetThumbnailsForUserIdsModule (copy), GetConversationGameIdFunction (copy)
	local Participants = p2.participants or {}
	local FilterResult = CryoModule.List.filter(Participants, function(LocalUserId): boolean
		-- upvalues: p1 (copy)
		return LocalUserId ~= p1.LocalUserId
	end)
	local UserDisplayPresence = if FFlagAppChatPresenceStoreMigrationModule or p2.conversationType ~= "OneToOneConversation" then nil else UserPresenceUtilsModule.getUserDisplayPresence((RoduxPresenceModule.Selectors.getUserPresenceByUserId(p1, (GetOtherParticipantFunction(p1, p2.participants)))))
	local t = {}
	local Users = p1.Users
	
	for _, participant in pairs(Participants) do
		t[participant] = Users[participant]
	end
	return CryoModule.Dictionary.join({
		id = p2.id,
		title = GetConversationTitleModule(p2),
		participants = PopulateUserIdsWithStateModule(p1, Participants),
		otherParticipants = FilterResult,
		isDefaultTitle = p2.isDefaultTitle,
		hasGroupUp = p2.hasGroupUp,
		lastMessageContent = GetLastMessageContentModule(p2) or "",
		hasUnreadMessages = p2.hasUnreadMessages or false,
		thumbnails = GetThumbnailsForUserIdsModule(FilterResult),
		presenceText = if FFlagAppChatPresenceStoreMigrationModule then nil else UserDisplayPresence and UserDisplayPresence.text,
		presenceImage = if FFlagAppChatPresenceStoreMigrationModule then nil else UserDisplayPresence and UserDisplayPresence.image,
		gameId = GetConversationGameIdFunction(p2, p1.LocalUserId, t),
		serverState = p2.serverState,
		moderationType = p2.moderationType,
		userPendingStatus = p2.userPendingStatus,
		conversationType = p2.conversationType,
		osaAcknowledgementStatus = p2.osaAcknowledgementStatus,
		userOptedIntoChatMessages = p2.userOptedIntoChatMessages
	}, {
		shortRelativeTime = p2.lastUpdated and GetConversationTimestampModule(p2.lastUpdated),
		longRelativeTime = p2.lastUpdated and p2.lastUpdated:GetLongRelativeTime(),
		unixTime = p2.lastUpdated and p2.lastUpdated:GetUnixTimestamp()
	})
end
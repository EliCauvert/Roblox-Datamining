local appChat = script:FindFirstAncestor("AppChat")
local cryoModule = require(appChat.Parent.Cryo)
local conversation = require(appChat.SocialLibraries).Conversation
local getConversationTitleModule = require(appChat.Conversations.getConversationTitle)
local getOtherParticipant = conversation.getOtherParticipant
local getConversationGameId = conversation.getConversationGameId
local populateUserIdsWithStateModule = require(script.Parent.populateUserIdsWithState)
local getThumbnailsForUserIdsModule = require(appChat.Users.getThumbnailsForUserIds)
local getLastMessageContentModule = require(script.Parent.getLastMessageContent)
local roduxPresenceModule = require(appChat.Http.RoduxPresence)
local fFlagAppChatPresenceStoreMigrationModule = require(appChat.Flags.FFlagAppChatPresenceStoreMigration)
local userPresenceUtilsModule = require(appChat.Users.userPresenceUtils)
local getConversationTimestampModule = require(appChat.Utils.getConversationTimestamp)

return function(p1, p2)
	-- upvalues: cryoModule (ref), fFlagAppChatPresenceStoreMigrationModule (ref), getOtherParticipant (ref), roduxPresenceModule (ref), userPresenceUtilsModule (ref), getConversationTimestampModule (ref), getConversationTitleModule (ref), populateUserIdsWithStateModule (ref), getLastMessageContentModule (ref), getThumbnailsForUserIdsModule (ref), getConversationGameId (ref)
	local participants = p2.participants or {}
	local var1 = cryoModule.List.filter(participants, function(p3)
		-- upvalues: p1 (ref)
		return p3 ~= p1.LocalUserId
	end)
	local var2 = if not (fFlagAppChatPresenceStoreMigrationModule or p2.conversationType ~= "OneToOneConversation") then userPresenceUtilsModule.getUserDisplayPresence(roduxPresenceModule.Selectors.getUserPresenceByUserId(p1, getOtherParticipant(p1, p2.participants))) else nil
	local t = {}
	local users = p1.Users
	
	for i, v in pairs(participants) do
		t[v] = users[v]
	end
	return cryoModule.Dictionary.join({
		id = p2.id,
		title = getConversationTitleModule(p2),
		participants = populateUserIdsWithStateModule(p1, participants),
		otherParticipants = var1,
		isDefaultTitle = p2.isDefaultTitle,
		hasGroupUp = p2.hasGroupUp,
		lastMessageContent = getLastMessageContentModule(p2) or "",
		hasUnreadMessages = p2.hasUnreadMessages or false,
		thumbnails = getThumbnailsForUserIdsModule(var1),
		presenceText = if fFlagAppChatPresenceStoreMigrationModule then nil else var2 and var2.text,
		presenceImage = if fFlagAppChatPresenceStoreMigrationModule then nil else var2 and var2.image,
		gameId = getConversationGameId(p2, p1.LocalUserId, t),
		serverState = p2.serverState,
		moderationType = p2.moderationType,
		userPendingStatus = p2.userPendingStatus,
		conversationType = p2.conversationType,
		osaAcknowledgementStatus = p2.osaAcknowledgementStatus,
		userOptedIntoChatMessages = p2.userOptedIntoChatMessages
	}, {
		shortRelativeTime = p2.lastUpdated and getConversationTimestampModule(p2.lastUpdated),
		longRelativeTime = p2.lastUpdated and p2.lastUpdated:GetLongRelativeTime(),
		unixTime = p2.lastUpdated and p2.lastUpdated:GetUnixTimestamp()
	})
end
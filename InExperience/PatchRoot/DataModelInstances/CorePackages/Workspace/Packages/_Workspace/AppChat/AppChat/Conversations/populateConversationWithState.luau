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

return function(p0, p1)
	-- upvalues: cryoModule (ref), fFlagAppChatPresenceStoreMigrationModule (ref), getOtherParticipant (ref), roduxPresenceModule (ref), userPresenceUtilsModule (ref), getConversationTimestampModule (ref), getConversationTitleModule (ref), populateUserIdsWithStateModule (ref), getLastMessageContentModule (ref), getThumbnailsForUserIdsModule (ref), getConversationGameId (ref)
	local participants = p1.participants or {}
	local var11 = cryoModule.List.filter(participants, function(p2)
		-- upvalues: p0 (ref)
		return p2 ~= p0.LocalUserId
	end)
	local var12 = if not (fFlagAppChatPresenceStoreMigrationModule or p1.conversationType ~= "OneToOneConversation") then userPresenceUtilsModule.getUserDisplayPresence(roduxPresenceModule.Selectors.getUserPresenceByUserId(p0, getOtherParticipant(p0, p1.participants))) else nil
	local t = {}
	local users = p0.Users
	
	for i, v in pairs(participants) do
		t[v] = users[v]
	end
	return cryoModule.Dictionary.join({
		id = p1.id,
		title = getConversationTitleModule(p1),
		participants = populateUserIdsWithStateModule(p0, participants),
		otherParticipants = var11,
		isDefaultTitle = p1.isDefaultTitle,
		hasGroupUp = p1.hasGroupUp,
		lastMessageContent = getLastMessageContentModule(p1) or "",
		hasUnreadMessages = p1.hasUnreadMessages or false,
		thumbnails = getThumbnailsForUserIdsModule(var11),
		presenceText = if fFlagAppChatPresenceStoreMigrationModule then nil else var12 and var12.text,
		presenceImage = if fFlagAppChatPresenceStoreMigrationModule then nil else var12 and var12.image,
		gameId = getConversationGameId(p1, p0.LocalUserId, t),
		serverState = p1.serverState,
		moderationType = p1.moderationType,
		userPendingStatus = p1.userPendingStatus,
		conversationType = p1.conversationType,
		osaAcknowledgementStatus = p1.osaAcknowledgementStatus,
		userOptedIntoChatMessages = p1.userOptedIntoChatMessages
	}, {
		shortRelativeTime = p1.lastUpdated and getConversationTimestampModule(p1.lastUpdated),
		longRelativeTime = p1.lastUpdated and p1.lastUpdated:GetLongRelativeTime(),
		unixTime = p1.lastUpdated and p1.lastUpdated:GetUnixTimestamp()
	})
end
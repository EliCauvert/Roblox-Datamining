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
local userPresenceUtilsModule = require(appChat.Users.userPresenceUtils)
local getConversationTimestampModule = require(appChat.Utils.getConversationTimestamp)

return function(p0, p1) --[[ line: 39 ]]
	-- upvalues: cryoModule (ref), getOtherParticipant (ref), roduxPresenceModule (ref), userPresenceUtilsModule (ref), getConversationTimestampModule (ref), getConversationTitleModule (ref), populateUserIdsWithStateModule (ref), getLastMessageContentModule (ref), getThumbnailsForUserIdsModule (ref), getConversationGameId (ref)
	local participants = p1.participants or {}
	local var10 = cryoModule.List.filter(participants, function(p2) --[[ line: 41 ]]
		-- upvalues: p0 (ref)
		return p2 ~= p0.LocalUserId
	end)
	local var11 = if p1.conversationType == "OneToOneConversation" then userPresenceUtilsModule.getUserDisplayPresence(roduxPresenceModule.Selectors.getUserPresenceByUserId(p0, getOtherParticipant(p0, p1.participants))) else nil
	local t = {}
	local users = p0.Users
	
	for i, v in pairs(participants) do
		t[v] = users[v]
	end
	return cryoModule.Dictionary.join({
		id = p1.id,
		title = getConversationTitleModule(p1),
		participants = populateUserIdsWithStateModule(p0, participants),
		otherParticipants = var10,
		isDefaultTitle = p1.isDefaultTitle,
		hasGroupUp = p1.hasGroupUp,
		lastMessageContent = getLastMessageContentModule(p1) or "",
		hasUnreadMessages = p1.hasUnreadMessages or false,
		thumbnails = getThumbnailsForUserIdsModule(var10),
		presenceText = var11 and var11.text,
		presenceImage = var11 and var11.image,
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
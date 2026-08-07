local _ = require(script:FindFirstAncestor("FriendsChat").Parent.AppChat.GetConversationListStore)
local serializeParticipantIdsForTelemetryModule = require(script.Parent.Parent.App.serializeParticipantIdsForTelemetry)

local function _(p0, p1) --[[ line: 30 | named "indexOfConversation" ]]
	for i, v in p0 do
		if v.id == p1 then
			return i
		end
	end
	return 0
end

return function(p2, p3, p4) --[[ line: 39 | named "getChatLandingConversationInfo" ]]
	-- upvalues: serializeParticipantIdsForTelemetryModule (ref)
	local var2
	local t = {
		isFiltered = p4,
		conversationListCount = #p3,
		selectedConversationId = p2.id
	}
	local id = p2.id
	
	for i, v in p3 do
		if v.id == id then
			var2 = i
			t.selectedIndex = var2
			t.hasUnreadMessages = p2.hasUnreadMessages
			t.selectedConversationModerationType = p2.moderationType
			t.selectedConversationUserPendingStatus = p2.userPendingStatus
			t.participantUserIds = serializeParticipantIdsForTelemetryModule(p2.participants)
			t.osaAcknowledgementStatus = p2.osaAcknowledgementStatus
			
			return t
		end
	end
	var2 = 0
end
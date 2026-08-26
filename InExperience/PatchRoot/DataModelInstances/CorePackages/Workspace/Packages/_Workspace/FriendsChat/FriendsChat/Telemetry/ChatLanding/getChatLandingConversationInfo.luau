local _ = require(script:FindFirstAncestor("FriendsChat").Parent.AppChat.GetConversationListStore)
local serializeParticipantIdsForTelemetryModule = require(script.Parent.Parent.App.serializeParticipantIdsForTelemetry)

local function _(p1, p2)
	for i, v in p1 do
		if v.id == p2 then
			return i
		end
	end
	return 0
end

return function(p3, p4, p5)
	-- upvalues: serializeParticipantIdsForTelemetryModule (ref)
	local var1
	local t = {
		isFiltered = p5,
		conversationListCount = #p4,
		selectedConversationId = p3.id
	}
	local id = p3.id
	
	for i, v in p4 do
		if v.id == id then
			var1 = i
			t.selectedIndex = var1
			t.hasUnreadMessages = p3.hasUnreadMessages
			t.selectedConversationModerationType = p3.moderationType
			t.selectedConversationUserPendingStatus = p3.userPendingStatus
			t.participantUserIds = serializeParticipantIdsForTelemetryModule(p3.participants)
			t.osaAcknowledgementStatus = p3.osaAcknowledgementStatus
			
			return t
		end
	end
	var1 = 0
end
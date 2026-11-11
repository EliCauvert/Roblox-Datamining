local _ = require(script:FindFirstAncestor("FriendsChat").Parent.AppChat.GetConversationListStore)
local SerializeParticipantIdsForTelemetryModule = require(script.Parent.Parent.App.serializeParticipantIdsForTelemetry)

local function _(List, Id)
	for i, value in List do
		if value.id == Id then
			return i
		end
	end
	return 0
end

return function(p1, List, IsFiltered)
	-- upvalues: SerializeParticipantIdsForTelemetryModule (copy)
	local config = {
		isFiltered = IsFiltered,
		conversationListCount = #List,
		selectedConversationId = p1.id
	}
	local Id = p1.id
	local SelectedIndex = 0
	
	for i, value in List do
		if value.id == Id then
			SelectedIndex = i
			break
		end
	end
	config.selectedIndex = SelectedIndex
	config.hasUnreadMessages = p1.hasUnreadMessages
	config.selectedConversationModerationType = p1.moderationType
	config.selectedConversationUserPendingStatus = p1.userPendingStatus
	config.participantUserIds = SerializeParticipantIdsForTelemetryModule(p1.participants)
	config.osaAcknowledgementStatus = p1.osaAcknowledgementStatus
	
	return config
end
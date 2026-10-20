local ExpChatConversationListAdapterModule = require(script.Parent.Parent.ConversationList.ExpChatConversationListAdapter)

local function getParticipantUserIds(p1)
	local List = {}
	local Participants = p1.participants
	
	if Participants == nil then
		return List
	end
	for _, participant in Participants do
		local Number: number? = tonumber(participant)
		
		if Number ~= nil then
			table.insert(List, Number)
		end
	end
	return List
end

return function(p2, _)
	-- upvalues: getParticipantUserIds (copy), ExpChatConversationListAdapterModule (copy)
	return {
		participantUserIds = getParticipantUserIds(p2),
		titleText = ExpChatConversationListAdapterModule.getConversationTitle(p2)
	}
end
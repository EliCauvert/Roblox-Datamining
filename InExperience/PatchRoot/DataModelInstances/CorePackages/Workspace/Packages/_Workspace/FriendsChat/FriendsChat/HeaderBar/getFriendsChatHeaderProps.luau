local expChatConversationListAdapterModule = require(script.Parent.Parent.ConversationList.ExpChatConversationListAdapter)

local function getParticipantUserIds(p1)
	local t = {}
	local participants = p1.participants
	
	if participants == nil then
		return t
	end
	for i, v in participants do
		local var1 = tonumber(v)
		
		if var1 ~= nil then
			table.insert(t, var1)
		end
	end
	return t
end

return function(p2, _)
	-- upvalues: getParticipantUserIds (ref), expChatConversationListAdapterModule (ref)
	return {
		participantUserIds = getParticipantUserIds(p2),
		titleText = expChatConversationListAdapterModule.getConversationTitle(p2)
	}
end
local expChatConversationListAdapterModule = require(script.Parent.Parent.ConversationList.ExpChatConversationListAdapter)

local function getParticipantUserIds(p0) --[[ line: 24 ]]
	local t = {}
	local participants = p0.participants
	
	if participants == nil then
		return t
	end
	for i, v in participants do
		local var3 = tonumber(v)
		
		if var3 ~= nil then
			table.insert(t, var3)
		end
	end
	return t
end

return function(p1, _) --[[ line: 40 | named "getFriendsChatHeaderProps" ]]
	-- upvalues: getParticipantUserIds (ref), expChatConversationListAdapterModule (ref)
	return {
		participantUserIds = getParticipantUserIds(p1),
		titleText = expChatConversationListAdapterModule.getConversationTitle(p1)
	}
end
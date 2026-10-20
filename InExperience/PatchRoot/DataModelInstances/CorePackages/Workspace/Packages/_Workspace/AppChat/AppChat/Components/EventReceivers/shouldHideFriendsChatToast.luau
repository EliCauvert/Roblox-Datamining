local HttpService = game:GetService("HttpService")

local function isOneToOneChatToast(p1): boolean
	local Content = p1.content
	
	if Content == nil or Content.currentState == nil or Content.states == nil then
		return false
	end
	local State = Content.states[Content.currentState]
	
	if State == nil or State.visualItems == nil then
		return false
	end
	local Count = 0
	
	for _, visualItem in State.visualItems do
		if visualItem.thumbnail ~= nil then
			Count += 1
		end
	end
	return Count == 1
end

return function(p2, ConversationId): boolean
	-- upvalues: isOneToOneChatToast (copy), HttpService (copy)
	if p2 == nil or ConversationId == nil then
		return false
	end
	local Content = p2.content
	local ClientEventsPayload = if Content then Content.clientEventsPayload else p2.clientEventsPayload
	local SenderId = ClientEventsPayload and (ClientEventsPayload.sender_id or ClientEventsPayload.sender_userid)
	
	if SenderId ~= nil and isOneToOneChatToast(p2) and ConversationId == `friends:{tostring(SenderId)}` then
		return true
	end
	local ConversationId1 = ClientEventsPayload and ClientEventsPayload.conversation_id
	
	if ConversationId1 == ConversationId then
		return true
	elseif type(ConversationId1) == "string" then
		local Success, Result = pcall(function()
			-- upvalues: HttpService (upval), ConversationId1 (copy)
			return HttpService:JSONDecode(ConversationId1)
		end)
		
		return Success and (type(Result) == "table" and Result.conversationId == ConversationId)
	else
		return false
	end
end
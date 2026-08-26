local httpService = game:GetService("HttpService")

local function isOneToOneChatToast(p1)
	local content = p1.content
	
	if content == nil or content.currentState == nil or content.states == nil then
		return false
	end
	local currentState = content.states[content.currentState]
	
	if currentState == nil or currentState.visualItems == nil then
		return false
	end
	local var1 = 0
	
	for i, v in currentState.visualItems do
		if v.thumbnail ~= nil then
			var1 += 1
		end
	end
	return var1 == 1
end

return function(p2, p3)
	-- upvalues: isOneToOneChatToast (ref), httpService (ref)
	if p2 == nil or p3 == nil then
		return false
	end
	local content = p2.content
	local var2 = if content then content.clientEventsPayload else p2.clientEventsPayload
	local senderId = var2 and (var2.sender_id or var2.sender_userid)
	
	if senderId ~= nil and isOneToOneChatToast(p2) and p3 == `friends:{tostring(senderId)}` then
		return true
	end
	local conversationId = var2 and var2.conversation_id
	
	if conversationId == p3 then
		return true
	elseif type(conversationId) == "string" then
		local ok, status = pcall(function()
			-- upvalues: httpService (copy), conversationId (ref)
			return httpService:JSONDecode(conversationId)
		end)
		
		return ok and (type(status) == "table" and status.conversationId == p3)
	end
	return false
end
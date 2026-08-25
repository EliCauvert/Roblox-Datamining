local httpService = game:GetService("HttpService")

local function isOneToOneChatToast(p0)
	local content = p0.content
	
	if content == nil or content.currentState == nil or content.states == nil then
		return false
	end
	local currentState = content.states[content.currentState]
	
	if currentState == nil or currentState.visualItems == nil then
		return false
	end
	local var2 = 0
	
	for i, v in currentState.visualItems do
		if v.thumbnail ~= nil then
			var2 += 1
		end
	end
	return var2 == 1
end

return function(p1, p2)
	-- upvalues: isOneToOneChatToast (ref), httpService (ref)
	if p1 == nil or p2 == nil then
		return false
	end
	local content = p1.content
	local var3 = if content then content.clientEventsPayload else p1.clientEventsPayload
	local senderId = var3 and (var3.sender_id or var3.sender_userid)
	
	if senderId ~= nil and isOneToOneChatToast(p1) and p2 == `friends:{tostring(senderId)}` then
		return true
	end
	local conversationId = var3 and var3.conversation_id
	
	if conversationId == p2 then
		return true
	elseif type(conversationId) == "string" then
		local ok, status = pcall(function()
			-- upvalues: httpService (copy), conversationId (ref)
			return httpService:JSONDecode(conversationId)
		end)
		
		return ok and (type(status) == "table" and status.conversationId == p2)
	end
	return false
end
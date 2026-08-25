local appChat = script:FindFirstAncestor("AppChat")
local _ = require(appChat.Models.ConversationChannels)
local conversationModule = require(appChat.Models.Conversation)

local function _(value, p0, p1)
	if value[p0] == p1 then
		return value
	end
	local cloned = table.clone(value)
	cloned[p0] = p1
	
	return cloned
end

local function updateConversationMessages(p2, p3, p4)
	local t = {}
	
	for i, v in p2[p4]:CreateIterator() do
		if not p3[p4]:Get(i) then
			table.insert(t, v)
		end
	end
	if #t > 0 then
		p3[p4] = p3[p4]:Insert(table.unpack(t))
	end
end

local _ = function(p5, p6, p7)
	if p6[p7] == nil then
		p6[p7] = p5[p7]
	end
end

return function(p8, p9)
	-- upvalues: conversationModule (ref), updateConversationMessages (ref)
	if p9.conversationType == conversationModule.Type.ONE_TO_ONE_CONVERSATION then
		local var5 = conversationModule.IdForFakeOneOnOne(p9.participants)
		
		if p8[var5] ~= nil and p8[var5] ~= p9 then
			local var6 = p8
			
			if var6[var5] == nil then
				p8 = var6
			else
				local cloned = table.clone(var6)
				cloned[var5] = nil
				p8 = cloned
			end
		end
	end
	local var8
	local id = p9.id
	
	if p8[id] == p9 then
		var8 = p8
	else
		local cloned = table.clone(p8)
		cloned[id] = p9
		var8 = cloned
	end
	local id_1 = p8[p9.id]
	local id_2 = var8[p9.id]
	
	if id_2 and id_1 then
		updateConversationMessages(id_1, id_2, "messages")
		updateConversationMessages(id_1, id_2, "sendingMessages")
		
		if id_2.previousCursor == nil then
			id_2.previousCursor = id_1.previousCursor
		end
		if id_2.nextCursor == nil then
			id_2.nextCursor = id_1.nextCursor
		end
		if id_2.fetchedOldestMessage == nil then
			id_2.fetchedOldestMessage = id_1.fetchedOldestMessage
		end
	end
	return var8
end
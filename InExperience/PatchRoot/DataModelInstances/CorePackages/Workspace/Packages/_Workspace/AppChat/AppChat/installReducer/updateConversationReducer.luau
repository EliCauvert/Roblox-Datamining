local appChat = script:FindFirstAncestor("AppChat")
local _ = require(appChat.Models.ConversationChannels)
local conversationModule = require(appChat.Models.Conversation)

local function _(value, p1, p2)
	if value[p1] == p2 then
		return value
	end
	local cloned = table.clone(value)
	cloned[p1] = p2
	
	return cloned
end

local function updateConversationMessages(p1, p2, p3)
	local t = {}
	
	for i, v in p1[p3]:CreateIterator() do
		if not p2[p3]:Get(i) then
			table.insert(t, v)
		end
	end
	if #t > 0 then
		p2[p3] = p2[p3]:Insert(table.unpack(t))
	end
end

local _ = function(p4, p5, p6)
	if p5[p6] == nil then
		p5[p6] = p4[p6]
	end
end

return function(p4, p5)
	-- upvalues: conversationModule (ref), updateConversationMessages (ref)
	if p5.conversationType == conversationModule.Type.ONE_TO_ONE_CONVERSATION then
		local var1 = conversationModule.IdForFakeOneOnOne(p5.participants)
		
		if p4[var1] ~= nil and p4[var1] ~= p5 then
			local var2 = p4
			
			if var2[var1] == nil then
				p4 = var2
			else
				local cloned = table.clone(var2)
				cloned[var1] = nil
				p4 = cloned
			end
		end
	end
	local var3
	local id = p5.id
	
	if p4[id] == p5 then
		var3 = p4
	else
		local cloned = table.clone(p4)
		cloned[id] = p5
		var3 = cloned
	end
	local id_1 = p4[p5.id]
	local id_2 = var3[p5.id]
	
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
	return var3
end
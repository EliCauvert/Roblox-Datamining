local AppChat = script:FindFirstAncestor("AppChat")
local _ = require(AppChat.Models.ConversationChannels)
local ConversationModule = require(AppChat.Models.Conversation)

local function _(Tbl, Key, p1) --[[ Line: 10 | Named "set" ]]
	if Tbl[Key] == p1 then
		return Tbl
	else
		local Copy = table.clone(Tbl)
		Copy[Key] = p1
		
		return Copy
	end
end

local function updateConversationMessages(p1, InsertResults, Key) --[[ Line: 22 ]]
	local List = {}
	
	for i, value in p1[Key]:CreateIterator() do
		if not InsertResults[Key]:Get(i) then
			table.insert(List, value)
		end
	end
	if #List > 0 then
		InsertResults[Key] = InsertResults[Key]:Insert(table.unpack(List))
	end
end

local _ = function(p2, p3, Key) --[[ Line: 40 | Named "updateConversationField" ]]
	if p3[Key] == nil then
		p3[Key] = p2[Key]
	end
end

return function(p2, p3) --[[ Line: 50 | Named "updateConversationToState" ]]
	-- upvalues: ConversationModule (copy), updateConversationMessages (copy)
	if p3.conversationType == ConversationModule.Type.ONE_TO_ONE_CONVERSATION then
		local IdForFakeOneOnOneResult = ConversationModule.IdForFakeOneOnOne(p3.participants)
		
		if p2[IdForFakeOneOnOneResult] ~= nil and p2[IdForFakeOneOnOneResult] ~= p3 then
			local Tbl = p2
			
			if Tbl[IdForFakeOneOnOneResult] == nil then
				p2 = Tbl
			else
				local Copy = table.clone(Tbl)
				Copy[IdForFakeOneOnOneResult] = nil
				p2 = Copy
			end
		end
	end
	local Tbl1 = p2
	local Id = p3.id
	local Tbl2 = nil
	
	if Tbl1[Id] == p3 then
		Tbl2 = Tbl1
	else
		local Copy = table.clone(Tbl1)
		Copy[Id] = p3
		Tbl2 = Copy
	end
	local v1 = p2[p3.id]
	local Entry = Tbl2[p3.id]
	
	if Entry and v1 then
		updateConversationMessages(v1, Entry, "messages")
		updateConversationMessages(v1, Entry, "sendingMessages")
		
		if Entry.previousCursor == nil then
			Entry.previousCursor = v1.previousCursor
		end
		if Entry.nextCursor == nil then
			Entry.nextCursor = v1.nextCursor
		end
		if Entry.fetchedOldestMessage == nil then
			Entry.fetchedOldestMessage = v1.fetchedOldestMessage
		end
	end
	return Tbl2
end
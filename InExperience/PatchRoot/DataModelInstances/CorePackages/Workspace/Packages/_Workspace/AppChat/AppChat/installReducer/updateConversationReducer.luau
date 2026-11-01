local AppChat = script:FindFirstAncestor("AppChat")
local _ = require(AppChat.Models.ConversationChannels)
local ConversationModule = require(AppChat.Models.Conversation)

local function _(Tbl, Key, p1)
	if Tbl[Key] == p1 then
		return Tbl
	else
		local Copy = table.clone(Tbl)
		Copy[Key] = p1
		
		return Copy
	end
end

local function updateConversationMessages(p1, InsertResults, Key)
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

local _ = function(p2, p3, Key)
	if p3[Key] == nil then
		p3[Key] = p2[Key]
	end
end

return function(Tbl1, p2)
	-- upvalues: ConversationModule (copy), updateConversationMessages (copy)
	if p2.conversationType == ConversationModule.Type.ONE_TO_ONE_CONVERSATION then
		local IdForFakeOneOnOneResult = ConversationModule.IdForFakeOneOnOne(p2.participants)
		
		if Tbl1[IdForFakeOneOnOneResult] ~= nil and Tbl1[IdForFakeOneOnOneResult] ~= p2 then
			local Tbl = Tbl1
			
			if Tbl[IdForFakeOneOnOneResult] == nil then
				Tbl1 = Tbl
			else
				local Copy = table.clone(Tbl)
				Copy[IdForFakeOneOnOneResult] = nil
				Tbl1 = Copy
			end
		end
	end
	local Id = p2.id
	local Tbl2 = nil
	
	if Tbl1[Id] == p2 then
		Tbl2 = Tbl1
	else
		local Copy = table.clone(Tbl1)
		Copy[Id] = p2
		Tbl2 = Copy
	end
	local Entry = Tbl1[p2.id]
	local Entry1 = Tbl2[p2.id]
	
	if Entry1 and Entry then
		updateConversationMessages(Entry, Entry1, "messages")
		updateConversationMessages(Entry, Entry1, "sendingMessages")
		
		if Entry1.previousCursor == nil then
			Entry1.previousCursor = Entry.previousCursor
		end
		if Entry1.nextCursor == nil then
			Entry1.nextCursor = Entry.nextCursor
		end
		if Entry1.fetchedOldestMessage == nil then
			Entry1.fetchedOldestMessage = Entry.fetchedOldestMessage
		end
	end
	return Tbl2
end
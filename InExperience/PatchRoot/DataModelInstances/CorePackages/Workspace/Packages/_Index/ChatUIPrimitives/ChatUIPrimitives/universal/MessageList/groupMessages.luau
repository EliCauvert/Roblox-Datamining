local UnpackContentModule = require(script.Parent.Parent.ContentKinds.unpackContent)
local _ = require(script.Parent.projectMessageEnvelope)
local GetReplyPreviewModule = require(script.Parent.Reply.getReplyPreview)
local IsSystemMessageFunction = require(script.Parent.Parent.ContentKinds.System.SystemContentModel).isSystemMessage

local function _(p1, p2): boolean
	local Author = p1.author
	local Author1 = p2.author
	
	return Author ~= nil and Author1 ~= nil and Author.userId == Author1.userId
end

local function getGroupBreakReason(p1, p2, p3, p4, p5, p6)
	-- upvalues: IsSystemMessageFunction (copy), GetReplyPreviewModule (copy)
	if p6 ~= nil and p2 ~= nil and not IsSystemMessageFunction(p3) and p6 <= p3.sentAtUnixMilliseconds - p2.sentAtUnixMilliseconds then
		return "time"
	elseif IsSystemMessageFunction(p1) or IsSystemMessageFunction(p3) then
		return "system"
	else
		local Author = p1.author
		local Author1 = p3.author
		local IsUserIdMatch: boolean = Author ~= nil and Author1 ~= nil and Author.userId == Author1.userId
		
		return if IsUserIdMatch then if GetReplyPreviewModule.getReplyText(p3) == nil then if p5 == nil or p5 > p4 then nil else "count" else "reply" else "sender"
	end
end

local _ = function(p1): boolean
	-- upvalues: UnpackContentModule (copy)
	local Contents = p1.contents
	
	if type(Contents) ~= "table" then
		return false
	end
	for _, content in Contents do
		if UnpackContentModule(content) ~= nil then
			return true
		end
	end
	return false
end

local function orderedMessages(List)
	-- upvalues: UnpackContentModule (copy)
	local List1 = {}
	local Flag = nil
	
	for _, value in List do
		if type(value) == "table" then
			local Contents = value.contents
			
			if type(Contents) == "table" then
				Flag = false
				
				for _, content in Contents do
					if UnpackContentModule(content) ~= nil then
						Flag = true
						break
					end
				end
			else
				Flag = false
			end
			if Flag then
				table.insert(List1, value)
			end
		end
	end
	table.sort(List1, function(A, B): boolean
		return if A.sentAtUnixMilliseconds == B.sentAtUnixMilliseconds then A.id < B.id else A.sentAtUnixMilliseconds < B.sentAtUnixMilliseconds
	end)
	
	return List1
end

local _ = function(List)
	local t = {}
	
	if List == nil then
		return t
	end
	for _, value in List do
		t[value.id] = value
	end
	return t
end

local function messageRow(p2, Message, IsFirst, IsLast)
	local v1 = p2[Message.id]
	
	return if v1 == nil or v1.kind ~= "message" or v1.message ~= Message or v1.groupPosition.isFirst ~= IsFirst or v1.groupPosition.isLast ~= IsLast then {
		kind = "message",
		id = Message.id,
		message = Message,
		groupPosition = { isFirst = IsFirst, isLast = IsLast }
	} else v1
end

local _ = function(p2, Message)
	local v1 = p2[Message.id]
	
	return if v1 == nil or v1.kind ~= "system" or v1.message ~= Message then { kind = "system", id = Message.id, message = Message } else v1
end

local _ = function(List, p2, Message, IsFirst, IsLast)
	-- upvalues: IsSystemMessageFunction (copy), messageRow (copy)
	if IsSystemMessageFunction(Message) then
		local v1 = p2[Message.id]
		table.insert(List, if v1 == nil or v1.kind ~= "system" or v1.message ~= Message then { kind = "system", id = Message.id, message = Message } else v1)
		
		return
	else
		table.insert(List, (messageRow(p2, Message, IsFirst, IsLast)))
	end
end

local function timestampRow(p2, p3, p4)
	local TimestampName: string = `timestamp:{p3.id}`
	local SentAtUnixMilliseconds = if p4 == nil then nil else p4.sentAtUnixMilliseconds
	local v1 = p2[TimestampName]
	
	return if v1 == nil or v1.kind ~= "timestamp" or v1.displayUnixMilliseconds ~= p3.sentAtUnixMilliseconds or v1.referenceUnixMilliseconds ~= SentAtUnixMilliseconds then {
		kind = "timestamp",
		id = TimestampName,
		displayUnixMilliseconds = p3.sentAtUnixMilliseconds,
		referenceUnixMilliseconds = SentAtUnixMilliseconds
	} else v1
end

local _ = function(p2, List)
	if p2 == nil or #p2 ~= #List then
		return List
	end
	for i, value in List do
		if p2[i] ~= value then
			return List
		end
	end
	return p2
end

return {
	groupMessages = function(p3, p4, p5, List)
		-- upvalues: orderedMessages (copy), IsSystemMessageFunction (copy), messageRow (copy), timestampRow (copy), getGroupBreakReason (copy)
		local OrderedMessagesResult = orderedMessages(p3)
		local t = {}
		local t1 = nil
		
		if List == nil then
			t1 = t
		else
			for _, value in List do
				t[value.id] = value
			end
			t1 = t
		end
		local List1 = {}
		local v1 = 1
		
		local function appendGroup(Count: number)
			-- upvalues: v1 (ref), OrderedMessagesResult (copy), List1 (copy), t1 (copy), IsSystemMessageFunction (upval), messageRow (upval)
			local NewCount = Count - v1 + 1
			
			for i = 0, NewCount - 1 do
				local OrderedMessagesResultEntry = OrderedMessagesResult[v1 + i]
				local IsIMatch = i == 0
				local IsIMatch1 = i == NewCount - 1
				
				if IsSystemMessageFunction(OrderedMessagesResultEntry) then
					local Entry = t1[OrderedMessagesResultEntry.id]
					table.insert(List1, if Entry == nil or Entry.kind ~= "system" or Entry.message ~= OrderedMessagesResultEntry then {
						kind = "system",
						id = OrderedMessagesResultEntry.id,
						message = OrderedMessagesResultEntry
					} else Entry)
				else
					table.insert(List1, (messageRow(t1, OrderedMessagesResultEntry, IsIMatch, IsIMatch1)))
				end
			end
		end
		
		local function _(p6, p7)
			-- upvalues: List1 (copy), timestampRow (upval), t1 (copy)
			table.insert(List1, (timestampRow(t1, p6, p7)))
		end
		
		local OrderedMessagesResultEntry = if #OrderedMessagesResult > 0 and not IsSystemMessageFunction(OrderedMessagesResult[1]) then OrderedMessagesResult[1] else nil
		for i = 2, #OrderedMessagesResult do
			local OrderedMessagesResultEntry1 = OrderedMessagesResult[i]
			local GroupBreakReason = getGroupBreakReason(OrderedMessagesResult[i - 1], OrderedMessagesResultEntry, OrderedMessagesResultEntry1, i - v1, p4, p5)
			
			if GroupBreakReason ~= nil then
				appendGroup(i - 1)
				
				if GroupBreakReason == "time" then
					table.insert(List1, (timestampRow(t1, OrderedMessagesResultEntry1, OrderedMessagesResultEntry)))
				end
				v1 = i
			end
			if not IsSystemMessageFunction(OrderedMessagesResultEntry1) then
				OrderedMessagesResultEntry = OrderedMessagesResultEntry1
			end
		end
		if #OrderedMessagesResult > 0 then
			appendGroup(#OrderedMessagesResult)
		end
		local List2 = nil
		if List == nil or #List ~= #List1 then
			List2 = List1
		else
			for i1, value1 in List1 do
				if List[i1] ~= value1 then
					List2 = List1
				else
					continue
				end
			end
			List2 = List
		end
		return List2
	end,
	ungroupedRows = function(p6, List)
		-- upvalues: orderedMessages (copy), IsSystemMessageFunction (copy), messageRow (copy)
		local OrderedMessagesResult = orderedMessages(p6)
		local t = {}
		local t2 = nil
		
		if List == nil then
			t2 = t
		else
			for _, value in List do
				t[value.id] = value
			end
			t2 = t
		end
		local List1 = {}
		
		for _, Message in OrderedMessagesResult do
			if IsSystemMessageFunction(Message) then
				local Entry = t2[Message.id]
				table.insert(List1, if Entry == nil or Entry.kind ~= "system" or Entry.message ~= Message then { kind = "system", id = Message.id, message = Message } else Entry)
			else
				table.insert(List1, (messageRow(t2, Message, true, true)))
			end
		end
		if List == nil or #List ~= #List1 then
			return List1
		end
		for i, value1 in List1 do
			if List[i] ~= value1 then
				return List1
			end
		end
		return List
	end
}
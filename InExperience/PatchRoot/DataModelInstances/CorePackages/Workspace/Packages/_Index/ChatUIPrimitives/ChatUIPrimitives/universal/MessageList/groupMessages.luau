local UnpackContentModule = require(script.Parent.Parent.ContentKinds.unpackContent)
local _ = require(script.Parent.projectMessageEnvelope)

local function _(p1, p2): boolean --[[ Line: 33 | Named "sameSender" ]]
	local Author = p1.author
	local Author1 = p2.author
	
	return Author ~= nil and Author1 ~= nil and Author.userId == Author1.userId
end

local _ = function(p1, p2, p3, p4, p5) --[[ Line: 44 | Named "getGroupBreakReason" ]]
	if p5 == nil or p5 > p2.sentAtUnixMilliseconds - p1.sentAtUnixMilliseconds then
		local Author = p1.author
		local Author1 = p2.author
		local IsUserIdMatch: boolean = Author ~= nil and Author1 ~= nil and Author.userId == Author1.userId
		
		return if IsUserIdMatch then if p4 == nil or p4 > p3 then nil else "count" else "sender"
	else
		return "time"
	end
end

local _ = function(p1): boolean --[[ Line: 65 | Named "hasRenderableContent" ]]
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

local function orderedMessages(List) --[[ Line: 78 ]]
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
	table.sort(List1, function(A, B): boolean --[[ Line: 85 ]]
		return if A.sentAtUnixMilliseconds == B.sentAtUnixMilliseconds then A.id < B.id else A.sentAtUnixMilliseconds < B.sentAtUnixMilliseconds
	end)
	
	return List1
end

local _ = function(List) --[[ Line: 94 | Named "indexPrevious" ]]
	local t = {}
	
	if List == nil then
		return t
	end
	for _, value in List do
		t[value.id] = value
	end
	return t
end

local function messageRow(p2, Message, IsFirst, IsLast) --[[ Line: 109 ]]
	local v1 = p2[Message.id]
	
	return if v1 == nil or v1.kind ~= "message" or v1.message ~= Message or v1.groupPosition.isFirst ~= IsFirst or v1.groupPosition.isLast ~= IsLast then {
		kind = "message",
		id = Message.id,
		message = Message,
		groupPosition = { isFirst = IsFirst, isLast = IsLast }
	} else v1
end

local function timestampRow(p2, p3, p4) --[[ Line: 133 ]]
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

local _ = function(p2, List) --[[ Line: 153 | Named "finish" ]]
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
	groupMessages = function(p3, p4, p5, List) --[[ Line: 175 ]]
		-- upvalues: orderedMessages (copy), messageRow (copy), timestampRow (copy)
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
		
		local function appendGroup(Count: number) --[[ Line: 186 ]]
			-- upvalues: v1 (ref), OrderedMessagesResult (copy), List1 (copy), messageRow (upval), t1 (copy)
			local NewCount = Count - v1 + 1
			
			for i = 0, NewCount - 1 do
				table.insert(List1, (messageRow(t1, OrderedMessagesResult[v1 + i], i == 0, i == NewCount - 1)))
			end
		end
		
		local function _(p6, p7) --[[ Line: 194 | Named "appendTimestamp" ]]
			-- upvalues: List1 (copy), timestampRow (upval), t1 (copy)
			table.insert(List1, (timestampRow(t1, p6, p7)))
		end
		
		for i = 2, #OrderedMessagesResult do
			local IDelta = i - v1
			local OrderedMessagesResultEntry = OrderedMessagesResult[i - 1]
			local OrderedMessagesResultEntry1 = OrderedMessagesResult[i]
			local Count = nil
			
			if p5 == nil or p5 > OrderedMessagesResultEntry1.sentAtUnixMilliseconds - OrderedMessagesResultEntry.sentAtUnixMilliseconds then
				local Author = OrderedMessagesResultEntry.author
				local Author1 = OrderedMessagesResultEntry1.author
				Count = if Author ~= nil and Author1 ~= nil and Author.userId == Author1.userId then if p4 == nil or p4 > IDelta then nil else "count" else "sender"
			else
				Count = "time"
			end
			if Count ~= nil then
				appendGroup(i - 1)
				
				if Count == "time" then
					table.insert(List1, (timestampRow(t1, OrderedMessagesResult[i], OrderedMessagesResult[i - 1])))
				end
				v1 = i
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
	ungroupedRows = function(p6, List) --[[ Line: 165 ]]
		-- upvalues: orderedMessages (copy), messageRow (copy)
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
		local Buffer = table.create(#OrderedMessagesResult)
		
		for i, value1 in OrderedMessagesResult do
			Buffer[i] = messageRow(t2, value1, true, true)
		end
		if List == nil or #List ~= #Buffer then
			return Buffer
		end
		for i1, value2 in Buffer do
			if List[i1] ~= value2 then
				return Buffer
			end
		end
		return List
	end
}
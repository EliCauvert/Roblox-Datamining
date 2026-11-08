local SignalsModule = require(script:FindFirstAncestor("TextChannelWindow").Parent.Signals)
local _ = require(script.Parent.Message)

return function(p1)
	-- upvalues: SignalsModule (copy)
	local t = {}
	
	local function getOrCreate(Key)
		-- upvalues: t (copy), SignalsModule (upval)
		if not t[Key] then
			local Signal, Signal2 = SignalsModule.createSignal({})
			local Signal1, Signal2_1 = SignalsModule.createSignal({})
			t[Key] = {
				getByMessageId = Signal,
				setByMessageId = Signal2,
				getOrderedIds = Signal1,
				setOrderedIds = Signal2_1,
				getMessages = SignalsModule.createComputed(function(p2)
					-- upvalues: Signal1 (copy), Signal (copy)
					local SignalResult = Signal1(p2)
					local SignalResult1 = Signal(p2)
					local Buffer = table.create(#SignalResult)
					
					for _, value in SignalResult do
						local SignalResultEntry = SignalResult1[value]
						
						if SignalResultEntry then
							table.insert(Buffer, SignalResultEntry)
						end
					end
					return Buffer
				end),
				messageGetters = {}
			}
		end
		return t[Key]
	end
	
	local function upsertMessage(p2, p3)
		-- upvalues: getOrCreate (copy)
		local OrCreate = getOrCreate(p2)
		local MessageId = p3.messageId
		OrCreate.setByMessageId(function(Tbl)
			-- upvalues: MessageId (copy), p3 (copy)
			local Copy = table.clone(Tbl)
			Copy[MessageId] = p3
			
			return Copy
		end)
		local List = {}
		OrCreate.setOrderedIds(function(Tbl)
			-- upvalues: MessageId (copy), List (copy)
			for _, value in Tbl do
				if value == MessageId then
					return Tbl
				end
			end
			local Copy = table.clone(Tbl)
			table.insert(Copy, MessageId)
			
			if #Copy <= 200 then
				return Copy
			end
			local Buffer = table.create(200)
			table.move(Copy, #Copy - 200 + 1, #Copy, 1, Buffer)
			
			if List then
				for i = 1, #Copy - 200 do
					table.insert(List, Copy[i])
				end
			end
			return Buffer
		end)
		
		if List and #List > 0 then
			OrCreate.setByMessageId(function(Tbl)
				-- upvalues: List (copy)
				local Copy = table.clone(Tbl)
				
				for _, value in List do
					Copy[value] = nil
				end
				return Copy
			end)
			
			for _, value in List do
				OrCreate.messageGetters[value] = nil
			end
		end
	end
	
	local function _(p4): boolean
		return p4 ~= nil and p4.isHistorical == true
	end
	
	return {
		insertHistorical = function(p4, List)
			-- upvalues: p1 (copy), getOrCreate (copy)
			local HistoryArm = if p1 and p1.getHistoryArm then p1.getHistoryArm() else nil
			
			if not HistoryArm or #List == 0 then return end
			local OrCreate = getOrCreate(p4)
			local ByMessageId = OrCreate.getByMessageId(false)
			local OrderedIds = OrCreate.getOrderedIds(false)
			local Count = 0
			
			for _, orderedId in OrderedIds do
				local ByMessageIdEntry = ByMessageId[orderedId]
				
				if ByMessageIdEntry == nil or ByMessageIdEntry.isHistorical ~= true then break end
				Count += 1
			end
			local Elapsed = if HistoryArm.maxAgeSeconds > 0 then workspace:GetServerTimeNow() - HistoryArm.maxAgeSeconds else nil
			local List1 = {}
			local t = {}
			
			for _, value in List do
				local MessageId = value.messageId
				
				if ByMessageId[MessageId] == nil and not t[MessageId] then
					t[MessageId] = true
					
					if value.content ~= "" and (not Elapsed or value.timestamp.UnixTimestamp >= Elapsed) then
						table.insert(List1, value)
					end
				end
			end
			if #List1 == 0 then return end
			local v1 = #OrderedIds - Count
			local Largest = math.max(0, (math.min(HistoryArm.maxCount, 200 - v1)))
			local MoveResult = table.move(OrderedIds, 1, Count, 1, table.create(Count + #List1))
			
			for _, value1 in List1 do
				table.insert(MoveResult, value1.messageId)
			end
			local Largest1 = math.max(0, #MoveResult - Largest)
			local MoveResult1 = table.move(MoveResult, 1, Largest1, 1, table.create(Largest1))
			local MoveResult2 = table.move(MoveResult, Largest1 + 1, #MoveResult, 1, table.create(Largest + v1))
			table.move(OrderedIds, Count + 1, #OrderedIds, #MoveResult2 + 1, MoveResult2)
			OrCreate.setByMessageId(function(Tbl)
				-- upvalues: List1 (copy), MoveResult1 (copy)
				local Copy = table.clone(Tbl)
				
				for _, value in List1 do
					Copy[value.messageId] = value
				end
				for _, value1 in MoveResult1 do
					Copy[value1] = nil
				end
				return Copy
			end)
			OrCreate.setOrderedIds(function()
				-- upvalues: MoveResult2 (copy)
				return MoveResult2
			end)
			
			for _, value2 in MoveResult1 do
				OrCreate.messageGetters[value2] = nil
			end
			if p1 and p1.logHistoryExposure then
				p1.logHistoryExposure()
			end
		end,
		upsertMessage = upsertMessage,
		removeMessage = function(p5, Value)
			-- upvalues: getOrCreate (copy)
			local OrCreate = getOrCreate(p5)
			OrCreate.setByMessageId(function(Tbl)
				-- upvalues: Value (copy)
				if Tbl[Value] == nil then
					return Tbl
				else
					local Copy = table.clone(Tbl)
					Copy[Value] = nil
					
					return Copy
				end
			end)
			OrCreate.setOrderedIds(function(List)
				-- upvalues: Value (copy)
				local FoundIndex: number? = table.find(List, Value)
				
				if FoundIndex then
					local Copy = table.clone(List)
					table.remove(Copy, FoundIndex)
					
					return Copy
				else
					return List
				end
			end)
		end,
		insertIfAbsent = function(p5, p6)
			-- upvalues: getOrCreate (copy), upsertMessage (copy)
			if getOrCreate(p5).getByMessageId(false)[p6.messageId] == nil then
				upsertMessage(p5, p6)
				
				return
			end
		end,
		removeChannelEntry = function(Key)
			-- upvalues: t (copy)
			t[Key] = nil
		end,
		clearChannel = function(p5)
			-- upvalues: t (copy)
			local Entry = t[p5]
			
			if Entry then
				Entry.setByMessageId(function()
					return {}
				end)
				Entry.setOrderedIds(function()
					return {}
				end)
				table.clear(Entry.messageGetters)
				
				return
			end
		end,
		getMessagesForChannel = function(p5)
			-- upvalues: getOrCreate (copy)
			return getOrCreate(p5).getMessages
		end,
		getMessageById = function(p5, p6)
			-- upvalues: getOrCreate (copy), SignalsModule (upval)
			local OrCreate = getOrCreate(p5)
			
			if not OrCreate.messageGetters[p6] then
				OrCreate.messageGetters[p6] = SignalsModule.createComputed(function(p7)
					-- upvalues: OrCreate (copy), p6 (copy)
					return OrCreate.getByMessageId(p7)[p6]
				end)
			end
			return OrCreate.messageGetters[p6]
		end
	}
end
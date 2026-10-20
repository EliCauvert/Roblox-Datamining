local SignalsModule = require(script:FindFirstAncestor("TextChannelWindow").Parent.Signals)
local _ = require(script.Parent.Message)

return function()
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
				getMessages = SignalsModule.createComputed(function(p1)
					-- upvalues: Signal1 (copy), Signal (copy)
					local SignalResult = Signal1(p1)
					local SignalResult1 = Signal(p1)
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
	
	local function upsertMessage(p1, p2)
		-- upvalues: getOrCreate (copy)
		local OrCreate = getOrCreate(p1)
		local MessageId = p2.messageId
		OrCreate.setByMessageId(function(Tbl)
			-- upvalues: MessageId (copy), p2 (copy)
			local Copy = table.clone(Tbl)
			Copy[MessageId] = p2
			
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
	
	return {
		upsertMessage = upsertMessage,
		removeMessage = function(p3, Value)
			-- upvalues: getOrCreate (copy)
			local OrCreate = getOrCreate(p3)
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
		insertIfAbsent = function(p3, p4)
			-- upvalues: getOrCreate (copy), upsertMessage (copy)
			if getOrCreate(p3).getByMessageId(false)[p4.messageId] == nil then
				upsertMessage(p3, p4)
				
				return
			end
		end,
		removeChannelEntry = function(Key)
			-- upvalues: t (copy)
			t[Key] = nil
		end,
		clearChannel = function(p3)
			-- upvalues: t (copy)
			local Entry = t[p3]
			
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
		getMessagesForChannel = function(p3)
			-- upvalues: getOrCreate (copy)
			return getOrCreate(p3).getMessages
		end,
		getMessageById = function(p3, p4)
			-- upvalues: getOrCreate (copy), SignalsModule (upval)
			local OrCreate = getOrCreate(p3)
			
			if not OrCreate.messageGetters[p4] then
				OrCreate.messageGetters[p4] = SignalsModule.createComputed(function(p5)
					-- upvalues: OrCreate (copy), p4 (copy)
					return OrCreate.getByMessageId(p5)[p4]
				end)
			end
			return OrCreate.messageGetters[p4]
		end
	}
end
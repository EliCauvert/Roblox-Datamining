local signalsModule = require(script:FindFirstAncestor("TextChannelWindow").Parent.Signals)
local _ = require(script.Parent.Message)
local fFlagExpChatTrimMessageStoreModule = require(script.Parent.Flags.FFlagExpChatTrimMessageStore)

return function() --[[ line: 45 | named "createChannelMessagesStore" ]]
	-- upvalues: signalsModule (ref), fFlagExpChatTrimMessageStoreModule (ref)
	local t = {}
	
	local function getOrCreate(p0) --[[ line: 49 ]]
		-- upvalues: t (ref), signalsModule (copy)
		if not t[p0] then
			local var5, var6 = signalsModule.createSignal({})
			local var7, var8 = signalsModule.createSignal({})
			t[p0] = {
				getByMessageId = var5,
				setByMessageId = var6,
				getOrderedIds = var7,
				setOrderedIds = var8,
				getMessages = signalsModule.createComputed(function(p1) --[[ line: 54 ]]
					-- upvalues: var7 (ref), var5 (ref)
					local var9 = var7(p1)
					local var10 = var5(p1)
					local list = table.create(#var9)
					
					for i, v in var9 do
						local var12 = var10[v]
						
						if var12 then
							table.insert(list, var12)
						end
					end
					return list
				end),
				messageGetters = {}
			}
		end
		return t[p0]
	end
	
	local function upsertMessage(p2, p3) --[[ line: 79 ]]
		-- upvalues: getOrCreate (ref), fFlagExpChatTrimMessageStoreModule (copy)
		local var13 = getOrCreate(p2)
		local messageId = p3.messageId
		var13.setByMessageId(function(p4) --[[ line: 83 ]]
			-- upvalues: messageId (ref), p3 (ref)
			local cloned = table.clone(p4)
			cloned[messageId] = p3
			
			return cloned
		end)
		local var14 = if fFlagExpChatTrimMessageStoreModule then {} else nil
		var13.setOrderedIds(function(p5) --[[ line: 90 ]]
			-- upvalues: messageId (ref), var14 (ref)
			for i, v in p5 do
				if v == messageId then
					return p5
				end
			end
			local cloned = table.clone(p5)
			table.insert(cloned, messageId)
			
			if #cloned <= 200 then
				return cloned
			end
			local list = table.create(200)
			table.move(cloned, #cloned - 200 + 1, #cloned, 1, list)
			
			if var14 then
				for v = 1, #cloned - 200 do
					table.insert(var14, cloned[v])
				end
			end
			return list
		end)
		
		if var14 and #var14 > 0 then
			var13.setByMessageId(function(p6) --[[ line: 114 ]]
				-- upvalues: var14 (ref)
				local cloned = table.clone(p6)
				
				for i, v in var14 do
					cloned[v] = nil
				end
				return cloned
			end)
			
			for i, v in var14 do
				var13.messageGetters[v] = nil
			end
		end
	end
	
	return {
		upsertMessage = upsertMessage,
		removeMessage = function(p7, p8) --[[ line: 127 ]]
			-- upvalues: getOrCreate (ref)
			local var19 = getOrCreate(p7)
			var19.setByMessageId(function(p9) --[[ line: 130 ]]
				-- upvalues: p8 (ref)
				if p9[p8] == nil then
					return p9
				end
				local cloned = table.clone(p9)
				cloned[p8] = nil
				
				return cloned
			end)
			var19.setOrderedIds(function(p10) --[[ line: 139 ]]
				-- upvalues: p8 (ref)
				local index = table.find(p10, p8)
				
				if index then
					local cloned = table.clone(p10)
					table.remove(cloned, index)
					
					return cloned
				end
				return p10
			end)
		end,
		insertIfAbsent = function(value, p11) --[[ line: 150 ]]
			-- upvalues: getOrCreate (ref), upsertMessage (ref)
			if getOrCreate(value).getByMessageId(false)[p11.messageId] == nil then
				upsertMessage(value, p11)
				
				return
			end
		end,
		removeChannelEntry = function(p12) --[[ line: 158 ]]
			-- upvalues: t (ref)
			t[p12] = nil
		end,
		clearChannel = function(p13) --[[ line: 162 ]]
			-- upvalues: t (ref)
			local var23 = t[p13]
			
			if var23 then
				var23.setByMessageId(function() --[[ line: 167 ]]
					return {}
				end)
				var23.setOrderedIds(function() --[[ line: 170 ]]
					return {}
				end)
				table.clear(var23.messageGetters)
				
				return
			end
		end,
		getMessagesForChannel = function(p14) --[[ line: 176 ]]
			-- upvalues: getOrCreate (ref)
			return getOrCreate(p14).getMessages
		end,
		getMessageById = function(p15, p16) --[[ line: 180 ]]
			-- upvalues: getOrCreate (ref), signalsModule (copy)
			local var24 = getOrCreate(p15)
			
			if not var24.messageGetters[p16] then
				var24.messageGetters[p16] = signalsModule.createComputed(function(p17) --[[ line: 183 ]]
					-- upvalues: var24 (ref), p16 (ref)
					return var24.getByMessageId(p17)[p16]
				end)
			end
			return var24.messageGetters[p16]
		end
	}
end
local signalsModule = require(script:FindFirstAncestor("TextChannelWindow").Parent.Signals)
local _ = require(script.Parent.Message)

return function() --[[ line: 42 | named "createChannelMessagesStore" ]]
	-- upvalues: signalsModule (ref)
	local t = {}
	
	local function getOrCreate(p0) --[[ line: 46 ]]
		-- upvalues: t (ref), signalsModule (copy)
		if not t[p0] then
			local var4, var5 = signalsModule.createSignal({})
			local var6, var7 = signalsModule.createSignal({})
			t[p0] = {
				getByMessageId = var4,
				setByMessageId = var5,
				getOrderedIds = var6,
				setOrderedIds = var7,
				getMessages = signalsModule.createComputed(function(p1) --[[ line: 51 ]]
					-- upvalues: var6 (ref), var4 (ref)
					local var8 = var6(p1)
					local var9 = var4(p1)
					local list = table.create(#var8)
					
					for i, v in var8 do
						local var11 = var9[v]
						
						if var11 then
							table.insert(list, var11)
						end
					end
					return list
				end),
				messageGetters = {}
			}
		end
		return t[p0]
	end
	
	local function upsertMessage(p2, p3) --[[ line: 76 ]]
		-- upvalues: getOrCreate (ref)
		local var12 = getOrCreate(p2)
		local messageId = p3.messageId
		var12.setByMessageId(function(p4) --[[ line: 80 ]]
			-- upvalues: messageId (ref), p3 (ref)
			local cloned = table.clone(p4)
			cloned[messageId] = p3
			
			return cloned
		end)
		var12.setOrderedIds(function(p5) --[[ line: 86 ]]
			-- upvalues: messageId (ref)
			for i, v in p5 do
				if v == messageId then
					return p5
				end
			end
			local cloned = table.clone(p5)
			table.insert(cloned, messageId)
			
			if #cloned > 200 then
				local list = table.create(200)
				table.move(cloned, #cloned - 200 + 1, #cloned, 1, list)
				
				return list
			end
			return cloned
		end)
	end
	
	return {
		upsertMessage = upsertMessage,
		removeMessage = function(p6, p7) --[[ line: 103 ]]
			-- upvalues: getOrCreate (ref)
			local var16 = getOrCreate(p6)
			var16.setByMessageId(function(p8) --[[ line: 106 ]]
				-- upvalues: p7 (ref)
				if p8[p7] == nil then
					return p8
				end
				local cloned = table.clone(p8)
				cloned[p7] = nil
				
				return cloned
			end)
			var16.setOrderedIds(function(p9) --[[ line: 115 ]]
				-- upvalues: p7 (ref)
				local index = table.find(p9, p7)
				
				if index then
					local cloned = table.clone(p9)
					table.remove(cloned, index)
					
					return cloned
				end
				return p9
			end)
		end,
		insertIfAbsent = function(value, p10) --[[ line: 126 ]]
			-- upvalues: getOrCreate (ref), upsertMessage (ref)
			if getOrCreate(value).getByMessageId(false)[p10.messageId] == nil then
				upsertMessage(value, p10)
				
				return
			end
		end,
		getMessagesForChannel = function(p11) --[[ line: 134 ]]
			-- upvalues: getOrCreate (ref)
			return getOrCreate(p11).getMessages
		end,
		getMessageById = function(p12, p13) --[[ line: 138 ]]
			-- upvalues: getOrCreate (ref), signalsModule (copy)
			local var20 = getOrCreate(p12)
			
			if not var20.messageGetters[p13] then
				var20.messageGetters[p13] = signalsModule.createComputed(function(p14) --[[ line: 141 ]]
					-- upvalues: var20 (ref), p13 (ref)
					return var20.getByMessageId(p14)[p13]
				end)
			end
			return var20.messageGetters[p13]
		end
	}
end
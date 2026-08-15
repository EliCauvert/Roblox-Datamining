local signalsModule = require(script:FindFirstAncestor("TextChannelWindow").Parent.Signals)
local _ = require(script.Parent.Message)

return function() --[[ line: 44 | named "createChannelMessagesStore" ]]
	-- upvalues: signalsModule (ref)
	local t = {}
	
	local function getOrCreate(p0) --[[ line: 48 ]]
		-- upvalues: t (ref), signalsModule (copy)
		if not t[p0] then
			local var4, var5 = signalsModule.createSignal({})
			local var6, var7 = signalsModule.createSignal({})
			t[p0] = {
				getByMessageId = var4,
				setByMessageId = var5,
				getOrderedIds = var6,
				setOrderedIds = var7,
				getMessages = signalsModule.createComputed(function(p1) --[[ line: 53 ]]
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
	
	local function upsertMessage(p2, p3) --[[ line: 78 ]]
		-- upvalues: getOrCreate (ref)
		local var12 = getOrCreate(p2)
		local messageId = p3.messageId
		var12.setByMessageId(function(p4) --[[ line: 82 ]]
			-- upvalues: messageId (ref), p3 (ref)
			local cloned = table.clone(p4)
			cloned[messageId] = p3
			
			return cloned
		end)
		var12.setOrderedIds(function(p5) --[[ line: 88 ]]
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
		removeMessage = function(p6, p7) --[[ line: 105 ]]
			-- upvalues: getOrCreate (ref)
			local var16 = getOrCreate(p6)
			var16.setByMessageId(function(p8) --[[ line: 108 ]]
				-- upvalues: p7 (ref)
				if p8[p7] == nil then
					return p8
				end
				local cloned = table.clone(p8)
				cloned[p7] = nil
				
				return cloned
			end)
			var16.setOrderedIds(function(p9) --[[ line: 117 ]]
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
		insertIfAbsent = function(value, p10) --[[ line: 128 ]]
			-- upvalues: getOrCreate (ref), upsertMessage (ref)
			if getOrCreate(value).getByMessageId(false)[p10.messageId] == nil then
				upsertMessage(value, p10)
				
				return
			end
		end,
		removeChannelEntry = function(p11) --[[ line: 136 ]]
			-- upvalues: t (ref)
			t[p11] = nil
		end,
		clearChannel = function(p12) --[[ line: 140 ]]
			-- upvalues: t (ref)
			local var20 = t[p12]
			
			if var20 then
				var20.setByMessageId(function() --[[ line: 145 ]]
					return {}
				end)
				var20.setOrderedIds(function() --[[ line: 148 ]]
					return {}
				end)
				table.clear(var20.messageGetters)
				
				return
			end
		end,
		getMessagesForChannel = function(p13) --[[ line: 154 ]]
			-- upvalues: getOrCreate (ref)
			return getOrCreate(p13).getMessages
		end,
		getMessageById = function(p14, p15) --[[ line: 158 ]]
			-- upvalues: getOrCreate (ref), signalsModule (copy)
			local var21 = getOrCreate(p14)
			
			if not var21.messageGetters[p15] then
				var21.messageGetters[p15] = signalsModule.createComputed(function(p16) --[[ line: 161 ]]
					-- upvalues: var21 (ref), p15 (ref)
					return var21.getByMessageId(p16)[p15]
				end)
			end
			return var21.messageGetters[p15]
		end
	}
end
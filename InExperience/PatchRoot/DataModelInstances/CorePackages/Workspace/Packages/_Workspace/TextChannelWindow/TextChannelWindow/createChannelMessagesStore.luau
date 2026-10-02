local signalsModule = require(script:FindFirstAncestor("TextChannelWindow").Parent.Signals)
local _ = require(script.Parent.Message)

return function()
	-- upvalues: signalsModule (ref)
	local t = {}
	
	local function getOrCreate(p1)
		-- upvalues: t (ref), signalsModule (copy)
		if not t[p1] then
			local var1, var2 = signalsModule.createSignal({})
			local var3, var4 = signalsModule.createSignal({})
			t[p1] = {
				getByMessageId = var1,
				setByMessageId = var2,
				getOrderedIds = var3,
				setOrderedIds = var4,
				getMessages = signalsModule.createComputed(function(p2)
					-- upvalues: var3 (ref), var1 (ref)
					local var5 = var3(p2)
					local var6 = var1(p2)
					local list = table.create(#var5)
					
					for i, v in var5 do
						local var7 = var6[v]
						
						if var7 then
							table.insert(list, var7)
						end
					end
					return list
				end),
				messageGetters = {}
			}
		end
		return t[p1]
	end
	
	local function upsertMessage(p2, p3)
		-- upvalues: getOrCreate (ref)
		local var5 = getOrCreate(p2)
		local messageId = p3.messageId
		var5.setByMessageId(function(p4)
			-- upvalues: messageId (ref), p3 (ref)
			local cloned = table.clone(p4)
			cloned[messageId] = p3
			
			return cloned
		end)
		local t = {}
		var5.setOrderedIds(function(p4)
			-- upvalues: messageId (ref), t (ref)
			for i, v in p4 do
				if v == messageId then
					return p4
				end
			end
			local cloned = table.clone(p4)
			table.insert(cloned, messageId)
			
			if #cloned <= 200 then
				return cloned
			end
			local list = table.create(200)
			table.move(cloned, #cloned - 200 + 1, #cloned, 1, list)
			
			if t then
				for v = 1, #cloned - 200 do
					table.insert(t, cloned[v])
				end
			end
			return list
		end)
		
		if t and #t > 0 then
			var5.setByMessageId(function(p5)
				-- upvalues: t (ref)
				local cloned = table.clone(p5)
				
				for i, v in t do
					cloned[v] = nil
				end
				return cloned
			end)
			
			for i, v in t do
				var5.messageGetters[v] = nil
			end
		end
	end
	
	return {
		upsertMessage = upsertMessage,
		removeMessage = function(p5, p6)
			-- upvalues: getOrCreate (ref)
			local var6 = getOrCreate(p5)
			var6.setByMessageId(function(p7)
				-- upvalues: p6 (ref)
				if p7[p6] == nil then
					return p7
				end
				local cloned = table.clone(p7)
				cloned[p6] = nil
				
				return cloned
			end)
			var6.setOrderedIds(function(p7)
				-- upvalues: p6 (ref)
				local index = table.find(p7, p6)
				
				if index then
					local cloned = table.clone(p7)
					table.remove(cloned, index)
					
					return cloned
				end
				return p7
			end)
		end,
		insertIfAbsent = function(value, p5)
			-- upvalues: getOrCreate (ref), upsertMessage (ref)
			if getOrCreate(value).getByMessageId(false)[p5.messageId] == nil then
				upsertMessage(value, p5)
				
				return
			end
		end,
		removeChannelEntry = function(p5)
			-- upvalues: t (ref)
			t[p5] = nil
		end,
		clearChannel = function(p5)
			-- upvalues: t (ref)
			local var6 = t[p5]
			
			if var6 then
				var6.setByMessageId(function()
					return {}
				end)
				var6.setOrderedIds(function()
					return {}
				end)
				table.clear(var6.messageGetters)
				
				return
			end
		end,
		getMessagesForChannel = function(p5)
			-- upvalues: getOrCreate (ref)
			return getOrCreate(p5).getMessages
		end,
		getMessageById = function(p5, p6)
			-- upvalues: getOrCreate (ref), signalsModule (copy)
			local var6 = getOrCreate(p5)
			
			if not var6.messageGetters[p6] then
				var6.messageGetters[p6] = signalsModule.createComputed(function(p7)
					-- upvalues: var6 (ref), p6 (ref)
					return var6.getByMessageId(p7)[p6]
				end)
			end
			return var6.messageGetters[p6]
		end
	}
end
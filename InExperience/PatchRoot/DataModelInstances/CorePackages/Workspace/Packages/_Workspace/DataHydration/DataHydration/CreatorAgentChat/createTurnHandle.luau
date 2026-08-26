local createSignal = require(script:FindFirstAncestor("DataHydration").Parent.Signals).createSignal
local acpProtocolModule = require(script.Parent.Acp.AcpProtocol)
local turnStateModule = require(script.Parent.turnState)
local _ = require(script.Parent.types)

return function(p1, p2, p3, p4, p5)
	-- upvalues: createSignal (ref), turnStateModule (ref), acpProtocolModule (ref)
	local var1, var2 = createSignal(p4 or turnStateModule.createEmptyTurnState(p1, p2))
	local var3 = nil
	local t = {}
	local var4 = 1
	local t_1 = {}
	local var5 = nil
	local var6 = nil
	local var7 = 0
	
	local function noteProcessedSequenceNumber(p6)
		-- upvalues: t_1 (ref), var5 (write), var6 (write), var7 (write)
		if t_1[p6] == true then
			return false
		end
		t_1[p6] = true
		
		if var5 == nil then
			var5 = p6
			var6 = p6
		elseif var5 < p6 then
			var7 += p6 - var5 - 1
			var5 = p6
		elseif p6 < var6 then
			var7 += var6 - p6 - 1
			var6 = p6
		else
			var7 -= 1
		end
		return true
	end
	
	local function hasSequenceGap()
		-- upvalues: var7 (write)
		return var7 > 0
	end
	
	if p5 ~= nil then
		for i, v in p5 do
			if typeof(v) == "number" and t_1[v] ~= true then
				t_1[v] = true
				
				if var5 == nil then
					var5 = v
					var6 = v
				elseif var5 < v then
					var7 += v - var5 - 1
					var5 = v
				elseif v < var6 then
					var7 += var6 - v - 1
					var6 = v
				else
					var7 -= 1
				end
			end
		end
	end
	local function onNotification(p6)
		-- upvalues: var4 (write), t (ref)
		var4 += 1
		t[var4] = p6
		
		return function()
			-- upvalues: t (copy), var4 (ref)
			t[var4] = nil
		end
	end
	
	local function _(p6)
		-- upvalues: var2 (ref)
		var2(function(p7)
			-- upvalues: p6 (ref)
			if p7.isDone then
				return p7
			end
			local cloned = table.clone(p7)
			p6(cloned)
			
			return cloned
		end)
	end
	
	local function fireHandlers(p6)
		-- upvalues: t (ref)
		for i, v in t do
			local ok, status = pcall(function()
				-- upvalues: v (ref), p6 (ref)
				v(p6)
			end)
			
			if not ok then
				warn(("CreatorAgentClient onNotification handler errored: %s"):format(tostring(status)))
			end
		end
	end
	
	local function i(p7)
		-- upvalues: var2 (ref)
		if p7.error then
			local error = p7.error
			
			local var8 = function(p8)
				-- upvalues: error (ref)
				p8.error = tostring(error.message or "JSON-RPC error")
				p8.errorCode = tonumber(error.code)
				p8.status = "failed"
				p8.isDone = true
			end
			
			var2(function(p8)
				-- upvalues: var8 (ref)
				if p8.isDone then
					return p8
				end
				local cloned = table.clone(p8)
				var8(cloned)
				
				return cloned
			end)
		end
	end
	
	local _ = function(p7, p8)
		local sequenceId = p7.sequenceId
		
		if typeof(sequenceId) == "number" then
			return sequenceId
		end
		local var8 = if p8 ~= nil then nil else p8.sequenceNumber
		
		return if typeof(var8) == "number" then var8 else nil
	end
	
	local _ = function(a)
		-- upvalues: var1 (ref), var2 (ref)
		local var8 = a.sessionUpdate == "state_change" and a.state == "idle"
		
		if var8 or var1(false).status == "queued" then
			local var9 = function(p7)
				-- upvalues: var8 (ref), a (ref)
				if p7.status == "queued" then
					p7.status = "streaming"
				end
				if var8 then
					local var10 = if typeof(a.stop_reason) == "string" then a.stop_reason else "end_turn"
					p7.stopReason = var10
					p7.status = if var10 == "cancelled" then "cancelled" else "succeeded"
					p7.isDone = true
				end
			end
			
			var2(function(p7)
				-- upvalues: var9 (ref)
				if p7.isDone then
					return p7
				end
				local cloned = table.clone(p7)
				var9(cloned)
				
				return cloned
			end)
			
			return
		end
	end
	
	return {
		state = var1,
		getTurnId = function()
			-- upvalues: var3 (write)
			return var3
		end,
		onNotification = onNotification,
		getLatestProcessedSequenceNumber = function()
			-- upvalues: var5 (write)
			return var5
		end,
		hasSequenceGap = hasSequenceGap,
		noteProcessedSequenceNumber = function(p7)
			-- upvalues: t_1 (ref), var5 (write), var6 (write), var7 (write)
			if t_1[p7] == true then return end
			t_1[p7] = true
			
			if var5 == nil then
				var5 = p7
				var6 = p7
				
				return
			elseif var5 < p7 then
				var7 += p7 - var5 - 1
				var5 = p7
				
				return
			elseif p7 < var6 then
				var7 += var6 - p7 - 1
				var6 = p7
				
				return
			end
			var7 -= 1
		end,
		cancel = p3
	}, {
		dispatchFrame = function(p7, p8, p9)
			-- upvalues: var1 (ref), acpProtocolModule (copy), t_1 (ref), var5 (write), var6 (write), var7 (write), var3 (write), turnStateModule (copy), var2 (ref), fireHandlers (ref)
			if var1(false).isDone then
				return false
			end
			local var8 = false
			
			if p7.kind == "notification" then
				if p7.notification.method == acpProtocolModule.Notifications.SessionUpdate then
					local update = p7.notification.params and p7.notification.params.update
					
					if update ~= nil then
						local var9
						local sequenceId = update.sequenceId
						
						if typeof(sequenceId) == "number" then
							var9 = sequenceId
						else
							local var10 = if p8 ~= nil then nil else p8.sequenceNumber
							var9 = if typeof(var10) == "number" then var10 else nil
						end
						local var11 = true
						
						if var9 ~= nil then
							if t_1[var9] == true then
								var11 = false
							else
								t_1[var9] = true
								
								if var5 == nil then
									var5 = var9
									var6 = var9
								elseif var5 < var9 then
									var7 += var9 - var5 - 1
									var5 = var9
								elseif var9 < var6 then
									var7 += var6 - var9 - 1
									var6 = var9
								else
									var7 -= 1
								end
								var11 = true
							end
						end
						if var3 == nil then
							var3 = turnStateModule.extractTurnId(update)
						end
						local var12 = update.sessionUpdate == "state_change" and update.state == "idle"
						
						if var12 or var1(false).status == "queued" then
							local var13 = function(p10)
								-- upvalues: var12 (ref), update (ref)
								if p10.status == "queued" then
									p10.status = "streaming"
								end
								if var12 then
									local var14 = if typeof(update.stop_reason) == "string" then update.stop_reason else "end_turn"
									p10.stopReason = var14
									p10.status = if var14 == "cancelled" then "cancelled" else "succeeded"
									p10.isDone = true
								end
							end
							
							var2(function(p10)
								-- upvalues: var13 (ref)
								if p10.isDone then
									return p10
								end
								local cloned = table.clone(p10)
								var13(cloned)
								
								return cloned
							end)
						end
						var8 = var11
					end
				end
				if p9 == false then
					return var8
				else
					fireHandlers(p7.notification)
					
					return var8
				end
			elseif p7.kind == "response" then
				local response = p7.response
				
				if response.error then
					local error = response.error
					
					local var14 = function(p10)
						-- upvalues: error (ref)
						p10.error = tostring(error.message or "JSON-RPC error")
						p10.errorCode = tonumber(error.code)
						p10.status = "failed"
						p10.isDone = true
					end
					
					var2(function(p10)
						-- upvalues: var14 (ref)
						if p10.isDone then
							return p10
						end
						local cloned = table.clone(p10)
						var14(cloned)
						
						return cloned
					end)
				end
				var8 = p7.response.error ~= nil
			end
		end,
		noteProcessedSequenceNumber = noteProcessedSequenceNumber,
		fail = function(p7, p8)
			-- upvalues: var2 (ref)
			local var8 = function(p9)
				-- upvalues: p7 (ref), p8 (ref)
				p9.error = p7
				p9.errorCode = p8
				p9.status = "failed"
				p9.isDone = true
			end
			
			var2(function(p9)
				-- upvalues: var8 (ref)
				if p9.isDone then
					return p9
				end
				local cloned = table.clone(p9)
				var8(cloned)
				
				return cloned
			end)
		end,
		markCancelled = function()
			-- upvalues: var2 (ref)
			local var8 = function(p7)
				p7.status = "cancelled"
				p7.stopReason = "cancelled"
				p7.isDone = true
			end
			
			var2(function(p7)
				-- upvalues: var8 (ref)
				if p7.isDone then
					return p7
				end
				local cloned = table.clone(p7)
				var8(cloned)
				
				return cloned
			end)
		end,
		isDone = function()
			-- upvalues: var1 (ref)
			return var1(false).isDone
		end,
		requestId = p2
	}
end
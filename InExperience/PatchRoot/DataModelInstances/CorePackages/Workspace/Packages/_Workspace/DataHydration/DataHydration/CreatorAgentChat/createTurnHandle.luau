local createSignal = require(script:FindFirstAncestor("DataHydration").Parent.Signals).createSignal
local acpProtocolModule = require(script.Parent.Acp.AcpProtocol)
local turnStateModule = require(script.Parent.turnState)
local _ = require(script.Parent.types)

return function(p0, p1, p2, p3, p4)
	-- upvalues: createSignal (ref), turnStateModule (ref), acpProtocolModule (ref)
	local var2, var3 = createSignal(p3 or turnStateModule.createEmptyTurnState(p0, p1))
	local var4 = nil
	local t = {}
	local var6 = 1
	local t_1 = {}
	local var8 = nil
	local var9 = nil
	local var10 = 0
	
	local function noteProcessedSequenceNumber(p5)
		-- upvalues: t_1 (ref), var8 (write), var9 (write), var10 (write)
		if t_1[p5] == true then
			return false
		end
		t_1[p5] = true
		
		if var8 == nil then
			var8 = p5
			var9 = p5
		elseif var8 < p5 then
			var10 += p5 - var8 - 1
			var8 = p5
		elseif p5 < var9 then
			var10 += var9 - p5 - 1
			var9 = p5
		else
			var10 -= 1
		end
		return true
	end
	
	local function hasSequenceGap()
		-- upvalues: var10 (write)
		return var10 > 0
	end
	
	if p4 ~= nil then
		for i, v in p4 do
			if typeof(v) == "number" and t_1[v] ~= true then
				t_1[v] = true
				
				if var8 == nil then
					var8 = v
					var9 = v
				elseif var8 < v then
					var10 += v - var8 - 1
					var8 = v
				elseif v < var9 then
					var10 += var9 - v - 1
					var9 = v
				else
					var10 -= 1
				end
			end
		end
	end
	local function onNotification(p6)
		-- upvalues: var6 (write), t (ref)
		var6 += 1
		t[var6] = p6
		
		return function()
			-- upvalues: t (copy), var6 (ref)
			t[var6] = nil
		end
	end
	
	local function _(p7)
		-- upvalues: var3 (ref)
		var3(function(p8)
			-- upvalues: p7 (ref)
			if p8.isDone then
				return p8
			end
			local cloned = table.clone(p8)
			p7(cloned)
			
			return cloned
		end)
	end
	
	local function fireHandlers(p9)
		-- upvalues: t (ref)
		for i, v in t do
			local ok, status = pcall(function()
				-- upvalues: v (ref), p9 (ref)
				v(p9)
			end)
			
			if not ok then
				warn(("CreatorAgentClient onNotification handler errored: %s"):format(tostring(status)))
			end
		end
	end
	
	local function i(p10)
		-- upvalues: var3 (ref)
		if p10.error then
			local error = p10.error
			
			local var16 = function(p11)
				-- upvalues: error (ref)
				p11.error = tostring(error.message or "JSON-RPC error")
				p11.errorCode = tonumber(error.code)
				p11.status = "failed"
				p11.isDone = true
			end
			
			var3(function(p12)
				-- upvalues: var16 (ref)
				if p12.isDone then
					return p12
				end
				local cloned = table.clone(p12)
				var16(cloned)
				
				return cloned
			end)
		end
	end
	
	local _ = function(p13, p14)
		local sequenceId = p13.sequenceId
		
		if typeof(sequenceId) == "number" then
			return sequenceId
		end
		local var17 = if p14 ~= nil then nil else p14.sequenceNumber
		
		return if typeof(var17) == "number" then var17 else nil
	end
	
	local _ = function(a)
		-- upvalues: var2 (ref), var3 (ref)
		local var18 = a.sessionUpdate == "state_change" and a.state == "idle"
		
		if var18 or var2(false).status == "queued" then
			local var19 = function(p15)
				-- upvalues: var18 (ref), a (ref)
				if p15.status == "queued" then
					p15.status = "streaming"
				end
				if var18 then
					local var20 = if typeof(a.stop_reason) == "string" then a.stop_reason else "end_turn"
					p15.stopReason = var20
					p15.status = if var20 == "cancelled" then "cancelled" else "succeeded"
					p15.isDone = true
				end
			end
			
			var3(function(p16)
				-- upvalues: var19 (ref)
				if p16.isDone then
					return p16
				end
				local cloned = table.clone(p16)
				var19(cloned)
				
				return cloned
			end)
			
			return
		end
	end
	
	return {
		state = var2,
		getTurnId = function()
			-- upvalues: var4 (write)
			return var4
		end,
		onNotification = onNotification,
		getLatestProcessedSequenceNumber = function()
			-- upvalues: var8 (write)
			return var8
		end,
		hasSequenceGap = hasSequenceGap,
		noteProcessedSequenceNumber = function(p17)
			-- upvalues: t_1 (ref), var8 (write), var9 (write), var10 (write)
			if t_1[p17] == true then return end
			t_1[p17] = true
			
			if var8 == nil then
				var8 = p17
				var9 = p17
				
				return
			elseif var8 < p17 then
				var10 += p17 - var8 - 1
				var8 = p17
				
				return
			elseif p17 < var9 then
				var10 += var9 - p17 - 1
				var9 = p17
				
				return
			end
			var10 -= 1
		end,
		cancel = p2
	}, {
		dispatchFrame = function(p18, p19, p20)
			-- upvalues: var2 (ref), acpProtocolModule (copy), t_1 (ref), var8 (write), var9 (write), var10 (write), var4 (write), turnStateModule (copy), var3 (ref), fireHandlers (ref)
			if var2(false).isDone then
				return false
			end
			local var21 = false
			
			if p18.kind == "notification" then
				if p18.notification.method == acpProtocolModule.Notifications.SessionUpdate then
					local update = p18.notification.params and p18.notification.params.update
					
					if update ~= nil then
						local var23
						local sequenceId = update.sequenceId
						
						if typeof(sequenceId) == "number" then
							var23 = sequenceId
						else
							local var24 = if p19 ~= nil then nil else p19.sequenceNumber
							var23 = if typeof(var24) == "number" then var24 else nil
						end
						local var25 = true
						
						if var23 ~= nil then
							if t_1[var23] == true then
								var25 = false
							else
								t_1[var23] = true
								
								if var8 == nil then
									var8 = var23
									var9 = var23
								elseif var8 < var23 then
									var10 += var23 - var8 - 1
									var8 = var23
								elseif var23 < var9 then
									var10 += var9 - var23 - 1
									var9 = var23
								else
									var10 -= 1
								end
								var25 = true
							end
						end
						if var4 == nil then
							var4 = turnStateModule.extractTurnId(update)
						end
						local var26 = update.sessionUpdate == "state_change" and update.state == "idle"
						
						if var26 or var2(false).status == "queued" then
							local var27 = function(p21)
								-- upvalues: var26 (ref), update (ref)
								if p21.status == "queued" then
									p21.status = "streaming"
								end
								if var26 then
									local var20 = if typeof(update.stop_reason) == "string" then update.stop_reason else "end_turn"
									p21.stopReason = var20
									p21.status = if var20 == "cancelled" then "cancelled" else "succeeded"
									p21.isDone = true
								end
							end
							
							var3(function(p22)
								-- upvalues: var27 (ref)
								if p22.isDone then
									return p22
								end
								local cloned = table.clone(p22)
								var27(cloned)
								
								return cloned
							end)
						end
						var21 = var25
					end
				end
				if p20 == false then
					return var21
				else
					fireHandlers(p18.notification)
					
					return var21
				end
			elseif p18.kind == "response" then
				local response = p18.response
				
				if response.error then
					local error = response.error
					
					local var28 = function(p23)
						-- upvalues: error (ref)
						p23.error = tostring(error.message or "JSON-RPC error")
						p23.errorCode = tonumber(error.code)
						p23.status = "failed"
						p23.isDone = true
					end
					
					var3(function(p24)
						-- upvalues: var28 (ref)
						if p24.isDone then
							return p24
						end
						local cloned = table.clone(p24)
						var28(cloned)
						
						return cloned
					end)
				end
				var21 = p18.response.error ~= nil
			end
		end,
		noteProcessedSequenceNumber = noteProcessedSequenceNumber,
		fail = function(p25, p26)
			-- upvalues: var3 (ref)
			local var29 = function(p27)
				-- upvalues: p25 (ref), p26 (ref)
				p27.error = p25
				p27.errorCode = p26
				p27.status = "failed"
				p27.isDone = true
			end
			
			var3(function(p28)
				-- upvalues: var29 (ref)
				if p28.isDone then
					return p28
				end
				local cloned = table.clone(p28)
				var29(cloned)
				
				return cloned
			end)
		end,
		markCancelled = function()
			-- upvalues: var3 (ref)
			local var30 = function(p29)
				p29.status = "cancelled"
				p29.stopReason = "cancelled"
				p29.isDone = true
			end
			
			var3(function(p30)
				-- upvalues: var30 (ref)
				if p30.isDone then
					return p30
				end
				local cloned = table.clone(p30)
				var30(cloned)
				
				return cloned
			end)
		end,
		isDone = function()
			-- upvalues: var2 (ref)
			return var2(false).isDone
		end,
		requestId = p1
	}
end
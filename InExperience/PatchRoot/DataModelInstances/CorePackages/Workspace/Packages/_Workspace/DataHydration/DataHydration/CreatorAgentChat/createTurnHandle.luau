local createSignal = require(script:FindFirstAncestor("DataHydration").Parent.Signals).createSignal
local acpProtocolModule = require(script.Parent.Acp.AcpProtocol)
local turnStateModule = require(script.Parent.turnState)
local _ = require(script.Parent.types)

return function(p0, p1, p2, p3, p4) --[[ line: 33 | named "createTurnHandle" ]]
	-- upvalues: createSignal (ref), turnStateModule (ref), acpProtocolModule (ref)
	local var2, var3 = createSignal(p3 or turnStateModule.createEmptyTurnState(p0, p1))
	local t = {}
	local var5 = 1
	local t_1 = {}
	local var7 = nil
	local var8 = nil
	local var9 = 0
	
	local function noteProcessedSequenceNumber(p5) --[[ line: 49 ]]
		-- upvalues: t_1 (ref), var7 (write), var8 (write), var9 (write)
		if t_1[p5] == true then
			return false
		end
		t_1[p5] = true
		
		if var7 == nil then
			var7 = p5
			var8 = p5
		elseif var7 < p5 then
			var9 += p5 - var7 - 1
			var7 = p5
		elseif p5 < var8 then
			var9 += var8 - p5 - 1
			var8 = p5
		else
			var9 -= 1
		end
		return true
	end
	
	local function hasSequenceGap() --[[ line: 70 ]]
		-- upvalues: var9 (write)
		return var9 > 0
	end
	
	if p4 ~= nil then
		for i, v in p4 do
			if typeof(v) == "number" and t_1[v] ~= true then
				t_1[v] = true
				
				if var7 == nil then
					var7 = v
					var8 = v
				elseif var7 < v then
					var9 += v - var7 - 1
					var7 = v
				elseif v < var8 then
					var9 += var8 - v - 1
					var8 = v
				else
					var9 -= 1
				end
			end
		end
	end
	local function onNotification(p6) --[[ line: 83 ]]
		-- upvalues: var5 (write), t (ref)
		var5 += 1
		t[var5] = p6
		
		return function() --[[ line: 87 ]]
			-- upvalues: t (copy), var5 (ref)
			t[var5] = nil
		end
	end
	
	local function _(p7) --[[ line: 93 | named "mutate" ]]
		-- upvalues: var3 (ref)
		var3(function(p8) --[[ line: 94 ]]
			-- upvalues: p7 (ref)
			if p8.isDone then
				return p8
			end
			local cloned = table.clone(p8)
			p7(cloned)
			
			return cloned
		end)
	end
	
	local function fireHandlers(p9) --[[ line: 104 ]]
		-- upvalues: t (ref)
		for i, v in t do
			local ok, status = pcall(function() --[[ line: 107 ]]
				-- upvalues: v (ref), p9 (ref)
				v(p9)
			end)
			
			if not ok then
				warn(("CreatorAgentClient onNotification handler errored: %s"):format(tostring(status)))
			end
		end
	end
	
	local function i(p10) --[[ line: 116 | named "completeFromResponse" ]]
		-- upvalues: var3 (ref)
		if p10.error then
			local error = p10.error
			
			local var15 = function(p11) --[[ line: 119 ]]
				-- upvalues: error (ref)
				p11.error = tostring(error.message or "JSON-RPC error")
				p11.errorCode = tonumber(error.code)
				p11.status = "failed"
				p11.isDone = true
			end
			
			var3(function(p12) --[[ line: 94 ]]
				-- upvalues: var15 (ref)
				if p12.isDone then
					return p12
				end
				local cloned = table.clone(p12)
				var15(cloned)
				
				return cloned
			end)
		end
	end
	
	local _ = function(p13, p14) --[[ line: 128 | named "getEventSequenceId" ]]
		local sequenceId = p13.sequenceId
		
		if typeof(sequenceId) == "number" then
			return sequenceId
		end
		local var16 = if p14 ~= nil then nil else p14.sequenceNumber
		
		return if typeof(var16) == "number" then var16 else nil
	end
	
	local _ = function(a) --[[ line: 142 | named "applyTerminalUpdate" ]]
		-- upvalues: var2 (ref), var3 (ref)
		local var17 = a.sessionUpdate == "state_change" and a.state == "idle"
		
		if var17 or var2(false).status == "queued" then
			local var18 = function(p15) --[[ line: 147 ]]
				-- upvalues: var17 (ref), a (ref)
				if p15.status == "queued" then
					p15.status = "streaming"
				end
				if var17 then
					local var19 = if typeof(a.stop_reason) == "string" then a.stop_reason else "end_turn"
					p15.stopReason = var19
					p15.status = if var19 == "cancelled" then "cancelled" else "succeeded"
					p15.isDone = true
				end
			end
			
			var3(function(p16) --[[ line: 94 ]]
				-- upvalues: var18 (ref)
				if p16.isDone then
					return p16
				end
				local cloned = table.clone(p16)
				var18(cloned)
				
				return cloned
			end)
			
			return
		end
	end
	
	return {
		state = var2,
		onNotification = onNotification,
		getLatestProcessedSequenceNumber = function() --[[ line: 213 ]]
			-- upvalues: var7 (write)
			return var7
		end,
		hasSequenceGap = hasSequenceGap,
		noteProcessedSequenceNumber = function(p17) --[[ line: 217 ]]
			-- upvalues: t_1 (ref), var7 (write), var8 (write), var9 (write)
			if t_1[p17] == true then return end
			t_1[p17] = true
			
			if var7 == nil then
				var7 = p17
				var8 = p17
				
				return
			elseif var7 < p17 then
				var9 += p17 - var7 - 1
				var7 = p17
				
				return
			elseif p17 < var8 then
				var9 += var8 - p17 - 1
				var8 = p17
				
				return
			end
			var9 -= 1
		end,
		cancel = p2
	}, {
		dispatchFrame = function(p18, p19, p20) --[[ line: 160 ]]
			-- upvalues: var2 (ref), acpProtocolModule (copy), t_1 (ref), var7 (write), var8 (write), var9 (write), var3 (ref), fireHandlers (ref)
			if var2(false).isDone then
				return false
			end
			local var20 = false
			
			if p18.kind == "notification" then
				if p18.notification.method == acpProtocolModule.Notifications.SessionUpdate then
					local update = p18.notification.params and p18.notification.params.update
					
					if update ~= nil then
						local var22
						local sequenceId = update.sequenceId
						
						if typeof(sequenceId) == "number" then
							var22 = sequenceId
						else
							local var23 = if p19 ~= nil then nil else p19.sequenceNumber
							var22 = if typeof(var23) == "number" then var23 else nil
						end
						local var24 = true
						
						if var22 ~= nil then
							if t_1[var22] == true then
								var24 = false
							else
								t_1[var22] = true
								
								if var7 == nil then
									var7 = var22
									var8 = var22
								elseif var7 < var22 then
									var9 += var22 - var7 - 1
									var7 = var22
								elseif var22 < var8 then
									var9 += var8 - var22 - 1
									var8 = var22
								else
									var9 -= 1
								end
								var24 = true
							end
						end
						local var25 = update.sessionUpdate == "state_change" and update.state == "idle"
						
						if var25 or var2(false).status == "queued" then
							local var26 = function(p21) --[[ line: 147 ]]
								-- upvalues: var25 (ref), update (ref)
								if p21.status == "queued" then
									p21.status = "streaming"
								end
								if var25 then
									local var19 = if typeof(update.stop_reason) == "string" then update.stop_reason else "end_turn"
									p21.stopReason = var19
									p21.status = if var19 == "cancelled" then "cancelled" else "succeeded"
									p21.isDone = true
								end
							end
							
							var3(function(p22) --[[ line: 94 ]]
								-- upvalues: var26 (ref)
								if p22.isDone then
									return p22
								end
								local cloned = table.clone(p22)
								var26(cloned)
								
								return cloned
							end)
						end
						var20 = var24
					end
				end
				if p20 == false then
					return var20
				else
					fireHandlers(p18.notification)
					
					return var20
				end
			elseif p18.kind == "response" then
				local response = p18.response
				
				if response.error then
					local error = response.error
					
					local var27 = function(p23) --[[ line: 119 ]]
						-- upvalues: error (ref)
						p23.error = tostring(error.message or "JSON-RPC error")
						p23.errorCode = tonumber(error.code)
						p23.status = "failed"
						p23.isDone = true
					end
					
					var3(function(p24) --[[ line: 94 ]]
						-- upvalues: var27 (ref)
						if p24.isDone then
							return p24
						end
						local cloned = table.clone(p24)
						var27(cloned)
						
						return cloned
					end)
				end
				var20 = p18.response.error ~= nil
			end
		end,
		noteProcessedSequenceNumber = noteProcessedSequenceNumber,
		fail = function(p25, p26) --[[ line: 193 ]]
			-- upvalues: var3 (ref)
			local var28 = function(p27) --[[ line: 194 ]]
				-- upvalues: p25 (ref), p26 (ref)
				p27.error = p25
				p27.errorCode = p26
				p27.status = "failed"
				p27.isDone = true
			end
			
			var3(function(p28) --[[ line: 94 ]]
				-- upvalues: var28 (ref)
				if p28.isDone then
					return p28
				end
				local cloned = table.clone(p28)
				var28(cloned)
				
				return cloned
			end)
		end,
		markCancelled = function() --[[ line: 202 ]]
			-- upvalues: var3 (ref)
			local var29 = function(p29) --[[ line: 203 ]]
				p29.status = "cancelled"
				p29.stopReason = "cancelled"
				p29.isDone = true
			end
			
			var3(function(p30) --[[ line: 94 ]]
				-- upvalues: var29 (ref)
				if p30.isDone then
					return p30
				end
				local cloned = table.clone(p30)
				var29(cloned)
				
				return cloned
			end)
		end,
		isDone = function() --[[ line: 228 ]]
			-- upvalues: var2 (ref)
			return var2(false).isDone
		end,
		requestId = p1
	}
end
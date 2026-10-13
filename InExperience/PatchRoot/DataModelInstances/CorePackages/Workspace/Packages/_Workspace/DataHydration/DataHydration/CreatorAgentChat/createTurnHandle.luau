local parent = script:FindFirstAncestor("DataHydration").Parent
local createSignal = require(parent.Signals).createSignal
local acpProtocolModule = require(script.Parent.Acp.AcpProtocol)
local turnStateModule = require(script.Parent.turnState)
local _ = require(script.Parent.types)
local fFlagBuildExperiencePromptFailureTelemetry = require(parent.SharedFlags).FFlagBuildExperiencePromptFailureTelemetry

return function(p1, p2, p3, p4, p5)
	-- upvalues: createSignal (ref), turnStateModule (ref), acpProtocolModule (ref), fFlagBuildExperiencePromptFailureTelemetry (ref)
	local var1, var2 = createSignal(p4 or turnStateModule.createEmptyTurnState(p1, p2))
	local var3 = nil
	local t = {}
	local t_1 = {}
	local var4 = 1
	local t_2 = {}
	local var5 = nil
	local var6 = nil
	local var7 = 0
	
	local function noteProcessedSequenceNumber(p6)
		-- upvalues: t_2 (ref), var5 (write), var6 (write), var7 (write)
		if t_2[p6] == true then
			return false
		end
		t_2[p6] = true
		
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
			if typeof(v) == "number" and t_2[v] ~= true then
				t_2[v] = true
				
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
	
	local function onUpdate(p6)
		-- upvalues: var4 (write), t_1 (ref)
		var4 += 1
		t_1[var4] = p6
		
		return function()
			-- upvalues: t_1 (copy), var4 (ref)
			t_1[var4] = nil
		end
	end
	
	local function fireUpdateHandlers(p6, p7)
		-- upvalues: t_1 (ref)
		for i, v in t_1 do
			local ok, status = pcall(function()
				-- upvalues: v (ref), p6 (ref), p7 (ref)
				v(p6, p7)
			end)
			
			if not ok then
				warn(("CreatorAgentClient onUpdate handler errored: %s"):format(tostring(status)))
			end
		end
	end
	
	local function i(p8)
		-- upvalues: var2 (ref)
		var2(function(p9)
			-- upvalues: p8 (ref)
			if p9.isDone then
				return p9
			end
			local cloned = table.clone(p9)
			p8(cloned)
			
			return cloned
		end)
	end
	
	local function fireHandlers(p8)
		-- upvalues: t (ref)
		for i, v in t do
			local ok, status = pcall(function()
				-- upvalues: v (ref), p8 (ref)
				v(p8)
			end)
			
			if not ok then
				warn(("CreatorAgentClient onNotification handler errored: %s"):format(tostring(status)))
			end
		end
	end
	
	local function _(p9)
		-- upvalues: var2 (ref)
		if p9.error then
			local error = p9.error
			
			local var8 = function(p10)
				-- upvalues: error (ref)
				p10.error = tostring(error.message or "JSON-RPC error")
				p10.errorCode = tonumber(error.code)
				p10.status = "failed"
				p10.isDone = true
			end
			
			var2(function(p10)
				-- upvalues: var8 (ref)
				if p10.isDone then
					return p10
				end
				local cloned = table.clone(p10)
				var8(cloned)
				
				return cloned
			end)
		end
	end
	
	local _ = function(p9, p10)
		local sequenceId = p9.sequenceId
		
		if typeof(sequenceId) == "number" then
			return sequenceId
		end
		local var8 = if p10 ~= nil then nil else p10.sequenceNumber
		
		return if typeof(var8) == "number" then var8 else nil
	end
	
	local _ = function(a)
		-- upvalues: var1 (ref), var2 (ref)
		local var8 = a.sessionUpdate == "state_change" and a.state == "idle"
		
		if var8 or var1(false).status == "queued" then
			local var9 = function(p9)
				-- upvalues: var8 (ref), a (ref)
				if p9.status == "queued" then
					p9.status = "streaming"
				end
				if var8 then
					local var10 = if typeof(a.stop_reason) == "string" then a.stop_reason else "end_turn"
					p9.stopReason = var10
					p9.status = if var10 == "cancelled" then "cancelled" else "succeeded"
					p9.isDone = true
				end
			end
			
			var2(function(p9)
				-- upvalues: var9 (ref)
				if p9.isDone then
					return p9
				end
				local cloned = table.clone(p9)
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
		onUpdate = onUpdate,
		getLatestProcessedSequenceNumber = function()
			-- upvalues: var5 (write)
			return var5
		end,
		hasSequenceGap = hasSequenceGap,
		noteProcessedSequenceNumber = function(p9)
			-- upvalues: t_2 (ref), var5 (write), var6 (write), var7 (write)
			if t_2[p9] == true then return end
			t_2[p9] = true
			
			if var5 == nil then
				var5 = p9
				var6 = p9
				
				return
			elseif var5 < p9 then
				var7 += p9 - var5 - 1
				var5 = p9
				
				return
			elseif p9 < var6 then
				var7 += var6 - p9 - 1
				var6 = p9
				
				return
			end
			var7 -= 1
		end,
		cancel = p3
	}, {
		dispatchFrame = function(p9, p10, p11)
			-- upvalues: var1 (ref), acpProtocolModule (copy), t_2 (ref), var5 (write), var6 (write), var7 (write), var3 (write), turnStateModule (copy), var2 (ref), fFlagBuildExperiencePromptFailureTelemetry (copy), fireUpdateHandlers (ref), fireHandlers (ref)
			if var1(false).isDone then
				return false
			end
			local var8 = false
			
			if p9.kind == "notification" then
				if p9.notification.method == acpProtocolModule.Notifications.SessionUpdate then
					local update = p9.notification.params and p9.notification.params.update
					
					if update ~= nil then
						local var9
						local sequenceId = update.sequenceId
						
						if typeof(sequenceId) == "number" then
							var9 = sequenceId
						else
							local var10 = if p10 ~= nil then nil else p10.sequenceNumber
							var9 = if typeof(var10) == "number" then var10 else nil
						end
						local var11 = true
						
						if var9 ~= nil then
							if t_2[var9] == true then
								var11 = false
							else
								t_2[var9] = true
								
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
							local var13 = function(p12)
								-- upvalues: var12 (ref), update (ref)
								if p12.status == "queued" then
									p12.status = "streaming"
								end
								if var12 then
									local var14 = if typeof(update.stop_reason) == "string" then update.stop_reason else "end_turn"
									p12.stopReason = var14
									p12.status = if var14 == "cancelled" then "cancelled" else "succeeded"
									p12.isDone = true
								end
							end
							
							var2(function(p12)
								-- upvalues: var13 (ref)
								if p12.isDone then
									return p12
								end
								local cloned = table.clone(p12)
								var13(cloned)
								
								return cloned
							end)
						end
						var8 = var11
						
						if fFlagBuildExperiencePromptFailureTelemetry and var11 then
							fireUpdateHandlers(update, var9)
						end
					end
				end
				if p11 == false then
					return var8
				else
					fireHandlers(p9.notification)
					
					return var8
				end
			elseif p9.kind == "response" then
				local response = p9.response
				
				if response.error then
					local error = response.error
					
					local var14 = function(p12)
						-- upvalues: error (ref)
						p12.error = tostring(error.message or "JSON-RPC error")
						p12.errorCode = tonumber(error.code)
						p12.status = "failed"
						p12.isDone = true
					end
					
					var2(function(p12)
						-- upvalues: var14 (ref)
						if p12.isDone then
							return p12
						end
						local cloned = table.clone(p12)
						var14(cloned)
						
						return cloned
					end)
				end
				var8 = p9.response.error ~= nil
			end
		end,
		noteProcessedSequenceNumber = noteProcessedSequenceNumber,
		fail = function(p9, p10, p11)
			-- upvalues: fFlagBuildExperiencePromptFailureTelemetry (copy), var2 (ref)
			local var8 = function(p12)
				-- upvalues: p9 (ref), p10 (ref), fFlagBuildExperiencePromptFailureTelemetry (copy), p11 (ref)
				p12.error = p9
				p12.errorCode = p10
				
				if fFlagBuildExperiencePromptFailureTelemetry then
					p12.requestFailure = p11
				end
				p12.status = "failed"
				p12.isDone = true
			end
			
			var2(function(p12)
				-- upvalues: var8 (ref)
				if p12.isDone then
					return p12
				end
				local cloned = table.clone(p12)
				var8(cloned)
				
				return cloned
			end)
		end,
		markCancelled = function()
			-- upvalues: var2 (ref)
			local var8 = function(p9)
				p9.status = "cancelled"
				p9.stopReason = "cancelled"
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
		isDone = function()
			-- upvalues: var1 (ref)
			return var1(false).isDone
		end,
		requestId = p2
	}
end
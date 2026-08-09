local createSignal = require(script:FindFirstAncestor("DataHydration").Parent.Signals).createSignal
local acpProtocolModule = require(script.Parent.Acp.AcpProtocol)
local turnStateModule = require(script.Parent.turnState)
local _ = require(script.Parent.types)

return function(p0, p1, p2, p3, p4, p5) --[[ line: 30 | named "createTurnHandle" ]]
	-- upvalues: createSignal (ref), acpProtocolModule (ref), turnStateModule (ref)
	local var2, var3 = createSignal(p3 or {
		status = "queued",
		assistantText = "",
		pendingAgentMessageId = nil,
		pendingAgentMessageSequenceIndex = nil,
		thoughtText = "",
		toolCallCount = 0,
		infoUpdate = nil,
		stopReason = nil,
		error = nil,
		errorCode = nil,
		isDone = false,
		sessionId = p0,
		requestId = p1,
		assistantMessages = {},
		assistantMessageOrder = {},
		pendingAgentMessageContent = {},
		thoughtMessages = {},
		thoughtMessageOrder = {},
		thoughtChunks = {},
		activitySlots = {},
		activityItems = {},
		toolCalls = {}
	})
	local t = {}
	local var5 = 1
	local var6 = p4
	local t_1 = {}
	local var8 = nil
	
	local function _(p6) --[[ line: 69 | named "noteProcessedSequenceNumber" ]]
		-- upvalues: var8 (write)
		if var8 == nil or var8 < p6 then
			var8 = p6
		end
	end
	
	if p5 ~= nil then
		for i, v in p5 do
			if typeof(v) == "number" then
				t_1[v] = true
				
				if var8 == nil or var8 < v then
					var8 = v
				end
			end
		end
	end
	local function onNotification(p7) --[[ line: 85 ]]
		-- upvalues: var5 (write), t (ref)
		var5 += 1
		t[var5] = p7
		
		return function() --[[ line: 89 ]]
			-- upvalues: t (copy), var5 (ref)
			t[var5] = nil
		end
	end
	
	local _ = function(p8) --[[ line: 95 | named "mutate" ]]
		-- upvalues: var3 (ref)
		var3(function(p9) --[[ line: 96 ]]
			-- upvalues: p8 (ref)
			if p9.isDone then
				return p9
			end
			local cloned = table.clone(p9)
			p8(cloned)
			
			return cloned
		end)
	end
	
	local function fireHandlers(p10) --[[ line: 106 ]]
		-- upvalues: t (ref)
		for i, v in t do
			local ok, status = pcall(function() --[[ line: 109 ]]
				-- upvalues: v (ref), p10 (ref)
				v(p10)
			end)
			
			if not ok then
				warn(("CreatorAgentClient onNotification handler errored: %s"):format(tostring(status)))
			end
		end
	end
	
	local function i(p11) --[[ line: 120 | named "normalizeIngestContext" ]]
		-- upvalues: var6 (write)
		if p11 == nil then
			return nil, 0
		end
		local sequenceNumber = p11.sequenceNumber
		
		if typeof(sequenceNumber) ~= "number" then
			return p11, 0
		end
		local var12 = 0
		
		if var6 == nil then
			var6 = sequenceNumber
		elseif sequenceNumber < var6 then
			var12 = var6 - sequenceNumber
			var6 = sequenceNumber
		end
		local cloned = table.clone(p11)
		cloned.sequenceNumber = sequenceNumber - var6
		
		return cloned, var12
	end
	
	local _ = function(p12) --[[ line: 142 | named "completeFromResponse" ]]
		-- upvalues: var3 (ref)
		if p12.error then
			local error = p12.error
			
			local var14 = function(p13) --[[ line: 145 ]]
				-- upvalues: error (ref)
				p13.error = tostring(error.message or "JSON-RPC error")
				p13.errorCode = tonumber(error.code)
				p13.status = "failed"
				p13.isDone = true
			end
			
			var3(function(p14) --[[ line: 96 ]]
				-- upvalues: var14 (ref)
				if p14.isDone then
					return p14
				end
				local cloned = table.clone(p14)
				var14(cloned)
				
				return cloned
			end)
		end
	end
	
	local _ = function(p15, p16) --[[ line: 154 | named "getEventSequenceId" ]]
		local sequenceId = p15.sequenceId
		
		if typeof(sequenceId) == "number" then
			return sequenceId
		end
		local var15 = if p16 ~= nil then nil else p16.sequenceNumber
		
		return if typeof(var15) == "number" then var15 else nil
	end
	
	local _ = function(p17, p18) --[[ line: 164 | named "shouldApplySequence" ]]
		-- upvalues: t_1 (ref), var8 (write)
		local var16
		local sequenceId = p17.sequenceId
		
		if typeof(sequenceId) == "number" then
			var16 = sequenceId
		else
			local var17 = if p18 ~= nil then nil else p18.sequenceNumber
			var16 = if typeof(var17) == "number" then var17 else nil
		end
		if var16 == nil then
			return true
		elseif t_1[var16] then
			return false
		end
		t_1[var16] = true
		
		if var8 == nil or var8 < var16 then
			var8 = var16
		end
		return true
	end
	
	return {
		state = var2,
		onNotification = onNotification,
		getLatestProcessedSequenceNumber = function() --[[ line: 230 ]]
			-- upvalues: var8 (write)
			return var8
		end,
		cancel = p2
	}, {
		dispatchFrame = function(p19, p20, p21) --[[ line: 177 ]]
			-- upvalues: var2 (ref), acpProtocolModule (copy), t_1 (ref), var8 (write), var6 (write), var3 (ref), turnStateModule (copy), fireHandlers (ref)
			if var2(false).isDone then
				return false
			end
			local var18 = false
			
			if p19.kind == "notification" then
				if p19.notification.method == acpProtocolModule.Notifications.SessionUpdate then
					local update = p19.notification.params and p19.notification.params.update
					
					if update ~= nil then
						local var20
						local sequenceId = update.sequenceId
						
						if typeof(sequenceId) == "number" then
							var20 = sequenceId
						else
							local var21 = if p20 ~= nil then nil else p20.sequenceNumber
							var20 = if typeof(var21) == "number" then var21 else nil
						end
						local var22
						if var20 == nil then
							var22 = true
						elseif t_1[var20] then
							var22 = false
						else
							t_1[var20] = true
							
							if var8 == nil or var8 < var20 then
								var8 = var20
							end
							var22 = true
						end
						if var22 then
							local var23
							if p20 == nil then
								var22 = nil
								var23 = 0
							else
								local sequenceNumber = p20.sequenceNumber
								
								if typeof(sequenceNumber) == "number" then
									local var24 = 0
									
									if var6 == nil then
										var6 = sequenceNumber
									elseif sequenceNumber < var6 then
										var24 = var6 - sequenceNumber
										var6 = sequenceNumber
									end
									local cloned = table.clone(p20)
									cloned.sequenceNumber = sequenceNumber - var6
									var22 = cloned
									var23 = var24
								else
									var22 = p20
									var23 = 0
								end
							end
							var3(function(p22) --[[ line: 192 ]]
								-- upvalues: turnStateModule (copy), var23 (ref), update (ref), var22 (ref)
								local cloned = table.clone(p22)
								turnStateModule.rebaseSequencedState(cloned, var23)
								
								return turnStateModule.applySessionUpdate(cloned, update, var22)
							end)
							var18 = true
						end
					end
				end
				if p21 == false then
					return var18
				else
					fireHandlers(p19.notification)
					
					return var18
				end
			elseif p19.kind == "response" then
				local response = p19.response
				
				if response.error then
					local error = response.error
					
					local var26 = function(p23) --[[ line: 145 ]]
						-- upvalues: error (ref)
						p23.error = tostring(error.message or "JSON-RPC error")
						p23.errorCode = tonumber(error.code)
						p23.status = "failed"
						p23.isDone = true
					end
					
					var3(function(p24) --[[ line: 96 ]]
						-- upvalues: var26 (ref)
						if p24.isDone then
							return p24
						end
						local cloned = table.clone(p24)
						var26(cloned)
						
						return cloned
					end)
				end
				var18 = p19.response.error ~= nil
			end
		end,
		fail = function(p25, p26) --[[ line: 210 ]]
			-- upvalues: var3 (ref)
			local var28 = function(p27) --[[ line: 211 ]]
				-- upvalues: p25 (ref), p26 (ref)
				p27.error = p25
				p27.errorCode = p26
				p27.status = "failed"
				p27.isDone = true
			end
			
			var3(function(p28) --[[ line: 96 ]]
				-- upvalues: var28 (ref)
				if p28.isDone then
					return p28
				end
				local cloned = table.clone(p28)
				var28(cloned)
				
				return cloned
			end)
		end,
		markCancelled = function() --[[ line: 219 ]]
			-- upvalues: var3 (ref)
			local var29 = function(p29) --[[ line: 220 ]]
				p29.status = "cancelled"
				p29.stopReason = "cancelled"
				p29.isDone = true
			end
			
			var3(function(p30) --[[ line: 96 ]]
				-- upvalues: var29 (ref)
				if p30.isDone then
					return p30
				end
				local cloned = table.clone(p30)
				var29(cloned)
				
				return cloned
			end)
		end,
		isDone = function() --[[ line: 240 ]]
			-- upvalues: var2 (ref)
			return var2(false).isDone
		end,
		requestId = p1
	}
end
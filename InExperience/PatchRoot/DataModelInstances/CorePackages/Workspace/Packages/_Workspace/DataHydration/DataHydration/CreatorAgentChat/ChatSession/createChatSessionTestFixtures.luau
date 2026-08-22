local signalsModule = require(script:FindFirstAncestor("DataHydration").Parent.Signals)
local typesModule = require(script.Parent.Parent.types)

local function makeRequestHandle() --[[ line: 23 ]]
	-- upvalues: signalsModule (ref)
	local var4, var5 = signalsModule.createSignal({ status = "pending" })
	
	return { state = var4, dispose = function() --[[ line: 33 ]] end }, function(p0) --[[ line: 25 | named "succeed" ]]
		-- upvalues: var5 (ref)
		var5({ status = "succeeded", result = p0 })
	end, function(p1) --[[ line: 28 | named "fail" ]]
		-- upvalues: var5 (ref)
		var5({ status = "failed", error = p1 })
	end
end

local function makeTurnHandle(p2) --[[ line: 60 ]]
	-- upvalues: signalsModule (ref)
	local var6, var7 = signalsModule.createSignal({
		requestId = nil,
		status = "queued",
		assistantText = "",
		pendingAgentMessageId = nil,
		pendingAgentMessageSequenceIndex = nil,
		toolCallCount = 0,
		infoUpdate = nil,
		stopReason = nil,
		error = nil,
		errorCode = nil,
		isDone = false,
		sessionId = p2,
		assistantMessages = {},
		assistantMessageOrder = {},
		pendingAgentMessageContent = {},
		activitySlots = {},
		activityItems = {},
		toolCalls = {}
	})
	local var8 = false
	local var9 = nil
	local t = {}
	local var11 = 0
	local t_1 = {}
	local var13 = nil
	local var14 = nil
	local var15 = 0
	
	return {
		state = var6,
		getTurnId = function() --[[ line: 112 ]]
			-- upvalues: var9 (write)
			return var9
		end,
		onNotification = function(p3) --[[ line: 115 ]]
			-- upvalues: var11 (write), t (ref)
			var11 += 1
			local var16 = var11
			t[var16] = p3
			
			return function() --[[ line: 119 ]]
				-- upvalues: t (copy), var16 (ref)
				t[var16] = nil
			end
		end,
		getLatestProcessedSequenceNumber = function() --[[ line: 123 ]]
			-- upvalues: var13 (write)
			return var13
		end,
		hasSequenceGap = function() --[[ line: 126 ]]
			-- upvalues: var15 (write)
			return var15 > 0
		end,
		noteProcessedSequenceNumber = function(p4) --[[ line: 91 ]]
			-- upvalues: t_1 (ref), var13 (write), var14 (write), var15 (write)
			if t_1[p4] == true then return end
			t_1[p4] = true
			
			if var13 == nil then
				var13 = p4
				var14 = p4
				
				return
			elseif var13 < p4 then
				var15 += p4 - var13 - 1
				var13 = p4
				
				return
			elseif p4 < var14 then
				var15 += var14 - p4 - 1
				var14 = p4
				
				return
			end
			var15 -= 1
		end,
		cancel = function() --[[ line: 130 ]]
			-- upvalues: var8 (write), var6 (ref), var7 (ref)
			var8 = true
			local cloned = table.clone(var6(false))
			cloned.status = "cancelled"
			cloned.isDone = true
			var7(cloned)
		end,
		wasCancelled = function() --[[ line: 151 ]]
			-- upvalues: var8 (write)
			return var8
		end,
		setTurnId = function(p5) --[[ line: 154 ]]
			-- upvalues: var9 (write)
			var9 = p5
		end,
		setLatestProcessedSequenceNumber = function(p6) --[[ line: 157 ]]
			-- upvalues: t_1 (ref), var13 (write), var14 (write), var15 (write)
			if t_1[p6] == true then return end
			t_1[p6] = true
			
			if var13 == nil then
				var13 = p6
				var14 = p6
				
				return
			elseif var13 < p6 then
				var15 += p6 - var13 - 1
				var13 = p6
				
				return
			elseif p6 < var14 then
				var15 += var14 - p6 - 1
				var14 = p6
				
				return
			end
			var15 -= 1
		end,
		emitNotification = function() --[[ line: 160 ]]
			-- upvalues: t (ref)
			for i, v in t do
				v()
			end
		end,
		markStreaming = function() --[[ line: 165 ]]
			-- upvalues: var6 (ref), var7 (ref)
			local cloned = table.clone(var6(false))
			cloned.status = "streaming"
			var7(cloned)
		end,
		fail = function() --[[ line: 170 ]]
			-- upvalues: var6 (ref), var7 (ref)
			local cloned = table.clone(var6(false))
			cloned.status = "failed"
			cloned.isDone = true
			var7(cloned)
		end
	}, function(p7) --[[ line: 139 | named "finish" ]]
		-- upvalues: var6 (ref), var7 (ref)
		local var20
		local _ = nil
		
		if p7 == nil then
			var20 = table.clone(var6(false))
			var20.status = "succeeded"
			var20.isDone = true
		else
			var20 = p7
		end
		var7(var20)
	end
end

return {
	Types = typesModule,
	makeRequestHandle = makeRequestHandle,
	makeImmediateSuccess = function(p8) --[[ line: 38 ]]
		-- upvalues: makeRequestHandle (ref)
		local var21, var22 = makeRequestHandle()
		var22(p8)
		
		return var21
	end,
	makeImmediateFailure = function(p9) --[[ line: 44 ]]
		-- upvalues: makeRequestHandle (ref)
		local var23, _, var24 = makeRequestHandle()
		var24(p9)
		
		return var23
	end,
	makeImmediateFailureWithCode = function(p10, p11) --[[ line: 50 ]]
		-- upvalues: signalsModule (ref)
		return {
			state = signalsModule.createSignal({ status = "failed", error = p10, errorCode = p11 }),
			dispose = function() --[[ line: 55 ]] end
		}
	end,
	makeTurnHandle = makeTurnHandle,
	defaultDeps = function() --[[ line: 179 ]]
		-- upvalues: makeRequestHandle (ref), makeTurnHandle (ref)
		local t = {}
		local t_1 = {}
		local t_2 = {}
		local t_3 = {}
		local t_4 = {}
		local t_5 = {}
		local t_6 = {}
		local t_7 = {}
		local t_8 = {}
		local t_9 = {}
		
		return {
			deps = {
				rpcTimeoutSeconds = 5,
				initialize = function(_) --[[ line: 205 ]]
					-- upvalues: t (ref), makeRequestHandle (copy)
					table.insert(t, #t + 1)
					local t_1 = { protocolVersion = 2 }
					local var36, var37 = makeRequestHandle()
					var37(t_1)
					
					return var36
				end,
				sessionNew = function(p12) --[[ line: 209 ]]
					-- upvalues: t_1 (ref), makeRequestHandle (copy)
					table.insert(t_1, p12)
					local t = { sessionId = "cas-session-1" }
					local var39, var40 = makeRequestHandle()
					var40(t)
					
					return var39
				end,
				sessionLoad = function(p13, p14) --[[ line: 213 ]]
					-- upvalues: t_2 (ref), t_3 (ref), makeRequestHandle (copy)
					table.insert(t_2, { sessionId = p13, params = p14 })
					local var41 = t_3[#t_2] or {}
					
					if var41.history == nil and var41.nextHistoryPageToken == nil then
						local t = { history = var41 }
						local var45, var46 = makeRequestHandle()
						var46(t)
						
						return var45
					end
					local var42, var43 = makeRequestHandle()
					var43(var41)
					
					return var42
				end,
				sessionPrompt = function(p15) --[[ line: 221 ]]
					-- upvalues: t_4 (ref), makeTurnHandle (copy), t_8 (ref), t_9 (ref)
					table.insert(t_4, p15)
					local var47, var48 = makeTurnHandle(p15.sessionId)
					table.insert(t_8, var47)
					table.insert(t_9, var48)
					
					return var47
				end,
				ingestSessionHistory = function(p16, p17, p18) --[[ line: 228 ]]
					-- upvalues: t_5 (ref), t_6 (ref), t_7 (ref), t_8 (ref)
					table.insert(t_5, { sessionId = p16, history = p17, afterSequenceId = p18 })
					local var49 = t_6[#t_5]
					
					if var49 ~= nil then
						return var49
					end
					local t = {}
					
					for i, v in p17 do
						local sequenceId = v.sequenceId
						
						if typeof(sequenceId) == "number" and (p18 == nil or p18 < sequenceId) then
							if t_7[sequenceId] ~= true then
								t_7[sequenceId] = true
								table.insert(t, sequenceId)
							end
							local var51 = t_8[#t_8]
							
							if var51 ~= nil and var51.noteProcessedSequenceNumber ~= nil then
								var51.noteProcessedSequenceNumber(sequenceId)
							end
						end
					end
					return t
				end,
				submitToolResult = function(_) --[[ line: 254 ]]
					-- upvalues: makeRequestHandle (copy)
					local var52, var53 = makeRequestHandle()
					var53(nil)
					
					return var52
				end,
				getActiveTurnHandle = function(_) --[[ line: 257 ]]
					-- upvalues: t_8 (ref)
					return t_8[#t_8]
				end,
				onCasSessionIdChanged = function(_) --[[ line: 260 ]] end
			},
			initializeCalls = t,
			sessionNewCalls = t_1,
			sessionLoadCalls = t_2,
			sessionLoadResults = t_3,
			sessionPromptCalls = t_4,
			ingestSessionHistoryCalls = t_5,
			ingestSessionHistoryResults = t_6,
			turnHandles = t_8,
			finishLastTurn = function(p19) --[[ line: 274 ]]
				-- upvalues: t_9 (ref)
				local var54 = t_9[#t_9]
				
				if var54 ~= nil then
					var54(p19)
				end
			end
		}
	end,
	awaitTurnHandle = function(p20, p21) --[[ line: 283 ]]
		local var55 = os.clock() + (p21 or 3)
		while p20.getTurnHandle(false) == nil and (p20.getSetupError(false) == nil and var55 >= os.clock()) do
			task.wait()
		end
	end,
	waitFor = function(p22, p23) --[[ line: 293 ]]
		local var56 = os.clock() + (p23 or 3)
		while not p22() and var56 >= os.clock() do
			task.wait()
		end
	end
}
local signalsModule = require(script:FindFirstAncestor("DataHydration").Parent.Signals)
local typesModule = require(script.Parent.Parent.types)

local function makeRequestHandle() --[[ line: 14 ]]
	-- upvalues: signalsModule (ref)
	local var4, var5 = signalsModule.createSignal({ status = "pending" })
	
	return { state = var4, dispose = function() --[[ line: 24 ]] end }, function(p0) --[[ line: 16 | named "succeed" ]]
		-- upvalues: var5 (ref)
		var5({ status = "succeeded", result = p0 })
	end, function(p1) --[[ line: 19 | named "fail" ]]
		-- upvalues: var5 (ref)
		var5({ status = "failed", error = p1 })
	end
end

local function makeTurnHandle(p2) --[[ line: 51 ]]
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
	local t = {}
	local var10 = 0
	local t_1 = {}
	local var12 = nil
	local var13 = nil
	local var14 = 0
	
	return {
		state = var6,
		onNotification = function(p3) --[[ line: 102 ]]
			-- upvalues: var10 (write), t (ref)
			var10 += 1
			local var15 = var10
			t[var15] = p3
			
			return function() --[[ line: 106 ]]
				-- upvalues: t (copy), var15 (ref)
				t[var15] = nil
			end
		end,
		getLatestProcessedSequenceNumber = function() --[[ line: 110 ]]
			-- upvalues: var12 (write)
			return var12
		end,
		hasSequenceGap = function() --[[ line: 113 ]]
			-- upvalues: var14 (write)
			return var14 > 0
		end,
		noteProcessedSequenceNumber = function(p4) --[[ line: 81 ]]
			-- upvalues: t_1 (ref), var12 (write), var13 (write), var14 (write)
			if t_1[p4] == true then return end
			t_1[p4] = true
			
			if var12 == nil then
				var12 = p4
				var13 = p4
				
				return
			elseif var12 < p4 then
				var14 += p4 - var12 - 1
				var12 = p4
				
				return
			elseif p4 < var13 then
				var14 += var13 - p4 - 1
				var13 = p4
				
				return
			end
			var14 -= 1
		end,
		cancel = function() --[[ line: 117 ]]
			-- upvalues: var8 (write), var6 (ref), var7 (ref)
			var8 = true
			local cloned = table.clone(var6(false))
			cloned.status = "cancelled"
			cloned.isDone = true
			var7(cloned)
		end,
		wasCancelled = function() --[[ line: 138 ]]
			-- upvalues: var8 (write)
			return var8
		end,
		setLatestProcessedSequenceNumber = function(p5) --[[ line: 141 ]]
			-- upvalues: t_1 (ref), var12 (write), var13 (write), var14 (write)
			if t_1[p5] == true then return end
			t_1[p5] = true
			
			if var12 == nil then
				var12 = p5
				var13 = p5
				
				return
			elseif var12 < p5 then
				var14 += p5 - var12 - 1
				var12 = p5
				
				return
			elseif p5 < var13 then
				var14 += var13 - p5 - 1
				var13 = p5
				
				return
			end
			var14 -= 1
		end,
		emitNotification = function() --[[ line: 144 ]]
			-- upvalues: t (ref)
			for i, v in t do
				v()
			end
		end
	}, function(p6) --[[ line: 126 | named "finish" ]]
		-- upvalues: var6 (ref), var7 (ref)
		local var17
		local _ = nil
		
		if p6 == nil then
			var17 = table.clone(var6(false))
			var17.status = "succeeded"
			var17.isDone = true
		else
			var17 = p6
		end
		var7(var17)
	end
end

return {
	Types = typesModule,
	makeRequestHandle = makeRequestHandle,
	makeImmediateSuccess = function(p7) --[[ line: 29 ]]
		-- upvalues: makeRequestHandle (ref)
		local var18, var19 = makeRequestHandle()
		var19(p7)
		
		return var18
	end,
	makeImmediateFailure = function(p8) --[[ line: 35 ]]
		-- upvalues: makeRequestHandle (ref)
		local var20, _, var21 = makeRequestHandle()
		var21(p8)
		
		return var20
	end,
	makeImmediateFailureWithCode = function(p9, p10) --[[ line: 41 ]]
		-- upvalues: signalsModule (ref)
		return {
			state = signalsModule.createSignal({ status = "failed", error = p9, errorCode = p10 }),
			dispose = function() --[[ line: 46 ]] end
		}
	end,
	makeTurnHandle = makeTurnHandle,
	defaultDeps = function() --[[ line: 152 ]]
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
				initialize = function(_) --[[ line: 178 ]]
					-- upvalues: t (ref), makeRequestHandle (copy)
					table.insert(t, #t + 1)
					local t_1 = { protocolVersion = 2 }
					local var33, var34 = makeRequestHandle()
					var34(t_1)
					
					return var33
				end,
				sessionNew = function(p11) --[[ line: 182 ]]
					-- upvalues: t_1 (ref), makeRequestHandle (copy)
					table.insert(t_1, p11)
					local t = { sessionId = "cas-session-1" }
					local var36, var37 = makeRequestHandle()
					var37(t)
					
					return var36
				end,
				sessionLoad = function(p12, p13) --[[ line: 186 ]]
					-- upvalues: t_2 (ref), t_3 (ref), makeRequestHandle (copy)
					table.insert(t_2, { sessionId = p12, params = p13 })
					local var38 = t_3[#t_2] or {}
					
					if var38.history == nil and var38.nextHistoryPageToken == nil then
						local t = { history = var38 }
						local var42, var43 = makeRequestHandle()
						var43(t)
						
						return var42
					end
					local var39, var40 = makeRequestHandle()
					var40(var38)
					
					return var39
				end,
				sessionPrompt = function(p14) --[[ line: 194 ]]
					-- upvalues: t_4 (ref), makeTurnHandle (copy), t_8 (ref), t_9 (ref)
					table.insert(t_4, p14)
					local var44, var45 = makeTurnHandle(p14.sessionId)
					table.insert(t_8, var44)
					table.insert(t_9, var45)
					
					return var44
				end,
				ingestSessionHistory = function(p15, p16, p17) --[[ line: 201 ]]
					-- upvalues: t_5 (ref), t_6 (ref), t_7 (ref), t_8 (ref)
					table.insert(t_5, { sessionId = p15, history = p16, afterSequenceId = p17 })
					local var46 = t_6[#t_5]
					
					if var46 ~= nil then
						return var46
					end
					local t = {}
					
					for i, v in p16 do
						local sequenceId = v.sequenceId
						
						if typeof(sequenceId) == "number" and (p17 == nil or p17 < sequenceId) then
							if t_7[sequenceId] ~= true then
								t_7[sequenceId] = true
								table.insert(t, sequenceId)
							end
							local var48 = t_8[#t_8]
							
							if var48 ~= nil and var48.noteProcessedSequenceNumber ~= nil then
								var48.noteProcessedSequenceNumber(sequenceId)
							end
						end
					end
					return t
				end,
				submitToolResult = function(_) --[[ line: 227 ]]
					-- upvalues: makeRequestHandle (copy)
					local var49, var50 = makeRequestHandle()
					var50(nil)
					
					return var49
				end,
				getActiveTurnHandle = function(_) --[[ line: 230 ]]
					-- upvalues: t_8 (ref)
					return t_8[#t_8]
				end,
				onCasSessionIdChanged = function(_) --[[ line: 233 ]] end
			},
			initializeCalls = t,
			sessionNewCalls = t_1,
			sessionLoadCalls = t_2,
			sessionLoadResults = t_3,
			sessionPromptCalls = t_4,
			ingestSessionHistoryCalls = t_5,
			ingestSessionHistoryResults = t_6,
			turnHandles = t_8,
			finishLastTurn = function(p18) --[[ line: 247 ]]
				-- upvalues: t_9 (ref)
				local var51 = t_9[#t_9]
				
				if var51 ~= nil then
					var51(p18)
				end
			end
		}
	end,
	awaitTurnHandle = function(p19, p20) --[[ line: 256 ]]
		local var52 = os.clock() + (p20 or 3)
		while p19.getTurnHandle(false) == nil and (p19.getSetupError(false) == nil and var52 >= os.clock()) do
			task.wait()
		end
	end,
	waitFor = function(p21, p22) --[[ line: 266 ]]
		local var53 = os.clock() + (p22 or 3)
		while not p21() and var53 >= os.clock() do
			task.wait()
		end
	end
}
local signalsModule = require(script:FindFirstAncestor("DataHydration").Parent.Signals)
local typesModule = require(script.Parent.Parent.types)

local function makeRequestHandle() --[[ line: 16 ]]
	-- upvalues: signalsModule (ref)
	local var4, var5 = signalsModule.createSignal({ status = "pending" })
	
	return { state = var4, dispose = function() --[[ line: 26 ]] end }, function(p0) --[[ line: 18 | named "succeed" ]]
		-- upvalues: var5 (ref)
		var5({ status = "succeeded", result = p0 })
	end, function(p1) --[[ line: 21 | named "fail" ]]
		-- upvalues: var5 (ref)
		var5({ status = "failed", error = p1 })
	end
end

local function makeTurnHandle(p2) --[[ line: 44 ]]
	-- upvalues: signalsModule (ref)
	local var6, var7 = signalsModule.createSignal({
		requestId = nil,
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
		sessionId = p2,
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
	local var8 = false
	local t = {}
	local var10 = 0
	local var11 = nil
	
	return {
		state = var6,
		onNotification = function(p3) --[[ line: 76 ]]
			-- upvalues: var10 (write), t (ref)
			var10 += 1
			local var12 = var10
			t[var12] = p3
			
			return function() --[[ line: 80 ]]
				-- upvalues: t (copy), var12 (ref)
				t[var12] = nil
			end
		end,
		getLatestProcessedSequenceNumber = function() --[[ line: 84 ]]
			-- upvalues: var11 (write)
			return var11
		end,
		cancel = function() --[[ line: 87 ]]
			-- upvalues: var8 (write), var6 (ref), var7 (ref)
			var8 = true
			local cloned = table.clone(var6(false))
			cloned.status = "cancelled"
			cloned.isDone = true
			var7(cloned)
		end,
		wasCancelled = function() --[[ line: 108 ]]
			-- upvalues: var8 (write)
			return var8
		end,
		setLatestProcessedSequenceNumber = function(p4) --[[ line: 111 ]]
			-- upvalues: var11 (write)
			var11 = p4
		end,
		emitNotification = function() --[[ line: 114 ]]
			-- upvalues: t (ref)
			for i, v in t do
				v()
			end
		end
	}, function(p5) --[[ line: 96 | named "finish" ]]
		-- upvalues: var6 (ref), var7 (ref)
		local var14
		local _ = nil
		
		if p5 == nil then
			var14 = table.clone(var6(false))
			var14.status = "succeeded"
			var14.isDone = true
		else
			var14 = p5
		end
		var7(var14)
	end
end

return {
	Types = typesModule,
	makeRequestHandle = makeRequestHandle,
	makeImmediateSuccess = function(p6) --[[ line: 31 ]]
		-- upvalues: makeRequestHandle (ref)
		local var15, var16 = makeRequestHandle()
		var16(p6)
		
		return var15
	end,
	makeImmediateFailure = function(p7) --[[ line: 37 ]]
		-- upvalues: makeRequestHandle (ref)
		local var17, _, var18 = makeRequestHandle()
		var18(p7)
		
		return var17
	end,
	makeTurnHandle = makeTurnHandle,
	defaultDeps = function() --[[ line: 122 ]]
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
		
		return {
			deps = {
				rpcTimeoutSeconds = 5,
				initialize = function(_) --[[ line: 147 ]]
					-- upvalues: t (ref), makeRequestHandle (copy)
					table.insert(t, #t + 1)
					local t_1 = { protocolVersion = 2 }
					local var29, var30 = makeRequestHandle()
					var30(t_1)
					
					return var29
				end,
				sessionNew = function(p8) --[[ line: 151 ]]
					-- upvalues: t_1 (ref), makeRequestHandle (copy)
					table.insert(t_1, p8)
					local t = { sessionId = "cas-session-1" }
					local var32, var33 = makeRequestHandle()
					var33(t)
					
					return var32
				end,
				sessionLoad = function(p9, p10) --[[ line: 155 ]]
					-- upvalues: t_2 (ref), t_3 (ref), makeRequestHandle (copy)
					table.insert(t_2, { sessionId = p9, params = p10 })
					local var34 = t_3[#t_2] or {}
					
					if var34.history == nil and var34.nextHistoryPageToken == nil then
						local t = { history = var34 }
						local var38, var39 = makeRequestHandle()
						var39(t)
						
						return var38
					end
					local var35, var36 = makeRequestHandle()
					var36(var34)
					
					return var35
				end,
				sessionPrompt = function(p11) --[[ line: 163 ]]
					-- upvalues: t_4 (ref), makeTurnHandle (copy), t_7 (ref), t_8 (ref)
					table.insert(t_4, p11)
					local var40, var41 = makeTurnHandle(p11.sessionId)
					table.insert(t_7, var40)
					table.insert(t_8, var41)
					
					return var40
				end,
				ingestSessionHistory = function(p12, p13, p14) --[[ line: 170 ]]
					-- upvalues: t_5 (ref), t_6 (ref)
					table.insert(t_5, { sessionId = p12, history = p13, afterSequenceId = p14 })
					local var42 = t_6[#t_5]
					
					return if var42 == nil then #p13 > 0 else var42
				end,
				submitToolResult = function(_) --[[ line: 179 ]]
					-- upvalues: makeRequestHandle (copy)
					local var43, var44 = makeRequestHandle()
					var44(nil)
					
					return var43
				end,
				getActiveTurnHandle = function(_) --[[ line: 182 ]]
					-- upvalues: t_7 (ref)
					return t_7[#t_7]
				end,
				sessionReadTasks = function(_) --[[ line: 185 ]]
					-- upvalues: makeRequestHandle (copy)
					local t = { tasks = {} }
					local var46, var47 = makeRequestHandle()
					var47(t)
					
					return var46
				end,
				onCasSessionIdChanged = function(_) --[[ line: 188 ]] end
			},
			initializeCalls = t,
			sessionNewCalls = t_1,
			sessionLoadCalls = t_2,
			sessionLoadResults = t_3,
			sessionPromptCalls = t_4,
			ingestSessionHistoryCalls = t_5,
			ingestSessionHistoryResults = t_6,
			turnHandles = t_7,
			finishLastTurn = function(p15) --[[ line: 202 ]]
				-- upvalues: t_8 (ref)
				local var48 = t_8[#t_8]
				
				if var48 ~= nil then
					var48(p15)
				end
			end
		}
	end,
	awaitTurnHandle = function(p16, p17) --[[ line: 211 ]]
		local var49 = os.clock() + (p17 or 3)
		while p16.getTurnHandle(false) == nil and (p16.getSetupError(false) == nil and var49 >= os.clock()) do
			task.wait()
		end
	end,
	waitFor = function(p18, p19) --[[ line: 221 ]]
		local var50 = os.clock() + (p19 or 3)
		while not p18() and var50 >= os.clock() do
			task.wait()
		end
	end
}
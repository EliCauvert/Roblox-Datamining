local signalsModule = require(script:FindFirstAncestor("DataHydration").Parent.Signals)
local typesModule = require(script.Parent.Parent.types)

local function makeRequestHandle()
	-- upvalues: signalsModule (ref)
	local var1, var2 = signalsModule.createSignal({ status = "pending" })
	
	return { state = var1, dispose = function() end }, function(p1)
		-- upvalues: var2 (ref)
		var2({ status = "succeeded", result = p1 })
	end, function(p1)
		-- upvalues: var2 (ref)
		var2({ status = "failed", error = p1 })
	end
end

local function makeTurnHandle(p1)
	-- upvalues: signalsModule (ref)
	local var1, var2 = signalsModule.createSignal({
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
		sessionId = p1,
		assistantMessages = {},
		assistantMessageOrder = {},
		pendingAgentMessageContent = {},
		activitySlots = {},
		activityItems = {},
		toolCalls = {}
	})
	local var3 = false
	local var4 = nil
	local t = {}
	local var5 = 0
	local t_1 = {}
	local var6 = nil
	local var7 = nil
	local var8 = 0
	
	return {
		state = var1,
		getTurnId = function()
			-- upvalues: var4 (write)
			return var4
		end,
		onNotification = function(p2)
			-- upvalues: var5 (write), t (ref)
			var5 += 1
			local var9 = var5
			t[var9] = p2
			
			return function()
				-- upvalues: t (copy), var9 (ref)
				t[var9] = nil
			end
		end,
		getLatestProcessedSequenceNumber = function()
			-- upvalues: var6 (write)
			return var6
		end,
		hasSequenceGap = function()
			-- upvalues: var8 (write)
			return var8 > 0
		end,
		noteProcessedSequenceNumber = function(p2)
			-- upvalues: t_1 (ref), var6 (write), var7 (write), var8 (write)
			if t_1[p2] == true then return end
			t_1[p2] = true
			
			if var6 == nil then
				var6 = p2
				var7 = p2
				
				return
			elseif var6 < p2 then
				var8 += p2 - var6 - 1
				var6 = p2
				
				return
			elseif p2 < var7 then
				var8 += var7 - p2 - 1
				var7 = p2
				
				return
			end
			var8 -= 1
		end,
		cancel = function()
			-- upvalues: var3 (write), var1 (ref), var2 (ref)
			var3 = true
			local cloned = table.clone(var1(false))
			cloned.status = "cancelled"
			cloned.isDone = true
			var2(cloned)
		end,
		wasCancelled = function()
			-- upvalues: var3 (write)
			return var3
		end,
		setTurnId = function(p2)
			-- upvalues: var4 (write)
			var4 = p2
		end,
		setLatestProcessedSequenceNumber = function(p2)
			-- upvalues: t_1 (ref), var6 (write), var7 (write), var8 (write)
			if t_1[p2] == true then return end
			t_1[p2] = true
			
			if var6 == nil then
				var6 = p2
				var7 = p2
				
				return
			elseif var6 < p2 then
				var8 += p2 - var6 - 1
				var6 = p2
				
				return
			elseif p2 < var7 then
				var8 += var7 - p2 - 1
				var7 = p2
				
				return
			end
			var8 -= 1
		end,
		emitNotification = function()
			-- upvalues: t (ref)
			for i, v in t do
				v()
			end
		end,
		markStreaming = function()
			-- upvalues: var1 (ref), var2 (ref)
			local cloned = table.clone(var1(false))
			cloned.status = "streaming"
			var2(cloned)
		end,
		fail = function()
			-- upvalues: var1 (ref), var2 (ref)
			local cloned = table.clone(var1(false))
			cloned.status = "failed"
			cloned.isDone = true
			var2(cloned)
		end
	}, function(p2)
		-- upvalues: var1 (ref), var2 (ref)
		local var9
		local _ = nil
		
		if p2 == nil then
			var9 = table.clone(var1(false))
			var9.status = "succeeded"
			var9.isDone = true
		else
			var9 = p2
		end
		var2(var9)
	end
end

return {
	Types = typesModule,
	makeRequestHandle = makeRequestHandle,
	makeImmediateSuccess = function(p2)
		-- upvalues: makeRequestHandle (ref)
		local var9, var10 = makeRequestHandle()
		var10(p2)
		
		return var9
	end,
	makeImmediateFailure = function(p2)
		-- upvalues: makeRequestHandle (ref)
		local var9, _, var10 = makeRequestHandle()
		var10(p2)
		
		return var9
	end,
	makeImmediateFailureWithCode = function(p2, p3)
		-- upvalues: signalsModule (ref)
		return {
			state = signalsModule.createSignal({ status = "failed", error = p2, errorCode = p3 }),
			dispose = function() end
		}
	end,
	makeTurnHandle = makeTurnHandle,
	defaultDeps = function()
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
				initialize = function(_)
					-- upvalues: t (ref), makeRequestHandle (copy)
					table.insert(t, #t + 1)
					local t_1 = { protocolVersion = 2 }
					local var9, var10 = makeRequestHandle()
					var10(t_1)
					
					return var9
				end,
				sessionNew = function(p2)
					-- upvalues: t_1 (ref), makeRequestHandle (copy)
					table.insert(t_1, p2)
					local t = { sessionId = "cas-session-1" }
					local var9, var10 = makeRequestHandle()
					var10(t)
					
					return var9
				end,
				sessionLoad = function(p2, p3)
					-- upvalues: t_2 (ref), t_3 (ref), makeRequestHandle (copy)
					table.insert(t_2, { sessionId = p2, params = p3 })
					local var9 = t_3[#t_2] or {}
					
					if var9.history == nil and var9.nextHistoryPageToken == nil then
						local t = { history = var9 }
						local var10, var11 = makeRequestHandle()
						var11(t)
						
						return var10
					end
					local var12, var13 = makeRequestHandle()
					var13(var9)
					
					return var12
				end,
				sessionPrompt = function(p2)
					-- upvalues: t_4 (ref), makeTurnHandle (copy), t_8 (ref), t_9 (ref)
					table.insert(t_4, p2)
					local var9, var10 = makeTurnHandle(p2.sessionId)
					table.insert(t_8, var9)
					table.insert(t_9, var10)
					
					return var9
				end,
				ingestSessionHistory = function(p2, p3, p4)
					-- upvalues: t_5 (ref), t_6 (ref), t_7 (ref), t_8 (ref)
					table.insert(t_5, { sessionId = p2, history = p3, afterSequenceId = p4 })
					local var9 = t_6[#t_5]
					
					if var9 ~= nil then
						return var9
					end
					local t = {}
					
					for i, v in p3 do
						local sequenceId = v.sequenceId
						
						if typeof(sequenceId) == "number" and (p4 == nil or p4 < sequenceId) then
							if t_7[sequenceId] ~= true then
								t_7[sequenceId] = true
								table.insert(t, sequenceId)
							end
							local var10 = t_8[#t_8]
							
							if var10 ~= nil and var10.noteProcessedSequenceNumber ~= nil then
								var10.noteProcessedSequenceNumber(sequenceId)
							end
						end
					end
					return t
				end,
				submitToolResult = function(_)
					-- upvalues: makeRequestHandle (copy)
					local var11, var12 = makeRequestHandle()
					var12(nil)
					
					return var11
				end,
				getActiveTurnHandle = function(_)
					-- upvalues: t_8 (ref)
					return t_8[#t_8]
				end,
				onCasSessionIdChanged = function(_) end
			},
			initializeCalls = t,
			sessionNewCalls = t_1,
			sessionLoadCalls = t_2,
			sessionLoadResults = t_3,
			sessionPromptCalls = t_4,
			ingestSessionHistoryCalls = t_5,
			ingestSessionHistoryResults = t_6,
			turnHandles = t_8,
			finishLastTurn = function(p5)
				-- upvalues: t_9 (ref)
				local var11 = t_9[#t_9]
				
				if var11 ~= nil then
					var11(p5)
				end
			end
		}
	end,
	awaitTurnHandle = function(p2, p3)
		local var9 = os.clock() + (p3 or 3)
		while p2.getTurnHandle(false) == nil and (p2.getSetupError(false) == nil and var9 >= os.clock()) do
			task.wait()
		end
	end,
	waitFor = function(p4, p5)
		local var10 = os.clock() + (p5 or 3)
		while not p4() and var10 >= os.clock() do
			task.wait()
		end
	end
}
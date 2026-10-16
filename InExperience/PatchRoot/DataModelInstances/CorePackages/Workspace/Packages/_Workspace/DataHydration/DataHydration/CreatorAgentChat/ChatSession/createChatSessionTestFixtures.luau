local SignalsModule = require(script:FindFirstAncestor("DataHydration").Parent.Signals)

local function makeRequestHandle() --[[ Line: 23 ]]
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal({ status = "pending" })
	
	return {
		state = Signal,
		dispose = function() --[[ Line: 33 ]] end
	}, function(Result) --[[ Line: 25 | Named "succeed" ]]
		-- upvalues: Signal2 (copy)
		Signal2({ status = "succeeded", result = Result })
	end, function(p1) --[[ Line: 28 | Named "fail" ]]
		-- upvalues: Signal2 (copy)
		Signal2({ status = "failed", error = p1 })
	end
end

local function makeTurnHandle(SessionId) --[[ Line: 60 ]]
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal({
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
		sessionId = SessionId,
		assistantMessages = {},
		assistantMessageOrder = {},
		pendingAgentMessageContent = {},
		activitySlots = {},
		activityItems = {},
		toolCalls = {}
	})
	local Flag = false
	local TurnId = nil
	local t = {}
	local Count = 0
	local t1 = {}
	local LatestProcessedSequenceNumber = nil
	local LatestProcessedSequenceNumber1 = nil
	local Total = 0
	
	return {
		state = Signal,
		getTurnId = function() --[[ Line: 112 ]]
			-- upvalues: TurnId (ref)
			return TurnId
		end,
		onNotification = function(p1) --[[ Line: 115 ]]
			-- upvalues: Count (ref), t (copy)
			Count += 1
			local Count1: number = Count
			t[Count1] = p1
			
			return function() --[[ Line: 119 ]]
				-- upvalues: t (upval), Count1 (copy)
				t[Count1] = nil
			end
		end,
		getLatestProcessedSequenceNumber = function() --[[ Line: 123 ]]
			-- upvalues: LatestProcessedSequenceNumber (ref)
			return LatestProcessedSequenceNumber
		end,
		hasSequenceGap = function(): boolean --[[ Line: 126 ]]
			-- upvalues: Total (ref)
			return Total > 0
		end,
		noteProcessedSequenceNumber = function(SequenceId) --[[ Line: 91 ]]
			-- upvalues: t1 (copy), LatestProcessedSequenceNumber (ref), LatestProcessedSequenceNumber1 (ref), Total (ref)
			if t1[SequenceId] == true then return end
			t1[SequenceId] = true
			
			if LatestProcessedSequenceNumber == nil then
				LatestProcessedSequenceNumber = SequenceId
				LatestProcessedSequenceNumber1 = SequenceId
				
				return
			end
			if LatestProcessedSequenceNumber < SequenceId then
				Total += SequenceId - LatestProcessedSequenceNumber - 1
				LatestProcessedSequenceNumber = SequenceId
				
				return
			end
			if SequenceId < LatestProcessedSequenceNumber1 then
				Total += LatestProcessedSequenceNumber1 - SequenceId - 1
				LatestProcessedSequenceNumber1 = SequenceId
				
				return
			else
				Total -= 1
			end
		end,
		cancel = function() --[[ Line: 130 ]]
			-- upvalues: Flag (ref), Signal (copy), Signal2 (copy)
			Flag = true
			local Copy = table.clone(Signal(false))
			Copy.status = "cancelled"
			Copy.isDone = true
			Signal2(Copy)
		end,
		wasCancelled = function() --[[ Line: 151 ]]
			-- upvalues: Flag (ref)
			return Flag
		end,
		setTurnId = function(Value) --[[ Line: 154 ]]
			-- upvalues: TurnId (ref)
			TurnId = Value
		end,
		setLatestProcessedSequenceNumber = function(Value) --[[ Line: 157 ]]
			-- upvalues: t1 (copy), LatestProcessedSequenceNumber (ref), LatestProcessedSequenceNumber1 (ref), Total (ref)
			if t1[Value] == true then return end
			t1[Value] = true
			
			if LatestProcessedSequenceNumber == nil then
				LatestProcessedSequenceNumber = Value
				LatestProcessedSequenceNumber1 = Value
				
				return
			end
			if LatestProcessedSequenceNumber < Value then
				Total += Value - LatestProcessedSequenceNumber - 1
				LatestProcessedSequenceNumber = Value
				
				return
			end
			if Value < LatestProcessedSequenceNumber1 then
				Total += LatestProcessedSequenceNumber1 - Value - 1
				LatestProcessedSequenceNumber1 = Value
				
				return
			else
				Total -= 1
			end
		end,
		emitNotification = function() --[[ Line: 160 ]]
			-- upvalues: t (copy)
			for _, value in t do
				value()
			end
		end,
		markStreaming = function() --[[ Line: 165 ]]
			-- upvalues: Signal (copy), Signal2 (copy)
			local Copy = table.clone(Signal(false))
			Copy.status = "streaming"
			Signal2(Copy)
		end,
		fail = function() --[[ Line: 170 ]]
			-- upvalues: Signal (copy), Signal2 (copy)
			local Copy = table.clone(Signal(false))
			Copy.status = "failed"
			Copy.isDone = true
			Signal2(Copy)
		end
	}, function(p1) --[[ Line: 139 | Named "finish" ]]
		-- upvalues: Signal (copy), Signal2 (copy)
		local v1 = nil
		if p1 == nil then
			v1 = table.clone(Signal(false))
			v1.status = "succeeded"
			v1.isDone = true
		else
			v1 = p1
		end
		Signal2(v1)
	end
end

return {
	Types = require(script.Parent.Parent.types),
	makeRequestHandle = makeRequestHandle,
	makeImmediateSuccess = function(p1) --[[ Line: 38 ]]
		-- upvalues: makeRequestHandle (copy)
		local RequestHandle, RequestHandle2 = makeRequestHandle()
		RequestHandle2(p1)
		
		return RequestHandle
	end,
	makeImmediateFailure = function(p1) --[[ Line: 44 ]]
		-- upvalues: makeRequestHandle (copy)
		local RequestHandle, _, RequestHandle3 = makeRequestHandle()
		RequestHandle3(p1)
		
		return RequestHandle
	end,
	makeImmediateFailureWithCode = function(p1, ErrorCode) --[[ Line: 50 ]]
		-- upvalues: SignalsModule (copy)
		return {
			state = SignalsModule.createSignal({ status = "failed", error = p1, errorCode = ErrorCode }),
			dispose = function() --[[ Line: 55 ]] end
		}
	end,
	makeTurnHandle = makeTurnHandle,
	defaultDeps = function() --[[ Line: 179 ]]
		-- upvalues: makeRequestHandle (copy), makeTurnHandle (copy)
		local InitializeCalls = {}
		local SessionNewCalls = {}
		local SessionLoadCalls = {}
		local SessionLoadResults = {}
		local SessionPromptCalls = {}
		local IngestSessionHistoryCalls = {}
		local IngestSessionHistoryResults = {}
		local t = {}
		local TurnHandles = {}
		local List = {}
		
		return {
			deps = {
				rpcTimeoutSeconds = 5,
				initialize = function(_) --[[ Line: 205 ]]
					-- upvalues: InitializeCalls (copy), makeRequestHandle (upval)
					table.insert(InitializeCalls, #InitializeCalls + 1)
					local config = { protocolVersion = 2 }
					local RequestHandle, RequestHandle2 = makeRequestHandle()
					RequestHandle2(config)
					
					return RequestHandle
				end,
				sessionNew = function(p1) --[[ Line: 209 ]]
					-- upvalues: SessionNewCalls (copy), makeRequestHandle (upval)
					table.insert(SessionNewCalls, p1)
					local config = { sessionId = "cas-session-1" }
					local RequestHandle, RequestHandle2 = makeRequestHandle()
					RequestHandle2(config)
					
					return RequestHandle
				end,
				sessionLoad = function(SessionId, Params) --[[ Line: 213 ]]
					-- upvalues: SessionLoadCalls (copy), SessionLoadResults (copy), makeRequestHandle (upval)
					table.insert(SessionLoadCalls, { sessionId = SessionId, params = Params })
					local SessionLoadResult = SessionLoadResults[#SessionLoadCalls] or {}
					
					if SessionLoadResult.history == nil and SessionLoadResult.nextHistoryPageToken == nil then
						local config = { history = SessionLoadResult }
						local RequestHandle1, RequestHandle2_1 = makeRequestHandle()
						RequestHandle2_1(config)
						
						return RequestHandle1
					else
						local RequestHandle, RequestHandle2 = makeRequestHandle()
						RequestHandle2(SessionLoadResult)
						
						return RequestHandle
					end
				end,
				sessionPrompt = function(p1) --[[ Line: 221 ]]
					-- upvalues: SessionPromptCalls (copy), makeTurnHandle (upval), TurnHandles (copy), List (copy)
					table.insert(SessionPromptCalls, p1)
					local TurnHandle, TurnHandle2 = makeTurnHandle(p1.sessionId)
					table.insert(TurnHandles, TurnHandle)
					table.insert(List, TurnHandle2)
					
					return TurnHandle
				end,
				ingestSessionHistory = function(SessionId, History, AfterSequenceId) --[[ Line: 228 ]]
					-- upvalues: IngestSessionHistoryCalls (copy), IngestSessionHistoryResults (copy), t (copy), TurnHandles (copy)
					table.insert(IngestSessionHistoryCalls, {
						sessionId = SessionId,
						history = History,
						afterSequenceId = AfterSequenceId
					})
					local IngestSessionHistoryResult = IngestSessionHistoryResults[#IngestSessionHistoryCalls]
					
					if IngestSessionHistoryResult ~= nil then
						return IngestSessionHistoryResult
					end
					local List = {}
					
					for _, value in History do
						local SequenceId = value.sequenceId
						
						if typeof(SequenceId) == "number" and (AfterSequenceId == nil or AfterSequenceId < SequenceId) then
							if t[SequenceId] ~= true then
								t[SequenceId] = true
								table.insert(List, SequenceId)
							end
							local TurnHandle = TurnHandles[#TurnHandles]
							
							if TurnHandle ~= nil and TurnHandle.noteProcessedSequenceNumber ~= nil then
								TurnHandle.noteProcessedSequenceNumber(SequenceId)
							end
						end
					end
					return List
				end,
				submitToolResult = function(_) --[[ Line: 254 ]]
					-- upvalues: makeRequestHandle (upval)
					local RequestHandle, RequestHandle2 = makeRequestHandle()
					RequestHandle2(nil)
					
					return RequestHandle
				end,
				getActiveTurnHandle = function(_) --[[ Line: 257 ]]
					-- upvalues: TurnHandles (copy)
					return TurnHandles[#TurnHandles]
				end,
				onCasSessionIdChanged = function(_) --[[ Line: 260 ]] end
			},
			initializeCalls = InitializeCalls,
			sessionNewCalls = SessionNewCalls,
			sessionLoadCalls = SessionLoadCalls,
			sessionLoadResults = SessionLoadResults,
			sessionPromptCalls = SessionPromptCalls,
			ingestSessionHistoryCalls = IngestSessionHistoryCalls,
			ingestSessionHistoryResults = IngestSessionHistoryResults,
			turnHandles = TurnHandles,
			finishLastTurn = function(p1) --[[ Line: 274 ]]
				-- upvalues: List (copy)
				local Entry: (any) -> () = List[#List]
				
				if Entry ~= nil then
					Entry(p1)
				end
			end
		}
	end,
	awaitTurnHandle = function(p1, p2) --[[ Line: 283 ]]
		local NewClockTime = os.clock() + (p2 or 3)
		while p1.getTurnHandle(false) == nil and (p1.getSetupError(false) == nil and NewClockTime >= os.clock()) do
			task.wait()
		end
	end,
	waitFor = function(p3, p4) --[[ Line: 293 ]]
		local NewClockTime = os.clock() + (p4 or 3)
		while not p3() and NewClockTime >= os.clock() do
			task.wait()
		end
	end
}
local _ = require(script.Parent.Parent.types)
local ConstantsModule = require(script.Parent.constants)
local HistoryPageUtilsModule = require(script.Parent.historyPageUtils)
local _ = require(script.Parent.sessionDeps)

return {
	createHistoryPolling = function(p1) --[[ Line: 23 ]]
		-- upvalues: HistoryPageUtilsModule (copy), ConstantsModule (copy)
		local function pollSessionHistory(CasSessionId, AfterSequenceId, Callback1: (any) -> (), Callback): boolean --[[ Line: 24 ]]
			-- upvalues: p1 (copy), HistoryPageUtilsModule (upval)
			if Callback() then
				return false
			end
			local SessionLoadResult = p1.deps.sessionLoad(CasSessionId, nil)
			local AwaitRequestStateResult = HistoryPageUtilsModule.awaitRequestState(SessionLoadResult.state, os.clock() + p1.rpcTimeoutSeconds)
			
			if AwaitRequestStateResult.status == "pending" then
				SessionLoadResult.dispose()
				
				return false
			end
			if Callback() or AwaitRequestStateResult.status ~= "succeeded" then
				return false
			end
			local SessionLoadHistory = HistoryPageUtilsModule.getSessionLoadHistory(AwaitRequestStateResult.result)
			
			if #SessionLoadHistory == 0 or Callback() then
				return false
			end
			if Callback() then
				return false
			end
			p1.mergeHistoryPage(SessionLoadHistory, p1.getNextHistoryPageToken())
			local IngestSessionHistoryResult = p1.deps.ingestSessionHistory(CasSessionId, SessionLoadHistory, AfterSequenceId)
			
			if Callback1 ~= nil then
				for _, value in IngestSessionHistoryResult do
					Callback1(value)
				end
			end
			return not Callback() and #IngestSessionHistoryResult > 0
		end
		
		local function startPollingTurnFromHistory(CasSessionId, ActiveTurnHandle, p2) --[[ Line: 66 ]]
			-- upvalues: HistoryPageUtilsModule (upval), ConstantsModule (upval), p1 (copy), pollSessionHistory (copy)
			local P5 = p2 or {}
			local ResolveNonNegativeNumberResult = HistoryPageUtilsModule.resolveNonNegativeNumber(P5.rtnIdleFallbackSeconds, ConstantsModule.getRtnIdleFallbackSeconds())
			local ResolveNonNegativeNumberResult1 = HistoryPageUtilsModule.resolveNonNegativeNumber(P5.rtnSequenceGapFallbackSeconds, ConstantsModule.getRtnSequenceGapFallbackSeconds())
			local ResolvePositiveNumberResult = HistoryPageUtilsModule.resolvePositiveNumber(P5.pollMinIntervalSeconds, ConstantsModule.getPollMinIntervalSeconds())
			local ResolvePositiveNumberResult1 = HistoryPageUtilsModule.resolvePositiveNumber(P5.pollMaxIntervalSeconds, ConstantsModule.getPollMaxIntervalSeconds())
			
			if ResolvePositiveNumberResult1 < ResolvePositiveNumberResult then
				ResolvePositiveNumberResult1 = ResolvePositiveNumberResult
			end
			local AfterSequenceId = P5.afterSequenceId
			local NoteProcessedSequenceNumberFunction: (any) -> () = ActiveTurnHandle.noteProcessedSequenceNumber
			
			if AfterSequenceId ~= nil and NoteProcessedSequenceNumberFunction ~= nil then
				NoteProcessedSequenceNumberFunction(AfterSequenceId)
			end
			local Flag = false
			local Flag1 = false
			local Flag2 = false
			local v1 = false
			local Flag3 = false
			local Smallest = ResolvePositiveNumberResult
			local ClockTime = os.clock()
			local Flag4 = false
			local Count = 0
			local Count1 = 0
			local Count2 = 0
			
			local function shouldStopPolling() --[[ Line: 110 ]]
				-- upvalues: Flag (ref), ActiveTurnHandle (copy), p1 (upval), CasSessionId (copy)
				return Flag or (ActiveTurnHandle.state(false).isDone or p1.getCasSessionId() ~= CasSessionId)
			end
			
			local Callback = nil
			
			local function _() --[[ Line: 116 | Named "stopPolling" ]]
				-- upvalues: Flag1 (ref), Smallest (ref), ResolvePositiveNumberResult (copy), Count2 (ref)
				if Flag1 then
					Flag1 = false
					Smallest = ResolvePositiveNumberResult
					Count2 += 1
					
					return
				end
			end
			
			local _ = function() --[[ Line: 125 | Named "startPolling" ]]
				-- upvalues: Flag1 (ref), Flag (ref), ActiveTurnHandle (copy), p1 (upval), CasSessionId (copy), Smallest (ref), ResolvePositiveNumberResult (copy), Callback (ref)
				if not Flag1 and (not Flag and (not ActiveTurnHandle.state(false).isDone and p1.getCasSessionId() == CasSessionId)) then
					Flag1 = true
					Smallest = ResolvePositiveNumberResult
					Callback(0)
					
					return
				end
			end
			
			local _ = function() --[[ Line: 134 | Named "updatePollingState" ]]
				-- upvalues: Flag (ref), ActiveTurnHandle (copy), p1 (upval), CasSessionId (copy), Flag1 (ref), Smallest (ref), ResolvePositiveNumberResult (copy), Count2 (ref), Flag2 (ref), Flag3 (ref), Callback (ref)
				if Flag or (ActiveTurnHandle.state(false).isDone or p1.getCasSessionId() ~= CasSessionId) then
					if Flag1 then
						Flag1 = false
						Smallest = ResolvePositiveNumberResult
						Count2 += 1
						
						return
					end
					return
				elseif Flag2 or Flag3 then
					if not Flag1 then
						if not Flag and (not ActiveTurnHandle.state(false).isDone and p1.getCasSessionId() == CasSessionId) then
							Flag1 = true
							Smallest = ResolvePositiveNumberResult
							Callback(0)
							
							return
						end
						return
					end
				elseif not Flag1 then return end
				Flag1 = false
				Smallest = ResolvePositiveNumberResult
				Count2 += 1
			end
			
			local function refreshSequenceGapState() --[[ Line: 144 ]]
				-- upvalues: ActiveTurnHandle (copy), v1 (ref), Flag3 (ref), Count1 (ref), ResolveNonNegativeNumberResult1 (copy), Flag (ref), p1 (upval), CasSessionId (copy), Flag1 (ref), Smallest (ref), ResolvePositiveNumberResult (copy), Count2 (ref), Flag2 (ref), Callback (ref)
				local HasSequenceGapFunction = ActiveTurnHandle.hasSequenceGap
				local HasSequenceGap = HasSequenceGapFunction ~= nil and HasSequenceGapFunction()
				
				if HasSequenceGap == v1 then return end
				v1 = HasSequenceGap
				Flag3 = false
				Count1 += 1
				local Count: number = Count1
				
				if HasSequenceGap then
					task.delay(ResolveNonNegativeNumberResult1, function() --[[ Line: 156 ]]
						-- upvalues: Count (copy), Count1 (upval), Flag (upval), ActiveTurnHandle (upval), p1 (upval), CasSessionId (upval), v1 (upval), Flag3 (upval), Flag1 (upval), Smallest (upval), ResolvePositiveNumberResult (upval), Count2 (upval), Flag2 (upval), Callback (upval)
						if Count ~= Count1 or (Flag or (ActiveTurnHandle.state(false).isDone or p1.getCasSessionId() ~= CasSessionId) or not v1) then return end
						Flag3 = true
						
						if Flag or (ActiveTurnHandle.state(false).isDone or p1.getCasSessionId() ~= CasSessionId) then
							if Flag1 then
								Flag1 = false
								Smallest = ResolvePositiveNumberResult
								Count2 += 1
								
								return
							end
							return
						elseif Flag2 or Flag3 then
							if not Flag1 then
								if not Flag and (not ActiveTurnHandle.state(false).isDone and p1.getCasSessionId() == CasSessionId) then
									Flag1 = true
									Smallest = ResolvePositiveNumberResult
									Callback(0)
									
									return
								end
								return
							end
						elseif not Flag1 then return end
						Flag1 = false
						Smallest = ResolvePositiveNumberResult
						Count2 += 1
					end)
				end
				if Flag or (ActiveTurnHandle.state(false).isDone or p1.getCasSessionId() ~= CasSessionId) then
					if Flag1 then
						Flag1 = false
						Smallest = ResolvePositiveNumberResult
						Count2 += 1
						
						return
					end
					return
				elseif Flag2 or Flag3 then
					if not Flag1 then
						if not Flag and (not ActiveTurnHandle.state(false).isDone and p1.getCasSessionId() == CasSessionId) then
							Flag1 = true
							Smallest = ResolvePositiveNumberResult
							Callback(0)
							
							return
						end
						return
					end
				elseif not Flag1 then return end
				Flag1 = false
				Smallest = ResolvePositiveNumberResult
				Count2 += 1
			end
			
			local _ = nil
			
			local function v33(Delay) --[[ Line: 168 ]]
				-- upvalues: Flag4 (ref), Count (ref), Flag (ref), ActiveTurnHandle (copy), p1 (upval), CasSessionId (copy), ResolveNonNegativeNumberResult (copy), ClockTime (ref), v33 (ref), Flag2 (ref), Flag1 (ref), Smallest (ref), ResolvePositiveNumberResult (copy), Count2 (ref), Flag3 (ref), Callback (ref)
				if not Flag4 then
					Flag4 = true
					local Count1 = Count
					task.delay(Delay, function() --[[ Line: 174 ]]
						-- upvalues: Flag4 (upval), Count1 (copy), Count (upval), Flag (upval), ActiveTurnHandle (upval), p1 (upval), CasSessionId (upval), ResolveNonNegativeNumberResult (upval), ClockTime (upval), v33 (upval), Flag2 (upval), Flag1 (upval), Smallest (upval), ResolvePositiveNumberResult (upval), Count2 (upval), Flag3 (upval), Callback (upval)
						Flag4 = false
						
						if Count1 ~= Count or (Flag or (ActiveTurnHandle.state(false).isDone or p1.getCasSessionId() ~= CasSessionId)) then return end
						local ResolveNonNegativeNumberResultDelta = ResolveNonNegativeNumberResult - (os.clock() - ClockTime)
						
						if ResolveNonNegativeNumberResultDelta > 0 then
							v33(ResolveNonNegativeNumberResultDelta)
							
							return
						end
						Flag2 = true
						
						if Flag or (ActiveTurnHandle.state(false).isDone or p1.getCasSessionId() ~= CasSessionId) then
							if Flag1 then
								Flag1 = false
								Smallest = ResolvePositiveNumberResult
								Count2 += 1
								
								return
							end
							return
						elseif Flag2 or Flag3 then
							if not Flag1 then
								if not Flag and (not ActiveTurnHandle.state(false).isDone and p1.getCasSessionId() == CasSessionId) then
									Flag1 = true
									Smallest = ResolvePositiveNumberResult
									Callback(0)
									
									return
								end
								return
							end
						elseif not Flag1 then return end
						Flag1 = false
						Smallest = ResolvePositiveNumberResult
						Count2 += 1
					end)
					
					return
				end
			end
			
			local _ = function() --[[ Line: 190 | Named "noteRtnActivity" ]]
				-- upvalues: ClockTime (ref), Flag2 (ref), Flag (ref), ActiveTurnHandle (copy), p1 (upval), CasSessionId (copy), Flag1 (ref), Smallest (ref), ResolvePositiveNumberResult (copy), Count2 (ref), Flag3 (ref), Callback (ref), v33 (ref), ResolveNonNegativeNumberResult (copy)
				ClockTime = os.clock()
				Flag2 = false
				
				if Flag or (ActiveTurnHandle.state(false).isDone or p1.getCasSessionId() ~= CasSessionId) then
					if Flag1 then
						Flag1 = false
						Smallest = ResolvePositiveNumberResult
						Count2 += 1
					end
				elseif Flag2 or Flag3 then
					if not Flag1 and (not Flag and (not ActiveTurnHandle.state(false).isDone and p1.getCasSessionId() == CasSessionId)) then
						Flag1 = true
						Smallest = ResolvePositiveNumberResult
						Callback(0)
					end
				elseif Flag1 then
					Flag1 = false
					Smallest = ResolvePositiveNumberResult
					Count2 += 1
				end
				v33(ResolveNonNegativeNumberResult)
			end
			
			Callback = function(Delay) --[[ Line: 197 ]]
				-- upvalues: Count2 (ref), Flag1 (ref), Flag (ref), ActiveTurnHandle (copy), p1 (upval), CasSessionId (copy), pollSessionHistory (upval), AfterSequenceId (copy), P5 (copy), shouldStopPolling (copy), Smallest (ref), ResolvePositiveNumberResult (copy), refreshSequenceGapState (copy), Flag2 (ref), Flag3 (ref), Callback (ref), ResolvePositiveNumberResult1 (ref), ConstantsModule (upval)
				Count2 += 1
				local Count: number = Count2
				task.delay(Delay, function() --[[ Line: 200 ]]
					-- upvalues: Count (copy), Count2 (upval), Flag1 (upval), Flag (upval), ActiveTurnHandle (upval), p1 (upval), CasSessionId (upval), pollSessionHistory (upval), AfterSequenceId (upval), P5 (upval), shouldStopPolling (upval), Smallest (upval), ResolvePositiveNumberResult (upval), refreshSequenceGapState (upval), Flag2 (upval), Flag3 (upval), Callback (upval), ResolvePositiveNumberResult1 (upval), ConstantsModule (upval)
					if Count ~= Count2 or not Flag1 or (Flag or (ActiveTurnHandle.state(false).isDone or p1.getCasSessionId() ~= CasSessionId)) then return end
					local PollSessionHistoryResult = pollSessionHistory(CasSessionId, AfterSequenceId, P5.onDroppedChatMessage, shouldStopPolling)
					
					if not Flag and (not ActiveTurnHandle.state(false).isDone and p1.getCasSessionId() == CasSessionId) then
						refreshSequenceGapState()
						
						if Flag or (ActiveTurnHandle.state(false).isDone or p1.getCasSessionId() ~= CasSessionId) then
							if Flag1 then
								Flag1 = false
								Smallest = ResolvePositiveNumberResult
								Count2 += 1
							end
						elseif Flag2 or Flag3 then
							if not Flag1 and (not Flag and (not ActiveTurnHandle.state(false).isDone and p1.getCasSessionId() == CasSessionId)) then
								Flag1 = true
								Smallest = ResolvePositiveNumberResult
								Callback(0)
							end
						elseif Flag1 then
							Flag1 = false
							Smallest = ResolvePositiveNumberResult
							Count2 += 1
						end
						if not Flag1 then return end
						if PollSessionHistoryResult then
							Smallest = ResolvePositiveNumberResult
						else
							Smallest = math.min(ResolvePositiveNumberResult1, Smallest * ConstantsModule.getPollBackoffMultiplier())
						end
						Callback(Smallest)
						
						return
					elseif Flag1 then
						Flag1 = false
						Smallest = ResolvePositiveNumberResult
						Count2 += 1
						
						return
					else
					end
				end)
			end
			
			local OnNotificationResult = ActiveTurnHandle.onNotification(function() --[[ Line: 232 ]]
				-- upvalues: ClockTime (ref), Flag2 (ref), Flag (ref), ActiveTurnHandle (copy), p1 (upval), CasSessionId (copy), Flag1 (ref), Smallest (ref), ResolvePositiveNumberResult (copy), Count2 (ref), Flag3 (ref), Callback (ref), v33 (ref), ResolveNonNegativeNumberResult (copy), refreshSequenceGapState (copy)
				ClockTime = os.clock()
				Flag2 = false
				
				if Flag or (ActiveTurnHandle.state(false).isDone or p1.getCasSessionId() ~= CasSessionId) then
					if Flag1 then
						Flag1 = false
						Smallest = ResolvePositiveNumberResult
						Count2 += 1
					end
				elseif Flag2 or Flag3 then
					if not Flag1 and (not Flag and (not ActiveTurnHandle.state(false).isDone and p1.getCasSessionId() == CasSessionId)) then
						Flag1 = true
						Smallest = ResolvePositiveNumberResult
						Callback(0)
					end
				elseif Flag1 then
					Flag1 = false
					Smallest = ResolvePositiveNumberResult
					Count2 += 1
				end
				v33(ResolveNonNegativeNumberResult)
				refreshSequenceGapState()
			end)
			refreshSequenceGapState()
			ClockTime = os.clock()
			Flag2 = false
			
			if Flag or (ActiveTurnHandle.state(false).isDone or p1.getCasSessionId() ~= CasSessionId) then
				if Flag1 then
					Flag1 = false
					Smallest = ResolvePositiveNumberResult
					Count2 += 1
				end
			elseif Flag2 or Flag3 then
				if not Flag1 and (not Flag and (not ActiveTurnHandle.state(false).isDone and p1.getCasSessionId() == CasSessionId)) then
					Flag1 = true
					Smallest = ResolvePositiveNumberResult
					Callback(0)
				end
			elseif Flag1 then
				Flag1 = false
				Smallest = ResolvePositiveNumberResult
				Count2 += 1
			end
			v33(ResolveNonNegativeNumberResult)
			
			return function() --[[ Line: 240 ]]
				-- upvalues: Flag (ref), Count (ref), Count1 (ref), Count2 (ref), OnNotificationResult (copy)
				Flag = true
				Count += 1
				Count1 += 1
				Count2 += 1
				OnNotificationResult()
			end
		end
		
		return {
			startPollingTurnFromHistory = startPollingTurnFromHistory,
			startPollingActiveTurn = function(CasSessionId, p2) --[[ Line: 249 ]]
				-- upvalues: p1 (copy), startPollingTurnFromHistory (copy)
				local ActiveTurnHandle = p1.deps.getActiveTurnHandle(CasSessionId)
				
				return if ActiveTurnHandle == nil then function() --[[ Line: 252 ]] end else startPollingTurnFromHistory(CasSessionId, ActiveTurnHandle, p2)
			end
		}
	end
}
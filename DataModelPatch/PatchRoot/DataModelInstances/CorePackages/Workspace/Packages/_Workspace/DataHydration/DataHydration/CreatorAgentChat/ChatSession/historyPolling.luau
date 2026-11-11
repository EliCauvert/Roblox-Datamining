local _ = require(script.Parent.Parent.types)
local ConstantsModule = require(script.Parent.constants)
local HistoryPageUtilsModule = require(script.Parent.historyPageUtils)
local _ = require(script.Parent.sessionDeps)

return {
	createHistoryPolling = function(p1)
		-- upvalues: HistoryPageUtilsModule (copy), ConstantsModule (copy)
		local function pollSessionHistory(p2, AfterSequenceId, Callback)
			-- upvalues: p1 (copy), HistoryPageUtilsModule (upval)
			if Callback() then
				return false
			end
			local SessionLoadResult = p1.deps.sessionLoad(p2, nil)
			local AwaitRequestStateResult = HistoryPageUtilsModule.awaitRequestState(SessionLoadResult.state, os.clock() + p1.rpcTimeoutSeconds)
			
			if AwaitRequestStateResult.status == "pending" then
				SessionLoadResult.dispose()
				
				return false
			elseif Callback() or AwaitRequestStateResult.status ~= "succeeded" then
				return false
			else
				local SessionLoadHistory = HistoryPageUtilsModule.getSessionLoadHistory(AwaitRequestStateResult.result)
				
				if #SessionLoadHistory == 0 or Callback() then
					return false
				elseif Callback() then
					return false
				else
					p1.mergeHistoryPage(SessionLoadHistory, p1.getNextHistoryPageToken())
					local IngestSessionHistoryResult = p1.deps.ingestSessionHistory(p2, SessionLoadHistory, AfterSequenceId)
					
					return not Callback() and IngestSessionHistoryResult
				end
			end
		end
		
		local function startPollingTurnFromHistory(p2, ActiveTurnHandle, p3)
			-- upvalues: HistoryPageUtilsModule (upval), ConstantsModule (upval), pollSessionHistory (copy)
			local P5 = p3 or {}
			local ResolveNonNegativeNumberResult = HistoryPageUtilsModule.resolveNonNegativeNumber(P5.rtnIdleFallbackSeconds, ConstantsModule.getRtnIdleFallbackSeconds())
			local ResolvePositiveNumberResult = HistoryPageUtilsModule.resolvePositiveNumber(P5.pollMinIntervalSeconds, ConstantsModule.getPollMinIntervalSeconds())
			local ResolvePositiveNumberResult1 = HistoryPageUtilsModule.resolvePositiveNumber(P5.pollMaxIntervalSeconds, ConstantsModule.getPollMaxIntervalSeconds())
			
			if ResolvePositiveNumberResult1 < ResolvePositiveNumberResult then
				ResolvePositiveNumberResult1 = ResolvePositiveNumberResult
			end
			local Flag = false
			local Flag1 = false
			local NewClockTime = 0
			local Smallest = ResolvePositiveNumberResult
			local ClockTime = os.clock()
			local OnNotificationResult = ActiveTurnHandle.onNotification(function()
				-- upvalues: ClockTime (ref), Flag1 (ref), Smallest (ref), ResolvePositiveNumberResult (copy)
				ClockTime = os.clock()
				Flag1 = false
				Smallest = ResolvePositiveNumberResult
			end)
			task.spawn(function()
				-- upvalues: Flag (ref), ActiveTurnHandle (copy), Flag1 (ref), ClockTime (ref), ResolveNonNegativeNumberResult (copy), NewClockTime (ref), Smallest (ref), ResolvePositiveNumberResult (copy), pollSessionHistory (upval), p2 (copy), P5 (copy), ResolvePositiveNumberResult1 (ref), ConstantsModule (upval), OnNotificationResult (copy)
				while not Flag and not ActiveTurnHandle.state(false).isDone do
					local ClockTime1 = os.clock()
					
					if not Flag1 and ResolveNonNegativeNumberResult <= ClockTime1 - ClockTime then
						Flag1 = true
						NewClockTime = ClockTime1
						Smallest = ResolvePositiveNumberResult
					end
					if Flag1 and NewClockTime <= ClockTime1 then
						local PollSessionHistoryResult = pollSessionHistory(p2, P5.afterSequenceId, function()
							-- upvalues: Flag (upval), ActiveTurnHandle (upval)
							return Flag or ActiveTurnHandle.state(false).isDone
						end)
						
						if Flag or ActiveTurnHandle.state(false).isDone then break end
						if Flag1 then
							if PollSessionHistoryResult then
								Smallest = ResolvePositiveNumberResult
							else
								Smallest = math.min(ResolvePositiveNumberResult1, Smallest * ConstantsModule.getPollBackoffMultiplier())
							end
							NewClockTime = os.clock() + Smallest
						end
					end
					task.wait()
				end
				OnNotificationResult()
			end)
			
			return function()
				-- upvalues: Flag (ref), OnNotificationResult (copy)
				Flag = true
				OnNotificationResult()
			end
		end
		
		return {
			startPollingTurnFromHistory = startPollingTurnFromHistory,
			startPollingActiveTurn = function(p4, p5)
				-- upvalues: p1 (copy), startPollingTurnFromHistory (copy)
				local ActiveTurnHandle = p1.deps.getActiveTurnHandle(p4)
				
				return if ActiveTurnHandle == nil then function() end else startPollingTurnFromHistory(p4, ActiveTurnHandle, p5)
			end
		}
	end
}
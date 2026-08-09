local _ = require(script.Parent.Parent.types)
local constantsModule = require(script.Parent.constants)
local historyPageUtilsModule = require(script.Parent.historyPageUtils)
local _ = require(script.Parent.sessionDeps)

return {
	createHistoryPolling = function(p0) --[[ line: 23 ]]
		-- upvalues: historyPageUtilsModule (ref), constantsModule (ref)
		local function pollSessionHistory(p1, p2, p3) --[[ line: 24 ]]
			-- upvalues: p0 (ref), historyPageUtilsModule (copy)
			if p3() then
				return false
			end
			local var4 = p0.deps.sessionLoad(p1, nil)
			local var5 = historyPageUtilsModule.awaitRequestState(var4.state, os.clock() + p0.rpcTimeoutSeconds)
			
			if var5.status == "pending" then
				var4.dispose()
				
				return false
			elseif p3() or var5.status ~= "succeeded" then
				return false
			end
			local sessionLoadHistory = historyPageUtilsModule.getSessionLoadHistory(var5.result)
			
			if #sessionLoadHistory == 0 or p3() then
				return false
			elseif p3() then
				return false
			end
			p0.mergeHistoryPage(sessionLoadHistory, p0.getNextHistoryPageToken())
			
			return if p3() then false else p0.deps.ingestSessionHistory(p1, sessionLoadHistory, p2)
		end
		
		local function startPollingTurnFromHistory(p4, p5, p6) --[[ line: 60 ]]
			-- upvalues: historyPageUtilsModule (copy), constantsModule (copy), pollSessionHistory (ref)
			p6 = p6 or {}
			local var8 = historyPageUtilsModule.resolveNonNegativeNumber(p6.rtnIdleFallbackSeconds, constantsModule.getRtnIdleFallbackSeconds())
			local var9 = historyPageUtilsModule.resolvePositiveNumber(p6.pollMinIntervalSeconds, constantsModule.getPollMinIntervalSeconds())
			local var10 = historyPageUtilsModule.resolvePositiveNumber(p6.pollMaxIntervalSeconds, constantsModule.getPollMaxIntervalSeconds())
			
			if var10 < var9 then
				var10 = var9
			end
			local var11 = false
			local var12 = false
			local var13 = 0
			local var14 = var9
			local processTime = os.clock()
			local var16 = p5.onNotification(function() --[[ line: 88 ]]
				-- upvalues: processTime (write), var12 (write), var14 (write), var9 (ref)
				processTime = os.clock()
				var12 = false
				var14 = var9
			end)
			task.spawn(function() --[[ line: 94 ]]
				-- upvalues: var11 (write), p5 (ref), var12 (write), processTime (write), var8 (ref), var13 (write), var14 (write), var9 (ref), pollSessionHistory (copy), p4 (ref), p6 (ref), var10 (write), constantsModule (copy), var16 (ref)
				while not var11 and not p5.state(false).isDone do
					local processTime_1 = os.clock()
					
					if not var12 and var8 <= processTime_1 - processTime then
						var12 = true
						var13 = processTime_1
						var14 = var9
					end
					if not var12 or var13 > processTime_1 then
						task.wait()
						continue
					end
					local var18 = pollSessionHistory(p4, p6.afterSequenceId, function() --[[ line: 104 ]]
						-- upvalues: var11 (copy), p5 (copy)
						return var11 or p5.state(false).isDone
					end)
					
					if var11 or p5.state(false).isDone then break end
					if var12 then
						var14 = if var18 then var9 else math.min(var10, var14 * constantsModule.getPollBackoffMultiplier())
						var13 = os.clock() + var14
					end
				end
				var16()
			end)
			
			return function() --[[ line: 128 ]]
				-- upvalues: var11 (write), var16 (ref)
				var11 = true
				var16()
			end
		end
		
		return {
			startPollingTurnFromHistory = startPollingTurnFromHistory,
			startPollingActiveTurn = function(p7, p8) --[[ line: 134 ]]
				-- upvalues: p0 (ref), startPollingTurnFromHistory (ref)
				local activeTurnHandle = p0.deps.getActiveTurnHandle(p7)
				
				return if activeTurnHandle == nil then function() --[[ line: 137 ]] end else startPollingTurnFromHistory(p7, activeTurnHandle, p8)
			end
		}
	end
}
local _ = require(script.Parent.Parent.types)
local constantsModule = require(script.Parent.constants)
local historyPageUtilsModule = require(script.Parent.historyPageUtils)
local _ = require(script.Parent.sessionDeps)

return {
	createHistoryPolling = function(p0) --[[ line: 23 ]]
		-- upvalues: historyPageUtilsModule (ref), constantsModule (ref)
		local function pollSessionHistory(p1, p2, p3, p4) --[[ line: 24 ]]
			-- upvalues: p0 (ref), historyPageUtilsModule (copy)
			if p4() then
				return false
			end
			local var4 = p0.deps.sessionLoad(p1, nil)
			local var5 = historyPageUtilsModule.awaitRequestState(var4.state, os.clock() + p0.rpcTimeoutSeconds)
			
			if var5.status == "pending" then
				var4.dispose()
				
				return false
			elseif p4() or var5.status ~= "succeeded" then
				return false
			end
			local sessionLoadHistory = historyPageUtilsModule.getSessionLoadHistory(var5.result)
			
			if #sessionLoadHistory == 0 or p4() then
				return false
			elseif p4() then
				return false
			end
			p0.mergeHistoryPage(sessionLoadHistory, p0.getNextHistoryPageToken())
			local var7 = p0.deps.ingestSessionHistory(p1, sessionLoadHistory, p2)
			
			if p3 ~= nil then
				for i, v in var7 do
					p3(v)
				end
			end
			return if p4() then false else #var7 > 0
		end
		
		local function startPollingTurnFromHistory(p5, p6, p7) --[[ line: 66 ]]
			-- upvalues: historyPageUtilsModule (copy), constantsModule (copy), p0 (ref), pollSessionHistory (ref)
			p7 = p7 or {}
			local var9 = historyPageUtilsModule.resolveNonNegativeNumber(p7.rtnIdleFallbackSeconds, constantsModule.getRtnIdleFallbackSeconds())
			local var10 = historyPageUtilsModule.resolveNonNegativeNumber(p7.rtnSequenceGapFallbackSeconds, constantsModule.getRtnSequenceGapFallbackSeconds())
			local var11 = historyPageUtilsModule.resolvePositiveNumber(p7.pollMinIntervalSeconds, constantsModule.getPollMinIntervalSeconds())
			local var12 = historyPageUtilsModule.resolvePositiveNumber(p7.pollMaxIntervalSeconds, constantsModule.getPollMaxIntervalSeconds())
			
			if var12 < var11 then
				var12 = var11
			end
			local afterSequenceId = p7.afterSequenceId
			local noteProcessedSequenceNumber = p6.noteProcessedSequenceNumber
			
			if afterSequenceId ~= nil and noteProcessedSequenceNumber ~= nil then
				noteProcessedSequenceNumber(afterSequenceId)
			end
			local var13 = false
			local var14 = false
			local var15 = false
			local var16 = false
			local var17 = false
			local var18 = var11
			local processTime = os.clock()
			local var20 = false
			local var21 = 0
			local var22 = 0
			local var23 = 0
			
			local function shouldStopPolling() --[[ line: 110 ]]
				-- upvalues: var13 (write), p6 (ref), p0 (copy), p5 (ref)
				return var13 or (p6.state(false).isDone or p0.getCasSessionId() ~= p5)
			end
			
			local var25 = nil
			
			local function _() --[[ line: 116 | named "stopPolling" ]]
				-- upvalues: var14 (write), var18 (write), var11 (ref), var23 (write)
				if var14 then
					var14 = false
					var18 = var11
					var23 += 1
					
					return
				end
			end
			
			local _ = function() --[[ line: 125 | named "startPolling" ]]
				-- upvalues: var14 (write), var13 (write), p6 (ref), p0 (copy), p5 (ref), var18 (write), var11 (ref), var25 (write)
				if var14 or (var13 or (p6.state(false).isDone or p0.getCasSessionId() ~= p5)) then
					return
				end
				var14 = true
				var18 = var11
				var25(0)
			end
			
			local _ = function() --[[ line: 134 | named "updatePollingState" ]]
				-- upvalues: var13 (write), p6 (ref), p0 (copy), p5 (ref), var14 (write), var18 (write), var11 (ref), var23 (write), var15 (write), var17 (write), var25 (write)
				if var13 or (p6.state(false).isDone or p0.getCasSessionId() ~= p5) then
					if var14 then
						var14 = false
						var18 = var11
						var23 += 1
						
						return
					end
					return
				elseif var15 or var17 then
					if var14 then return end
					if var13 or (p6.state(false).isDone or p0.getCasSessionId() ~= p5) then
						return
					end
					var14 = true
					var18 = var11
					var25(0)
					
					return
				elseif not var14 then return end
				var14 = false
				var18 = var11
				var23 += 1
			end
			
			local function refreshSequenceGapState() --[[ line: 144 ]]
				-- upvalues: p6 (ref), var16 (write), var17 (write), var22 (write), var10 (ref), var13 (write), p0 (copy), p5 (ref), var14 (write), var18 (write), var11 (ref), var23 (write), var15 (write), var25 (write)
				local hasSequenceGap = p6.hasSequenceGap
				local var29 = hasSequenceGap ~= nil and hasSequenceGap()
				
				if var29 == var16 then return end
				var16 = var29
				var17 = false
				var22 += 1
				local var30 = var22
				
				if var29 then
					task.delay(var10, function() --[[ line: 156 ]]
						-- upvalues: var30 (ref), var22 (copy), var13 (copy), p6 (copy), p0 (copy), p5 (copy), var16 (copy), var17 (copy), var14 (copy), var18 (copy), var11 (copy), var23 (copy), var15 (copy), var25 (copy)
						if var30 ~= var22 or (var13 or (p6.state(false).isDone or p0.getCasSessionId() ~= p5)) or not var16 then return end
						var17 = true
						
						if var13 or (p6.state(false).isDone or p0.getCasSessionId() ~= p5) then
							if var14 then
								var14 = false
								var18 = var11
								var23 += 1
								
								return
							end
							return
						end
						if not var14 then
							if var13 or (p6.state(false).isDone or p0.getCasSessionId() ~= p5) then return end
							var14 = true
							var18 = var11
							var25(0)
							
							return
						end
					end)
				end
				if var13 or (p6.state(false).isDone or p0.getCasSessionId() ~= p5) then
					if var14 then
						var14 = false
						var18 = var11
						var23 += 1
						
						return
					end
					return
				elseif var15 then
					if var14 then return end
					if var13 or (p6.state(false).isDone or p0.getCasSessionId() ~= p5) then
						return
					end
					var14 = true
					var18 = var11
					var25(0)
					
					return
				elseif not var14 then return end
				var14 = false
				var18 = var11
				var23 += 1
			end
			
			local _ = nil
			
			local var27 = function(p8) --[[ line: 168 ]]
				-- upvalues: var20 (write), var21 (write), var13 (write), p6 (ref), p0 (copy), p5 (ref), var9 (ref), processTime (write), var27 (write), var15 (write), var14 (write), var18 (write), var11 (ref), var23 (write), var17 (write), var25 (write)
				if var20 then
					return
				end
				var20 = true
				task.delay(p8, function() --[[ line: 174 ]]
					-- upvalues: var20 (copy), var21 (ref), var21 (copy), var13 (copy), p6 (copy), p0 (copy), p5 (copy), var9 (copy), processTime (copy), var27 (copy), var15 (copy), var14 (copy), var18 (copy), var11 (copy), var23 (copy), var17 (copy), var25 (copy)
					var20 = false
					
					if var21 ~= var21 or (var13 or (p6.state(false).isDone or p0.getCasSessionId() ~= p5)) then return end
					local var31 = var9 - (os.clock() - processTime)
					
					if var31 > 0 then
						var27(var31)
						
						return
					end
					var15 = true
					
					if var13 or (p6.state(false).isDone or p0.getCasSessionId() ~= p5) then
						if var14 then
							var14 = false
							var18 = var11
							var23 += 1
							
							return
						end
						return
					elseif var14 then return end
					if var13 or (p6.state(false).isDone or p0.getCasSessionId() ~= p5) then
						return
					end
					var14 = true
					var18 = var11
					var25(0)
				end)
			end
			
			local _ = function() --[[ line: 190 | named "noteRtnActivity" ]]
				-- upvalues: processTime (write), var15 (write), var13 (write), p6 (ref), p0 (copy), p5 (ref), var14 (write), var18 (write), var11 (ref), var23 (write), var17 (write), var25 (write), var27 (write), var9 (ref)
				processTime = os.clock()
				var15 = false
				
				if var13 or (p6.state(false).isDone or p0.getCasSessionId() ~= p5) then
					if var14 then
						var14 = false
						var18 = var11
						var23 += 1
					end
				elseif var17 then
					if not var14 and (not var13 and (not p6.state(false).isDone and p0.getCasSessionId() == p5)) then
						var14 = true
						var18 = var11
						var25(0)
					end
				elseif var14 then
					var14 = false
					var18 = var11
					var23 += 1
				end
				var27(var9)
			end
			
			var25 = function(p9) --[[ line: 197 ]]
				-- upvalues: var23 (write), var14 (write), var13 (write), p6 (ref), p0 (copy), p5 (ref), pollSessionHistory (copy), afterSequenceId (ref), p7 (ref), shouldStopPolling (ref), var18 (write), var11 (ref), refreshSequenceGapState (ref), var15 (write), var17 (write), var25 (write), var12 (write), constantsModule (copy)
				var23 += 1
				local var32 = var23
				task.delay(p9, function() --[[ line: 200 ]]
					-- upvalues: var32 (ref), var23 (copy), var14 (copy), var13 (copy), p6 (copy), p0 (copy), p5 (copy), pollSessionHistory (copy), afterSequenceId (copy), p7 (copy), shouldStopPolling (copy), var18 (copy), var11 (copy), refreshSequenceGapState (copy), var15 (copy), var17 (copy), var25 (copy), var12 (copy), constantsModule (copy)
					if var32 ~= var23 or not var14 or (var13 or (p6.state(false).isDone or p0.getCasSessionId() ~= p5)) then return end
					local var33 = pollSessionHistory(p5, afterSequenceId, p7.onDroppedChatMessage, shouldStopPolling)
					
					if var13 or (p6.state(false).isDone or p0.getCasSessionId() ~= p5) then
						if var14 then
							var14 = false
							var18 = var11
							var23 += 1
							
							return
						end
						return
					else
						refreshSequenceGapState()
						
						if var13 or (p6.state(false).isDone or p0.getCasSessionId() ~= p5) then
							if var14 then
								var14 = false
								var18 = var11
								var23 += 1
							end
						elseif var15 or var17 then
							if not var14 and (not var13 and (not p6.state(false).isDone and p0.getCasSessionId() == p5)) then
								var14 = true
								var18 = var11
								var25(0)
							end
						elseif var14 then
							var14 = false
							var18 = var11
							var23 += 1
						end
						if var14 then
							var18 = if var33 then var11 else math.min(var12, var18 * constantsModule.getPollBackoffMultiplier())
							var25(var18)
							
							return
						end
					end
				end)
			end
			
			local var28 = p6.onNotification(function() --[[ line: 232 ]]
				-- upvalues: processTime (write), var15 (write), var13 (write), p6 (ref), p0 (copy), p5 (ref), var14 (write), var18 (write), var11 (ref), var23 (write), var17 (write), var25 (write), var27 (write), var9 (ref), refreshSequenceGapState (ref)
				processTime = os.clock()
				var15 = false
				
				if var13 or (p6.state(false).isDone or p0.getCasSessionId() ~= p5) then
					if var14 then
						var14 = false
						var18 = var11
						var23 += 1
					end
				elseif var17 then
					if not var14 and (not var13 and (not p6.state(false).isDone and p0.getCasSessionId() == p5)) then
						var14 = true
						var18 = var11
						var25(0)
					end
				elseif var14 then
					var14 = false
					var18 = var11
					var23 += 1
				end
				var27(var9)
				refreshSequenceGapState()
			end)
			refreshSequenceGapState()
			processTime = os.clock()
			var15 = false
			var27(var9)
			
			return function() --[[ line: 240 ]]
				-- upvalues: var13 (write), var21 (write), var22 (write), var23 (write), var28 (ref)
				var13 = true
				var21 += 1
				var22 += 1
				var23 += 1
				var28()
			end
		end
		
		return {
			startPollingTurnFromHistory = startPollingTurnFromHistory,
			startPollingActiveTurn = function(p10, p11) --[[ line: 249 ]]
				-- upvalues: p0 (ref), startPollingTurnFromHistory (ref)
				local activeTurnHandle = p0.deps.getActiveTurnHandle(p10)
				
				return if activeTurnHandle == nil then function() --[[ line: 252 ]] end else startPollingTurnFromHistory(p10, activeTurnHandle, p11)
			end
		}
	end
}
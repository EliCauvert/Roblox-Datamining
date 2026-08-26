local _ = require(script.Parent.Parent.types)
local constantsModule = require(script.Parent.constants)
local historyPageUtilsModule = require(script.Parent.historyPageUtils)
local _ = require(script.Parent.sessionDeps)

return {
	createHistoryPolling = function(p1)
		-- upvalues: historyPageUtilsModule (ref), constantsModule (ref)
		local function pollSessionHistory(p2, p3, p4, p5)
			-- upvalues: p1 (ref), historyPageUtilsModule (copy)
			if p5() then
				return false
			end
			local var1 = p1.deps.sessionLoad(p2, nil)
			local var2 = historyPageUtilsModule.awaitRequestState(var1.state, os.clock() + p1.rpcTimeoutSeconds)
			
			if var2.status == "pending" then
				var1.dispose()
				
				return false
			elseif p5() or var2.status ~= "succeeded" then
				return false
			end
			local sessionLoadHistory = historyPageUtilsModule.getSessionLoadHistory(var2.result)
			
			if #sessionLoadHistory == 0 or p5() then
				return false
			elseif p5() then
				return false
			end
			p1.mergeHistoryPage(sessionLoadHistory, p1.getNextHistoryPageToken())
			local var3 = p1.deps.ingestSessionHistory(p2, sessionLoadHistory, p3)
			
			if p4 ~= nil then
				for i, v in var3 do
					p4(v)
				end
			end
			return if p5() then false else #var3 > 0
		end
		
		local function startPollingTurnFromHistory(p6, p7, p8)
			-- upvalues: historyPageUtilsModule (copy), constantsModule (copy), p1 (ref), pollSessionHistory (ref)
			p8 = p8 or {}
			local var4 = historyPageUtilsModule.resolveNonNegativeNumber(p8.rtnIdleFallbackSeconds, constantsModule.getRtnIdleFallbackSeconds())
			local var5 = historyPageUtilsModule.resolveNonNegativeNumber(p8.rtnSequenceGapFallbackSeconds, constantsModule.getRtnSequenceGapFallbackSeconds())
			local var6 = historyPageUtilsModule.resolvePositiveNumber(p8.pollMinIntervalSeconds, constantsModule.getPollMinIntervalSeconds())
			local var7 = historyPageUtilsModule.resolvePositiveNumber(p8.pollMaxIntervalSeconds, constantsModule.getPollMaxIntervalSeconds())
			
			if var7 < var6 then
				var7 = var6
			end
			local afterSequenceId = p8.afterSequenceId
			local noteProcessedSequenceNumber = p7.noteProcessedSequenceNumber
			
			if afterSequenceId ~= nil and noteProcessedSequenceNumber ~= nil then
				noteProcessedSequenceNumber(afterSequenceId)
			end
			local var8 = false
			local var9 = false
			local var10 = false
			local var11 = false
			local var12 = false
			local var13 = var6
			local processTime = os.clock()
			local var14 = false
			local var15 = 0
			local var16 = 0
			local var17 = 0
			
			local function shouldStopPolling()
				-- upvalues: var8 (write), p7 (ref), p1 (copy), p6 (ref)
				return var8 or (p7.state(false).isDone or p1.getCasSessionId() ~= p6)
			end
			
			local var18 = nil
			
			local function _()
				-- upvalues: var9 (write), var13 (write), var6 (ref), var17 (write)
				if var9 then
					var9 = false
					var13 = var6
					var17 += 1
					
					return
				end
			end
			
			local _ = function()
				-- upvalues: var9 (write), var8 (write), p7 (ref), p1 (copy), p6 (ref), var13 (write), var6 (ref), var18 (write)
				if var9 or (var8 or (p7.state(false).isDone or p1.getCasSessionId() ~= p6)) then
					return
				end
				var9 = true
				var13 = var6
				var18(0)
			end
			
			local _ = function()
				-- upvalues: var8 (write), p7 (ref), p1 (copy), p6 (ref), var9 (write), var13 (write), var6 (ref), var17 (write), var10 (write), var12 (write), var18 (write)
				if var8 or (p7.state(false).isDone or p1.getCasSessionId() ~= p6) then
					if var9 then
						var9 = false
						var13 = var6
						var17 += 1
						
						return
					end
					return
				elseif var10 or var12 then
					if var9 then return end
					if var8 or (p7.state(false).isDone or p1.getCasSessionId() ~= p6) then
						return
					end
					var9 = true
					var13 = var6
					var18(0)
					
					return
				elseif not var9 then return end
				var9 = false
				var13 = var6
				var17 += 1
			end
			
			local function refreshSequenceGapState()
				-- upvalues: p7 (ref), var11 (write), var12 (write), var16 (write), var5 (ref), var8 (write), p1 (copy), p6 (ref), var9 (write), var13 (write), var6 (ref), var17 (write), var10 (write), var18 (write)
				local hasSequenceGap = p7.hasSequenceGap
				local var19 = hasSequenceGap ~= nil and hasSequenceGap()
				
				if var19 == var11 then return end
				var11 = var19
				var12 = false
				var16 += 1
				local var20 = var16
				
				if var19 then
					task.delay(var5, function()
						-- upvalues: var20 (ref), var16 (copy), var8 (copy), p7 (copy), p1 (copy), p6 (copy), var11 (copy), var12 (copy), var9 (copy), var13 (copy), var6 (copy), var17 (copy), var10 (copy), var18 (copy)
						if var20 ~= var16 or (var8 or (p7.state(false).isDone or p1.getCasSessionId() ~= p6)) or not var11 then return end
						var12 = true
						
						if var8 or (p7.state(false).isDone or p1.getCasSessionId() ~= p6) then
							if var9 then
								var9 = false
								var13 = var6
								var17 += 1
								
								return
							end
							return
						end
						if not var9 then
							if var8 or (p7.state(false).isDone or p1.getCasSessionId() ~= p6) then return end
							var9 = true
							var13 = var6
							var18(0)
							
							return
						end
					end)
				end
				if var8 or (p7.state(false).isDone or p1.getCasSessionId() ~= p6) then
					if var9 then
						var9 = false
						var13 = var6
						var17 += 1
						
						return
					end
					return
				elseif var10 then
					if var9 then return end
					if var8 or (p7.state(false).isDone or p1.getCasSessionId() ~= p6) then
						return
					end
					var9 = true
					var13 = var6
					var18(0)
					
					return
				elseif not var9 then return end
				var9 = false
				var13 = var6
				var17 += 1
			end
			
			local _ = nil
			
			local var19 = function(p9)
				-- upvalues: var14 (write), var15 (write), var8 (write), p7 (ref), p1 (copy), p6 (ref), var4 (ref), processTime (write), var19 (write), var10 (write), var9 (write), var13 (write), var6 (ref), var17 (write), var12 (write), var18 (write)
				if var14 then
					return
				end
				var14 = true
				task.delay(p9, function()
					-- upvalues: var14 (copy), var15 (ref), var15 (copy), var8 (copy), p7 (copy), p1 (copy), p6 (copy), var4 (copy), processTime (copy), var19 (copy), var10 (copy), var9 (copy), var13 (copy), var6 (copy), var17 (copy), var12 (copy), var18 (copy)
					var14 = false
					
					if var15 ~= var15 or (var8 or (p7.state(false).isDone or p1.getCasSessionId() ~= p6)) then return end
					local var20 = var4 - (os.clock() - processTime)
					
					if var20 > 0 then
						var19(var20)
						
						return
					end
					var10 = true
					
					if var8 or (p7.state(false).isDone or p1.getCasSessionId() ~= p6) then
						if var9 then
							var9 = false
							var13 = var6
							var17 += 1
							
							return
						end
						return
					elseif var9 then return end
					if var8 or (p7.state(false).isDone or p1.getCasSessionId() ~= p6) then
						return
					end
					var9 = true
					var13 = var6
					var18(0)
				end)
			end
			
			local _ = function()
				-- upvalues: processTime (write), var10 (write), var8 (write), p7 (ref), p1 (copy), p6 (ref), var9 (write), var13 (write), var6 (ref), var17 (write), var12 (write), var18 (write), var19 (write), var4 (ref)
				processTime = os.clock()
				var10 = false
				
				if var8 or (p7.state(false).isDone or p1.getCasSessionId() ~= p6) then
					if var9 then
						var9 = false
						var13 = var6
						var17 += 1
					end
				elseif var12 then
					if not var9 and (not var8 and (not p7.state(false).isDone and p1.getCasSessionId() == p6)) then
						var9 = true
						var13 = var6
						var18(0)
					end
				elseif var9 then
					var9 = false
					var13 = var6
					var17 += 1
				end
				var19(var4)
			end
			
			var18 = function(p9)
				-- upvalues: var17 (write), var9 (write), var8 (write), p7 (ref), p1 (copy), p6 (ref), pollSessionHistory (copy), afterSequenceId (ref), p8 (ref), shouldStopPolling (ref), var13 (write), var6 (ref), refreshSequenceGapState (ref), var10 (write), var12 (write), var18 (write), var7 (write), constantsModule (copy)
				var17 += 1
				local var20 = var17
				task.delay(p9, function()
					-- upvalues: var20 (ref), var17 (copy), var9 (copy), var8 (copy), p7 (copy), p1 (copy), p6 (copy), pollSessionHistory (copy), afterSequenceId (copy), p8 (copy), shouldStopPolling (copy), var13 (copy), var6 (copy), refreshSequenceGapState (copy), var10 (copy), var12 (copy), var18 (copy), var7 (copy), constantsModule (copy)
					if var20 ~= var17 or not var9 or (var8 or (p7.state(false).isDone or p1.getCasSessionId() ~= p6)) then return end
					local var21 = pollSessionHistory(p6, afterSequenceId, p8.onDroppedChatMessage, shouldStopPolling)
					
					if var8 or (p7.state(false).isDone or p1.getCasSessionId() ~= p6) then
						if var9 then
							var9 = false
							var13 = var6
							var17 += 1
							
							return
						end
						return
					else
						refreshSequenceGapState()
						
						if var8 or (p7.state(false).isDone or p1.getCasSessionId() ~= p6) then
							if var9 then
								var9 = false
								var13 = var6
								var17 += 1
							end
						elseif var10 or var12 then
							if not var9 and (not var8 and (not p7.state(false).isDone and p1.getCasSessionId() == p6)) then
								var9 = true
								var13 = var6
								var18(0)
							end
						elseif var9 then
							var9 = false
							var13 = var6
							var17 += 1
						end
						if var9 then
							var13 = if var21 then var6 else math.min(var7, var13 * constantsModule.getPollBackoffMultiplier())
							var18(var13)
							
							return
						end
					end
				end)
			end
			
			local var20 = p7.onNotification(function()
				-- upvalues: processTime (write), var10 (write), var8 (write), p7 (ref), p1 (copy), p6 (ref), var9 (write), var13 (write), var6 (ref), var17 (write), var12 (write), var18 (write), var19 (write), var4 (ref), refreshSequenceGapState (ref)
				processTime = os.clock()
				var10 = false
				
				if var8 or (p7.state(false).isDone or p1.getCasSessionId() ~= p6) then
					if var9 then
						var9 = false
						var13 = var6
						var17 += 1
					end
				elseif var12 then
					if not var9 and (not var8 and (not p7.state(false).isDone and p1.getCasSessionId() == p6)) then
						var9 = true
						var13 = var6
						var18(0)
					end
				elseif var9 then
					var9 = false
					var13 = var6
					var17 += 1
				end
				var19(var4)
				refreshSequenceGapState()
			end)
			refreshSequenceGapState()
			processTime = os.clock()
			var10 = false
			var19(var4)
			
			return function()
				-- upvalues: var8 (write), var15 (write), var16 (write), var17 (write), var20 (ref)
				var8 = true
				var15 += 1
				var16 += 1
				var17 += 1
				var20()
			end
		end
		
		return {
			startPollingTurnFromHistory = startPollingTurnFromHistory,
			startPollingActiveTurn = function(p6, p7)
				-- upvalues: p1 (ref), startPollingTurnFromHistory (ref)
				local activeTurnHandle = p1.deps.getActiveTurnHandle(p6)
				
				return if activeTurnHandle == nil then function() end else startPollingTurnFromHistory(p6, activeTurnHandle, p7)
			end
		}
	end
}
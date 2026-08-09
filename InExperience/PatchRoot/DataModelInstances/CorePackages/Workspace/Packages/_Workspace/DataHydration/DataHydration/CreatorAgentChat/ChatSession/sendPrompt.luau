local signalsModule = require(script:FindFirstAncestor("DataHydration").Parent.Signals)
local _ = require(script.Parent.Parent.types)

return {
	createSendPrompt = function(p0) --[[ line: 31 ]]
		-- upvalues: signalsModule (ref)
		return {
			sendPrompt = function(p1) --[[ line: 32 ]]
				-- upvalues: p0 (ref), signalsModule (copy)
				local var1 = p0.incrementAssistantTurnSequence()
				local var2, var3 = signalsModule.createSignal(nil)
				local var4, var5 = signalsModule.createSignal(nil)
				local var6 = false
				local var7 = false
				local var8 = false
				local var9 = nil
				local var10 = nil
				
				local function fireCompleted(p2) --[[ line: 44 ]]
					-- upvalues: var7 (write), var1 (ref), p0 (copy), var10 (write), var9 (write), p1 (ref)
					if var7 then return end
					if var1 ~= p0.getAssistantTurnSequence() then return end
					var7 = true
					p0.setActiveStop(nil)
					
					if var10 ~= nil then
						var10()
						var10 = nil
					end
					if var9 ~= nil then
						p0.noteTurnSequenceIds(var9)
					end
					if p1.onCompleted ~= nil then
						p1.onCompleted(p2)
					end
				end
				
				local function start() --[[ line: 65 ]]
					-- upvalues: var6 (write), var8 (write), fireCompleted (ref), p0 (copy), var5 (ref), p1 (ref), var9 (write), var3 (ref), var10 (write)
					if var6 then
						return
					end
					var6 = true
					task.spawn(function() --[[ line: 71 ]]
						-- upvalues: var8 (copy), fireCompleted (copy), p0 (copy), var5 (copy), p1 (copy), var9 (copy), var3 (copy), var10 (copy)
						if var8 then
							fireCompleted(nil)
							
							return
						elseif not p0.ensureInitialized() then
							var5({ stage = "initialize" })
							fireCompleted(nil)
							
							return
						end
						local _ = nil
						local _ = nil
						local var14, var15 = p0.ensureCasSession()
						
						if var14 == nil then
							var5(var15 or { stage = "session_new" })
							fireCompleted(nil)
							
							return
						elseif var8 then
							fireCompleted(nil)
							
							return
						end
						var14 = p0.sessionPrompt({
							sessionId = var14,
							prompt = p1.prompt,
							_meta = p1.promptMeta
						})
						var9 = var14
						var3(var14)
						
						if var8 then
							var14.cancel()
						end
						var10 = p0.startPollingTurnFromHistory(var14, var14, {
							rtnIdleFallbackSeconds = p1.rtnIdleFallbackSeconds,
							pollMinIntervalSeconds = p1.pollMinIntervalSeconds,
							pollMaxIntervalSeconds = p1.pollMaxIntervalSeconds,
							afterSequenceId = p0.getLatestObservedHistorySequenceId()
						})
						while not var14.state(false).isDone do
							task.wait()
						end
						fireCompleted(var14.state(false))
					end)
				end
				
				local function stop() --[[ line: 123 ]]
					-- upvalues: var7 (write), var8 (write), var10 (write), var9 (write), fireCompleted (ref)
					if var7 then return end
					var8 = true
					
					if var10 ~= nil then
						var10()
						var10 = nil
					end
					if var9 == nil then
						fireCompleted(nil)
						
						return
					end
					var9.cancel()
				end
				
				p0.setActiveStop(stop)
				
				return {
					getTurnHandle = var2,
					getSetupError = var4,
					start = start,
					stop = stop
				}
			end
		}
	end
}
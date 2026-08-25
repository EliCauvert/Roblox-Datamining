local signalsModule = require(script:FindFirstAncestor("DataHydration").Parent.Signals)
local _ = require(script.Parent.Parent.types)

return {
	createSendPrompt = function(p0)
		-- upvalues: signalsModule (ref)
		return {
			sendPrompt = function(p1)
				-- upvalues: p0 (ref), signalsModule (copy)
				local var1 = p0.incrementAssistantTurnSequence()
				local var2, var3 = signalsModule.createSignal(nil)
				local var4, var5 = signalsModule.createSignal(nil)
				local var6 = false
				local var7 = false
				local var8 = false
				local var9 = false
				local var10 = nil
				local var11 = nil
				local var12 = nil
				
				local function fireCompleted(p2)
					-- upvalues: var7 (write), var1 (ref), p0 (copy), var12 (write), var11 (write), var10 (write), p1 (ref)
					if var7 then return end
					if var1 ~= p0.getAssistantTurnSequence() then return end
					var7 = true
					p0.setActiveStop(nil)
					
					if var12 ~= nil then
						var12()
						var12 = nil
					end
					if var11 ~= nil then
						var11()
						var11 = nil
					end
					if var10 ~= nil then
						p0.noteTurnSequenceIds(var10)
					end
					if p1.onCompleted ~= nil then
						p1.onCompleted(p2)
					end
				end
				
				local function start()
					-- upvalues: var6 (write), var9 (write), fireCompleted (ref), p0 (copy), var5 (ref), p1 (ref), var10 (write), var3 (ref), var11 (write), var12 (write), signalsModule (copy), var8 (write)
					if var6 then
						return
					end
					var6 = true
					task.spawn(function()
						-- upvalues: var9 (copy), fireCompleted (copy), p0 (copy), var5 (copy), p1 (copy), var10 (copy), var3 (copy), var11 (copy), var12 (copy), signalsModule (copy), var8 (copy)
						if var9 then
							fireCompleted(nil)
							
							return
						end
						local var16, var17 = p0.ensureInitialized()
						
						if not var16 then
							var5({ stage = "initialize", errorCode = var17 })
							fireCompleted(nil)
							
							return
						end
						local _ = nil
						local _ = nil
						local var18, var19 = p0.ensureCasSession()
						
						if var18 == nil then
							var5(var19 or { stage = "session_new" })
							fireCompleted(nil)
							
							return
						elseif var9 then
							fireCompleted(nil)
							
							return
						end
						var18 = p0.sessionPrompt({
							sessionId = var18,
							prompt = p1.prompt,
							_meta = p1.promptMeta
						})
						var10 = var18
						var3(var18)
						
						if var9 then
							var18.cancel()
						end
						var11 = p0.startPollingTurnFromHistory(var18, var18, {
							rtnIdleFallbackSeconds = p1.rtnIdleFallbackSeconds,
							rtnSequenceGapFallbackSeconds = p1.rtnSequenceGapFallbackSeconds,
							pollMinIntervalSeconds = p1.pollMinIntervalSeconds,
							pollMaxIntervalSeconds = p1.pollMaxIntervalSeconds,
							afterSequenceId = p0.getLatestObservedHistorySequenceId(),
							onDroppedChatMessage = p1.onDroppedChatMessage
						})
						var12 = signalsModule.createEffect(function(p3)
							-- upvalues: var18 (ref), p1 (copy), var8 (copy), fireCompleted (copy)
							local var20 = var18.state(p3)
							
							if p1.onReceived ~= nil and not var8 and (var20.status == "streaming" or var20.status == "succeeded") then
								var8 = true
								p1.onReceived(var18.getTurnId())
							end
							if var20.isDone then
								fireCompleted(var18.state(false))
							end
						end)
					end)
				end
				
				local function stop()
					-- upvalues: var7 (write), var9 (write), var10 (write), var12 (write), var11 (write), fireCompleted (ref)
					if var7 then return end
					var9 = true
					
					if var10 ~= nil then
						var10.cancel()
						
						return
					elseif var12 ~= nil then
						var12()
						var12 = nil
					end
					if var11 ~= nil then
						var11()
						var11 = nil
					end
					fireCompleted(nil)
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
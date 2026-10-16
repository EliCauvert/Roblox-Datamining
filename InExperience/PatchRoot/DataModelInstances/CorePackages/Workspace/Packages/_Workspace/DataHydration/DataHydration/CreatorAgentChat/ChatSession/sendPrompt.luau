local signalsModule = require(script:FindFirstAncestor("DataHydration").Parent.Signals)
local _ = require(script.Parent.Parent.types)

return {
	createSendPrompt = function(p1)
		-- upvalues: signalsModule (ref)
		return {
			sendPrompt = function(p2)
				-- upvalues: p1 (ref), signalsModule (copy)
				local var1 = p1.incrementAssistantTurnSequence()
				local var2, var3 = signalsModule.createSignal(nil)
				local var4, var5 = signalsModule.createSignal(nil)
				local var6 = false
				local var7 = false
				local var8 = false
				local var9 = false
				local var10 = nil
				local var11 = nil
				local var12 = nil
				
				local function fireCompleted(p3)
					-- upvalues: var7 (write), var1 (ref), p1 (copy), var12 (write), var11 (write), var10 (write), p2 (ref)
					if var7 then return end
					if var1 ~= p1.getAssistantTurnSequence() then return end
					var7 = true
					p1.setActiveStop(nil)
					
					if var12 ~= nil then
						var12()
						var12 = nil
					end
					if var11 ~= nil then
						var11()
						var11 = nil
					end
					if var10 ~= nil then
						p1.noteTurnSequenceIds(var10)
					end
					if p2.onCompleted ~= nil then
						p2.onCompleted(p3)
					end
				end
				
				local function start()
					-- upvalues: var6 (write), var9 (write), fireCompleted (ref), p1 (copy), var5 (ref), p2 (ref), var10 (write), var3 (ref), var11 (write), var12 (write), signalsModule (copy), var8 (write)
					if var6 then
						return
					end
					var6 = true
					task.spawn(function()
						-- upvalues: var9 (copy), fireCompleted (copy), p1 (copy), var5 (copy), p2 (copy), var10 (copy), var3 (copy), var11 (copy), var12 (copy), signalsModule (copy), var8 (copy)
						if var9 then
							fireCompleted(nil)
							
							return
						end
						local var13, var14 = p1.ensureInitialized()
						
						if not var13 then
							var5({ stage = "initialize", errorCode = var14 })
							fireCompleted(nil)
							
							return
						end
						local _ = nil
						local _ = nil
						local var15, var16 = p1.ensureCasSession()
						
						if var15 == nil then
							var5(var16 or { stage = "session_new" })
							fireCompleted(nil)
							
							return
						elseif var9 then
							fireCompleted(nil)
							
							return
						end
						var15 = p1.sessionPrompt({
							sessionId = var15,
							prompt = p2.prompt,
							_meta = p2.promptMeta
						})
						var10 = var15
						var3(var15)
						
						if var9 then
							var15.cancel()
						end
						var11 = p1.startPollingTurnFromHistory(var15, var15, {
							rtnIdleFallbackSeconds = p2.rtnIdleFallbackSeconds,
							rtnSequenceGapFallbackSeconds = p2.rtnSequenceGapFallbackSeconds,
							pollMinIntervalSeconds = p2.pollMinIntervalSeconds,
							pollMaxIntervalSeconds = p2.pollMaxIntervalSeconds,
							afterSequenceId = p1.getLatestObservedHistorySequenceId(),
							onDroppedChatMessage = p2.onDroppedChatMessage
						})
						var12 = signalsModule.createEffect(function(p3)
							-- upvalues: var15 (ref), p2 (copy), var8 (copy), fireCompleted (copy)
							local var17 = var15.state(p3)
							
							if p2.onReceived ~= nil and not var8 and (var17.status == "streaming" or var17.status == "succeeded") then
								var8 = true
								p2.onReceived(var15.getTurnId())
							end
							if var17.isDone then
								fireCompleted(var15.state(false))
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
				
				p1.setActiveStop(stop)
				
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
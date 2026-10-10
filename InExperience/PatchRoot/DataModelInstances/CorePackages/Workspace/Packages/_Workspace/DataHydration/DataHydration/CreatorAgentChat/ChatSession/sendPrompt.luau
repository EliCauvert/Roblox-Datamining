local parent = script:FindFirstAncestor("DataHydration").Parent
local sharedFlagsModule = require(parent.SharedFlags)
local signalsModule = require(parent.Signals)
local _ = require(script.Parent.Parent.types)
local fFlagBuildExperiencePromptFailureTelemetry = sharedFlagsModule.FFlagBuildExperiencePromptFailureTelemetry

return {
	createSendPrompt = function(p1)
		-- upvalues: signalsModule (ref), fFlagBuildExperiencePromptFailureTelemetry (ref)
		return {
			sendPrompt = function(p2)
				-- upvalues: p1 (ref), signalsModule (copy), fFlagBuildExperiencePromptFailureTelemetry (copy)
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
					-- upvalues: var6 (write), var9 (write), fireCompleted (ref), p1 (copy), var5 (ref), fFlagBuildExperiencePromptFailureTelemetry (copy), p2 (ref), var10 (write), var3 (ref), var11 (write), var12 (write), signalsModule (copy), var8 (write)
					if var6 then
						return
					end
					var6 = true
					task.spawn(function()
						-- upvalues: var9 (copy), fireCompleted (copy), p1 (copy), var5 (copy), fFlagBuildExperiencePromptFailureTelemetry (copy), p2 (copy), var10 (copy), var3 (copy), var11 (copy), var12 (copy), signalsModule (copy), var8 (copy)
						if var9 then
							fireCompleted(nil)
							
							return
						end
						local var13, var14, var15 = p1.ensureInitialized()
						
						if not var13 then
							var5({
								stage = "initialize",
								errorCode = var14,
								requestFailure = if fFlagBuildExperiencePromptFailureTelemetry then var15 else nil
							})
							fireCompleted(nil)
							
							return
						end
						local _ = nil
						local _ = nil
						local var16, var17 = p1.ensureCasSession()
						
						if var16 == nil then
							var5(var17 or { stage = "session_new" })
							fireCompleted(nil)
							
							return
						elseif var9 then
							fireCompleted(nil)
							
							return
						end
						var16 = p1.sessionPrompt({
							sessionId = var16,
							prompt = p2.prompt,
							_meta = p2.promptMeta
						})
						var10 = var16
						var3(var16)
						
						if var9 then
							var16.cancel()
						end
						var11 = p1.startPollingTurnFromHistory(var16, var16, {
							rtnIdleFallbackSeconds = p2.rtnIdleFallbackSeconds,
							rtnSequenceGapFallbackSeconds = p2.rtnSequenceGapFallbackSeconds,
							pollMinIntervalSeconds = p2.pollMinIntervalSeconds,
							pollMaxIntervalSeconds = p2.pollMaxIntervalSeconds,
							afterSequenceId = p1.getLatestObservedHistorySequenceId(),
							onDroppedChatMessage = p2.onDroppedChatMessage
						})
						var12 = signalsModule.createEffect(function(p3)
							-- upvalues: var16 (ref), p2 (copy), var8 (copy), fireCompleted (copy)
							local var18 = var16.state(p3)
							
							if p2.onReceived ~= nil and not var8 and (var18.status == "streaming" or var18.status == "succeeded") then
								var8 = true
								p2.onReceived(var16.getTurnId())
							end
							if var18.isDone then
								fireCompleted(var16.state(false))
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
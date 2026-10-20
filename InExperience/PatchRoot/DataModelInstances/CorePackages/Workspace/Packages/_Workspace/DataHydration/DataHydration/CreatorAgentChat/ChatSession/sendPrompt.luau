local Parent = script:FindFirstAncestor("DataHydration").Parent
local SharedFlagsModule = require(Parent.SharedFlags)
local SignalsModule = require(Parent.Signals)
local _ = require(script.Parent.Parent.types)
local FFlagBuildExperiencePromptFailureTelemetry = SharedFlagsModule.FFlagBuildExperiencePromptFailureTelemetry
local FFlagBuildExperienceLibrary = SharedFlagsModule.FFlagBuildExperienceLibrary

return {
	createSendPrompt = function(p1)
		-- upvalues: SignalsModule (copy), FFlagBuildExperiencePromptFailureTelemetry (copy), FFlagBuildExperienceLibrary (copy)
		return {
			sendPrompt = function(p2)
				-- upvalues: p1 (copy), SignalsModule (upval), FFlagBuildExperiencePromptFailureTelemetry (upval), FFlagBuildExperienceLibrary (upval)
				local IncrementAssistantTurnSequenceResult = p1.incrementAssistantTurnSequence()
				local Signal, Signal2 = SignalsModule.createSignal(nil)
				local Signal1, Signal2_1 = SignalsModule.createSignal(nil)
				local Flag = false
				local Flag1 = false
				local Flag2 = false
				local Flag3 = false
				local Flag4 = false
				local v1 = nil
				local Callback1: (() -> ())? = nil
				local Callback: (() -> ())? = nil
				
				local function fireCompleted(StateResult)
					-- upvalues: Flag1 (ref), IncrementAssistantTurnSequenceResult (copy), p1 (upval), Callback (ref), Callback1 (ref), v1 (ref), p2 (copy)
					if Flag1 then return end
					if IncrementAssistantTurnSequenceResult ~= p1.getAssistantTurnSequence() then return end
					Flag1 = true
					p1.setActiveStop(nil)
					
					if Callback ~= nil then
						Callback()
						Callback = nil
					end
					if Callback1 ~= nil then
						Callback1()
						Callback1 = nil
					end
					if v1 ~= nil then
						p1.noteTurnSequenceIds(v1)
					end
					if p2.onCompleted ~= nil then
						p2.onCompleted(StateResult)
					end
				end
				
				local function start()
					-- upvalues: Flag (ref), Flag4 (ref), fireCompleted (copy), p1 (upval), Signal2_1 (copy), FFlagBuildExperiencePromptFailureTelemetry (upval), p2 (copy), v1 (ref), Signal2 (copy), Callback1 (ref), Callback (ref), SignalsModule (upval), FFlagBuildExperienceLibrary (upval), Flag3 (ref), Flag2 (ref)
					if not Flag then
						Flag = true
						task.spawn(function()
							-- upvalues: Flag4 (upval), fireCompleted (upval), p1 (upval), Signal2_1 (upval), FFlagBuildExperiencePromptFailureTelemetry (upval), p2 (upval), v1 (upval), Signal2 (upval), Callback1 (upval), Callback (upval), SignalsModule (upval), FFlagBuildExperienceLibrary (upval), Flag3 (upval), Flag2 (upval)
							if Flag4 then
								fireCompleted(nil)
								
								return
							end
							local EnsureInitializedResult, EnsureInitializedResult2, EnsureInitializedResult3 = p1.ensureInitialized()
							
							if not EnsureInitializedResult then
								Signal2_1({
									stage = "initialize",
									errorCode = EnsureInitializedResult2,
									requestFailure = if FFlagBuildExperiencePromptFailureTelemetry then EnsureInitializedResult3 else nil
								})
								fireCompleted(nil)
								
								return
							end
							local EnsureCasSessionResult, EnsureCasSessionResult2 = p1.ensureCasSession()
							
							if EnsureCasSessionResult == nil then
								Signal2_1(EnsureCasSessionResult2 or { stage = "session_new" })
								fireCompleted(nil)
								
								return
							end
							if Flag4 then
								fireCompleted(nil)
								
								return
							end
							local SessionPromptResult = p1.sessionPrompt({
								sessionId = EnsureCasSessionResult,
								prompt = p2.prompt,
								_meta = p2.promptMeta
							})
							v1 = SessionPromptResult
							Signal2(SessionPromptResult)
							
							if Flag4 then
								SessionPromptResult.cancel()
							end
							Callback1 = p1.startPollingTurnFromHistory(EnsureCasSessionResult, SessionPromptResult, {
								rtnIdleFallbackSeconds = p2.rtnIdleFallbackSeconds,
								rtnSequenceGapFallbackSeconds = p2.rtnSequenceGapFallbackSeconds,
								pollMinIntervalSeconds = p2.pollMinIntervalSeconds,
								pollMaxIntervalSeconds = p2.pollMaxIntervalSeconds,
								afterSequenceId = p1.getLatestObservedHistorySequenceId(),
								onDroppedChatMessage = p2.onDroppedChatMessage
							})
							Callback = SignalsModule.createEffect(function(p3)
								-- upvalues: SessionPromptResult (copy), FFlagBuildExperienceLibrary (upval), p2 (upval), Flag3 (upval), Flag2 (upval), fireCompleted (upval)
								local StateResult = SessionPromptResult.state(p3)
								
								if FFlagBuildExperienceLibrary and p2.onAccepted ~= nil and not Flag3 then
									local NoIsDone: boolean = SessionPromptResult.isAccepted(p3) and not StateResult.isDone
									
									if StateResult.status == "streaming" or StateResult.status == "succeeded" or NoIsDone then
										Flag3 = true
										p2.onAccepted()
									end
								end
								if p2.onReceived ~= nil and not Flag2 and (StateResult.status == "streaming" or StateResult.status == "succeeded") then
									Flag2 = true
									p2.onReceived(SessionPromptResult.getTurnId())
								end
								if StateResult.isDone then
									fireCompleted(SessionPromptResult.state(false))
								end
							end)
						end)
						
						return
					end
				end
				
				local function stop()
					-- upvalues: Flag1 (ref), Flag4 (ref), v1 (ref), Callback (ref), Callback1 (ref), fireCompleted (copy)
					if Flag1 then return end
					Flag4 = true
					
					if v1 ~= nil then
						v1.cancel()
						
						return
					end
					if Callback ~= nil then
						Callback()
						Callback = nil
					end
					if Callback1 ~= nil then
						Callback1()
						Callback1 = nil
					end
					fireCompleted(nil)
				end
				
				p1.setActiveStop(stop)
				
				return {
					getTurnHandle = Signal,
					getSetupError = Signal1,
					start = start,
					stop = stop
				}
			end
		}
	end
}
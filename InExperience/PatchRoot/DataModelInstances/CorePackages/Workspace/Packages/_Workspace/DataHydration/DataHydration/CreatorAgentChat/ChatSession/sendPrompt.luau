local Parent = script:FindFirstAncestor("DataHydration").Parent
local SharedFlagsModule = require(Parent.SharedFlags)
local SignalsModule = require(Parent.Signals)
local _ = require(script.Parent.Parent.types)
local SendConfigurationModule = require(script.Parent.Parent.sendConfiguration)
local FFlagBuildExperienceModelPickerData = SharedFlagsModule.FFlagBuildExperienceModelPickerData
local FFlagBuildExperiencePromptFailureTelemetry = SharedFlagsModule.FFlagBuildExperiencePromptFailureTelemetry
local FFlagBuildExperienceLibrary = SharedFlagsModule.FFlagBuildExperienceLibrary

return {
	createSendPrompt = function(p1)
		-- upvalues: FFlagBuildExperienceModelPickerData (copy), SendConfigurationModule (copy), SignalsModule (copy), FFlagBuildExperiencePromptFailureTelemetry (copy), FFlagBuildExperienceLibrary (copy)
		return {
			sendPrompt = function(p2)
				-- upvalues: FFlagBuildExperienceModelPickerData (upval), SendConfigurationModule (upval), p1 (copy), SignalsModule (upval), FFlagBuildExperiencePromptFailureTelemetry (upval), FFlagBuildExperienceLibrary (upval)
				local CaptureResult = if FFlagBuildExperienceModelPickerData and p2.sendConfiguration ~= nil then SendConfigurationModule.capture(p2.sendConfiguration.tier, p2.sendConfiguration.experiment) else nil
				local Model = if CaptureResult == nil then if FFlagBuildExperienceModelPickerData then p2.model else nil else CaptureResult.tier
				
				if FFlagBuildExperienceModelPickerData then
					assert(CaptureResult == nil or (p2.model == nil or p2.model == Model), "conflicting model tiers")
					local Model1 = p2.promptMeta and (p2.promptMeta._roblox and p2.promptMeta._roblox.model)
					assert(Model == nil or (Model1 == nil or Model1 == Model), "conflicting model tiers")
					local Experiment = p2.promptMeta and (p2.promptMeta._roblox and p2.promptMeta._roblox.experiment)
					assert(CaptureResult == nil or (Experiment == nil or SendConfigurationModule.sameExperiment(Experiment, CaptureResult.experiment)), "conflicting experiments")
				end
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
					-- upvalues: Flag (ref), Flag4 (ref), FFlagBuildExperienceModelPickerData (upval), p2 (copy), fireCompleted (copy), p1 (upval), Signal2_1 (copy), FFlagBuildExperiencePromptFailureTelemetry (upval), Model (copy), CaptureResult (copy), v1 (ref), Signal2 (copy), Callback1 (ref), Callback (ref), SignalsModule (upval), FFlagBuildExperienceLibrary (upval), Flag3 (ref), Flag2 (ref)
					if not Flag then
						Flag = true
						task.spawn(function()
							-- upvalues: Flag4 (upval), FFlagBuildExperienceModelPickerData (upval), p2 (upval), fireCompleted (upval), p1 (upval), Signal2_1 (upval), FFlagBuildExperiencePromptFailureTelemetry (upval), Model (upval), CaptureResult (upval), v1 (upval), Signal2 (upval), Callback1 (upval), Callback (upval), SignalsModule (upval), FFlagBuildExperienceLibrary (upval), Flag3 (upval), Flag2 (upval)
							if Flag4 or FFlagBuildExperienceModelPickerData and p2.isCancelled ~= nil and p2.isCancelled() then
								fireCompleted(nil)
								
								return
							end
							if not FFlagBuildExperienceModelPickerData then
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
							end
							local EnsureCasSessionResult = nil
							local EnsureCasSessionResult2 = nil
							if FFlagBuildExperienceModelPickerData then
								EnsureCasSessionResult, EnsureCasSessionResult2 = p1.ensureCasSession(Model, p2.isCancelled, CaptureResult, true)
							else
								EnsureCasSessionResult, EnsureCasSessionResult2 = p1.ensureCasSession(Model)
							end
							if EnsureCasSessionResult == nil then
								if not FFlagBuildExperienceModelPickerData or EnsureCasSessionResult2 ~= nil then
									Signal2_1(EnsureCasSessionResult2 or { stage = "session_new" })
								end
								fireCompleted(nil)
								
								return
							else
								if Flag4 or FFlagBuildExperienceModelPickerData and (p2.isCancelled ~= nil and p2.isCancelled() or p2.expectedSessionId ~= nil and p2.expectedSessionId ~= EnsureCasSessionResult) then
									fireCompleted(nil)
									
									return
								end
								local SessionPromptResult, SessionPromptResult2 = p1.sessionPrompt({
									sessionId = EnsureCasSessionResult,
									prompt = p2.prompt,
									model = Model,
									_meta = p2.promptMeta
								}, CaptureResult)
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
									-- upvalues: SessionPromptResult (copy), FFlagBuildExperienceModelPickerData (upval), SessionPromptResult2 (ref), FFlagBuildExperienceLibrary (upval), p2 (upval), Flag3 (upval), Flag2 (upval), fireCompleted (upval)
									local StateResult = SessionPromptResult.state(p3)
									
									if FFlagBuildExperienceModelPickerData and SessionPromptResult2 ~= nil and (StateResult.status == "streaming" or (StateResult.status == "succeeded" or FFlagBuildExperienceLibrary and (SessionPromptResult.isAccepted(p3) and not StateResult.isDone))) then
										SessionPromptResult2()
										SessionPromptResult2 = nil
									end
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
							end
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
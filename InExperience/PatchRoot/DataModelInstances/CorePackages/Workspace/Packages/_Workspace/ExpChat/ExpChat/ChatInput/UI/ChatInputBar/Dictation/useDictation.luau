local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local Dictation = require(Parent.ExpChatShared).Logger:new("ExpChat/Dictation")
local DictationModeModule = require(script.Parent.DictationMode)
local DictationAnalyticsModule = require(script.Parent.DictationAnalytics)
local FFlagExpChatDictationExplicitFinishModule = require(ExpChat.Flags.FFlagExpChatDictationExplicitFinish)
local UseDictationAudioPipelineModule = require(script.Parent.useDictationAudioPipeline)
local RequestMicPermissionModule = require(script.Parent.requestMicPermission)
local RequestMicPermissionFunction = RequestMicPermissionModule.requestMicPermission
local PermissionStatus = RequestMicPermissionModule.PermissionStatus
local CreateSignalFunction = require(Parent.Signals).createSignal
local UseSignalBindingFunction = require(Parent.SignalsReact).useSignalBinding
local DictationState = {
	Idle = "idle",
	Recording = "recording",
	Transcribing = "transcribing",
	Listening = "listening"
}
local DictationErrorReason = {
	PermissionDenied = "permission_denied",
	TranscriptionFailed = "transcription_failed",
	LanguageUnsupported = "language_unsupported",
	Other = "other"
}
local config = { duration = 10, easingStyle = Enum.EasingStyle.Linear }

local function formatTime(p1: number): string --[[ Line: 124 ]]
	return string.format("%d:%02d", math.floor(p1 / 60), p1 % 60)
end

local function _(p1) --[[ Line: 128 | Named "safeCancelThread" ]]
	if p1.current then
		pcall(task.cancel, p1.current)
		p1.current = nil
	end
end

local _ = function(p1, p2) --[[ Line: 135 | Named "startCountdownTimer" ]]
	if p1.current then
		pcall(task.cancel, p1.current)
		p1.current = nil
	end
	p1.current = task.spawn(function() --[[ Line: 137 ]]
		-- upvalues: p2 (copy)
		for i = 1, 10 do
			task.wait(1)
			p2(10 - i)
		end
	end)
end

return {
	MAX_RECORDING_SECONDS = 10,
	useDictation = function(Current) --[[ Line: 145 ]]
		-- upvalues: ReactModule (copy), CreateSignalFunction (copy), DictationState (copy), UseDictationAudioPipelineModule (copy), ReactOtterModule (copy), UseSignalBindingFunction (copy), Dictation (copy), DictationAnalyticsModule (copy), FFlagExpChatDictationExplicitFinishModule (copy), DictationErrorReason (copy), DictationModeModule (copy), config (copy), RequestMicPermissionFunction (copy), PermissionStatus (copy), formatTime (copy)
		local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 147 ]]
			-- upvalues: CreateSignalFunction (upval), DictationState (upval)
			local Signal, Signal2 = CreateSignalFunction(DictationState.Idle)
			
			return { get = Signal, set = Signal2 }
		end, {})
		local GetFunction = UseMemoResult.get
		local SetFunction = UseMemoResult.set
		local UseDictationAudioPipelineModuleResult = UseDictationAudioPipelineModule()
		local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
		local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0)
		local UseSignalBindingResult = UseSignalBindingFunction(function(p3): boolean --[[ Line: 160 ]]
			-- upvalues: GetFunction (copy), DictationState (upval)
			return GetFunction(p3) == DictationState.Recording
		end)
		local UseSignalBindingResult1 = UseSignalBindingFunction(function(p3): boolean --[[ Line: 163 ]]
			-- upvalues: GetFunction (copy), DictationState (upval)
			return GetFunction(p3) == DictationState.Transcribing
		end)
		local UseSignalBindingResult2 = UseSignalBindingFunction(function(p3): boolean --[[ Line: 166 ]]
			-- upvalues: GetFunction (copy), DictationState (upval)
			local GetResult = GetFunction(p3)
			
			return GetResult == DictationState.Recording or GetResult == DictationState.Transcribing
		end)
		local UseSignalBindingResult3 = UseSignalBindingFunction(function(p3): boolean --[[ Line: 170 ]]
			-- upvalues: GetFunction (copy), DictationState (upval)
			return GetFunction(p3) == DictationState.Idle
		end)
		local UseSignalBindingResult4 = UseSignalBindingFunction(function(p3): boolean --[[ Line: 173 ]]
			-- upvalues: GetFunction (copy), DictationState (upval)
			return GetFunction(p3) ~= DictationState.Recording
		end)
		local UseSignalBindingResult5 = UseSignalBindingFunction(function(p3): boolean --[[ Line: 176 ]]
			-- upvalues: GetFunction (copy), DictationState (upval)
			return GetFunction(p3) == DictationState.Listening
		end)
		local UseSignalBindingResult6 = UseSignalBindingFunction(function(p3): boolean --[[ Line: 179 ]]
			-- upvalues: GetFunction (copy), DictationState (upval)
			local GetResult = GetFunction(p3)
			
			return GetResult == DictationState.Recording or GetResult == DictationState.Listening
		end)
		local UseRefResult = ReactModule.useRef(Current)
		UseRefResult.current = Current
		local UseRefResult1 = ReactModule.useRef(false)
		local UseRefResult2 = ReactModule.useRef(false)
		local UseRefResult3 = ReactModule.useRef(nil)
		local UseRefResult4 = ReactModule.useRef(nil)
		local UseRefResult5 = ReactModule.useRef(0)
		local UseRefResult6 = ReactModule.useRef(nil)
		
		local function _(Listening) --[[ Line: 208 | Named "transitionTo" ]]
			-- upvalues: SetFunction (copy), DictationState (upval), UseRefResult1 (copy), UseRefResult (copy)
			SetFunction(Listening)
			local IsListeningMatch: boolean = Listening == DictationState.Recording or (Listening == DictationState.Transcribing or Listening == DictationState.Listening)
			
			if IsListeningMatch ~= UseRefResult1.current then
				UseRefResult1.current = IsListeningMatch
				local Current = UseRefResult.current
				
				if Current ~= nil and Current.onActivityChanged ~= nil then
					Current.onActivityChanged(IsListeningMatch)
				end
			end
		end
		
		local _ = function() --[[ Line: 223 | Named "fullCleanup" ]]
			-- upvalues: UseDictationAudioPipelineModuleResult (copy), UseRefResult4 (copy), UseRefResult3 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval)
			UseDictationAudioPipelineModuleResult.stop()
			
			if UseRefResult4.current then
				pcall(task.cancel, UseRefResult4.current)
				UseRefResult4.current = nil
			end
			if UseRefResult3.current then
				pcall(task.cancel, UseRefResult3.current)
				UseRefResult3.current = nil
			end
			UseAnimatedBindingResult2(ReactOtterModule.instant(0))
		end
		
		local function handleError(TranscriptionFailed, p3) --[[ Line: 235 ]]
			-- upvalues: Dictation (upval), UseRefResult6 (copy), UseDictationAudioPipelineModuleResult (copy), UseRefResult4 (copy), UseRefResult3 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), DictationState (upval), SetFunction (copy), UseRefResult1 (copy), UseRefResult (copy)
			Dictation:warning("Dictation: {} ({})", p3, TranscriptionFailed)
			local Mode = UseRefResult6.current and UseRefResult6.current.mode or nil
			UseDictationAudioPipelineModuleResult.stop()
			
			if UseRefResult4.current then
				pcall(task.cancel, UseRefResult4.current)
				UseRefResult4.current = nil
			end
			if UseRefResult3.current then
				pcall(task.cancel, UseRefResult3.current)
				UseRefResult3.current = nil
			end
			UseAnimatedBindingResult2(ReactOtterModule.instant(0))
			local Idle = DictationState.Idle
			SetFunction(Idle)
			local IsIdleMatch: boolean = Idle == DictationState.Recording or (Idle == DictationState.Transcribing or Idle == DictationState.Listening)
			
			if IsIdleMatch ~= UseRefResult1.current then
				UseRefResult1.current = IsIdleMatch
				local Current = UseRefResult.current
				
				if Current ~= nil and Current.onActivityChanged ~= nil then
					Current.onActivityChanged(IsIdleMatch)
				end
			end
			local Current1 = UseRefResult.current
			
			if Current1 ~= nil and Current1.onError ~= nil then
				Current1.onError(Mode, TranscriptionFailed)
			end
			UseRefResult6.current = nil
		end
		
		ReactModule.useEffect(function() --[[ Line: 250 ]]
			-- upvalues: UseRefResult5 (copy), UseRefResult4 (copy), UseRefResult3 (copy)
			return function() --[[ Line: 251 ]]
				-- upvalues: UseRefResult5 (upval), UseRefResult4 (upval), UseRefResult3 (upval)
				UseRefResult5.current += 1
				
				if UseRefResult4.current then
					pcall(task.cancel, UseRefResult4.current)
					UseRefResult4.current = nil
				end
				if UseRefResult3.current then
					pcall(task.cancel, UseRefResult3.current)
					UseRefResult3.current = nil
				end
			end
		end, {})
		
		local _ = function(p3, p4) --[[ Line: 258 | Named "emitRecordingStop" ]]
			-- upvalues: UseRefResult6 (copy), UseRefResult (copy)
			local Current = UseRefResult6.current
			local Current1 = UseRefResult.current
			
			if Current1 ~= nil and Current1.onRecordingStop ~= nil and Current ~= nil and Current.startedAt ~= nil then
				Current1.onRecordingStop(Current.mode, p3, os.clock() - Current.startedAt, p4)
				
				return
			end
		end
		
		local UseRefResult7 = ReactModule.useRef(nil)
		local UseResult = ReactModule.useCallback(function(p3) --[[ Line: 269 ]]
			-- upvalues: DictationAnalyticsModule (upval), GetFunction (copy), DictationState (upval), Dictation (upval), UseDictationAudioPipelineModuleResult (copy), UseRefResult4 (copy), UseRefResult3 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), SetFunction (copy), UseRefResult1 (copy), UseRefResult (copy), UseRefResult6 (copy), UseRefResult2 (copy), FFlagExpChatDictationExplicitFinishModule (upval), handleError (copy), DictationErrorReason (upval)
			local P17 = p3 or DictationAnalyticsModule.TriggerTypes.UserManual
			local GetResult = GetFunction(false)
			
			if GetResult == DictationState.Listening then
				Dictation:debug("Dictation: exited continuous mode")
				UseDictationAudioPipelineModuleResult.stop()
				
				if UseRefResult4.current then
					pcall(task.cancel, UseRefResult4.current)
					UseRefResult4.current = nil
				end
				if UseRefResult3.current then
					pcall(task.cancel, UseRefResult3.current)
					UseRefResult3.current = nil
				end
				UseAnimatedBindingResult2(ReactOtterModule.instant(0))
				local Idle = DictationState.Idle
				SetFunction(Idle)
				local IsIdleMatch: boolean = Idle == DictationState.Recording or (Idle == DictationState.Transcribing or Idle == DictationState.Listening)
				
				if IsIdleMatch ~= UseRefResult1.current then
					UseRefResult1.current = IsIdleMatch
					local Current = UseRefResult.current
					
					if Current ~= nil and Current.onActivityChanged ~= nil then
						Current.onActivityChanged(IsIdleMatch)
					end
				end
				local Current1 = UseRefResult6.current
				local Current2 = UseRefResult.current
				
				if Current2 ~= nil and Current2.onRecordingStop ~= nil and Current1 ~= nil and Current1.startedAt ~= nil then
					Current2.onRecordingStop(Current1.mode, P17, os.clock() - Current1.startedAt, nil)
				end
				UseRefResult6.current = nil
				
				return
			else
				if GetResult ~= DictationState.Recording then return end
				if UseRefResult4.current then
					pcall(task.cancel, UseRefResult4.current)
					UseRefResult4.current = nil
				end
				if UseRefResult3.current then
					pcall(task.cancel, UseRefResult3.current)
					UseRefResult3.current = nil
				end
				if UseRefResult2.current then
					if UseDictationAudioPipelineModuleResult.audioDeviceInputRef.current then
						UseDictationAudioPipelineModuleResult.audioDeviceInputRef.current.Muted = true
					end
					if FFlagExpChatDictationExplicitFinishModule and not UseDictationAudioPipelineModuleResult.finishInput() then
						Dictation:warning("Dictation: explicit finish unavailable, waiting for muted input to end speech")
					end
					local Transcribing = DictationState.Transcribing
					SetFunction(Transcribing)
					local IsTranscribingMatch: boolean = Transcribing == DictationState.Recording or (Transcribing == DictationState.Transcribing or Transcribing == DictationState.Listening)
					
					if IsTranscribingMatch ~= UseRefResult1.current then
						UseRefResult1.current = IsTranscribingMatch
						local Current = UseRefResult.current
						
						if Current ~= nil and Current.onActivityChanged ~= nil then
							Current.onActivityChanged(IsTranscribingMatch)
						end
					end
					Dictation:debug("Dictation: stopped recording, waiting for transcription")
					local Current4 = UseRefResult6.current
					local Current5 = UseRefResult.current
					
					if Current5 ~= nil and Current5.onRecordingStop ~= nil and Current4 ~= nil and Current4.startedAt ~= nil then
						Current5.onRecordingStop(Current4.mode, P17, os.clock() - Current4.startedAt, nil)
					end
					UseRefResult4.current = task.delay(5, function() --[[ Line: 311 ]]
						-- upvalues: handleError (upval), DictationErrorReason (upval)
						handleError(DictationErrorReason.TranscriptionFailed, "transcription timed out")
					end)
					
					return
				else
					Dictation:debug("Dictation: no voice activity, returning to idle")
					UseDictationAudioPipelineModuleResult.stop()
					
					if UseRefResult4.current then
						pcall(task.cancel, UseRefResult4.current)
						UseRefResult4.current = nil
					end
					if UseRefResult3.current then
						pcall(task.cancel, UseRefResult3.current)
						UseRefResult3.current = nil
					end
					UseAnimatedBindingResult2(ReactOtterModule.instant(0))
					local Idle = DictationState.Idle
					SetFunction(Idle)
					local IsIdleMatch: boolean = Idle == DictationState.Recording or (Idle == DictationState.Transcribing or Idle == DictationState.Listening)
					
					if IsIdleMatch ~= UseRefResult1.current then
						UseRefResult1.current = IsIdleMatch
						local Current = UseRefResult.current
						
						if Current ~= nil and Current.onActivityChanged ~= nil then
							Current.onActivityChanged(IsIdleMatch)
						end
					end
					local Current = UseRefResult6.current
					local Current3 = UseRefResult.current
					
					if Current3 ~= nil and Current3.onRecordingStop ~= nil and Current ~= nil and Current.startedAt ~= nil then
						Current3.onRecordingStop(Current.mode, P17, os.clock() - Current.startedAt, nil)
					end
					UseRefResult6.current = nil
				end
			end
		end, { UseDictationAudioPipelineModuleResult, GetFunction })
		UseRefResult7.current = UseResult
		local MapResult = UseBindingResult:map(function(p3) --[[ Line: 487 ]]
			-- upvalues: formatTime (upval)
			return formatTime(p3)
		end)
		
		return {
			getDictationState = GetFunction,
			startDictation = ReactModule.useCallback(function(Mode) --[[ Line: 317 ]]
				-- upvalues: GetFunction (copy), DictationState (upval), UseRefResult6 (copy), UseRefResult5 (copy), UseRefResult2 (copy), UseDictationAudioPipelineModuleResult (copy), Dictation (upval), DictationAnalyticsModule (upval), UseRefResult (copy), UseRefResult4 (copy), UseRefResult3 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), SetFunction (copy), UseRefResult1 (copy), DictationModeModule (upval), handleError (copy), DictationErrorReason (upval), UseBindingResult2 (copy), config (upval), UseRefResult7 (copy), RequestMicPermissionFunction (upval), PermissionStatus (upval)
				if GetFunction(false) == DictationState.Idle then
					UseRefResult6.current = { mode = Mode }
					UseRefResult5.current += 1
					local Current = UseRefResult5.current
					
					local function doStartStandard() --[[ Line: 329 ]]
						-- upvalues: UseRefResult2 (upval), UseDictationAudioPipelineModuleResult (upval), Dictation (upval), GetFunction (upval), DictationState (upval), DictationAnalyticsModule (upval), UseRefResult6 (upval), UseRefResult (upval), UseRefResult4 (upval), UseRefResult3 (upval), UseAnimatedBindingResult2 (upval), ReactOtterModule (upval), SetFunction (upval), UseRefResult1 (upval), DictationModeModule (upval), handleError (upval), DictationErrorReason (upval), UseBindingResult2 (upval), config (upval), UseRefResult7 (upval)
						UseRefResult2.current = false
						local Success, Result = pcall(function() --[[ Line: 332 ]]
							-- upvalues: UseDictationAudioPipelineModuleResult (upval), Dictation (upval), GetFunction (upval), DictationState (upval), DictationAnalyticsModule (upval), UseRefResult6 (upval), UseRefResult (upval), UseRefResult4 (upval), UseRefResult3 (upval), UseAnimatedBindingResult2 (upval), ReactOtterModule (upval), SetFunction (upval), UseRefResult1 (upval), DictationModeModule (upval), UseRefResult2 (upval), handleError (upval), DictationErrorReason (upval)
							UseDictationAudioPipelineModuleResult.start({
								onTranscription = function(p3) --[[ Line: 334 ]]
									-- upvalues: Dictation (upval), GetFunction (upval), DictationState (upval), DictationAnalyticsModule (upval), UseRefResult6 (upval), UseRefResult (upval), UseDictationAudioPipelineModuleResult (upval), UseRefResult4 (upval), UseRefResult3 (upval), UseAnimatedBindingResult2 (upval), ReactOtterModule (upval), SetFunction (upval), UseRefResult1 (upval), DictationModeModule (upval)
									Dictation:debug("Dictation: received transcription: {}", p3)
									
									if GetFunction(false) == DictationState.Recording then
										local AutoPause = DictationAnalyticsModule.TriggerTypes.AutoPause
										local CountP19 = #p3
										local Current = UseRefResult6.current
										local Current1 = UseRefResult.current
										
										if Current1 ~= nil and Current1.onRecordingStop ~= nil and Current ~= nil and Current.startedAt ~= nil then
											Current1.onRecordingStop(Current.mode, AutoPause, os.clock() - Current.startedAt, CountP19)
										end
									end
									UseDictationAudioPipelineModuleResult.stop()
									
									if UseRefResult4.current then
										pcall(task.cancel, UseRefResult4.current)
										UseRefResult4.current = nil
									end
									if UseRefResult3.current then
										pcall(task.cancel, UseRefResult3.current)
										UseRefResult3.current = nil
									end
									UseAnimatedBindingResult2(ReactOtterModule.instant(0))
									local Idle = DictationState.Idle
									SetFunction(Idle)
									local IsIdleMatch: boolean = Idle == DictationState.Recording or (Idle == DictationState.Transcribing or Idle == DictationState.Listening)
									
									if IsIdleMatch ~= UseRefResult1.current then
										UseRefResult1.current = IsIdleMatch
										local Current = UseRefResult.current
										
										if Current ~= nil and Current.onActivityChanged ~= nil then
											Current.onActivityChanged(IsIdleMatch)
										end
									end
									local Current2 = UseRefResult.current
									
									if Current2 ~= nil and Current2.onTranscription ~= nil then
										Current2.onTranscription(p3, DictationModeModule.Standard)
									end
									UseRefResult6.current = nil
								end,
								onSpeechStarted = function() --[[ Line: 350 ]]
									-- upvalues: UseRefResult2 (upval)
									UseRefResult2.current = true
								end,
								onError = function(p3) --[[ Line: 353 ]]
									-- upvalues: handleError (upval), DictationErrorReason (upval)
									handleError(DictationErrorReason.TranscriptionFailed, p3)
								end
							})
						end)
						
						if not Success then
							handleError(DictationErrorReason.Other, "failed to start recording: " .. tostring(Result))
							
							return
						end
						local Recording = DictationState.Recording
						SetFunction(Recording)
						local IsRecordingMatch: boolean = Recording == DictationState.Recording or (Recording == DictationState.Transcribing or Recording == DictationState.Listening)
						
						if IsRecordingMatch ~= UseRefResult1.current then
							UseRefResult1.current = IsRecordingMatch
							local Current = UseRefResult.current
							
							if Current ~= nil and Current.onActivityChanged ~= nil then
								Current.onActivityChanged(IsRecordingMatch)
							end
						end
						if UseRefResult6.current then
							UseRefResult6.current.startedAt = os.clock()
						end
						local Current = UseRefResult.current
						
						if Current and Current.onRecordingStart then
							Current.onRecordingStart(DictationModeModule.Standard, DictationAnalyticsModule.TriggerTypes.UserManual)
						end
						UseBindingResult2(10)
						UseAnimatedBindingResult2(ReactOtterModule.instant(1))
						task.defer(function() --[[ Line: 379 ]]
							-- upvalues: UseAnimatedBindingResult2 (upval), ReactOtterModule (upval), config (upval)
							UseAnimatedBindingResult2(ReactOtterModule.ease(0, config))
						end)
						Dictation:debug("Dictation: started recording")
						
						if UseRefResult3.current then
							pcall(task.cancel, UseRefResult3.current)
							UseRefResult3.current = nil
						end
						UseRefResult3.current = task.spawn(function() --[[ Line: 137 ]]
							-- upvalues: UseBindingResult2 (copy)
							for i = 1, 10 do
								task.wait(1)
								UseBindingResult2(10 - i)
							end
						end)
						UseRefResult4.current = task.delay(10, function() --[[ Line: 386 ]]
							-- upvalues: Dictation (upval), UseRefResult7 (upval), DictationAnalyticsModule (upval)
							Dictation:debug("Dictation: max recording time reached, stopping")
							
							if UseRefResult7.current then
								UseRefResult7.current(DictationAnalyticsModule.TriggerTypes.TimeUp)
							end
						end)
					end
					
					local function doStartContinuous() --[[ Line: 397 ]]
						-- upvalues: UseDictationAudioPipelineModuleResult (upval), Dictation (upval), UseRefResult (upval), DictationModeModule (upval), handleError (upval), DictationErrorReason (upval), DictationState (upval), SetFunction (upval), UseRefResult1 (upval), UseRefResult6 (upval), DictationAnalyticsModule (upval)
						local Success, Result = pcall(function() --[[ Line: 398 ]]
							-- upvalues: UseDictationAudioPipelineModuleResult (upval), Dictation (upval), UseRefResult (upval), DictationModeModule (upval), handleError (upval), DictationErrorReason (upval)
							UseDictationAudioPipelineModuleResult.start({
								onTranscription = function(p3) --[[ Line: 400 ]]
									-- upvalues: Dictation (upval), UseRefResult (upval), DictationModeModule (upval)
									Dictation:debug("Dictation: continuous utterance: {}", p3)
									local Current = UseRefResult.current
									
									if Current ~= nil and Current.onTranscription ~= nil then
										Current.onTranscription(p3, DictationModeModule.Continuous)
									end
								end,
								onSpeechStarted = function() --[[ Line: 407 ]]
									-- upvalues: UseRefResult (upval), DictationModeModule (upval)
									local Current = UseRefResult.current
									
									if Current ~= nil and Current.onSpeechStarted ~= nil then
										Current.onSpeechStarted(DictationModeModule.Continuous)
									end
								end,
								onError = function(p3) --[[ Line: 413 ]]
									-- upvalues: handleError (upval), DictationErrorReason (upval)
									handleError(DictationErrorReason.TranscriptionFailed, p3)
								end
							}, { continuous = true })
						end)
						
						if not Success then
							handleError(DictationErrorReason.Other, "failed to enter continuous mode: " .. tostring(Result))
							
							return
						end
						local Listening = DictationState.Listening
						SetFunction(Listening)
						local IsListeningMatch: boolean = Listening == DictationState.Recording or (Listening == DictationState.Transcribing or Listening == DictationState.Listening)
						
						if IsListeningMatch ~= UseRefResult1.current then
							UseRefResult1.current = IsListeningMatch
							local Current = UseRefResult.current
							
							if Current ~= nil and Current.onActivityChanged ~= nil then
								Current.onActivityChanged(IsListeningMatch)
							end
						end
						if UseRefResult6.current then
							UseRefResult6.current.startedAt = os.clock()
						end
						local Current = UseRefResult.current
						
						if Current and Current.onRecordingStart then
							Current.onRecordingStart(DictationModeModule.Continuous, DictationAnalyticsModule.TriggerTypes.UserManual)
						end
						Dictation:debug("Dictation: entered continuous mode")
					end
					
					local function _(): boolean --[[ Line: 435 | Named "isStalePermissionRequest" ]]
						-- upvalues: UseRefResult5 (upval), Current (copy)
						return UseRefResult5.current ~= Current
					end
					
					RequestMicPermissionFunction():andThen(function(Result) --[[ Line: 442 ]]
						-- upvalues: UseRefResult5 (upval), Current (copy), UseRefResult (upval), Mode (copy), PermissionStatus (upval), handleError (upval), DictationErrorReason (upval), DictationModeModule (upval), doStartContinuous (copy), doStartStandard (copy)
						if UseRefResult5.current ~= Current then return end
						local Current1 = UseRefResult.current
						
						if Current1 ~= nil and Current1.onPermissionResolved ~= nil then
							Current1.onPermissionResolved(Result.status, Mode)
						end
						if Result.status == PermissionStatus.Denied then
							handleError(DictationErrorReason.PermissionDenied, if Result.error then "microphone permission denied: " .. Result.error else "microphone permission denied")
							
							return
						end
						if Mode == DictationModeModule.Continuous then
							doStartContinuous()
							
							return
						else
							doStartStandard()
						end
					end):catch(function(Err) --[[ Line: 465 ]]
						-- upvalues: UseRefResult5 (upval), Current (copy), handleError (upval), DictationErrorReason (upval)
						if UseRefResult5.current == Current then
							handleError(DictationErrorReason.PermissionDenied, "mic permission request failed: " .. tostring(Err))
							
							return
						end
					end)
					
					return
				end
			end, { UseDictationAudioPipelineModuleResult, GetFunction }),
			stopDictation = UseResult,
			cancel = ReactModule.useCallback(function() --[[ Line: 477 ]]
				-- upvalues: Dictation (upval), UseRefResult5 (copy), UseDictationAudioPipelineModuleResult (copy), UseRefResult4 (copy), UseRefResult3 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), DictationState (upval), SetFunction (copy), UseRefResult1 (copy), UseRefResult (copy), DictationAnalyticsModule (upval), UseRefResult6 (copy)
				Dictation:debug("Dictation: cancelled")
				UseRefResult5.current += 1
				UseDictationAudioPipelineModuleResult.stop()
				
				if UseRefResult4.current then
					pcall(task.cancel, UseRefResult4.current)
					UseRefResult4.current = nil
				end
				if UseRefResult3.current then
					pcall(task.cancel, UseRefResult3.current)
					UseRefResult3.current = nil
				end
				UseAnimatedBindingResult2(ReactOtterModule.instant(0))
				local Idle = DictationState.Idle
				SetFunction(Idle)
				local IsIdleMatch: boolean = Idle == DictationState.Recording or (Idle == DictationState.Transcribing or Idle == DictationState.Listening)
				
				if IsIdleMatch ~= UseRefResult1.current then
					UseRefResult1.current = IsIdleMatch
					local Current = UseRefResult.current
					
					if Current ~= nil and Current.onActivityChanged ~= nil then
						Current.onActivityChanged(IsIdleMatch)
					end
				end
				local UserManual = DictationAnalyticsModule.TriggerTypes.UserManual
				local Current1 = UseRefResult6.current
				local Current2 = UseRefResult.current
				
				if Current2 ~= nil and Current2.onRecordingStop ~= nil and Current1 ~= nil and Current1.startedAt ~= nil then
					Current2.onRecordingStop(Current1.mode, UserManual, os.clock() - Current1.startedAt, nil)
				end
				UseRefResult6.current = nil
			end, {}),
			audioDeviceInput = UseDictationAudioPipelineModuleResult.audioDeviceInput,
			bindings = ReactModule.useMemo(function() --[[ Line: 492 ]]
				-- upvalues: UseSignalBindingResult (copy), UseSignalBindingResult4 (copy), UseSignalBindingResult1 (copy), UseSignalBindingResult2 (copy), UseSignalBindingResult3 (copy), UseSignalBindingResult5 (copy), UseSignalBindingResult6 (copy), MapResult (copy), UseAnimatedBindingResult (copy)
				return {
					isRecording = UseSignalBindingResult,
					isNotRecording = UseSignalBindingResult4,
					isTranscribing = UseSignalBindingResult1,
					isBusy = UseSignalBindingResult2,
					isIdle = UseSignalBindingResult3,
					isListening = UseSignalBindingResult5,
					isAudioActive = UseSignalBindingResult6,
					countdownText = MapResult,
					countdownProgress = UseAnimatedBindingResult
				}
			end, {
				MapResult, UseAnimatedBindingResult, UseSignalBindingResult6,
				UseSignalBindingResult2, UseSignalBindingResult3, UseSignalBindingResult5,
				UseSignalBindingResult4, UseSignalBindingResult, UseSignalBindingResult1
			})
		}
	end,
	DictationState = DictationState,
	DictationErrorReason = DictationErrorReason,
	formatTime = formatTime
}
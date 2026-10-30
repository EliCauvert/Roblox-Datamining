local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local Dictation = require(Parent.ExpChatShared).Logger:new("ExpChat/Dictation")
local DictationModeModule = require(script.Parent.DictationMode)
local DictationStateModule = require(script.Parent.DictationState)
local DictationAnalyticsModule = require(script.Parent.DictationAnalytics)
local FFlagExpChatDictationExplicitFinishModule = require(ExpChat.Flags.FFlagExpChatDictationExplicitFinish)
local UseDictationAudioPipelineModule = require(script.Parent.useDictationAudioPipeline)
local RequestMicPermissionModule = require(script.Parent.requestMicPermission)
local RequestMicPermissionFunction = RequestMicPermissionModule.requestMicPermission
local PermissionStatus = RequestMicPermissionModule.PermissionStatus
local CreateSignalFunction = require(Parent.Signals).createSignal
local UseSignalBindingFunction = require(Parent.SignalsReact).useSignalBinding
local DictationErrorReason = {
	PermissionDenied = "permission_denied",
	TranscriptionFailed = "transcription_failed",
	LanguageUnsupported = "language_unsupported",
	Other = "other"
}
local config = { duration = 10, easingStyle = Enum.EasingStyle.Linear }

local function formatTime(p1: number): string
	return string.format("%d:%02d", math.floor(p1 / 60), p1 % 60)
end

local function _(p1)
	if p1.current then
		pcall(task.cancel, p1.current)
		p1.current = nil
	end
end

local _ = function(p1, p2)
	if p1.current then
		pcall(task.cancel, p1.current)
		p1.current = nil
	end
	p1.current = task.spawn(function()
		-- upvalues: p2 (copy)
		for i = 1, 10 do
			task.wait(1)
			p2(10 - i)
		end
	end)
end

return {
	MAX_RECORDING_SECONDS = 10,
	useDictation = function(Current)
		-- upvalues: ReactModule (copy), CreateSignalFunction (copy), DictationStateModule (copy), UseDictationAudioPipelineModule (copy), ReactOtterModule (copy), UseSignalBindingFunction (copy), Dictation (copy), DictationAnalyticsModule (copy), FFlagExpChatDictationExplicitFinishModule (copy), DictationErrorReason (copy), DictationModeModule (copy), config (copy), RequestMicPermissionFunction (copy), PermissionStatus (copy), formatTime (copy)
		local UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: CreateSignalFunction (upval), DictationStateModule (upval)
			local Signal, Signal2 = CreateSignalFunction(DictationStateModule.Idle)
			
			return { get = Signal, set = Signal2 }
		end, {})
		local GetFunction = UseMemoResult.get
		local SetFunction = UseMemoResult.set
		local UseDictationAudioPipelineModuleResult = UseDictationAudioPipelineModule()
		local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
		local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0)
		local UseSignalBindingResult = UseSignalBindingFunction(function(p3): boolean
			-- upvalues: GetFunction (copy), DictationStateModule (upval)
			return GetFunction(p3) == DictationStateModule.Recording
		end)
		local UseSignalBindingResult1 = UseSignalBindingFunction(function(p3): boolean
			-- upvalues: GetFunction (copy), DictationStateModule (upval)
			return GetFunction(p3) == DictationStateModule.Transcribing
		end)
		local UseSignalBindingResult2 = UseSignalBindingFunction(function(p3): boolean
			-- upvalues: GetFunction (copy), DictationStateModule (upval)
			local GetResult = GetFunction(p3)
			
			return GetResult == DictationStateModule.Recording or GetResult == DictationStateModule.Transcribing
		end)
		local UseSignalBindingResult3 = UseSignalBindingFunction(function(p3): boolean
			-- upvalues: GetFunction (copy), DictationStateModule (upval)
			return GetFunction(p3) == DictationStateModule.Idle
		end)
		local UseSignalBindingResult4 = UseSignalBindingFunction(function(p3): boolean
			-- upvalues: GetFunction (copy), DictationStateModule (upval)
			return GetFunction(p3) ~= DictationStateModule.Recording
		end)
		local UseSignalBindingResult5 = UseSignalBindingFunction(function(p3): boolean
			-- upvalues: GetFunction (copy), DictationStateModule (upval)
			return GetFunction(p3) == DictationStateModule.Listening
		end)
		local UseSignalBindingResult6 = UseSignalBindingFunction(function(p3): boolean
			-- upvalues: GetFunction (copy), DictationStateModule (upval)
			local GetResult = GetFunction(p3)
			
			return GetResult == DictationStateModule.Recording or GetResult == DictationStateModule.Listening
		end)
		local UseRefResult = ReactModule.useRef(Current)
		UseRefResult.current = Current
		local UseRefResult1 = ReactModule.useRef(false)
		local UseRefResult2 = ReactModule.useRef(false)
		local UseRefResult3 = ReactModule.useRef(nil)
		local UseRefResult4 = ReactModule.useRef(nil)
		local UseRefResult5 = ReactModule.useRef(0)
		local UseRefResult6 = ReactModule.useRef(nil)
		
		local function transitionTo(Idle)
			-- upvalues: GetFunction (copy), SetFunction (copy), DictationStateModule (upval), UseRefResult1 (copy), UseRefResult (copy)
			local GetResult = GetFunction(false)
			SetFunction(Idle)
			local IsIdleMatch: boolean = Idle == DictationStateModule.Recording or (Idle == DictationStateModule.Transcribing or Idle == DictationStateModule.Listening)
			
			if IsIdleMatch ~= UseRefResult1.current then
				UseRefResult1.current = IsIdleMatch
				local Current = UseRefResult.current
				
				if Current ~= nil and Current.onActivityChanged ~= nil then
					Current.onActivityChanged(IsIdleMatch)
				end
			end
			if Idle ~= GetResult then
				local Current = UseRefResult.current
				
				if Current ~= nil and Current.onStateChanged ~= nil then
					Current.onStateChanged(Idle)
				end
			end
		end
		
		local function _(p3)
			-- upvalues: UseDictationAudioPipelineModuleResult (copy), UseRefResult4 (copy), UseRefResult3 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval)
			UseDictationAudioPipelineModuleResult.stop(p3)
			
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
		
		local function handleError(TranscriptionFailed, p3)
			-- upvalues: Dictation (upval), UseRefResult6 (copy), UseDictationAudioPipelineModuleResult (copy), UseRefResult4 (copy), UseRefResult3 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), transitionTo (copy), DictationStateModule (upval), UseRefResult (copy)
			Dictation:warning("Dictation: {} ({})", p3, TranscriptionFailed)
			local Mode = UseRefResult6.current and UseRefResult6.current.mode or nil
			UseDictationAudioPipelineModuleResult.stop(nil)
			
			if UseRefResult4.current then
				pcall(task.cancel, UseRefResult4.current)
				UseRefResult4.current = nil
			end
			if UseRefResult3.current then
				pcall(task.cancel, UseRefResult3.current)
				UseRefResult3.current = nil
			end
			UseAnimatedBindingResult2(ReactOtterModule.instant(0))
			transitionTo(DictationStateModule.Idle)
			local Current = UseRefResult.current
			
			if Current ~= nil and Current.onError ~= nil then
				Current.onError(Mode, TranscriptionFailed)
			end
			UseRefResult6.current = nil
		end
		
		ReactModule.useEffect(function()
			-- upvalues: UseRefResult5 (copy), UseRefResult4 (copy), UseRefResult3 (copy), GetFunction (copy), DictationStateModule (upval), UseRefResult (copy)
			return function()
				-- upvalues: UseRefResult5 (upval), UseRefResult4 (upval), UseRefResult3 (upval), GetFunction (upval), DictationStateModule (upval), UseRefResult (upval)
				UseRefResult5.current += 1
				
				if UseRefResult4.current then
					pcall(task.cancel, UseRefResult4.current)
					UseRefResult4.current = nil
				end
				if UseRefResult3.current then
					pcall(task.cancel, UseRefResult3.current)
					UseRefResult3.current = nil
				end
				if GetFunction(false) ~= DictationStateModule.Idle then
					local Current = UseRefResult.current
					
					if Current ~= nil and Current.onStateChanged ~= nil then
						Current.onStateChanged(DictationStateModule.Idle)
					end
				end
			end
		end, { GetFunction })
		
		local _ = function(p3, p4)
			-- upvalues: UseRefResult6 (copy), UseRefResult (copy)
			local Current = UseRefResult6.current
			local Current1 = UseRefResult.current
			
			if Current1 ~= nil and Current1.onRecordingStop ~= nil and Current ~= nil and Current.startedAt ~= nil then
				Current1.onRecordingStop(Current.mode, p3, os.clock() - Current.startedAt, p4)
				
				return
			end
		end
		
		local UseRefResult7 = ReactModule.useRef(nil)
		local UseResult = ReactModule.useCallback(function(p3)
			-- upvalues: DictationAnalyticsModule (upval), GetFunction (copy), FFlagExpChatDictationExplicitFinishModule (upval), UseRefResult5 (copy), UseDictationAudioPipelineModuleResult (copy), DictationStateModule (upval), UseRefResult4 (copy), UseRefResult3 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), transitionTo (copy), UseRefResult6 (copy), UseRefResult (copy), Dictation (upval), UseRefResult2 (copy), handleError (copy), DictationErrorReason (upval)
			local P18 = p3 or DictationAnalyticsModule.TriggerTypes.UserManual
			local GetResult = GetFunction(false)
			
			if FFlagExpChatDictationExplicitFinishModule and P18 == DictationAnalyticsModule.TriggerTypes.SafetyIntervention then
				UseRefResult5.current += 1
				UseDictationAudioPipelineModuleResult.discardPending()
				
				if GetResult == DictationStateModule.Recording or GetResult == DictationStateModule.Transcribing then return end
				UseDictationAudioPipelineModuleResult.stop(true)
				
				if UseRefResult4.current then
					pcall(task.cancel, UseRefResult4.current)
					UseRefResult4.current = nil
				end
				if UseRefResult3.current then
					pcall(task.cancel, UseRefResult3.current)
					UseRefResult3.current = nil
				end
				UseAnimatedBindingResult2(ReactOtterModule.instant(0))
				transitionTo(DictationStateModule.Idle)
				local Current = UseRefResult6.current
				local Current1 = UseRefResult.current
				
				if Current1 ~= nil and Current1.onRecordingStop ~= nil and Current ~= nil and Current.startedAt ~= nil then
					Current1.onRecordingStop(Current.mode, P18, os.clock() - Current.startedAt, nil)
				end
				UseRefResult6.current = nil
				
				return
			else
				local IsPMatch: boolean = FFlagExpChatDictationExplicitFinishModule and (GetResult == DictationStateModule.Listening and P18 == DictationAnalyticsModule.TriggerTypes.UserManual)
				
				if GetResult == DictationStateModule.Listening and not IsPMatch then
					Dictation:debug("Dictation: exited continuous mode")
					UseDictationAudioPipelineModuleResult.stop(true)
					
					if UseRefResult4.current then
						pcall(task.cancel, UseRefResult4.current)
						UseRefResult4.current = nil
					end
					if UseRefResult3.current then
						pcall(task.cancel, UseRefResult3.current)
						UseRefResult3.current = nil
					end
					UseAnimatedBindingResult2(ReactOtterModule.instant(0))
					transitionTo(DictationStateModule.Idle)
					local Current = UseRefResult6.current
					local Current2 = UseRefResult.current
					
					if Current2 ~= nil and Current2.onRecordingStop ~= nil and Current ~= nil and Current.startedAt ~= nil then
						Current2.onRecordingStop(Current.mode, P18, os.clock() - Current.startedAt, nil)
					end
					UseRefResult6.current = nil
					
					return
				else
					if GetResult ~= DictationStateModule.Recording and not IsPMatch then return end
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
						if IsPMatch then
							UseDictationAudioPipelineModuleResult.drain(5)
							transitionTo(DictationStateModule.Idle)
							local Current = UseRefResult6.current
							local Current5 = UseRefResult.current
							
							if Current5 ~= nil and (Current5.onRecordingStop ~= nil and Current ~= nil and Current.startedAt ~= nil) then
								Current5.onRecordingStop(Current.mode, P18, os.clock() - Current.startedAt, nil)
							end
							UseRefResult6.current = nil
							
							return
						else
							transitionTo(DictationStateModule.Transcribing)
							Dictation:debug("Dictation: stopped recording, waiting for transcription")
							local Current = UseRefResult6.current
							local Current6 = UseRefResult.current
							
							if Current6 ~= nil and Current6.onRecordingStop ~= nil and Current ~= nil and Current.startedAt ~= nil then
								Current6.onRecordingStop(Current.mode, P18, os.clock() - Current.startedAt, nil)
							end
							UseRefResult4.current = task.delay(5, function()
								-- upvalues: handleError (upval), DictationErrorReason (upval)
								handleError(DictationErrorReason.TranscriptionFailed, "transcription timed out")
							end)
							
							return
						end
					else
						Dictation:debug("Dictation: no voice activity, returning to idle")
						UseDictationAudioPipelineModuleResult.stop(nil)
						
						if UseRefResult4.current then
							pcall(task.cancel, UseRefResult4.current)
							UseRefResult4.current = nil
						end
						if UseRefResult3.current then
							pcall(task.cancel, UseRefResult3.current)
							UseRefResult3.current = nil
						end
						UseAnimatedBindingResult2(ReactOtterModule.instant(0))
						transitionTo(DictationStateModule.Idle)
						local Current3 = UseRefResult6.current
						local Current4 = UseRefResult.current
						
						if Current4 ~= nil and Current4.onRecordingStop ~= nil and Current3 ~= nil and Current3.startedAt ~= nil then
							Current4.onRecordingStop(Current3.mode, P18, os.clock() - Current3.startedAt, nil)
						end
						UseRefResult6.current = nil
					end
				end
			end
		end, { UseDictationAudioPipelineModuleResult, GetFunction })
		UseRefResult7.current = UseResult
		local MapResult = UseBindingResult:map(function(p3)
			-- upvalues: formatTime (upval)
			return formatTime(p3)
		end)
		
		return {
			getDictationState = GetFunction,
			startDictation = ReactModule.useCallback(function(Mode)
				-- upvalues: GetFunction (copy), DictationStateModule (upval), UseRefResult6 (copy), UseRefResult5 (copy), UseRefResult2 (copy), UseDictationAudioPipelineModuleResult (copy), Dictation (upval), DictationAnalyticsModule (upval), UseRefResult (copy), UseRefResult4 (copy), UseRefResult3 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), transitionTo (copy), DictationModeModule (upval), handleError (copy), DictationErrorReason (upval), UseBindingResult2 (copy), config (upval), UseRefResult7 (copy), FFlagExpChatDictationExplicitFinishModule (upval), RequestMicPermissionFunction (upval), PermissionStatus (upval)
				if GetFunction(false) == DictationStateModule.Idle then
					UseRefResult6.current = { mode = Mode }
					UseRefResult5.current += 1
					local Current = UseRefResult5.current
					
					local function doStartStandard()
						-- upvalues: UseRefResult2 (upval), UseDictationAudioPipelineModuleResult (upval), Dictation (upval), GetFunction (upval), DictationStateModule (upval), DictationAnalyticsModule (upval), UseRefResult6 (upval), UseRefResult (upval), UseRefResult4 (upval), UseRefResult3 (upval), UseAnimatedBindingResult2 (upval), ReactOtterModule (upval), transitionTo (upval), DictationModeModule (upval), handleError (upval), DictationErrorReason (upval), UseBindingResult2 (upval), config (upval), UseRefResult7 (upval)
						UseRefResult2.current = false
						local Success, Result = pcall(function()
							-- upvalues: UseDictationAudioPipelineModuleResult (upval), Dictation (upval), GetFunction (upval), DictationStateModule (upval), DictationAnalyticsModule (upval), UseRefResult6 (upval), UseRefResult (upval), UseRefResult4 (upval), UseRefResult3 (upval), UseAnimatedBindingResult2 (upval), ReactOtterModule (upval), transitionTo (upval), DictationModeModule (upval), UseRefResult2 (upval), handleError (upval), DictationErrorReason (upval)
							UseDictationAudioPipelineModuleResult.start({
								onTranscription = function(p3)
									-- upvalues: Dictation (upval), GetFunction (upval), DictationStateModule (upval), DictationAnalyticsModule (upval), UseRefResult6 (upval), UseRefResult (upval), UseDictationAudioPipelineModuleResult (upval), UseRefResult4 (upval), UseRefResult3 (upval), UseAnimatedBindingResult2 (upval), ReactOtterModule (upval), transitionTo (upval), DictationModeModule (upval)
									Dictation:debug("Dictation: received transcription: {}", p3)
									
									if GetFunction(false) == DictationStateModule.Recording then
										local AutoPause = DictationAnalyticsModule.TriggerTypes.AutoPause
										local CountP20 = #p3
										local Current = UseRefResult6.current
										local Current1 = UseRefResult.current
										
										if Current1 ~= nil and Current1.onRecordingStop ~= nil and Current ~= nil and Current.startedAt ~= nil then
											Current1.onRecordingStop(Current.mode, AutoPause, os.clock() - Current.startedAt, CountP20)
										end
									end
									UseDictationAudioPipelineModuleResult.stop(nil)
									
									if UseRefResult4.current then
										pcall(task.cancel, UseRefResult4.current)
										UseRefResult4.current = nil
									end
									if UseRefResult3.current then
										pcall(task.cancel, UseRefResult3.current)
										UseRefResult3.current = nil
									end
									UseAnimatedBindingResult2(ReactOtterModule.instant(0))
									transitionTo(DictationStateModule.Idle)
									local Current = UseRefResult.current
									
									if Current ~= nil and Current.onTranscription ~= nil then
										Current.onTranscription(p3, DictationModeModule.Standard)
									end
									UseRefResult6.current = nil
								end,
								onSpeechStarted = function()
									-- upvalues: UseRefResult2 (upval)
									UseRefResult2.current = true
								end,
								onError = function(p3)
									-- upvalues: handleError (upval), DictationErrorReason (upval)
									handleError(DictationErrorReason.TranscriptionFailed, p3)
								end
							})
						end)
						
						if not Success then
							handleError(DictationErrorReason.Other, "failed to start recording: " .. tostring(Result))
							
							return
						end
						transitionTo(DictationStateModule.Recording)
						
						if UseRefResult6.current then
							UseRefResult6.current.startedAt = os.clock()
						end
						local Current = UseRefResult.current
						
						if Current and Current.onRecordingStart then
							Current.onRecordingStart(DictationModeModule.Standard, DictationAnalyticsModule.TriggerTypes.UserManual)
						end
						UseBindingResult2(10)
						UseAnimatedBindingResult2(ReactOtterModule.instant(1))
						task.defer(function()
							-- upvalues: UseAnimatedBindingResult2 (upval), ReactOtterModule (upval), config (upval)
							UseAnimatedBindingResult2(ReactOtterModule.ease(0, config))
						end)
						Dictation:debug("Dictation: started recording")
						
						if UseRefResult3.current then
							pcall(task.cancel, UseRefResult3.current)
							UseRefResult3.current = nil
						end
						UseRefResult3.current = task.spawn(function()
							-- upvalues: UseBindingResult2 (copy)
							for i = 1, 10 do
								task.wait(1)
								UseBindingResult2(10 - i)
							end
						end)
						UseRefResult4.current = task.delay(10, function()
							-- upvalues: Dictation (upval), UseRefResult7 (upval), DictationAnalyticsModule (upval)
							Dictation:debug("Dictation: max recording time reached, stopping")
							
							if UseRefResult7.current then
								UseRefResult7.current(DictationAnalyticsModule.TriggerTypes.TimeUp)
							end
						end)
					end
					
					local function doStartContinuous()
						-- upvalues: UseRefResult6 (upval), FFlagExpChatDictationExplicitFinishModule (upval), UseRefResult2 (upval), UseDictationAudioPipelineModuleResult (upval), Dictation (upval), UseRefResult (upval), DictationModeModule (upval), handleError (upval), DictationErrorReason (upval), transitionTo (upval), DictationStateModule (upval), DictationAnalyticsModule (upval)
						local Current = UseRefResult6.current
						
						if FFlagExpChatDictationExplicitFinishModule then
							UseRefResult2.current = false
						end
						local Success, Result = pcall(function()
							-- upvalues: UseDictationAudioPipelineModuleResult (upval), Dictation (upval), UseRefResult (upval), DictationModeModule (upval), FFlagExpChatDictationExplicitFinishModule (upval), UseRefResult6 (upval), Current (copy), UseRefResult2 (upval), handleError (upval), DictationErrorReason (upval)
							UseDictationAudioPipelineModuleResult.start({
								onTranscription = function(p3)
									-- upvalues: Dictation (upval), UseRefResult (upval), DictationModeModule (upval)
									Dictation:debug("Dictation: continuous utterance: {}", p3)
									local Current = UseRefResult.current
									
									if Current ~= nil and Current.onTranscription ~= nil then
										Current.onTranscription(p3, DictationModeModule.Continuous)
									end
								end,
								onSpeechStarted = function()
									-- upvalues: FFlagExpChatDictationExplicitFinishModule (upval), UseRefResult6 (upval), Current (upval), UseRefResult2 (upval), UseRefResult (upval), DictationModeModule (upval)
									if FFlagExpChatDictationExplicitFinishModule and UseRefResult6.current ~= Current then return end
									if FFlagExpChatDictationExplicitFinishModule then
										UseRefResult2.current = true
									end
									local Current1 = UseRefResult.current
									
									if Current1 ~= nil and Current1.onSpeechStarted ~= nil then
										Current1.onSpeechStarted(DictationModeModule.Continuous)
									end
								end,
								onError = function(p3)
									-- upvalues: FFlagExpChatDictationExplicitFinishModule (upval), UseRefResult6 (upval), Current (upval), handleError (upval), DictationErrorReason (upval)
									if not FFlagExpChatDictationExplicitFinishModule or UseRefResult6.current == Current then
										handleError(DictationErrorReason.TranscriptionFailed, p3)
										
										return
									end
								end
							}, { continuous = true })
						end)
						
						if not Success then
							handleError(DictationErrorReason.Other, "failed to enter continuous mode: " .. tostring(Result))
							
							return
						end
						transitionTo(DictationStateModule.Listening)
						
						if UseRefResult6.current then
							UseRefResult6.current.startedAt = os.clock()
						end
						local Current1 = UseRefResult.current
						
						if Current1 and Current1.onRecordingStart then
							Current1.onRecordingStart(DictationModeModule.Continuous, DictationAnalyticsModule.TriggerTypes.UserManual)
						end
						Dictation:debug("Dictation: entered continuous mode")
					end
					
					local function _(): boolean
						-- upvalues: UseRefResult5 (upval), Current (copy)
						return UseRefResult5.current ~= Current
					end
					
					RequestMicPermissionFunction():andThen(function(Result)
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
					end):catch(function(Err)
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
			cancel = ReactModule.useCallback(function()
				-- upvalues: Dictation (upval), UseRefResult5 (copy), UseDictationAudioPipelineModuleResult (copy), UseRefResult4 (copy), UseRefResult3 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), transitionTo (copy), DictationStateModule (upval), DictationAnalyticsModule (upval), UseRefResult6 (copy), UseRefResult (copy)
				Dictation:debug("Dictation: cancelled")
				UseRefResult5.current += 1
				UseDictationAudioPipelineModuleResult.stop(true)
				
				if UseRefResult4.current then
					pcall(task.cancel, UseRefResult4.current)
					UseRefResult4.current = nil
				end
				if UseRefResult3.current then
					pcall(task.cancel, UseRefResult3.current)
					UseRefResult3.current = nil
				end
				UseAnimatedBindingResult2(ReactOtterModule.instant(0))
				transitionTo(DictationStateModule.Idle)
				local UserManual = DictationAnalyticsModule.TriggerTypes.UserManual
				local Current = UseRefResult6.current
				local Current1 = UseRefResult.current
				
				if Current1 ~= nil and Current1.onRecordingStop ~= nil and Current ~= nil and Current.startedAt ~= nil then
					Current1.onRecordingStop(Current.mode, UserManual, os.clock() - Current.startedAt, nil)
				end
				UseRefResult6.current = nil
			end, {}),
			audioDeviceInput = UseDictationAudioPipelineModuleResult.audioDeviceInput,
			bindings = ReactModule.useMemo(function()
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
	DictationState = DictationStateModule,
	DictationErrorReason = DictationErrorReason,
	formatTime = formatTime
}
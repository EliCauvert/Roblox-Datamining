local parent = script:FindFirstAncestor("ExpChat").Parent
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local dictation = require(parent.ExpChatShared).Logger:new("ExpChat/Dictation")
local dictationModeModule = require(script.Parent.DictationMode)
local dictationAnalyticsModule = require(script.Parent.DictationAnalytics)
local useDictationAudioPipelineModule = require(script.Parent.useDictationAudioPipeline)
local requestMicPermissionModule = require(script.Parent.requestMicPermission)
local requestMicPermission = requestMicPermissionModule.requestMicPermission
local permissionStatus = requestMicPermissionModule.PermissionStatus
local createSignal = signalsModule.createSignal
local useSignalBinding = signalsReactModule.useSignalBinding
local t = {
	Idle = "idle",
	Recording = "recording",
	Transcribing = "transcribing",
	Listening = "listening"
}
local t_1 = {
	PermissionDenied = "permission_denied",
	TranscriptionFailed = "transcription_failed",
	LanguageUnsupported = "language_unsupported",
	Other = "other"
}
local t_2 = { duration = 10, easingStyle = Enum.EasingStyle.Linear }

local function formatTime(p0)
	return string.format("%d:%02d", math.floor(p0 / 60), p0 % 60)
end

local function _(p1)
	if p1.current then
		pcall(task.cancel, p1.current)
		p1.current = nil
	end
end

local _ = function(p2, p3)
	if p2.current then
		pcall(task.cancel, p2.current)
		p2.current = nil
	end
	p2.current = task.spawn(function()
		-- upvalues: p3 (ref)
		for i = 1, 10 do
			task.wait(1)
			p3(10 - i)
		end
	end)
end

return {
	MAX_RECORDING_SECONDS = 10,
	useDictation = function(p4)
		-- upvalues: reactModule (ref), createSignal (ref), t (ref), useDictationAudioPipelineModule (ref), reactOtterModule (ref), useSignalBinding (ref), dictation (ref), dictationAnalyticsModule (ref), t_1 (ref), dictationModeModule (ref), t_2 (ref), requestMicPermission (ref), permissionStatus (ref), formatTime (ref)
		local var13 = reactModule.useMemo(function()
			-- upvalues: createSignal (copy), t (copy)
			local var37, var38 = createSignal(t.Idle)
			
			return { get = var37, set = var38 }
		end, {})
		local get = var13.get
		local set = var13.set
		local var14 = useDictationAudioPipelineModule()
		local var15, var16 = reactModule.useBinding(0)
		local var17, var18 = reactOtterModule.useAnimatedBinding(0)
		local var19 = useSignalBinding(function(p5)
			-- upvalues: get (ref), t (copy)
			return get(p5) == t.Recording
		end)
		local var20 = useSignalBinding(function(p6)
			-- upvalues: get (ref), t (copy)
			return get(p6) == t.Transcribing
		end)
		local var21 = useSignalBinding(function(p7)
			-- upvalues: get (ref), t (copy)
			local var39 = get(p7)
			
			return if var39 ~= t.Recording then var39 == t.Transcribing else true
		end)
		local var22 = useSignalBinding(function(p8)
			-- upvalues: get (ref), t (copy)
			return get(p8) == t.Idle
		end)
		local var23 = useSignalBinding(function(p9)
			-- upvalues: get (ref), t (copy)
			return get(p9) ~= t.Recording
		end)
		local var24 = useSignalBinding(function(p10)
			-- upvalues: get (ref), t (copy)
			return get(p10) == t.Listening
		end)
		local var25 = useSignalBinding(function(p11)
			-- upvalues: get (ref), t (copy)
			local var40 = get(p11)
			
			return if var40 ~= t.Recording then var40 == t.Listening else true
		end)
		local var26 = reactModule.useRef(p4)
		var26.current = p4
		local var27 = reactModule.useRef(false)
		local var28 = reactModule.useRef(false)
		local var29 = reactModule.useRef(nil)
		local var30 = reactModule.useRef(nil)
		local var31 = reactModule.useRef(0)
		local var32 = reactModule.useRef(nil)
		
		local function _(p12)
			-- upvalues: set (ref), t (copy), var27 (ref), var26 (ref)
			set(p12)
			local var41 = if p12 ~= t.Recording then if p12 ~= t.Transcribing then p12 == t.Listening else true else true
			
			if var41 ~= var27.current then
				var27.current = var41
				local current = var26.current
				
				if current ~= nil and current.onActivityChanged ~= nil then
					current.onActivityChanged(var41)
				end
			end
		end
		
		local _ = function()
			-- upvalues: var14 (ref), var30 (ref), var29 (ref), var18 (ref), reactOtterModule (copy)
			var14.stop()
			
			if var30.current then
				pcall(task.cancel, var30.current)
				var30.current = nil
			end
			if var29.current then
				pcall(task.cancel, var29.current)
				var29.current = nil
			end
			var18(reactOtterModule.instant(0))
		end
		
		local function handleError(p13, p14)
			-- upvalues: dictation (copy), var32 (ref), var14 (ref), var30 (ref), var29 (ref), var18 (ref), reactOtterModule (copy), t (copy), set (ref), var27 (ref), var26 (ref)
			dictation:warning("Dictation: {} ({})", p14, p13)
			local var42 = if var32.current then var32.current.mode else nil
			var14.stop()
			
			if var30.current then
				pcall(task.cancel, var30.current)
				var30.current = nil
			end
			if var29.current then
				pcall(task.cancel, var29.current)
				var29.current = nil
			end
			var18(reactOtterModule.instant(0))
			local idle = t.Idle
			set(idle)
			local var43 = if idle ~= t.Recording then if idle ~= t.Transcribing then idle == t.Listening else true else true
			
			if var43 ~= var27.current then
				var27.current = var43
				local current = var26.current
				
				if current ~= nil and current.onActivityChanged ~= nil then
					current.onActivityChanged(var43)
				end
			end
			local current = var26.current
			
			if current ~= nil and current.onError ~= nil then
				current.onError(var42, p13)
			end
			var32.current = nil
		end
		
		reactModule.useEffect(function()
			-- upvalues: var31 (ref), var30 (ref), var29 (ref)
			return function()
				-- upvalues: var31 (copy), var30 (copy), var29 (copy)
				var31.current += 1
				
				if var30.current then
					pcall(task.cancel, var30.current)
					var30.current = nil
				end
				if var29.current then
					pcall(task.cancel, var29.current)
					var29.current = nil
				end
			end
		end, {})
		
		local _ = function(p15, p16)
			-- upvalues: var32 (ref), var26 (ref)
			local current = var32.current
			local current_1 = var26.current
			
			if current_1 == nil or current_1.onRecordingStop == nil or (current == nil or current.startedAt == nil) then
				return
			end
			current_1.onRecordingStop(current.mode, p15, os.clock() - current.startedAt, p16)
		end
		
		local var34 = reactModule.useRef(nil)
		local var35 = reactModule.useCallback(function(p17)
			-- upvalues: dictationAnalyticsModule (copy), get (ref), t (copy), dictation (copy), var14 (ref), var30 (ref), var29 (ref), var18 (ref), reactOtterModule (copy), set (ref), var27 (ref), var26 (ref), var32 (ref), var28 (ref), handleError (ref), t_1 (copy)
			p17 = p17 or dictationAnalyticsModule.TriggerTypes.UserManual
			local var45 = get(false)
			
			if var45 == t.Listening then
				dictation:debug("Dictation: exited continuous mode")
				var14.stop()
				
				if var30.current then
					pcall(task.cancel, var30.current)
					var30.current = nil
				end
				if var29.current then
					pcall(task.cancel, var29.current)
					var29.current = nil
				end
				var18(reactOtterModule.instant(0))
				local idle = t.Idle
				set(idle)
				local var46 = if idle ~= t.Recording then if idle ~= t.Transcribing then idle == t.Listening else true else true
				
				if var46 ~= var27.current then
					var27.current = var46
					local current = var26.current
					
					if current ~= nil and current.onActivityChanged ~= nil then
						current.onActivityChanged(var46)
					end
				end
				local current = var32.current
				local current_1 = var26.current
				
				if current_1 ~= nil and current_1.onRecordingStop ~= nil and (current ~= nil and current.startedAt ~= nil) then
					current_1.onRecordingStop(current.mode, p17, os.clock() - current.startedAt, nil)
				end
				var32.current = nil
				
				return
			elseif var45 ~= t.Recording then return end
			if var30.current then
				pcall(task.cancel, var30.current)
				var30.current = nil
			end
			if var29.current then
				pcall(task.cancel, var29.current)
				var29.current = nil
			end
			if var28.current then
				if var14.audioDeviceInputRef.current then
					var14.audioDeviceInputRef.current.Muted = true
				end
				local transcribing = t.Transcribing
				set(transcribing)
				local var48 = if transcribing ~= t.Recording then if transcribing ~= t.Transcribing then transcribing == t.Listening else true else true
				
				if var48 ~= var27.current then
					var27.current = var48
					local current = var26.current
					
					if current ~= nil and current.onActivityChanged ~= nil then
						current.onActivityChanged(var48)
					end
				end
				dictation:debug("Dictation: stopped recording, waiting for transcription")
				local current = var32.current
				local current_1 = var26.current
				
				if current_1 ~= nil and current_1.onRecordingStop ~= nil and (current ~= nil and current.startedAt ~= nil) then
					current_1.onRecordingStop(current.mode, p17, os.clock() - current.startedAt, nil)
				end
				var30.current = task.delay(5, function()
					-- upvalues: handleError (copy), t_1 (copy)
					handleError(t_1.TranscriptionFailed, "transcription timed out")
				end)
				
				return
			else
				dictation:debug("Dictation: no voice activity, returning to idle")
				var14.stop()
				
				if var30.current then
					pcall(task.cancel, var30.current)
					var30.current = nil
				end
				if var29.current then
					pcall(task.cancel, var29.current)
					var29.current = nil
				end
				var18(reactOtterModule.instant(0))
				local idle = t.Idle
				set(idle)
				local var47 = if idle ~= t.Recording then if idle ~= t.Transcribing then idle == t.Listening else true else true
				
				if var47 ~= var27.current then
					var27.current = var47
					local current = var26.current
					
					if current ~= nil and current.onActivityChanged ~= nil then
						current.onActivityChanged(var47)
					end
				end
				local current = var32.current
				local current_1 = var26.current
				
				if current_1 ~= nil and current_1.onRecordingStop ~= nil and (current ~= nil and current.startedAt ~= nil) then
					current_1.onRecordingStop(current.mode, p17, os.clock() - current.startedAt, nil)
				end
				var32.current = nil
			end
		end, { var14, get })
		var34.current = var35
		local var36 = var15:map(function(p18)
			-- upvalues: formatTime (copy)
			return formatTime(p18)
		end)
		
		return {
			getDictationState = get,
			startDictation = reactModule.useCallback(function(p19)
				-- upvalues: get (ref), t (copy), var32 (ref), var31 (ref), var28 (ref), var14 (ref), dictation (copy), dictationAnalyticsModule (copy), var26 (ref), var30 (ref), var29 (ref), var18 (ref), reactOtterModule (copy), set (ref), var27 (ref), dictationModeModule (copy), handleError (ref), t_1 (copy), var16 (ref), t_2 (copy), var34 (ref), requestMicPermission (copy), permissionStatus (copy)
				if get(false) == t.Idle then
					var32.current = { mode = p19 }
					var31.current += 1
					local current = var31.current
					
					local function doStartStandard()
						-- upvalues: var28 (copy), var14 (copy), dictation (copy), get (copy), t (copy), dictationAnalyticsModule (copy), var32 (copy), var26 (copy), var30 (copy), var29 (copy), var18 (copy), reactOtterModule (copy), set (copy), var27 (copy), dictationModeModule (copy), handleError (copy), t_1 (copy), var16 (copy), t_2 (copy), var34 (copy)
						var28.current = false
						local ok, status = pcall(function()
							-- upvalues: var14 (copy), dictation (copy), get (copy), t (copy), dictationAnalyticsModule (copy), var32 (copy), var26 (copy), var30 (copy), var29 (copy), var18 (copy), reactOtterModule (copy), set (copy), var27 (copy), dictationModeModule (copy), var28 (copy), handleError (copy), t_1 (copy)
							var14.start({
								onTranscription = function(p20)
									-- upvalues: dictation (copy), get (copy), t (copy), dictationAnalyticsModule (copy), var32 (copy), var26 (copy), var14 (copy), var30 (copy), var29 (copy), var18 (copy), reactOtterModule (copy), set (copy), var27 (copy), dictationModeModule (copy)
									dictation:debug("Dictation: received transcription: {}", p20)
									
									if get(false) == t.Recording then
										local autoPause = dictationAnalyticsModule.TriggerTypes.AutoPause
										local p20Count = #p20
										local current = var32.current
										local current_1 = var26.current
										
										if current_1 ~= nil and current_1.onRecordingStop ~= nil and (current ~= nil and current.startedAt ~= nil) then
											current_1.onRecordingStop(current.mode, autoPause, os.clock() - current.startedAt, p20Count)
										end
									end
									var14.stop()
									
									if var30.current then
										pcall(task.cancel, var30.current)
										var30.current = nil
									end
									if var29.current then
										pcall(task.cancel, var29.current)
										var29.current = nil
									end
									var18(reactOtterModule.instant(0))
									local idle = t.Idle
									set(idle)
									local var53 = if idle ~= t.Recording then if idle ~= t.Transcribing then idle == t.Listening else true else true
									
									if var53 ~= var27.current then
										var27.current = var53
										local current = var26.current
										
										if current ~= nil and current.onActivityChanged ~= nil then
											current.onActivityChanged(var53)
										end
									end
									local current = var26.current
									
									if current ~= nil and current.onTranscription ~= nil then
										current.onTranscription(p20, dictationModeModule.Standard)
									end
									var32.current = nil
								end,
								onSpeechStarted = function()
									-- upvalues: var28 (copy)
									var28.current = true
								end,
								onError = function(p21)
									-- upvalues: handleError (copy), t_1 (copy)
									handleError(t_1.TranscriptionFailed, p21)
								end
							})
						end)
						
						if not ok then
							handleError(t_1.Other, "failed to start recording: " .. tostring(status))
							
							return
						end
						local recording = t.Recording
						set(recording)
						local var51 = if recording ~= t.Recording then if recording ~= t.Transcribing then recording == t.Listening else true else true
						
						if var51 ~= var27.current then
							var27.current = var51
							local current = var26.current
							
							if current ~= nil and current.onActivityChanged ~= nil then
								current.onActivityChanged(var51)
							end
						end
						if var32.current then
							var32.current.startedAt = os.clock()
						end
						local current = var26.current
						
						if current and current.onRecordingStart then
							current.onRecordingStart(dictationModeModule.Standard, dictationAnalyticsModule.TriggerTypes.UserManual)
						end
						var16(10)
						var18(reactOtterModule.instant(1))
						task.defer(function()
							-- upvalues: var18 (copy), reactOtterModule (copy), t_2 (copy)
							var18(reactOtterModule.ease(0, t_2))
						end)
						dictation:debug("Dictation: started recording")
						
						if var29.current then
							pcall(task.cancel, var29.current)
							var29.current = nil
						end
						var29.current = task.spawn(function()
							-- upvalues: var16 (ref)
							for i = 1, 10 do
								task.wait(1)
								var16(10 - i)
							end
						end)
						var30.current = task.delay(10, function()
							-- upvalues: dictation (copy), var34 (copy), dictationAnalyticsModule (copy)
							dictation:debug("Dictation: max recording time reached, stopping")
							
							if var34.current then
								var34.current(dictationAnalyticsModule.TriggerTypes.TimeUp)
							end
						end)
					end
					
					local function doStartContinuous()
						-- upvalues: var14 (copy), dictation (copy), var26 (copy), dictationModeModule (copy), handleError (copy), t_1 (copy), t (copy), set (copy), var27 (copy), var32 (copy), dictationAnalyticsModule (copy)
						local ok, status = pcall(function()
							-- upvalues: var14 (copy), dictation (copy), var26 (copy), dictationModeModule (copy), handleError (copy), t_1 (copy)
							var14.start({
								onTranscription = function(p22)
									-- upvalues: dictation (copy), var26 (copy), dictationModeModule (copy)
									dictation:debug("Dictation: continuous utterance: {}", p22)
									local current = var26.current
									
									if current ~= nil and current.onTranscription ~= nil then
										current.onTranscription(p22, dictationModeModule.Continuous)
									end
								end,
								onSpeechStarted = function()
									-- upvalues: var26 (copy), dictationModeModule (copy)
									local current = var26.current
									
									if current ~= nil and current.onSpeechStarted ~= nil then
										current.onSpeechStarted(dictationModeModule.Continuous)
									end
								end,
								onError = function(p23)
									-- upvalues: handleError (copy), t_1 (copy)
									handleError(t_1.TranscriptionFailed, p23)
								end
							}, { continuous = true })
						end)
						
						if not ok then
							handleError(t_1.Other, "failed to enter continuous mode: " .. tostring(status))
							
							return
						end
						local listening = t.Listening
						set(listening)
						local var54 = if listening ~= t.Recording then if listening ~= t.Transcribing then listening == t.Listening else true else true
						
						if var54 ~= var27.current then
							var27.current = var54
							local current = var26.current
							
							if current ~= nil and current.onActivityChanged ~= nil then
								current.onActivityChanged(var54)
							end
						end
						if var32.current then
							var32.current.startedAt = os.clock()
						end
						local current = var26.current
						
						if current and current.onRecordingStart then
							current.onRecordingStart(dictationModeModule.Continuous, dictationAnalyticsModule.TriggerTypes.UserManual)
						end
						dictation:debug("Dictation: entered continuous mode")
					end
					
					local function _()
						-- upvalues: var31 (copy), current (ref)
						return var31.current ~= current
					end
					
					requestMicPermission():andThen(function(p25)
						-- upvalues: var31 (copy), current (ref), var26 (copy), p19 (ref), permissionStatus (copy), handleError (copy), t_1 (copy), dictationModeModule (copy), doStartContinuous (ref), doStartStandard (ref)
						if var31.current ~= current then return end
						local current_1 = var26.current
						
						if current_1 ~= nil and current_1.onPermissionResolved ~= nil then
							current_1.onPermissionResolved(p25.status, p19)
						end
						if p25.status == permissionStatus.Denied then
							handleError(t_1.PermissionDenied, if p25.error then "microphone permission denied: " .. p25.error else "microphone permission denied")
							
							return
						elseif p19 == dictationModeModule.Continuous then
							doStartContinuous()
							
							return
						end
						doStartStandard()
					end):catch(function(p24)
						-- upvalues: var31 (copy), current (ref), handleError (copy), t_1 (copy)
						if var31.current ~= current then
							return
						end
						handleError(t_1.PermissionDenied, "mic permission request failed: " .. tostring(p24))
					end)
					
					return
				end
			end, { var14, get }),
			stopDictation = var35,
			cancel = reactModule.useCallback(function()
				-- upvalues: dictation (copy), var31 (ref), var14 (ref), var30 (ref), var29 (ref), var18 (ref), reactOtterModule (copy), t (copy), set (ref), var27 (ref), var26 (ref), dictationAnalyticsModule (copy), var32 (ref)
				dictation:debug("Dictation: cancelled")
				var31.current += 1
				var14.stop()
				
				if var30.current then
					pcall(task.cancel, var30.current)
					var30.current = nil
				end
				if var29.current then
					pcall(task.cancel, var29.current)
					var29.current = nil
				end
				var18(reactOtterModule.instant(0))
				local idle = t.Idle
				set(idle)
				local var55 = if idle ~= t.Recording then if idle ~= t.Transcribing then idle == t.Listening else true else true
				
				if var55 ~= var27.current then
					var27.current = var55
					local current = var26.current
					
					if current ~= nil and current.onActivityChanged ~= nil then
						current.onActivityChanged(var55)
					end
				end
				local userManual = dictationAnalyticsModule.TriggerTypes.UserManual
				local current = var32.current
				local current_1 = var26.current
				
				if current_1 ~= nil and current_1.onRecordingStop ~= nil and (current ~= nil and current.startedAt ~= nil) then
					current_1.onRecordingStop(current.mode, userManual, os.clock() - current.startedAt, nil)
				end
				var32.current = nil
			end, {}),
			audioDeviceInput = var14.audioDeviceInput,
			bindings = reactModule.useMemo(function()
				-- upvalues: var19 (ref), var23 (ref), var20 (ref), var21 (ref), var22 (ref), var24 (ref), var25 (ref), var36 (ref), var17 (ref)
				return {
					isRecording = var19,
					isNotRecording = var23,
					isTranscribing = var20,
					isBusy = var21,
					isIdle = var22,
					isListening = var24,
					isAudioActive = var25,
					countdownText = var36,
					countdownProgress = var17
				}
			end, {
				var36, var17, var25, var21, var22, var24, var23, var19, var20
			})
		}
	end,
	DictationState = t,
	DictationErrorReason = t_1,
	formatTime = formatTime
}
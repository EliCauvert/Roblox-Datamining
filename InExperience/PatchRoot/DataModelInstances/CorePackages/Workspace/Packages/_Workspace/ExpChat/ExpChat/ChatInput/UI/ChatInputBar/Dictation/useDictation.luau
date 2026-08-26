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

local function formatTime(p1)
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
		-- upvalues: p2 (ref)
		for i = 1, 10 do
			task.wait(1)
			p2(10 - i)
		end
	end)
end

return {
	MAX_RECORDING_SECONDS = 10,
	useDictation = function(p3)
		-- upvalues: reactModule (ref), createSignal (ref), t (ref), useDictationAudioPipelineModule (ref), reactOtterModule (ref), useSignalBinding (ref), dictation (ref), dictationAnalyticsModule (ref), t_1 (ref), dictationModeModule (ref), t_2 (ref), requestMicPermission (ref), permissionStatus (ref), formatTime (ref)
		local var1 = reactModule.useMemo(function()
			-- upvalues: createSignal (copy), t (copy)
			local var2, var3 = createSignal(t.Idle)
			
			return { get = var2, set = var3 }
		end, {})
		local get = var1.get
		local set = var1.set
		local var2 = useDictationAudioPipelineModule()
		local var3, var4 = reactModule.useBinding(0)
		local var5, var6 = reactOtterModule.useAnimatedBinding(0)
		local var7 = useSignalBinding(function(p4)
			-- upvalues: get (ref), t (copy)
			return get(p4) == t.Recording
		end)
		local var8 = useSignalBinding(function(p4)
			-- upvalues: get (ref), t (copy)
			return get(p4) == t.Transcribing
		end)
		local var9 = useSignalBinding(function(p4)
			-- upvalues: get (ref), t (copy)
			local var10 = get(p4)
			
			return if var10 ~= t.Recording then var10 == t.Transcribing else true
		end)
		local var10 = useSignalBinding(function(p4)
			-- upvalues: get (ref), t (copy)
			return get(p4) == t.Idle
		end)
		local var11 = useSignalBinding(function(p4)
			-- upvalues: get (ref), t (copy)
			return get(p4) ~= t.Recording
		end)
		local var12 = useSignalBinding(function(p4)
			-- upvalues: get (ref), t (copy)
			return get(p4) == t.Listening
		end)
		local var13 = useSignalBinding(function(p4)
			-- upvalues: get (ref), t (copy)
			local var14 = get(p4)
			
			return if var14 ~= t.Recording then var14 == t.Listening else true
		end)
		local var14 = reactModule.useRef(p3)
		var14.current = p3
		local var15 = reactModule.useRef(false)
		local var16 = reactModule.useRef(false)
		local var17 = reactModule.useRef(nil)
		local var18 = reactModule.useRef(nil)
		local var19 = reactModule.useRef(0)
		local var20 = reactModule.useRef(nil)
		
		local function _(p4)
			-- upvalues: set (ref), t (copy), var15 (ref), var14 (ref)
			set(p4)
			local var21 = if p4 ~= t.Recording then if p4 ~= t.Transcribing then p4 == t.Listening else true else true
			
			if var21 ~= var15.current then
				var15.current = var21
				local current = var14.current
				
				if current ~= nil and current.onActivityChanged ~= nil then
					current.onActivityChanged(var21)
				end
			end
		end
		
		local _ = function()
			-- upvalues: var2 (ref), var18 (ref), var17 (ref), var6 (ref), reactOtterModule (copy)
			var2.stop()
			
			if var18.current then
				pcall(task.cancel, var18.current)
				var18.current = nil
			end
			if var17.current then
				pcall(task.cancel, var17.current)
				var17.current = nil
			end
			var6(reactOtterModule.instant(0))
		end
		
		local function handleError(p4, p5)
			-- upvalues: dictation (copy), var20 (ref), var2 (ref), var18 (ref), var17 (ref), var6 (ref), reactOtterModule (copy), t (copy), set (ref), var15 (ref), var14 (ref)
			dictation:warning("Dictation: {} ({})", p5, p4)
			local var21 = if var20.current then var20.current.mode else nil
			var2.stop()
			
			if var18.current then
				pcall(task.cancel, var18.current)
				var18.current = nil
			end
			if var17.current then
				pcall(task.cancel, var17.current)
				var17.current = nil
			end
			var6(reactOtterModule.instant(0))
			local idle = t.Idle
			set(idle)
			local var22 = if idle ~= t.Recording then if idle ~= t.Transcribing then idle == t.Listening else true else true
			
			if var22 ~= var15.current then
				var15.current = var22
				local current = var14.current
				
				if current ~= nil and current.onActivityChanged ~= nil then
					current.onActivityChanged(var22)
				end
			end
			local current = var14.current
			
			if current ~= nil and current.onError ~= nil then
				current.onError(var21, p4)
			end
			var20.current = nil
		end
		
		reactModule.useEffect(function()
			-- upvalues: var19 (ref), var18 (ref), var17 (ref)
			return function()
				-- upvalues: var19 (copy), var18 (copy), var17 (copy)
				var19.current += 1
				
				if var18.current then
					pcall(task.cancel, var18.current)
					var18.current = nil
				end
				if var17.current then
					pcall(task.cancel, var17.current)
					var17.current = nil
				end
			end
		end, {})
		
		local _ = function(p4, p5)
			-- upvalues: var20 (ref), var14 (ref)
			local current = var20.current
			local current_1 = var14.current
			
			if current_1 == nil or current_1.onRecordingStop == nil or (current == nil or current.startedAt == nil) then
				return
			end
			current_1.onRecordingStop(current.mode, p4, os.clock() - current.startedAt, p5)
		end
		
		local var21 = reactModule.useRef(nil)
		local var22 = reactModule.useCallback(function(p4)
			-- upvalues: dictationAnalyticsModule (copy), get (ref), t (copy), dictation (copy), var2 (ref), var18 (ref), var17 (ref), var6 (ref), reactOtterModule (copy), set (ref), var15 (ref), var14 (ref), var20 (ref), var16 (ref), handleError (ref), t_1 (copy)
			p4 = p4 or dictationAnalyticsModule.TriggerTypes.UserManual
			local var23 = get(false)
			
			if var23 == t.Listening then
				dictation:debug("Dictation: exited continuous mode")
				var2.stop()
				
				if var18.current then
					pcall(task.cancel, var18.current)
					var18.current = nil
				end
				if var17.current then
					pcall(task.cancel, var17.current)
					var17.current = nil
				end
				var6(reactOtterModule.instant(0))
				local idle = t.Idle
				set(idle)
				local var24 = if idle ~= t.Recording then if idle ~= t.Transcribing then idle == t.Listening else true else true
				
				if var24 ~= var15.current then
					var15.current = var24
					local current = var14.current
					
					if current ~= nil and current.onActivityChanged ~= nil then
						current.onActivityChanged(var24)
					end
				end
				local current = var20.current
				local current_1 = var14.current
				
				if current_1 ~= nil and current_1.onRecordingStop ~= nil and (current ~= nil and current.startedAt ~= nil) then
					current_1.onRecordingStop(current.mode, p4, os.clock() - current.startedAt, nil)
				end
				var20.current = nil
				
				return
			elseif var23 ~= t.Recording then return end
			if var18.current then
				pcall(task.cancel, var18.current)
				var18.current = nil
			end
			if var17.current then
				pcall(task.cancel, var17.current)
				var17.current = nil
			end
			if var16.current then
				if var2.audioDeviceInputRef.current then
					var2.audioDeviceInputRef.current.Muted = true
				end
				local transcribing = t.Transcribing
				set(transcribing)
				local var25 = if transcribing ~= t.Recording then if transcribing ~= t.Transcribing then transcribing == t.Listening else true else true
				
				if var25 ~= var15.current then
					var15.current = var25
					local current = var14.current
					
					if current ~= nil and current.onActivityChanged ~= nil then
						current.onActivityChanged(var25)
					end
				end
				dictation:debug("Dictation: stopped recording, waiting for transcription")
				local current = var20.current
				local current_1 = var14.current
				
				if current_1 ~= nil and current_1.onRecordingStop ~= nil and (current ~= nil and current.startedAt ~= nil) then
					current_1.onRecordingStop(current.mode, p4, os.clock() - current.startedAt, nil)
				end
				var18.current = task.delay(5, function()
					-- upvalues: handleError (copy), t_1 (copy)
					handleError(t_1.TranscriptionFailed, "transcription timed out")
				end)
				
				return
			else
				dictation:debug("Dictation: no voice activity, returning to idle")
				var2.stop()
				
				if var18.current then
					pcall(task.cancel, var18.current)
					var18.current = nil
				end
				if var17.current then
					pcall(task.cancel, var17.current)
					var17.current = nil
				end
				var6(reactOtterModule.instant(0))
				local idle = t.Idle
				set(idle)
				local var26 = if idle ~= t.Recording then if idle ~= t.Transcribing then idle == t.Listening else true else true
				
				if var26 ~= var15.current then
					var15.current = var26
					local current = var14.current
					
					if current ~= nil and current.onActivityChanged ~= nil then
						current.onActivityChanged(var26)
					end
				end
				local current = var20.current
				local current_1 = var14.current
				
				if current_1 ~= nil and current_1.onRecordingStop ~= nil and (current ~= nil and current.startedAt ~= nil) then
					current_1.onRecordingStop(current.mode, p4, os.clock() - current.startedAt, nil)
				end
				var20.current = nil
			end
		end, { var2, get })
		var21.current = var22
		local var23 = var3:map(function(p4)
			-- upvalues: formatTime (copy)
			return formatTime(p4)
		end)
		
		return {
			getDictationState = get,
			startDictation = reactModule.useCallback(function(p4)
				-- upvalues: get (ref), t (copy), var20 (ref), var19 (ref), var16 (ref), var2 (ref), dictation (copy), dictationAnalyticsModule (copy), var14 (ref), var18 (ref), var17 (ref), var6 (ref), reactOtterModule (copy), set (ref), var15 (ref), dictationModeModule (copy), handleError (ref), t_1 (copy), var4 (ref), t_2 (copy), var21 (ref), requestMicPermission (copy), permissionStatus (copy)
				if get(false) == t.Idle then
					var20.current = { mode = p4 }
					var19.current += 1
					local current = var19.current
					
					local function doStartStandard()
						-- upvalues: var16 (copy), var2 (copy), dictation (copy), get (copy), t (copy), dictationAnalyticsModule (copy), var20 (copy), var14 (copy), var18 (copy), var17 (copy), var6 (copy), reactOtterModule (copy), set (copy), var15 (copy), dictationModeModule (copy), handleError (copy), t_1 (copy), var4 (copy), t_2 (copy), var21 (copy)
						var16.current = false
						local ok, status = pcall(function()
							-- upvalues: var2 (copy), dictation (copy), get (copy), t (copy), dictationAnalyticsModule (copy), var20 (copy), var14 (copy), var18 (copy), var17 (copy), var6 (copy), reactOtterModule (copy), set (copy), var15 (copy), dictationModeModule (copy), var16 (copy), handleError (copy), t_1 (copy)
							var2.start({
								onTranscription = function(p5)
									-- upvalues: dictation (copy), get (copy), t (copy), dictationAnalyticsModule (copy), var20 (copy), var14 (copy), var2 (copy), var18 (copy), var17 (copy), var6 (copy), reactOtterModule (copy), set (copy), var15 (copy), dictationModeModule (copy)
									dictation:debug("Dictation: received transcription: {}", p5)
									
									if get(false) == t.Recording then
										local autoPause = dictationAnalyticsModule.TriggerTypes.AutoPause
										local p20Count = #p5
										local current = var20.current
										local current_1 = var14.current
										
										if current_1 ~= nil and current_1.onRecordingStop ~= nil and (current ~= nil and current.startedAt ~= nil) then
											current_1.onRecordingStop(current.mode, autoPause, os.clock() - current.startedAt, p20Count)
										end
									end
									var2.stop()
									
									if var18.current then
										pcall(task.cancel, var18.current)
										var18.current = nil
									end
									if var17.current then
										pcall(task.cancel, var17.current)
										var17.current = nil
									end
									var6(reactOtterModule.instant(0))
									local idle = t.Idle
									set(idle)
									local var24 = if idle ~= t.Recording then if idle ~= t.Transcribing then idle == t.Listening else true else true
									
									if var24 ~= var15.current then
										var15.current = var24
										local current = var14.current
										
										if current ~= nil and current.onActivityChanged ~= nil then
											current.onActivityChanged(var24)
										end
									end
									local current = var14.current
									
									if current ~= nil and current.onTranscription ~= nil then
										current.onTranscription(p5, dictationModeModule.Standard)
									end
									var20.current = nil
								end,
								onSpeechStarted = function()
									-- upvalues: var16 (copy)
									var16.current = true
								end,
								onError = function(p5)
									-- upvalues: handleError (copy), t_1 (copy)
									handleError(t_1.TranscriptionFailed, p5)
								end
							})
						end)
						
						if not ok then
							handleError(t_1.Other, "failed to start recording: " .. tostring(status))
							
							return
						end
						local recording = t.Recording
						set(recording)
						local var24 = if recording ~= t.Recording then if recording ~= t.Transcribing then recording == t.Listening else true else true
						
						if var24 ~= var15.current then
							var15.current = var24
							local current = var14.current
							
							if current ~= nil and current.onActivityChanged ~= nil then
								current.onActivityChanged(var24)
							end
						end
						if var20.current then
							var20.current.startedAt = os.clock()
						end
						local current = var14.current
						
						if current and current.onRecordingStart then
							current.onRecordingStart(dictationModeModule.Standard, dictationAnalyticsModule.TriggerTypes.UserManual)
						end
						var4(10)
						var6(reactOtterModule.instant(1))
						task.defer(function()
							-- upvalues: var6 (copy), reactOtterModule (copy), t_2 (copy)
							var6(reactOtterModule.ease(0, t_2))
						end)
						dictation:debug("Dictation: started recording")
						
						if var17.current then
							pcall(task.cancel, var17.current)
							var17.current = nil
						end
						var17.current = task.spawn(function()
							-- upvalues: var4 (ref)
							for i = 1, 10 do
								task.wait(1)
								var4(10 - i)
							end
						end)
						var18.current = task.delay(10, function()
							-- upvalues: dictation (copy), var21 (copy), dictationAnalyticsModule (copy)
							dictation:debug("Dictation: max recording time reached, stopping")
							
							if var21.current then
								var21.current(dictationAnalyticsModule.TriggerTypes.TimeUp)
							end
						end)
					end
					
					local function doStartContinuous()
						-- upvalues: var2 (copy), dictation (copy), var14 (copy), dictationModeModule (copy), handleError (copy), t_1 (copy), t (copy), set (copy), var15 (copy), var20 (copy), dictationAnalyticsModule (copy)
						local ok, status = pcall(function()
							-- upvalues: var2 (copy), dictation (copy), var14 (copy), dictationModeModule (copy), handleError (copy), t_1 (copy)
							var2.start({
								onTranscription = function(p5)
									-- upvalues: dictation (copy), var14 (copy), dictationModeModule (copy)
									dictation:debug("Dictation: continuous utterance: {}", p5)
									local current = var14.current
									
									if current ~= nil and current.onTranscription ~= nil then
										current.onTranscription(p5, dictationModeModule.Continuous)
									end
								end,
								onSpeechStarted = function()
									-- upvalues: var14 (copy), dictationModeModule (copy)
									local current = var14.current
									
									if current ~= nil and current.onSpeechStarted ~= nil then
										current.onSpeechStarted(dictationModeModule.Continuous)
									end
								end,
								onError = function(p5)
									-- upvalues: handleError (copy), t_1 (copy)
									handleError(t_1.TranscriptionFailed, p5)
								end
							}, { continuous = true })
						end)
						
						if not ok then
							handleError(t_1.Other, "failed to enter continuous mode: " .. tostring(status))
							
							return
						end
						local listening = t.Listening
						set(listening)
						local var25 = if listening ~= t.Recording then if listening ~= t.Transcribing then listening == t.Listening else true else true
						
						if var25 ~= var15.current then
							var15.current = var25
							local current = var14.current
							
							if current ~= nil and current.onActivityChanged ~= nil then
								current.onActivityChanged(var25)
							end
						end
						if var20.current then
							var20.current.startedAt = os.clock()
						end
						local current = var14.current
						
						if current and current.onRecordingStart then
							current.onRecordingStart(dictationModeModule.Continuous, dictationAnalyticsModule.TriggerTypes.UserManual)
						end
						dictation:debug("Dictation: entered continuous mode")
					end
					
					local function _()
						-- upvalues: var19 (copy), current (ref)
						return var19.current ~= current
					end
					
					requestMicPermission():andThen(function(p5)
						-- upvalues: var19 (copy), current (ref), var14 (copy), p4 (ref), permissionStatus (copy), handleError (copy), t_1 (copy), dictationModeModule (copy), doStartContinuous (ref), doStartStandard (ref)
						if var19.current ~= current then return end
						local current_1 = var14.current
						
						if current_1 ~= nil and current_1.onPermissionResolved ~= nil then
							current_1.onPermissionResolved(p5.status, p4)
						end
						if p5.status == permissionStatus.Denied then
							handleError(t_1.PermissionDenied, if p5.error then "microphone permission denied: " .. p25.error else "microphone permission denied")
							
							return
						elseif p4 == dictationModeModule.Continuous then
							doStartContinuous()
							
							return
						end
						doStartStandard()
					end):catch(function(p5)
						-- upvalues: var19 (copy), current (ref), handleError (copy), t_1 (copy)
						if var19.current ~= current then
							return
						end
						handleError(t_1.PermissionDenied, "mic permission request failed: " .. tostring(p5))
					end)
					
					return
				end
			end, { var2, get }),
			stopDictation = var22,
			cancel = reactModule.useCallback(function()
				-- upvalues: dictation (copy), var19 (ref), var2 (ref), var18 (ref), var17 (ref), var6 (ref), reactOtterModule (copy), t (copy), set (ref), var15 (ref), var14 (ref), dictationAnalyticsModule (copy), var20 (ref)
				dictation:debug("Dictation: cancelled")
				var19.current += 1
				var2.stop()
				
				if var18.current then
					pcall(task.cancel, var18.current)
					var18.current = nil
				end
				if var17.current then
					pcall(task.cancel, var17.current)
					var17.current = nil
				end
				var6(reactOtterModule.instant(0))
				local idle = t.Idle
				set(idle)
				local var24 = if idle ~= t.Recording then if idle ~= t.Transcribing then idle == t.Listening else true else true
				
				if var24 ~= var15.current then
					var15.current = var24
					local current = var14.current
					
					if current ~= nil and current.onActivityChanged ~= nil then
						current.onActivityChanged(var24)
					end
				end
				local userManual = dictationAnalyticsModule.TriggerTypes.UserManual
				local current = var20.current
				local current_1 = var14.current
				
				if current_1 ~= nil and current_1.onRecordingStop ~= nil and (current ~= nil and current.startedAt ~= nil) then
					current_1.onRecordingStop(current.mode, userManual, os.clock() - current.startedAt, nil)
				end
				var20.current = nil
			end, {}),
			audioDeviceInput = var2.audioDeviceInput,
			bindings = reactModule.useMemo(function()
				-- upvalues: var7 (ref), var11 (ref), var8 (ref), var9 (ref), var10 (ref), var12 (ref), var13 (ref), var23 (ref), var5 (ref)
				return {
					isRecording = var7,
					isNotRecording = var11,
					isTranscribing = var8,
					isBusy = var9,
					isIdle = var10,
					isListening = var12,
					isAudioActive = var13,
					countdownText = var23,
					countdownProgress = var5
				}
			end, {
				var23, var5, var13, var9, var10, var12, var11, var7, var8
			})
		}
	end,
	DictationState = t,
	DictationErrorReason = t_1,
	formatTime = formatTime
}
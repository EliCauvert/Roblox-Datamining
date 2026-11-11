local ReactModule = require(script:FindFirstAncestor("ExpChat").Parent.React)
local DictationModeModule = require(script.Parent.DictationMode)
local DictationAnalyticsModule = require(script.Parent.DictationAnalytics)
local _ = require(script.Parent.requestMicPermission)

return function()
	-- upvalues: ReactModule (copy), DictationAnalyticsModule (copy), DictationModeModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	
	return {
		logMicClick = ReactModule.useCallback(function(p1, p2)
			-- upvalues: DictationAnalyticsModule (upval)
			DictationAnalyticsModule.fire(DictationAnalyticsModule.Events.MicClick, {
				[DictationAnalyticsModule.Properties.SttMode] = p1,
				[DictationAnalyticsModule.Properties.EntryPoint] = p2
			})
		end, {}),
		logPermissionResolved = ReactModule.useCallback(function(p1, p2)
			-- upvalues: DictationAnalyticsModule (upval)
			DictationAnalyticsModule.fire(DictationAnalyticsModule.Events.PermissionPrompt, {
				[DictationAnalyticsModule.Properties.SttMode] = p1,
				[DictationAnalyticsModule.Properties.Status] = p2
			})
		end, {}),
		logRecordingStart = ReactModule.useCallback(function(p1, p2)
			-- upvalues: DictationAnalyticsModule (upval)
			DictationAnalyticsModule.fire(DictationAnalyticsModule.Events.RecordingStart, {
				[DictationAnalyticsModule.Properties.SttMode] = p1,
				[DictationAnalyticsModule.Properties.TriggerType] = p2
			})
		end, {}),
		logRecordingStop = ReactModule.useCallback(function(p1, p2, p3, p4)
			-- upvalues: DictationAnalyticsModule (upval)
			DictationAnalyticsModule.fire(DictationAnalyticsModule.Events.RecordingStop, {
				[DictationAnalyticsModule.Properties.SttMode] = p1,
				[DictationAnalyticsModule.Properties.TriggerType] = p2,
				[DictationAnalyticsModule.Properties.DurationSeconds] = p3,
				[DictationAnalyticsModule.Properties.CharCount] = p4
			})
		end, {}),
		logSpeechStarted = ReactModule.useCallback(function()
			-- upvalues: UseRefResult (copy), DictationAnalyticsModule (upval), DictationModeModule (upval)
			UseRefResult.current = os.clock()
			DictationAnalyticsModule.fire(DictationAnalyticsModule.Events.RecordingStart, {
				[DictationAnalyticsModule.Properties.SttMode] = DictationModeModule.Continuous,
				[DictationAnalyticsModule.Properties.TriggerType] = DictationAnalyticsModule.TriggerTypes.AutoChunk
			})
		end, {}),
		logTranscription = ReactModule.useCallback(function(p1, Continuous, p2)
			-- upvalues: DictationModeModule (upval), UseRefResult (copy), DictationAnalyticsModule (upval)
			local CountP10 = #p1
			
			if Continuous == DictationModeModule.Continuous then
				local Current = UseRefResult.current
				DictationAnalyticsModule.fire(DictationAnalyticsModule.Events.RecordingStop, {
					[DictationAnalyticsModule.Properties.SttMode] = DictationModeModule.Continuous,
					[DictationAnalyticsModule.Properties.TriggerType] = DictationAnalyticsModule.TriggerTypes.AutoChunk,
					[DictationAnalyticsModule.Properties.CharCount] = CountP10,
					[DictationAnalyticsModule.Properties.DurationSeconds] = if Current then os.clock() - Current else nil
				})
				UseRefResult.current = nil
			end
			DictationAnalyticsModule.fire(DictationAnalyticsModule.Events.TranscriptionDone, {
				[DictationAnalyticsModule.Properties.SttMode] = Continuous,
				[DictationAnalyticsModule.Properties.Success] = p2,
				[DictationAnalyticsModule.Properties.CharCount] = CountP10
			})
		end, {}),
		logTranscriptionFailed = ReactModule.useCallback(function(p1)
			-- upvalues: DictationAnalyticsModule (upval)
			DictationAnalyticsModule.fire(DictationAnalyticsModule.Events.TranscriptionDone, {
				[DictationAnalyticsModule.Properties.SttMode] = p1,
				[DictationAnalyticsModule.Properties.Success] = false
			})
		end, {})
	}
end
local ExpChat = script:FindFirstAncestor("ExpChat")
local ReactModule = require(ExpChat.Parent.React)
local DictationModeModule = require(script.Parent.DictationMode)
local DictationAnalyticsModule = require(script.Parent.DictationAnalytics)
local _ = require(script.Parent.requestMicPermission)
local FFlagExpChatDictationGrafanaMetricsModule = require(ExpChat.Flags.FFlagExpChatDictationGrafanaMetrics)

return function()
	-- upvalues: ReactModule (copy), DictationAnalyticsModule (copy), FFlagExpChatDictationGrafanaMetricsModule (copy), DictationModeModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	
	return {
		logMicClick = ReactModule.useCallback(function(p1, p2)
			-- upvalues: DictationAnalyticsModule (upval), FFlagExpChatDictationGrafanaMetricsModule (upval)
			DictationAnalyticsModule.fire(DictationAnalyticsModule.Events.MicClick, {
				[DictationAnalyticsModule.Properties.SttMode] = p1,
				[DictationAnalyticsModule.Properties.EntryPoint] = p2
			})
			
			if FFlagExpChatDictationGrafanaMetricsModule then
				DictationAnalyticsModule.reportStartedCounter(p1, p2)
			end
		end, {}),
		logPermissionResolved = ReactModule.useCallback(function(p1, p2)
			-- upvalues: DictationAnalyticsModule (upval), FFlagExpChatDictationGrafanaMetricsModule (upval)
			DictationAnalyticsModule.fire(DictationAnalyticsModule.Events.PermissionPrompt, {
				[DictationAnalyticsModule.Properties.SttMode] = p1,
				[DictationAnalyticsModule.Properties.Status] = p2
			})
			
			if FFlagExpChatDictationGrafanaMetricsModule then
				DictationAnalyticsModule.reportPermissionCounter(p1, p2)
			end
		end, {}),
		logRecordingStart = ReactModule.useCallback(function(p1, p2)
			-- upvalues: DictationAnalyticsModule (upval)
			DictationAnalyticsModule.fire(DictationAnalyticsModule.Events.RecordingStart, {
				[DictationAnalyticsModule.Properties.SttMode] = p1,
				[DictationAnalyticsModule.Properties.TriggerType] = p2
			})
		end, {}),
		logRecordingStop = ReactModule.useCallback(function(p1, AutoChunk, p2, p3)
			-- upvalues: DictationAnalyticsModule (upval), FFlagExpChatDictationGrafanaMetricsModule (upval)
			DictationAnalyticsModule.fire(DictationAnalyticsModule.Events.RecordingStop, {
				[DictationAnalyticsModule.Properties.SttMode] = p1,
				[DictationAnalyticsModule.Properties.TriggerType] = AutoChunk,
				[DictationAnalyticsModule.Properties.DurationSeconds] = p2,
				[DictationAnalyticsModule.Properties.CharCount] = p3
			})
			
			if FFlagExpChatDictationGrafanaMetricsModule and AutoChunk ~= DictationAnalyticsModule.TriggerTypes.AutoChunk then
				DictationAnalyticsModule.reportEndedCounter(p1, AutoChunk)
			end
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
			-- upvalues: DictationModeModule (upval), UseRefResult (copy), DictationAnalyticsModule (upval), FFlagExpChatDictationGrafanaMetricsModule (upval)
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
			
			if FFlagExpChatDictationGrafanaMetricsModule then
				DictationAnalyticsModule.reportTranscriptionCounter(Continuous, p2)
			end
		end, {}),
		logTranscriptionFailed = ReactModule.useCallback(function(p1)
			-- upvalues: DictationAnalyticsModule (upval), FFlagExpChatDictationGrafanaMetricsModule (upval)
			DictationAnalyticsModule.fire(DictationAnalyticsModule.Events.TranscriptionDone, {
				[DictationAnalyticsModule.Properties.SttMode] = p1,
				[DictationAnalyticsModule.Properties.Success] = false
			})
			
			if FFlagExpChatDictationGrafanaMetricsModule then
				DictationAnalyticsModule.reportTranscriptionCounter(p1, false)
			end
		end, {}),
		logMicToastShown = ReactModule.useCallback(function(p1, p2)
			-- upvalues: DictationAnalyticsModule (upval)
			DictationAnalyticsModule.fire(DictationAnalyticsModule.Events.MicToastShown, {
				[DictationAnalyticsModule.Properties.SttMode] = p1,
				[DictationAnalyticsModule.Properties.CanDeepLink] = p2
			})
		end, {}),
		logMicToastActivated = ReactModule.useCallback(function(p1, p2)
			-- upvalues: DictationAnalyticsModule (upval)
			DictationAnalyticsModule.fire(DictationAnalyticsModule.Events.MicToastActivated, {
				[DictationAnalyticsModule.Properties.SttMode] = p1,
				[DictationAnalyticsModule.Properties.CanDeepLink] = p2
			})
		end, {}),
		logMicToastDismissed = ReactModule.useCallback(function(p1, p2)
			-- upvalues: DictationAnalyticsModule (upval)
			DictationAnalyticsModule.fire(DictationAnalyticsModule.Events.MicToastDismiss, {
				[DictationAnalyticsModule.Properties.SttMode] = p1,
				[DictationAnalyticsModule.Properties.DismissReason] = p2
			})
		end, {})
	}
end
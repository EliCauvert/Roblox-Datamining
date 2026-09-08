local reactModule = require(script:FindFirstAncestor("ExpChat").Parent.React)
local dictationModeModule = require(script.Parent.DictationMode)
local dictationAnalyticsModule = require(script.Parent.DictationAnalytics)
local _ = require(script.Parent.requestMicPermission)

return function()
	-- upvalues: reactModule (ref), dictationAnalyticsModule (ref), dictationModeModule (ref)
	local var1 = reactModule.useRef(nil)
	
	return {
		logMicClick = reactModule.useCallback(function(p1, p2)
			-- upvalues: dictationAnalyticsModule (copy)
			dictationAnalyticsModule.fire(dictationAnalyticsModule.Events.MicClick, {
				[dictationAnalyticsModule.Properties.SttMode] = p1,
				[dictationAnalyticsModule.Properties.EntryPoint] = p2
			})
		end, {}),
		logPermissionResolved = reactModule.useCallback(function(p1, p2)
			-- upvalues: dictationAnalyticsModule (copy)
			dictationAnalyticsModule.fire(dictationAnalyticsModule.Events.PermissionPrompt, {
				[dictationAnalyticsModule.Properties.SttMode] = p1,
				[dictationAnalyticsModule.Properties.Status] = p2
			})
		end, {}),
		logRecordingStart = reactModule.useCallback(function(p1, p2)
			-- upvalues: dictationAnalyticsModule (copy)
			dictationAnalyticsModule.fire(dictationAnalyticsModule.Events.RecordingStart, {
				[dictationAnalyticsModule.Properties.SttMode] = p1,
				[dictationAnalyticsModule.Properties.TriggerType] = p2
			})
		end, {}),
		logRecordingStop = reactModule.useCallback(function(p1, p2, p3, p4)
			-- upvalues: dictationAnalyticsModule (copy)
			dictationAnalyticsModule.fire(dictationAnalyticsModule.Events.RecordingStop, {
				[dictationAnalyticsModule.Properties.SttMode] = p1,
				[dictationAnalyticsModule.Properties.TriggerType] = p2,
				[dictationAnalyticsModule.Properties.DurationSeconds] = p3,
				[dictationAnalyticsModule.Properties.CharCount] = p4
			})
		end, {}),
		logSpeechStarted = reactModule.useCallback(function()
			-- upvalues: var1 (ref), dictationAnalyticsModule (copy), dictationModeModule (copy)
			var1.current = os.clock()
			dictationAnalyticsModule.fire(dictationAnalyticsModule.Events.RecordingStart, {
				[dictationAnalyticsModule.Properties.SttMode] = dictationModeModule.Continuous,
				[dictationAnalyticsModule.Properties.TriggerType] = dictationAnalyticsModule.TriggerTypes.AutoChunk
			})
		end, {}),
		logTranscription = reactModule.useCallback(function(p1, p2, p3)
			-- upvalues: dictationModeModule (copy), var1 (ref), dictationAnalyticsModule (copy)
			local p10Count = #p1
			
			if p2 == dictationModeModule.Continuous then
				local current = var1.current
				dictationAnalyticsModule.fire(dictationAnalyticsModule.Events.RecordingStop, {
					[dictationAnalyticsModule.Properties.SttMode] = dictationModeModule.Continuous,
					[dictationAnalyticsModule.Properties.TriggerType] = dictationAnalyticsModule.TriggerTypes.AutoChunk,
					[dictationAnalyticsModule.Properties.CharCount] = p10Count,
					[dictationAnalyticsModule.Properties.DurationSeconds] = if current then os.clock() - current else nil
				})
				var1.current = nil
			end
			dictationAnalyticsModule.fire(dictationAnalyticsModule.Events.TranscriptionDone, {
				[dictationAnalyticsModule.Properties.SttMode] = p2,
				[dictationAnalyticsModule.Properties.Success] = p3,
				[dictationAnalyticsModule.Properties.CharCount] = p10Count
			})
		end, {}),
		logTranscriptionFailed = reactModule.useCallback(function(p1)
			-- upvalues: dictationAnalyticsModule (copy)
			dictationAnalyticsModule.fire(dictationAnalyticsModule.Events.TranscriptionDone, {
				[dictationAnalyticsModule.Properties.SttMode] = p1,
				[dictationAnalyticsModule.Properties.Success] = false
			})
		end, {}),
		logMicToastShown = reactModule.useCallback(function(p1, p2)
			-- upvalues: dictationAnalyticsModule (copy)
			dictationAnalyticsModule.fire(dictationAnalyticsModule.Events.MicToastShown, {
				[dictationAnalyticsModule.Properties.SttMode] = p1,
				[dictationAnalyticsModule.Properties.CanDeepLink] = p2
			})
		end, {}),
		logMicToastActivated = reactModule.useCallback(function(p1, p2)
			-- upvalues: dictationAnalyticsModule (copy)
			dictationAnalyticsModule.fire(dictationAnalyticsModule.Events.MicToastActivated, {
				[dictationAnalyticsModule.Properties.SttMode] = p1,
				[dictationAnalyticsModule.Properties.CanDeepLink] = p2
			})
		end, {}),
		logMicToastDismissed = reactModule.useCallback(function(p1, p2)
			-- upvalues: dictationAnalyticsModule (copy)
			dictationAnalyticsModule.fire(dictationAnalyticsModule.Events.MicToastDismiss, {
				[dictationAnalyticsModule.Properties.SttMode] = p1,
				[dictationAnalyticsModule.Properties.DismissReason] = p2
			})
		end, {})
	}
end
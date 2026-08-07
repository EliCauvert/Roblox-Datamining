local reactModule = require(script:FindFirstAncestor("ExpChat").Parent.React)
local dictationModeModule = require(script.Parent.DictationMode)
local dictationAnalyticsModule = require(script.Parent.DictationAnalytics)
local _ = require(script.Parent.requestMicPermission)

return function() --[[ line: 28 | named "useDictationTelemetry" ]]
	-- upvalues: reactModule (ref), dictationAnalyticsModule (ref), dictationModeModule (ref)
	local var3 = reactModule.useRef(nil)
	
	return {
		logMicClick = reactModule.useCallback(function(p0, p1) --[[ line: 31 ]]
			-- upvalues: dictationAnalyticsModule (copy)
			dictationAnalyticsModule.fire(dictationAnalyticsModule.Events.MicClick, {
				[dictationAnalyticsModule.Properties.SttMode] = p0,
				[dictationAnalyticsModule.Properties.EntryPoint] = p1
			})
		end, {}),
		logPermissionResolved = reactModule.useCallback(function(p2, p3) --[[ line: 38 ]]
			-- upvalues: dictationAnalyticsModule (copy)
			dictationAnalyticsModule.fire(dictationAnalyticsModule.Events.PermissionPrompt, {
				[dictationAnalyticsModule.Properties.SttMode] = p2,
				[dictationAnalyticsModule.Properties.Status] = p3
			})
		end, {}),
		logRecordingStart = reactModule.useCallback(function(p4, p5) --[[ line: 45 ]]
			-- upvalues: dictationAnalyticsModule (copy)
			dictationAnalyticsModule.fire(dictationAnalyticsModule.Events.RecordingStart, {
				[dictationAnalyticsModule.Properties.SttMode] = p4,
				[dictationAnalyticsModule.Properties.TriggerType] = p5
			})
		end, {}),
		logRecordingStop = reactModule.useCallback(function(p6, p7, p8, p9) --[[ line: 53 ]]
			-- upvalues: dictationAnalyticsModule (copy)
			dictationAnalyticsModule.fire(dictationAnalyticsModule.Events.RecordingStop, {
				[dictationAnalyticsModule.Properties.SttMode] = p6,
				[dictationAnalyticsModule.Properties.TriggerType] = p7,
				[dictationAnalyticsModule.Properties.DurationSeconds] = p8,
				[dictationAnalyticsModule.Properties.CharCount] = p9
			})
		end, {}),
		logSpeechStarted = reactModule.useCallback(function() --[[ line: 69 ]]
			-- upvalues: var3 (ref), dictationAnalyticsModule (copy), dictationModeModule (copy)
			var3.current = os.clock()
			dictationAnalyticsModule.fire(dictationAnalyticsModule.Events.RecordingStart, {
				[dictationAnalyticsModule.Properties.SttMode] = dictationModeModule.Continuous,
				[dictationAnalyticsModule.Properties.TriggerType] = dictationAnalyticsModule.TriggerTypes.AutoChunk
			})
		end, {}),
		logTranscription = reactModule.useCallback(function(p10, p11, p12) --[[ line: 77 ]]
			-- upvalues: dictationModeModule (copy), var3 (ref), dictationAnalyticsModule (copy)
			local p10Count = #p10
			
			if p11 == dictationModeModule.Continuous then
				local current = var3.current
				dictationAnalyticsModule.fire(dictationAnalyticsModule.Events.RecordingStop, {
					[dictationAnalyticsModule.Properties.SttMode] = dictationModeModule.Continuous,
					[dictationAnalyticsModule.Properties.TriggerType] = dictationAnalyticsModule.TriggerTypes.AutoChunk,
					[dictationAnalyticsModule.Properties.CharCount] = p10Count,
					[dictationAnalyticsModule.Properties.DurationSeconds] = if current then os.clock() - current else nil
				})
				var3.current = nil
			end
			dictationAnalyticsModule.fire(dictationAnalyticsModule.Events.TranscriptionDone, {
				[dictationAnalyticsModule.Properties.SttMode] = p11,
				[dictationAnalyticsModule.Properties.Success] = p12,
				[dictationAnalyticsModule.Properties.CharCount] = p10Count
			})
		end, {}),
		logTranscriptionFailed = reactModule.useCallback(function(p13) --[[ line: 98 ]]
			-- upvalues: dictationAnalyticsModule (copy)
			dictationAnalyticsModule.fire(dictationAnalyticsModule.Events.TranscriptionDone, {
				[dictationAnalyticsModule.Properties.SttMode] = p13,
				[dictationAnalyticsModule.Properties.Success] = false
			})
		end, {})
	}
end
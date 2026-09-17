local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local telemetryService = game:GetService("TelemetryService")
local analytics = require(script:FindFirstAncestor("ExpChat").Parent.ExpChatShared).Analytics
local rbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local t = {
	MicClick = "dictation_mic_click",
	PermissionPrompt = "dictation_permission_prompt",
	RecordingStart = "dictation_recording_start",
	RecordingStop = "dictation_recording_stop",
	VadStop = "dictation_vad_stop",
	TranscriptionDone = "transcription_done",
	TextEdit = "text_edit",
	MessageSent = "dictation_message_sent",
	FtuxShown = "dictation_ftux_shown",
	FtuxDismiss = "dictation_ftux_dismiss",
	MicToastShown = "dictation_mic_toast_shown",
	MicToastActivated = "dictation_mic_toast_activated",
	MicToastDismiss = "dictation_mic_toast_dismiss"
}
local t_1 = {
	SttMode = "stt_mode",
	SttOutcome = "stt_outcome",
	EntryPoint = "entry_point",
	TriggerType = "trigger_type",
	Status = "status",
	Timestamp = "client_timestamp",
	PlaySessionId = "play_session_id",
	Success = "success",
	ErrorReason = "error_reason",
	LatencyMs = "latency_ms",
	CharCount = "char_count",
	FinalCharCount = "final_char_count",
	DurationSeconds = "duration_seconds",
	EditType = "edit_type",
	WasEdited = "was_edited",
	EditDistance = "edit_distance",
	TextStt = "text_stt",
	TextSent = "text_sent",
	TextSttTruncated = "text_stt_truncated",
	TextSentTruncated = "text_sent_truncated",
	DismissReason = "dismiss_reason",
	CanDeepLink = "can_deep_link"
}
local t_2 = { Standard = "standard", Continuous = "continuous" }
local t_3 = { Tap = "tap", LongPress = "long_press" }
local t_4 = {
	UserManual = "user_manual",
	TimeUp = "time_up",
	AutoPause = "auto_pause",
	AutoChunk = "auto_chunk"
}
local t_5 = {
	Granted = "granted",
	Denied = "denied",
	AlreadyAllowed = "already_allowed"
}
local t_6 = {
	Addition = "addition",
	Deletion = "deletion",
	FullClear = "full_clear",
	Mixed = "mixed"
}
local t_7 = { Full = "stt_full", Partial = "stt_partial" }
local t_8 = {
	Visibility = "visibility",
	UserInteraction = "user_interaction"
}

local function _()
	-- upvalues: rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), rbxAnalyticsService (ref)
	return if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then rbxAnalyticsService:GetPlaySessionId() else ""
end

local function fire(p1, p2)
	-- upvalues: t_1 (ref), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), rbxAnalyticsService (ref), analytics (ref)
	local var1 = if p2 then table.clone(p2) else {}
	var1[t_1.PlaySessionId] = if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then rbxAnalyticsService:GetPlaySessionId() else ""
	
	if var1[t_1.Timestamp] == nil then
		var1[t_1.Timestamp] = os.clock()
	end
	analytics.FireClientAnalyticsWithEventName(p1, var1)
end

local t_9 = {
	Started = {
		eventName = "ExpChatDictationStarted",
		description = "A user initiated a dictation session from the chat input mic. customFields: mode (standard/continuous), entry_point (tap/long_press).",
		links = "",
		backends = { "RobloxTelemetryCounter" },
		lastUpdated = { 2026, 9, 9 }
	},
	Ended = {
		eventName = "ExpChatDictationEnded",
		description = "A dictation recording session ended. Session-level only; continuous auto-chunk stops are excluded. customFields: mode, reason (user_manual/time_up/auto_pause).",
		links = "",
		backends = { "RobloxTelemetryCounter" },
		lastUpdated = { 2026, 9, 9 }
	},
	VadStop = {
		eventName = "ExpChatDictationVadStop",
		description = "A standard-mode dictation recording ended early because the engine VAD finalized the utterance (end-of-speech detected) rather than the user tapping stop or the timer running out. customFields: mode.",
		links = "",
		backends = { "RobloxTelemetryCounter" },
		lastUpdated = { 2026, 9, 10 }
	},
	Permission = {
		eventName = "ExpChatDictationPermission",
		description = "Microphone permission resolved for a dictation attempt. customFields: mode, result (granted/denied/already_allowed).",
		links = "",
		backends = { "RobloxTelemetryCounter" },
		lastUpdated = { 2026, 9, 9 }
	},
	Transcription = {
		eventName = "ExpChatDictationTranscription",
		description = "A speech-to-text transcription completed for a dictation utterance. customFields: mode, result (success/failure).",
		links = "",
		backends = { "RobloxTelemetryCounter" },
		lastUpdated = { 2026, 9, 9 }
	},
	MessageSent = {
		eventName = "ExpChatDictationMessageSent",
		description = "A chat message produced via dictation was sent. customFields: mode.",
		links = "",
		backends = { "RobloxTelemetryCounter" },
		lastUpdated = { 2026, 9, 9 }
	}
}
local var1 = telemetryService

local _ = function(p1, p2)
	-- upvalues: var1 (write)
	if var1 then
		var1:LogCounter(p1, { customFields = p2 }, 1)
	end
end

return {
	Events = t,
	Properties = t_1,
	Modes = t_2,
	EntryPoints = t_3,
	TriggerTypes = t_4,
	PermissionStatuses = t_5,
	EditTypes = t_6,
	Outcomes = t_7,
	DismissReasons = t_8,
	Counters = t_9,
	fire = fire,
	withTelemetryService = function(p1)
		-- upvalues: var1 (write), telemetryService (ref)
		var1 = p1 or telemetryService
	end,
	reportStartedCounter = function(p1, p2)
		-- upvalues: t_9 (ref), var1 (write)
		local started = t_9.Started
		local t = { mode = p1, entry_point = p2 }
		
		if var1 then
			var1:LogCounter(started, { customFields = t }, 1)
		end
	end,
	reportEndedCounter = function(p1, p2)
		-- upvalues: t_9 (ref), var1 (write)
		local ended = t_9.Ended
		local t = { mode = p1, reason = p2 }
		
		if var1 then
			var1:LogCounter(ended, { customFields = t }, 1)
		end
	end,
	reportVadStopCounter = function(p1)
		-- upvalues: t_9 (ref), var1 (write)
		local vadStop = t_9.VadStop
		local t = { mode = p1 }
		
		if var1 then
			var1:LogCounter(vadStop, { customFields = t }, 1)
		end
	end,
	reportPermissionCounter = function(p1, p2)
		-- upvalues: t_9 (ref), var1 (write)
		local permission = t_9.Permission
		local t = { mode = p1, result = p2 }
		
		if var1 then
			var1:LogCounter(permission, { customFields = t }, 1)
		end
	end,
	reportTranscriptionCounter = function(p1, p2)
		-- upvalues: t_9 (ref), var1 (write)
		local transcription = t_9.Transcription
		local t = {
			mode = p1 or "unknown",
			result = if p2 then "success" else "failure"
		}
		
		if var1 then
			var1:LogCounter(transcription, { customFields = t }, 1)
		end
	end,
	reportMessageSentCounter = function(p1)
		-- upvalues: t_9 (ref), var1 (write)
		local messageSent = t_9.MessageSent
		local t = { mode = p1 }
		
		if var1 then
			var1:LogCounter(messageSent, { customFields = t }, 1)
		end
	end
}
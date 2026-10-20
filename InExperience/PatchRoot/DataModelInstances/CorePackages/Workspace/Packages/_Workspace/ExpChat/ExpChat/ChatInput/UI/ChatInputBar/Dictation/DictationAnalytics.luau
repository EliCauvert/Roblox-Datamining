local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local TelemetryService = game:GetService("TelemetryService")
local Analytics = require(script:FindFirstAncestor("ExpChat").Parent.ExpChatShared).Analytics
local RbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local Properties = {
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

local function _()
	-- upvalues: RbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), RbxAnalyticsService (copy)
	return if RbxAnalyticsServiceExposePlaySessionIdEngineFeature then RbxAnalyticsService:GetPlaySessionId() else ""
end

local Counters = {
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
	SafetyReminder = {
		eventName = "ExpChatDictationSafetyReminder",
		description = "A continuous-dictation message came back fully text-filtered and the once-per-session \"use kind words\" reminder was requested.",
		links = "",
		backends = { "RobloxTelemetryCounter" },
		lastUpdated = { 2026, 9, 30 }
	},
	MessageSent = {
		eventName = "ExpChatDictationMessageSent",
		description = "A chat message produced via dictation was sent. customFields: mode.",
		links = "",
		backends = { "RobloxTelemetryCounter" },
		lastUpdated = { 2026, 9, 9 }
	}
}
local TelemetryService1 = TelemetryService

local _ = function(Config, CustomFields)
	-- upvalues: TelemetryService1 (ref)
	if TelemetryService1 then
		TelemetryService1:LogCounter(Config, { customFields = CustomFields }, 1)
	end
end

return {
	Events = {
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
		MicToastDismiss = "dictation_mic_toast_dismiss",
		SafetyReminderTriggered = "dictation_safety_reminder_triggered"
	},
	Properties = Properties,
	Modes = { Standard = "standard", Continuous = "continuous" },
	EntryPoints = { Tap = "tap", LongPress = "long_press" },
	TriggerTypes = {
		UserManual = "user_manual",
		TimeUp = "time_up",
		AutoPause = "auto_pause",
		AutoChunk = "auto_chunk",
		SafetyIntervention = "safety_intervention"
	},
	PermissionStatuses = {
		Granted = "granted",
		Denied = "denied",
		AlreadyAllowed = "already_allowed"
	},
	EditTypes = {
		Addition = "addition",
		Deletion = "deletion",
		FullClear = "full_clear",
		Mixed = "mixed"
	},
	Outcomes = { Full = "stt_full", Partial = "stt_partial" },
	DismissReasons = {
		Visibility = "visibility",
		UserInteraction = "user_interaction"
	},
	Counters = Counters,
	fire = function(p1, Tbl)
		-- upvalues: Properties (copy), RbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), RbxAnalyticsService (copy), Analytics (copy)
		local Copy = if Tbl then table.clone(Tbl) else {}
		Copy[Properties.PlaySessionId] = if RbxAnalyticsServiceExposePlaySessionIdEngineFeature then RbxAnalyticsService:GetPlaySessionId() else ""
		
		if Copy[Properties.Timestamp] == nil then
			Copy[Properties.Timestamp] = os.clock()
		end
		Analytics.FireClientAnalyticsWithEventName(p1, Copy)
	end,
	withTelemetryService = function(p1)
		-- upvalues: TelemetryService1 (ref), TelemetryService (copy)
		TelemetryService1 = p1 or TelemetryService
	end,
	reportStartedCounter = function(Mode, Entry_point)
		-- upvalues: Counters (copy), TelemetryService1 (ref)
		local Started = Counters.Started
		local CustomFields = { mode = Mode, entry_point = Entry_point }
		
		if TelemetryService1 then
			TelemetryService1:LogCounter(Started, { customFields = CustomFields }, 1)
		end
	end,
	reportEndedCounter = function(Mode, Reason)
		-- upvalues: Counters (copy), TelemetryService1 (ref)
		local Ended = Counters.Ended
		local CustomFields = { mode = Mode, reason = Reason }
		
		if TelemetryService1 then
			TelemetryService1:LogCounter(Ended, { customFields = CustomFields }, 1)
		end
	end,
	reportVadStopCounter = function(Mode)
		-- upvalues: Counters (copy), TelemetryService1 (ref)
		local VadStop = Counters.VadStop
		local CustomFields = { mode = Mode }
		
		if TelemetryService1 then
			TelemetryService1:LogCounter(VadStop, { customFields = CustomFields }, 1)
		end
	end,
	reportPermissionCounter = function(Mode, Result)
		-- upvalues: Counters (copy), TelemetryService1 (ref)
		local Permission = Counters.Permission
		local CustomFields = { mode = Mode, result = Result }
		
		if TelemetryService1 then
			TelemetryService1:LogCounter(Permission, { customFields = CustomFields }, 1)
		end
	end,
	reportTranscriptionCounter = function(p1, p2)
		-- upvalues: Counters (copy), TelemetryService1 (ref)
		local Transcription = Counters.Transcription
		local CustomFields = {
			mode = p1 or "unknown",
			result = if p2 then "success" else "failure"
		}
		
		if TelemetryService1 then
			TelemetryService1:LogCounter(Transcription, { customFields = CustomFields }, 1)
		end
	end,
	reportMessageSentCounter = function(Mode)
		-- upvalues: Counters (copy), TelemetryService1 (ref)
		local MessageSent = Counters.MessageSent
		local CustomFields = { mode = Mode }
		
		if TelemetryService1 then
			TelemetryService1:LogCounter(MessageSent, { customFields = CustomFields }, 1)
		end
	end,
	reportSafetyReminderCounter = function()
		-- upvalues: Counters (copy), TelemetryService1 (ref)
		local SafetyReminder = Counters.SafetyReminder
		local CustomFields = {}
		
		if TelemetryService1 then
			TelemetryService1:LogCounter(SafetyReminder, { customFields = CustomFields }, 1)
		end
	end
}
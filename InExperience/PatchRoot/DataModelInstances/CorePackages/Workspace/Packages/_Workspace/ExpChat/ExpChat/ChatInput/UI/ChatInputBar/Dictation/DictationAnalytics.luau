local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local analytics = require(script:FindFirstAncestor("ExpChat").Parent.ExpChatShared).Analytics
local rbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local t = {
	MicClick = "dictation_mic_click",
	PermissionPrompt = "dictation_permission_prompt",
	RecordingStart = "dictation_recording_start",
	RecordingStop = "dictation_recording_stop",
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

local function _()
	-- upvalues: rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), rbxAnalyticsService (ref)
	return if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then rbxAnalyticsService:GetPlaySessionId() else ""
end

return {
	Events = t,
	Properties = t_1,
	Modes = { Standard = "standard", Continuous = "continuous" },
	EntryPoints = { Tap = "tap", LongPress = "long_press" },
	TriggerTypes = {
		UserManual = "user_manual",
		TimeUp = "time_up",
		AutoPause = "auto_pause",
		AutoChunk = "auto_chunk"
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
	fire = function(p1, p2)
		-- upvalues: t_1 (ref), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), rbxAnalyticsService (ref), analytics (ref)
		local var1 = if p2 then table.clone(p2) else {}
		var1[t_1.PlaySessionId] = if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then rbxAnalyticsService:GetPlaySessionId() else ""
		
		if var1[t_1.Timestamp] == nil then
			var1[t_1.Timestamp] = os.clock()
		end
		analytics.FireClientAnalyticsWithEventName(p1, var1)
	end
}
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
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
	DismissReason = "dismiss_reason"
}

local function _()
	-- upvalues: RbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), RbxAnalyticsService (copy)
	return if RbxAnalyticsServiceExposePlaySessionIdEngineFeature then RbxAnalyticsService:GetPlaySessionId() else ""
end

return {
	Events = {
		MicClick = "dictation_mic_click",
		PermissionPrompt = "dictation_permission_prompt",
		RecordingStart = "dictation_recording_start",
		RecordingStop = "dictation_recording_stop",
		TranscriptionDone = "transcription_done",
		TextEdit = "text_edit",
		MessageSent = "dictation_message_sent",
		FtuxShown = "dictation_ftux_shown",
		FtuxDismiss = "dictation_ftux_dismiss"
	},
	Properties = Properties,
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
	fire = function(p1, Tbl)
		-- upvalues: Properties (copy), RbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), RbxAnalyticsService (copy), Analytics (copy)
		local Copy = if Tbl then table.clone(Tbl) else {}
		Copy[Properties.PlaySessionId] = if RbxAnalyticsServiceExposePlaySessionIdEngineFeature then RbxAnalyticsService:GetPlaySessionId() else ""
		
		if Copy[Properties.Timestamp] == nil then
			Copy[Properties.Timestamp] = os.clock()
		end
		Analytics.FireClientAnalyticsWithEventName(p1, Copy)
	end
}
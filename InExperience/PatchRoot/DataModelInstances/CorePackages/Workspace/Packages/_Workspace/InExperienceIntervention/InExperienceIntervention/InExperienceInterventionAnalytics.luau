local LocalPlayer = game:GetService("Players").LocalPlayer
local Parent = script:FindFirstAncestor("InExperienceIntervention").Parent
local CryoModule = require(Parent.Cryo)
local NewResult = require(Parent.Analytics).AnalyticsReporters.EventIngest.new((game:GetService("EventIngestService")))
local Constants = {
	EventContext = "InExperienceInterventionEvent",
	EventName = "InExperienceInterventionEvent",
	InterventionTypes = {
		Nudge = "INTERVENTION_CHAT_NUDGE",
		Timeout = "INTERVENTION_CHAT_TIMEOUT",
		PartyChatNudge = "INTERVENTION_PARTY_CHAT_NUDGE",
		PartyChatTimeout = "INTERVENTION_PARTY_CHAT_TIMEOUT",
		DictationSafetyReminder = "INTERVENTION_DICTATION_SAFETY_REMINDER"
	},
	EventTypes = {
		AppealClicked = "EVENT_APPEAL_CLICKED",
		CtaClicked = "EVENT_CTA_CLICKED",
		ModalAppeared = "EVENT_MODAL_APPEARED",
		ModalMessageReceived = "EVENT_MODAL_MESSAGE_RECEIVED",
		ToastMessageReceived = "EVENT_TOAST_MESSAGE_RECEIVED",
		NudgeToastAppeared = "EVENT_NUDGE_TOAST_APPEARED",
		NudgeToastDismissed = "EVENT_NUDGE_TOAST_DISMISSED",
		ChatAttemptToastAppeared = "EVENT_CHAT_ATTEMPT_TOAST_APPEARED",
		ChatAttemptToastDismissed = "EVENT_CHAT_ATTEMPT_TOAST_DISMISSED",
		DictationSafetyReminderToastAppeared = "EVENT_DICTATION_SAFETY_REMINDER_TOAST_APPEARED",
		DictationSafetyReminderToastDismissed = "EVENT_DICTATION_SAFETY_REMINDER_TOAST_DISMISSED",
		GetModerationDetailFailed = "EVENT_GET_MODERATION_DETAIL_FAILED"
	}
}
local UserId = if LocalPlayer then LocalPlayer.UserId else 0

local function v6(Event_type, Intervention_type, p1, Event_id, Evidence, Timeout_duration_seconds, p2, Acknowledgeable) --[[ Line: 46 ]]
	-- upvalues: UserId (ref), Constants (copy), CryoModule (copy)
	local UnixTimestampMillis = DateTime.now().UnixTimestampMillis
	local JoinResult = {
		user_id = UserId,
		timestamp_milliseconds = UnixTimestampMillis,
		event_type = Event_type,
		intervention_type = Intervention_type,
		event_id = Event_id,
		evidence = Evidence,
		timeout_duration_seconds = Timeout_duration_seconds,
		acknowledgeable = Acknowledgeable
	}
	
	if Event_type == Constants.EventTypes.CtaClicked or Event_type == Constants.EventTypes.AppealClicked or Event_type == Constants.EventTypes.NudgeToastDismissed or Event_type == Constants.EventTypes.ChatAttemptToastDismissed or Event_type == Constants.EventTypes.DictationSafetyReminderToastDismissed then
		JoinResult = CryoModule.Dictionary.join({
			time_to_interact_seconds = (UnixTimestampMillis - p1) / 1000
		}, JoinResult)
	end
	if Event_type == Constants.EventTypes.GetModerationDetailFailed then
		JoinResult = CryoModule.Dictionary.join({ error = p2 }, JoinResult)
	end
	return JoinResult
end

return {
	sendAnalyticsEvent = function(Event_type, Intervention_type, p1, Event_id, Evidence, Timeout_duration_seconds, p2, Acknowledgeable) --[[ Line: 89 ]]
		-- upvalues: NewResult (copy), Constants (copy), v6 (copy)
		NewResult:sendEventDeferred(Constants.EventContext, Constants.EventName, (v6(Event_type, Intervention_type, p1, Event_id, Evidence, Timeout_duration_seconds, p2, Acknowledgeable)))
	end,
	Constants = Constants
}
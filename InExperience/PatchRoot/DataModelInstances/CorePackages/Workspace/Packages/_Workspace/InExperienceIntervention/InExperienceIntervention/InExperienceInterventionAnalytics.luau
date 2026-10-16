local localPlayer = game:GetService("Players").LocalPlayer
local parent = script:FindFirstAncestor("InExperienceIntervention").Parent
local cryoModule = require(parent.Cryo)
local var1 = require(parent.Analytics).AnalyticsReporters.EventIngest.new(game:GetService("EventIngestService"))
local t = {
	EventContext = "InExperienceInterventionEvent",
	EventName = "InExperienceInterventionEvent",
	InterventionTypes = {
		Nudge = "INTERVENTION_CHAT_NUDGE",
		Timeout = "INTERVENTION_CHAT_TIMEOUT",
		PartyChatNudge = "INTERVENTION_PARTY_CHAT_NUDGE",
		PartyChatTimeout = "INTERVENTION_PARTY_CHAT_TIMEOUT"
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
		GetModerationDetailFailed = "EVENT_GET_MODERATION_DETAIL_FAILED"
	}
}
local var2 = if localPlayer then localPlayer.UserId else 0

local var3 = function(p1, p2, p3, p4, p5, p6, p7, p8)
	-- upvalues: var2 (write), t (ref), cryoModule (ref)
	local unixTimestampMillis = DateTime.now().UnixTimestampMillis
	local t_1 = {
		user_id = var2,
		timestamp_milliseconds = unixTimestampMillis,
		event_type = p1,
		intervention_type = p2,
		event_id = p4,
		evidence = p5,
		timeout_duration_seconds = p6,
		acknowledgeable = p8
	}
	
	if p1 == t.EventTypes.CtaClicked or p1 == t.EventTypes.AppealClicked or (p1 == t.EventTypes.NudgeToastDismissed or p1 == t.EventTypes.ChatAttemptToastDismissed) then
		t_1 = cryoModule.Dictionary.join({
			time_to_interact_seconds = (unixTimestampMillis - p3) / 1000
		}, t_1)
	end
	if p1 == t.EventTypes.GetModerationDetailFailed then
		t_1 = cryoModule.Dictionary.join({ error = p7 }, t_1)
	end
	return t_1
end

return {
	sendAnalyticsEvent = function(p1, p2, p3, p4, p5, p6, p7, p8)
		-- upvalues: var1 (ref), t (ref), var3 (ref)
		var1:sendEventDeferred(t.EventContext, t.EventName, var3(p1, p2, p3, p4, p5, p6, p7, p8))
	end,
	Constants = t
}
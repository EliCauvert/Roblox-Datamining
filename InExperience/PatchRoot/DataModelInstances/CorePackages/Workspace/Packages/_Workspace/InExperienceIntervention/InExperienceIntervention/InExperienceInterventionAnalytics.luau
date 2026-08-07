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
local var3 = if localPlayer then localPlayer.UserId else 0

local var4 = function(p0, p1, p2, p3, p4, p5, p6, p7) --[[ line: 43 ]]
	-- upvalues: var3 (write), t (ref), cryoModule (ref)
	local unixTimestampMillis = DateTime.now().UnixTimestampMillis
	local t_1 = {
		user_id = var3,
		timestamp_milliseconds = unixTimestampMillis,
		event_type = p0,
		intervention_type = p1,
		event_id = p3,
		evidence = p4,
		timeout_duration_seconds = p5,
		acknowledgeable = p7
	}
	
	if p0 == t.EventTypes.CtaClicked or p0 == t.EventTypes.AppealClicked or (p0 == t.EventTypes.NudgeToastDismissed or p0 == t.EventTypes.ChatAttemptToastDismissed) then
		t_1 = cryoModule.Dictionary.join({
			time_to_interact_seconds = (unixTimestampMillis - p2) / 1000
		}, t_1)
	end
	if p0 == t.EventTypes.GetModerationDetailFailed then
		t_1 = cryoModule.Dictionary.join({ error = p6 }, t_1)
	end
	return t_1
end

return {
	sendAnalyticsEvent = function(p8, p9, p10, p11, p12, p13, p14, p15) --[[ line: 85 ]]
		-- upvalues: var1 (ref), t (ref), var4 (ref)
		var1:sendEventDeferred(t.EventContext, t.EventName, var4(p8, p9, p10, p11, p12, p13, p14, p15))
	end,
	Constants = t
}
local telemetryService = game:GetService("TelemetryService")
local list = {
	"addPlaceId",
	"addUniverseId",
	"addSessionInfo",
	"addPlaySessionId"
}
local t = {
	eventName = "PlayerSupportPromptAction",
	description = "Funnel events for the player support ticket prompt.",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("PlayerSupportPromptTelemetryThrottleHundredthsPercent", 10000),
	lastUpdated = { 2026, 9, 23 }
}
local t_1 = {
	Opened = "opened",
	Submitted = "submitted",
	Dismissed = "dismissed",
	ReportAbuseClicked = "report_abuse_clicked",
	EligibilityBlocked = "eligibility_blocked",
	ErrorShown = "error_shown",
	RejectionRetry = "rejection_retry",
	TicketResult = "ticket_result"
}
local t_2 = { Escape = "escape", DialogClose = "dialog_close" }
local t_3 = {
	Submitted = "submitted",
	Failed = "failed",
	Rejected = "rejected"
}
local t_4 = {
	TICKET_CREATION_SUBMITTED = t_3.Submitted,
	TICKET_CREATION_FAILED = t_3.Failed,
	TICKET_CREATION_TEXT_FILTER_ERROR = t_3.Rejected,
	TICKET_CREATION_GIBBERISH_ERROR = t_3.Rejected
}

local function _(p1)
	return if p1 == nil then "" else tostring(p1)
end

local t_5 = {
	Action = t_1,
	DismissMethod = t_2,
	TicketResult = t_3,
	log = function(p1)
		-- upvalues: telemetryService (write), t (ref), list (ref)
		pcall(function()
			-- upvalues: telemetryService (copy), t (copy), list (copy), p1 (ref)
			local t_1 = {
				eventContext = "PlayerSupportPrompt",
				standardizedFields = list
			}
			local t_2 = { action = p1.action, category = p1.category or "" }
			local shareUserId = p1.shareUserId
			t_2.share_user_id = if shareUserId == nil then "" else tostring(shareUserId)
			local shareUserIdRequired = p1.shareUserIdRequired
			t_2.share_user_id_required = if shareUserIdRequired == nil then "" else tostring(shareUserIdRequired)
			local descriptionLength = p1.descriptionLength
			t_2.description_length = if descriptionLength == nil then "" else tostring(descriptionLength)
			t_2.dismiss_method = p1.dismissMethod or ""
			t_2.reason = p1.reason or ""
			t_2.result = p1.result or ""
			t_1.customFields = t_2
			telemetryService:LogEvent(t, t_1)
		end)
	end
}

function t_5.logTicketResult(p1, p2)
	-- upvalues: t_4 (ref), t_5 (ref), t_1 (ref)
	local var1 = t_4[p1]
	
	if var1 then
		p2 = p2 or {}
		t_5.log({
			action = t_1.TicketResult,
			result = var1,
			reason = p1,
			category = p2.category,
			shareUserId = p2.shareUserId,
			descriptionLength = p2.descriptionLength
		})
		
		return
	end
end

function t_5.logUnavailableShown(p1)
	-- upvalues: t_4 (ref), t_1 (ref), t_5 (ref)
	if t_4[p1] then
		return
	end
	t_5.log({
		action = if string.sub(p1, 1, 43) == "TICKET_CREATION_ELIGIBILITY_FAILURE_REASON_" then t_1.EligibilityBlocked else t_1.ErrorShown,
		reason = p1
	})
end

function t_5._setServicesForTesting(value)
	-- upvalues: telemetryService (write)
	telemetryService = value
end

return t_5
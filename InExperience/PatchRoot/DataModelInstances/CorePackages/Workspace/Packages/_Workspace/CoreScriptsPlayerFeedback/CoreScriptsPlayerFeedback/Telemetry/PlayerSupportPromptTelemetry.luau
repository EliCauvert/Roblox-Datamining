local TelemetryService = game:GetService("TelemetryService")
local StandardizedFields = {
	"addPlaceId",
	"addUniverseId",
	"addSessionInfo",
	"addPlaySessionId"
}
local config = {
	eventName = "PlayerSupportPromptAction",
	description = "Funnel events for the player support ticket prompt.",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("PlayerSupportPromptTelemetryThrottleHundredthsPercent", 10000),
	lastUpdated = { 2026, 9, 23 }
}
local Action = {
	Opened = "opened",
	Submitted = "submitted",
	Dismissed = "dismissed",
	ReportAbuseClicked = "report_abuse_clicked",
	EligibilityBlocked = "eligibility_blocked",
	ErrorShown = "error_shown",
	RejectionRetry = "rejection_retry",
	TicketResult = "ticket_result"
}
local TicketResult = {
	Submitted = "submitted",
	Failed = "failed",
	Rejected = "rejected"
}
local config1 = {
	TICKET_CREATION_SUBMITTED = TicketResult.Submitted,
	TICKET_CREATION_FAILED = TicketResult.Failed,
	TICKET_CREATION_TEXT_FILTER_ERROR = TicketResult.Rejected,
	TICKET_CREATION_GIBBERISH_ERROR = TicketResult.Rejected
}

local function _(p1): string
	return if p1 == nil then "" else tostring(p1)
end

local PlayerSupportPromptTelemetryModule = {
	Action = Action,
	DismissMethod = { Escape = "escape", DialogClose = "dialog_close" },
	TicketResult = TicketResult,
	log = function(p1)
		-- upvalues: TelemetryService (ref), config (copy), StandardizedFields (copy)
		pcall(function()
			-- upvalues: TelemetryService (upval), config (upval), StandardizedFields (upval), p1 (copy)
			local ShareUserId = p1.shareUserId
			local Text: string = if ShareUserId == nil then "" else tostring(ShareUserId)
			local ShareUserIdRequired = p1.shareUserIdRequired
			local Text1: string = if ShareUserIdRequired == nil then "" else tostring(ShareUserIdRequired)
			local DescriptionLength = p1.descriptionLength
			TelemetryService:LogEvent(config, {
				eventContext = "PlayerSupportPrompt",
				standardizedFields = StandardizedFields,
				customFields = {
					action = p1.action,
					category = p1.category or "",
					share_user_id = Text,
					share_user_id_required = Text1,
					description_length = if DescriptionLength == nil then "" else tostring(DescriptionLength),
					dismiss_method = p1.dismissMethod or "",
					reason = p1.reason or "",
					result = p1.result or ""
				}
			})
		end)
	end
}

function PlayerSupportPromptTelemetryModule.logTicketResult(Reason, p1)
	-- upvalues: config1 (copy), PlayerSupportPromptTelemetryModule (copy), Action (copy)
	local Entry = config1[Reason]
	
	if Entry then
		local P3 = p1 or {}
		PlayerSupportPromptTelemetryModule.log({
			action = Action.TicketResult,
			result = Entry,
			reason = Reason,
			category = P3.category,
			shareUserId = P3.shareUserId,
			descriptionLength = P3.descriptionLength
		})
		
		return
	end
end

function PlayerSupportPromptTelemetryModule.logUnavailableShown(Text: string)
	-- upvalues: config1 (copy), Action (copy), PlayerSupportPromptTelemetryModule (copy)
	if not config1[Text] then
		PlayerSupportPromptTelemetryModule.log({
			action = if string.sub(Text, 1, 43) == "TICKET_CREATION_ELIGIBILITY_FAILURE_REASON_" then Action.EligibilityBlocked else Action.ErrorShown,
			reason = Text
		})
		
		return
	end
end

function PlayerSupportPromptTelemetryModule._setServicesForTesting(p1)
	-- upvalues: TelemetryService (ref)
	TelemetryService = p1
end

return PlayerSupportPromptTelemetryModule
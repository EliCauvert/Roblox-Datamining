local playersService = game:GetService("Players")
local parent = script:FindFirstAncestor("InterventionShared").Parent
local cryoModule = require(parent.Cryo)
local loggingProtocolModule = require(parent.LoggingProtocol)
local default = loggingProtocolModule.default
local fFlagUniversalFeatureRestrictionReceivers = require(parent.SharedFlags).FFlagUniversalFeatureRestrictionReceivers
local t = {
	EventContext = "InExperienceInterventionEvent",
	EventName = "InExperienceInterventionEvent",
	InterventionTypes = {
		Nudge = "INTERVENTION_CHAT_NUDGE",
		Timeout = "INTERVENTION_CHAT_TIMEOUT",
		PartyChatNudge = "INTERVENTION_PARTY_CHAT_NUDGE",
		PartyChatTimeout = "INTERVENTION_PARTY_CHAT_TIMEOUT",
		UFRNudge = "INTERVENTION_UFR_NUDGE",
		UFRTimeout = "INTERVENTION_UFR_TIMEOUT"
	},
	CounterNamespaceTypes = { PartyChat = "PartyChat" },
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
		DialogInterventionDismissSuccess = "EVENT_DIALOG_INTERVENTION_DISMISS_SUCCESS",
		DialogInterventionDismissFailed = "EVENT_DIALOG_INTERVENTION_DISMISS_FAILED",
		GetModerationDetailFailed = "EVENT_GET_MODERATION_DETAIL_FAILED"
	}
}
local t_1 = {
	eventName = t.EventName,
	backends = { loggingProtocolModule.TelemetryBackends.EventIngest },
	formatCustomFields = function(p1)
		-- upvalues: playersService (ref), cryoModule (ref), fFlagUniversalFeatureRestrictionReceivers (ref), t (ref)
		local eventType = p1.eventType
		local interventionType = p1.interventionType
		local renderedTimestamp = p1.renderedTimestamp
		local eventId = p1.eventId
		local evidence = p1.evidence
		local duration = p1.duration
		local acknowledgeable = p1.acknowledgeable
		local unixTimestampMillis = DateTime.now().UnixTimestampMillis
		local t_1 = {
			user_id = tostring(playersService and (playersService.LocalPlayer and (playersService.LocalPlayer.UserId or 0))),
			timestamp_milliseconds = tostring(unixTimestampMillis),
			event_type = eventType,
			intervention_type = interventionType,
			event_id = eventId,
			evidence = evidence,
			timeout_duration_seconds = if duration ~= nil then nil else tostring(duration),
			placement = p1.placement
		}
		
		if acknowledgeable ~= nil then
			t_1 = cryoModule.Dictionary.join({ acknowledgeable = tostring(acknowledgeable) }, t_1)
		end
		if fFlagUniversalFeatureRestrictionReceivers and p1.abuseVector ~= nil then
			t_1 = cryoModule.Dictionary.join({ abuse_vector = p1.abuseVector }, t_1)
		end
		if eventType == t.EventTypes.CtaClicked or eventType == t.EventTypes.AppealClicked or (eventType == t.EventTypes.NudgeToastDismissed or eventType == t.EventTypes.ChatAttemptToastDismissed) then
			t_1 = cryoModule.Dictionary.join({
				time_to_interact_seconds = tostring((unixTimestampMillis - renderedTimestamp) / 1000)
			}, t_1)
		end
		if eventType == t.EventTypes.DialogInterventionDismissFailed or eventType == t.EventTypes.GetModerationDetailFailed then
			t_1 = cryoModule.Dictionary.join({ error = p1.error }, t_1)
		end
		return t_1
	end
}

local var1 = function(p1)
	-- upvalues: loggingProtocolModule (ref)
	return {
		counterSuffix = p1,
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		formatCustomFields = function(p2)
			return {
				eventType = p2.eventType,
				interventionType = p2.interventionType,
				placement = p2.placement
			}
		end
	}
end

return {
	sendAnalyticsEvent = function(p1, p2)
		-- upvalues: default (ref)
		local loggingTypes = p1.loggingTypes
		
		if loggingTypes.Event then
			local event = loggingTypes.Event
			default:logRobloxTelemetryEvent({
				eventName = event.eventName,
				backends = event.backends,
				throttlingPercentage = p1.throttlingPercentage,
				lastUpdated = p1.lastUpdated,
				description = p1.description,
				links = p1.links
			}, event.standardizedFields or {}, event.formatCustomFields(p2))
		end
		if loggingTypes.Counter then
			local counter = loggingTypes.Counter
			default:logRobloxTelemetryCounter({
				eventName = `Intervention.{p2.counterNamespace or "Unknown"}.{counter.counterSuffix}`,
				backends = counter.backends,
				throttlingPercentage = p1.throttlingPercentage,
				lastUpdated = p1.lastUpdated,
				description = p1.description,
				links = p1.links
			}, 1, counter.formatCustomFields(p2))
		end
	end,
	Constants = t,
	TelemetryConfigs = {
		MessageReceived = {
			throttlingPercentage = 10000,
			description = "Intervention RTN message Received",
			loggingTypes = { Event = t_1, Counter = var1("Message.Received") },
			lastUpdated = { 2025, 3, 25 }
		},
		DialogRendered = {
			throttlingPercentage = 10000,
			description = "Intervention Dialog Rendered",
			loggingTypes = { Event = t_1, Counter = var1("Dialog.Rendered") },
			lastUpdated = { 2025, 3, 25 }
		},
		DialogCtaClicked = {
			throttlingPercentage = 10000,
			description = "Intervention Dialog CTA Clicked",
			loggingTypes = { Event = t_1, Counter = var1("Dialog.Button.Cta") },
			lastUpdated = { 2025, 3, 25 }
		},
		DialogAppealClicked = {
			throttlingPercentage = 10000,
			description = "Intervention Dialog Appeal Clicked",
			loggingTypes = { Event = t_1, Counter = var1("Dialog.Button.Appeal") },
			lastUpdated = { 2025, 3, 25 }
		},
		DialogInterventionDismissSuccess = {
			throttlingPercentage = 10000,
			description = "Intervention Dialog Intervention Dismiss Success",
			loggingTypes = { Event = t_1 },
			lastUpdated = { 2025, 10, 20 }
		},
		DialogInterventionDismissFailed = {
			throttlingPercentage = 10000,
			description = "Intervention Dialog Intervention Dismiss Failed",
			loggingTypes = { Event = t_1 },
			lastUpdated = { 2025, 10, 20 }
		},
		GetModerationDetailFailed = {
			throttlingPercentage = 10000,
			description = "Intervention Get Moderation Detail Failed",
			loggingTypes = { Event = t_1 },
			lastUpdated = { 2026, 3, 27 }
		}
	}
}
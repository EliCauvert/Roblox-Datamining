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
	formatCustomFields = function(p0)
		-- upvalues: playersService (ref), cryoModule (ref), fFlagUniversalFeatureRestrictionReceivers (ref), t (ref)
		local eventType = p0.eventType
		local interventionType = p0.interventionType
		local renderedTimestamp = p0.renderedTimestamp
		local eventId = p0.eventId
		local evidence = p0.evidence
		local duration = p0.duration
		local acknowledgeable = p0.acknowledgeable
		local unixTimestampMillis = DateTime.now().UnixTimestampMillis
		local t_1 = {
			user_id = tostring(playersService and (playersService.LocalPlayer and (playersService.LocalPlayer.UserId or 0))),
			timestamp_milliseconds = tostring(unixTimestampMillis),
			event_type = eventType,
			intervention_type = interventionType,
			event_id = eventId,
			evidence = evidence,
			timeout_duration_seconds = if duration ~= nil then nil else tostring(duration),
			placement = p0.placement
		}
		
		if acknowledgeable ~= nil then
			t_1 = cryoModule.Dictionary.join({ acknowledgeable = tostring(acknowledgeable) }, t_1)
		end
		if fFlagUniversalFeatureRestrictionReceivers and p0.abuseVector ~= nil then
			t_1 = cryoModule.Dictionary.join({ abuse_vector = p0.abuseVector }, t_1)
		end
		if eventType == t.EventTypes.CtaClicked or eventType == t.EventTypes.AppealClicked or (eventType == t.EventTypes.NudgeToastDismissed or eventType == t.EventTypes.ChatAttemptToastDismissed) then
			t_1 = cryoModule.Dictionary.join({
				time_to_interact_seconds = tostring((unixTimestampMillis - renderedTimestamp) / 1000)
			}, t_1)
		end
		if eventType == t.EventTypes.DialogInterventionDismissFailed or eventType == t.EventTypes.GetModerationDetailFailed then
			t_1 = cryoModule.Dictionary.join({ error = p0.error }, t_1)
		end
		return t_1
	end
}

local var5 = function(p1)
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
	sendAnalyticsEvent = function(p3, p4)
		-- upvalues: default (ref)
		local loggingTypes = p3.loggingTypes
		
		if loggingTypes.Event then
			local event = loggingTypes.Event
			default:logRobloxTelemetryEvent({
				eventName = event.eventName,
				backends = event.backends,
				throttlingPercentage = p3.throttlingPercentage,
				lastUpdated = p3.lastUpdated,
				description = p3.description,
				links = p3.links
			}, event.standardizedFields or {}, event.formatCustomFields(p4))
		end
		if loggingTypes.Counter then
			local counter = loggingTypes.Counter
			default:logRobloxTelemetryCounter({
				eventName = `Intervention.{p4.counterNamespace or "Unknown"}.{counter.counterSuffix}`,
				backends = counter.backends,
				throttlingPercentage = p3.throttlingPercentage,
				lastUpdated = p3.lastUpdated,
				description = p3.description,
				links = p3.links
			}, 1, counter.formatCustomFields(p4))
		end
	end,
	Constants = t,
	TelemetryConfigs = {
		MessageReceived = {
			throttlingPercentage = 10000,
			description = "Intervention RTN message Received",
			loggingTypes = { Event = t_1, Counter = var5("Message.Received") },
			lastUpdated = { 2025, 3, 25 }
		},
		DialogRendered = {
			throttlingPercentage = 10000,
			description = "Intervention Dialog Rendered",
			loggingTypes = { Event = t_1, Counter = var5("Dialog.Rendered") },
			lastUpdated = { 2025, 3, 25 }
		},
		DialogCtaClicked = {
			throttlingPercentage = 10000,
			description = "Intervention Dialog CTA Clicked",
			loggingTypes = { Event = t_1, Counter = var5("Dialog.Button.Cta") },
			lastUpdated = { 2025, 3, 25 }
		},
		DialogAppealClicked = {
			throttlingPercentage = 10000,
			description = "Intervention Dialog Appeal Clicked",
			loggingTypes = { Event = t_1, Counter = var5("Dialog.Button.Appeal") },
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
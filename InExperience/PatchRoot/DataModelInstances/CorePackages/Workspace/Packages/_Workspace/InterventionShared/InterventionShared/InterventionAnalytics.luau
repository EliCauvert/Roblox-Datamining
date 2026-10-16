local Players = game:GetService("Players")
local Parent = script:FindFirstAncestor("InterventionShared").Parent
local CryoModule = require(Parent.Cryo)
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local Default = LoggingProtocolModule.default
local Constants = {
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
local Event = {
	eventName = Constants.EventName,
	backends = { LoggingProtocolModule.TelemetryBackends.EventIngest },
	formatCustomFields = function(p1) --[[ Line: 74 ]]
		-- upvalues: Players (copy), CryoModule (copy), Constants (copy)
		local EventType = p1.eventType
		local RenderedTimestamp = p1.renderedTimestamp
		local Duration = p1.duration
		local Acknowledgeable = p1.acknowledgeable
		local UnixTimestampMillis = DateTime.now().UnixTimestampMillis
		local JoinResult = {
			user_id = tostring(Players and Players.LocalPlayer and Players.LocalPlayer.UserId or 0),
			timestamp_milliseconds = tostring(UnixTimestampMillis),
			event_type = EventType,
			intervention_type = p1.interventionType,
			event_id = p1.eventId,
			evidence = p1.evidence,
			timeout_duration_seconds = if Duration == nil then nil else tostring(Duration),
			placement = p1.placement
		}
		
		if Acknowledgeable ~= nil then
			JoinResult = CryoModule.Dictionary.join({ acknowledgeable = tostring(Acknowledgeable) }, JoinResult)
		end
		if p1.abuseVector ~= nil then
			JoinResult = CryoModule.Dictionary.join({ abuse_vector = p1.abuseVector }, JoinResult)
		end
		if EventType == Constants.EventTypes.CtaClicked or EventType == Constants.EventTypes.AppealClicked or EventType == Constants.EventTypes.NudgeToastDismissed or EventType == Constants.EventTypes.ChatAttemptToastDismissed then
			JoinResult = CryoModule.Dictionary.join({
				time_to_interact_seconds = tostring((UnixTimestampMillis - RenderedTimestamp) / 1000)
			}, JoinResult)
		end
		if EventType == Constants.EventTypes.DialogInterventionDismissFailed or EventType == Constants.EventTypes.GetModerationDetailFailed then
			JoinResult = CryoModule.Dictionary.join({ error = p1.error }, JoinResult)
		end
		return JoinResult
	end
}

local function v7(CounterSuffix) --[[ Line: 137 ]]
	-- upvalues: LoggingProtocolModule (copy)
	return {
		counterSuffix = CounterSuffix,
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		formatCustomFields = function(p1) --[[ Line: 141 ]]
			return {
				eventType = p1.eventType,
				interventionType = p1.interventionType,
				placement = p1.placement
			}
		end
	}
end

return {
	sendAnalyticsEvent = function(p1, p2) --[[ Line: 214 ]]
		-- upvalues: Default (copy)
		local LoggingTypes = p1.loggingTypes
		
		if LoggingTypes.Event then
			local Event = LoggingTypes.Event
			Default:logRobloxTelemetryEvent({
				eventName = Event.eventName,
				backends = Event.backends,
				throttlingPercentage = p1.throttlingPercentage,
				lastUpdated = p1.lastUpdated,
				description = p1.description,
				links = p1.links
			}, Event.standardizedFields or {}, (Event.formatCustomFields(p2)))
		end
		if LoggingTypes.Counter then
			local Counter = LoggingTypes.Counter
			Default:logRobloxTelemetryCounter({
				eventName = `Intervention.{p2.counterNamespace or "Unknown"}.{Counter.counterSuffix}`,
				backends = Counter.backends,
				throttlingPercentage = p1.throttlingPercentage,
				lastUpdated = p1.lastUpdated,
				description = p1.description,
				links = p1.links
			}, 1, (Counter.formatCustomFields(p2)))
		end
	end,
	Constants = Constants,
	TelemetryConfigs = {
		MessageReceived = {
			throttlingPercentage = 10000,
			description = "Intervention RTN message Received",
			loggingTypes = { Event = Event, Counter = v7("Message.Received") },
			lastUpdated = { 2025, 3, 25 }
		},
		DialogRendered = {
			throttlingPercentage = 10000,
			description = "Intervention Dialog Rendered",
			loggingTypes = { Event = Event, Counter = v7("Dialog.Rendered") },
			lastUpdated = { 2025, 3, 25 }
		},
		DialogCtaClicked = {
			throttlingPercentage = 10000,
			description = "Intervention Dialog CTA Clicked",
			loggingTypes = { Event = Event, Counter = v7("Dialog.Button.Cta") },
			lastUpdated = { 2025, 3, 25 }
		},
		DialogAppealClicked = {
			throttlingPercentage = 10000,
			description = "Intervention Dialog Appeal Clicked",
			loggingTypes = { Event = Event, Counter = v7("Dialog.Button.Appeal") },
			lastUpdated = { 2025, 3, 25 }
		},
		DialogInterventionDismissSuccess = {
			throttlingPercentage = 10000,
			description = "Intervention Dialog Intervention Dismiss Success",
			loggingTypes = { Event = Event },
			lastUpdated = { 2025, 10, 20 }
		},
		DialogInterventionDismissFailed = {
			throttlingPercentage = 10000,
			description = "Intervention Dialog Intervention Dismiss Failed",
			loggingTypes = { Event = Event },
			lastUpdated = { 2025, 10, 20 }
		},
		GetModerationDetailFailed = {
			throttlingPercentage = 10000,
			description = "Intervention Get Moderation Detail Failed",
			loggingTypes = { Event = Event },
			lastUpdated = { 2026, 3, 27 }
		}
	}
}
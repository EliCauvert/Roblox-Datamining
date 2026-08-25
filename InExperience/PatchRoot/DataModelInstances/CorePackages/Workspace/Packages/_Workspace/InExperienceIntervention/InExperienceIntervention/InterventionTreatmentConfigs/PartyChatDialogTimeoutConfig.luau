local inExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local parent = inExperienceIntervention.Parent
local constants = require(parent.InterventionShared).Utils.Constants
local _ = require(inExperienceIntervention.Utils.Types)
local interventionAnalytics = require(parent.InterventionShared).InterventionAnalytics
local partyChatTimeoutReceivedSignal = require(parent.InterventionShared).Signals.partyChatTimeoutReceivedSignal

return {
	configName = "PartyChatDialogNudge",
	shouldTriggerVisualTreatment = function(p0)
		-- upvalues: constants (ref)
		return p0.type == constants.NotificationDialogType.ChatTimeout and p0.abuseVector == constants.AbuseVectorType.PartyChat
	end,
	shouldTriggerBehavioralTreatment = function(p1)
		-- upvalues: constants (ref)
		return p1.type == constants.NotificationDialogType.ChatTimeout and p1.abuseVector == constants.AbuseVectorType.PartyChat
	end,
	shouldTriggerEventReceived = function(p2)
		-- upvalues: constants (ref)
		return p2.type == constants.NotificationDialogType.ChatTimeout and p2.abuseVector == constants.AbuseVectorType.PartyChat
	end,
	onTriggerVisualTreatment = function(p3, p4)
		-- upvalues: constants (ref)
		p3({
			isShown = true,
			type = constants.UIStateActions.ToggleNotificationDialog,
			treatmentType = constants.TreatmentType.PartyChatTimeoutDialog,
			endTime = DateTime.now().UnixTimestamp + p4.timeoutDurationSeconds,
			detail = p4
		})
	end,
	onTriggerBehavioralTreatment = function(p5)
		-- upvalues: partyChatTimeoutReceivedSignal (ref)
		partyChatTimeoutReceivedSignal:fire(p5.vectorTargetId)
	end,
	onTriggerEventReceived = function(p6)
		-- upvalues: interventionAnalytics (ref), constants (ref)
		interventionAnalytics.sendAnalyticsEvent(interventionAnalytics.TelemetryConfigs.MessageReceived, {
			eventType = interventionAnalytics.Constants.EventTypes.ModalMessageReceived,
			counterNamespace = interventionAnalytics.Constants.CounterNamespaceTypes.PartyChat,
			interventionType = interventionAnalytics.Constants.InterventionTypes.PartyChatTimeout,
			renderedTimestamp = DateTime.now().UnixTimestampMillis,
			eventId = p6.decisionEventId,
			duration = p6.timeoutDurationSeconds,
			placement = constants.InterventionPlacementType.InExperience
		})
	end
}
local inExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local parent = inExperienceIntervention.Parent
local constants = require(parent.InterventionShared).Utils.Constants
local _ = require(inExperienceIntervention.Utils.Types)
local interventionAnalytics = require(parent.InterventionShared).InterventionAnalytics

return {
	configName = "PartyChatDialogNudge",
	shouldTriggerVisualTreatment = function(p0)
		-- upvalues: constants (ref)
		return p0.type == constants.NotificationDialogType.ChatNudge and (p0.modalType == constants.NotificationModalType.Dialog and p0.abuseVector == constants.AbuseVectorType.PartyChat)
	end,
	shouldTriggerBehavioralTreatment = function(_)
		return false
	end,
	shouldTriggerEventReceived = function(p1)
		-- upvalues: constants (ref)
		return p1.type == constants.NotificationDialogType.ChatNudge and (p1.modalType == constants.NotificationModalType.Dialog and p1.abuseVector == constants.AbuseVectorType.PartyChat)
	end,
	onTriggerVisualTreatment = function(p2, p3)
		-- upvalues: constants (ref)
		p2({
			isShown = true,
			type = constants.UIStateActions.ToggleNotificationDialog,
			treatmentType = constants.TreatmentType.PartyChatNudgeDialog,
			detail = p3
		})
	end,
	onTriggerBehavioralTreatment = function(_) end,
	onTriggerEventReceived = function(p4)
		-- upvalues: interventionAnalytics (ref), constants (ref)
		interventionAnalytics.sendAnalyticsEvent(interventionAnalytics.TelemetryConfigs.MessageReceived, {
			eventType = interventionAnalytics.Constants.EventTypes.ModalMessageReceived,
			counterNamespace = interventionAnalytics.Constants.CounterNamespaceTypes.PartyChat,
			interventionType = interventionAnalytics.Constants.InterventionTypes.PartyChatNudge,
			renderedTimestamp = DateTime.now().UnixTimestampMillis,
			eventId = p4.decisionEventId,
			duration = p4.timeoutDurationSeconds,
			placement = constants.InterventionPlacementType.InExperience
		})
	end
}
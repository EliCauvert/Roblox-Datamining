local inExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local parent = inExperienceIntervention.Parent
local constants = require(parent.InterventionShared).Utils.Constants
local _ = require(inExperienceIntervention.Utils.Types)
local interventionAnalytics = require(parent.InterventionShared).InterventionAnalytics

return {
	configName = "PartyChatDialogNudge",
	shouldTriggerVisualTreatment = function(p1)
		-- upvalues: constants (ref)
		return p1.type == constants.NotificationDialogType.ChatNudge and (p1.modalType == constants.NotificationModalType.Dialog and p1.abuseVector == constants.AbuseVectorType.PartyChat)
	end,
	shouldTriggerBehavioralTreatment = function(_)
		return false
	end,
	shouldTriggerEventReceived = function(p1)
		-- upvalues: constants (ref)
		return p1.type == constants.NotificationDialogType.ChatNudge and (p1.modalType == constants.NotificationModalType.Dialog and p1.abuseVector == constants.AbuseVectorType.PartyChat)
	end,
	onTriggerVisualTreatment = function(p1, p2)
		-- upvalues: constants (ref)
		p1({
			isShown = true,
			type = constants.UIStateActions.ToggleNotificationDialog,
			treatmentType = constants.TreatmentType.PartyChatNudgeDialog,
			detail = p2
		})
	end,
	onTriggerBehavioralTreatment = function(_) end,
	onTriggerEventReceived = function(p1)
		-- upvalues: interventionAnalytics (ref), constants (ref)
		interventionAnalytics.sendAnalyticsEvent(interventionAnalytics.TelemetryConfigs.MessageReceived, {
			eventType = interventionAnalytics.Constants.EventTypes.ModalMessageReceived,
			counterNamespace = interventionAnalytics.Constants.CounterNamespaceTypes.PartyChat,
			interventionType = interventionAnalytics.Constants.InterventionTypes.PartyChatNudge,
			renderedTimestamp = DateTime.now().UnixTimestampMillis,
			eventId = p1.decisionEventId,
			duration = p1.timeoutDurationSeconds,
			placement = constants.InterventionPlacementType.InExperience
		})
	end
}
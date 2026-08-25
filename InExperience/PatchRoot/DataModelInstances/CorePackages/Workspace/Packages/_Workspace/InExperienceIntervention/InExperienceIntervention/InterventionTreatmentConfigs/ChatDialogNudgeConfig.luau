local inExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local constants = require(inExperienceIntervention.Parent.InterventionShared).Utils.Constants
local _ = require(inExperienceIntervention.Utils.Types)
local inExperienceInterventionAnalyticsModule = require(inExperienceIntervention.InExperienceInterventionAnalytics)

return {
	configName = "ChatDialogNudge",
	shouldTriggerVisualTreatment = function(p0)
		-- upvalues: constants (ref)
		return p0.type == constants.NotificationDialogType.ChatNudge and (p0.modalType == constants.NotificationModalType.Dialog and (p0.abuseVector == constants.AbuseVectorType.ExperienceChat and not p0.acknowledgeable))
	end,
	shouldTriggerBehavioralTreatment = function(_)
		return false
	end,
	shouldTriggerEventReceived = function(p1)
		-- upvalues: constants (ref)
		return p1.type == constants.NotificationDialogType.ChatNudge and (p1.modalType == constants.NotificationModalType.Dialog and p1.abuseVector == constants.AbuseVectorType.ExperienceChat)
	end,
	onTriggerVisualTreatment = function(p2, p3)
		-- upvalues: constants (ref)
		p2({
			isShown = true,
			type = constants.UIStateActions.ToggleNotificationDialog,
			treatmentType = constants.TreatmentType.ChatNudgeDialog,
			detail = p3
		})
	end,
	onTriggerBehavioralTreatment = function(_) end,
	onTriggerEventReceived = function(p4)
		-- upvalues: inExperienceInterventionAnalyticsModule (ref)
		inExperienceInterventionAnalyticsModule.sendAnalyticsEvent(inExperienceInterventionAnalyticsModule.Constants.EventTypes.ModalMessageReceived, inExperienceInterventionAnalyticsModule.Constants.InterventionTypes.Nudge, DateTime.now().UnixTimestampMillis, p4.decisionEventId, p4.evidence, p4.timeoutDurationSeconds)
	end
}
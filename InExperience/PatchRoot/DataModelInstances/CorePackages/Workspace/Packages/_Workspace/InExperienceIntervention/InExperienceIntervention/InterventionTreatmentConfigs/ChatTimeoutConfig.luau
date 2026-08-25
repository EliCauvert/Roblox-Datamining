local inExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local constants = require(inExperienceIntervention.Parent.InterventionShared).Utils.Constants
local _ = require(inExperienceIntervention.Utils.Types)
local inExperienceInterventionAnalyticsModule = require(inExperienceIntervention.InExperienceInterventionAnalytics)

return {
	configName = "ChatTimeout",
	shouldTriggerVisualTreatment = function(p0)
		-- upvalues: constants (ref)
		return p0.type == constants.NotificationDialogType.ChatTimeout and (p0.abuseVector == constants.AbuseVectorType.ExperienceChat and not p0.acknowledgeable)
	end,
	shouldTriggerBehavioralTreatment = function(p1)
		-- upvalues: constants (ref)
		return p1.type == constants.NotificationDialogType.ChatTimeout and p1.abuseVector == constants.AbuseVectorType.ExperienceChat
	end,
	shouldTriggerEventReceived = function(p2)
		-- upvalues: constants (ref)
		return p2.type == constants.NotificationDialogType.ChatTimeout and p2.abuseVector == constants.AbuseVectorType.ExperienceChat
	end,
	onTriggerVisualTreatment = function(p3, p4)
		-- upvalues: constants (ref)
		p3({
			isShown = true,
			type = constants.UIStateActions.ToggleNotificationDialog,
			treatmentType = constants.TreatmentType.ChatTimeoutDialog,
			detail = p4
		})
	end,
	onTriggerBehavioralTreatment = function(_) end,
	onTriggerEventReceived = function(p5)
		-- upvalues: inExperienceInterventionAnalyticsModule (ref)
		inExperienceInterventionAnalyticsModule.sendAnalyticsEvent(inExperienceInterventionAnalyticsModule.Constants.EventTypes.ModalMessageReceived, inExperienceInterventionAnalyticsModule.Constants.InterventionTypes.Timeout, DateTime.now().UnixTimestampMillis, p5.decisionEventId, p5.evidence, p5.timeoutDurationSeconds)
	end
}
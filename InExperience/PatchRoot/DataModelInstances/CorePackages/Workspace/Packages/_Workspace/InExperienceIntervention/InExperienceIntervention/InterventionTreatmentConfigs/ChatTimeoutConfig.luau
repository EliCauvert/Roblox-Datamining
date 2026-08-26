local inExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local constants = require(inExperienceIntervention.Parent.InterventionShared).Utils.Constants
local _ = require(inExperienceIntervention.Utils.Types)
local inExperienceInterventionAnalyticsModule = require(inExperienceIntervention.InExperienceInterventionAnalytics)

return {
	configName = "ChatTimeout",
	shouldTriggerVisualTreatment = function(p1)
		-- upvalues: constants (ref)
		return p1.type == constants.NotificationDialogType.ChatTimeout and (p1.abuseVector == constants.AbuseVectorType.ExperienceChat and not p1.acknowledgeable)
	end,
	shouldTriggerBehavioralTreatment = function(p1)
		-- upvalues: constants (ref)
		return p1.type == constants.NotificationDialogType.ChatTimeout and p1.abuseVector == constants.AbuseVectorType.ExperienceChat
	end,
	shouldTriggerEventReceived = function(p1)
		-- upvalues: constants (ref)
		return p1.type == constants.NotificationDialogType.ChatTimeout and p1.abuseVector == constants.AbuseVectorType.ExperienceChat
	end,
	onTriggerVisualTreatment = function(p1, p2)
		-- upvalues: constants (ref)
		p1({
			isShown = true,
			type = constants.UIStateActions.ToggleNotificationDialog,
			treatmentType = constants.TreatmentType.ChatTimeoutDialog,
			detail = p2
		})
	end,
	onTriggerBehavioralTreatment = function(_) end,
	onTriggerEventReceived = function(p1)
		-- upvalues: inExperienceInterventionAnalyticsModule (ref)
		inExperienceInterventionAnalyticsModule.sendAnalyticsEvent(inExperienceInterventionAnalyticsModule.Constants.EventTypes.ModalMessageReceived, inExperienceInterventionAnalyticsModule.Constants.InterventionTypes.Timeout, DateTime.now().UnixTimestampMillis, p1.decisionEventId, p1.evidence, p1.timeoutDurationSeconds)
	end
}
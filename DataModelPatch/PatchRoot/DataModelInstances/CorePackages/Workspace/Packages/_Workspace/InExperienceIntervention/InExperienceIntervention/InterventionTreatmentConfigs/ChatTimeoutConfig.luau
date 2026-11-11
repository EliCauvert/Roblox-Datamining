local InExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local Constants = require(InExperienceIntervention.Parent.InterventionShared).Utils.Constants
local _ = require(InExperienceIntervention.Utils.Types)
local InExperienceInterventionAnalyticsModule = require(InExperienceIntervention.InExperienceInterventionAnalytics)

return {
	configName = "ChatTimeout",
	shouldTriggerVisualTreatment = function(p1): boolean
		-- upvalues: Constants (copy)
		return p1.type == Constants.NotificationDialogType.ChatTimeout and p1.abuseVector == Constants.AbuseVectorType.ExperienceChat and not p1.acknowledgeable
	end,
	shouldTriggerBehavioralTreatment = function(p1): boolean
		-- upvalues: Constants (copy)
		return p1.type == Constants.NotificationDialogType.ChatTimeout and p1.abuseVector == Constants.AbuseVectorType.ExperienceChat
	end,
	shouldTriggerEventReceived = function(p1): boolean
		-- upvalues: Constants (copy)
		return p1.type == Constants.NotificationDialogType.ChatTimeout and p1.abuseVector == Constants.AbuseVectorType.ExperienceChat
	end,
	onTriggerVisualTreatment = function(Callback: (any) -> (), Detail)
		-- upvalues: Constants (copy)
		Callback({
			isShown = true,
			type = Constants.UIStateActions.ToggleNotificationDialog,
			treatmentType = Constants.TreatmentType.ChatTimeoutDialog,
			detail = Detail
		})
	end,
	onTriggerBehavioralTreatment = function(_) end,
	onTriggerEventReceived = function(p1)
		-- upvalues: InExperienceInterventionAnalyticsModule (copy)
		InExperienceInterventionAnalyticsModule.sendAnalyticsEvent(InExperienceInterventionAnalyticsModule.Constants.EventTypes.ModalMessageReceived, InExperienceInterventionAnalyticsModule.Constants.InterventionTypes.Timeout, DateTime.now().UnixTimestampMillis, p1.decisionEventId, p1.evidence, p1.timeoutDurationSeconds)
	end
}
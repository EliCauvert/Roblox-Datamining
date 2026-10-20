local InExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local Parent = InExperienceIntervention.Parent
local Constants = require(Parent.InterventionShared).Utils.Constants
local ExperienceChatInterventionShownSignal = require(Parent.InterventionShared).Signals.experienceChatInterventionShownSignal
local FFlagExpChatDictationStopOnSafetyIntervention = require(Parent.SharedFlags).FFlagExpChatDictationStopOnSafetyIntervention
local _ = require(InExperienceIntervention.Utils.Types)
local InExperienceInterventionAnalyticsModule = require(InExperienceIntervention.InExperienceInterventionAnalytics)

return {
	configName = "ChatDialogNudge",
	shouldTriggerVisualTreatment = function(p1): boolean
		-- upvalues: Constants (copy)
		return p1.type == Constants.NotificationDialogType.ChatNudge and (p1.modalType == Constants.NotificationModalType.Dialog and p1.abuseVector == Constants.AbuseVectorType.ExperienceChat) and not p1.acknowledgeable
	end,
	shouldTriggerBehavioralTreatment = function(_): boolean
		return false
	end,
	shouldTriggerEventReceived = function(p1): boolean
		-- upvalues: Constants (copy)
		return p1.type == Constants.NotificationDialogType.ChatNudge and p1.modalType == Constants.NotificationModalType.Dialog and p1.abuseVector == Constants.AbuseVectorType.ExperienceChat
	end,
	onTriggerVisualTreatment = function(Callback: (any) -> (), Detail)
		-- upvalues: Constants (copy), FFlagExpChatDictationStopOnSafetyIntervention (copy), ExperienceChatInterventionShownSignal (copy)
		Callback({
			isShown = true,
			type = Constants.UIStateActions.ToggleNotificationDialog,
			treatmentType = Constants.TreatmentType.ChatNudgeDialog,
			detail = Detail
		})
		
		if FFlagExpChatDictationStopOnSafetyIntervention then
			ExperienceChatInterventionShownSignal:fire()
		end
	end,
	onTriggerBehavioralTreatment = function(_) end,
	onTriggerEventReceived = function(p1)
		-- upvalues: InExperienceInterventionAnalyticsModule (copy)
		InExperienceInterventionAnalyticsModule.sendAnalyticsEvent(InExperienceInterventionAnalyticsModule.Constants.EventTypes.ModalMessageReceived, InExperienceInterventionAnalyticsModule.Constants.InterventionTypes.Nudge, DateTime.now().UnixTimestampMillis, p1.decisionEventId, p1.evidence, p1.timeoutDurationSeconds)
	end
}
local inExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local parent = inExperienceIntervention.Parent
local constants = require(parent.InterventionShared).Utils.Constants
local experienceChatInterventionShownSignal = require(parent.InterventionShared).Signals.experienceChatInterventionShownSignal
local fFlagExpChatDictationStopOnSafetyIntervention = require(parent.SharedFlags).FFlagExpChatDictationStopOnSafetyIntervention
local _ = require(inExperienceIntervention.Utils.Types)
local inExperienceInterventionAnalyticsModule = require(inExperienceIntervention.InExperienceInterventionAnalytics)

return {
	configName = "ChatDialogNudge",
	shouldTriggerVisualTreatment = function(p1)
		-- upvalues: constants (ref)
		return p1.type == constants.NotificationDialogType.ChatNudge and (p1.modalType == constants.NotificationModalType.Dialog and (p1.abuseVector == constants.AbuseVectorType.ExperienceChat and not p1.acknowledgeable))
	end,
	shouldTriggerBehavioralTreatment = function(_)
		return false
	end,
	shouldTriggerEventReceived = function(p1)
		-- upvalues: constants (ref)
		return p1.type == constants.NotificationDialogType.ChatNudge and (p1.modalType == constants.NotificationModalType.Dialog and p1.abuseVector == constants.AbuseVectorType.ExperienceChat)
	end,
	onTriggerVisualTreatment = function(p1, p2)
		-- upvalues: constants (ref), fFlagExpChatDictationStopOnSafetyIntervention (ref), experienceChatInterventionShownSignal (ref)
		p1({
			isShown = true,
			type = constants.UIStateActions.ToggleNotificationDialog,
			treatmentType = constants.TreatmentType.ChatNudgeDialog,
			detail = p2
		})
		
		if fFlagExpChatDictationStopOnSafetyIntervention then
			experienceChatInterventionShownSignal:fire()
		end
	end,
	onTriggerBehavioralTreatment = function(_) end,
	onTriggerEventReceived = function(p1)
		-- upvalues: inExperienceInterventionAnalyticsModule (ref)
		inExperienceInterventionAnalyticsModule.sendAnalyticsEvent(inExperienceInterventionAnalyticsModule.Constants.EventTypes.ModalMessageReceived, inExperienceInterventionAnalyticsModule.Constants.InterventionTypes.Nudge, DateTime.now().UnixTimestampMillis, p1.decisionEventId, p1.evidence, p1.timeoutDurationSeconds)
	end
}
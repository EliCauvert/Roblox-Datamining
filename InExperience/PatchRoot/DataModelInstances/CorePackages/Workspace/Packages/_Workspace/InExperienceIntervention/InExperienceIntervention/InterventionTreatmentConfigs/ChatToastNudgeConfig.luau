local InExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local Parent = InExperienceIntervention.Parent
local Constants = require(Parent.InterventionShared).Utils.Constants
local ExperienceChatInterventionShownSignal = require(Parent.InterventionShared).Signals.experienceChatInterventionShownSignal
local FFlagExpChatDictationStopOnSafetyIntervention = require(Parent.SharedFlags).FFlagExpChatDictationStopOnSafetyIntervention
local _ = require(InExperienceIntervention.Utils.Types)
local InExperienceInterventionAnalyticsModule = require(InExperienceIntervention.InExperienceInterventionAnalytics)

return {
	configName = "ChatToastNudge",
	shouldTriggerVisualTreatment = function(p1): boolean --[[ Line: 14 ]]
		-- upvalues: Constants (copy)
		return p1.type == Constants.NotificationDialogType.ChatNudge and p1.modalType == Constants.NotificationModalType.Toast and p1.abuseVector == Constants.AbuseVectorType.ExperienceChat
	end,
	shouldTriggerBehavioralTreatment = function(_): boolean --[[ Line: 19 ]]
		return false
	end,
	shouldTriggerEventReceived = function(p1): boolean --[[ Line: 22 ]]
		-- upvalues: Constants (copy)
		return p1.type == Constants.NotificationDialogType.ChatNudge and p1.modalType == Constants.NotificationModalType.Toast and p1.abuseVector == Constants.AbuseVectorType.ExperienceChat
	end,
	onTriggerVisualTreatment = function(Callback: (any) -> (), Detail) --[[ Line: 27 ]]
		-- upvalues: Constants (copy), FFlagExpChatDictationStopOnSafetyIntervention (copy), ExperienceChatInterventionShownSignal (copy)
		Callback({
			isShown = true,
			type = Constants.UIStateActions.ToggleNotificationDialog,
			treatmentType = Constants.TreatmentType.ChatNudgeToast,
			detail = Detail
		})
		
		if FFlagExpChatDictationStopOnSafetyIntervention then
			ExperienceChatInterventionShownSignal:fire()
		end
	end,
	onTriggerBehavioralTreatment = function(_) --[[ Line: 38 ]] end,
	onTriggerEventReceived = function(p1) --[[ Line: 39 ]]
		-- upvalues: InExperienceInterventionAnalyticsModule (copy)
		InExperienceInterventionAnalyticsModule.sendAnalyticsEvent(InExperienceInterventionAnalyticsModule.Constants.EventTypes.ToastMessageReceived, InExperienceInterventionAnalyticsModule.Constants.InterventionTypes.Nudge, DateTime.now().UnixTimestampMillis, p1.decisionEventId, p1.evidence, p1.timeoutDurationSeconds)
	end
}
local InExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local Parent = InExperienceIntervention.Parent
local Constants = require(Parent.InterventionShared).Utils.Constants
local ExperienceChatInterventionShownSignal = require(Parent.InterventionShared).Signals.experienceChatInterventionShownSignal
local FFlagExpChatDictationStopOnSafetyIntervention = require(Parent.SharedFlags).FFlagExpChatDictationStopOnSafetyIntervention
local _ = require(InExperienceIntervention.Utils.Types)
local InExperienceInterventionAnalyticsModule = require(InExperienceIntervention.InExperienceInterventionAnalytics)

return {
	configName = "ChatTimeout",
	shouldTriggerVisualTreatment = function(p1): boolean --[[ Line: 14 ]]
		-- upvalues: Constants (copy)
		return p1.type == Constants.NotificationDialogType.ChatTimeout and p1.abuseVector == Constants.AbuseVectorType.ExperienceChat and not p1.acknowledgeable
	end,
	shouldTriggerBehavioralTreatment = function(p1): boolean --[[ Line: 19 ]]
		-- upvalues: Constants (copy)
		return p1.type == Constants.NotificationDialogType.ChatTimeout and p1.abuseVector == Constants.AbuseVectorType.ExperienceChat
	end,
	shouldTriggerEventReceived = function(p1): boolean --[[ Line: 23 ]]
		-- upvalues: Constants (copy)
		return p1.type == Constants.NotificationDialogType.ChatTimeout and p1.abuseVector == Constants.AbuseVectorType.ExperienceChat
	end,
	onTriggerVisualTreatment = function(Callback: (any) -> (), Detail) --[[ Line: 27 ]]
		-- upvalues: Constants (copy), FFlagExpChatDictationStopOnSafetyIntervention (copy), ExperienceChatInterventionShownSignal (copy)
		Callback({
			isShown = true,
			type = Constants.UIStateActions.ToggleNotificationDialog,
			treatmentType = Constants.TreatmentType.ChatTimeoutDialog,
			detail = Detail
		})
		
		if FFlagExpChatDictationStopOnSafetyIntervention then
			ExperienceChatInterventionShownSignal:fire()
		end
	end,
	onTriggerBehavioralTreatment = function(_) --[[ Line: 38 ]] end,
	onTriggerEventReceived = function(p1) --[[ Line: 41 ]]
		-- upvalues: InExperienceInterventionAnalyticsModule (copy)
		InExperienceInterventionAnalyticsModule.sendAnalyticsEvent(InExperienceInterventionAnalyticsModule.Constants.EventTypes.ModalMessageReceived, InExperienceInterventionAnalyticsModule.Constants.InterventionTypes.Timeout, DateTime.now().UnixTimestampMillis, p1.decisionEventId, p1.evidence, p1.timeoutDurationSeconds)
	end
}
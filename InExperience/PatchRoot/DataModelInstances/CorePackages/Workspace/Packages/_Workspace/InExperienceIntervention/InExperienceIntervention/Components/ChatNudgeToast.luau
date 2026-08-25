local inExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local parent = inExperienceIntervention.Parent
local reactModule = require(parent.React)
local constants = require(parent.InterventionShared).Utils.Constants
local useLocalization = require(parent.Localization).Hooks.useLocalization
local inExperienceInterventionAnalyticsModule = require(inExperienceIntervention.InExperienceInterventionAnalytics)
local chatInterventionGenericToastModule = require(inExperienceIntervention.Components.ChatInterventionGenericToast)

function ChatNudgeToast(p0)
	-- upvalues: useLocalization (ref), constants (ref), reactModule (ref), chatInterventionGenericToastModule (ref), inExperienceInterventionAnalyticsModule (ref)
	local var4 = useLocalization(constants.localizationKeys)
	
	return reactModule.createElement(chatInterventionGenericToastModule, {
		eventId = p0.eventId,
		violatingChatLine = p0.violatingChatLine,
		toastTitle = var4.ChatBreaksRulesText,
		toastBody = var4.TextChatMayBeSuspendedText,
		interventionType = inExperienceInterventionAnalyticsModule.Constants.InterventionTypes.Nudge,
		toastAppearEventName = inExperienceInterventionAnalyticsModule.Constants.EventTypes.NudgeToastAppeared,
		toastDismissEventName = inExperienceInterventionAnalyticsModule.Constants.EventTypes.NudgeToastDismissed
	})
end

return ChatNudgeToast
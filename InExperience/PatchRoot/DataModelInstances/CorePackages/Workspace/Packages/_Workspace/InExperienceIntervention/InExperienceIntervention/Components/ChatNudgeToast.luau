local InExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local Parent = InExperienceIntervention.Parent
local ReactModule = require(Parent.React)
local Constants = require(Parent.InterventionShared).Utils.Constants
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local InExperienceInterventionAnalyticsModule = require(InExperienceIntervention.InExperienceInterventionAnalytics)
local ChatInterventionGenericToastModule = require(InExperienceIntervention.Components.ChatInterventionGenericToast)

function ChatNudgeToast(p1)
	-- upvalues: UseLocalizationFunction (copy), Constants (copy), ReactModule (copy), ChatInterventionGenericToastModule (copy), InExperienceInterventionAnalyticsModule (copy)
	local UseLocalizationResult = UseLocalizationFunction(Constants.localizationKeys)
	
	return ReactModule.createElement(ChatInterventionGenericToastModule, {
		eventId = p1.eventId,
		violatingChatLine = p1.violatingChatLine,
		toastTitle = UseLocalizationResult.ChatBreaksRulesText,
		toastBody = UseLocalizationResult.TextChatMayBeSuspendedText,
		interventionType = InExperienceInterventionAnalyticsModule.Constants.InterventionTypes.Nudge,
		toastAppearEventName = InExperienceInterventionAnalyticsModule.Constants.EventTypes.NudgeToastAppeared,
		toastDismissEventName = InExperienceInterventionAnalyticsModule.Constants.EventTypes.NudgeToastDismissed
	})
end

return ChatNudgeToast
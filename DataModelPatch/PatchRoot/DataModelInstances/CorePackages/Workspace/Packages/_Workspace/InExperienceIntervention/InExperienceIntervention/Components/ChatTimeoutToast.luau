local InExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local Parent = InExperienceIntervention.Parent
local ReactModule = require(Parent.React)
local Constants = require(Parent.InterventionShared).Utils.Constants
local InExperienceInterventionAnalyticsModule = require(InExperienceIntervention.InExperienceInterventionAnalytics)
local ChatInterventionGenericToastModule = require(InExperienceIntervention.Components.ChatInterventionGenericToast)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local DetermineToastDurationFunction = require(Parent.InterventionShared).Utils.determineToastDuration

function ChatTimeoutToast(p1)
	-- upvalues: ReactModule (copy), UseLocalizationFunction (copy), Constants (copy), DetermineToastDurationFunction (copy), ChatInterventionGenericToastModule (copy), InExperienceInterventionAnalyticsModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseLocalizationResult = UseLocalizationFunction({
		cannotSend1MinText = Constants.localizationKeys.CannotSend1MinText,
		beRespectfulText = Constants.localizationKeys.BeRespectfulText
	})
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseStateResult2 (copy)
		if p1.endTime then
			UseStateResult2((math.ceil((p1.endTime - DateTime.now().UnixTimestamp) / 60)))
		end
	end, { p1.endTime, p1.dispatchTimestamp })
	
	return ReactModule.createElement(ChatInterventionGenericToastModule, {
		toastTitle = DetermineToastDurationFunction(UseStateResult),
		toastBody = UseLocalizationResult.beRespectfulText,
		interventionType = InExperienceInterventionAnalyticsModule.Constants.InterventionTypes.Timeout,
		remainingDurationSec = UseStateResult,
		toastAppearEventName = InExperienceInterventionAnalyticsModule.Constants.EventTypes.ChatAttemptToastAppeared,
		toastDismissEventName = InExperienceInterventionAnalyticsModule.Constants.EventTypes.ChatAttemptToastDismissed
	})
end

return ChatTimeoutToast
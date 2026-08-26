local inExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local parent = inExperienceIntervention.Parent
local reactModule = require(parent.React)
local constants = require(parent.InterventionShared).Utils.Constants
local inExperienceInterventionAnalyticsModule = require(inExperienceIntervention.InExperienceInterventionAnalytics)
local chatInterventionGenericToastModule = require(inExperienceIntervention.Components.ChatInterventionGenericToast)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local determineToastDuration = require(parent.InterventionShared).Utils.determineToastDuration

function ChatTimeoutToast(p1)
	-- upvalues: reactModule (ref), useLocalization (ref), constants (ref), determineToastDuration (ref), chatInterventionGenericToastModule (ref), inExperienceInterventionAnalyticsModule (ref)
	local var1, var2 = reactModule.useState(0)
	local var3 = useLocalization({
		cannotSend1MinText = constants.localizationKeys.CannotSend1MinText,
		beRespectfulText = constants.localizationKeys.BeRespectfulText
	})
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var2 (ref)
		if p1.endTime then
			var2(math.ceil((p1.endTime - DateTime.now().UnixTimestamp) / 60))
		end
	end, { p1.endTime, p1.dispatchTimestamp })
	
	return reactModule.createElement(chatInterventionGenericToastModule, {
		toastTitle = determineToastDuration(var1),
		toastBody = var3.beRespectfulText,
		interventionType = inExperienceInterventionAnalyticsModule.Constants.InterventionTypes.Timeout,
		remainingDurationSec = var1,
		toastAppearEventName = inExperienceInterventionAnalyticsModule.Constants.EventTypes.ChatAttemptToastAppeared,
		toastDismissEventName = inExperienceInterventionAnalyticsModule.Constants.EventTypes.ChatAttemptToastDismissed
	})
end

return ChatTimeoutToast
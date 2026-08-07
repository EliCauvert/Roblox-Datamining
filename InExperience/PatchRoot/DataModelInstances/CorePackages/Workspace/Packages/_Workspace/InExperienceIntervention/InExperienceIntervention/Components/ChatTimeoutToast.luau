local inExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local parent = inExperienceIntervention.Parent
local reactModule = require(parent.React)
local constants = require(parent.InterventionShared).Utils.Constants
local inExperienceInterventionAnalyticsModule = require(inExperienceIntervention.InExperienceInterventionAnalytics)
local chatInterventionGenericToastModule = require(inExperienceIntervention.Components.ChatInterventionGenericToast)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local determineToastDuration = require(parent.InterventionShared).Utils.determineToastDuration

function ChatTimeoutToast(p0) --[[ line: 21 ]]
	-- upvalues: reactModule (ref), useLocalization (ref), constants (ref), determineToastDuration (ref), chatInterventionGenericToastModule (ref), inExperienceInterventionAnalyticsModule (ref)
	local var4, var5 = reactModule.useState(0)
	local var6 = useLocalization({
		cannotSend1MinText = constants.localizationKeys.CannotSend1MinText,
		beRespectfulText = constants.localizationKeys.BeRespectfulText
	})
	reactModule.useEffect(function() --[[ line: 29 ]]
		-- upvalues: p0 (ref), var5 (ref)
		if p0.endTime then
			var5(math.ceil((p0.endTime - DateTime.now().UnixTimestamp) / 60))
		end
	end, { p0.endTime, p0.dispatchTimestamp })
	
	return reactModule.createElement(chatInterventionGenericToastModule, {
		toastTitle = determineToastDuration(var4),
		toastBody = var6.beRespectfulText,
		interventionType = inExperienceInterventionAnalyticsModule.Constants.InterventionTypes.Timeout,
		remainingDurationSec = var4,
		toastAppearEventName = inExperienceInterventionAnalyticsModule.Constants.EventTypes.ChatAttemptToastAppeared,
		toastDismissEventName = inExperienceInterventionAnalyticsModule.Constants.EventTypes.ChatAttemptToastDismissed
	})
end

return ChatTimeoutToast
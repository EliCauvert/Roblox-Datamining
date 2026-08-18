local inExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local parent = inExperienceIntervention.Parent
local IXPService = game:GetService("IXPService")
local localizationService = game:GetService("LocalizationService")
local reactModule = require(parent.React)
local appUserLayers = require(parent.ExperimentLayers).AppUserLayers
local genericInterventionDialog = require(parent.InterventionShared).Components.GenericInterventionDialog
local useLocalization = require(parent.Localization).Hooks.useLocalization
local interventionAnalytics = require(parent.InterventionShared).InterventionAnalytics
local useParsedBadUtterances = require(parent.InterventionShared).Hooks.useParsedBadUtterances
local var4 = require(parent.RobloxAppLocales).Localization.new(localizationService.RobloxLocaleId)
local fFlagNotApprovedPageIXPExposure = require(parent.SharedFlags).FFlagNotApprovedPageIXPExposure
local constants = require(parent.InterventionShared).Utils.Constants
local _ = require(inExperienceIntervention.Utils.Types)

return reactModule.memo(function(p0) --[[ line: 31 | named "ChatNudgeCustomDialogV2" ]]
	-- upvalues: useLocalization (ref), constants (ref), reactModule (ref), fFlagNotApprovedPageIXPExposure (ref), IXPService (ref), appUserLayers (ref), useParsedBadUtterances (ref), var4 (ref), genericInterventionDialog (ref), interventionAnalytics (ref)
	local var5 = useLocalization(constants.localizationKeys)
	reactModule.useEffect(function() --[[ line: 34 ]]
		-- upvalues: fFlagNotApprovedPageIXPExposure (copy), IXPService (copy), appUserLayers (copy)
		if fFlagNotApprovedPageIXPExposure and game:GetEngineFeature("EnableLogFlagLinkedUserLayerExposure") then
			IXPService:LogFlagLinkedUserLayerExposure(appUserLayers.NotApprovedPageUserIDLayer)
		end
	end, {})
	local moderationDetail = p0.moderationDetail
	local consequenceTransparencyMessage = moderationDetail.consequenceTransparencyMessage
	local interventionId = moderationDetail.interventionId
	local acknowledgeable = moderationDetail.acknowledgeable
	local var6 = useParsedBadUtterances(moderationDetail.badUtterances or {})
	local joined = table.concat(var6.textItems, "\n")
	local joined_1 = table.concat(var6.abuseTypes, ", ")
	
	if joined_1 == "" then
		joined_1 = var4:Format("Feature.NotApproved.Label.AbuseType.Other")
	end
	return reactModule.createElement(genericInterventionDialog, {
		isAppealable = true,
		titleText = var5.ChatBreaksRulesText,
		bodyText = var5.TextChatMayBeSuspendedText,
		evidence = joined,
		violationReason = joined_1,
		onDismiss = p0.onDismiss,
		dsaMessage = consequenceTransparencyMessage,
		interventionId = interventionId,
		acknowledgeable = acknowledgeable,
		eventId = interventionId,
		interventionTypeForAnalytics = interventionAnalytics.Constants.InterventionTypes.Nudge
	})
end)
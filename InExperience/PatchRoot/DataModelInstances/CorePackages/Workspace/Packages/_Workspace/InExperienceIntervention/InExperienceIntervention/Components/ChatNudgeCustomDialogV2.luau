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
local var1 = require(parent.RobloxAppLocales).Localization.new(localizationService.RobloxLocaleId)
local fFlagNotApprovedPageIXPExposure = require(parent.SharedFlags).FFlagNotApprovedPageIXPExposure
local fFlagScopeBadUtterancePlayerNameToChatDialogsModule = require(parent.InterventionShared.FFlagScopeBadUtterancePlayerNameToChatDialogs)
local constants = require(parent.InterventionShared).Utils.Constants
local _ = require(inExperienceIntervention.Utils.Types)

return reactModule.memo(function(p1)
	-- upvalues: useLocalization (ref), constants (ref), reactModule (ref), fFlagNotApprovedPageIXPExposure (ref), IXPService (ref), appUserLayers (ref), useParsedBadUtterances (ref), fFlagScopeBadUtterancePlayerNameToChatDialogsModule (ref), var1 (ref), genericInterventionDialog (ref), interventionAnalytics (ref)
	local var2 = useLocalization(constants.localizationKeys)
	reactModule.useEffect(function()
		-- upvalues: fFlagNotApprovedPageIXPExposure (copy), IXPService (copy), appUserLayers (copy)
		if fFlagNotApprovedPageIXPExposure and game:GetEngineFeature("EnableLogFlagLinkedUserLayerExposure") then
			IXPService:LogFlagLinkedUserLayerExposure(appUserLayers.NotApprovedPageUserIDLayer)
		end
	end, {})
	local moderationDetail = p1.moderationDetail
	local consequenceTransparencyMessage = moderationDetail.consequenceTransparencyMessage
	local interventionId = moderationDetail.interventionId
	local acknowledgeable = moderationDetail.acknowledgeable
	local var3 = useParsedBadUtterances(moderationDetail.badUtterances or {}, {
		shouldAddPlayerName = fFlagScopeBadUtterancePlayerNameToChatDialogsModule
	})
	local joined = table.concat(var3.textItems, "\n")
	local joined_1 = table.concat(var3.abuseTypes, ", ")
	
	if joined_1 == "" then
		joined_1 = var1:Format("Feature.NotApproved.Label.AbuseType.Other")
	end
	return reactModule.createElement(genericInterventionDialog, {
		isAppealable = true,
		titleText = var2.ChatBreaksRulesText,
		bodyText = var2.TextChatMayBeSuspendedText,
		evidence = joined,
		violationReason = joined_1,
		onDismiss = p1.onDismiss,
		dsaMessage = consequenceTransparencyMessage,
		interventionId = interventionId,
		acknowledgeable = acknowledgeable,
		eventId = interventionId,
		interventionTypeForAnalytics = interventionAnalytics.Constants.InterventionTypes.Nudge
	})
end)
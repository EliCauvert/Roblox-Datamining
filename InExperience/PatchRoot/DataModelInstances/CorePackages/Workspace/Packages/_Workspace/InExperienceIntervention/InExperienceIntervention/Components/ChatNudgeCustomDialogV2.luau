local InExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local Parent = InExperienceIntervention.Parent
local IXPService = game:GetService("IXPService")
local ReactModule = require(Parent.React)
local AppUserLayers = require(Parent.ExperimentLayers).AppUserLayers
local GenericInterventionDialog = require(Parent.InterventionShared).Components.GenericInterventionDialog
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local InterventionAnalytics = require(Parent.InterventionShared).InterventionAnalytics
local UseParsedBadUtterancesFunction = require(Parent.InterventionShared).Hooks.useParsedBadUtterances
local NewResult = require(Parent.RobloxAppLocales).Localization.new(game:GetService("LocalizationService").RobloxLocaleId)
local FFlagNotApprovedPageIXPExposure = require(Parent.SharedFlags).FFlagNotApprovedPageIXPExposure
local FFlagScopeBadUtterancePlayerNameToChatDialogsModule = require(Parent.InterventionShared.FFlagScopeBadUtterancePlayerNameToChatDialogs)
local Constants = require(Parent.InterventionShared).Utils.Constants
local _ = require(InExperienceIntervention.Utils.Types)

return ReactModule.memo(function(p1)
	-- upvalues: UseLocalizationFunction (copy), Constants (copy), ReactModule (copy), FFlagNotApprovedPageIXPExposure (copy), IXPService (copy), AppUserLayers (copy), UseParsedBadUtterancesFunction (copy), FFlagScopeBadUtterancePlayerNameToChatDialogsModule (copy), NewResult (copy), GenericInterventionDialog (copy), InterventionAnalytics (copy)
	local UseLocalizationResult = UseLocalizationFunction(Constants.localizationKeys)
	ReactModule.useEffect(function()
		-- upvalues: FFlagNotApprovedPageIXPExposure (upval), IXPService (upval), AppUserLayers (upval)
		if FFlagNotApprovedPageIXPExposure and game:GetEngineFeature("EnableLogFlagLinkedUserLayerExposure") then
			IXPService:LogFlagLinkedUserLayerExposure(AppUserLayers.NotApprovedPageUserIDLayer)
		end
	end, {})
	local ModerationDetail = p1.moderationDetail
	local ConsequenceTransparencyMessage = ModerationDetail.consequenceTransparencyMessage
	local InterventionId = ModerationDetail.interventionId
	local Acknowledgeable = ModerationDetail.acknowledgeable
	local UseParsedBadUtterancesResult = UseParsedBadUtterancesFunction(ModerationDetail.badUtterances or {}, {
		shouldAddPlayerName = FFlagScopeBadUtterancePlayerNameToChatDialogsModule
	})
	local Joined = table.concat(UseParsedBadUtterancesResult.textItems, "\n")
	local Joined1 = table.concat(UseParsedBadUtterancesResult.abuseTypes, ", ")
	
	if Joined1 == "" then
		Joined1 = NewResult:Format("Feature.NotApproved.Label.AbuseType.Other")
	end
	return ReactModule.createElement(GenericInterventionDialog, {
		isAppealable = true,
		titleText = UseLocalizationResult.ChatBreaksRulesText,
		bodyText = UseLocalizationResult.TextChatMayBeSuspendedText,
		evidence = Joined,
		violationReason = Joined1,
		onDismiss = p1.onDismiss,
		dsaMessage = ConsequenceTransparencyMessage,
		interventionId = InterventionId,
		acknowledgeable = Acknowledgeable,
		eventId = InterventionId,
		interventionTypeForAnalytics = InterventionAnalytics.Constants.InterventionTypes.Nudge
	})
end)
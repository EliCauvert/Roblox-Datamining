local InExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local Parent = InExperienceIntervention.Parent
local IXPService = game:GetService("IXPService")
local ReactModule = require(Parent.React)
local AppUserLayers = require(Parent.ExperimentLayers).AppUserLayers
local GenericInterventionDialog = require(Parent.InterventionShared).Components.GenericInterventionDialog
local UseTimeoutInfoBindingFunction = require(Parent.InterventionShared).Hooks.useTimeoutInfoBinding
local InterventionAnalytics = require(Parent.InterventionShared).InterventionAnalytics
local UseParsedBadUtterancesFunction = require(Parent.InterventionShared).Hooks.useParsedBadUtterances
local NewResult = require(Parent.RobloxAppLocales).Localization.new(game:GetService("LocalizationService").RobloxLocaleId)
local FFlagNotApprovedPageIXPExposure = require(Parent.SharedFlags).FFlagNotApprovedPageIXPExposure
local FFlagScopeBadUtterancePlayerNameToChatDialogsModule = require(Parent.InterventionShared.FFlagScopeBadUtterancePlayerNameToChatDialogs)
local _ = require(InExperienceIntervention.Utils.Types)

return ReactModule.memo(function(p1) --[[ Line: 36 | Named "ChatTimeoutCustomDialogV2" ]]
	-- upvalues: ReactModule (copy), FFlagNotApprovedPageIXPExposure (copy), IXPService (copy), AppUserLayers (copy), UseTimeoutInfoBindingFunction (copy), UseParsedBadUtterancesFunction (copy), FFlagScopeBadUtterancePlayerNameToChatDialogsModule (copy), NewResult (copy), GenericInterventionDialog (copy), InterventionAnalytics (copy)
	local ModerationDetail = p1.moderationDetail
	ReactModule.useEffect(function() --[[ Line: 39 ]]
		-- upvalues: FFlagNotApprovedPageIXPExposure (upval), IXPService (upval), AppUserLayers (upval)
		if FFlagNotApprovedPageIXPExposure and game:GetEngineFeature("EnableLogFlagLinkedUserLayerExposure") then
			IXPService:LogFlagLinkedUserLayerExposure(AppUserLayers.NotApprovedPageUserIDLayer)
		end
	end, {})
	local UseTimeoutInfoBindingResult = UseTimeoutInfoBindingFunction(ModerationDetail.endDate, ModerationDetail.duration)
	local Heading = UseTimeoutInfoBindingResult.heading
	local Description = UseTimeoutInfoBindingResult.description
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
		titleText = Heading:map(function(p2) --[[ Line: 66 ]]
			return p2
		end),
		bodyText = Description:map(function(p2) --[[ Line: 70 ]]
			return p2
		end),
		evidence = Joined,
		violationReason = Joined1,
		onDismiss = p1.onDismiss,
		dsaMessage = ConsequenceTransparencyMessage,
		interventionId = InterventionId,
		acknowledgeable = Acknowledgeable,
		eventId = InterventionId,
		durationForAnalytics = ModerationDetail.duration / 1000000000,
		interventionTypeForAnalytics = InterventionAnalytics.Constants.InterventionTypes.Timeout
	})
end)
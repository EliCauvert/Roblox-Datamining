local inExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local parent = inExperienceIntervention.Parent
local IXPService = game:GetService("IXPService")
local localizationService = game:GetService("LocalizationService")
local reactModule = require(parent.React)
local appUserLayers = require(parent.ExperimentLayers).AppUserLayers
local genericInterventionDialog = require(parent.InterventionShared).Components.GenericInterventionDialog
local useTimeoutInfoBinding = require(parent.InterventionShared).Hooks.useTimeoutInfoBinding
local interventionAnalytics = require(parent.InterventionShared).InterventionAnalytics
local useParsedBadUtterances = require(parent.InterventionShared).Hooks.useParsedBadUtterances
local var1 = require(parent.RobloxAppLocales).Localization.new(localizationService.RobloxLocaleId)
local fFlagNotApprovedPageIXPExposure = require(parent.SharedFlags).FFlagNotApprovedPageIXPExposure
local fFlagScopeBadUtterancePlayerNameToChatDialogsModule = require(parent.InterventionShared.FFlagScopeBadUtterancePlayerNameToChatDialogs)
local _ = require(inExperienceIntervention.Utils.Types)

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), fFlagNotApprovedPageIXPExposure (ref), IXPService (ref), appUserLayers (ref), useTimeoutInfoBinding (ref), useParsedBadUtterances (ref), fFlagScopeBadUtterancePlayerNameToChatDialogsModule (ref), var1 (ref), genericInterventionDialog (ref), interventionAnalytics (ref)
	local moderationDetail = p1.moderationDetail
	reactModule.useEffect(function()
		-- upvalues: fFlagNotApprovedPageIXPExposure (copy), IXPService (copy), appUserLayers (copy)
		if fFlagNotApprovedPageIXPExposure and game:GetEngineFeature("EnableLogFlagLinkedUserLayerExposure") then
			IXPService:LogFlagLinkedUserLayerExposure(appUserLayers.NotApprovedPageUserIDLayer)
		end
	end, {})
	local var2 = useTimeoutInfoBinding(moderationDetail.endDate, moderationDetail.duration)
	local heading = var2.heading
	local description = var2.description
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
		titleText = heading:map(function(p2)
			return p2
		end),
		bodyText = description:map(function(p2)
			return p2
		end),
		evidence = joined,
		violationReason = joined_1,
		onDismiss = p1.onDismiss,
		dsaMessage = consequenceTransparencyMessage,
		interventionId = interventionId,
		acknowledgeable = acknowledgeable,
		eventId = interventionId,
		durationForAnalytics = moderationDetail.duration / 1000000000,
		interventionTypeForAnalytics = interventionAnalytics.Constants.InterventionTypes.Timeout
	})
end)
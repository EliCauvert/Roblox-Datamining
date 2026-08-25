local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsReactModule = require(parent.SignalsReact)
local useOpenWebView = require(parent.WebViewUtils).useOpenWebView
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local _ = require(script.Parent.PublishConfigurationContentView)
local experienceGuidelinesModule = require(parent.DataHydration.ExperienceGuidelines)
local universeActivationModule = require(parent.DataHydration.UniverseActivation)
local contentMaturityUtilsModule = require(buildExperience.utils.ContentMaturityUtils)
local gameConfigurationActionsModule = require(buildExperience.utils.GameConfigurationActions)
local gameConfigurationLabelsModule = require(buildExperience.utils.GameConfigurationLabels)
local refreshPublishEligibilityModule = require(buildExperience.utils.refreshPublishEligibility)
local fFlagMyStatsMediaSelector = sharedFlagsModule.FFlagMyStatsMediaSelector
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local fFlagEnableProvisionalRatingModule = require(buildExperience.Flags.FFlagEnableProvisionalRating)
local fFlagBuildRehydrateOnPublishModule = require(buildExperience.Flags.FFlagBuildRehydrateOnPublish)

return function(p0)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), useOpenWebView (ref), experienceGuidelinesModule (ref), reactModule (ref), signalsReactModule (ref), fFlagEnableProvisionalRatingModule (ref), universeActivationModule (ref), contentMaturityUtilsModule (ref), fFlagBuildRehydrateOnPublishModule (ref), gameConfigurationLabelsModule (ref), gameConfigurationActionsModule (ref), refreshPublishEligibilityModule (ref), fFlagMyStatsMediaSelector (ref)
	local GAME_CONFIGURATION_CREATOR_HUB, GAME_CONFIGURATION_LOADING, GAME_CONFIGURATION_QUESTIONNAIRE_REQUIRED_BANNER
	local var13 = if fFlagBuildLocalization then useLocalization({
		creatorHub = localizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB,
		loading = localizationStringsModule.GAME_CONFIGURATION_LOADING,
		questionnaireRequiredBanner = localizationStringsModule.GAME_CONFIGURATION_QUESTIONNAIRE_REQUIRED_BANNER
	}) else nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		GAME_CONFIGURATION_CREATOR_HUB = var13.creatorHub
		GAME_CONFIGURATION_LOADING = var13.loading
		GAME_CONFIGURATION_QUESTIONNAIRE_REQUIRED_BANNER = var13.questionnaireRequiredBanner
	else
		GAME_CONFIGURATION_CREATOR_HUB = localizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB
		GAME_CONFIGURATION_LOADING = localizationStringsModule.GAME_CONFIGURATION_LOADING
		GAME_CONFIGURATION_QUESTIONNAIRE_REQUIRED_BANNER = localizationStringsModule.GAME_CONFIGURATION_QUESTIONNAIRE_REQUIRED_BANNER
	end
	local var14 = useOpenWebView()
	local experienceGuidelinesStore = experienceGuidelinesModule.getExperienceGuidelinesStore()
	local var16 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: experienceGuidelinesStore (ref), p0 (ref)
		return experienceGuidelinesStore.getAndFetchDetailedGuidelines(p0.universeId)
	end, { experienceGuidelinesStore, p0.universeId }).data)
	local var17 = nil
	local var18 = nil
	local var19 = false
	
	if fFlagEnableProvisionalRatingModule then
		local universeActivationStore = universeActivationModule.getUniverseActivationStore()
		local var21 = signalsReactModule.useSignalState(reactModule.useMemo(function()
			-- upvalues: universeActivationStore (ref), p0 (ref)
			return universeActivationStore.getAndFetchEligibility(p0.universeId)
		end, { universeActivationStore, p0.universeId }).data)
		local var22 = contentMaturityUtilsModule.isContentUnrated(p0.universeId)
		local var23 = contentMaturityUtilsModule.isSealBroken(p0.universeId)
		var18 = if var21 then var21.provisionalRating else nil
		var19 = var22 and (not fFlagBuildRehydrateOnPublishModule or not var23)
		
		if var23 and var22 then
			var17 = GAME_CONFIGURATION_QUESTIONNAIRE_REQUIRED_BANNER
		end
	end
	return {
		buildMaturityBannerText = var17,
		contentMaturityText = gameConfigurationLabelsModule.getContentMaturityText(var16, var18, var19) or GAME_CONFIGURATION_LOADING,
		onOpenIconAndThumbnails = if fFlagMyStatsMediaSelector then p0.onOpenMediaSelectionPage else reactModule.useCallback(function()
			-- upvalues: var14 (ref), gameConfigurationActionsModule (copy), p0 (ref), GAME_CONFIGURATION_CREATOR_HUB (write)
			var14(gameConfigurationActionsModule.getCreatorHubConfigureUrl(p0.universeId), GAME_CONFIGURATION_CREATOR_HUB)
		end, { GAME_CONFIGURATION_CREATOR_HUB, var14, p0.universeId }),
		onOpenTitleDescriptionPage = p0.onOpenTitleDescriptionPage,
		onOpenContentMaturity = reactModule.useCallback(function()
			-- upvalues: var14 (ref), gameConfigurationActionsModule (copy), p0 (ref), GAME_CONFIGURATION_CREATOR_HUB (write), refreshPublishEligibilityModule (copy)
			var14(gameConfigurationActionsModule.getExperienceQuestionnaireUrl(p0.universeId), GAME_CONFIGURATION_CREATOR_HUB, function()
				-- upvalues: refreshPublishEligibilityModule (copy), p0 (copy)
				refreshPublishEligibilityModule(p0.universeId)
			end)
		end, { GAME_CONFIGURATION_CREATOR_HUB, var14, p0.universeId }),
		onOpenVersionTitleDescriptionPage = p0.onOpenVersionTitleDescriptionPage,
		onOpenVersionHistory = p0.onOpenVersionHistory,
		showVersionTitleDescription = fFlagEnableProvisionalRatingModule,
		layoutOrder = p0.layoutOrder,
		testId = p0.testId
	}
end
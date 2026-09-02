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
local fFlagBuildRehydrateOnPublishModule = require(buildExperience.Flags.FFlagBuildRehydrateOnPublish)

return function(p1)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), useOpenWebView (ref), experienceGuidelinesModule (ref), reactModule (ref), signalsReactModule (ref), universeActivationModule (ref), contentMaturityUtilsModule (ref), fFlagBuildRehydrateOnPublishModule (ref), gameConfigurationLabelsModule (ref), gameConfigurationActionsModule (ref), refreshPublishEligibilityModule (ref), fFlagMyStatsMediaSelector (ref)
	local GAME_CONFIGURATION_CREATOR_HUB, GAME_CONFIGURATION_LOADING, GAME_CONFIGURATION_QUESTIONNAIRE_REQUIRED_BANNER
	local var1 = if fFlagBuildLocalization then useLocalization({
		creatorHub = localizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB,
		loading = localizationStringsModule.GAME_CONFIGURATION_LOADING,
		questionnaireRequiredBanner = localizationStringsModule.GAME_CONFIGURATION_QUESTIONNAIRE_REQUIRED_BANNER
	}) else nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		GAME_CONFIGURATION_CREATOR_HUB = var1.creatorHub
		GAME_CONFIGURATION_LOADING = var1.loading
		GAME_CONFIGURATION_QUESTIONNAIRE_REQUIRED_BANNER = var1.questionnaireRequiredBanner
	else
		GAME_CONFIGURATION_CREATOR_HUB = localizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB
		GAME_CONFIGURATION_LOADING = localizationStringsModule.GAME_CONFIGURATION_LOADING
		GAME_CONFIGURATION_QUESTIONNAIRE_REQUIRED_BANNER = localizationStringsModule.GAME_CONFIGURATION_QUESTIONNAIRE_REQUIRED_BANNER
	end
	local var2 = useOpenWebView()
	local experienceGuidelinesStore = experienceGuidelinesModule.getExperienceGuidelinesStore()
	local var3 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: experienceGuidelinesStore (ref), p1 (ref)
		return experienceGuidelinesStore.getAndFetchDetailedGuidelines(p1.universeId)
	end, { experienceGuidelinesStore, p1.universeId }).data)
	local var4 = nil
	local _ = nil
	local _ = false
	local universeActivationStore = universeActivationModule.getUniverseActivationStore()
	local var5 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: universeActivationStore (ref), p1 (ref)
		return universeActivationStore.getAndFetchEligibility(p1.universeId)
	end, { universeActivationStore, p1.universeId }).data)
	local var6 = contentMaturityUtilsModule.isContentUnrated(p1.universeId)
	local var7 = contentMaturityUtilsModule.isSealBroken(p1.universeId)
	local var8 = if var5 then var5.provisionalRating else nil
	local var9 = var6 and (not fFlagBuildRehydrateOnPublishModule or not var7)
	
	if var7 and var6 then
		var4 = GAME_CONFIGURATION_QUESTIONNAIRE_REQUIRED_BANNER
	end
	return {
		buildMaturityBannerText = var4,
		contentMaturityText = gameConfigurationLabelsModule.getContentMaturityText(var3, var8, var9) or GAME_CONFIGURATION_LOADING,
		onOpenIconAndThumbnails = if fFlagMyStatsMediaSelector then p1.onOpenMediaSelectionPage else reactModule.useCallback(function()
			-- upvalues: var2 (ref), gameConfigurationActionsModule (copy), p1 (ref), GAME_CONFIGURATION_CREATOR_HUB (write)
			var2(gameConfigurationActionsModule.getCreatorHubConfigureUrl(p1.universeId), GAME_CONFIGURATION_CREATOR_HUB)
		end, { GAME_CONFIGURATION_CREATOR_HUB, var2, p1.universeId }),
		onOpenTitleDescriptionPage = p1.onOpenTitleDescriptionPage,
		onOpenContentMaturity = reactModule.useCallback(function()
			-- upvalues: var2 (ref), gameConfigurationActionsModule (copy), p1 (ref), GAME_CONFIGURATION_CREATOR_HUB (write), refreshPublishEligibilityModule (copy)
			var2(gameConfigurationActionsModule.getExperienceQuestionnaireUrl(p1.universeId), GAME_CONFIGURATION_CREATOR_HUB, function()
				-- upvalues: refreshPublishEligibilityModule (copy), p1 (copy)
				refreshPublishEligibilityModule(p1.universeId)
			end)
		end, { GAME_CONFIGURATION_CREATOR_HUB, var2, p1.universeId }),
		onOpenVersionTitleDescriptionPage = p1.onOpenVersionTitleDescriptionPage,
		onOpenVersionHistory = p1.onOpenVersionHistory,
		layoutOrder = p1.layoutOrder,
		testId = p1.testId
	}
end
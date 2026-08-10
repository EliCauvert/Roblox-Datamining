local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsReactModule = require(parent.SignalsReact)
local useOpenWebView = require(parent.WebViewUtils).useOpenWebView
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local _ = require(script.Parent.PublishConfigurationContentView)
local experienceGuidelinesModule = require(parent.DataHydration.ExperienceGuidelines)
local universeActivationModule = require(parent.DataHydration.UniverseActivation)
local contentMaturityUtilsModule = require(buildExperience.utils.ContentMaturityUtils)
local gameConfigurationActionsModule = require(buildExperience.utils.GameConfigurationActions)
local gameConfigurationLabelsModule = require(buildExperience.utils.GameConfigurationLabels)
local refreshPublishEligibilityModule = require(buildExperience.utils.refreshPublishEligibility)
local fFlagMyStatsMediaSelector = sharedFlagsModule.FFlagMyStatsMediaSelector
local fFlagEnableProvisionalRatingModule = require(buildExperience.Flags.FFlagEnableProvisionalRating)
local fFlagBuildRehydrateOnPublishModule = require(buildExperience.Flags.FFlagBuildRehydrateOnPublish)

return function(p0) --[[ line: 34 | named "usePublishConfigurationContentViewModel" ]]
	-- upvalues: useOpenWebView (ref), experienceGuidelinesModule (ref), reactModule (ref), signalsReactModule (ref), fFlagEnableProvisionalRatingModule (ref), universeActivationModule (ref), contentMaturityUtilsModule (ref), fFlagBuildRehydrateOnPublishModule (ref), localizationStringsModule (ref), gameConfigurationLabelsModule (ref), gameConfigurationActionsModule (ref), refreshPublishEligibilityModule (ref), fFlagMyStatsMediaSelector (ref)
	local var13 = useOpenWebView()
	local experienceGuidelinesStore = experienceGuidelinesModule.getExperienceGuidelinesStore()
	local var15 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 37 ]]
		-- upvalues: experienceGuidelinesStore (ref), p0 (ref)
		return experienceGuidelinesStore.getAndFetchDetailedGuidelines(p0.universeId)
	end, { experienceGuidelinesStore, p0.universeId }).data)
	local GAME_CONFIGURATION_QUESTIONNAIRE_REQUIRED_BANNER = nil
	local var16 = nil
	local var17 = false
	
	if fFlagEnableProvisionalRatingModule then
		local universeActivationStore = universeActivationModule.getUniverseActivationStore()
		local var19 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 48 ]]
			-- upvalues: universeActivationStore (ref), p0 (ref)
			return universeActivationStore.getAndFetchEligibility(p0.universeId)
		end, { universeActivationStore, p0.universeId }).data)
		local var20 = contentMaturityUtilsModule.isContentUnrated(p0.universeId)
		local var21 = contentMaturityUtilsModule.isSealBroken(p0.universeId)
		var16 = if var19 then var19.provisionalRating else nil
		var17 = var20 and (not fFlagBuildRehydrateOnPublishModule or not var21)
		
		if var21 and var20 then
			GAME_CONFIGURATION_QUESTIONNAIRE_REQUIRED_BANNER = localizationStringsModule.GAME_CONFIGURATION_QUESTIONNAIRE_REQUIRED_BANNER
		end
	end
	return {
		buildMaturityBannerText = GAME_CONFIGURATION_QUESTIONNAIRE_REQUIRED_BANNER,
		contentMaturityText = gameConfigurationLabelsModule.getContentMaturityText(var15, var16, var17) or localizationStringsModule.GAME_CONFIGURATION_LOADING,
		onOpenIconAndThumbnails = if fFlagMyStatsMediaSelector then p0.onOpenMediaSelectionPage else reactModule.useCallback(function() --[[ line: 69 ]]
			-- upvalues: var13 (ref), gameConfigurationActionsModule (copy), p0 (ref), localizationStringsModule (copy)
			var13(gameConfigurationActionsModule.getCreatorHubConfigureUrl(p0.universeId), localizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB)
		end, { var13, p0.universeId }),
		onOpenTitleDescriptionPage = p0.onOpenTitleDescriptionPage,
		onOpenContentMaturity = reactModule.useCallback(function() --[[ line: 76 ]]
			-- upvalues: var13 (ref), gameConfigurationActionsModule (copy), p0 (ref), localizationStringsModule (copy), refreshPublishEligibilityModule (copy)
			var13(gameConfigurationActionsModule.getExperienceQuestionnaireUrl(p0.universeId), localizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB, function() --[[ line: 80 ]]
				-- upvalues: refreshPublishEligibilityModule (copy), p0 (copy)
				refreshPublishEligibilityModule(p0.universeId)
			end)
		end, { var13, p0.universeId }),
		onOpenVersionTitleDescriptionPage = p0.onOpenVersionTitleDescriptionPage,
		onOpenVersionHistory = p0.onOpenVersionHistory,
		showVersionTitleDescription = fFlagEnableProvisionalRatingModule,
		layoutOrder = p0.layoutOrder,
		testId = p0.testId
	}
end
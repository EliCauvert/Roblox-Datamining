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

return function(p1)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), useOpenWebView (ref), experienceGuidelinesModule (ref), reactModule (ref), signalsReactModule (ref), universeActivationModule (ref), contentMaturityUtilsModule (ref), gameConfigurationLabelsModule (ref), gameConfigurationActionsModule (ref), refreshPublishEligibilityModule (ref), fFlagMyStatsMediaSelector (ref)
	local var1 = useLocalization({
		creatorHub = localizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB,
		loading = localizationStringsModule.GAME_CONFIGURATION_LOADING,
		questionnaireRequiredBanner = localizationStringsModule.GAME_CONFIGURATION_QUESTIONNAIRE_REQUIRED_BANNER
	})
	local creatorHub = var1.creatorHub
	local loading = var1.loading
	local questionnaireRequiredBanner = var1.questionnaireRequiredBanner
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
	local var9 = var6 and not var7
	
	if var7 and var6 then
		var4 = questionnaireRequiredBanner
	end
	return {
		buildMaturityBannerText = var4,
		contentMaturityText = gameConfigurationLabelsModule.getContentMaturityText(var3, var8, var9) or loading,
		onOpenIconAndThumbnails = if fFlagMyStatsMediaSelector then p1.onOpenMediaSelectionPage else reactModule.useCallback(function()
			-- upvalues: var2 (ref), gameConfigurationActionsModule (copy), p1 (ref), creatorHub (ref)
			var2(gameConfigurationActionsModule.getCreatorHubConfigureUrl(p1.universeId), creatorHub)
		end, { creatorHub, var2, p1.universeId }),
		onOpenTitleDescriptionPage = p1.onOpenTitleDescriptionPage,
		onOpenContentMaturity = reactModule.useCallback(function()
			-- upvalues: var2 (ref), gameConfigurationActionsModule (copy), p1 (ref), creatorHub (ref), refreshPublishEligibilityModule (copy)
			var2(gameConfigurationActionsModule.getExperienceQuestionnaireUrl(p1.universeId), creatorHub, function()
				-- upvalues: refreshPublishEligibilityModule (copy), p1 (copy)
				refreshPublishEligibilityModule(p1.universeId)
			end)
		end, { creatorHub, var2, p1.universeId }),
		onOpenVersionTitleDescriptionPage = p1.onOpenVersionTitleDescriptionPage,
		onOpenVersionHistory = p1.onOpenVersionHistory,
		layoutOrder = p1.layoutOrder,
		testId = p1.testId
	}
end
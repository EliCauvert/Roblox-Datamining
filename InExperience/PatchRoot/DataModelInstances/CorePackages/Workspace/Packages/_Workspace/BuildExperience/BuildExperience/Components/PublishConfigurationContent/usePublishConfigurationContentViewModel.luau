local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local UseOpenWebViewFunction = require(Parent.WebViewUtils).useOpenWebView
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local _ = require(script.Parent.PublishConfigurationContentView)
local ExperienceGuidelinesModule = require(Parent.DataHydration.ExperienceGuidelines)
local UniverseActivationModule = require(Parent.DataHydration.UniverseActivation)
local ContentMaturityUtilsModule = require(BuildExperience.utils.ContentMaturityUtils)
local GameConfigurationActionsModule = require(BuildExperience.utils.GameConfigurationActions)
local GameConfigurationLabelsModule = require(BuildExperience.utils.GameConfigurationLabels)
local RefreshPublishEligibilityModule = require(BuildExperience.utils.refreshPublishEligibility)
local FFlagMyStatsMediaSelector = require(Parent.SharedFlags).FFlagMyStatsMediaSelector

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), UseOpenWebViewFunction (copy), ExperienceGuidelinesModule (copy), ReactModule (copy), SignalsReactModule (copy), UniverseActivationModule (copy), ContentMaturityUtilsModule (copy), GameConfigurationLabelsModule (copy), GameConfigurationActionsModule (copy), RefreshPublishEligibilityModule (copy), FFlagMyStatsMediaSelector (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		creatorHub = LocalizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB,
		loading = LocalizationStringsModule.GAME_CONFIGURATION_LOADING,
		questionnaireRequiredBanner = LocalizationStringsModule.GAME_CONFIGURATION_QUESTIONNAIRE_REQUIRED_BANNER
	})
	local CreatorHub = UseLocalizationResult.creatorHub
	local Loading = UseLocalizationResult.loading
	local QuestionnaireRequiredBanner = UseLocalizationResult.questionnaireRequiredBanner
	local UseOpenWebViewResult = UseOpenWebViewFunction()
	local ExperienceGuidelinesStore = ExperienceGuidelinesModule.getExperienceGuidelinesStore()
	local UseSignalStateResult = SignalsReactModule.useSignalState(ReactModule.useMemo(function()
		-- upvalues: ExperienceGuidelinesStore (copy), p1 (copy)
		return ExperienceGuidelinesStore.getAndFetchDetailedGuidelines(p1.universeId)
	end, { ExperienceGuidelinesStore, p1.universeId }).data)
	local BuildMaturityBannerText = nil
	local UniverseActivationStore = UniverseActivationModule.getUniverseActivationStore()
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(ReactModule.useMemo(function()
		-- upvalues: UniverseActivationStore (copy), p1 (copy)
		return UniverseActivationStore.getAndFetchEligibility(p1.universeId)
	end, { UniverseActivationStore, p1.universeId }).data)
	local IsContentUnrated = ContentMaturityUtilsModule.isContentUnrated(p1.universeId)
	local IsSealBroken = ContentMaturityUtilsModule.isSealBroken(p1.universeId)
	local ProvisionalRating = if UseSignalStateResult1 then UseSignalStateResult1.provisionalRating else nil
	local NoIsSealBroken: boolean = IsContentUnrated and not IsSealBroken
	
	if IsSealBroken and IsContentUnrated then
		BuildMaturityBannerText = QuestionnaireRequiredBanner
	end
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseOpenWebViewResult (copy), GameConfigurationActionsModule (upval), p1 (copy), CreatorHub (copy)
		UseOpenWebViewResult(GameConfigurationActionsModule.getCreatorHubConfigureUrl(p1.universeId), CreatorHub)
	end, { CreatorHub, UseOpenWebViewResult, p1.universeId })
	
	return {
		buildMaturityBannerText = BuildMaturityBannerText,
		contentMaturityText = GameConfigurationLabelsModule.getContentMaturityText(UseSignalStateResult, ProvisionalRating, NoIsSealBroken) or Loading,
		onOpenIconAndThumbnails = if FFlagMyStatsMediaSelector then p1.onOpenMediaSelectionPage else UseResult,
		onOpenTitleDescriptionPage = p1.onOpenTitleDescriptionPage,
		onOpenContentMaturity = ReactModule.useCallback(function()
			-- upvalues: UseOpenWebViewResult (copy), GameConfigurationActionsModule (upval), p1 (copy), CreatorHub (copy), RefreshPublishEligibilityModule (upval)
			UseOpenWebViewResult(GameConfigurationActionsModule.getExperienceQuestionnaireUrl(p1.universeId), CreatorHub, function()
				-- upvalues: RefreshPublishEligibilityModule (upval), p1 (upval)
				RefreshPublishEligibilityModule(p1.universeId)
			end)
		end, { CreatorHub, UseOpenWebViewResult, p1.universeId }),
		onOpenVersionTitleDescriptionPage = p1.onOpenVersionTitleDescriptionPage,
		onOpenVersionHistory = p1.onOpenVersionHistory,
		layoutOrder = p1.layoutOrder,
		testId = p1.testId
	}
end
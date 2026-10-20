local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local FFlagBuildExperienceMonetizationNativeUIModule = require(BuildExperience.Flags.FFlagBuildExperienceMonetizationNativeUI)
local GameConfigurationContentModule = require(BuildExperience.Components.GameConfigurations.GameConfigurationContent.GameConfigurationContent)
local PublishConfigurationContentContainerModule = require(BuildExperience.Components.PublishConfigurationContent.PublishConfigurationContentContainer)
local OverflowMenuPageShellModule = require(script.Parent.OverflowMenuPageShell)
local PublishFooterModule = require(BuildExperience.Components.GameConfigurations.PublishFooter.PublishFooter)
local PublishLatestPreviewCardModule = require(BuildExperience.Components.GameConfigurations.PublishPreviewCard.PublishLatestPreviewCard)
local PublishPreviewCardModule = require(BuildExperience.Components.GameConfigurations.PublishPreviewCard.PublishPreviewCard)
local PublishStatusModule = require(BuildExperience.Chat.PublishStatus)
local View = require(Parent.Foundation).View
local config = {
	publish = "LuaApp_Build_Publish_Scroll",
	settings = "LuaApp_Build_Settings_Scroll"
}

local function _(p1)
	-- upvalues: PublishLatestPreviewCardModule (copy), PublishPreviewCardModule (copy)
	return if p1 then PublishLatestPreviewCardModule else PublishPreviewCardModule
end

local function PublishPreview(p1)
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), PublishStatusModule (copy), PublishLatestPreviewCardModule (copy), PublishPreviewCardModule (copy), ReactModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({ loading = LocalizationStringsModule.BUILD_MENU_LOADING })
	local Target = p1.target
	
	return ReactModule.createElement(if PublishStatusModule.usePublishStatus(p1.target).isPublishLatest then PublishLatestPreviewCardModule else PublishPreviewCardModule, {
		layoutOrder = 1,
		target = {
			universeId = Target.universeId,
			placeId = Target.placeId,
			experienceName = Target.experienceName or UseLocalizationResult.loading,
			creatorName = Target.creatorName,
			gameIcon = Target.gameIcon
		},
		isCreatorVerified = Target.isCreatorVerified
	})
end

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), ReactModule (copy), PublishPreview (copy), PublishConfigurationContentContainerModule (copy), GameConfigurationContentModule (copy), FFlagBuildExperienceMonetizationNativeUIModule (copy), View (copy), OverflowMenuPageShellModule (copy), config (copy), PublishFooterModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		loading = LocalizationStringsModule.BUILD_MENU_LOADING,
		publish = LocalizationStringsModule.BUILD_MENU_PUBLISH,
		settings = LocalizationStringsModule.BUILD_MENU_SETTINGS
	})
	local TestId = p1.testId or `BuildOverflowMenuPage.{p1.page}`
	local ExperienceName = p1.target.experienceName or UseLocalizationResult.loading
	local Element = if p1.page == "publish" then ReactModule.createElement(PublishPreview, { target = p1.target }) else nil
	local Element1 = if p1.page == "publish" then ReactModule.createElement(PublishConfigurationContentContainerModule, {
		layoutOrder = 2,
		universeId = p1.target.universeId,
		onOpenTitleDescriptionPage = p1.onOpenTitleDescriptionPage,
		onOpenMediaSelectionPage = p1.onOpenMediaSelectionPage,
		onOpenVersionTitleDescriptionPage = p1.onOpenVersionTitleDescriptionPage,
		onOpenVersionHistory = p1.onOpenVersionHistory
	}) else ReactModule.createElement(GameConfigurationContentModule, {
		universeId = p1.target.universeId,
		placeId = p1.target.placeId,
		experienceName = ExperienceName,
		onOpenAudiencePage = p1.onOpenAudiencePage,
		onOpenTitleDescriptionPage = p1.onOpenTitleDescriptionPage,
		onOpenMediaSelectionPage = p1.onOpenMediaSelectionPage,
		onOpenMonetizationPage = if FFlagBuildExperienceMonetizationNativeUIModule then p1.onOpenMonetizationPage else nil,
		onOpenPlaytestPicker = p1.onOpenPlaytestPicker,
		onOpenPlaytestManagement = p1.onOpenPlaytestManagement
	})
	
	return ReactModule.createElement(OverflowMenuPageShellModule, {
		title = if p1.page == "publish" then UseLocalizationResult.publish else UseLocalizationResult.settings,
		testId = TestId,
		onClose = p1.onClose,
		content = if Element then ReactModule.createElement(View, { tag = "col gap-large size-full-0 auto-y" }, {
			LeadingContent = Element,
			GameConfigurationContent = Element1
		}) else Element1,
		scrollPerformanceIntervalName = config[p1.page],
		footer = if p1.page == "publish" then ReactModule.createElement(PublishFooterModule, {
			target = {
				universeId = p1.target.universeId,
				placeId = p1.target.placeId,
				sessionId = p1.target.sessionId
			},
			testId = TestId,
			showPreviewButton = p1.showPreviewButton
		}) else nil
	})
end
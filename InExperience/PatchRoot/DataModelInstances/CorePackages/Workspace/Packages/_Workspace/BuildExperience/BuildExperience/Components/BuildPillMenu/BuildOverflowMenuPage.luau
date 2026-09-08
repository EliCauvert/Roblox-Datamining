local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local gameConfigurationContentModule = require(buildExperience.Components.GameConfigurations.GameConfigurationContent.GameConfigurationContent)
local publishConfigurationContentContainerModule = require(buildExperience.Components.PublishConfigurationContent.PublishConfigurationContentContainer)
local overflowMenuPageShellModule = require(script.Parent.OverflowMenuPageShell)
local publishFooterModule = require(buildExperience.Components.GameConfigurations.PublishFooter.PublishFooter)
local publishLatestPreviewCardModule = require(buildExperience.Components.GameConfigurations.PublishPreviewCard.PublishLatestPreviewCard)
local publishPreviewCardModule = require(buildExperience.Components.GameConfigurations.PublishPreviewCard.PublishPreviewCard)
local publishStatusModule = require(buildExperience.Chat.PublishStatus)
local view = foundationModule.View
local t = {
	publish = "LuaApp_Build_Publish_Scroll",
	settings = "LuaApp_Build_Settings_Scroll"
}

local function _(p1)
	-- upvalues: publishLatestPreviewCardModule (ref), publishPreviewCardModule (ref)
	return if p1 then publishLatestPreviewCardModule else publishPreviewCardModule
end

local function PublishPreview(p1)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), publishStatusModule (ref), publishLatestPreviewCardModule (ref), publishPreviewCardModule (ref), reactModule (ref)
	local target = p1.target
	
	return reactModule.createElement(if publishStatusModule.usePublishStatus(p1.target).isPublishLatest then publishLatestPreviewCardModule else publishPreviewCardModule, {
		layoutOrder = 1,
		target = {
			universeId = target.universeId,
			placeId = target.placeId,
			experienceName = target.experienceName or useLocalization({ loading = localizationStringsModule.BUILD_MENU_LOADING }).loading,
			creatorName = target.creatorName,
			gameIcon = target.gameIcon
		},
		isCreatorVerified = target.isCreatorVerified
	})
end

return function(p1)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), reactModule (ref), PublishPreview (ref), publishConfigurationContentContainerModule (ref), gameConfigurationContentModule (ref), view (ref), overflowMenuPageShellModule (ref), t (ref), publishFooterModule (ref)
	local var1 = useLocalization({
		loading = localizationStringsModule.BUILD_MENU_LOADING,
		publish = localizationStringsModule.BUILD_MENU_PUBLISH,
		settings = localizationStringsModule.BUILD_MENU_SETTINGS
	})
	local testId = p1.testId or `BuildOverflowMenuPage.{p1.page}`
	local var2 = if p1.page == "publish" then reactModule.createElement(PublishPreview, { target = p1.target }) else nil
	local var3 = if p1.page == "publish" then reactModule.createElement(publishConfigurationContentContainerModule, {
		layoutOrder = 2,
		universeId = p1.target.universeId,
		onOpenTitleDescriptionPage = p1.onOpenTitleDescriptionPage,
		onOpenMediaSelectionPage = p1.onOpenMediaSelectionPage,
		onOpenVersionTitleDescriptionPage = p1.onOpenVersionTitleDescriptionPage,
		onOpenVersionHistory = p1.onOpenVersionHistory
	}) else reactModule.createElement(gameConfigurationContentModule, {
		universeId = p1.target.universeId,
		placeId = p1.target.placeId,
		experienceName = p1.target.experienceName or var1.loading,
		onOpenAudiencePage = p1.onOpenAudiencePage,
		onOpenTitleDescriptionPage = p1.onOpenTitleDescriptionPage,
		onOpenMediaSelectionPage = p1.onOpenMediaSelectionPage,
		onOpenPlaytestPicker = p1.onOpenPlaytestPicker,
		onOpenPlaytestManagement = p1.onOpenPlaytestManagement
	})
	
	return reactModule.createElement(overflowMenuPageShellModule, {
		title = if p1.page == "publish" then var1.publish else var1.settings,
		testId = testId,
		onClose = p1.onClose,
		content = if var2 then reactModule.createElement(view, { tag = "col gap-large size-full-0 auto-y" }, { LeadingContent = var2, GameConfigurationContent = var3 }) else var3,
		scrollPerformanceIntervalName = t[p1.page],
		footer = if p1.page == "publish" then reactModule.createElement(publishFooterModule, {
			target = {
				universeId = p1.target.universeId,
				placeId = p1.target.placeId,
				sessionId = p1.target.sessionId
			},
			testId = testId,
			showPreviewButton = p1.showPreviewButton
		}) else nil
	})
end
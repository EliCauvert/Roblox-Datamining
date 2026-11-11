local BuildExperience = script:FindFirstAncestor("BuildExperience")
local ReactModule = require(BuildExperience.Parent.React)
local GameConfigurationContentModule = require(BuildExperience.Components.GameConfigurations.GameConfigurationContent.GameConfigurationContent)
local OverflowMenuPageShellModule = require(script.Parent.OverflowMenuPageShell)
local PublishFooterModule = require(BuildExperience.Components.GameConfigurations.PublishFooter.PublishFooter)
local PublishPreviewCardModule = require(BuildExperience.Components.GameConfigurations.PublishPreviewCard.PublishPreviewCard)
local _ = require(BuildExperience.Stores.GetBuildOverflowMenuStore.createBuildOverflowMenuStore)
local View = require(BuildExperience.Parent.Foundation).View
local config = { publish = "Publish", settings = "Settings" }

return function(p1)
	-- upvalues: ReactModule (copy), PublishPreviewCardModule (copy), GameConfigurationContentModule (copy), View (copy), OverflowMenuPageShellModule (copy), config (copy), PublishFooterModule (copy)
	local TestId = p1.testId or `BuildOverflowMenuPage.{p1.page}`
	local ExperienceName = p1.target.experienceName or "Loading..."
	local Element = if p1.page == "publish" then ReactModule.createElement(PublishPreviewCardModule, {
		layoutOrder = 1,
		target = {
			universeId = p1.target.universeId,
			placeId = p1.target.placeId,
			experienceName = ExperienceName,
			creatorName = p1.target.creatorName,
			gameIcon = p1.target.gameIcon
		},
		isCreatorVerified = p1.target.isCreatorVerified,
		testId = `{TestId}.PreviewCard`
	}) else nil
	local Element1 = ReactModule.createElement(GameConfigurationContentModule, {
		universeId = p1.target.universeId,
		experienceName = ExperienceName,
		onOpenAudiencePage = p1.onOpenAudiencePage,
		onOpenTitleDescriptionPage = p1.onOpenTitleDescriptionPage,
		onOpenMediaSelectionPage = p1.onOpenMediaSelectionPage,
		layoutOrder = if Element then 2 else nil
	})
	
	return ReactModule.createElement(OverflowMenuPageShellModule, {
		title = config[p1.page],
		testId = TestId,
		onClose = p1.onClose,
		content = if Element then ReactModule.createElement(View, { tag = "col size-full-0 auto-y" }, {
			LeadingContent = Element,
			GameConfigurationContent = Element1
		}) else Element1,
		footer = if p1.page == "publish" then ReactModule.createElement(PublishFooterModule, {
			target = {
				universeId = p1.target.universeId,
				placeId = p1.target.placeId
			},
			testId = TestId,
			showPreviewButton = p1.showPreviewButton
		}) else nil
	})
end
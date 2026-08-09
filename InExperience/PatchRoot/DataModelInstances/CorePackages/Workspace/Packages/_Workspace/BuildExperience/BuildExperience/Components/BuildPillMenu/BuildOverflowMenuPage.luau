local buildExperience = script:FindFirstAncestor("BuildExperience")
local foundationModule = require(buildExperience.Parent.Foundation)
local reactModule = require(buildExperience.Parent.React)
local gameConfigurationContentModule = require(buildExperience.Components.GameConfigurations.GameConfigurationContent.GameConfigurationContent)
local overflowMenuPageShellModule = require(script.Parent.OverflowMenuPageShell)
local publishFooterModule = require(buildExperience.Components.GameConfigurations.PublishFooter.PublishFooter)
local publishPreviewCardModule = require(buildExperience.Components.GameConfigurations.PublishPreviewCard.PublishPreviewCard)
local _ = require(buildExperience.Stores.GetBuildOverflowMenuStore.createBuildOverflowMenuStore)
local view = foundationModule.View
local t = { publish = "Publish", settings = "Settings" }

return function(p0) --[[ line: 46 | named "BuildOverflowMenuPageComponent" ]]
	-- upvalues: reactModule (ref), publishPreviewCardModule (ref), gameConfigurationContentModule (ref), view (ref), overflowMenuPageShellModule (ref), t (ref), publishFooterModule (ref)
	local testId = p0.testId or `BuildOverflowMenuPage.{p0.page}`
	local experienceName = p0.target.experienceName or "Loading..."
	local var10 = if p0.page == "publish" then reactModule.createElement(publishPreviewCardModule, {
		layoutOrder = 1,
		target = {
			universeId = p0.target.universeId,
			placeId = p0.target.placeId,
			experienceName = experienceName,
			creatorName = p0.target.creatorName,
			gameIcon = p0.target.gameIcon
		},
		isCreatorVerified = p0.target.isCreatorVerified,
		testId = `{testId}.PreviewCard`
	}) else nil
	local var11 = reactModule.createElement(gameConfigurationContentModule, {
		universeId = p0.target.universeId,
		experienceName = experienceName,
		onOpenAudiencePage = p0.onOpenAudiencePage,
		onOpenTitleDescriptionPage = p0.onOpenTitleDescriptionPage,
		onOpenMediaSelectionPage = p0.onOpenMediaSelectionPage,
		layoutOrder = if var10 then 2 else nil
	})
	
	return reactModule.createElement(overflowMenuPageShellModule, {
		title = t[p0.page],
		testId = testId,
		onClose = p0.onClose,
		content = if var10 then reactModule.createElement(view, { tag = "col size-full-0 auto-y" }, { LeadingContent = var10, GameConfigurationContent = var11 }) else var11,
		footer = if p0.page == "publish" then reactModule.createElement(publishFooterModule, {
			target = {
				universeId = p0.target.universeId,
				placeId = p0.target.placeId
			},
			testId = testId,
			showPreviewButton = p0.showPreviewButton
		}) else nil
	})
end
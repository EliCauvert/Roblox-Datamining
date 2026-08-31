local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local publishConfigurationContentContainerModule = require(buildExperience.Components.PublishConfigurationContent.PublishConfigurationContentContainer)
local publishFooterModule = require(buildExperience.Components.GameConfigurations.PublishFooter.PublishFooter)
local publishLatestPreviewCardModule = require(buildExperience.Components.GameConfigurations.PublishPreviewCard.PublishLatestPreviewCard)
local publishPreviewCardModule = require(buildExperience.Components.GameConfigurations.PublishPreviewCard.PublishPreviewCard)
local fFlagEnableBuildExperienceScrollPerformanceTrackingModule = require(buildExperience.Flags.FFlagEnableBuildExperienceScrollPerformanceTracking)
local publishStatusModule = require(buildExperience.Chat.PublishStatus)
local var1 = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then require(buildExperience.Telemetry.useScrollPerformanceTracker) else nil
local sheet = foundationModule.Sheet
local text = foundationModule.Text
local view = foundationModule.View

local function PublishPreview(p1)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), publishStatusModule (ref), publishLatestPreviewCardModule (ref), publishPreviewCardModule (ref), reactModule (ref)
	local target = p1.target
	
	return reactModule.createElement(if publishStatusModule.usePublishStatus(p1.target).isPublishLatest then publishLatestPreviewCardModule else publishPreviewCardModule, {
		layoutOrder = 1,
		target = {
			universeId = target.universeId,
			placeId = target.placeId,
			experienceName = target.experienceName or (if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({ loading = localizationStringsModule.BUILD_MENU_LOADING }) else nil).loading else localizationStringsModule.BUILD_MENU_LOADING),
			creatorName = target.creatorName,
			gameIcon = target.gameIcon
		},
		isCreatorVerified = target.isCreatorVerified
	})
end

local function PublishSheetContent(p1)
	-- upvalues: fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref), var1 (ref), reactModule (ref), sheet (ref)
	if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then
		var1("LuaApp_Build_PublishSheet_Scroll", p1.scrollingFrameRef)
	end
	return reactModule.createElement(sheet.Content, { scrollingFrameRef = p1.scrollingFrameRef }, p1.children)
end

return function(p1)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), sheet (ref), text (ref), PublishSheetContent (ref), view (ref), PublishPreview (ref), publishConfigurationContentContainerModule (ref), publishFooterModule (ref)
	local testId = p1.testId or "publish-bottom-sheet"
	
	return reactModule.createElement(sheet.Root, {
		defaultSnapPointIndex = 2,
		isOpen = p1.isOpen,
		snapPoints = { 0.75, 1 },
		onClose = p1.onClose,
		testId = testId
	}, {
		Header = reactModule.createElement(sheet.Header, { hasCloseAffordance = true }, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "shrink auto-xy text-heading-small text-wrap text-align-x-left content-emphasis",
				Text = if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({ publish = localizationStringsModule.BUILD_MENU_PUBLISH }) else nil).publish else localizationStringsModule.BUILD_MENU_PUBLISH
			})
		}),
		Content = reactModule.createElement(PublishSheetContent, { scrollingFrameRef = reactModule.useRef(nil) }, {
			Body = reactModule.createElement(view, { tag = "col gap-large size-full-0 auto-y" }, {
				Preview = reactModule.createElement(PublishPreview, { target = p1.target }),
				Configuration = reactModule.createElement(publishConfigurationContentContainerModule, {
					layoutOrder = 2,
					universeId = p1.target.universeId,
					onOpenTitleDescriptionPage = p1.onOpenTitleDescriptionPage,
					onOpenMediaSelectionPage = p1.onOpenMediaSelectionPage,
					onOpenVersionTitleDescriptionPage = p1.onOpenVersionTitleDescriptionPage,
					onOpenVersionHistory = p1.onOpenVersionHistory
				})
			})
		}),
		Actions = reactModule.createElement(sheet.Actions, nil, {
			Footer = reactModule.createElement(publishFooterModule, {
				target = {
					universeId = p1.target.universeId,
					placeId = p1.target.placeId,
					sessionId = p1.target.sessionId
				},
				testId = testId,
				showPreviewButton = p1.showPreviewButton,
				onPreview = p1.onClose
			})
		})
	})
end
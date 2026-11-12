local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local PublishConfigurationContentContainerModule = require(BuildExperience.Components.PublishConfigurationContent.PublishConfigurationContentContainer)
local PublishFooterModule = require(BuildExperience.Components.GameConfigurations.PublishFooter.PublishFooter)
local PublishLatestPreviewCardModule = require(BuildExperience.Components.GameConfigurations.PublishPreviewCard.PublishLatestPreviewCard)
local PublishPreviewCardModule = require(BuildExperience.Components.GameConfigurations.PublishPreviewCard.PublishPreviewCard)
local PublishStatusModule = require(BuildExperience.Chat.PublishStatus)
local UseScrollPerformanceTrackerModule = require(BuildExperience.Telemetry.useScrollPerformanceTracker)
local FFlagBuildCheckGamePermissionsModule = require(BuildExperience.Flags.FFlagBuildCheckGamePermissions)
local Sheet = FoundationModule.Sheet
local Text = FoundationModule.Text
local View = FoundationModule.View

local function PublishPreview(p1)
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), PublishStatusModule (copy), PublishLatestPreviewCardModule (copy), PublishPreviewCardModule (copy), ReactModule (copy)
	local Loading = UseLocalizationFunction({ loading = LocalizationStringsModule.BUILD_MENU_LOADING }).loading
	local Target = p1.target
	
	return ReactModule.createElement(if PublishStatusModule.usePublishStatus(p1.target).isPublishLatest then PublishLatestPreviewCardModule else PublishPreviewCardModule, {
		layoutOrder = 1,
		target = {
			universeId = Target.universeId,
			placeId = Target.placeId,
			experienceName = Target.experienceName or Loading,
			creatorName = Target.creatorName,
			gameIcon = Target.gameIcon
		},
		isCreatorVerified = Target.isCreatorVerified
	})
end

local function PublishSheetContent(p1)
	-- upvalues: UseScrollPerformanceTrackerModule (copy), ReactModule (copy), Sheet (copy)
	UseScrollPerformanceTrackerModule("LuaApp_Build_PublishSheet_Scroll", p1.scrollingFrameRef)
	
	return ReactModule.createElement(Sheet.Content, { scrollingFrameRef = p1.scrollingFrameRef }, p1.children)
end

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), ReactModule (copy), Sheet (copy), Text (copy), PublishSheetContent (copy), View (copy), PublishPreview (copy), PublishConfigurationContentContainerModule (copy), FFlagBuildCheckGamePermissionsModule (copy), PublishFooterModule (copy)
	local TestId = p1.testId or "publish-bottom-sheet"
	
	return ReactModule.createElement(Sheet.Root, {
		defaultSnapPointIndex = 2,
		isOpen = p1.isOpen,
		snapPoints = { 0.75, 1 },
		onClose = p1.onClose,
		testId = TestId
	}, {
		Header = ReactModule.createElement(Sheet.Header, { hasCloseAffordance = true }, {
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "shrink auto-xy text-heading-small text-wrap text-align-x-left content-emphasis",
				Text = UseLocalizationFunction({ publish = LocalizationStringsModule.BUILD_MENU_PUBLISH }).publish
			})
		}),
		Content = ReactModule.createElement(PublishSheetContent, { scrollingFrameRef = ReactModule.useRef(nil) }, {
			Body = ReactModule.createElement(View, { tag = "col gap-large size-full-0 auto-y" }, {
				Preview = ReactModule.createElement(PublishPreview, { target = p1.target }),
				Configuration = ReactModule.createElement(PublishConfigurationContentContainerModule, {
					layoutOrder = 2,
					universeId = p1.target.universeId,
					onOpenTitleDescriptionPage = p1.onOpenTitleDescriptionPage,
					onOpenMediaSelectionPage = p1.onOpenMediaSelectionPage,
					onOpenVersionTitleDescriptionPage = p1.onOpenVersionTitleDescriptionPage,
					onOpenVersionHistory = p1.onOpenVersionHistory,
					isNewGame = if FFlagBuildCheckGamePermissionsModule then p1.target.isNewGameTarget else nil
				})
			})
		}),
		Actions = ReactModule.createElement(Sheet.Actions, nil, {
			Footer = ReactModule.createElement(PublishFooterModule, {
				target = {
					universeId = p1.target.universeId,
					placeId = p1.target.placeId,
					sessionId = p1.target.sessionId,
					isNewGameTarget = if FFlagBuildCheckGamePermissionsModule then p1.target.isNewGameTarget else nil
				},
				testId = TestId,
				showPreviewButton = p1.showPreviewButton,
				onPreview = p1.onClose
			})
		})
	})
end
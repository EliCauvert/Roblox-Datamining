local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local FoundationModule = require(CorePackages.Packages.Foundation)
local Focusable = RoactGamepadModule.Focusable
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local _ = require(Modules.AvatarExperience.EditEmotes.useEditEmotesPageProps)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local SelectIsPortraitModule = require(Modules.AvatarExperience.Common.Selectors.selectIsPortrait)
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)
local FocusNavigationEventNameEnum = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum
local UseTableWrappedCallbackRefFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef
local AvatarExperienceViewModule = require(Modules.AvatarExperience.Common.Components.AvatarExperienceView)
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local GamepadFocusHandlerForPageModule = require(Modules.AvatarExperience.Common.Components.GamepadFocusHandlerForPage)
local SceneInteractionFrameModule = require(Modules.AvatarExperience.Common.Components.Scene.SceneInteractionFrame)
local EquipSlotsModule = require(Modules.AvatarExperience.AvatarEditor.Components.EquipSlots)
local EditEmotesScrollingContentModule = require(Modules.AvatarExperience.EditEmotes.EditEmotesScrollingContent)
local EmoteTileContainerModule = require(Modules.AvatarExperience.EditEmotes.EmoteTile.EmoteTileContainer)
local Grid = require(CorePackages.Workspace.Packages.AvatarExperienceUIKit).GridComponents.Grid
local ImpressionEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).Enums.ImpressionEnums
local OrganicEventImpressionsReporterModule = require(Modules.AvatarExperience.Common.Components.Impressions.OrganicEventImpressionsReporter)
local FStringAXImpressionsEventNameModule = require(Modules.AvatarExperience.Flags.FStringAXImpressionsEventName)
local RecommendedItemsModule = require(Modules.AvatarExperience.Common.Components.RecommendedItems)
local LoadMoreButtonModule = require(Modules.AvatarExperience.SlotBasedEditor.Components.InventoryItemsList.LoadMoreButton)
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local config = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

local function useEditEmotesPageFocusNavigationBindings(p1, Callback)
	-- upvalues: ReactFocusNavigationModule (copy), config (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy)
	return ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), Callback (copy)
		return {
			[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlersModule.onRelease(function(p2)
					-- upvalues: Callback (upval)
					p2.cancelled = true
					Callback()
				end)
			}
		}
	end, { Callback }), (ReactFocusNavigationModule.useEventMap(config, p1)))
end

return function(p1)
	-- upvalues: FoundationModule (copy), UseLocalizationFunction (copy), UseSelectorFunction (copy), SelectIsPortraitModule (copy), UseAvatarRouteFunction (copy), ResponsiveModule (copy), AvatarScreen (copy), RoactGamepadModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), ReactModule (copy), useEditEmotesPageFocusNavigationBindings (copy), UseTableWrappedCallbackRefFunction (copy), EmoteTileContainerModule (copy), Focusable (copy), SceneInteractionFrameModule (copy), AvatarExperienceViewModule (copy), TopBarModule (copy), GamepadFocusHandlerForPageModule (copy), EquipSlotsModule (copy), ConstantsModule (copy), EditEmotesScrollingContentModule (copy), Grid (copy), LoadMoreButtonModule (copy), RecommendedItemsModule (copy), OrganicEventImpressionsReporterModule (copy), FStringAXImpressionsEventNameModule (copy), ImpressionEnums (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local FeatureAvatarLabelTitleEmotes = UseLocalizationFunction({ title = "Feature.Avatar.Label.Title.Emotes" })
	local UseSelectorResult = UseSelectorFunction(SelectIsPortraitModule)
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseRefCacheResult = RoactGamepadModule.useRefCache()
	local UseRootFocusControllerResult = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactGamepadModule.useRootFocusController()
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	
	return ReactModule.createElement(Focusable.Frame, {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else UseRootFocusControllerResult,
		ref = UseTableWrappedCallbackRefFunction((useEditEmotesPageFocusNavigationBindings(nil, (ReactModule.useCallback(p1.onBackButtonPressed, { p1.onBackButtonPressed })))))
	}, {
		EditEmotesPageSceneInteractionFrame = ReactModule.createElement(SceneInteractionFrameModule),
		AvatarExperienceView = ReactModule.createElement(AvatarExperienceViewModule, {
			allowAdaptiveScrolling = true,
			showUndoRedo = true,
			isSceneFullView = p1.isSceneFullView,
			isUIFullView = p1.isUIFullView,
			topBar = ReactModule.createElement(TopBarModule.Container, {
				ZIndex = 2,
				titleText = FeatureAvatarLabelTitleEmotes.title,
				transparentBackground = UseSelectorResult,
				leftItem = TopBarModule.makeBackButton(p1.onBackButtonPressed),
				ref = ReactModule.useRef(nil),
				NextSelectionDown = UseRefCacheResult[1]
			})
		}, {
			GamepadFocusHandlerForPage = if FFlagAXMigrateAXToGlobalAutofocus then nil else ReactModule.createElement(GamepadFocusHandlerForPageModule, {
				captureFocusOnMount = true,
				focusController = UseRootFocusControllerResult
			}),
			EditEmotesContent = ReactModule.createElement(FoundationModule.View, {
				tag = "size-full-full bg-surface-0 col gap-medium",
				ref = UseRefResult,
				onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
				padding = { bottom = UDim.new(0, UseTokensResult.Size.Size_2500) }
			}, {
				EquipSlots = ReactModule.createElement(EquipSlotsModule, {
					slotsCount = ConstantsModule.EmoteSlotsCount,
					onActivated = p1.onSlotActivated,
					itemsListRef = UseRefResult1,
					ref = ReactModule.useRef(nil),
					darkenItemsGrid = ResponsiveModule.usePreferredInput() == ResponsiveModule.Input.Directional and UseAvatarRouteResult.current.name == AvatarScreen.ItemDetails
				}),
				EditEmotesScrollingContent = ReactModule.createElement(EditEmotesScrollingContentModule, {
					onCanvasPositionChanged = p1.onCanvasPositionChanged,
					onThresholdReached = p1.onScrollingFrameThresholdReached
				}, {
					ListLayout = ReactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						Padding = UDim.new(0, UseTokensResult.Gap.Medium)
					}),
					EditEmotesGridContainer = ReactModule.createElement(FoundationModule.View, {
						tag = "auto-xy size-full-0",
						LayoutOrder = 1,
						padding = {
							left = UDim.new(0, UseTokensResult.Size.Size_400),
							right = UDim.new(0, UseTokensResult.Size.Size_400)
						}
					}, {
						EditEmotesGrid = ReactModule.createElement(Grid, {
							itemsPerRow = p1.gridMetrics.itemsPerRow,
							renderItem = ReactModule.useCallback(function(p2)
								-- upvalues: ReactModule (upval), EmoteTileContainerModule (upval), p1 (copy), UseRefCacheResult (copy)
								return ReactModule.createElement(EmoteTileContainerModule, {
									impressionsSchema = "defaultItem",
									itemWidth = p1.gridMetrics.itemWidth,
									itemId = p2.item,
									index = p2.index,
									ref = UseRefCacheResult[p2.index],
									impressionsTag = p1.impressionsTag,
									gridInformation = p2.gridInformation
								})
							end, { p1.gridMetrics }),
							items = p1.itemIds,
							gapVertical = UseTokensResult.Size.Size_400,
							gapHorizontal = UseTokensResult.Size.Size_300,
							getItemId = function(p2)
								return p2
							end,
							ref = UseRefResult2
						})
					}),
					LoadMoreButton = if p1.showLoadMoreButton then ReactModule.createElement(LoadMoreButtonModule, { LayoutOrder = 2, onActivated = p1.fetchMoreItems }) else nil,
					RecommendedItems = if p1.showRecommendedItems then ReactModule.createElement(RecommendedItemsModule, {
						LayoutOrder = 3,
						categoryInfo = p1.emotesCategory,
						sendShopForMoreAnalytics = p1.sendShopForMoreAnalytics,
						itemDetailsPeekViewRefs = UseRefResult1,
						listFrameRef = UseRefResult
					}) else nil,
					ImpressionsReporter = ReactModule.createElement(OrganicEventImpressionsReporterModule, {
						eventName = "marketplaceOrganicFELog",
						impressionsSchema = "defaultItem",
						requestId = "",
						parentRef = UseRefResult2,
						pageFilter = p1.impressionsPageFilter,
						onRequestImpressionsSignal = p1.requestImpressionsSignal,
						eventContext = FStringAXImpressionsEventNameModule(),
						impressionsTag = p1.impressionsTag,
						surface = ImpressionEnums.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY,
						analyticsMetadata = p1.analyticsMetadata,
						searchUuid = p1.searchUuid
					})
				})
			})
		})
	})
end
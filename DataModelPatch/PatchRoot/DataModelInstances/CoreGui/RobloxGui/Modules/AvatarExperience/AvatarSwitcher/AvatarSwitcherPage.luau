local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local FoundationModule = require(CorePackages.Packages.Foundation)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local _ = require(Modules.AvatarExperience.AvatarSwitcher.useAvatarSwitcherPageProps)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local SelectIsPortraitModule = require(Modules.AvatarExperience.Common.Selectors.selectIsPortrait)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local SceneInteractionFrameModule = require(Modules.AvatarExperience.Common.Components.Scene.SceneInteractionFrame)
local GamepadFocusHandlerForPageModule = require(Modules.AvatarExperience.Common.Components.GamepadFocusHandlerForPage)
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local AvatarExperienceViewModule = require(Modules.AvatarExperience.Common.Components.AvatarExperienceView)
local Grid = require(CorePackages.Workspace.Packages.AvatarExperienceUIKit).GridComponents.Grid
local AvatarSwitcherScrollingContentModule = require(Modules.AvatarExperience.AvatarSwitcher.AvatarSwitcherScrollingContent)
local AvatarTileContainerModule = require(Modules.AvatarExperience.AvatarSwitcher.AvatarTile.AvatarTileContainer)
local SettingsTileContainerModule = require(Modules.AvatarExperience.AvatarSwitcher.SettingsTile.SettingsTileContainer)
local ImpressionEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).Enums.ImpressionEnums
local OrganicEventImpressionsReporterModule = require(Modules.AvatarExperience.Common.Components.Impressions.OrganicEventImpressionsReporter)
local FStringAXImpressionsEventNameModule = require(Modules.AvatarExperience.Flags.FStringAXImpressionsEventName)
local LoadMoreButtonModule = require(Modules.AvatarExperience.SlotBasedEditor.Components.InventoryItemsList.LoadMoreButton)
local GetUseSelectorDeepEqualsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals
local AXRemoveAvatarSwitcherPageGamepadBindings = game:DefineFastFlag("AXRemoveAvatarSwitcherPageGamepadBindings", false)
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus

return function(p1)
	-- upvalues: FFlagAXMigrateAXToGlobalAutofocus (copy), RoactGamepadModule (copy), UseNavigationFunction (copy), FoundationModule (copy), ReactModule (copy), UseLocalizationFunction (copy), UseSelectorFunction (copy), SelectIsPortraitModule (copy), GetUseSelectorDeepEqualsFunction (copy), SettingsTileContainerModule (copy), AvatarTileContainerModule (copy), AvatarScreen (copy), Focusable (copy), AXRemoveAvatarSwitcherPageGamepadBindings (copy), SceneInteractionFrameModule (copy), AvatarExperienceViewModule (copy), TopBarModule (copy), GamepadFocusHandlerForPageModule (copy), AvatarSwitcherScrollingContentModule (copy), Grid (copy), OrganicEventImpressionsReporterModule (copy), FStringAXImpressionsEventNameModule (copy), ImpressionEnums (copy), LoadMoreButtonModule (copy)
	local UseRootFocusControllerResult = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactGamepadModule.useRootFocusController()
	local UseNavigationResult = UseNavigationFunction()
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseRefCacheResult = RoactGamepadModule.useRefCache()
	local UseRefResult = ReactModule.useRef(nil)
	
	return ReactModule.createElement(Focusable.Frame, {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else UseRootFocusControllerResult,
		inputBindings = if AXRemoveAvatarSwitcherPageGamepadBindings then nil else {
			Back = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonB, p1.onBackButtonPressed)
		}
	}, {
		AvatarSwitcherPageSceneInteractionFrame = ReactModule.createElement(SceneInteractionFrameModule),
		AvatarSwitcherExperienceView = ReactModule.createElement(AvatarExperienceViewModule, {
			allowAdaptiveScrolling = true,
			showRobuxBalance = false,
			showUndoRedo = true,
			showSaveButton = false,
			isSceneFullView = p1.isSceneFullView,
			isUIFullView = p1.isUIFullView,
			topBar = ReactModule.createElement(TopBarModule.Container, {
				ZIndex = 3,
				titleText = UseLocalizationFunction({ title = "Feature.Avatar.Label.Title.AvatarSwitcher" }).title,
				transparentBackground = UseSelectorFunction(SelectIsPortraitModule, GetUseSelectorDeepEqualsFunction()),
				leftItem = TopBarModule.makeBackButton(p1.onBackButtonPressed),
				rightItems = {
					(ReactModule.useCallback(function()
						-- upvalues: ReactModule (upval), FoundationModule (upval), UseNavigationResult (copy), AvatarScreen (upval)
						return ReactModule.createElement(FoundationModule.IconButton, {
							icon = "icons/common/settings",
							size = FoundationModule.Enums.IconSize.Medium,
							onActivated = function()
								-- upvalues: UseNavigationResult (upval), AvatarScreen (upval)
								UseNavigationResult.navigate(AvatarScreen.ManageOutfitPage)
							end
						})
					end, {}))
				},
				ref = ReactModule.useRef(nil),
				NextSelectionDown = UseRefCacheResult[1]
			})
		}, {
			GamepadFocusHandlerForPage = if FFlagAXMigrateAXToGlobalAutofocus then nil else ReactModule.createElement(GamepadFocusHandlerForPageModule, {
				captureFocusOnMount = true,
				focusController = UseRootFocusControllerResult
			}),
			AvatarSwitcherContent = ReactModule.createElement(FoundationModule.View, {
				tag = "bg-surface-0 size-full-full",
				onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged
			}, {
				AvatarSwitcherScrollingContent = ReactModule.createElement(AvatarSwitcherScrollingContentModule, {
					onThresholdReached = p1.onScrollingFrameThresholdReached,
					onCanvasPositionChanged = p1.onCanvasPositionChanged
				}, {
					ListLayout = ReactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						Padding = UDim.new(0, UseTokensResult.Gap.Medium)
					}),
					AvatarSwitcherGridContainer = ReactModule.createElement(FoundationModule.View, {
						tag = "auto-xy size-full-0",
						LayoutOrder = 1,
						padding = {
							left = UDim.new(0, UseTokensResult.Size.Size_400),
							right = UDim.new(0, UseTokensResult.Size.Size_400),
							bottom = UDim.new(0, UseTokensResult.Size.Size_1000)
						}
					}, {
						AvatarSwitcherGrid = ReactModule.createElement(Grid, {
							itemsPerRow = p1.gridMetrics.itemsPerRow,
							renderItem = ReactModule.useCallback(function(p2)
								-- upvalues: p1 (copy), ReactModule (upval), SettingsTileContainerModule (upval), UseRefCacheResult (copy), AvatarTileContainerModule (upval)
								local Item = p2.item
								
								return if p1.shouldRenderSettingsTile(Item) then ReactModule.createElement(SettingsTileContainerModule, {
									itemWidth = p1.gridMetrics.itemWidth,
									index = p2.index,
									ref = UseRefCacheResult[p2.index]
								}) else ReactModule.createElement(AvatarTileContainerModule, {
									impressionsSchema = "defaultItem",
									itemWidth = p1.gridMetrics.itemWidth,
									itemId = Item,
									index = p2.index,
									ref = UseRefCacheResult[p2.index],
									isSelected = p1.itemIdsToIsWearing[Item],
									hasItemFromCurrentPageEquipped = p1.hasItemFromCurrentPageEquipped,
									impressionsTag = p1.impressionsTag,
									gridInformation = p2.gridInformation
								})
							end, {
								p1.gridMetrics,
								p1.itemIdsToIsWearing,
								p1.shouldRenderSettingsTile
							}),
							items = p1.itemIds,
							gapVertical = UseTokensResult.Size.Size_400,
							gapHorizontal = UseTokensResult.Size.Size_300,
							getItemId = function(p2)
								return p2
							end,
							ref = UseRefResult
						})
					}),
					ImpressionsReporter = ReactModule.createElement(OrganicEventImpressionsReporterModule, {
						eventName = "marketplaceOrganicFELog",
						impressionsSchema = "defaultItem",
						requestId = "",
						parentRef = UseRefResult,
						pageFilter = p1.impressionsPageFilter,
						onRequestImpressionsSignal = p1.requestImpressionsSignal,
						eventContext = FStringAXImpressionsEventNameModule(),
						impressionsTag = p1.impressionsTag,
						surface = ImpressionEnums.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY,
						analyticsMetadata = p1.analyticsMetadata,
						searchUuid = p1.searchUuid
					}),
					LoadMoreButton = if p1.showLoadMoreButton then ReactModule.createElement(LoadMoreButtonModule, { LayoutOrder = 2, onActivated = p1.fetchMoreOutfits }) else nil
				})
			})
		})
	})
end
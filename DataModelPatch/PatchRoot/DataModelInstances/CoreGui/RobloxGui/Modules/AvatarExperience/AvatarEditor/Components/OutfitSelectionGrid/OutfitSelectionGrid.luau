local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local FitFrameVertical = require(CorePackages.Packages.FitFrame).FitFrameVertical
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)
local LoadableGridViewModule = require(Modules.AvatarExperience.Common.Components.LoadableGridView)
local AXRefreshScrollingFrameWithLoadMoreModule = require(Modules.AvatarExperience.Common.Components.AXRefreshScrollingFrameWithLoadMore)
local LoadingBarWithThemeModule = require(Modules.LuaApp.Components.LoadingBarWithTheme)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local View = FoundationModule.View
local Text = FoundationModule.Text
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local ButtonSize = FoundationModule.Enums.ButtonSize
local FillBehavior = FoundationModule.Enums.FillBehavior
local CustomMetricsGetter = require(CorePackages.Packages.UIBlox).App.Grid.GridMetrics.makeCustomMetricsGetter(ConstantsModule.ItemsGridMetrics)
local ForwardRefResult = ReactModule.forwardRef(function(Frame, Ref)
	-- upvalues: ReactModule (copy), View (copy), Button (copy), ButtonVariant (copy), ButtonSize (copy), FillBehavior (copy)
	return ReactModule.createElement(View, {
		tag = "size-full-1200 padding-x-large",
		BackgroundTransparency = 1,
		ref = Ref,
		LayoutOrder = Frame.LayoutOrder
	}, {
		LoadMoreButton = ReactModule.createElement(Button, {
			onActivated = Frame.onActivated,
			text = Frame.localized.loadMore,
			variant = ButtonVariant.Standard,
			size = ButtonSize.Medium,
			fillBehavior = FillBehavior.Fill
		})
	})
end)

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), ConstantsModule1 (copy), UtilsModule (copy), ReactModule (copy), View (copy), AXRefreshScrollingFrameWithLoadMoreModule (copy), FitFrameVertical (copy), ConstantsModule (copy), LoadableGridViewModule (copy), CustomMetricsGetter (copy), ForwardRefResult (copy), LoadingBarWithThemeModule (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	local ContentSizeChanged = p1.contentSizeChanged
	local OnLoadMoreButtonActivated = p1.onLoadMoreButtonActivated
	local RenderItem = p1.renderItem
	local Localized = p1.localized
	local v1: boolean = p1.hasMoreItems and #p1.outfitIds == 0
	local OutfitIds = if v1 then nil else p1.outfitIds or nil
	local ShimmerCardsToDisplay = ConstantsModule1.ShimmerCardsToDisplay
	local CountOutfitIds = OutfitIds and #OutfitIds or ShimmerCardsToDisplay
	local IsCountOutfitIdsAbove = CountOutfitIds > 0
	local StylePaletteFont = p1.stylePalette.Font
	local ScaledBaseSize = StylePaletteFont.BaseSize * StylePaletteFont.Header2.RelativeSize
	local GridItemHeightGetterResult = if p1.showCustomOutfitNames then UtilsModule.GridItemHeightGetter(ConstantsModule1.ItemTileType.BundleItemTile, ScaledBaseSize) else UtilsModule.GridItemHeightGetter(ConstantsModule1.ItemTileType.BundleItemTileNoText)
	local EnableContinuousLoad = p1.enableContinuousLoad
	local IsFetchingMore = p1.isFetchingMore or v1
	local HasMoreItems = not IsFetchingMore and p1.hasMoreItems
	local LoadMoreItems = if HasMoreItems and EnableContinuousLoad then p1.loadMoreItems else nil
	local NoEnableContinuousLoad: boolean = HasMoreItems and not EnableContinuousLoad
	
	return ReactModule.createElement(View, {
		tag = "size-full",
		BackgroundTransparency = 1,
		onAbsoluteSizeChanged = p1.absoluteSizeChanged,
		ref = p1.forwardRef
	}, {
		RefreshScrollingFrameWithLoadMore = if IsCountOutfitIdsAbove then ReactModule.createElement(AXRefreshScrollingFrameWithLoadMoreModule, {
			BackgroundTransparency = 1,
			createEndOfScrollElement = false,
			Selectable = false,
			Position = UDim2.fromOffset(0, 0),
			Size = UDim2.fromScale(1, 1),
			parentAppPage = p1.pageOwner,
			onThresholdReached = LoadMoreItems
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				[ReactModule.Change.AbsoluteContentSize] = ContentSizeChanged
			}),
			ListWrapper = ReactModule.createElement(FitFrameVertical, {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				width = UDim.new(1, 0),
				margin = {
					top = ConstantsModule.ItemsGridTopPadding,
					bottom = ConstantsModule.ItemsGridBottomPadding,
					left = ConstantsModule.ItemsGridSidePadding / 2,
					right = ConstantsModule.ItemsGridSidePadding / 2
				}
			}, {
				LoadableGridView = ReactModule.createElement(LoadableGridViewModule, {
					getItemMetrics = CustomMetricsGetter,
					items = OutfitIds,
					totalNumItems = CountOutfitIds,
					renderItem = RenderItem,
					getItemHeight = GridItemHeightGetterResult,
					windowHeight = p1.screenSize.Y,
					ref = p1.loadableGridViewRef
				})
			}),
			LoadMoreButton = if NoEnableContinuousLoad and ForwardRefResult then ReactModule.createElement(ForwardRefResult, {
				LayoutOrder = 2,
				onActivated = OnLoadMoreButtonActivated,
				localized = p1.localized
			}) else nil,
			LoadingBar = if IsFetchingMore then ReactModule.createElement(View, {
				tag = "size-full-0 auto-y",
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_1400)
			}, {
				LoadingBar = ReactModule.createElement(LoadingBarWithThemeModule)
			}) else nil
		}) else nil,
		EmptyState = not IsCountOutfitIdsAbove and ReactModule.createElement("TextButton", {
			Text = "",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			[ReactModule.Event.Activated] = p1.goBack
		}, {
			Content = ReactModule.createElement(View, {
				tag = "col align-x-center align-y-center size-full",
				BackgroundTransparency = 1
			}, {
				Label = ReactModule.createElement(Text, {
					tag = "text-body-medium text-align-x-center text-align-y-center content-default",
					Text = Localized.noItemsLabel
				})
			})
		})
	})
end)
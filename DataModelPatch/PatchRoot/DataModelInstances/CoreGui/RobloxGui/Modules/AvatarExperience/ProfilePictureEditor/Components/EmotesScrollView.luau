local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local UseFocusGuiObjectFunction = require(CorePackages.Packages.ReactFocusNavigation).useFocusGuiObject
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local ReactModule = require(CorePackages.Packages.React)
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local WasLastInputGamepadFunction = require(CorePackages.Workspace.Packages.RoactUtils).wasLastInputGamepad
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local Focusable = RoactGamepadModule.Focusable
local FitFrameVertical = require(CorePackages.Packages.FitFrame).FitFrameVertical
local GridMetrics = UIBloxModule.App.Grid.GridMetrics
local WithStyleFunction = UIBloxModule.Style.withStyle
local WithTextSizeOffsetFunction = UIBloxModule.Core.Style.withTextSizeOffset
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local StandardButtonSize = UIBloxModule.App.Button.Enum.StandardButtonSize
local UseRequestModule = require(Modules.AvatarExperience.Common.Hooks.useRequest)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local AXRefreshScrollingFrameWithLoadMoreModule = require(Modules.AvatarExperience.Common.Components.AXRefreshScrollingFrameWithLoadMore)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local WithNavigationFunction = require(CorePackages.Packages.RoactNavigation).withNavigation
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local UtilsModule1 = require(Modules.AvatarExperience.ProfilePictureEditor.Utils)
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)
local LoadableGridViewModule = require(Modules.AvatarExperience.Common.Components.LoadableGridView)
local GetUserInventoryModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.GetUserInventory)
local AnalyticsModule = require(Modules.AvatarExperience.ProfilePictureEditor.Services.Analytics)
local SetEmoteAssetIdModule = require(Modules.AvatarExperience.ProfilePictureEditor.Thunks.SetEmoteAssetId)
local WithAvatarRouteModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute)
local PPEEmoteItemTileModule = if require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad then require(Modules.AvatarExperience.ProfilePictureEditor.Components.PPEEmoteItemTile) else require(Modules.AvatarExperience.ProfilePictureEditor.Components.PPEEmoteItemTile_DEPRECATED)
local RecommendedItemsModule = require(Modules.AvatarExperience.Common.Components.RecommendedItems)
local RequestStatusEnumModule = require(Modules.AvatarExperience.Common.Enum.RequestStatusEnum)
local LoadingBarWithThemeModule = require(Modules.LuaApp.Components.LoadingBarWithTheme)
local GetFFlagAXEnableSlotBasedEditorModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor)
local AXEmotesScrollView3Grid = game:DefineFastFlag("AXEmotesScrollView3Grid", false)
local FFlagAXAdaptiveScrollingFixForward = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXAdaptiveScrollingFixForward
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole
local WithAdaptiveScrollingFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Hooks.withAdaptiveScrolling
local EmotesScrollView = ReactModule.PureComponent:extend("EmotesScrollView")
local config = {
	[AvatarScreen.Catalog] = true,
	[AvatarScreen.AvatarEditor] = true
}
EmotesScrollView.validateProps = TModule.strictInterface({
	bottomBarHeight = TModule.number,
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	baseRef = TModule.table,
	isFetchingMore = TModule.boolean,
	loadMoreItems = TModule.callback,
	profilePictureEditorAnalytics = TModule.table,
	navigation = TModule.table,
	items = TModule.array(TModule.string),
	screenSize = TModule.Vector2,
	hasMoreItems = TModule.boolean,
	emoteAssetId = TModule.optional(TModule.string),
	avatarType = TModule.string,
	setEmoteAssetId = TModule.callback,
	avatarRoute = AvatarExperienceNavigationModule.AvatarRoute.AvatarRoute.Interface,
	adaptiveScrolling = TModule.optional(TModule.any),
	enableContinuousLoad = TModule.optional(TModule.boolean),
	focusGuiObject = TModule.optional(TModule.callback)
})

function EmotesScrollView.init(p1)
	-- upvalues: ReactModule (copy), UtilsModule1 (copy), RoactGamepadModule (copy), WasLastInputGamepadFunction (copy)
	p1:setState({
		restorePreviousChildFocus = true,
		loadableGridViewWidth = 0,
		totalHeaderHeight = 0
	})
	p1.resultsListRef = ReactModule.createRef()
	
	function p1.absoluteSizeChanged(Frame)
		-- upvalues: p1 (copy)
		p1:setState({ totalHeaderHeight = Frame.AbsoluteSize.Y })
	end
	
	function p1.onFocusGained()
		-- upvalues: p1 (copy)
		p1:setState({ restorePreviousChildFocus = true })
	end
	
	function p1.onLoadableGridViewAbsoluteSizeChanged(Frame: Frame)
		-- upvalues: p1 (copy)
		if p1.state.loadableGridViewWidth ~= Frame.AbsoluteSize.X then
			p1:setState({ loadableGridViewWidth = Frame.AbsoluteSize.X })
		end
	end
	
	p1.categoryIndex, p1.subcategoryIndex, p1.categoryInfo = UtilsModule1.getEmotesCategorySubcategoryAndInfo()
	p1.assetTypeKey = p1.categoryInfo.SearchUuid
	p1.loadableGridViewRef = ReactModule.createRef()
	p1.recommendedItemsRef = ReactModule.createRef()
	p1.emptyStateRef = ReactModule.createRef()
	p1.itemDetailsPeekViewRefs = RoactGamepadModule.createRefCache()
	p1.loadMoreButtonRef = ReactModule.createRef()
	
	function p1.sendShopForMoreAnalytics()
		-- upvalues: p1 (copy)
		p1.props.profilePictureEditorAnalytics.clickShopForMore(p1.categoryIndex, p1.subcategoryIndex)
	end
	
	function p1.onLoadMoreButtonActivated()
		-- upvalues: WasLastInputGamepadFunction (upval), p1 (copy)
		if WasLastInputGamepadFunction() and p1.props.focusGuiObject and p1.resultsListRef and p1.resultsListRef.current then
			p1.props.focusGuiObject(p1.resultsListRef.current)
		end
		p1.props.loadMoreItems()
	end
end

function EmotesScrollView.renderItem(p1, ItemId, TitleFontStyle)
	-- upvalues: ReactModule (copy), PPEEmoteItemTileModule (copy)
	if typeof(ItemId) == "table" then
		ItemId = nil
	end
	return ReactModule.createElement(PPEEmoteItemTileModule, {
		itemId = ItemId,
		isSelected = ItemId == p1.props.emoteAssetId,
		titleFontStyle = TitleFontStyle,
		itemDetailsPeekViewRefs = p1.itemDetailsPeekViewRefs,
		resultsListRef = p1.resultsListRef
	})
end

function EmotesScrollView.renderWithProviders(p1, p2, p3, p4)
	-- upvalues: ConstantsModule1 (copy), GridMetrics (copy), ConstantsModule (copy), AXEmotesScrollView3Grid (copy), GetFFlagAXEnableSlotBasedEditorModule (copy), UtilsModule (copy), ReactModule (copy), Focusable (copy), AXRefreshScrollingFrameWithLoadMoreModule (copy), AvatarScreen (copy), FFlagAXAdaptiveScrollingFixForward (copy), FFlagEnableLeftNavOnConsole (copy), FFlagRenameDeprecatedUIBloxTokens (copy), FitFrameVertical (copy), LoadableGridViewModule (copy), Button (copy), StandardButtonSize (copy), ButtonType (copy), LoadingBarWithThemeModule (copy), RecommendedItemsModule (copy)
	local v1: boolean = p1.props.hasMoreItems and #p1.props.items == 0
	local CategoryInfo = p1.categoryInfo
	local Items = if v1 then nil else p1.props.items or nil
	local ShimmerCardsToDisplay = ConstantsModule1.ShimmerCardsToDisplay
	local CountItems = Items and #Items or ShimmerCardsToDisplay
	local IsCountItemsAbove = CountItems > 0
	local EnableContinuousLoad = p1.props.enableContinuousLoad
	local IsFetchingMore = p1.props.isFetchingMore or v1
	local HasMoreItems = not IsFetchingMore and p1.props.hasMoreItems
	local LoadMoreItems = if HasMoreItems and EnableContinuousLoad then p1.props.loadMoreItems else nil
	local NoEnableContinuousLoad: boolean = HasMoreItems and not EnableContinuousLoad
	local BottomBarHeight = p1.props.bottomBarHeight
	local _Font = p2.Font
	local Theme = p2.Theme
	local HeaderFont = _Font.Header2.Font
	local ScaledBaseSize = _Font.BaseSize * _Font.Header2.RelativeSize
	local Header2 = _Font.Header2
	local ScaledRelativeSize = Header2.RelativeSize * _Font.BaseSize
	local GetSmallMetrics = if AXEmotesScrollView3Grid and GetFFlagAXEnableSlotBasedEditorModule() then GridMetrics.getSmallMetrics else GridMetrics.makeCustomMetricsGetter(ConstantsModule.ItemsGridMetrics)
	
	if GetSmallMetrics(p1.state.loadableGridViewWidth, ConstantsModule1.LoadableGridViewCellPadding).itemWidth / ScaledRelativeSize < ConstantsModule1.MinTileWidthToFontHeightRatio then
		Header2 = _Font.CaptionBody
		ScaledRelativeSize = Header2.RelativeSize * _Font.BaseSize
	end
	local GridItemHeightGetterResult = UtilsModule.GridItemHeightGetter(ConstantsModule1.ItemTileType.AvatarEditorTile, ScaledRelativeSize + p4)
	local ItemType = p3.noItemsLabel:gsub("({itemType})", p3.itemType)
	local TotalHeaderHeight = p1.state.totalHeaderHeight
	local OnFocusGained = if p1.state.restorePreviousChildFocus then nil else p1.onFocusGained or nil
	local RestorePreviousChildFocus = p1.state.restorePreviousChildFocus
	local Key = p1.props.avatarRoute.current.key
	local ItemDetailsPeekViewRef = Key and p1.itemDetailsPeekViewRefs[Key]
	local AdaptiveScrolling = p1.props.adaptiveScrolling or {}
	
	return ReactModule.createElement(Focusable.Frame, {
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		BackgroundColor3 = Theme.BackgroundDefault.Color,
		Size = UDim2.new(1, 0, 1, -BottomBarHeight),
		NextSelectionLeft = p1.props.NextSelectionLeft,
		NextSelectionRight = p1.props.NextSelectionRight,
		NextSelectionDown = p1.props.NextSelectionDown,
		NextSelectionUp = p1.props.NextSelectionUp,
		ref = p1.props.baseRef,
		defaultChild = if IsCountItemsAbove then p1.loadableGridViewRef else p1.emptyStateRef,
		restorePreviousChildFocus = p1.state.restorePreviousChildFocus
	}, {
		EmoteLabels = ReactModule.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			ZIndex = 2,
			[ReactModule.Change.AbsoluteSize] = p1.absoluteSizeChanged
		}, {
			SelectEmoteTextLabel = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = true,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Font = HeaderFont,
				TextColor3 = Theme.TextDefault.Color,
				Text = p3.selectEmote,
				TextSize = ScaledBaseSize,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center
			}, {
				Padding = ReactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 18),
					PaddingBottom = UDim.new(0, 18)
				})
			})
		}),
		RefreshScrollingFrameWithLoadMore = if TotalHeaderHeight == 0 then nil else ReactModule.createElement(AXRefreshScrollingFrameWithLoadMoreModule, {
			BackgroundTransparency = 1,
			createEndOfScrollElement = false,
			Position = UDim2.fromOffset(0, TotalHeaderHeight),
			Size = UDim2.new(1, 0, 1, -TotalHeaderHeight),
			parentAppPage = AvatarScreen.ProfilePictureEditorEmotes,
			ScrollingEnabled = if AdaptiveScrolling.scrollingEnabledBinding then AdaptiveScrolling.scrollingEnabledBinding:map(function(p5)
				return p5
			end) elseif FFlagAXAdaptiveScrollingFixForward then true else AdaptiveScrolling.scrollingEnabled,
			shouldExtendIntoSafeArea = if FFlagEnableLeftNavOnConsole then { bottom = true } else nil,
			onCanvasPositionChanged = function(ScrollFrame)
				-- upvalues: AdaptiveScrolling (copy)
				local Y = ScrollFrame.CanvasPosition.Y
				
				if AdaptiveScrolling.onCanvasYChanged then
					AdaptiveScrolling.onCanvasYChanged(Y)
				end
			end,
			onThresholdReached = LoadMoreItems
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}),
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingBottom = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then p2.Tokens.Size.Size_600 else p2.Tokens.Global.Space_300)
			}),
			ListWrapper = IsCountItemsAbove and ReactModule.createElement(Focusable[FitFrameVertical], {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				width = UDim.new(1, 0),
				margin = {
					top = 0,
					bottom = ConstantsModule.ItemsGridBottomPadding,
					left = ConstantsModule.ItemsGridSidePadding / 2,
					right = ConstantsModule.ItemsGridSidePadding / 2
				},
				NextSelectionDown = if NoEnableContinuousLoad then p1.loadMoreButtonRef else p1.recommendedItemsRef,
				ref = p1.loadableGridViewRef
			}, {
				LoadableGridView = ReactModule.createElement(LoadableGridViewModule, {
					getItemMetrics = if AXEmotesScrollView3Grid then GetSmallMetrics else GridMetrics.makeCustomMetricsGetter(ConstantsModule.ItemsGridMetrics),
					items = Items,
					totalNumItems = CountItems,
					renderItem = function(p5)
						-- upvalues: p1 (copy), Header2 (ref)
						return p1:renderItem(p5, Header2)
					end,
					getItemHeight = GridItemHeightGetterResult,
					windowHeight = p1.props.screenSize.Y,
					onAbsoluteSizeChanged = p1.onLoadableGridViewAbsoluteSizeChanged,
					onFocusGained = OnFocusGained,
					restorePreviousChildFocus = RestorePreviousChildFocus,
					NextSelectionRight = ItemDetailsPeekViewRef,
					ref = p1.resultsListRef
				})
			}),
			NoEmotesLabel = not IsCountItemsAbove and ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 48),
				Font = HeaderFont,
				TextColor3 = Theme.TextDefault.Color,
				Text = ItemType,
				TextSize = ScaledBaseSize,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center
			}),
			LoadMoreButtonFrame = NoEnableContinuousLoad and ReactModule.createElement(Focusable[FitFrameVertical], {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				ref = p1.loadMoreButtonRef,
				NextSelectionUp = p1.loadableGridViewRef,
				NextSelectionDown = p1.recommendedItemsRef,
				width = UDim.new(1, 0),
				margin = {
					top = 0,
					bottom = ConstantsModule.ItemsGridBottomPadding,
					left = ConstantsModule.ItemsGridSidePadding / 2,
					right = ConstantsModule.ItemsGridSidePadding / 2
				},
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}, {
				LoadMoreButton = ReactModule.createElement(Button, {
					onActivated = p1.onLoadMoreButtonActivated,
					text = p3.loadMore,
					standardSize = StandardButtonSize.Regular,
					buttonType = ButtonType.Secondary,
					size = UDim2.fromScale(1, 1),
					anchorPoint = Vector2.new(0.5, 0.5),
					position = UDim2.fromScale(0.5, 0.5)
				})
			}),
			LoadingBar = if IsFetchingMore then ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 4,
				Size = UDim2.new(1, 0, 0, if FFlagRenameDeprecatedUIBloxTokens then p2.Tokens.Size.Size_1400 else p2.Tokens.Global.Size_700)
			}, {
				LoadingBar = ReactModule.createElement(LoadingBarWithThemeModule)
			}) else nil,
			RecommendedItems = ReactModule.createElement(RecommendedItemsModule, {
				LayoutOrder = 5,
				categoryInfo = CategoryInfo,
				sendShopForMoreAnalytics = p1.sendShopForMoreAnalytics,
				itemDetailsPeekViewRefs = p1.itemDetailsPeekViewRefs,
				listFrameRef = p1.props.baseRef,
				baseRef = p1.recommendedItemsRef,
				NextSelectionUp = if NoEnableContinuousLoad then p1.loadMoreButtonRef else p1.loadableGridViewRef,
				NextSelectionDown = p1.props.NextSelectionDown
			})
		})
	})
end

function EmotesScrollView.render(p1)
	-- upvalues: WithTextSizeOffsetFunction (copy), WithStyleFunction (copy), WithLocalizationFunction (copy)
	return WithTextSizeOffsetFunction(function(p2)
		-- upvalues: WithStyleFunction (upval), WithLocalizationFunction (upval), p1 (copy)
		return WithStyleFunction(function(p3)
			-- upvalues: WithLocalizationFunction (upval), p1 (upval), p2 (copy)
			return WithLocalizationFunction({
				itemType = "Feature.Catalog.Label.Emotes",
				noItemsLabel = "Feature.Avatar.Label.NoItems",
				selectEmote = "Feature.Avatar.Message.SelectEmote",
				loadMore = "Feature.Catalog.Action.LoadMore"
			})(function(p4)
				-- upvalues: p1 (upval), p3 (copy), p2 (upval)
				return p1:renderWithProviders(p3, p4, p2)
			end)
		end)
	end)
end

function EmotesScrollView.didUpdate(p1, p2)
	-- upvalues: AvatarScreen (copy), config (copy)
	local Name = p1.props.avatarRoute.current.name
	local Name1 = p2.avatarRoute.current.name
	
	if Name == AvatarScreen.ProfilePictureEditorEmotes then
		if not p1.state.restorePreviousChildFocus then
			p1:setState({ restorePreviousChildFocus = true })
			
			return
		end
	elseif config[Name] and Name1 == AvatarScreen.ProfilePictureEditorEmotes and p1.state.restorePreviousChildFocus then
		p1:setState({ restorePreviousChildFocus = false })
	end
end

function EmotesScrollView.didMount(p1)
	if p1.props.hasMoreItems then
		p1.props.loadMoreItems()
	end
end

local v1 = RoactAppPolicy.connect(function(p1, _)
	return { enableContinuousLoad = p1.getEnableContinuousLoad() }
end)((WithAdaptiveScrollingFunction((WithAvatarRouteModule((RoactRoduxModule.connect(function(p1, _)
	-- upvalues: UtilsModule1 (copy)
	local _, _, EmotesCategorySubcategoryAndInfo3 = UtilsModule1.getEmotesCategorySubcategoryAndInfo()
	assert(EmotesCategorySubcategoryAndInfo3.SearchUuid, "categoryInfo.SearchUuid is not nil: silences type checker")
	local SearchUuid = EmotesCategorySubcategoryAndInfo3.SearchUuid
	
	return {
		items = p1.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype[SearchUuid] or {},
		screenSize = p1.ScreenSize,
		hasMoreItems = not p1.AvatarExperience.AvatarEditor.PageFinished[SearchUuid],
		emoteAssetId = p1.AvatarExperience.ProfilePictureEditor.ProfilePictureParams.emoteAssetId,
		avatarType = p1.AvatarExperience.AvatarEditor.Character.AvatarType
	}
end, function(Callback)
	-- upvalues: SetEmoteAssetIdModule (copy)
	return {
		setEmoteAssetId = function(p1, p2)
			-- upvalues: Callback (copy), SetEmoteAssetIdModule (upval)
			return Callback(SetEmoteAssetIdModule(p1, p2))
		end
	}
end)((WithNavigationFunction(RoactServices.connect({ profilePictureEditorAnalytics = AnalyticsModule })(EmotesScrollView), nil)))))))))

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UtilsModule1 (copy), ReactModule (copy), GetUserInventoryModule (copy), UseRequestModule (copy), RequestStatusEnumModule (copy), UseFocusGuiObjectFunction (copy), v1 (ref), CryoModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local _, _, EmotesCategorySubcategoryAndInfo3 = UtilsModule1.getEmotesCategorySubcategoryAndInfo()
	local UseRequestModuleResult, UseRequestModuleResult2 = UseRequestModule((ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), GetUserInventoryModule (upval), EmotesCategorySubcategoryAndInfo3 (copy)
		return UseDispatchResult(GetUserInventoryModule(EmotesCategorySubcategoryAndInfo3))
	end, { EmotesCategorySubcategoryAndInfo3 })))
	
	return ReactModule.createElement(v1, CryoModule.Dictionary.join(p1, {
		loadMoreItems = UseRequestModuleResult2,
		isFetchingMore = UseRequestModuleResult.status == RequestStatusEnumModule.Pending,
		focusGuiObject = UseFocusGuiObjectFunction()
	}))
end
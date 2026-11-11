local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(CorePackages.Packages.React)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local CryoModule = require(CorePackages.Packages.Cryo)
local RequestStatusEnumModule = require(Modules.AvatarExperience.Common.Enum.RequestStatusEnum)
local UseRequestModule = require(Modules.AvatarExperience.Common.Hooks.useRequest)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local CenteredModalViewModule = require(Modules.AvatarExperience.Common.Components.CenteredModalView)
local FitFrameVertical = require(CorePackages.Packages.AvatarExperienceDeps).RoactFitComponents.FitFrameVertical
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local RetrievalStatus = require(CorePackages.Workspace.Packages.Http).Enum.RetrievalStatus
local GetSafeAreaSizeFunction = require(CorePackages.Workspace.Packages.InputUi).getSafeAreaSize
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXMigrateResellersInputBindingsToRoactGamepad = AvatarExperienceFlagsModule.FFlagAXMigrateResellersInputBindingsToRoactGamepad
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local ExternalEventConnection = require(CorePackages.Workspace.Packages.RoactUtils).ExternalEventConnection
local WithMappedNavigationParamsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)
local CloseFocusedScreenModule = require(Modules.AvatarExperience.Common.Thunks.CloseFocusedScreen)
local ItemDataModule = require(Modules.AvatarExperience.Common.Selectors.ItemData)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local AssetResellerCardModule = require(Modules.AvatarExperience.Catalog.Components.Resellers.AssetResellerCard)
local CollectibleResellerCardModule = require(Modules.AvatarExperience.Catalog.Components.Resellers.CollectibleResellerCard)
local AXRefreshScrollingFrameWithLoadMoreModule = require(Modules.AvatarExperience.Common.Components.AXRefreshScrollingFrameWithLoadMore)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local WithStackVisibilityWrapperModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper)
local FetchAssetResellersModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchAssetResellers)
local FetchCollectibResellersInstancesModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchCollectibResellersInstances)
local SetResellerCursorModule = require(Modules.AvatarExperience.Catalog.Actions.SetResellerCursor)
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)
local FocusNavigationEventNameEnum = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagRenameDeprecatedUIBloxTokens = SharedFlagsModule.FFlagRenameDeprecatedUIBloxTokens
local WithStyleFunction = UIBloxModule.Style.withStyle
local DefaultMetricsGridView = UIBloxModule.App.Grid.DefaultMetricsGridView
local GridMetrics = UIBloxModule.App.Grid.GridMetrics
local LoadingStateContainer = UIBloxModule.App.Container.LoadingStateContainer
local RetrievalStatus1 = UIBloxModule.App.Loading.Enum.RetrievalStatus
local EmptyState = UIBloxModule.App.Indicator.EmptyState
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local StandardButtonSize = UIBloxModule.App.Button.Enum.StandardButtonSize
local LoadingBarWithThemeModule = require(Modules.LuaApp.Components.LoadingBarWithTheme)
local FFlagUpdateNoInternetConnectionText = AvatarExperienceFlagsModule.FFlagUpdateNoInternetConnectionText
local AppNavBarModule = require(CorePackages.Workspace.Packages.AppNavBar)
local FFlagAppIaScrollAway = SharedFlagsModule.FFlagAppIaScrollAway
local FFlagAXFixScrollAwayTopBarOverlapModule = require(Modules.AvatarExperience.Flags.FFlagAXFixScrollAwayTopBarOverlap)
local config = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

local function useResellersPageFocusNavigationBindings(p1, Callback)
	-- upvalues: ReactFocusNavigationModule (copy), config (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy)
	return ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), Callback (copy), InputHandlersModule (upval)
		return {
			[FocusNavigationEventNameEnum.NavigateBack] = if Callback then {
				handler = InputHandlersModule.onRelease(function(p2)
					-- upvalues: Callback (upval)
					p2.cancelled = true
					Callback()
				end)
			} else nil
		}
	end, { Callback }), (ReactFocusNavigationModule.useEventMap(config, p1)))
end

local ResellersPage = ReactModule.PureComponent:extend("ResellersPage")

function ResellersPage.init(p1)
	-- upvalues: ReactModule (copy), WithStyleFunction (copy), FitFrameVertical (copy), AssetResellerCardModule (copy), CollectibleResellerCardModule (copy), WithLocalizationFunction (copy), Button (copy), StandardButtonSize (copy), ButtonType (copy), CatalogConstantsModule (copy)
	p1.nextPageCursor = nil
	p1.gridViewRef = ReactModule.createRef()
	p1.topBarRef = ReactModule.createRef()
	
	function p1.renderCard(UserAssetId, _, LayoutOrder)
		-- upvalues: WithStyleFunction (upval), ReactModule (upval), FitFrameVertical (upval), AssetResellerCardModule (upval), p1 (copy)
		return WithStyleFunction(function(p2)
			-- upvalues: ReactModule (upval), FitFrameVertical (upval), LayoutOrder (copy), AssetResellerCardModule (upval), p1 (upval), UserAssetId (copy)
			local Theme = p2.Theme
			
			return ReactModule.createElement(FitFrameVertical, {
				BackgroundTransparency = 1,
				width = UDim.new(1, 0),
				contentPadding = UDim.new(0, 8),
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				LayoutOrder = LayoutOrder
			}, {
				AssetResellerCard = ReactModule.createElement(AssetResellerCardModule, {
					LayoutOrder = 1,
					horizontalPadding = 24,
					itemId = p1.props.itemId,
					itemType = p1.props.itemType,
					productId = p1.props.productId,
					userAssetId = UserAssetId
				}),
				Divider = ReactModule.createElement("Frame", {
					BorderSizePixel = 0,
					LayoutOrder = 2,
					BackgroundColor3 = Theme.Divider.Color,
					BackgroundTransparency = Theme.Divider.Transparency,
					Size = UDim2.new(1, -24, 0, 1)
				})
			})
		end)
	end
	
	function p1.renderCollectibleCard(CollectibleInstanceId, _, LayoutOrder)
		-- upvalues: p1 (copy), WithStyleFunction (upval), ReactModule (upval), CollectibleResellerCardModule (upval)
		local CollectibleItemId = p1.props.collectibleItemId
		
		return WithStyleFunction(function(p2)
			-- upvalues: ReactModule (upval), LayoutOrder (copy), CollectibleResellerCardModule (upval), p1 (upval), CollectibleItemId (copy), CollectibleInstanceId (copy)
			local Theme = p2.Theme
			
			return ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = LayoutOrder,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.fromScale(1, 0)
			}, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					VerticalAlignment = Enum.VerticalAlignment.Top,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 8)
				}),
				CollectibleResellerCard = ReactModule.createElement(CollectibleResellerCardModule, {
					LayoutOrder = 1,
					horizontalPadding = 24,
					itemId = p1.props.itemId,
					collectibleItemId = CollectibleItemId,
					collectibleInstanceId = CollectibleInstanceId,
					itemType = p1.props.itemType
				}),
				Divider = ReactModule.createElement("Frame", {
					BorderSizePixel = 0,
					LayoutOrder = 2,
					BackgroundColor3 = Theme.Divider.Color,
					BackgroundTransparency = Theme.Divider.Transparency,
					Size = UDim2.new(1, 0, 0, 1)
				})
			})
		end)
	end
	
	function p1.renderLoadMoreButton(LayoutOrder, OnActivated)
		-- upvalues: WithLocalizationFunction (upval), ReactModule (upval), Button (upval), StandardButtonSize (upval), ButtonType (upval)
		return WithLocalizationFunction({ loadMore = "Feature.Catalog.Action.LoadMore" })(function(p2)
			-- upvalues: ReactModule (upval), LayoutOrder (copy), Button (upval), OnActivated (copy), StandardButtonSize (upval), ButtonType (upval)
			return ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = LayoutOrder,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.fromScale(1, 0)
			}, {
				UIPadding = ReactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 8),
					PaddingLeft = UDim.new(0, 24),
					PaddingRight = UDim.new(0, 24)
				}),
				LoadMoreButton = ReactModule.createElement(Button, {
					onActivated = OnActivated,
					text = p2.loadMore,
					standardSize = StandardButtonSize.Regular,
					buttonType = ButtonType.Secondary
				})
			})
		end)
	end
	
	function p1.makeRenderItem(LoadMoreItems)
		-- upvalues: CatalogConstantsModule (upval), p1 (copy)
		return function(CollectibleInstanceId, _, LayoutOrder)
			-- upvalues: CatalogConstantsModule (upval), p1 (upval), LoadMoreItems (copy)
			return if CollectibleInstanceId == CatalogConstantsModule.FinalRowRenderLoadMoreButton then p1.renderLoadMoreButton(LayoutOrder, LoadMoreItems) elseif p1.props.collectibleResellersInstancesIds then p1.renderCollectibleCard(CollectibleInstanceId, nil, LayoutOrder) else p1.renderCard(CollectibleInstanceId, nil, LayoutOrder)
		end
	end
	
	function p1.goBack()
		-- upvalues: p1 (copy)
		p1.props.closeFocusedScreen(p1.props.navigation)
	end
end

function ResellersPage.didMount(p1)
	-- upvalues: UserInputService (copy)
	p1.props.fetchInitialItems()
	local LastInputType = UserInputService:GetLastInputType()
	
	if LastInputType then
		p1:setState({ lastInputType = LastInputType })
	end
end

function ResellersPage.willUpdate(p1, p2, _)
	-- upvalues: RetrievalStatus (copy)
	local IsPurchaseFetchingStateMatch: boolean = p2.purchaseFetchingState == RetrievalStatus.Done or p2.purchaseFetchingState == RetrievalStatus.Failed
	
	if p1.props.purchaseFetchingState == RetrievalStatus.Fetching and IsPurchaseFetchingStateMatch then
		p1.props.fetchInitialItems()
	end
end

function ResellersPage.willUnmount(p1)
	p1.props.clearResellerCursor()
end

function ResellersPage.renderOnLoaded(p1)
	-- upvalues: ReactModule (copy), TopBarModule (copy)
	return ReactModule.createElement(TopBarModule.PageContent, {}, { Content = p1:renderContent() })
end

function ResellersPage.renderContent(p1)
	-- upvalues: GetSafeAreaSizeFunction (copy), CryoModule (copy), CatalogConstantsModule (copy), WithStyleFunction (copy), ReactModule (copy), AXRefreshScrollingFrameWithLoadMoreModule (copy), FFlagAXFixScrollAwayTopBarOverlapModule (copy), Focusable (copy), DefaultMetricsGridView (copy), GridMetrics (copy), FFlagAXMigrateResellersInputBindingsToRoactGamepad (copy), RoactGamepadModule (copy), FFlagRenameDeprecatedUIBloxTokens (copy), LoadingBarWithThemeModule (copy)
	local ScreenSize = p1.props.screenSize
	local GlobalGuiInset = p1.props.globalGuiInset
	local ResellerUserAssetIds = p1.props.resellerUserAssetIds
	local HasMoreRows = p1.props.hasMoreRows
	local EnableContinuousLoad = p1.props.enableContinuousLoad
	local CollectibleResellersInstancesIds = p1.props.collectibleResellersInstancesIds
	
	if not ResellerUserAssetIds and not CollectibleResellersInstancesIds then return end
	local SafeAreaSize = GetSafeAreaSizeFunction(ScreenSize, GlobalGuiInset)
	local config = {
		minimumItemsPerRow = 1,
		minimumItemWidth = SafeAreaSize.X.Offset
	}
	local CollectibleResellersInstancesIds1 = CollectibleResellersInstancesIds or ResellerUserAssetIds
	local IsFetchingMore = p1.props.isFetchingMore or HasMoreRows and #CollectibleResellersInstancesIds1 == 0
	local HasMoreRows1 = not IsFetchingMore and HasMoreRows
	local LoadMoreItems = if HasMoreRows1 and EnableContinuousLoad then p1.props.loadMoreItems else nil
	
	if HasMoreRows1 and not EnableContinuousLoad then
		CollectibleResellersInstancesIds1 = CryoModule.List.join(CollectibleResellersInstancesIds1, { CatalogConstantsModule.FinalRowRenderLoadMoreButton })
	end
	return WithStyleFunction(function(p2)
		-- upvalues: ReactModule (upval), AXRefreshScrollingFrameWithLoadMoreModule (upval), p1 (copy), HasMoreRows (copy), LoadMoreItems (copy), FFlagAXFixScrollAwayTopBarOverlapModule (upval), Focusable (upval), DefaultMetricsGridView (upval), SafeAreaSize (copy), GridMetrics (upval), config (copy), CollectibleResellersInstancesIds1 (ref), FFlagAXMigrateResellersInputBindingsToRoactGamepad (upval), RoactGamepadModule (upval), IsFetchingMore (copy), FFlagRenameDeprecatedUIBloxTokens (upval), LoadingBarWithThemeModule (upval)
		return ReactModule.createElement(AXRefreshScrollingFrameWithLoadMoreModule, {
			Position = UDim2.fromScale(0, 0),
			Size = UDim2.fromScale(1, 1),
			refresh = p1.props.fetchInitialItems,
			createEndOfScrollElement = not HasMoreRows,
			onThresholdReached = LoadMoreItems
		}, {
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingTop = if FFlagAXFixScrollAwayTopBarOverlapModule then p1.props.pagePaddingTop else UDim.new(0, 24)
			}),
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			ResellerGridView = ReactModule.createElement(Focusable[DefaultMetricsGridView], {
				maxHeight = 1e999,
				LayoutOrder = 1,
				defaultChildIndex = 1,
				renderItem = p1.makeRenderItem(p1.props.loadMoreItems),
				windowHeight = SafeAreaSize.Y.Offset,
				getItemHeight = function(_): number
					return 100
				end,
				getItemMetrics = GridMetrics.makeCustomMetricsGetter(config),
				itemPadding = Vector2.new(0, 12),
				items = CollectibleResellersInstancesIds1,
				inputBindings = if FFlagAXMigrateResellersInputBindingsToRoactGamepad then nil else {
					NavigateBack = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonB, p1.goBack)
				},
				ref = p1.gridViewRef,
				NextSelectionUp = p1.topBarRef
			}),
			LoadingBar = if IsFetchingMore then ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, if FFlagRenameDeprecatedUIBloxTokens then p2.Tokens.Size.Size_1400 else p2.Tokens.Global.Size_700)
			}, {
				LoadingBar = ReactModule.createElement(LoadingBarWithThemeModule)
			}) else nil
		})
	end)
end

function ResellersPage.renderOnFailed(p1, p2)
	-- upvalues: ReactModule (copy), EmptyState (copy)
	return ReactModule.createElement(EmptyState, {
		onActivated = p1.props.fetchInitialItems,
		text = p2.failedMessage
	})
end

function ResellersPage.render(p1)
	-- upvalues: ReactModule (copy), CenteredModalViewModule (copy), FFlagAXMigrateResellersInputBindingsToRoactGamepad (copy)
	return ReactModule.createElement(CenteredModalViewModule, {
		forwardRef = if FFlagAXMigrateResellersInputBindingsToRoactGamepad then p1.props.focusNavigationRef else nil
	}, { Content = p1:renderContents() })
end

function ResellersPage.renderContents(p1)
	-- upvalues: CryoModule (copy), RetrievalStatus (copy), WithStyleFunction (copy), WithLocalizationFunction (copy), FFlagUpdateNoInternetConnectionText (copy), ReactModule (copy), Focusable (copy), TopBarModule (copy), ExternalEventConnection (copy), UserInputService (copy), LoadingStateContainer (copy), RetrievalStatus1 (copy)
	local GlobalGuiInset = p1.props.globalGuiInset
	local FetchingStatus = p1.props.fetchingStatus
	local Inverted: boolean = p1.props.resellerUserAssetIds and not CryoModule.isEmpty(p1.props.resellerUserAssetIds) or p1.props.collectibleResellersInstancesIds and not CryoModule.isEmpty(p1.props.collectibleResellersInstancesIds)
	
	if FetchingStatus == RetrievalStatus.Fetching and Inverted then
		FetchingStatus = RetrievalStatus.Done
	end
	return WithStyleFunction(function(p2)
		-- upvalues: WithLocalizationFunction (upval), FFlagUpdateNoInternetConnectionText (upval), ReactModule (upval), Focusable (upval), GlobalGuiInset (copy), TopBarModule (upval), p1 (copy), FetchingStatus (ref), RetrievalStatus (upval), ExternalEventConnection (upval), UserInputService (upval), LoadingStateContainer (upval), RetrievalStatus1 (upval)
		return WithLocalizationFunction({
			title = "Feature.Catalog.Heading.Sellers",
			failedMessage = if FFlagUpdateNoInternetConnectionText then "Feature.DisplayName.ErrorMessage.SomethingWentWrong" else "Feature.EmptyStatePage.Message.NoInternet"
		})(function(p3)
			-- upvalues: p2 (copy), ReactModule (upval), Focusable (upval), GlobalGuiInset (upval), TopBarModule (upval), p1 (upval), FetchingStatus (upval), RetrievalStatus (upval), ExternalEventConnection (upval), UserInputService (upval), LoadingStateContainer (upval), RetrievalStatus1 (upval)
			local Theme = p2.Theme
			
			return ReactModule.createElement(Focusable.Frame, {
				BorderSizePixel = 0,
				Active = true,
				BackgroundColor3 = Theme.BackgroundDefault.Color,
				BackgroundTransparency = Theme.BackgroundDefault.Transparency,
				Size = UDim2.fromScale(1, 1),
				Position = UDim2.new(0, 0, 0, GlobalGuiInset.top)
			}, {
				TopBar = ReactModule.createElement(TopBarModule.Container, {
					ZIndex = 2,
					titleText = p3.title,
					ref = p1.topBarRef,
					NextSelectionDown = FetchingStatus == RetrievalStatus.Done and p1.gridViewRef or nil,
					leftItem = TopBarModule.BackButton
				}),
				LastInputTypeChangedConnection = ReactModule.createElement(ExternalEventConnection, {
					event = UserInputService.LastInputTypeChanged,
					callback = function(LastInputType)
						-- upvalues: p1 (upval)
						if LastInputType then
							p1:setState({ lastInputType = LastInputType })
						end
					end
				}),
				LoadingStateContainer = ReactModule.createElement(LoadingStateContainer, {
					dataStatus = RetrievalStatus1.fromRawValue(FetchingStatus),
					renderOnLoaded = function()
						-- upvalues: p1 (upval)
						return p1:renderOnLoaded()
					end,
					renderOnFailed = function()
						-- upvalues: p1 (upval), p3 (copy)
						return p1:renderOnFailed(p3)
					end
				})
			})
		end)
	end)
end

local WithMappedNavigationParamsModuleResult = WithMappedNavigationParamsModule((WithStackVisibilityWrapperModule((RoactAppPolicy.connect(function(p1, _)
	return { enableContinuousLoad = p1.getEnableContinuousLoad() }
end)((RoactServices.connect({ networking = RoactNetworkingModule })((RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: ItemDataModule (copy), PerformFetch (copy), CatalogConstantsModule (copy)
	local ItemId = p2.itemId
	local ItemDataModuleResult = ItemDataModule(p1.AvatarExperience.Common, ItemId, p2.itemType)
	local Id = ItemDataModuleResult and (ItemDataModuleResult.product and ItemDataModuleResult.product.id)
	local ResellerUserAssetIds = ItemDataModuleResult and ItemDataModuleResult.resellerUserAssetIds
	local CollectibleItemId = p2.collectibleItemId
	local InstanceIdsList = nil
	
	if CollectibleItemId ~= nil then
		local CollectiblesResellersInstances = p1.AvatarExperience.Common.Collectibles.CollectiblesResellersInstances
		InstanceIdsList = CollectiblesResellersInstances and (CollectiblesResellersInstances[CollectibleItemId] and CollectiblesResellersInstances[CollectibleItemId].InstanceIdsList)
	end
	return {
		globalGuiInset = p1.GlobalGuiInset,
		hasMoreRows = p1.AvatarExperience.Catalog.ResellerCursor.hasMoreRows,
		fetchingStatus = PerformFetch.GetStatus(p1, CatalogConstantsModule.GetResellersKey .. tostring(CollectibleItemId or ItemId)),
		productId = Id,
		purchaseFetchingState = PerformFetch.GetStatus(p1, CatalogConstantsModule.PurchaseProductKey .. tostring(Id)),
		resellerCursor = p1.AvatarExperience.Catalog.ResellerCursor.nextPageCursor,
		resellerUserAssetIds = ResellerUserAssetIds,
		screenSize = p1.ScreenSize,
		collectibleResellersInstancesIds = InstanceIdsList
	}
end, function(Callback)
	-- upvalues: SetResellerCursorModule (copy), CloseFocusedScreenModule (copy)
	return {
		clearResellerCursor = function()
			-- upvalues: Callback (copy), SetResellerCursorModule (upval)
			return Callback(SetResellerCursorModule(nil))
		end,
		closeFocusedScreen = function(p1)
			-- upvalues: Callback (copy), CloseFocusedScreenModule (upval)
			Callback(CloseFocusedScreenModule(p1))
		end
	}
end)(ResellersPage)))))))))

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseRoactServiceModule (copy), RoactNetworkingModule (copy), UseSelectorFunction (copy), ReactModule (copy), FetchCollectibResellersInstancesModule (copy), CatalogConstantsModule (copy), FetchAssetResellersModule (copy), UseRequestModule (copy), RequestStatusEnumModule (copy), FFlagAXMigrateResellersInputBindingsToRoactGamepad (copy), CloseFocusedScreenModule (copy), useResellersPageFocusNavigationBindings (copy), FFlagAXFixScrollAwayTopBarOverlapModule (copy), TopBarModule (copy), FFlagAppIaScrollAway (copy), AppNavBarModule (copy), WithMappedNavigationParamsModuleResult (ref), CryoModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(RoactNetworkingModule)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.AvatarExperience.Catalog.ResellerCursor.nextPageCursor
	end)
	local CollectibleItemId = p1.navigation.state.params.collectibleItemId
	local ItemId = p1.navigation.state.params.itemId
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: CollectibleItemId (copy), UseDispatchResult (copy), FetchCollectibResellersInstancesModule (upval), UseRoactServiceModuleResult (copy), CatalogConstantsModule (upval), FetchAssetResellersModule (upval), ItemId (copy)
		return if CollectibleItemId then UseDispatchResult(FetchCollectibResellersInstancesModule(UseRoactServiceModuleResult, CollectibleItemId, nil, CatalogConstantsModule.MaxResellersPerPage)) else UseDispatchResult(FetchAssetResellersModule(UseRoactServiceModuleResult, ItemId, nil, CatalogConstantsModule.MaxResellersPerPage, true))
	end, { CollectibleItemId, ItemId })
	local UseRequestModuleResult, UseRequestModuleResult2 = UseRequestModule((ReactModule.useCallback(function()
		-- upvalues: CollectibleItemId (copy), UseDispatchResult (copy), FetchCollectibResellersInstancesModule (upval), UseRoactServiceModuleResult (copy), UseSelectorResult (copy), CatalogConstantsModule (upval), FetchAssetResellersModule (upval), ItemId (copy)
		return if CollectibleItemId then UseDispatchResult(FetchCollectibResellersInstancesModule(UseRoactServiceModuleResult, CollectibleItemId, UseSelectorResult, CatalogConstantsModule.MaxResellersPerPage)) else UseDispatchResult(FetchAssetResellersModule(UseRoactServiceModuleResult, ItemId, UseSelectorResult, CatalogConstantsModule.MaxResellersPerPage, false))
	end, { CollectibleItemId, UseSelectorResult, ItemId })))
	local UseRequestModuleResult1, UseRequestModuleResult2_1 = UseRequestModule(UseResult)
	local IsStatusMatch: boolean = UseRequestModuleResult.status == RequestStatusEnumModule.Pending or UseRequestModuleResult1.status == RequestStatusEnumModule.Pending
	local UseResult1 = if FFlagAXMigrateResellersInputBindingsToRoactGamepad then ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), CloseFocusedScreenModule (upval), p1 (copy)
		UseDispatchResult(CloseFocusedScreenModule(p1.navigation))
	end, { p1.navigation, UseDispatchResult }) else nil
	local UseResellersPageFocusNavigationBindingsResult = if FFlagAXMigrateResellersInputBindingsToRoactGamepad then useResellersPageFocusNavigationBindings(nil, UseResult1) else nil
	local v1: UDim? = nil
	
	if FFlagAXFixScrollAwayTopBarOverlapModule then
		local UseSelectorResult1: number = UseSelectorFunction(TopBarModule.selectTopBarHeight)
		v1 = if FFlagAppIaScrollAway and AppNavBarModule.getScrollAwayEnabled() then UDim.new(0, 24 + UseSelectorResult1) else UDim.new(0, 24)
	end
	return ReactModule.createElement(WithMappedNavigationParamsModuleResult, CryoModule.Dictionary.join(p1, {
		loadMoreItems = UseRequestModuleResult2,
		fetchInitialItems = UseRequestModuleResult2_1,
		isFetchingMore = IsStatusMatch,
		focusNavigationRef = UseResellersPageFocusNavigationBindingsResult,
		pagePaddingTop = if FFlagAXFixScrollAwayTopBarOverlapModule then v1 else nil
	}))
end
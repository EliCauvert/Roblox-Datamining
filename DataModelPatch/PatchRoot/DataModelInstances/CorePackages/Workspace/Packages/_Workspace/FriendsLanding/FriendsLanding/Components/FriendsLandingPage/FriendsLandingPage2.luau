local FriendsLanding = script:FindFirstAncestor("FriendsLanding")
local DependenciesModule = require(FriendsLanding.dependencies)
local Parent = FriendsLanding.Parent
local ReactModule = require(Parent.React)
local RoactModule = require(Parent.Roact)
local UIBlox = DependenciesModule.UIBlox
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local UseUiModeInfoFunction = require(Parent.RobloxAppHooks).useUiModeInfo
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local UiMode = require(Parent.RobloxAppEnums).UiMode
local RobloxAppEnumsModule = require(Parent.RobloxAppEnums)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local InputHandlersModule = require(Parent.InputHandlers)
local _ = require(Parent.PlayerContextualMenu)
local DependencyArrayFunction = require(Parent.RoactUtils).Hooks.dependencyArray
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local CollectionGrid = require(Parent.CollectionViews).CollectionGrid
local HorizontalPageMargin = UIBlox.App.Container.HorizontalPageMargin
local GetPageMarginFunction = UIBlox.App.Container.getPageMargin
local ConvertUserPresenceTypeToStringFunction = require(Parent.SocialCommon).Utils.convertUserPresenceTypeToString
local UseFocusGuiObjectFunction = DependenciesModule.useFocusGuiObject
local FriendsLandingContextModule = require(FriendsLanding.FriendsLandingContext)
local FriendsLandingAnalyticsModule = require(FriendsLanding.FriendsLandingAnalytics)
local RefreshScrollingFrame = DependenciesModule.SocialLibraries.Components.RefreshScrollingFrame
local GridMetrics = UIBlox.App.Grid.GridMetrics
local EnumScreensModule = require(FriendsLanding.EnumScreens)
local FilterStatesModule = require(FriendsLanding.Friends.filterStates)
local ButtonClickEventsModule = require(FriendsLanding.FriendsLandingAnalytics.ButtonClickEvents)
local ConstantsModule = require(FriendsLanding.Common.Constants)
local UseAnimatedScrollToSelectionFunction = require(Parent.RobloxAppHooks).useAnimatedScrollToSelection
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local DisplayModule = require(Parent.Display)
local UseFocusOnMountFunction = require(Parent.FocusNavigationUtils).useFocusOnMount
local FilterByButtonModule = require(FriendsLanding.Components.FilterByButton)
local FriendTileModule = require(FriendsLanding.Components.FriendTile)
local EmptyResultsViewModule = require(FriendsLanding.Components.EmptyResultsView)
local NoFriendsViewModule = require(FriendsLanding.Components.NoFriendsView)
local IsFromConnectionsHubModule = require(FriendsLanding.Navigator.isFromConnectionsHub)
local AmpApiProvider = require(Parent.AmpUpsell).AmpApiProvider
local AccessResponseEnum = require(Parent.AmpUpsell).AmpEnums.AccessResponseEnum
local Button = UIBlox.App.Button.Button
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local UseTextSizeOffsetFunction = UIBlox.Core.Style.useTextSizeOffset
local AppPage = require(Parent.RobloxAppEnums).AppPage
local UserListModule = require(Parent.UserList)
local UserListLayoutAdaptor = UserListModule.UserListLayoutAdaptor
local LayoutMode = UserListModule.Enums.LayoutMode

local function OnFewestInteractionsSelection() end

local FFlagFixScalingOnFriendsLandingModule = require(FriendsLanding.Flags.FFlagFixScalingOnFriendsLanding)
local FFlagConnectionManagementChips = require(Parent.SharedFlags).FFlagConnectionManagementChips
local FFlagCreateConnectionsHub = require(Parent.SharedFlags).FFlagCreateConnectionsHub
local FFlagFixCohubUiBugs = require(Parent.SharedFlags).FFlagFixCohubUiBugs
local FFlagFriendsPageAlwaysOpenPPV = require(Parent.SharedFlags).FFlagFriendsPageAlwaysOpenPPV
local FFlagFriendsPageUserListEnabled = require(Parent.SharedFlags).FFlagFriendsPageUserListEnabled
local FFlagExtendScrollingFramesBySafeInsets = require(Parent.SharedFlags).FFlagExtendScrollingFramesBySafeInsets
local FFlagEnableLeftNavOnConsole = require(Parent.SharedFlags).FFlagEnableLeftNavOnConsole
local FStringIsUserInTcEligibleCountryAmpFeature = require(Parent.SharedFlags).FStringIsUserInTcEligibleCountryAmpFeature
local FStringCanAccessTrustedContactsAmpNameSpace = require(Parent.SharedFlags).FStringCanAccessTrustedContactsAmpNameSpace
local FixSearchYNavigation = game:DefineFastFlag("FixSearchYNavigation", false)
local FixFriendsLandingRightMargin = game:DefineFastFlag("FixFriendsLandingRightMargin", false)
local FFlagLuaAppsDefaultSelection = require(Parent.SharedFlags).FFlagLuaAppsDefaultSelection

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), FriendsLandingContextModule (copy), FriendsLandingAnalyticsModule (copy), UseNavigationFunction (copy), UseDesignTokensFunction (copy), UseUiModeInfoFunction (copy), FFlagFixScalingOnFriendsLandingModule (copy), UseTokensFunction (copy), UseFocusGuiObjectFunction (copy), FFlagFixCohubUiBugs (copy), GetPageMarginFunction (copy), UseScreenSizeFunction (copy), UiMode (copy), FocusNavigationUtilsModule (copy), InputHandlersModule (copy), FixSearchYNavigation (copy), FFlagEnableLeftNavOnConsole (copy), AppPage (copy), RobloxAppEnumsModule (copy), EnumScreensModule (copy), ReactFocusNavigationModule (copy), FocusNavigationEventNameEnum (copy), UseTextSizeOffsetFunction (copy), FFlagConnectionManagementChips (copy), AmpApiProvider (copy), FStringIsUserInTcEligibleCountryAmpFeature (copy), FStringCanAccessTrustedContactsAmpNameSpace (copy), AccessResponseEnum (copy), FFlagFriendsPageAlwaysOpenPPV (copy), ConvertUserPresenceTypeToStringFunction (copy), ButtonClickEventsModule (copy), ConstantsModule (copy), FFlagFriendsPageUserListEnabled (copy), FriendTileModule (copy), DependencyArrayFunction (copy), OnFewestInteractionsSelection (copy), FilterStatesModule (copy), FFlagCreateConnectionsHub (copy), GridMetrics (copy), UseAnimatedScrollToSelectionFunction (copy), FFlagExtendScrollingFramesBySafeInsets (copy), UseSignalStateFunction (copy), DisplayModule (copy), IsFromConnectionsHubModule (copy), FFlagLuaAppsDefaultSelection (copy), UseFocusOnMountFunction (copy), RoactModule (copy), HorizontalPageMargin (copy), FixFriendsLandingRightMargin (copy), RefreshScrollingFrame (copy), FilterByButtonModule (copy), EmptyResultsViewModule (copy), NoFriendsViewModule (copy), UserListLayoutAdaptor (copy), LayoutMode (copy), CollectionGrid (copy), Button (copy), ButtonType (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		pageError = "CommonUI.Messages.Response.PageError",
		successText = "Feature.Friends.Action.FriendRemoved",
		errorText = "Feature.Toast.NetworkingError.SomethingIsWrong",
		friends = "CommonUI.Features.Label.Friends",
		showMore = "Feature.Avatar.Action.ShowMore"
	})
	local UseContextResult = ReactModule.useContext(FriendsLandingContextModule.Context)
	local UseContextResult1 = ReactModule.useContext(FriendsLandingAnalyticsModule.Context)
	local UseNavigationResult = UseNavigationFunction()
	local NavigateToLuaAppPages = UseContextResult.navigateToLuaAppPages
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseUiModeInfoResult = UseUiModeInfoFunction()
	local UseTokensResult = if FFlagFixScalingOnFriendsLandingModule then UseTokensFunction() else nil
	local UseFocusGuiObjectResult = UseFocusGuiObjectFunction()
	local PageMargin = if FFlagFixCohubUiBugs then GetPageMarginFunction(UseScreenSizeFunction().X) else nil
	local IsUiModeMatch = UseUiModeInfoResult.uiMode == UiMode.TenFoot
	local IsCursor = FocusNavigationUtilsModule.useLastInputMode() == "Cursor"
	local UseEventResult = ReactFocusNavigationModule.useEventHandler(FocusNavigationEventNameEnum.Search, (InputHandlersModule.onRelease(function(p2)
		-- upvalues: FixSearchYNavigation (upval), IsUiModeMatch (copy), FFlagEnableLeftNavOnConsole (upval), UseNavigationResult (copy), AppPage (upval), RobloxAppEnumsModule (upval), NavigateToLuaAppPages (copy), EnumScreensModule (upval)
		p2:cancel()
		
		if not FixSearchYNavigation then
			NavigateToLuaAppPages[EnumScreensModule.SearchPage]()
			
			return
		end
		if IsUiModeMatch and not FFlagEnableLeftNavOnConsole then
			UseNavigationResult.navigate(AppPage.SearchPage, {
				defaultSearchType = RobloxAppEnumsModule.SearchTypes.Players
			})
			
			return
		else
			UseNavigationResult.navigate(AppPage.UserSearch, { shouldShowUserSearchLandingPage = true })
		end
	end)))
	local UseTextSizeOffsetResult: number = UseTextSizeOffsetFunction()
	local NewUseTextSizeOffsetResult = (if IsUiModeMatch then UseDesignTokensResult.Size.Size_1600 else UseDesignTokensResult.Size.Size_2000) + UseTextSizeOffsetResult * 3
	local v1 = nil
	local Callback = nil
	
	if FFlagConnectionManagementChips then
		v1, Callback = ReactModule.useState(false)
	end
	ReactModule.useEffect(function()
		-- upvalues: UseContextResult1 (copy), FFlagConnectionManagementChips (upval), AmpApiProvider (upval), FStringIsUserInTcEligibleCountryAmpFeature (upval), FStringCanAccessTrustedContactsAmpNameSpace (upval), AccessResponseEnum (upval), Callback (ref)
		UseContextResult1:pageMountingTimeReport()
		
		if FFlagConnectionManagementChips and AmpApiProvider.upsellFeatureAccess(FStringIsUserInTcEligibleCountryAmpFeature, {}, FStringCanAccessTrustedContactsAmpNameSpace).access == AccessResponseEnum.Granted then
			Callback(true)
		end
	end, {})
	local UseResult = if FFlagFriendsPageAlwaysOpenPPV then nil else ReactModule.useCallback(function(p2)
		-- upvalues: UseContextResult (copy), ConvertUserPresenceTypeToStringFunction (upval)
		return function()
			-- upvalues: UseContextResult (upval), p2 (copy), ConvertUserPresenceTypeToStringFunction (upval)
			UseContextResult.openPlayerContextualMenu({
				friendshipOriginSourceType = nil,
				subjectUserId = p2.id,
				robloxFriendshipStatus = Enum.FriendStatus.Friend,
				subjectPresence = {
					locationString = p2.lastLocation,
					locationPlaceId = p2.placeId,
					locationRootPlaceId = p2.rootPlaceId,
					locationUniverseId = p2.universeId,
					status = ConvertUserPresenceTypeToStringFunction(p2.userPresenceType)
				}
			})
		end
	end, { UseContextResult.openPlayerContextualMenu })
	local UseResult1 = ReactModule.useCallback(function(FriendId, p2, _, _, _)
		-- upvalues: UseContextResult1 (copy), EnumScreensModule (upval), ButtonClickEventsModule (upval), UseContextResult (copy), ConstantsModule (upval)
		return function()
			-- upvalues: UseContextResult1 (upval), EnumScreensModule (upval), ButtonClickEventsModule (upval), FriendId (copy), p2 (copy), UseContextResult (upval), ConstantsModule (upval)
			UseContextResult1:navigate(EnumScreensModule.ViewUserProfile)
			UseContextResult1:buttonClick(ButtonClickEventsModule.PlayerTile, {
				subpage = "peekView",
				page = "playerProfile",
				friendId = FriendId,
				position = p2 - 1
			})
			UseContextResult.openProfilePeekView(FriendId, { source = ConstantsModule.FriendsLandingPageSourceName })
		end
	end, { UseContextResult1, UseContextResult.openProfilePeekView })
	local UseResult2 = if FFlagFriendsPageUserListEnabled then ReactModule.useCallback(function(FriendId, p2: number)
		-- upvalues: UseContextResult1 (copy), EnumScreensModule (upval), ButtonClickEventsModule (upval), UseContextResult (copy), ConstantsModule (upval)
		UseContextResult1:navigate(EnumScreensModule.ViewUserProfile)
		UseContextResult1:buttonClick(ButtonClickEventsModule.PlayerTile, {
			subpage = "peekView",
			page = "playerProfile",
			friendId = FriendId,
			position = p2 - 1
		})
		UseContextResult.openProfilePeekView(FriendId, { source = ConstantsModule.FriendsLandingPageSourceName })
	end, { UseContextResult1 }) else nil
	
	local function PageLoadingTimeReport()
		-- upvalues: UseContextResult1 (copy)
		UseContextResult1:pageLoadingTimeReport()
	end
	
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy), EnumScreensModule (upval), UseLocalizationResult (copy)
		return function()
			-- upvalues: UseNavigationResult (upval), EnumScreensModule (upval), UseLocalizationResult (upval)
			UseNavigationResult.navigate(EnumScreensModule.GenericToast, {
				toastProps = {
					toastContent = { toastTitle = UseLocalizationResult.errorText }
				}
			})
		end
	end, { UseNavigationResult, UseLocalizationResult })
	local UseResult4 = ReactModule.useCallback(function(User, Index)
		-- upvalues: ReactModule (upval), FriendTileModule (upval), FFlagFriendsPageAlwaysOpenPPV (upval), UseResult1 (copy), IsUiModeMatch (copy), UseResult (copy), UseResult3 (copy), PageLoadingTimeReport (copy), p1 (copy), UseFocusGuiObjectResult (copy)
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			LayoutOrder = Index
		}, {
			tile = ReactModule.createElement(FriendTileModule, {
				user = User,
				index = Index,
				openPlayerProfile = if FFlagFriendsPageAlwaysOpenPPV then UseResult1 elseif IsUiModeMatch then if UseResult == nil then UseResult3 else UseResult else UseResult1,
				isPlayerContextualMenuEnabled = IsUiModeMatch,
				pageLoadingTimeReport = PageLoadingTimeReport,
				selected = Index == p1.selectedItemIndex,
				focusGuiObject = UseFocusGuiObjectResult
			})
		}), "FriendTile"
	end, {
		p1.selectedItemIndex,
		IsUiModeMatch,
		if FFlagFriendsPageAlwaysOpenPPV then nil else UseResult,
		UseResult1
	})
	local UseResult5 = ReactModule.useCallback(function(p2)
		-- upvalues: NewUseTextSizeOffsetResult (ref)
		return p2 + NewUseTextSizeOffsetResult
	end, DependencyArrayFunction(NewUseTextSizeOffsetResult, UseTextSizeOffsetResult))
	local UseResult6 = ReactModule.useCallback(function()
		-- upvalues: UseContextResult1 (copy), ButtonClickEventsModule (upval), UseNavigationResult (copy), EnumScreensModule (upval), OnFewestInteractionsSelection (upval), p1 (copy)
		UseContextResult1:buttonClick(ButtonClickEventsModule.FriendFilterPill)
		UseNavigationResult.navigate(EnumScreensModule.FilterByModal, {
			onFewestInteractionsSelection = OnFewestInteractionsSelection,
			friendCount = p1.totalFriendCount
		})
	end, DependencyArrayFunction(UseNavigationResult, UseContextResult1))
	local UseResult7 = if FFlagConnectionManagementChips then ReactModule.useCallback(function(p2)
		-- upvalues: UseContextResult1 (copy), ButtonClickEventsModule (upval), UseContextResult (copy)
		UseContextResult1:buttonClick(ButtonClickEventsModule.FriendFilterPill)
		UseContextResult.setFilterKeys(p2)
	end, DependencyArrayFunction(UseContextResult1, UseContextResult.setFilterKeys)) else nil
	local UseResult8 = ReactModule.useCallback(function()
		-- upvalues: UseContextResult1 (copy), UseContextResult (copy), FilterStatesModule (upval), UseLocalizationResult (copy)
		UseContextResult1:pageLoaded()
		UseContextResult.setFilterKeys(FilterStatesModule.All)
		
		return UseContextResult.refreshPage({
			errorMessage = UseLocalizationResult.pageError,
			onResolve = function()
				-- upvalues: UseContextResult1 (upval)
				UseContextResult1:pageLoadedWithArgs()
			end
		})
	end, DependencyArrayFunction(UseContextResult.refreshPage, UseLocalizationResult, UseContextResult1, UseContextResult.setFilterKeys))
	local UseResult9 = ReactModule.useCallback(function()
		-- upvalues: UseContextResult1 (copy), ButtonClickEventsModule (upval), EnumScreensModule (upval), FFlagCreateConnectionsHub (upval), UseNavigationResult (copy), AppPage (upval)
		UseContextResult1:buttonClick(ButtonClickEventsModule.AddFriendsNoFriendsEmptyView)
		UseContextResult1:navigate(EnumScreensModule.AddFriends)
		
		if FFlagCreateConnectionsHub then
			UseNavigationResult.navigate(AppPage.CoHubAddConnections)
			
			return
		else
			UseNavigationResult.navigate(AppPage.AddFriendsPage)
		end
	end, DependencyArrayFunction(UseContextResult1, UseNavigationResult))
	local CountFriends: number = p1.friends and #p1.friends or 0
	local TotalFriendCount = p1.totalFriendCount or 0
	local IsTotalFriendCountMatch = TotalFriendCount == 0
	local IsTotalFriendCountAbove: boolean = CountFriends == 0 and TotalFriendCount > 0
	local NoFilter: boolean = p1.fetchMoreFriends and (not IsTotalFriendCountMatch and (not IsTotalFriendCountAbove and (not UseContextResult.filter or UseContextResult.filter == FilterStatesModule.All)))
	local UseResult10 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		if p1.fetchMoreFriends then
			p1.fetchMoreFriends()
		end
	end, { p1.fetchMoreFriends })
	local VerticalPadding: number = if IsUiModeMatch then 24 else 12
	local UseStateResult, UseStateResult2 = ReactModule.useState(100)
	local GridViewItemMetrics = nil
	local GridHorizontalSpacing = nil
	
	if IsUiModeMatch then
		GridViewItemMetrics = UseDesignTokensResult.LuaApps.FriendsLanding.FriendsLandingPage.GridViewItemMetrics
		GridHorizontalSpacing = UseDesignTokensResult.LuaApps.FriendsLanding.FriendsLandingPage.GridHorizontalSpacing
	else
		GridViewItemMetrics = {
			minimumItemsPerRow = 2,
			minimumItemWidth = if FFlagFixScalingOnFriendsLandingModule then 176 * UseTokensResult.Config.UI.Scale else 176
		}
		GridHorizontalSpacing = 12
	end
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GridMetrics (upval), GridViewItemMetrics (ref)
		return GridMetrics.makeCustomMetricsGetter(GridViewItemMetrics)
	end, { GridViewItemMetrics })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseMemoResult (copy), UseStateResult (copy), GridHorizontalSpacing (ref)
		return UseMemoResult(UseStateResult, GridHorizontalSpacing)
	end, { UseMemoResult })
	local UseResult11 = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(p2.X)
	end, {})
	local UseRefResult = ReactModule.useRef({})
	local UseAnimatedScrollToSelectionResult, UseAnimatedScrollToSelectionResult2 = UseAnimatedScrollToSelectionFunction(Enum.ScrollingDirection.Y, 0, UseDesignTokensResult.Size.Size_2000, UseDesignTokensResult.LuaApps.App.Page.ScrollAnimationConfig)
	local UseSignalStateResult = if FFlagExtendScrollingFramesBySafeInsets then UseSignalStateFunction(DisplayModule.GetDisplayStore().getDeviceSafePadding) else nil
	local IsFromConnectionsHubModule1 = FFlagCreateConnectionsHub and IsFromConnectionsHubModule(UseNavigationResult)
	local UseFocusOnMountResult = if FFlagLuaAppsDefaultSelection then UseFocusOnMountFunction() else nil
	local UseResult12 = if FFlagFriendsPageUserListEnabled then ReactModule.useCallback(function(CreateRow, User, Index)
		-- upvalues: ReactModule (upval), FriendTileModule (upval), UseResult2 (copy), PageLoadingTimeReport (copy)
		return ReactModule.createElement(FriendTileModule, {
			isPlayerContextualMenuEnabled = nil,
			user = User,
			createRow = CreateRow,
			index = Index,
			openPlayerProfileHandle = UseResult2,
			pageLoadingTimeReport = PageLoadingTimeReport
		})
	end, { PageLoadingTimeReport, UseResult2 }) else nil
	
	return ReactModule.createElement("Frame", {
		[RoactModule.Ref] = UseEventResult,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = if IsFromConnectionsHubModule1 then nil else UseDesignTokensResult.LuaApps.App.Page.BackgroundColor,
		BackgroundTransparency = if IsFromConnectionsHubModule1 then 1 else UseDesignTokensResult.LuaApps.App.Page.BackgroundTransparency
	}, {
		HorizontalPageMargin = ReactModule.createElement(HorizontalPageMargin, { backgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
			Padding = if FFlagFixCohubUiBugs then ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, PageMargin),
				PaddingRight = if FixFriendsLandingRightMargin then UDim.new(0, PageMargin) else nil
			}) else nil,
			scrollView = ReactModule.createElement(RefreshScrollingFrame, {
				scrollingElementProps = {
					Size = UDim2.new(1, 0, 1, -ConstantsModule.TOP_BAR_HEIGHT + (FFlagExtendScrollingFramesBySafeInsets and UseSignalStateResult.bottom or 0)),
					BackgroundTransparency = 1,
					ScrollingDirection = Enum.ScrollingDirection.Y,
					ScrollBarThickness = 0,
					CanvasSize = UDim2.new(1, 0, 0, 0),
					AutomaticCanvasSize = Enum.AutomaticSize.XY,
					CanvasPosition = UseAnimatedScrollToSelectionResult,
					[RoactModule.Event.SelectionChanged] = UseAnimatedScrollToSelectionResult2,
					Selectable = not FFlagEnableLeftNavOnConsole and nil
				},
				[RoactModule.Ref] = UseRefResult,
				refresh = UseResult8,
				usesBuilderIcon = true
			}, {
				UISizeConstraint = if FFlagFriendsPageUserListEnabled then ReactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(640, 1e999) }) else nil,
				layout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical
				}),
				pulldownSpacing = ReactModule.createElement("Frame", {
					LayoutOrder = 0,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 1)
				}) or nil,
				filterByButton = if IsUiModeMatch then nil else ReactModule.createElement(FilterByButtonModule, {
					layoutOrder = 2,
					analytics = UseContextResult1,
					filter = UseContextResult.filter,
					friendCount = if UseContextResult.filter == FilterStatesModule.All then TotalFriendCount else CountFriends,
					isDisabled = TotalFriendCount == 0,
					onActivated = if FFlagConnectionManagementChips then UseResult7 else UseResult6,
					maxWidth = if FFlagConnectionManagementChips then 640 else nil,
					canAccessTrustedContacts = if FFlagConnectionManagementChips then v1 else nil
				}),
				NoResultsView = if IsTotalFriendCountAbove then ReactModule.createElement(EmptyResultsViewModule, { layoutOrder = 6 }) else nil,
				NoFriendsView = if IsTotalFriendCountMatch then ReactModule.createElement(NoFriendsViewModule, {
					layoutOrder = 6,
					pageLoadingTimeReport = PageLoadingTimeReport,
					openAddFriendsPage = UseResult9
				}) else nil,
				UserListLayoutAdaptor = if FFlagFriendsPageUserListEnabled then if IsTotalFriendCountAbove or IsTotalFriendCountMatch then nil else ReactModule.createElement(UserListLayoutAdaptor, {
					layoutOrder = 6,
					isScrollEnabled = false,
					layoutMode = LayoutMode.Vertical,
					header = { title = UseLocalizationResult.peopleYouMayKnow },
					entities = p1.friends,
					renderRow = UseResult12,
					hasMore = NoFilter,
					onLoadMore = UseResult10
				}) else nil,
				FriendsGridView = if FFlagFriendsPageUserListEnabled then nil elseif IsTotalFriendCountAbove or IsTotalFriendCountMatch then nil else ReactModule.createElement(CollectionGrid, {
					LayoutOrder = 6,
					containerRef = if FFlagLuaAppsDefaultSelection then UseFocusOnMountResult else nil,
					items = p1.friends,
					verticalScrollingFrameRef = UseRefResult,
					renderItem = UseResult4,
					getItemHeight = UseResult5,
					numColumns = UseMemoResult1.itemsPerRow,
					columnGap = GridHorizontalSpacing,
					verticalPadding = VerticalPadding,
					onContainerSizeChanged = UseResult11
				}),
				showMoreFrame = if FFlagFriendsPageUserListEnabled then nil elseif NoFilter then ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 7,
					Size = UDim2.new(1, 0, 0, ConstantsModule.CTA_BUTTON_HEIGHT)
				}, {
					UIPadding = ReactModule.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, 2),
						PaddingRight = UDim.new(0, 2),
						PaddingTop = UDim.new(0, 10)
					}),
					showMoreButton = ReactModule.createElement(Button, {
						buttonType = ButtonType.Secondary,
						size = UDim2.new(1, 0, 1, 0),
						onActivated = UseResult10,
						text = UseLocalizationResult.showMore
					})
				}) else nil,
				additionalPadding = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 8,
					Size = UDim2.new(1, 0, 0, (if IsUiModeMatch then if IsTotalFriendCountMatch or IsTotalFriendCountAbove or IsCursor then 8 else 1000 else 8) + (if FFlagExtendScrollingFramesBySafeInsets then UseSignalStateResult.bottom else 0))
				})
			})
		})
	})
end
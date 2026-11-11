local Parent = script:FindFirstAncestor("AddFriends").Parent
local ReactModule = require(Parent.React)
local RoactModule = require(Parent.Roact)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UseAnimatedScrollToSelectionFunction = require(Parent.RobloxAppHooks).useAnimatedScrollToSelection
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local RobloxAppHooksModule = require(Parent.RobloxAppHooks)
local UIBloxModule = require(Parent.UIBlox)
local RobloxAppEnumsModule = require(Parent.RobloxAppEnums)
local InputHandlersModule = require(Parent.InputHandlers)
local UserSearchBarButton = require(Parent.SocialCommon).Components.UserSearchBar.UserSearchBarButton
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local DisplayModule = require(Parent.Display)
local AddFriendsSelectorFunction = require(Parent.AddFriendsState).AddFriendsSelector
local Parent1 = script.Parent.Parent
local AddFriendsTileModule = require(Parent1.AddFriendsTile)
local AddFriendsEmptyStateModule = require(Parent1.AddFriendsEmptyState)
local AddFriendsPageHeaderModule = require(Parent1.AddFriendsPageHeader)
local TrustedContactsEducationBannerModule = require(Parent1.TrustedContactsEducationBanner)
local ConnectionChannelsSectionModule = require(Parent1.ConnectionChannelsSection)
local FriendRequestsSectionModule = require(Parent1.FriendRequestsSection)
local FriendRecommendationsSectionModule = require(Parent1.FriendRecommendationsSection)
local FAEEligibleBannerModule = require(Parent1.FAEEligibleBanner)
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local UseLastInputModeFunction = FocusNavigationUtilsModule.useLastInputMode
local UseScreenSizeFunction = RobloxAppHooksModule.useScreenSize
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local AppPage = RobloxAppEnumsModule.AppPage
local Sources = require(Parent.SocialLuaAnalytics).Analytics.Enums.Sources
local RefreshScrollingFrame = require(Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Components.RefreshScrollingFrame
local GetPageMarginFunction = UIBloxModule.App.Container.getPageMargin
local VerticalScrollViewWithMargin = UIBloxModule.App.Container.VerticalScrollViewWithMargin
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local UseUiModeInfoFunction = RobloxAppHooksModule.useUiModeInfo
local UiMode = RobloxAppEnumsModule.UiMode
local FFlagCreateConnectionsHub = require(Parent.SharedFlags).FFlagCreateConnectionsHub
local FFlagFixCohubUiBugs = require(Parent.SharedFlags).FFlagFixCohubUiBugs
local FFlagEnableLeftNavOnConsole = require(Parent.SharedFlags).FFlagEnableLeftNavOnConsole
local FFlagAddFriendsRenderTileRefactor = require(Parent.SharedFlags).FFlagAddFriendsRenderTileRefactor
local FFlagAddFriendsUserListEnabled = require(Parent.SharedFlags).FFlagAddFriendsUserListEnabled
local FFlagExtendScrollingFramesBySafeInsets = require(Parent.SharedFlags).FFlagExtendScrollingFramesBySafeInsets
local FFlagAFPConnectionsChannelsHeader = require(Parent.SharedFlags).FFlagAFPConnectionsChannelsHeader

return function(p1)
	-- upvalues: UseScreenSizeFunction (copy), UseNavigationFunction (copy), UseLastInputModeFunction (copy), UseUiModeInfoFunction (copy), UiMode (copy), FFlagEnableLeftNavOnConsole (copy), FFlagCreateConnectionsHub (copy), AppPage (copy), ReactModule (copy), RobloxAppEnumsModule (copy), InputHandlersModule (copy), ReactFocusNavigationModule (copy), FocusNavigationEventNameEnum (copy), UseDesignTokensFunction (copy), FFlagFixCohubUiBugs (copy), UseTokensFunction (copy), UseAnimatedScrollToSelectionFunction (copy), FFlagAddFriendsRenderTileRefactor (copy), AddFriendsTileModule (copy), UseSelectorFunction (copy), AddFriendsSelectorFunction (copy), Sources (copy), GetPageMarginFunction (copy), AddFriendsEmptyStateModule (copy), FFlagExtendScrollingFramesBySafeInsets (copy), UseSignalStateFunction (copy), DisplayModule (copy), RoactModule (copy), RefreshScrollingFrame (copy), VerticalScrollViewWithMargin (copy), FFlagAddFriendsUserListEnabled (copy), TrustedContactsEducationBannerModule (copy), ConnectionChannelsSectionModule (copy), FriendRequestsSectionModule (copy), FriendRecommendationsSectionModule (copy), AddFriendsPageHeaderModule (copy), FFlagAFPConnectionsChannelsHeader (copy), FAEEligibleBannerModule (copy), UserSearchBarButton (copy)
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseLastInputModeResult = UseLastInputModeFunction()
	local IsFocus = UseLastInputModeResult == "Focus"
	local IsCursor = UseLastInputModeResult == "Cursor"
	local UseUiModeInfoResult = UseUiModeInfoFunction()
	local IsUiModeMatch: boolean = UseUiModeInfoResult and UseUiModeInfoResult.uiMode == UiMode.TenFoot
	local NoIsUiModeMatch = not IsUiModeMatch or FFlagEnableLeftNavOnConsole
	local NoIsUiModeMatch1 = not IsUiModeMatch or FFlagEnableLeftNavOnConsole
	
	if FFlagCreateConnectionsHub and UseNavigationResult.state.routeName == AppPage.CoHubAddConnections then
		NoIsUiModeMatch1 = false
		NoIsUiModeMatch = false
	end
	local UseEventResult = ReactFocusNavigationModule.useEventHandler(FocusNavigationEventNameEnum.Search, (InputHandlersModule.onRelease((ReactModule.useCallback(function(p2)
		-- upvalues: NoIsUiModeMatch (ref), UseNavigationResult (copy), AppPage (upval), RobloxAppEnumsModule (upval), p1 (copy)
		if NoIsUiModeMatch then
			p2:cancel()
			UseNavigationResult.navigate(AppPage.UserSearch, { shouldShowUserSearchLandingPage = true })
			p1.fireSearchbarPressedEvent()
			
			return
		else
			p2:cancel()
			UseNavigationResult.navigate(AppPage.SearchPage, {
				defaultSearchType = RobloxAppEnumsModule.SearchTypes.Players
			})
		end
	end, {
		UseNavigationResult,
		p1.fireSearchbarPressedEvent,
		p1.navigateToLuaAppPages,
		NoIsUiModeMatch
	})))))
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseTokensResult = if FFlagFixCohubUiBugs then UseTokensFunction() else nil
	local UseAnimatedScrollToSelectionResult, UseAnimatedScrollToSelectionResult2 = UseAnimatedScrollToSelectionFunction(Enum.ScrollingDirection.Y, 0, UseDesignTokensResult.Size.Size_1200, UseDesignTokensResult.LuaApps.App.Page.ScrollAnimationConfig)
	
	if not IsFocus then
		UseAnimatedScrollToSelectionResult = nil
	end
	if not IsFocus then
		UseAnimatedScrollToSelectionResult2 = nil
	end
	local Size1200: number = UseDesignTokensResult.Size.Size_1200
	local UseResult = if FFlagAddFriendsRenderTileRefactor then nil else ReactModule.useCallback(function(User, X, Y, LayoutOrder, LayoutOrder1, ImpressionsTag)
		-- upvalues: ReactModule (upval), AddFriendsTileModule (upval)
		return ReactModule.createElement(AddFriendsTileModule, {
			layoutOrder = LayoutOrder,
			position = LayoutOrder,
			user = User,
			size = Vector2.new(X, Y),
			isFriendRequest = not User.isRecommendation,
			isRecommendation = User.isRecommendation,
			selected = LayoutOrder == LayoutOrder1,
			impressionsTag = ImpressionsTag
		})
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy), AppPage (upval), Sources (upval), p1 (copy)
		UseNavigationResult.navigate(AppPage.UserSearch, {
			shouldShowUserSearchLandingPage = true,
			entryPoint = Sources.AddFriendsPage
		})
		p1.fireSearchbarPressedEvent()
	end, { UseNavigationResult, p1.fireSearchbarPressedEvent })
	local PagePaddingTop = UseDesignTokensResult.LuaApps.FriendsLanding.AddFriendsPage.PagePaddingTop or 0
	local SafeAreaMargin = UseDesignTokensResult.LuaApps.App.Page.SafeAreaMargin
	local X = if SafeAreaMargin.X > 0 and not FFlagEnableLeftNavOnConsole then SafeAreaMargin.X else GetPageMarginFunction(UseScreenSizeResult.X)
	local CountFriendRecommendations: number = p1.friendRecommendations and #p1.friendRecommendations or 0
	local IsUseSelectorResultAbove = UseSelectorFunction(function(p2)
		-- upvalues: AddFriendsSelectorFunction (upval)
		return AddFriendsSelectorFunction(p2, "Friends.requests.receivedCount")
	end) > 0
	local IsCountFriendRecommendationsAbove = CountFriendRecommendations > 0
	local Inverted = not (IsUseSelectorResultAbove or IsCountFriendRecommendationsAbove)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), AddFriendsEmptyStateModule (upval)
		return ReactModule.createElement(AddFriendsEmptyStateModule, { layoutOrder = 4 })
	end, {})
	local ScaledSize = if NoIsUiModeMatch then Size1200 * -2 else -Size1200
	
	if FFlagExtendScrollingFramesBySafeInsets then
		ScaledSize += UseSignalStateFunction(DisplayModule.GetDisplayStore().getDeviceSafePadding).bottom
	end
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = UseDesignTokensResult.LuaApps.App.Page.BackgroundColor,
		BackgroundTransparency = UseDesignTokensResult.LuaApps.App.Page.BackgroundTransparency
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center
		}),
		AddFriendsPageHeader = if NoIsUiModeMatch1 then RoactModule.createElement(AddFriendsPageHeaderModule, {
			topBarHeight = Size1200,
			layoutOrder = if FFlagAFPConnectionsChannelsHeader then -2 else nil
		}) else nil,
		FAEEligibleBanner = if FFlagAFPConnectionsChannelsHeader then ReactModule.createElement(FAEEligibleBannerModule, { layoutOrder = -1 }) else nil,
		SearchbarButton = if NoIsUiModeMatch then ReactModule.createElement(UserSearchBarButton, { onActivated = UseResult1 }) else nil,
		(RoactModule.createFragment({
			pagePadding = ReactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, PagePaddingTop) }),
			page = ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundColor3 = UseDesignTokensResult.LuaApps.App.Page.BackgroundColor,
				BackgroundTransparency = UseDesignTokensResult.LuaApps.App.Page.BackgroundTransparency,
				ref = UseEventResult
			}, {
				contentFrame = ReactModule.createElement("Frame", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1)
				}, {
					ScrollView = ReactModule.createElement(RefreshScrollingFrame, {
						usesBuilderIcon = true,
						ScrollingElement = VerticalScrollViewWithMargin,
						scrollingElementProps = {
							size = UDim2.new(1, 0, 1, ScaledSize),
							useAutomaticCanvasSize = IsCountFriendRecommendationsAbove or IsUseSelectorResultAbove,
							canvasSizeY = UDim.new(1, 1),
							paddingHorizontal = X,
							Selectable = if FFlagAddFriendsUserListEnabled then true else false,
							onSelectionChanged = UseAnimatedScrollToSelectionResult2,
							CanvasPosition = UseAnimatedScrollToSelectionResult,
							ScrollingEnabled = IsCursor
						},
						refresh = p1.refreshPage
					}, {
						UISizeConstraint = if FFlagAddFriendsUserListEnabled then ReactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(640, 1e999) }) else nil,
						layout = ReactModule.createElement("UIListLayout", {
							SortOrder = Enum.SortOrder.LayoutOrder,
							FillDirection = Enum.FillDirection.Vertical,
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							Padding = UDim.new(0, UseDesignTokensResult.Size.Size_300)
						}),
						UIPadding = ReactModule.createElement("UIPadding", {
							PaddingTop = if FFlagFixCohubUiBugs and FFlagCreateConnectionsHub then UDim.new(0, UseTokensResult.Padding.XLarge) else UDim.new(0, 8)
						}),
						TrustedContactsEducationBanner = ReactModule.createElement(TrustedContactsEducationBannerModule, { maxWidth = 640, layoutOrder = 1 }),
						ConnectionChannelsSection = ReactModule.createElement(ConnectionChannelsSectionModule, {
							layoutOrder = 2,
							navigateToLuaAppPages = p1.navigateToLuaAppPages
						}),
						requestSection = if IsUseSelectorResultAbove then ReactModule.createElement(FriendRequestsSectionModule, {
							LayoutOrder = 4,
							renderAddFriendsTile = if FFlagAddFriendsRenderTileRefactor then nil else UseResult,
							initialRequestsRows = p1.initialRequestsRows,
							requestsPageSize = p1.requestsPageSize,
							handleLoadMoreRequests = p1.handleLoadMoreRequests,
							friendRequests = p1.friendRequests
						}) else nil,
						inbetweenUserGridsPadding = if IsUseSelectorResultAbove then ReactModule.createElement("Frame", {
							LayoutOrder = 5,
							BorderSizePixel = 0,
							BackgroundTransparency = 1,
							Size = UDim2.fromOffset(0, UseDesignTokensResult.Size.Size_400)
						}) else nil,
						recommendationSection = if IsCountFriendRecommendationsAbove then ReactModule.createElement(FriendRecommendationsSectionModule, {
							LayoutOrder = 6,
							renderAddFriendsTile = if FFlagAddFriendsRenderTileRefactor then nil else UseResult,
							friendRecommendations = p1.friendRecommendations
						}) else nil,
						emptyView = if Inverted then UseMemoResult else nil,
						BottomWhitespace = if IsCursor or not IsUseSelectorResultAbove then nil else ReactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							LayoutOrder = 1000,
							Size = UDim2.new(1, 0, 0, 3000)
						})
					})
				})
			})
		}))
	})
end
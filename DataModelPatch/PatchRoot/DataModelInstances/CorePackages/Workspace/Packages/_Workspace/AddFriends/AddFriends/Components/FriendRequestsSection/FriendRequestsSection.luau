local AddFriends = script:FindFirstAncestor("AddFriends")
local Parent = AddFriends.Parent
local ReactModule = require(Parent.React)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local CryoModule = require(Parent.Cryo)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local AppCommonLibModule = require(Parent.AppCommonLib)
local ScreenSizeImpressionsTracker = require(Parent.Impressions).ScreenSizeImpressionsTracker
local CollectionViewsModule = require(Parent.CollectionViews)
local CollectionGrid = CollectionViewsModule.CollectionGrid
local UseCollectionImpressionsSignalFunction = CollectionViewsModule.useCollectionImpressionsSignal
local UIBloxModule = require(Parent.UIBlox)
local UseSelectionCursorFunction = UIBloxModule.App.SelectionImage.useSelectionCursor
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local Parent1 = script.Parent.Parent
local AddFriendsTileModule = require(Parent1.AddFriendsTile)
local AddFriendsSectionHeaderFrameModule = require(Parent1.AddFriendsSectionHeaderFrame)
local IgnoreAllFriendsRequestsMenuModule = require(Parent1.IgnoreAllFriendsRequestsMenu)
local UseControlIgnoreAllMenuModule = require(Parent1.IgnoreAllFriendsRequestsMenu.useControlIgnoreAllMenu)
local FriendingOSAEducationSubtitleModule = require(Parent1.FriendingOSAEducationSubtitle)
local AddFriendsSelectorFunction = require(Parent.AddFriendsState).AddFriendsSelector
local UseUserTileCollectionGridItemMetricsPropsModule = require(Parent1.SectionsUtils.useUserTileCollectionGridItemMetricsProps)
local UseShowMoreModule = require(Parent1.SectionsUtils.useShowMore)
local AnalyticsModule = require(AddFriends.Analytics)
local UseFireUserTileImpressionEventFunction = AnalyticsModule.useFireUserTileImpressionEvent
local Namespaces = AnalyticsModule.Namespaces
local UserListModule = require(Parent.UserList)
local UserListLayoutAdaptor = UserListModule.UserListLayoutAdaptor
local LayoutMode = UserListModule.Enums.LayoutMode
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local UseFriendingOSAEducationSubtitleModule = require(Parent1.FriendingOSAEducationSubtitle.useFriendingOSAEducationSubtitle)
local FFlagAddFriendsRenderTileRefactor = require(Parent.SharedFlags).FFlagAddFriendsRenderTileRefactor
local FFlagAddFriendsUserListEnabled = require(Parent.SharedFlags).FFlagAddFriendsUserListEnabled
local FFlagConnectionsToFriendsRename = require(Parent.SharedFlags).FFlagConnectionsToFriendsRename
local FFlagAddFriendsPageFriendRequestsLimitPlus = require(Parent.SharedFlags).FFlagAddFriendsPageFriendRequestsLimitPlus
local ConstantsModule = require(AddFriends.Common.Constants)

return function(Frame)
	-- upvalues: UseDesignTokensFunction (copy), UseSelectionCursorFunction (copy), CursorKind (copy), UseLocalizationFunction (copy), FFlagConnectionsToFriendsRename (copy), UseSelectorFunction (copy), AddFriendsSelectorFunction (copy), UseUserTileCollectionGridItemMetricsPropsModule (copy), FFlagAddFriendsUserListEnabled (copy), UseShowMoreModule (copy), ReactModule (copy), FFlagAddFriendsRenderTileRefactor (copy), AddFriendsTileModule (copy), FFlagAddFriendsPageFriendRequestsLimitPlus (copy), ConstantsModule (copy), AppCommonLibModule (copy), UseCollectionImpressionsSignalFunction (copy), UseFireUserTileImpressionEventFunction (copy), Namespaces (copy), UseControlIgnoreAllMenuModule (copy), UseFriendingOSAEducationSubtitleModule (copy), UseTokensFunction (copy), IgnoreAllFriendsRequestsMenuModule (copy), UserListLayoutAdaptor (copy), LayoutMode (copy), ScreenSizeImpressionsTracker (copy), AppPage (copy), AddFriendsSectionHeaderFrameModule (copy), FriendingOSAEducationSubtitleModule (copy), CollectionGrid (copy), CryoModule (copy), Button (copy), ButtonType (copy)
	local RenderAddFriendsTileFunction = Frame.renderAddFriendsTile
	local FriendRequests = Frame.friendRequests
	local HandleLoadMoreRequests = Frame.handleLoadMoreRequests
	local InitialRequestsRows = Frame.initialRequestsRows
	local RequestsPageSize = Frame.requestsPageSize
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseSelectionCursorResult = UseSelectionCursorFunction(CursorKind.Invisible)
	local UseLocalizationResult = UseLocalizationFunction({
		showMoreButtonText = "Feature.Avatar.Action.ShowMore",
		friendRequestsText = if FFlagConnectionsToFriendsRename then "Feature.AddFriends.Label.FriendRequests" else "Feature.AddFriends.Label.ConnectionRequests"
	})
	local UseSelectorResult: number = UseSelectorFunction(function(p1)
		-- upvalues: AddFriendsSelectorFunction (upval)
		return AddFriendsSelectorFunction(p1, "Friends.requests.receivedCount")
	end)
	local UseUserTileCollectionGridItemMetricsPropsModuleResult, UseUserTileCollectionGridItemMetricsPropsModuleResult2 = UseUserTileCollectionGridItemMetricsPropsModule()
	local NumColumns = if FFlagAddFriendsUserListEnabled then 1 else UseUserTileCollectionGridItemMetricsPropsModuleResult.numColumns
	local UseShowMoreModuleResult, UseShowMoreModuleResult2, UseShowMoreModuleResult3 = UseShowMoreModule(InitialRequestsRows, RequestsPageSize, NumColumns, HandleLoadMoreRequests)
	local UseResult = ReactModule.useCallback(function(User, LayoutOrder)
		-- upvalues: FFlagAddFriendsRenderTileRefactor (upval), ReactModule (upval), AddFriendsTileModule (upval), UseUserTileCollectionGridItemMetricsPropsModuleResult2 (copy), UseUserTileCollectionGridItemMetricsPropsModuleResult (copy), UseShowMoreModuleResult3 (copy), RenderAddFriendsTileFunction (copy)
		if FFlagAddFriendsRenderTileRefactor then
			return ReactModule.createElement(AddFriendsTileModule, {
				isFriendRequest = true,
				impressionsTag = "ADDFRIENDSPAGE_REQUESTS_TILE_IMPRESSIONS",
				layoutOrder = LayoutOrder,
				position = LayoutOrder,
				user = User,
				size = Vector2.new(UseUserTileCollectionGridItemMetricsPropsModuleResult2.itemWidth, UseUserTileCollectionGridItemMetricsPropsModuleResult.getItemHeight(UseUserTileCollectionGridItemMetricsPropsModuleResult2.itemWidth)),
				selected = LayoutOrder == UseShowMoreModuleResult3
			}), tostring(LayoutOrder) .. " "
		else
			return RenderAddFriendsTileFunction(User, UseUserTileCollectionGridItemMetricsPropsModuleResult2.itemWidth, UseUserTileCollectionGridItemMetricsPropsModuleResult.getItemHeight(UseUserTileCollectionGridItemMetricsPropsModuleResult2.itemWidth), LayoutOrder, UseShowMoreModuleResult3, "ADDFRIENDSPAGE_REQUESTS_TILE_IMPRESSIONS"), tostring(LayoutOrder) .. " "
		end
	end, {
		UseUserTileCollectionGridItemMetricsPropsModuleResult2,
		UseUserTileCollectionGridItemMetricsPropsModuleResult,
		UseShowMoreModuleResult3
	})
	local UseResult1 = if FFlagAddFriendsUserListEnabled then ReactModule.useCallback(function(CreateRow, User, Position)
		-- upvalues: ReactModule (upval), AddFriendsTileModule (upval), UseShowMoreModuleResult3 (copy)
		return ReactModule.createElement(AddFriendsTileModule, {
			isFriendRequest = true,
			impressionsTag = "ADDFRIENDSPAGE_REQUESTS_TILE_IMPRESSIONS",
			user = User,
			createRow = CreateRow,
			position = Position,
			selected = Position == UseShowMoreModuleResult3
		})
	end, { UseShowMoreModuleResult3 }) else nil
	local IsUseSelectorResultAbove = UseSelectorResult > 0
	local Text: string = if FFlagAddFriendsPageFriendRequestsLimitPlus then if IsUseSelectorResultAbove then if ConstantsModule.FRIEND_REQUESTS_DISPLAY_LIMIT <= UseSelectorResult then ` ({ConstantsModule.FRIEND_REQUESTS_DISPLAY_LIMIT}+)` else ` ({UseSelectorResult})` else "" else IsUseSelectorResultAbove and ` ({UseSelectorResult})` or ""
	local IsUseShowMoreModuleResultBelow = UseShowMoreModuleResult2 * NumColumns < UseSelectorResult
	local ButtonWidth = UseDesignTokensResult.LuaApps.FriendsLanding.ShowMore.ButtonWidth or 640
	local ButtonHeight = UseDesignTokensResult.LuaApps.FriendsLanding.ShowMore.ButtonHeight or 50
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(AppCommonLibModule.Signal.new())
	local UseCollectionImpressionsSignalResult = UseCollectionImpressionsSignalFunction(UseRefResult1.current)
	local UseFireUserTileImpressionEventResult = UseFireUserTileImpressionEventFunction(FriendRequests, if FFlagAddFriendsUserListEnabled then NumColumns else UseUserTileCollectionGridItemMetricsPropsModuleResult2.itemsPerRow, Namespaces.FriendRequests)
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy)
		UseRefResult1.current:fire()
	end, { UseRefResult1 })
	local UseControlIgnoreAllMenuModuleResult = UseControlIgnoreAllMenuModule()
	local UseFriendingOSAEducationSubtitleModuleResult = if FFlagAddFriendsUserListEnabled then UseFriendingOSAEducationSubtitleModule() else nil
	local UseTokensResult = if FFlagAddFriendsUserListEnabled then UseTokensFunction() else nil
	local NewFontSize = if FFlagAddFriendsUserListEnabled then UseTokensResult.Typography.LabelLarge.FontSize + UseTokensResult.Padding.Large else nil
	
	return ReactModule.createElement("Frame", {
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		BackgroundTransparency = 1,
		SelectionImageObject = UseSelectionCursorResult,
		LayoutOrder = Frame.LayoutOrder,
		ref = UseRefResult,
		[ReactModule.Change.AbsolutePosition] = UseResult2
	}, if FFlagAddFriendsUserListEnabled then {
		IgnoreAllMenu = ReactModule.createElement(IgnoreAllFriendsRequestsMenuModule, {
			open = UseControlIgnoreAllMenuModuleResult.isMenuOpen,
			closeMenu = UseControlIgnoreAllMenuModuleResult.closeMenu,
			openPositionY = UDim.new(0, NewFontSize)
		}),
		UserListLayoutAdaptor = ReactModule.createElement(UserListLayoutAdaptor, {
			isScrollEnabled = false,
			layoutMode = LayoutMode.Vertical,
			entities = FriendRequests,
			initialRowCount = UseShowMoreModuleResult2,
			hasMore = IsUseShowMoreModuleResultBelow,
			onLoadMore = UseShowMoreModuleResult,
			renderRow = UseResult1,
			header = {
				title = UseLocalizationResult.friendRequestsText .. Text,
				subtitle = UseFriendingOSAEducationSubtitleModuleResult,
				trailingIcon = if IsUseSelectorResultAbove then UseControlIgnoreAllMenuModuleResult.menuIcon else nil,
				onTrailingIconActivated = UseControlIgnoreAllMenuModuleResult.onIconClick
			}
		}),
		ScreenSizeImpressionsDetector = ReactModule.createElement(ScreenSizeImpressionsTracker, {
			impressionsTag = "ADDFRIENDSPAGE_REQUESTS_TILE_IMPRESSIONS",
			parentRef = UseRefResult,
			pageContext = AppPage.AddFriendsPage,
			sendImpressions = UseFireUserTileImpressionEventResult,
			scrollViewPositionChangedSignal = UseCollectionImpressionsSignalResult
		})
	} else {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 0)
		}),
		HeaderFrame = IsUseSelectorResultAbove and ReactModule.createElement(AddFriendsSectionHeaderFrameModule, {
			layoutOrder = 1,
			title = UseLocalizationResult.friendRequestsText .. Text,
			icon = UseControlIgnoreAllMenuModuleResult.menuIcon,
			iconVisible = IsUseSelectorResultAbove,
			onIconActivated = UseControlIgnoreAllMenuModuleResult.onIconClick
		}),
		IgnoreAllMenu = ReactModule.createElement(IgnoreAllFriendsRequestsMenuModule, {
			open = UseControlIgnoreAllMenuModuleResult.isMenuOpen,
			closeMenu = UseControlIgnoreAllMenuModuleResult.closeMenu
		}),
		FriendingOSAEducationSubtitle = ReactModule.createElement(FriendingOSAEducationSubtitleModule, { layoutOrder = 3 }),
		FriendRequestsCollectionGrid = ReactModule.createElement(CollectionGrid, CryoModule.Dictionary.join(UseUserTileCollectionGridItemMetricsPropsModuleResult, {
			LayoutOrder = 4,
			onViewableItemsChanged = nil,
			items = FriendRequests,
			renderItem = UseResult,
			maxNumRows = UseShowMoreModuleResult2
		})),
		ShowMoreButtonFrame = IsUseShowMoreModuleResultBelow and ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 5,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, 2),
				PaddingRight = UDim.new(0, 2),
				PaddingTop = UDim.new(0, 10)
			}),
			UISizeConstraint = ReactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(ButtonWidth, 1e999) }),
			ShowMoreButton = ReactModule.createElement(Button, {
				buttonType = ButtonType.Secondary,
				size = UDim2.new(1, 0, 0, ButtonHeight),
				onActivated = UseShowMoreModuleResult,
				text = UseLocalizationResult.showMoreButtonText
			})
		}),
		ScreenSizeImpressionsDetector = ReactModule.createElement(ScreenSizeImpressionsTracker, {
			impressionsTag = "ADDFRIENDSPAGE_REQUESTS_TILE_IMPRESSIONS",
			parentRef = UseRefResult,
			pageContext = AppPage.AddFriendsPage,
			sendImpressions = UseFireUserTileImpressionEventResult,
			scrollViewPositionChangedSignal = UseCollectionImpressionsSignalResult
		})
	})
end
local AddFriends = script:FindFirstAncestor("AddFriends")
local Parent = AddFriends.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local CryoModule = require(Parent.Cryo)
local AppCommonLibModule = require(Parent.AppCommonLib)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local ScreenSizeImpressionsTracker = require(Parent.Impressions).ScreenSizeImpressionsTracker
local CollectionViewsModule = require(Parent.CollectionViews)
local CollectionGrid = CollectionViewsModule.CollectionGrid
local UseCollectionImpressionsSignalFunction = CollectionViewsModule.useCollectionImpressionsSignal
local Parent1 = script.Parent.Parent
local AddFriendsTileModule = require(Parent1.AddFriendsTile)
local AddFriendsSectionHeaderFrameModule = require(Parent1.AddFriendsSectionHeaderFrame)
local UseUserTileCollectionGridItemMetricsPropsModule = require(Parent1.SectionsUtils.useUserTileCollectionGridItemMetricsProps)
local AnalyticsModule = require(AddFriends.Analytics)
local UseFireUserTileImpressionEventFunction = AnalyticsModule.useFireUserTileImpressionEvent
local Namespaces = AnalyticsModule.Namespaces
local UserListModule = require(Parent.UserList)
local UserListLayoutAdaptor = UserListModule.UserListLayoutAdaptor
local ContactsContext = UserListModule.ContactsContext
local EntityType = UserListModule.Enums.EntityType
local LayoutMode = UserListModule.Enums.LayoutMode
local FFlagAddFriendsRenderTileRefactor = require(Parent.SharedFlags).FFlagAddFriendsRenderTileRefactor
local FFlagAddFriendsUserListEnabled = require(Parent.SharedFlags).FFlagAddFriendsUserListEnabled

return function(Frame: Frame)
	-- upvalues: UseLocalizationFunction (copy), UseUserTileCollectionGridItemMetricsPropsModule (copy), ReactModule (copy), FFlagAddFriendsRenderTileRefactor (copy), AddFriendsTileModule (copy), FFlagAddFriendsUserListEnabled (copy), AddFriendsSectionHeaderFrameModule (copy), AppCommonLibModule (copy), UseCollectionImpressionsSignalFunction (copy), UseFireUserTileImpressionEventFunction (copy), Namespaces (copy), CryoModule (copy), EntityType (copy), ContactsContext (copy), UserListLayoutAdaptor (copy), LayoutMode (copy), CollectionGrid (copy), ScreenSizeImpressionsTracker (copy), AppPage (copy)
	local RenderAddFriendsTileFunction = Frame.renderAddFriendsTile
	local FriendRecommendations = Frame.friendRecommendations
	local UseLocalizationResult = UseLocalizationFunction({ peopleYouMayKnow = "Feature.Friends.Label.PYMK" })
	local UseUserTileCollectionGridItemMetricsPropsModuleResult, UseUserTileCollectionGridItemMetricsPropsModuleResult2 = UseUserTileCollectionGridItemMetricsPropsModule()
	local UseResult = ReactModule.useCallback(function(User, LayoutOrder)
		-- upvalues: FFlagAddFriendsRenderTileRefactor (upval), ReactModule (upval), AddFriendsTileModule (upval), UseUserTileCollectionGridItemMetricsPropsModuleResult2 (copy), UseUserTileCollectionGridItemMetricsPropsModuleResult (copy), RenderAddFriendsTileFunction (copy)
		if FFlagAddFriendsRenderTileRefactor then
			return ReactModule.createElement(AddFriendsTileModule, {
				impressionsTag = "ADDFRIENDSPAGE_RECOMMENDATIONS_TILE_IMPRESSIONS",
				isRecommendation = true,
				layoutOrder = LayoutOrder,
				position = LayoutOrder,
				user = User,
				size = Vector2.new(UseUserTileCollectionGridItemMetricsPropsModuleResult2.itemWidth, UseUserTileCollectionGridItemMetricsPropsModuleResult.getItemHeight(UseUserTileCollectionGridItemMetricsPropsModuleResult2.itemWidth))
			}), tostring(LayoutOrder) .. " "
		else
			return RenderAddFriendsTileFunction(User, UseUserTileCollectionGridItemMetricsPropsModuleResult2.itemWidth, UseUserTileCollectionGridItemMetricsPropsModuleResult.getItemHeight(UseUserTileCollectionGridItemMetricsPropsModuleResult2.itemWidth), LayoutOrder, nil, "ADDFRIENDSPAGE_RECOMMENDATIONS_TILE_IMPRESSIONS"), tostring(LayoutOrder) .. " "
		end
	end, {
		UseUserTileCollectionGridItemMetricsPropsModuleResult2.itemWidth,
		UseUserTileCollectionGridItemMetricsPropsModuleResult.getItemHeight,
		RenderAddFriendsTileFunction
	})
	local UseResult1 = if FFlagAddFriendsUserListEnabled then ReactModule.useCallback(function(CreateRow, User, Position)
		-- upvalues: ReactModule (upval), AddFriendsTileModule (upval)
		return ReactModule.createElement(AddFriendsTileModule, {
			isRecommendation = true,
			impressionsTag = "ADDFRIENDSPAGE_RECOMMENDATIONS_TILE_IMPRESSIONS",
			user = User,
			createRow = CreateRow,
			position = Position
		})
	end, {}) else nil
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: ReactModule (upval), AddFriendsSectionHeaderFrameModule (upval), UseLocalizationResult (copy)
		return ReactModule.createElement(AddFriendsSectionHeaderFrameModule, {
			layoutOrder = 1,
			iconVisible = false,
			title = UseLocalizationResult.peopleYouMayKnow
		})
	end, { UseLocalizationResult.peopleYouMayKnow })
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(AppCommonLibModule.Signal.new())
	local UseMemoResult = if FFlagAddFriendsUserListEnabled then ReactModule.useMemo(function()
		-- upvalues: CryoModule (upval), FriendRecommendations (copy), EntityType (upval)
		return {
			contacts = CryoModule.List.foldLeft(FriendRecommendations, function(p1, p2)
				-- upvalues: EntityType (upval)
				if p2.type == EntityType.Contact then
					p1[p2.id] = {
						name = p2.entityDisplayName or "",
						avatarThumbnailUrl = p2.thumbnailEntities and p2.thumbnailEntities.headshotImageUrl or ""
					}
				end
				return p1
			end, {})
		}
	end, { FriendRecommendations }) else nil
	
	return ReactModule.createElement("Frame", {
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		BackgroundTransparency = 1,
		LayoutOrder = Frame.LayoutOrder,
		ref = UseRefResult,
		[ReactModule.Change.AbsolutePosition] = ReactModule.useCallback(function()
			-- upvalues: UseRefResult1 (copy)
			UseRefResult1.current:fire()
		end, { UseRefResult1 })
	}, {
		UserListWithContacts = if FFlagAddFriendsUserListEnabled then ReactModule.createElement(ContactsContext.Provider, { value = UseMemoResult }, {
			UserListLayoutAdaptor = ReactModule.createElement(UserListLayoutAdaptor, {
				isScrollEnabled = false,
				layoutOrder = Frame.LayoutOrder,
				layoutMode = LayoutMode.Vertical,
				header = { title = UseLocalizationResult.peopleYouMayKnow },
				entities = FriendRecommendations,
				renderRow = UseResult1
			})
		}) else nil,
		FriendRecommendationsCollectionsGrid = if FFlagAddFriendsUserListEnabled then nil else ReactModule.createElement(CollectionGrid, CryoModule.Dictionary.join(UseUserTileCollectionGridItemMetricsPropsModuleResult, {
			onViewableItemsChanged = nil,
			items = FriendRecommendations,
			renderItem = UseResult,
			title = UseResult2
		})),
		ScreenSizeImpressionsDetector = ReactModule.createElement(ScreenSizeImpressionsTracker, {
			impressionsTag = "ADDFRIENDSPAGE_RECOMMENDATIONS_TILE_IMPRESSIONS",
			parentRef = UseRefResult,
			pageContext = AppPage.AddFriendsPage,
			sendImpressions = UseFireUserTileImpressionEventFunction(FriendRecommendations, if FFlagAddFriendsUserListEnabled then 1 else UseUserTileCollectionGridItemMetricsPropsModuleResult2.itemsPerRow, Namespaces.PYMK),
			scrollViewPositionChangedSignal = UseCollectionImpressionsSignalFunction(UseRefResult1.current)
		})
	})
end
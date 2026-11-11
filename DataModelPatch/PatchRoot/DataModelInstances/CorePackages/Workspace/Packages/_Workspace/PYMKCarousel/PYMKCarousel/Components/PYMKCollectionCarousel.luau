local PYMKCarousel = script:FindFirstAncestor("PYMKCarousel")
local DependenciesModule = require(PYMKCarousel.dependencies)
local UseStyleFunction = DependenciesModule.UIBlox.Core.Style.useStyle
local UseSelectorFunction = DependenciesModule.Hooks.useSelector
local NetworkingPresence = DependenciesModule.NetworkingPresence
local RecommendationContextType = DependenciesModule.RoduxFriends.Enums.RecommendationContextType
local Parent = PYMKCarousel.Parent
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local SocialStopwatchModule = require(Parent.SocialStopwatch)
local CalculateContextualMaxHeightFunction = require(Parent.SocialCommon).Components.CarouselUserTile.calculateContextualMaxHeight
local TutilsModule = require(Parent.tutils)
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local CollectionViewsModule = require(Parent.CollectionViews)
local CollectionCarousel = CollectionViewsModule.CollectionCarousel
local UseCollectionLayoutParamsFunction = CollectionViewsModule.useCollectionLayoutParams
local CollectionItemSize = CollectionViewsModule.CollectionViewTypes.CollectionItemSize
local UseCollectionImpressionsSignalFunction = CollectionViewsModule.useCollectionImpressionsSignal
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local FocusNavigationEventNameEnum = require(Parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local InputHandlersModule = require(Parent.InputHandlers)
local UseThrottledCallbackFunction = require(Parent.RoactUtils).Hooks.useThrottledCallback
local DashModule = require(Parent.Dash)
local ImpressionsModule = require(Parent.Impressions)
local ScreenSizeImpressionsTracker = ImpressionsModule.ScreenSizeImpressionsTracker
local FrameBoundsImpressionsTracker = ImpressionsModule.FrameBoundsImpressionsTracker
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local AnalyticsModule = require(PYMKCarousel.Analytics)
local BtnValues = AnalyticsModule.BtnValues
local EventNames = AnalyticsModule.EventNames
local UseUserSeenEventFunction = AnalyticsModule.useUserSeenEvent
local UserListModule = require(Parent.UserList)
local HorizontalUserList = UserListModule.HorizontalUserList.HorizontalUserList
local ContactsContext = UserListModule.ContactsContext
local PYMKCarouselUserTileModule = require(PYMKCarousel.Components.PYMKCarouselUserTile)
local PYMKCarouselButtonTileModule = require(PYMKCarousel.Components.PYMKCarouselButtonTile)
local PYMKCarouselFindFriendsTooltipModule = require(PYMKCarousel.Components.PYMKCarouselFindFriendsTooltip)
local UsePYMKCarouselItemListModule = require(PYMKCarousel.Components.PYMKCarouselComponent.usePYMKCarouselItemList)
local GetPYMKSortedRecommendationIdsModule = require(PYMKCarousel.installReducer.Selectors.getPYMKSortedRecommendationIds)
local UseCallbackWhenVisibleModule = require(PYMKCarousel.Components.useCallbackWhenVisible)
local UsePYMKCarouselUserEntitiesListModule = require(PYMKCarousel.Components.PYMKCarouselComponent.usePYMKCarouselUserEntitiesList)
local UseContactsContextModule = require(PYMKCarousel.Components.PYMKCarouselComponent.useContactsContext)
local PYMKUserModule = require(PYMKCarousel.Components.PYMKUser)
local FFlagLuaAppCompositionAlways = require(Parent.SharedFlags).FFlagLuaAppCompositionAlways
local FFlagHomepagePYMKPresence = require(Parent.SharedFlags).FFlagHomepagePYMKPresence
local FFlagHomepagePYMKPresenceAnalytics = require(Parent.SharedFlags).FFlagHomepagePYMKPresenceAnalytics
local FFlagHomepagePYMKUseHorizontalUserList = require(Parent.SharedFlags).FFlagHomepagePYMKUseHorizontalUserList
local FFlagLuaAppUseFrameBoundsImpressions = require(Parent.SharedFlags).FFlagLuaAppUseFrameBoundsImpressions
local FFlagPymkCarouselPresenceStoreMigrationModule = require(PYMKCarousel.Flags.FFlagPymkCarouselPresenceStoreMigration)
local RefreshCount = 0
local config = {
	[Enum.KeyCode.ButtonX] = FocusNavigationEventNameEnum.SeeAll
}
local HomePagePYMKPresenceFetchThrottleInterval = game:DefineFastInt("HomePagePYMKPresenceFetchThrottleInterval", 60)

return ReactModule.memo(function(p1)
	-- upvalues: FFlagLuaAppCompositionAlways (copy), FFlagHomepagePYMKUseHorizontalUserList (copy), UseAppPolicyFunction (copy), ReactModule (copy), UseCollectionImpressionsSignalFunction (copy), UseSelectorFunction (copy), GetPYMKSortedRecommendationIdsModule (copy), TutilsModule (copy), UsePYMKCarouselItemListModule (copy), SocialStopwatchModule (copy), FFlagHomepagePYMKPresence (copy), FFlagPymkCarouselPresenceStoreMigrationModule (copy), UseDispatchFunction (copy), DashModule (copy), RecommendationContextType (copy), NetworkingPresence (copy), FFlagHomepagePYMKPresenceAnalytics (copy), EventNames (copy), UseThrottledCallbackFunction (copy), HomePagePYMKPresenceFetchThrottleInterval (copy), UseCallbackWhenVisibleModule (copy), RefreshCount (ref), BtnValues (copy), UseStyleFunction (copy), CalculateContextualMaxHeightFunction (copy), UseCollectionLayoutParamsFunction (copy), CollectionItemSize (copy), UseUserSeenEventFunction (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), ReactFocusNavigationModule (copy), config (copy), ResponsiveModule (copy), PYMKCarouselButtonTileModule (copy), PYMKCarouselFindFriendsTooltipModule (copy), PYMKCarouselUserTileModule (copy), UsePYMKCarouselUserEntitiesListModule (copy), UseContactsContextModule (copy), PYMKUserModule (copy), ContactsContext (copy), HorizontalUserList (copy), FFlagLuaAppUseFrameBoundsImpressions (copy), FrameBoundsImpressionsTracker (copy), ScreenSizeImpressionsTracker (copy), CollectionCarousel (copy)
	local FFlagLuaAppCompositionAlways1 = FFlagLuaAppCompositionAlways or p1.appCompositionEnabled
	local UseAppPolicyResult = if FFlagHomepagePYMKUseHorizontalUserList then nil else UseAppPolicyFunction(function(p2)
		return p2.useGridPageLayout()
	end)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRefResult = ReactModule.useRef(nil)
	local UseCollectionImpressionsSignalResult, UseCollectionImpressionsSignalResult2 = UseCollectionImpressionsSignalFunction(p1.scrollViewPositionChangedSignal)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: GetPYMKSortedRecommendationIdsModule (upval)
		return GetPYMKSortedRecommendationIdsModule(p2.LocalUserId)(p2)
	end, TutilsModule.shallowEqual)
	local CountUseSelectorResult: number = UseSelectorResult and #UseSelectorResult or 0
	local RecommendationSessionId = p1.recommendationSessionId
	local FireAnalyticsEventFunction = p1.fireAnalyticsEvent
	local UsePYMKCarouselItemListModuleResult = UsePYMKCarouselItemListModule({
		recommendationIds = UseSelectorResult,
		recommendationCount = CountUseSelectorResult,
		findFriendsTileEnabled = p1.findFriendsTileEnabled,
		seeAllTileEnabled = p1.seeAllTileEnabled
	})
	ReactModule.useLayoutEffect(function()
		-- upvalues: SocialStopwatchModule (upval)
		SocialStopwatchModule.Stopwatch.start(SocialStopwatchModule.Events.PYMKCarouselLoaded)
		
		return function()
			-- upvalues: SocialStopwatchModule (upval)
			if SocialStopwatchModule.Stopwatch.get(SocialStopwatchModule.Events.PYMKCarouselLoaded) then
				SocialStopwatchModule.Stopwatch.stop(SocialStopwatchModule.Events.PYMKCarouselLoaded)
			end
		end
	end, { RecommendationSessionId })
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(os.clock())
	local v1 = nil
	local UseStateResult2_2 = nil
	
	if FFlagHomepagePYMKPresence then
		if FFlagPymkCarouselPresenceStoreMigrationModule then
			v1, UseStateResult2_2 = ReactModule.useState(0)
			UseCallbackWhenVisibleModule({
				elementRef = UseRefResult,
				scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal,
				callback = UseThrottledCallbackFunction(function()
					-- upvalues: UseStateResult2_2 (ref), v1 (ref)
					UseStateResult2_2(v1 + 1)
				end, HomePagePYMKPresenceFetchThrottleInterval)
			})
		else
			local UseDispatchResult = UseDispatchFunction()
			UseCallbackWhenVisibleModule({
				elementRef = UseRefResult,
				scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal,
				callback = UseThrottledCallbackFunction(ReactModule.useCallback(function()
					-- upvalues: DashModule (upval), UseSelectorResult (copy), RecommendationContextType (upval), UseDispatchResult (copy), NetworkingPresence (upval), FFlagHomepagePYMKPresenceAnalytics (upval), FireAnalyticsEventFunction (copy), EventNames (upval)
					local ReduceResult = DashModule.reduce(UseSelectorResult, function(List, p2)
						-- upvalues: RecommendationContextType (upval)
						if p2.recommendationContextType ~= RecommendationContextType.Contacts then
							table.insert(List, p2.id)
						end
						return List
					end, {})
					
					if #ReduceResult > 0 then
						UseDispatchResult(NetworkingPresence.GetPresencesFromUserIds.API(ReduceResult))
						
						if FFlagHomepagePYMKPresenceAnalytics then
							FireAnalyticsEventFunction(EventNames.PYMKUserPresenceLoad)
						end
					end
				end, {
					UseDispatchResult,
					UseSelectorResult,
					if FFlagHomepagePYMKPresenceAnalytics then FireAnalyticsEventFunction else nil
				}), HomePagePYMKPresenceFetchThrottleInterval)
			})
		end
	end
	ReactModule.useEffect(function()
		-- upvalues: FireAnalyticsEventFunction (copy), EventNames (upval), CountUseSelectorResult (copy), RefreshCount (upval), p1 (copy), UseStateResult2_1 (copy)
		FireAnalyticsEventFunction(EventNames.CarouselLoadedWithUsers, {
			recommendationCount = CountUseSelectorResult,
			refreshCount = RefreshCount,
			findFriendsTileEnabled = p1.findFriendsTileEnabled
		})
		RefreshCount += 1
		UseStateResult2_1(os.clock())
	end, { RecommendationSessionId, CountUseSelectorResult })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: FireAnalyticsEventFunction (copy), EventNames (upval), BtnValues (upval), p1 (copy)
		FireAnalyticsEventFunction(EventNames.CarouselGenericTileClicked, { btn = BtnValues.SeeAll.rawValue() })
		p1.goToAddFriendsPage(false)
	end, { p1.goToAddFriendsPage, FireAnalyticsEventFunction })
	local UseStyleResult = nil
	local UseMemoResult = nil
	local UseResult1 = nil
	local v2 = nil
	local v3 = nil
	local Callback = nil
	
	if not FFlagHomepagePYMKUseHorizontalUserList then
		UseStyleResult = UseStyleFunction()
		UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: CalculateContextualMaxHeightFunction (upval), UseStyleResult (ref)
			return CalculateContextualMaxHeightFunction({ font = UseStyleResult.Font })
		end, { UseStyleResult.Font })
		UseResult1 = ReactModule.useCallback(function(p2)
			-- upvalues: UseMemoResult (ref)
			return p2 + UseMemoResult
		end, { UseMemoResult })
		v3, Callback = ReactModule.useState(0)
		v2 = UseCollectionLayoutParamsFunction(CollectionItemSize.Small, UseStateResult, true, {
			sideMargin = if FFlagLuaAppCompositionAlways1 then nil elseif UseAppPolicyResult then nil else p1.sideMargin
		})
	end
	local UseUserSeenEventResult = UseUserSeenEventFunction(FireAnalyticsEventFunction)
	local UseResult2 = ReactModule.useCallback(function(List)
		-- upvalues: UsePYMKCarouselItemListModuleResult (copy), UseUserSeenEventResult (copy)
		local Changed = {}
		
		for _, value in List do
			table.insert(Changed, { item = UsePYMKCarouselItemListModuleResult[value] })
		end
		if #UseUserSeenEventResult > 0 then
			UseUserSeenEventResult[1].onViewableItemsChanged({ changed = Changed })
		end
	end, {
		UseUserSeenEventResult,
		UsePYMKCarouselItemListModuleResult
	})
	local UseEventHandlerMapResult = ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), UseResult (copy)
		return {
			[FocusNavigationEventNameEnum.SeeAll] = { handler = InputHandlersModule.onRelease(UseResult) }
		}
	end, { UseResult }), (ReactFocusNavigationModule.useEventMap(config)))
	ReactModule.useEffect(function()
		-- upvalues: UseEventHandlerMapResult (copy), UseRefResult (copy)
		if UseEventHandlerMapResult and UseRefResult then
			UseEventHandlerMapResult(UseRefResult.current)
		end
		return function()
			-- upvalues: UseEventHandlerMapResult (upval)
			UseEventHandlerMapResult(nil)
		end
	end, {
		UseEventHandlerMapResult,
		UseRefResult,
		UseRefResult and UseRefResult.current
	})
	local IsUsePreferredInputResultMatch = nil
	local UseResult3 = nil
	
	if not FFlagHomepagePYMKUseHorizontalUserList then
		IsUsePreferredInputResultMatch = ResponsiveModule.usePreferredInput() == ResponsiveModule.Input.Directional
		local UseResult4 = ReactModule.useCallback(function(Frame)
			-- upvalues: Callback (ref)
			local X: number = Frame.AbsoluteSize.X
			
			if X > 0 then
				Callback(X)
			end
		end, {})
		UseResult3 = ReactModule.useCallback(function(p2, LayoutOrder, Size, _)
			-- upvalues: FFlagLuaAppCompositionAlways1 (copy), v3 (ref), v2 (ref), ReactModule (upval), PYMKCarouselButtonTileModule (upval), p1 (copy), FireAnalyticsEventFunction (copy), PYMKCarouselFindFriendsTooltipModule (upval), PYMKCarouselUserTileModule (upval), RecommendationSessionId (copy), IsUsePreferredInputResultMatch (ref), UseResult4 (copy)
			local ItemWidth = if FFlagLuaAppCompositionAlways1 then v3 else v2.itemWidth
			local Element = nil
			local v4 = nil
			
			if p2.isButtonTile then
				Element = ReactModule.createElement(PYMKCarouselButtonTileModule, {
					id = p2.id,
					tileWidth = ItemWidth,
					goToAddFriendsPage = p1.goToAddFriendsPage,
					fireAnalyticsEvent = FireAnalyticsEventFunction,
					shouldShowContactImporterBadge = p1.shouldShowContactImporterBadge,
					LayoutOrder = LayoutOrder
				})
				v4 = "PYMKCarouselButtonTile"
			elseif p2.isTooltip then
				Element = ReactModule.createElement(PYMKCarouselFindFriendsTooltipModule, { LayoutOrder = LayoutOrder })
				v4 = "PYMKCarouselFindFriendsTooltip"
			else
				Element = ReactModule.createElement(PYMKCarouselUserTileModule, {
					contextualInfoLines = 2,
					impressionsTag = "PYMKCollectionCarousel",
					userId = p2.id,
					tileWidth = ItemWidth,
					openProfilePeekView = p1.openProfilePeekView,
					showToast = p1.showToast,
					fireAnalyticsEvent = FireAnalyticsEventFunction,
					absolutePosition = p2.absolutePosition,
					recommendationSessionId = RecommendationSessionId,
					LayoutOrder = LayoutOrder,
					hideButtons = IsUsePreferredInputResultMatch
				})
				v4 = "PYMKCarouselUserTile"
			end
			if FFlagLuaAppCompositionAlways1 then
				return ReactModule.createElement("Frame", {
					Size = Size,
					BackgroundTransparency = 1,
					LayoutOrder = LayoutOrder,
					[ReactModule.Change.AbsoluteSize] = UseResult4
				}, { Tile = Element }), v4
			else
				return Element, v4
			end
		end, {
			p1.goToAddFriendsPage, FireAnalyticsEventFunction,
			p1.shouldShowContactImporterBadge, p1.openProfilePeekView, p1.showToast,
			RecommendationSessionId, v2.itemWidth, IsUsePreferredInputResultMatch,
			FFlagLuaAppCompositionAlways1, v3, UseResult4
		})
	end
	if FFlagHomepagePYMKUseHorizontalUserList then
		local UsePYMKCarouselUserEntitiesListModuleResult = UsePYMKCarouselUserEntitiesListModule(UsePYMKCarouselItemListModuleResult)
		local UseContactsContextModuleResult = UseContactsContextModule(UsePYMKCarouselItemListModuleResult)
		local UseResult5 = ReactModule.useCallback(function(CreateRow, Entity, AbsolutePosition)
			-- upvalues: ReactModule (upval), PYMKUserModule (upval), p1 (copy), FireAnalyticsEventFunction (copy), FFlagPymkCarouselPresenceStoreMigrationModule (upval), v1 (ref)
			return ReactModule.createElement(PYMKUserModule, {
				impressionsTag = "PYMKCollectionCarousel",
				createRow = CreateRow,
				entity = Entity,
				showToast = p1.showToast,
				fireAnalyticsEvent = FireAnalyticsEventFunction,
				absolutePosition = AbsolutePosition,
				recommendationSessionId = p1.recommendationSessionId,
				openProfilePeekView = p1.openProfilePeekView,
				forceFetchUserPresence = if FFlagPymkCarouselPresenceStoreMigrationModule then v1 else nil
			})
		end, {
			p1.showToast,
			FireAnalyticsEventFunction,
			p1.recommendationSessionId,
			p1.openProfilePeekView,
			if FFlagPymkCarouselPresenceStoreMigrationModule then v1 else nil
		})
		
		return if #UsePYMKCarouselItemListModuleResult == 0 then nil else ReactModule.createElement(ReactModule.Fragment, nil, {
			ContactsContextProvider = ReactModule.createElement(ContactsContext.Provider, { value = UseContactsContextModuleResult }, {
				PYMKCarousel = ReactModule.createElement(HorizontalUserList, {
					entities = UsePYMKCarouselUserEntitiesListModuleResult,
					renderRow = UseResult5,
					header = { title = p1.carouselTitle, onTitleActivated = UseResult },
					collectionCarouselConfigs = {
						onViewableItemsChanged = UseCollectionImpressionsSignalResult2,
						onChangeCanvasPosition = UseCollectionImpressionsSignalResult2
					},
					listConfigs = { showSubtitle = false },
					scrollingFrameRef = UseRefResult,
					appCompositionEnabled = p1.appCompositionEnabled
				})
			}),
			ScreenSizeImpressionsTracker = ReactModule.createElement(if FFlagLuaAppUseFrameBoundsImpressions then FrameBoundsImpressionsTracker else ScreenSizeImpressionsTracker, {
				impressionsTag = "PYMKCollectionCarousel",
				pageContext = p1.pageContext,
				parentRef = UseRefResult,
				scrollViewPositionChangedSignal = UseCollectionImpressionsSignalResult,
				sendImpressions = UseResult2,
				dataUpdatedTimestamp = UseStateResult1
			})
		})
	else
		return if #UsePYMKCarouselItemListModuleResult == 0 then nil else ReactModule.createElement(ReactModule.Fragment, nil, {
			PYMKCarousel = ReactModule.createElement(CollectionCarousel, {
				title = p1.carouselTitle,
				onActivateHeader = UseResult,
				containerRef = UseStateResult2,
				scrollingFrameRef = UseRefResult,
				items = UsePYMKCarouselItemListModuleResult,
				renderItem = UseResult3,
				getItemHeight = UseResult1,
				collectionItemSize = if FFlagLuaAppCompositionAlways1 then CollectionItemSize.Small else nil,
				numColumns = if FFlagLuaAppCompositionAlways1 then nil else v2.numColumns,
				fractionalItemAmount = if FFlagLuaAppCompositionAlways1 then nil else v2.fractionalItemAmount,
				columnGap = if FFlagLuaAppCompositionAlways1 then nil else v2.columnGap,
				sideMargin = if FFlagLuaAppCompositionAlways1 then nil else v2.sideMargin,
				maxItemsToShow = v2.maxTilesToShow,
				onViewableItemsChanged = UseCollectionImpressionsSignalResult2,
				onChangeCanvasPosition = UseCollectionImpressionsSignalResult2
			}),
			ScreenSizeImpressionsTracker = ReactModule.createElement(if FFlagLuaAppUseFrameBoundsImpressions then FrameBoundsImpressionsTracker else ScreenSizeImpressionsTracker, {
				impressionsTag = "PYMKCollectionCarousel",
				pageContext = p1.pageContext,
				parentRef = UseRefResult,
				scrollViewPositionChangedSignal = UseCollectionImpressionsSignalResult,
				sendImpressions = UseResult2,
				dataUpdatedTimestamp = UseStateResult1
			})
		})
	end
end)
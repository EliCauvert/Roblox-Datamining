local PYMKCarousel = script:FindFirstAncestor("PYMKCarousel")
local DependenciesModule = require(PYMKCarousel.dependencies)
local UseSelectorFunction = DependenciesModule.Hooks.useSelector
local NetworkingPresence = DependenciesModule.NetworkingPresence
local RecommendationContextType = DependenciesModule.RoduxFriends.Enums.RecommendationContextType
local Parent = PYMKCarousel.Parent
local ReactModule = require(Parent.React)
local SocialStopwatchModule = require(Parent.SocialStopwatch)
local TutilsModule = require(Parent.tutils)
local UseCollectionImpressionsSignalFunction = require(Parent.CollectionViews).useCollectionImpressionsSignal
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
local UseUserSeenCollectionEventFunction = AnalyticsModule.useUserSeenCollectionEvent
local _ = require(PYMKCarousel.Analytics.AnalyticsTypes)
local UserListModule = require(Parent.UserList)
local HorizontalUserList = UserListModule.HorizontalUserList.HorizontalUserList
local ContactsContext = UserListModule.ContactsContext
local UsePYMKCarouselItemListModule = require(PYMKCarousel.Components.PYMKCarouselComponent.usePYMKCarouselItemList)
local GetPYMKSortedRecommendationIdsModule = require(PYMKCarousel.installReducer.Selectors.getPYMKSortedRecommendationIds)
local UseCallbackWhenVisibleModule = require(PYMKCarousel.Components.useCallbackWhenVisible)
local UsePYMKCarouselUserEntitiesListModule = require(PYMKCarousel.Components.PYMKCarouselComponent.usePYMKCarouselUserEntitiesList)
local UseContactsContextModule = require(PYMKCarousel.Components.PYMKCarouselComponent.useContactsContext)
local PYMKUserModule = require(PYMKCarousel.Components.PYMKUser)
local _ = require(PYMKCarousel.Common.DirectRecommendationTypes)
local FFlagLuaAppUseFrameBoundsImpressions = require(Parent.SharedFlags).FFlagLuaAppUseFrameBoundsImpressions
local FFlagPymkCarouselPresenceStoreMigrationModule = require(PYMKCarousel.Flags.FFlagPymkCarouselPresenceStoreMigration)
local FFlagPYMKCarouselStableSelectorsModule = require(PYMKCarousel.Flags.FFlagPYMKCarouselStableSelectors)
local FFlagLuaAppPYMKSendUserSeenCollection = require(Parent.SharedFlags).FFlagLuaAppPYMKSendUserSeenCollection
local FFlagLuaAppUserSeenCollectionUnifiedFields = require(Parent.SharedFlags).FFlagLuaAppUserSeenCollectionUnifiedFields
local FFlagLuaAppEnableSduiHomePage = require(Parent.SharedFlags).FFlagLuaAppEnableSduiHomePage
local FFlagPymkCarouselExtendProps = require(Parent.SharedFlags).FFlagPymkCarouselExtendProps
local HttpService = if FFlagPymkCarouselExtendProps then game:GetService("HttpService") else nil
local RefreshCount = 0
local config = {
	[Enum.KeyCode.ButtonX] = FocusNavigationEventNameEnum.SeeAll
}
local HomePagePYMKPresenceFetchThrottleInterval = game:DefineFastInt("HomePagePYMKPresenceFetchThrottleInterval", 60)

local function buildDirectRecommendationOverrides(Recommendations)
	-- upvalues: RecommendationContextType (copy)
	local RecommendationIds = {}
	local RecommendationsById = {}
	
	for AbsolutePosition, recommendation in Recommendations do
		local FromRawValueResult = RecommendationContextType.fromRawValue(recommendation.contextType) or RecommendationContextType.None
		local config = {
			id = recommendation.id,
			rank = recommendation.rank,
			contextType = FromRawValueResult,
			mutualFriendsCount = recommendation.mutualFriendsCount,
			hasIncomingFriendRequest = recommendation.hasIncomingFriendRequest,
			entityDisplayName = recommendation.entityDisplayName,
			thumbnailEntities = recommendation.thumbnailEntities,
			absolutePosition = AbsolutePosition,
			recommendationRank = recommendation.rank,
			recommendationContextType = FromRawValueResult
		}
		table.insert(RecommendationIds, config)
		RecommendationsById[recommendation.id] = config
	end
	return {
		recommendationIds = RecommendationIds,
		recommendationsById = RecommendationsById
	}
end

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), FFlagPymkCarouselExtendProps (copy), HttpService (copy), UseCollectionImpressionsSignalFunction (copy), FFlagLuaAppEnableSduiHomePage (copy), buildDirectRecommendationOverrides (copy), UseSelectorFunction (copy), GetPYMKSortedRecommendationIdsModule (copy), FFlagPYMKCarouselStableSelectorsModule (copy), TutilsModule (copy), UsePYMKCarouselItemListModule (copy), FFlagLuaAppPYMKSendUserSeenCollection (copy), DashModule (copy), SocialStopwatchModule (copy), FFlagPymkCarouselPresenceStoreMigrationModule (copy), UseDispatchFunction (copy), RecommendationContextType (copy), NetworkingPresence (copy), EventNames (copy), UseThrottledCallbackFunction (copy), HomePagePYMKPresenceFetchThrottleInterval (copy), UseCallbackWhenVisibleModule (copy), RefreshCount (ref), BtnValues (copy), UseUserSeenEventFunction (copy), FFlagLuaAppUserSeenCollectionUnifiedFields (copy), UseUserSeenCollectionEventFunction (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), ReactFocusNavigationModule (copy), config (copy), UsePYMKCarouselUserEntitiesListModule (copy), UseContactsContextModule (copy), PYMKUserModule (copy), ContactsContext (copy), HorizontalUserList (copy), FFlagLuaAppUseFrameBoundsImpressions (copy), FrameBoundsImpressionsTracker (copy), ScreenSizeImpressionsTracker (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseMemoResult = if FFlagPymkCarouselExtendProps then ReactModule.useMemo(function(): string
		-- upvalues: HttpService (upval)
		return `PYMKCollectionCarousel{HttpService:GenerateGUID(false)}`
	end, {}) else "PYMKCollectionCarousel"
	local UseCollectionImpressionsSignalResult, UseCollectionImpressionsSignalResult2 = UseCollectionImpressionsSignalFunction(p1.scrollViewPositionChangedSignal)
	local RecommendationIds = nil
	local RecommendationsById = nil
	
	if FFlagLuaAppEnableSduiHomePage then
		local UseMemoResult1 = ReactModule.useMemo(function()
			-- upvalues: buildDirectRecommendationOverrides (upval), p1 (copy)
			return (buildDirectRecommendationOverrides(p1.recommendations or {}))
		end, { p1.recommendations })
		RecommendationIds = UseMemoResult1.recommendationIds
		RecommendationsById = UseMemoResult1.recommendationsById
	elseif FFlagPymkCarouselExtendProps then
		RecommendationIds = UseSelectorFunction(function(p2)
			-- upvalues: GetPYMKSortedRecommendationIdsModule (upval)
			return GetPYMKSortedRecommendationIdsModule(p2.LocalUserId)(p2)
		end, if FFlagPYMKCarouselStableSelectorsModule then TutilsModule.deepEqual else TutilsModule.shallowEqual)
		local UseMemoResult3 = ReactModule.useMemo(function()
			-- upvalues: buildDirectRecommendationOverrides (upval), p1 (copy)
			return (buildDirectRecommendationOverrides(p1.recommendations or {}))
		end, { p1.recommendations })
		
		if p1.recommendations then
			RecommendationIds = UseMemoResult3.recommendationIds
			RecommendationsById = UseMemoResult3.recommendationsById
		end
	else
		RecommendationIds = UseSelectorFunction(function(p2)
			-- upvalues: GetPYMKSortedRecommendationIdsModule (upval)
			return GetPYMKSortedRecommendationIdsModule(p2.LocalUserId)(p2)
		end, if FFlagPYMKCarouselStableSelectorsModule then TutilsModule.deepEqual else TutilsModule.shallowEqual)
	end
	local CountRecommendationIds: number = RecommendationIds and #RecommendationIds or 0
	local RecommendationSessionId = p1.recommendationSessionId
	local FireAnalyticsEventFunction = p1.fireAnalyticsEvent
	local UsePYMKCarouselItemListModuleResult = UsePYMKCarouselItemListModule({
		recommendationIds = RecommendationIds,
		recommendationCount = CountRecommendationIds,
		findFriendsTileEnabled = p1.findFriendsTileEnabled,
		seeAllTileEnabled = p1.seeAllTileEnabled
	})
	local UseMemoResult2 = if FFlagLuaAppPYMKSendUserSeenCollection then ReactModule.useMemo(function()
		-- upvalues: DashModule (upval), UsePYMKCarouselItemListModuleResult (copy)
		return DashModule.filter(UsePYMKCarouselItemListModuleResult, function(p2): boolean
			return not p2.isButtonTile and not p2.isTooltip
		end)
	end, { UsePYMKCarouselItemListModuleResult }) else nil
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
	local UseStateResult, UseStateResult2 = ReactModule.useState(os.clock())
	local v1 = nil
	local UseStateResult2_1 = nil
	
	if FFlagPymkCarouselPresenceStoreMigrationModule then
		v1, UseStateResult2_1 = ReactModule.useState(0)
		UseCallbackWhenVisibleModule({
			elementRef = UseRefResult,
			scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal,
			callback = UseThrottledCallbackFunction(function()
				-- upvalues: UseStateResult2_1 (ref), v1 (ref)
				UseStateResult2_1(v1 + 1)
			end, HomePagePYMKPresenceFetchThrottleInterval)
		})
	else
		local UseDispatchResult = UseDispatchFunction()
		UseCallbackWhenVisibleModule({
			elementRef = UseRefResult,
			scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal,
			callback = UseThrottledCallbackFunction(ReactModule.useCallback(function()
				-- upvalues: DashModule (upval), RecommendationIds (ref), RecommendationContextType (upval), UseDispatchResult (copy), NetworkingPresence (upval), FireAnalyticsEventFunction (copy), EventNames (upval)
				local ReduceResult = DashModule.reduce(RecommendationIds, function(List, p2)
					-- upvalues: RecommendationContextType (upval)
					if p2.recommendationContextType ~= RecommendationContextType.Contacts then
						table.insert(List, p2.id)
					end
					return List
				end, {})
				
				if #ReduceResult > 0 then
					UseDispatchResult(NetworkingPresence.GetPresencesFromUserIds.API(ReduceResult))
					FireAnalyticsEventFunction(EventNames.PYMKUserPresenceLoad)
				end
			end, {
				UseDispatchResult,
				RecommendationIds,
				FireAnalyticsEventFunction
			}), HomePagePYMKPresenceFetchThrottleInterval)
		})
	end
	ReactModule.useEffect(function()
		-- upvalues: FireAnalyticsEventFunction (copy), EventNames (upval), CountRecommendationIds (copy), RefreshCount (upval), p1 (copy), UseStateResult2 (copy)
		FireAnalyticsEventFunction(EventNames.CarouselLoadedWithUsers, {
			recommendationCount = CountRecommendationIds,
			refreshCount = RefreshCount,
			findFriendsTileEnabled = p1.findFriendsTileEnabled
		})
		RefreshCount += 1
		UseStateResult2(os.clock())
	end, { RecommendationSessionId, CountRecommendationIds })
	
	if FFlagPymkCarouselExtendProps then
		local IsCountRecommendationIdsAbove = CountRecommendationIds > 0
		ReactModule.useEffect(function()
			-- upvalues: IsCountRecommendationIdsAbove (copy), p1 (copy)
			if IsCountRecommendationIdsAbove and p1.onRecommendationsShown then
				p1.onRecommendationsShown()
			end
		end, { IsCountRecommendationIdsAbove, p1.onRecommendationsShown })
	end
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: FireAnalyticsEventFunction (copy), EventNames (upval), BtnValues (upval), p1 (copy)
		FireAnalyticsEventFunction(EventNames.CarouselGenericTileClicked, { btn = BtnValues.SeeAll.rawValue() })
		p1.goToAddFriendsPage(false)
	end, { p1.goToAddFriendsPage, FireAnalyticsEventFunction })
	local UseUserSeenEventResult = UseUserSeenEventFunction(FireAnalyticsEventFunction)
	local UseUserSeenCollectionEventResult = if FFlagLuaAppPYMKSendUserSeenCollection then if FFlagLuaAppUserSeenCollectionUnifiedFields then UseUserSeenCollectionEventFunction(FireAnalyticsEventFunction, {
		collectionId = if p1.sortAnalyticsData then p1.sortAnalyticsData.sortId else nil,
		collectionPosition = if p1.sortAnalyticsData then p1.sortAnalyticsData.sortIndex else nil,
		feedRowNumber = if p1.sortAnalyticsData then p1.sortAnalyticsData.startRow else nil,
		totalNumberOfItems = CountRecommendationIds
	}) else UseUserSeenCollectionEventFunction(FireAnalyticsEventFunction) else nil
	local UseResult1 = ReactModule.useCallback(function(List)
		-- upvalues: FFlagLuaAppPYMKSendUserSeenCollection (upval), UseMemoResult2 (ref), UseUserSeenCollectionEventResult (ref), UsePYMKCarouselItemListModuleResult (copy), UseUserSeenEventResult (copy)
		local Changed = {}
		
		for _, value in List do
			if FFlagLuaAppPYMKSendUserSeenCollection then
				local UseMemoResultEntry = UseMemoResult2[value]
				
				if UseMemoResultEntry and UseMemoResultEntry.id then
					UseUserSeenCollectionEventResult.addTileToCollection(UseMemoResultEntry.id, value, UseMemoResultEntry)
				end
			end
			table.insert(Changed, { item = UsePYMKCarouselItemListModuleResult[value] })
		end
		if #UseUserSeenEventResult > 0 then
			UseUserSeenEventResult[1].onViewableItemsChanged({ changed = Changed })
		end
	end, {
		UseUserSeenEventResult,
		UsePYMKCarouselItemListModuleResult,
		if FFlagLuaAppPYMKSendUserSeenCollection then UseMemoResult2 else nil,
		if FFlagLuaAppPYMKSendUserSeenCollection then UseUserSeenCollectionEventResult else nil
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
	local UsePYMKCarouselUserEntitiesListModuleResult = UsePYMKCarouselUserEntitiesListModule(UsePYMKCarouselItemListModuleResult)
	local UseContactsContextModuleResult = UseContactsContextModule(UsePYMKCarouselItemListModuleResult, if FFlagPymkCarouselExtendProps or FFlagLuaAppEnableSduiHomePage then RecommendationsById else nil)
	local UseResult2 = ReactModule.useCallback(function(CreateRow, Entity, AbsolutePosition)
		-- upvalues: ReactModule (upval), PYMKUserModule (upval), p1 (copy), FireAnalyticsEventFunction (copy), UseMemoResult (ref), FFlagPymkCarouselPresenceStoreMigrationModule (upval), v1 (ref), FFlagPymkCarouselExtendProps (upval), FFlagLuaAppEnableSduiHomePage (upval), RecommendationsById (ref)
		return ReactModule.createElement(PYMKUserModule, {
			createRow = CreateRow,
			entity = Entity,
			showToast = p1.showToast,
			fireAnalyticsEvent = FireAnalyticsEventFunction,
			absolutePosition = AbsolutePosition,
			recommendationSessionId = p1.recommendationSessionId,
			openProfilePeekView = p1.openProfilePeekView,
			impressionsTag = UseMemoResult,
			forceFetchUserPresence = if FFlagPymkCarouselPresenceStoreMigrationModule then v1 else nil,
			recommendation = if (FFlagPymkCarouselExtendProps or FFlagLuaAppEnableSduiHomePage) and RecommendationsById then RecommendationsById[tostring(Entity.id)] else nil,
			analyticsSurface = if FFlagPymkCarouselExtendProps then p1.analyticsSurface else nil
		})
	end, {
		p1.showToast, FireAnalyticsEventFunction, p1.recommendationSessionId,
		p1.openProfilePeekView,
		if FFlagPymkCarouselPresenceStoreMigrationModule then v1 else nil,
		if FFlagPymkCarouselExtendProps or FFlagLuaAppEnableSduiHomePage then RecommendationsById else nil,
		if FFlagPymkCarouselExtendProps then p1.analyticsSurface else nil,
		if FFlagPymkCarouselExtendProps then UseMemoResult else nil
	})
	
	return if #UsePYMKCarouselItemListModuleResult == 0 then nil else ReactModule.createElement(ReactModule.Fragment, nil, {
		ContactsContextProvider = ReactModule.createElement(ContactsContext.Provider, { value = UseContactsContextModuleResult }, {
			PYMKCarousel = ReactModule.createElement(HorizontalUserList, {
				entities = UsePYMKCarouselUserEntitiesListModuleResult,
				renderRow = UseResult2,
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
			pageContext = p1.pageContext,
			parentRef = UseRefResult,
			impressionsTag = UseMemoResult,
			scrollViewPositionChangedSignal = UseCollectionImpressionsSignalResult,
			sendImpressions = UseResult1,
			dataUpdatedTimestamp = UseStateResult
		})
	})
end)
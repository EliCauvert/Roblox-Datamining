local PYMKCarousel = script:FindFirstAncestor("PYMKCarousel")
local dependenciesModule = require(PYMKCarousel.dependencies)
local useSelector = dependenciesModule.Hooks.useSelector
local networkingPresence = dependenciesModule.NetworkingPresence
local recommendationContextType = dependenciesModule.RoduxFriends.Enums.RecommendationContextType
local parent = PYMKCarousel.Parent
local reactModule = require(parent.React)
local socialStopwatchModule = require(parent.SocialStopwatch)
local tutilsModule = require(parent.tutils)
local useCollectionImpressionsSignal = require(parent.CollectionViews).useCollectionImpressionsSignal
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local focusNavigationEventNameEnum = require(parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local inputHandlersModule = require(parent.InputHandlers)
local useThrottledCallback = require(parent.RoactUtils).Hooks.useThrottledCallback
local dashModule = require(parent.Dash)
local impressionsModule = require(parent.Impressions)
local screenSizeImpressionsTracker = impressionsModule.ScreenSizeImpressionsTracker
local frameBoundsImpressionsTracker = impressionsModule.FrameBoundsImpressionsTracker
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local analyticsModule = require(PYMKCarousel.Analytics)
local btnValues = analyticsModule.BtnValues
local eventNames = analyticsModule.EventNames
local useUserSeenEvent = analyticsModule.useUserSeenEvent
local useUserSeenCollectionEvent = analyticsModule.useUserSeenCollectionEvent
local _ = require(PYMKCarousel.Analytics.AnalyticsTypes)
local userListModule = require(parent.UserList)
local horizontalUserList = userListModule.HorizontalUserList.HorizontalUserList
local contactsContext = userListModule.ContactsContext
local usePYMKCarouselItemListModule = require(PYMKCarousel.Components.PYMKCarouselComponent.usePYMKCarouselItemList)
local getPYMKSortedRecommendationIdsModule = require(PYMKCarousel.installReducer.Selectors.getPYMKSortedRecommendationIds)
local useCallbackWhenVisibleModule = require(PYMKCarousel.Components.useCallbackWhenVisible)
local usePYMKCarouselUserEntitiesListModule = require(PYMKCarousel.Components.PYMKCarouselComponent.usePYMKCarouselUserEntitiesList)
local useContactsContextModule = require(PYMKCarousel.Components.PYMKCarouselComponent.useContactsContext)
local PYMKUserModule = require(PYMKCarousel.Components.PYMKUser)
local _ = require(PYMKCarousel.Common.DirectRecommendationTypes)
local fFlagLuaAppUseFrameBoundsImpressions = require(parent.SharedFlags).FFlagLuaAppUseFrameBoundsImpressions
local fFlagPymkCarouselPresenceStoreMigrationModule = require(PYMKCarousel.Flags.FFlagPymkCarouselPresenceStoreMigration)
local fFlagLuaAppPYMKSendUserSeenCollection = require(parent.SharedFlags).FFlagLuaAppPYMKSendUserSeenCollection
local fFlagLuaAppUserSeenCollectionUnifiedFields = require(parent.SharedFlags).FFlagLuaAppUserSeenCollectionUnifiedFields
local fFlagLuaAppEnableSduiHomePage = require(parent.SharedFlags).FFlagLuaAppEnableSduiHomePage
local var1 = 0
local t = {
	[Enum.KeyCode.ButtonX] = focusNavigationEventNameEnum.SeeAll
}
local homePagePYMKPresenceFetchThrottleInterval = game:DefineFastInt("HomePagePYMKPresenceFetchThrottleInterval", 60)

local function buildDirectRecommendationOverrides(p1)
	-- upvalues: recommendationContextType (ref)
	local t = {}
	local t_1 = {}
	
	for i, v in p1 do
		local contextType = recommendationContextType.fromRawValue(v.contextType) or recommendationContextType.None
		local t_2 = {
			id = v.id,
			rank = v.rank,
			contextType = contextType,
			mutualFriendsCount = v.mutualFriendsCount,
			hasIncomingFriendRequest = v.hasIncomingFriendRequest,
			entityDisplayName = v.entityDisplayName,
			thumbnailEntities = v.thumbnailEntities,
			absolutePosition = i,
			recommendationRank = v.rank,
			recommendationContextType = contextType
		}
		table.insert(t, t_2)
		t_1[v.id] = t_2
	end
	return { recommendationIds = t, recommendationsById = t_1 }
end

return reactModule.memo(function(p2)
	-- upvalues: reactModule (ref), useCollectionImpressionsSignal (ref), fFlagLuaAppEnableSduiHomePage (ref), buildDirectRecommendationOverrides (ref), useSelector (ref), getPYMKSortedRecommendationIdsModule (ref), tutilsModule (ref), usePYMKCarouselItemListModule (ref), fFlagLuaAppPYMKSendUserSeenCollection (ref), dashModule (ref), socialStopwatchModule (ref), fFlagPymkCarouselPresenceStoreMigrationModule (ref), useDispatch (ref), recommendationContextType (ref), networkingPresence (ref), eventNames (ref), useThrottledCallback (ref), homePagePYMKPresenceFetchThrottleInterval (ref), useCallbackWhenVisibleModule (ref), var1 (write), btnValues (ref), useUserSeenEvent (ref), fFlagLuaAppUserSeenCollectionUnifiedFields (ref), useUserSeenCollectionEvent (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), reactFocusNavigationModule (ref), t (ref), usePYMKCarouselUserEntitiesListModule (ref), useContactsContextModule (ref), PYMKUserModule (ref), contactsContext (ref), horizontalUserList (ref), fFlagLuaAppUseFrameBoundsImpressions (ref), frameBoundsImpressionsTracker (ref), screenSizeImpressionsTracker (ref)
	local recommendationIds
	local var2 = reactModule.useRef(nil)
	local var3, var4 = useCollectionImpressionsSignal(p2.scrollViewPositionChangedSignal)
	local _ = nil
	local recommendationsById = nil
	
	if fFlagLuaAppEnableSduiHomePage then
		local var5 = reactModule.useMemo(function()
			-- upvalues: buildDirectRecommendationOverrides (copy), p2 (ref)
			return buildDirectRecommendationOverrides(p2.recommendations or {})
		end, { p2.recommendations })
		recommendationIds = var5.recommendationIds
		recommendationsById = var5.recommendationsById
	else
		recommendationIds = useSelector(function(p3)
			-- upvalues: getPYMKSortedRecommendationIdsModule (copy)
			return getPYMKSortedRecommendationIdsModule(p3.LocalUserId)(p3)
		end, tutilsModule.shallowEqual)
	end
	local var6 = if recommendationIds then #recommendationIds else 0
	local recommendationSessionId = p2.recommendationSessionId
	local fireAnalyticsEvent = p2.fireAnalyticsEvent
	local var7 = usePYMKCarouselItemListModule({
		recommendationIds = recommendationIds,
		recommendationCount = var6,
		findFriendsTileEnabled = p2.findFriendsTileEnabled,
		seeAllTileEnabled = p2.seeAllTileEnabled
	})
	local var8 = if fFlagLuaAppPYMKSendUserSeenCollection then reactModule.useMemo(function()
		-- upvalues: dashModule (copy), var7 (ref)
		return dashModule.filter(var7, function(p3)
			return not p3.isButtonTile and not p3.isTooltip
		end)
	end, { var7 }) else nil
	reactModule.useLayoutEffect(function()
		-- upvalues: socialStopwatchModule (copy)
		socialStopwatchModule.Stopwatch.start(socialStopwatchModule.Events.PYMKCarouselLoaded)
		
		return function()
			-- upvalues: socialStopwatchModule (copy)
			if socialStopwatchModule.Stopwatch.get(socialStopwatchModule.Events.PYMKCarouselLoaded) then
				socialStopwatchModule.Stopwatch.stop(socialStopwatchModule.Events.PYMKCarouselLoaded)
			end
		end
	end, { recommendationSessionId })
	local var9, var10 = reactModule.useState(os.clock())
	local var11 = nil
	local _ = nil
	
	if fFlagPymkCarouselPresenceStoreMigrationModule then
		local var12, var13 = reactModule.useState(0)
		var11 = var12
		local var14 = var13
		useCallbackWhenVisibleModule({
			elementRef = var2,
			scrollViewPositionChangedSignal = p2.scrollViewPositionChangedSignal,
			callback = useThrottledCallback(function()
				-- upvalues: var14 (write), var11 (write)
				var14(var11 + 1)
			end, homePagePYMKPresenceFetchThrottleInterval)
		})
	else
		local var15 = useDispatch()
		useCallbackWhenVisibleModule({
			elementRef = var2,
			scrollViewPositionChangedSignal = p2.scrollViewPositionChangedSignal,
			callback = useThrottledCallback(reactModule.useCallback(function()
				-- upvalues: dashModule (copy), recommendationIds (write), recommendationContextType (copy), var15 (ref), networkingPresence (copy), fireAnalyticsEvent (ref), eventNames (copy)
				local var16 = dashModule.reduce(recommendationIds, function(p3, p4)
					-- upvalues: recommendationContextType (copy)
					if p4.recommendationContextType ~= recommendationContextType.Contacts then
						table.insert(p3, p4.id)
					end
					return p3
				end, {})
				
				if #var16 > 0 then
					var15(networkingPresence.GetPresencesFromUserIds.API(var16))
					fireAnalyticsEvent(eventNames.PYMKUserPresenceLoad)
				end
			end, { var15, recommendationIds, fireAnalyticsEvent }), homePagePYMKPresenceFetchThrottleInterval)
		})
	end
	reactModule.useEffect(function()
		-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), var6 (ref), var1 (copy), p2 (ref), var10 (ref)
		fireAnalyticsEvent(eventNames.CarouselLoadedWithUsers, {
			recommendationCount = var6,
			refreshCount = var1,
			findFriendsTileEnabled = p2.findFriendsTileEnabled
		})
		var1 += 1
		var10(os.clock())
	end, { recommendationSessionId, var6 })
	local var16 = reactModule.useCallback(function()
		-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), btnValues (copy), p2 (ref)
		fireAnalyticsEvent(eventNames.CarouselGenericTileClicked, { btn = btnValues.SeeAll.rawValue() })
		p2.goToAddFriendsPage(false)
	end, { p2.goToAddFriendsPage, fireAnalyticsEvent })
	local var17 = useUserSeenEvent(fireAnalyticsEvent)
	local var18 = if fFlagLuaAppPYMKSendUserSeenCollection then if fFlagLuaAppUserSeenCollectionUnifiedFields then useUserSeenCollectionEvent(fireAnalyticsEvent, {
		collectionId = if p2.sortAnalyticsData then p2.sortAnalyticsData.sortId else nil,
		collectionPosition = if p2.sortAnalyticsData then p2.sortAnalyticsData.sortIndex else nil,
		feedRowNumber = if p2.sortAnalyticsData then p2.sortAnalyticsData.startRow else nil,
		totalNumberOfItems = var6
	}) else useUserSeenCollectionEvent(fireAnalyticsEvent) else nil
	local var19 = reactModule.useCallback(function(p3)
		-- upvalues: fFlagLuaAppPYMKSendUserSeenCollection (copy), var8 (write), var18 (write), var7 (ref), var17 (ref)
		local t = {}
		
		for i, v in p3 do
			if fFlagLuaAppPYMKSendUserSeenCollection then
				local var20 = var8[v]
				
				if var20 and var20.id then
					var18.addTileToCollection(var20.id, v, var20)
				end
			end
			table.insert(t, { item = var7[v] })
		end
		if #var17 > 0 then
			var17[1].onViewableItemsChanged({ changed = t })
		end
	end, {
		var17,
		var7,
		if fFlagLuaAppPYMKSendUserSeenCollection then var8 else nil,
		if fFlagLuaAppPYMKSendUserSeenCollection then var18 else nil
	})
	local var21 = reactFocusNavigationModule.useEventHandlerMap(reactModule.useMemo(function()
		-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), var16 (ref)
		return {
			[focusNavigationEventNameEnum.SeeAll] = { handler = inputHandlersModule.onRelease(var16) }
		}
	end, { var16 }), reactFocusNavigationModule.useEventMap(t))
	reactModule.useEffect(function()
		-- upvalues: var21 (ref), var2 (ref)
		if var21 and var2 then
			var21(var2.current)
		end
		return function()
			-- upvalues: var21 (copy)
			var21(nil)
		end
	end, { var21, var2, var2 and var2.current })
	
	return if #var7 == 0 then nil else reactModule.createElement(reactModule.Fragment, nil, {
		ContactsContextProvider = reactModule.createElement(contactsContext.Provider, {
			value = useContactsContextModule(var7, if fFlagLuaAppEnableSduiHomePage then recommendationsById else nil)
		}, {
			PYMKCarousel = reactModule.createElement(horizontalUserList, {
				entities = usePYMKCarouselUserEntitiesListModule(var7),
				renderRow = reactModule.useCallback(function(p4, p5, p6)
					-- upvalues: reactModule (copy), PYMKUserModule (copy), p2 (ref), fireAnalyticsEvent (ref), fFlagPymkCarouselPresenceStoreMigrationModule (copy), var11 (write), fFlagLuaAppEnableSduiHomePage (copy), recommendationsById (write)
					return reactModule.createElement(PYMKUserModule, {
						impressionsTag = "PYMKCollectionCarousel",
						createRow = p4,
						entity = p5,
						showToast = p2.showToast,
						fireAnalyticsEvent = fireAnalyticsEvent,
						absolutePosition = p6,
						recommendationSessionId = p2.recommendationSessionId,
						openProfilePeekView = p2.openProfilePeekView,
						forceFetchUserPresence = if fFlagPymkCarouselPresenceStoreMigrationModule then var11 else nil,
						recommendation = if fFlagLuaAppEnableSduiHomePage and recommendationsById then recommendationsById[tostring(p5.id)] else nil
					})
				end, {
					p2.showToast, fireAnalyticsEvent, p2.recommendationSessionId,
					p2.openProfilePeekView,
					if fFlagPymkCarouselPresenceStoreMigrationModule then var11 else nil,
					if fFlagLuaAppEnableSduiHomePage then recommendationsById else nil
				}),
				header = { title = p2.carouselTitle, onTitleActivated = var16 },
				collectionCarouselConfigs = {
					onViewableItemsChanged = var4,
					onChangeCanvasPosition = var4
				},
				listConfigs = { showSubtitle = false },
				scrollingFrameRef = var2,
				appCompositionEnabled = p2.appCompositionEnabled
			})
		}),
		ScreenSizeImpressionsTracker = reactModule.createElement(if fFlagLuaAppUseFrameBoundsImpressions then frameBoundsImpressionsTracker else screenSizeImpressionsTracker, {
			impressionsTag = "PYMKCollectionCarousel",
			pageContext = p2.pageContext,
			parentRef = var2,
			scrollViewPositionChangedSignal = var3,
			sendImpressions = var19,
			dataUpdatedTimestamp = var9
		})
	})
end)
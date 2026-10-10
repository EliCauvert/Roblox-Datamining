local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local localizationModule = require(parent.Localization)
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(parent.MomentsTypes)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsReactModule = require(parent.SignalsReact)
local useLocalization = localizationModule.Hooks.useLocalization
local analytics = momentsCommonModule.Analytics
local eventNames = analytics.EventNames
local fireAnalyticsEvent = analytics.fireAnalyticsEvent
local momentsSurfaceLoadManager = momentsCommonModule.Performance.MomentsSurfaceLoadManager
local fFlagMomentsRemoveDeletedFromProfile = sharedFlagsModule.FFlagMomentsRemoveDeletedFromProfile
local fFlagMomentsOptimisticProfilePending = sharedFlagsModule.FFlagMomentsOptimisticProfilePending
local fFlagMomentsFeedMediaLoadAttemptedEvent = momentsCommonModule.Flags.FFlagMomentsFeedMediaLoadAttemptedEvent
local fFlagMomentsFeedHealthAnalytics = momentsCommonModule.Flags.FFlagMomentsFeedHealthAnalytics
local fFlagMomentsMediaSmoothnessTelemetry = momentsCommonModule.Flags.FFlagMomentsMediaSmoothnessTelemetry
local fFlagMomentsPassFeedItemIdToBackendApis = sharedFlagsModule.FFlagMomentsPassFeedItemIdToBackendApis
local fFlagMomentsComments = sharedFlagsModule.FFlagMomentsComments
local var1 = if fFlagMomentsComments then require(moments.Components.Comments.Sheet.getCommentsSheetStore) else nil
local verticalPagerModule = require(moments.Components.VerticalPager)
local _ = require(script.Parent.FeedTypes)
local feedContextModule = require(script.Parent.FeedContext)
local feedStateViewModule = require(script.Parent.FeedStateView)
local createFeedStoreModule = require(script.Parent.createFeedStore)
local feedItemRegistryModule = require(script.Parent.feedItemRegistry)
local feedTelemetryModule = require(script.Parent.feedTelemetry)
local getFeedScrollLimitModule = require(script.Parent.getFeedScrollLimit)
local useFeedTelemetryModule = require(script.Parent.useFeedTelemetry)
local feedNavigationBarModule = require(script.Parent.FeedNavigationBar)
local immersiveChromeControllerModule = require(script.Parent.ImmersiveChromeController)
local deletionConfirmationDialogModule = require(script.Parent.DeletionConfirmationDialog)
local getImmersiveChromeStoreModule = require(moments.Stores.GetImmersiveChromeStore)
local fFlagMomentsImmersiveChromeModule = require(moments.Flags.FFlagMomentsImmersiveChrome)
local getMomentsCapabilities = momentsCommonModule.Stores.GetMomentsCapabilities
local useMomentsSession = require(moments.Stores.GetMomentsStore.MomentsSessionContext).useMomentsSession
local fFlagMomentsFixDeleteToastCopyModule = require(moments.Flags.FFlagMomentsFixDeleteToastCopy)
local getFFlagMomentsNonInfiniteScroll = momentsCommonModule.Flags.GetFFlagMomentsNonInfiniteScroll
local fFlagMomentsNonInfiniteScrollEndStateFixesModule = require(moments.Flags.FFlagMomentsNonInfiniteScrollEndStateFixes)
local getToastStoreModule = require(moments.Stores.GetToastStore)
local getDeletedMomentsStoreModule = require(moments.Stores.GetDeletedMomentsStore)
local deleteMomentModule = require(moments.Moderation.deleteMoment)
local logMomentViewBeganModule = require(moments.Analytics.logMomentViewBegan)
local fFlagMomentsNavigationEventModule = require(moments.Flags.FFlagMomentsNavigationEvent)
local logFeedEndStateReachedModule = require(moments.Analytics.logFeedEndStateReached)
local makeFeedActionFieldsModule = require(moments.Analytics.makeFeedActionFields)
local momentMediaCoordinatorProviderModule = require(script.Parent.Media.MomentMediaCoordinatorProvider)
local surfaceReadyTrackerModule = require(script.Parent.SurfaceReadyTracker)
local swipeLatencyTrackerModule = require(script.Parent.SwipeLatencyTracker)
local verticalPager = verticalPagerModule.VerticalPager
local feedContext = feedContextModule.FeedContext
local var2 = feedTelemetryModule.createNoopTelemetry()
local t = {
	deletedTitle = "Feature.Moments.Label.MomentDeletedTitle",
	deletedBody = "Feature.Moments.Label.MomentDeletedBody",
	deletedToast = "Feature.Moments.Label.PostDeleted"
}

local function renderFeedItem(p1, p2)
	-- upvalues: feedItemRegistryModule (ref)
	local kind = feedItemRegistryModule[p1.kind]
	
	return if kind == nil then nil else kind.render(p1, p2)
end

local function feedItemKey(p1, p2)
	-- upvalues: feedItemRegistryModule (ref)
	local kind = feedItemRegistryModule[p1.kind]
	local var3 = if kind ~= nil then nil else kind.getKey(p1)
	
	return if var3 == nil or var3 == "" then tostring(p2) else var3
end

local function feedItemDedupeKey(p1)
	-- upvalues: feedItemRegistryModule (ref)
	local kind = feedItemRegistryModule[p1.kind]
	
	return if kind == nil then nil else kind.getKey(p1)
end

local function feedItemAttribution(p1)
	-- upvalues: feedItemRegistryModule (ref)
	local kind = feedItemRegistryModule[p1.kind]
	
	return if kind == nil then nil else kind.getAttribution(p1)
end

local function _(p1)
	return if p1 == nil then nil else tostring(p1)
end

local function makeMediaLoadEventFields(p1, p2)
	local recommendationMetadata = p1.recommendationMetadata
	local t = {
		momentId = p1.momentId,
		assetId = tostring(p1.assetId),
		captureType = p1.metadata.captureType.Name,
		creatorId = tostring(p1.creatorId),
		itemId = if recommendationMetadata ~= nil then nil else recommendationMetadata.feedItemId,
		tracingId = if recommendationMetadata ~= nil then nil else recommendationMetadata.tracingId,
		recommendationSource = p2.recommendationSource or "",
		feedSourceId = p2.id or ""
	}
	local placeId = p1.metadata.placeId
	t.placeId = if placeId ~= nil then nil else tostring(placeId)
	local universeId = p1.metadata.universeId
	t.universeId = if universeId ~= nil then nil else tostring(universeId)
	
	return t
end

local var3 = nil

local _ = function()
	-- upvalues: var3 (write), parent (ref)
	if var3 == nil then
		var3 = require(parent.Loggers).Logger:new("Moments.Feed")
	end
	return var3
end

return function(p1)
	-- upvalues: var2 (ref), fFlagMomentsComments (ref), var1 (ref), signalsReactModule (ref), getImmersiveChromeStoreModule (ref), fFlagMomentsImmersiveChromeModule (ref), useLocalization (ref), t (ref), useMomentsSession (ref), getToastStoreModule (ref), reactModule (ref), getFeedScrollLimitModule (ref), fFlagMomentsNonInfiniteScrollEndStateFixesModule (ref), getFFlagMomentsNonInfiniteScroll (ref), getMomentsCapabilities (ref), createFeedStoreModule (ref), feedItemDedupeKey (ref), fFlagMomentsMediaSmoothnessTelemetry (ref), fFlagMomentsNavigationEventModule (ref), logMomentViewBeganModule (ref), moments (ref), fireAnalyticsEvent (ref), eventNames (ref), logFeedEndStateReachedModule (ref), useFeedTelemetryModule (ref), feedItemAttribution (ref), fFlagMomentsOptimisticProfilePending (ref), momentsSurfaceLoadManager (ref), fFlagMomentsFeedHealthAnalytics (ref), feedItemRegistryModule (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), deleteMomentModule (ref), var3 (write), parent (ref), fFlagMomentsRemoveDeletedFromProfile (ref), getDeletedMomentsStoreModule (ref), makeFeedActionFieldsModule (ref), fFlagMomentsFixDeleteToastCopyModule (ref), makeMediaLoadEventFields (ref), analytics (ref), fFlagMomentsFeedMediaLoadAttemptedEvent (ref), feedContext (ref), verticalPager (ref), renderFeedItem (ref), feedItemKey (ref), feedStateViewModule (ref), feedNavigationBarModule (ref), immersiveChromeControllerModule (ref), swipeLatencyTrackerModule (ref), deletionConfirmationDialogModule (ref), momentMediaCoordinatorProviderModule (ref), surfaceReadyTrackerModule (ref)
	local source = p1.source
	local var4 = p1.active ~= nil or p1.active
	local var5 = if p1.playbackActive ~= nil then var4 else p1.playbackActive
	local var6 = p1.showNavigationBar ~= nil or p1.showNavigationBar
	local telemetry = p1.telemetry or var2
	local var7 = p1.trackSurfaceLoad == true
	local var8 = false
	local var9 = false
	
	if fFlagMomentsComments and var1 ~= nil then
		var8 = signalsReactModule.useSignalState(var1(false).getIsOpen)
		var9 = signalsReactModule.useSignalState(var1(false).getIsExpanded)
	end
	local var10 = var4 and not var8
	local var11 = var5 and not var9
	local var12 = getImmersiveChromeStoreModule(false)
	local var13 = useLocalization(t)
	local var14 = useMomentsSession()
	local var15 = getToastStoreModule(false)
	local var16 = signalsReactModule.useSignalState(var14.getPendingDeletion)
	local var17 = reactModule.useMemo(function()
		-- upvalues: getFeedScrollLimitModule (copy), fFlagMomentsNonInfiniteScrollEndStateFixesModule (copy), getFFlagMomentsNonInfiniteScroll (copy), getMomentsCapabilities (copy), createFeedStoreModule (copy), source (ref), feedItemDedupeKey (copy), var7 (ref)
		return createFeedStoreModule(source, feedItemDedupeKey, var7, getFeedScrollLimitModule(fFlagMomentsNonInfiniteScrollEndStateFixesModule, getFFlagMomentsNonInfiniteScroll(), function()
			-- upvalues: getMomentsCapabilities (copy)
			return getMomentsCapabilities(false)
		end))
	end, { source, var7 })
	reactModule.useEffect(function()
		-- upvalues: var17 (ref)
		var17.loadInitial()
		
		return function()
			-- upvalues: var17 (copy)
			var17.dispose()
		end
	end, { var17 })
	local var18 = reactModule.useRef(nil)
	local var19 = reactModule.useRef(nil)
	local var20 = reactModule.useRef(nil)
	local var21 = reactModule.useMemo(function()
		-- upvalues: fFlagMomentsMediaSmoothnessTelemetry (copy), fFlagMomentsNavigationEventModule (copy), var19 (ref), var20 (ref)
		if not fFlagMomentsMediaSmoothnessTelemetry and not fFlagMomentsNavigationEventModule then
			return nil
		end
		local t = {}
		
		if fFlagMomentsMediaSmoothnessTelemetry then
			function t.onTargetCommitted(p2, p3, p4)
				-- upvalues: var19 (copy)
				local current = var19.current
				
				if current ~= nil then
					current(p2, p3, p4)
				end
			end
		end
		if fFlagMomentsNavigationEventModule then
			function t.onUserStep(p2, p3)
				-- upvalues: var20 (copy)
				local current = var20.current
				
				if current ~= nil then
					current(p2, p3)
				end
			end
		end
		return t
	end, {})
	local var22 = reactModule.useRef(0)
	local var23 = reactModule.useRef(false)
	local var24 = reactModule.useRef(0)
	local var25 = reactModule.useRef(nil)
	local var26 = reactModule.useCallback(function(p2)
		-- upvalues: var23 (ref), var22 (ref), var25 (ref), fFlagMomentsNavigationEventModule (copy), var24 (ref), var17 (ref)
		if var23.current or DateTime.now().UnixTimestampMillis < var22.current then return end
		local current = var25.current
		
		if fFlagMomentsNavigationEventModule and p2 ~= nil and current ~= nil then
			current(p2)
		end
		var23.current = true
		var24.current += 1
		local current_1 = var24.current
		var17.refresh()
		task.spawn(function()
			-- upvalues: var23 (copy), current_1 (ref), var24 (copy), var17 (copy), var22 (copy)
			while var23.current and current_1 == var24.current do
				local status = var17.getStatus(false)
				
				if status ~= "Loaded" and status ~= "Empty" then
					if status ~= "Failed" then
						task.wait()
						continue
					end
					var23.current = false
					
					return
				end
				var23.current = false
				var22.current = DateTime.now().UnixTimestampMillis + 1000
				
				return
			end
		end)
	end, { var17 })
	local var27 = reactModule.useCallback(function(p3)
		-- upvalues: var17 (ref), var18 (ref)
		var17.prependItem({ kind = "moment", moment = p3 })
		local current = var18.current
		
		if current ~= nil then
			current.scrollToIndex(1)
		end
	end, { var17 })
	local var28 = reactModule.useRef(nil)
	local var29 = reactModule.useCallback(function(p3)
		-- upvalues: var28 (ref), logMomentViewBeganModule (copy), var14 (ref), fFlagMomentsNavigationEventModule (copy)
		if p3.kind ~= "moment" then return end
		local current = var28.current
		logMomentViewBeganModule(p3.moment, var14.getSessionSource(false), if fFlagMomentsNavigationEventModule and current ~= nil then current() else nil)
	end, { var14 })
	local var30 = p1.telemetry ~= nil
	local var31 = useFeedTelemetryModule(var17.pager, {
		telemetry = telemetry,
		active = var4,
		getAttribution = feedItemAttribution,
		recommendationSource = source.recommendationSource,
		onItemBecameActive = var29,
		onEndStateReached = if getFFlagMomentsNonInfiniteScroll() then reactModule.useCallback(function(p3)
			-- upvalues: logFeedEndStateReachedModule (copy), var14 (ref), source (ref)
			logFeedEndStateReachedModule({
				source = var14.getSessionSource(false),
				recommendationSource = source.recommendationSource or "",
				feedSourceId = source.id or "",
				itemPosition = p3
			})
		end, { var14, source }) else nil,
		onViewEnded = if fFlagMomentsNavigationEventModule then reactModule.useCallback(function(p3, p4)
			-- upvalues: moments (copy), fireAnalyticsEvent (copy), eventNames (copy), var30 (ref)
			fireAnalyticsEvent(eventNames.MomentsNavigationEvent, require(moments.Analytics.makeMomentsNavigationFields)({
				feedItemId = p3.itemId,
				viewId = p4.viewId,
				durationSeconds = p4.durationSeconds,
				destinationType = p4.destination,
				itemPosition = p4.itemPosition,
				tracingId = p3.tracingId,
				includeRecommendationDetail = var30,
				clientEventTimestampMs = DateTime.now().UnixTimestampMillis
			}))
		end, { var30 }) else nil,
		inactiveDestination = if fFlagMomentsNavigationEventModule then p1.inactiveDestination else nil
	})
	var28.current = var31.getViewId
	var25.current = var31.flushView
	var20.current = var31.noteUserStep
	reactModule.useImperativeHandle(p1.controllerRef, function()
		-- upvalues: var27 (ref), var26 (ref), var31 (ref)
		return {
			prependMoment = var27,
			refresh = var26,
			flushView = var31.flushView
		}
	end, { var27, var26, var31.flushView })
	local var32 = reactModule.useRef(var5)
	reactModule.useEffect(function()
		-- upvalues: var32 (ref), var5 (ref), var17 (ref), var29 (ref)
		local current = var32.current
		var32.current = var5
		
		if var5 and not current then
			local currentItem = var17.pager.getCurrentItem(false)
			
			if currentItem ~= nil then
				var29(currentItem)
			end
		end
	end, { var5, var17, var29 })
	local var33 = reactModule.useCallback(function()
		-- upvalues: var18 (ref)
		local current = var18.current
		
		if current ~= nil then
			current.next()
		end
	end, {})
	local var34 = reactModule.useCallback(function()
		-- upvalues: var18 (ref)
		local current = var18.current
		
		if current ~= nil then
			current.previous()
		end
	end, {})
	local var35 = signalsReactModule.useSignalState(var17.getStatus)
	local var36 = nil
	local var37 = nil
	
	if fFlagMomentsOptimisticProfilePending then
		var36 = signalsReactModule.useSignalState(var17.getInitialIndex)
		var37 = signalsReactModule.useSignalState(var17.getError)
	end
	local var38 = signalsReactModule.useSignalState(var17.getLoadMoreFailed)
	local var39 = reactModule.useRef({})
	reactModule.useEffect(function()
		-- upvalues: var24 (ref), var23 (ref), var22 (ref)
		return function()
			-- upvalues: var24 (copy), var23 (copy), var22 (copy)
			var24.current += 1
			var23.current = false
			var22.current = 0
		end
	end, { var17 })
	local var40 = reactModule.useRef(false)
	local var41 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var40 (ref), var7 (ref), momentsSurfaceLoadManager (copy), fireAnalyticsEvent (copy), eventNames (copy)
		if not var40.current then
			var40.current = true
			
			if var7 then
				momentsSurfaceLoadManager.renderStarted()
				momentsSurfaceLoadManager.surfaceMounted()
			end
			fireAnalyticsEvent(eventNames.MomentsFirstUIRenderedTimestamp, {
				value = if var7 and momentsSurfaceLoadManager.isSessionActive() then momentsSurfaceLoadManager.elapsedMs() else DateTime.now().UnixTimestampMillis
			})
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), var41 (ref), var35 (ref), fireAnalyticsEvent (copy), eventNames (copy)
		if var7 then return end
		if not var41.current and (var35 == "Loaded" or var35 == "LoadingMore") then
			var41.current = true
			fireAnalyticsEvent(eventNames.MomentsFirstContentLoadedTimestamp, { value = DateTime.now().UnixTimestampMillis })
		end
	end, { var35 })
	local var42 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: fFlagMomentsFeedHealthAnalytics (copy), var35 (ref), var42 (ref), fireAnalyticsEvent (copy), eventNames (copy), source (ref), var17 (ref)
		if not fFlagMomentsFeedHealthAnalytics then return end
		if var35 ~= var42.current then
			if var35 == "Failed" then
				fireAnalyticsEvent(eventNames.FeedLoadFailed, {
					recommendationSource = source.recommendationSource or "",
					feedSourceId = source.id or "",
					failureReason = var17.getError(false) or ""
				})
			elseif var35 == "Empty" then
				fireAnalyticsEvent(eventNames.FeedNoMomentsFetched, {
					recommendationSource = source.recommendationSource or "",
					feedSourceId = source.id or ""
				})
			end
		end
		var42.current = var35
	end, { var35 })
	local var43 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: fFlagMomentsFeedHealthAnalytics (copy), var38 (ref), var43 (ref), var17 (ref), feedItemRegistryModule (copy), fireAnalyticsEvent (copy), eventNames (copy), source (ref)
		if not fFlagMomentsFeedHealthAnalytics then return end
		if var38 and not var43.current then
			local var44
			local var45 = var17.pager.getItems(false)[var17.pager.getCurrentIndex(false)]
			
			if var45 == nil then
				var44 = nil
			else
				local kind = feedItemRegistryModule[var45.kind]
				var44 = if kind ~= nil then nil else kind.getAttribution(var45)
			end
			fireAnalyticsEvent(eventNames.FeedLoadMoreFailed, {
				recommendationSource = source.recommendationSource or "",
				feedSourceId = source.id or "",
				itemId = if var44 ~= nil then nil else var44.itemId,
				tracingId = if var44 ~= nil then nil else var44.tracingId
			})
		end
		var43.current = var38
	end, { var38 })
	local var44 = reactModule.useCallback(function()
		-- upvalues: var17 (ref), var18 (ref)
		local currentIndex = var17.pager.getCurrentIndex(false)
		local current = var18.current
		
		if current ~= nil then
			current.removeItem(currentIndex)
		end
	end, { var17 })
	local var45 = reactModule.useCallback(function()
		-- upvalues: var16 (ref), fFlagMomentsPassFeedItemIdToBackendApis (copy), var14 (ref), deleteMomentModule (copy), var3 (copy), parent (copy), var44 (ref), fFlagMomentsRemoveDeletedFromProfile (copy), fFlagMomentsOptimisticProfilePending (copy), getDeletedMomentsStoreModule (copy), makeFeedActionFieldsModule (copy), fireAnalyticsEvent (copy), eventNames (copy), fFlagMomentsFixDeleteToastCopyModule (copy), var15 (ref), var13 (ref)
		if var16 then
			local momentId = var16.momentId
			local feedItemId = var16.feedItemId
			local feedSessionId = var16.feedSessionId
			
			if fFlagMomentsPassFeedItemIdToBackendApis and (feedItemId == nil or feedItemId == "") then
				var14.clearPendingDeletion()
				
				return
			end
			task.spawn(function()
				-- upvalues: fFlagMomentsPassFeedItemIdToBackendApis (copy), deleteMomentModule (copy), momentId (ref), feedItemId (ref), var3 (copy), parent (copy)
				local var46, var47 = (if fFlagMomentsPassFeedItemIdToBackendApis then deleteMomentModule(momentId, nil, feedItemId) else deleteMomentModule(momentId)):await()
				
				if not var46 then
					if var3 == nil then
						var3 = require(parent.Loggers).Logger:new("Moments.Feed")
					end
					var3:warning("Failed to delete moment {}: {}", momentId, tostring(var47))
				end
			end)
			var44()
			
			if fFlagMomentsRemoveDeletedFromProfile or fFlagMomentsOptimisticProfilePending then
				getDeletedMomentsStoreModule(false).markDeleted(momentId)
			end
			local var46 = makeFeedActionFieldsModule(momentId, feedItemId, feedSessionId, "delete")
			
			if var46 then
				fireAnalyticsEvent(eventNames.MomentItemDeleted, var46)
			end
			if fFlagMomentsFixDeleteToastCopyModule then
				var15.triggerToast({ text = "", title = var13.deletedToast })
			else
				var15.triggerToast({ title = var13.deletedTitle, text = var13.deletedBody })
			end
		end
		var14.clearPendingDeletion()
	end, {
		var16,
		var14,
		var15,
		var13,
		var44
	})
	local var46 = reactModule.useCallback(function()
		-- upvalues: var14 (ref)
		var14.clearPendingDeletion()
	end, { var14 })
	local var47 = reactModule.useCallback(function(p3, p4)
		-- upvalues: var3 (copy), parent (copy), makeMediaLoadEventFields (copy), source (ref), fireAnalyticsEvent (copy), eventNames (copy)
		if var3 == nil then
			var3 = require(parent.Loggers).Logger:new("Moments.Feed")
		end
		var3:debug("Filtering moment after media load failure | momentId: {}, assetId: {}, captureType: {}, failureReason: {}", p3.momentId, tostring(p3.assetId), p3.metadata.captureType.Name, p4 or "nil")
		local var48 = makeMediaLoadEventFields(p3, source)
		
		if p4 ~= nil then
			var48.failureReason = p4
		end
		fireAnalyticsEvent(eventNames.FeedMediaLoadFailed, var48)
	end, { source })
	local var48 = reactModule.useCallback(function(p3, p4)
		-- upvalues: var39 (ref), var17 (ref), var47 (ref), var18 (ref)
		if var39.current[p3] then return end
		for i, v in var17.pager.getItems(false) do
			if v.kind == "moment" and v.moment.momentId == p3 then
				var39.current[p3] = true
				var47(v.moment, p4)
				local current = var18.current
				
				if current == nil then
					var17.pager.removeItem(i)
					
					return
				end
				current.removeItem(i)
				
				return
			end
		end
	end, { var17, var47 })
	local var49 = reactModule.createElement(feedContext.Provider, {
		value = reactModule.useMemo(function()
			-- upvalues: var17 (ref), var4 (ref), var5 (ref), source (ref), telemetry (ref), var31 (ref), var12 (ref), var44 (ref), var33 (ref), fFlagMomentsNonInfiniteScrollEndStateFixesModule (copy), getFFlagMomentsNonInfiniteScroll (copy)
			return {
				getStatus = var17.getStatus,
				isActiveFeed = var4,
				isPlaybackActive = var5,
				recommendationSource = source.recommendationSource,
				logAction = function(p5, p6, p7)
					-- upvalues: telemetry (copy)
					return telemetry.logAction(p5, p6, p7)
				end,
				flushView = var31.flushView,
				getChromeVisible = var12.getChromeVisible,
				revealChrome = var12.revealChrome,
				removeCurrentItem = var44,
				scrollToNext = var33,
				loadMoreBeyondLimit = if fFlagMomentsNonInfiniteScrollEndStateFixesModule then if getFFlagMomentsNonInfiniteScroll() then var17.loadBeyondLimit else nil else var17.loadBeyondLimit,
				getCanLoadMoreBeyondLimit = if fFlagMomentsNonInfiniteScrollEndStateFixesModule then var17.getCanLoadMoreBeyondLimit else nil
			}
		end, {
			var17, var4, var5, source, telemetry, var31.flushView, var12, var44, var33
		})
	}, {
		Root = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AnchorPoint = p1.AnchorPoint,
			LayoutOrder = p1.LayoutOrder,
			Position = p1.Position,
			Size = p1.Size or UDim2.fromScale(1, 1),
			ZIndex = p1.ZIndex
		}, {
			Pager = reactModule.createElement(verticalPager, {
				ZIndex = 1,
				store = var17.pager,
				renderItem = renderFeedItem,
				keyExtractor = feedItemKey,
				analytics = var21,
				onEndReached = var17.loadMore,
				active = var10 and (var35 ~= "Failed" and var35 ~= "Empty"),
				controllerRef = var18,
				initialIndex = if fFlagMomentsOptimisticProfilePending then var36 or p1.initialIndex else p1.initialIndex,
				tuning = p1.pager,
				Size = UDim2.fromScale(1, 1)
			}),
			StateOverlay = reactModule.createElement(feedStateViewModule, {
				zIndex = 2,
				status = var35,
				loadMoreFailed = var38 or fFlagMomentsOptimisticProfilePending and var37 ~= nil,
				onRetry = var17.retry,
				emptyContent = p1.emptyContent
			}),
			NavBar = if var6 and (if var35 ~= "Loaded" then var35 == "LoadingMore" else true) then reactModule.createElement(feedNavigationBarModule, {
				zIndex = 3,
				pager = var17.pager,
				active = var10,
				onScrollToNext = var33,
				onScrollToPrevious = var34
			}) else nil,
			ImmersiveController = if fFlagMomentsImmersiveChromeModule then reactModule.createElement(immersiveChromeControllerModule, {
				pager = var17.pager,
				active = var4 and var5,
				controllerRef = var18,
				coveringOverlay = var8
			}) else nil,
			SwipeLatency = if fFlagMomentsMediaSmoothnessTelemetry then reactModule.createElement(swipeLatencyTrackerModule, {
				pager = var17.pager,
				controllerRef = var18,
				onTargetCommittedRef = var19
			}) else nil,
			DeletionDialog = if var16 ~= nil then nil else reactModule.createElement(deletionConfirmationDialogModule, { onCancel = var46, onConfirm = var45 })
		})
	})
	
	return reactModule.createElement(momentMediaCoordinatorProviderModule, {
		pager = var17.pager,
		playbackActive = var11,
		createCoordinator = p1.createCoordinator,
		onMediaItemLoadAttempted = reactModule.useCallback(function(p5)
			-- upvalues: analytics (copy), var17 (ref), fFlagMomentsFeedMediaLoadAttemptedEvent (copy), fireAnalyticsEvent (copy), eventNames (copy), makeMediaLoadEventFields (copy), source (ref)
			analytics.reportMomentsFeedMediaLoad("attempted", var17.observabilityFeedType)
			
			if fFlagMomentsFeedMediaLoadAttemptedEvent then
				for i, v in var17.pager.getItems(false) do
					if v.kind == "moment" and v.moment.momentId == p5 then
						fireAnalyticsEvent(eventNames.FeedMediaLoadAttempted, makeMediaLoadEventFields(v.moment, source))
						
						return
					end
				end
			end
		end, { var17, source }),
		onMediaItemFailed = reactModule.useCallback(function(p6, p7)
			-- upvalues: analytics (copy), var17 (ref), var48 (ref)
			analytics.reportMomentsFeedMediaLoad("failed", var17.observabilityFeedType, p7)
			var48(p6, p7)
		end, { var17, var48 })
	}, if var7 then {
		Feed = var49,
		SurfaceReadyTracker = reactModule.createElement(surfaceReadyTrackerModule, { pager = var17.pager })
	} else var49)
end
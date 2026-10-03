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
	-- upvalues: var2 (ref), fFlagMomentsComments (ref), var1 (ref), signalsReactModule (ref), getImmersiveChromeStoreModule (ref), fFlagMomentsImmersiveChromeModule (ref), useLocalization (ref), t (ref), useMomentsSession (ref), getToastStoreModule (ref), reactModule (ref), getFeedScrollLimitModule (ref), fFlagMomentsNonInfiniteScrollEndStateFixesModule (ref), getFFlagMomentsNonInfiniteScroll (ref), getMomentsCapabilities (ref), createFeedStoreModule (ref), feedItemDedupeKey (ref), fFlagMomentsMediaSmoothnessTelemetry (ref), logMomentViewBeganModule (ref), logFeedEndStateReachedModule (ref), useFeedTelemetryModule (ref), feedItemAttribution (ref), fFlagMomentsOptimisticProfilePending (ref), momentsSurfaceLoadManager (ref), fireAnalyticsEvent (ref), eventNames (ref), fFlagMomentsFeedHealthAnalytics (ref), feedItemRegistryModule (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), deleteMomentModule (ref), var3 (write), parent (ref), fFlagMomentsRemoveDeletedFromProfile (ref), getDeletedMomentsStoreModule (ref), makeFeedActionFieldsModule (ref), fFlagMomentsFixDeleteToastCopyModule (ref), makeMediaLoadEventFields (ref), analytics (ref), fFlagMomentsFeedMediaLoadAttemptedEvent (ref), feedContext (ref), verticalPager (ref), renderFeedItem (ref), feedItemKey (ref), feedStateViewModule (ref), feedNavigationBarModule (ref), immersiveChromeControllerModule (ref), swipeLatencyTrackerModule (ref), deletionConfirmationDialogModule (ref), momentMediaCoordinatorProviderModule (ref), surfaceReadyTrackerModule (ref)
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
	local var20 = reactModule.useMemo(function()
		-- upvalues: fFlagMomentsMediaSmoothnessTelemetry (copy), var19 (ref)
		return if fFlagMomentsMediaSmoothnessTelemetry then {
			onTargetCommitted = function(p2, p3, p4)
				-- upvalues: var19 (copy)
				local current = var19.current
				
				if current ~= nil then
					current(p2, p3, p4)
				end
			end
		} else nil
	end, {})
	local var21 = reactModule.useRef(0)
	local var22 = reactModule.useRef(false)
	local var23 = reactModule.useRef(0)
	local var24 = reactModule.useCallback(function()
		-- upvalues: var22 (ref), var21 (ref), var23 (ref), var17 (ref)
		if var22.current or DateTime.now().UnixTimestampMillis < var21.current then
			return
		end
		var22.current = true
		var23.current += 1
		local current = var23.current
		var17.refresh()
		task.spawn(function()
			-- upvalues: var22 (copy), current (ref), var23 (copy), var17 (copy), var21 (copy)
			while var22.current and current == var23.current do
				local status = var17.getStatus(false)
				
				if status ~= "Loaded" and status ~= "Empty" then
					if status ~= "Failed" then
						task.wait()
						continue
					end
					var22.current = false
					
					return
				end
				var22.current = false
				var21.current = DateTime.now().UnixTimestampMillis + 1000
				
				return
			end
		end)
	end, { var17 })
	local var25 = reactModule.useCallback(function(p2)
		-- upvalues: var17 (ref), var18 (ref)
		var17.prependItem({ kind = "moment", moment = p2 })
		local current = var18.current
		
		if current ~= nil then
			current.scrollToIndex(1)
		end
	end, { var17 })
	local var26 = reactModule.useCallback(function(p2)
		-- upvalues: logMomentViewBeganModule (copy), var14 (ref)
		if p2.kind == "moment" then
			logMomentViewBeganModule(p2.moment, var14.getSessionSource(false))
			
			return
		end
	end, { var14 })
	local var27 = useFeedTelemetryModule(var17.pager, {
		telemetry = telemetry,
		active = var4,
		getAttribution = feedItemAttribution,
		recommendationSource = source.recommendationSource,
		onItemBecameActive = var26,
		onEndStateReached = if getFFlagMomentsNonInfiniteScroll() then reactModule.useCallback(function(p2)
			-- upvalues: logFeedEndStateReachedModule (copy), var14 (ref), source (ref)
			logFeedEndStateReachedModule({
				source = var14.getSessionSource(false),
				recommendationSource = source.recommendationSource or "",
				feedSourceId = source.id or "",
				itemPosition = p2
			})
		end, { var14, source }) else nil
	})
	reactModule.useImperativeHandle(p1.controllerRef, function()
		-- upvalues: var25 (ref), var24 (ref), var27 (ref)
		return {
			prependMoment = var25,
			refresh = var24,
			flushView = var27.flushView
		}
	end, { var25, var24, var27.flushView })
	local var28 = reactModule.useRef(var5)
	reactModule.useEffect(function()
		-- upvalues: var28 (ref), var5 (ref), var17 (ref), var26 (ref)
		local current = var28.current
		var28.current = var5
		
		if var5 and not current then
			local currentItem = var17.pager.getCurrentItem(false)
			
			if currentItem ~= nil then
				var26(currentItem)
			end
		end
	end, { var5, var17, var26 })
	local var29 = reactModule.useCallback(function()
		-- upvalues: var18 (ref)
		local current = var18.current
		
		if current ~= nil then
			current.next()
		end
	end, {})
	local var30 = reactModule.useCallback(function()
		-- upvalues: var18 (ref)
		local current = var18.current
		
		if current ~= nil then
			current.previous()
		end
	end, {})
	local var31 = signalsReactModule.useSignalState(var17.getStatus)
	local var32 = nil
	local var33 = nil
	
	if fFlagMomentsOptimisticProfilePending then
		var32 = signalsReactModule.useSignalState(var17.getInitialIndex)
		var33 = signalsReactModule.useSignalState(var17.getError)
	end
	local var34 = signalsReactModule.useSignalState(var17.getLoadMoreFailed)
	local var35 = reactModule.useRef({})
	reactModule.useEffect(function()
		-- upvalues: var23 (ref), var22 (ref), var21 (ref)
		return function()
			-- upvalues: var23 (copy), var22 (copy), var21 (copy)
			var23.current += 1
			var22.current = false
			var21.current = 0
		end
	end, { var17 })
	local var36 = reactModule.useRef(false)
	local var37 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var36 (ref), var7 (ref), momentsSurfaceLoadManager (copy), fireAnalyticsEvent (copy), eventNames (copy)
		if not var36.current then
			var36.current = true
			
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
		-- upvalues: var7 (ref), var37 (ref), var31 (ref), fireAnalyticsEvent (copy), eventNames (copy)
		if var7 then return end
		if not var37.current and (var31 == "Loaded" or var31 == "LoadingMore") then
			var37.current = true
			fireAnalyticsEvent(eventNames.MomentsFirstContentLoadedTimestamp, { value = DateTime.now().UnixTimestampMillis })
		end
	end, { var31 })
	local var38 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: fFlagMomentsFeedHealthAnalytics (copy), var31 (ref), var38 (ref), fireAnalyticsEvent (copy), eventNames (copy), source (ref), var17 (ref)
		if not fFlagMomentsFeedHealthAnalytics then return end
		if var31 ~= var38.current then
			if var31 == "Failed" then
				fireAnalyticsEvent(eventNames.FeedLoadFailed, {
					recommendationSource = source.recommendationSource or "",
					feedSourceId = source.id or "",
					failureReason = var17.getError(false) or ""
				})
			elseif var31 == "Empty" then
				fireAnalyticsEvent(eventNames.FeedNoMomentsFetched, {
					recommendationSource = source.recommendationSource or "",
					feedSourceId = source.id or ""
				})
			end
		end
		var38.current = var31
	end, { var31 })
	local var39 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: fFlagMomentsFeedHealthAnalytics (copy), var34 (ref), var39 (ref), var17 (ref), feedItemRegistryModule (copy), fireAnalyticsEvent (copy), eventNames (copy), source (ref)
		if not fFlagMomentsFeedHealthAnalytics then return end
		if var34 and not var39.current then
			local var40
			local var41 = var17.pager.getItems(false)[var17.pager.getCurrentIndex(false)]
			
			if var41 == nil then
				var40 = nil
			else
				local kind = feedItemRegistryModule[var41.kind]
				var40 = if kind ~= nil then nil else kind.getAttribution(var41)
			end
			fireAnalyticsEvent(eventNames.FeedLoadMoreFailed, {
				recommendationSource = source.recommendationSource or "",
				feedSourceId = source.id or "",
				itemId = if var40 ~= nil then nil else var40.itemId,
				tracingId = if var40 ~= nil then nil else var40.tracingId
			})
		end
		var39.current = var34
	end, { var34 })
	local var40 = reactModule.useCallback(function()
		-- upvalues: var17 (ref), var18 (ref)
		local currentIndex = var17.pager.getCurrentIndex(false)
		local current = var18.current
		
		if current ~= nil then
			current.removeItem(currentIndex)
		end
	end, { var17 })
	local var41 = reactModule.useCallback(function()
		-- upvalues: var16 (ref), fFlagMomentsPassFeedItemIdToBackendApis (copy), var14 (ref), deleteMomentModule (copy), var3 (copy), parent (copy), var40 (ref), fFlagMomentsRemoveDeletedFromProfile (copy), fFlagMomentsOptimisticProfilePending (copy), getDeletedMomentsStoreModule (copy), makeFeedActionFieldsModule (copy), fireAnalyticsEvent (copy), eventNames (copy), fFlagMomentsFixDeleteToastCopyModule (copy), var15 (ref), var13 (ref)
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
				local var42, var43 = (if fFlagMomentsPassFeedItemIdToBackendApis then deleteMomentModule(momentId, nil, feedItemId) else deleteMomentModule(momentId)):await()
				
				if not var42 then
					if var3 == nil then
						var3 = require(parent.Loggers).Logger:new("Moments.Feed")
					end
					var3:warning("Failed to delete moment {}: {}", momentId, tostring(var43))
				end
			end)
			var40()
			
			if fFlagMomentsRemoveDeletedFromProfile or fFlagMomentsOptimisticProfilePending then
				getDeletedMomentsStoreModule(false).markDeleted(momentId)
			end
			local var42 = makeFeedActionFieldsModule(momentId, feedItemId, feedSessionId, "delete")
			
			if var42 then
				fireAnalyticsEvent(eventNames.MomentItemDeleted, var42)
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
		var40
	})
	local var42 = reactModule.useCallback(function()
		-- upvalues: var14 (ref)
		var14.clearPendingDeletion()
	end, { var14 })
	local var43 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var3 (copy), parent (copy), makeMediaLoadEventFields (copy), source (ref), fireAnalyticsEvent (copy), eventNames (copy)
		if var3 == nil then
			var3 = require(parent.Loggers).Logger:new("Moments.Feed")
		end
		var3:debug("Filtering moment after media load failure | momentId: {}, assetId: {}, captureType: {}, failureReason: {}", p2.momentId, tostring(p2.assetId), p2.metadata.captureType.Name, p3 or "nil")
		local var44 = makeMediaLoadEventFields(p2, source)
		
		if p3 ~= nil then
			var44.failureReason = p3
		end
		fireAnalyticsEvent(eventNames.FeedMediaLoadFailed, var44)
	end, { source })
	local var44 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var35 (ref), var17 (ref), var43 (ref), var18 (ref)
		if var35.current[p2] then return end
		for i, v in var17.pager.getItems(false) do
			if v.kind == "moment" and v.moment.momentId == p2 then
				var35.current[p2] = true
				var43(v.moment, p3)
				local current = var18.current
				
				if current == nil then
					var17.pager.removeItem(i)
					
					return
				end
				current.removeItem(i)
				
				return
			end
		end
	end, { var17, var43 })
	local var45 = reactModule.createElement(feedContext.Provider, {
		value = reactModule.useMemo(function()
			-- upvalues: var17 (ref), var4 (ref), var5 (ref), source (ref), telemetry (ref), var27 (ref), var12 (ref), var40 (ref), fFlagMomentsNonInfiniteScrollEndStateFixesModule (copy), getFFlagMomentsNonInfiniteScroll (copy)
			return {
				getStatus = var17.getStatus,
				isActiveFeed = var4,
				isPlaybackActive = var5,
				recommendationSource = source.recommendationSource,
				logAction = function(p4, p5, p6)
					-- upvalues: telemetry (copy)
					return telemetry.logAction(p4, p5, p6)
				end,
				flushView = var27.flushView,
				getChromeVisible = var12.getChromeVisible,
				revealChrome = var12.revealChrome,
				removeCurrentItem = var40,
				loadMoreBeyondLimit = if fFlagMomentsNonInfiniteScrollEndStateFixesModule then if getFFlagMomentsNonInfiniteScroll() then var17.loadBeyondLimit else nil else var17.loadBeyondLimit,
				getCanLoadMoreBeyondLimit = if fFlagMomentsNonInfiniteScrollEndStateFixesModule then var17.getCanLoadMoreBeyondLimit else nil
			}
		end, {
			var17, var4, var5, source, telemetry, var27.flushView, var12, var40
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
				analytics = var20,
				onEndReached = var17.loadMore,
				active = var10 and (var31 ~= "Failed" and var31 ~= "Empty"),
				controllerRef = var18,
				initialIndex = if fFlagMomentsOptimisticProfilePending then var32 or p1.initialIndex else p1.initialIndex,
				tuning = p1.pager,
				Size = UDim2.fromScale(1, 1)
			}),
			StateOverlay = reactModule.createElement(feedStateViewModule, {
				zIndex = 2,
				status = var31,
				loadMoreFailed = var34 or fFlagMomentsOptimisticProfilePending and var33 ~= nil,
				onRetry = var17.retry,
				emptyContent = p1.emptyContent
			}),
			NavBar = if var6 and (if var31 ~= "Loaded" then var31 == "LoadingMore" else true) then reactModule.createElement(feedNavigationBarModule, {
				zIndex = 3,
				pager = var17.pager,
				active = var10,
				onScrollToNext = var29,
				onScrollToPrevious = var30
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
			DeletionDialog = if var16 ~= nil then nil else reactModule.createElement(deletionConfirmationDialogModule, { onCancel = var42, onConfirm = var41 })
		})
	})
	
	return reactModule.createElement(momentMediaCoordinatorProviderModule, {
		pager = var17.pager,
		playbackActive = var11,
		createCoordinator = p1.createCoordinator,
		onMediaItemLoadAttempted = reactModule.useCallback(function(p4)
			-- upvalues: analytics (copy), var17 (ref), fFlagMomentsFeedMediaLoadAttemptedEvent (copy), fireAnalyticsEvent (copy), eventNames (copy), makeMediaLoadEventFields (copy), source (ref)
			analytics.reportMomentsFeedMediaLoad("attempted", var17.observabilityFeedType)
			
			if fFlagMomentsFeedMediaLoadAttemptedEvent then
				for i, v in var17.pager.getItems(false) do
					if v.kind == "moment" and v.moment.momentId == p4 then
						fireAnalyticsEvent(eventNames.FeedMediaLoadAttempted, makeMediaLoadEventFields(v.moment, source))
						
						return
					end
				end
			end
		end, { var17, source }),
		onMediaItemFailed = reactModule.useCallback(function(p5, p6)
			-- upvalues: analytics (copy), var17 (ref), var44 (ref)
			analytics.reportMomentsFeedMediaLoad("failed", var17.observabilityFeedType, p6)
			var44(p5, p6)
		end, { var17, var44 })
	}, if var7 then {
		Feed = var45,
		SurfaceReadyTracker = reactModule.createElement(surfaceReadyTrackerModule, { pager = var17.pager })
	} else var45)
end
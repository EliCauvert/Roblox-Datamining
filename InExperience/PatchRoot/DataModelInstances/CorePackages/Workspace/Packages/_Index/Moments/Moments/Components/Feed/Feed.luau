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
local fFlagMomentsSurfaceLoadTTI = sharedFlagsModule.FFlagMomentsSurfaceLoadTTI
local fFlagMomentsRemoveDeletedFromProfile = sharedFlagsModule.FFlagMomentsRemoveDeletedFromProfile
local fFlagMomentsFeedMediaLoadAttemptedEvent = momentsCommonModule.Flags.FFlagMomentsFeedMediaLoadAttemptedEvent
local fFlagMomentsFeedHealthAnalytics = momentsCommonModule.Flags.FFlagMomentsFeedHealthAnalytics
local fFlagMomentsMediaSmoothnessTelemetry = momentsCommonModule.Flags.FFlagMomentsMediaSmoothnessTelemetry
local fFlagMomentsRealtimeObservability = momentsCommonModule.Flags.FFlagMomentsRealtimeObservability
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
local getFFlagMomentsFixDeleteModule = require(moments.Flags.GetFFlagMomentsFixDelete)
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
local getFFlagMomentsFilterUnavailableFeedItemsModule = require(moments.Flags.GetFFlagMomentsFilterUnavailableFeedItems)
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
	-- upvalues: var2 (ref), fFlagMomentsSurfaceLoadTTI (ref), fFlagMomentsComments (ref), var1 (ref), signalsReactModule (ref), getImmersiveChromeStoreModule (ref), fFlagMomentsImmersiveChromeModule (ref), useLocalization (ref), t (ref), useMomentsSession (ref), getToastStoreModule (ref), reactModule (ref), getFeedScrollLimitModule (ref), fFlagMomentsNonInfiniteScrollEndStateFixesModule (ref), getFFlagMomentsNonInfiniteScroll (ref), getMomentsCapabilities (ref), createFeedStoreModule (ref), feedItemDedupeKey (ref), fFlagMomentsMediaSmoothnessTelemetry (ref), logMomentViewBeganModule (ref), logFeedEndStateReachedModule (ref), useFeedTelemetryModule (ref), feedItemAttribution (ref), momentsSurfaceLoadManager (ref), fireAnalyticsEvent (ref), eventNames (ref), fFlagMomentsFeedHealthAnalytics (ref), feedItemRegistryModule (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), deleteMomentModule (ref), var3 (write), parent (ref), getFFlagMomentsFixDeleteModule (ref), fFlagMomentsRemoveDeletedFromProfile (ref), getDeletedMomentsStoreModule (ref), makeFeedActionFieldsModule (ref), fFlagMomentsFixDeleteToastCopyModule (ref), makeMediaLoadEventFields (ref), fFlagMomentsRealtimeObservability (ref), analytics (ref), fFlagMomentsFeedMediaLoadAttemptedEvent (ref), getFFlagMomentsFilterUnavailableFeedItemsModule (ref), feedContext (ref), verticalPager (ref), renderFeedItem (ref), feedItemKey (ref), feedStateViewModule (ref), feedNavigationBarModule (ref), immersiveChromeControllerModule (ref), swipeLatencyTrackerModule (ref), deletionConfirmationDialogModule (ref), momentMediaCoordinatorProviderModule (ref), surfaceReadyTrackerModule (ref)
	local source = p1.source
	local var4 = p1.active ~= nil or p1.active
	local var5 = if p1.playbackActive ~= nil then var4 else p1.playbackActive
	local var6 = p1.showNavigationBar ~= nil or p1.showNavigationBar
	local telemetry = p1.telemetry or var2
	local var7 = fFlagMomentsSurfaceLoadTTI and p1.trackSurfaceLoad == true
	local var8 = if fFlagMomentsComments and var1 ~= nil then signalsReactModule.useSignalState(var1(false).getIsOpen) else false
	local var9 = var4 and not var8
	local var10 = getImmersiveChromeStoreModule(false)
	local var11 = useLocalization(t)
	local var12 = useMomentsSession()
	local var13 = getToastStoreModule(false)
	local var14 = signalsReactModule.useSignalState(var12.getPendingDeletion)
	local var15 = reactModule.useMemo(function()
		-- upvalues: getFeedScrollLimitModule (copy), fFlagMomentsNonInfiniteScrollEndStateFixesModule (copy), getFFlagMomentsNonInfiniteScroll (copy), getMomentsCapabilities (copy), createFeedStoreModule (copy), source (ref), feedItemDedupeKey (copy), var7 (ref)
		return createFeedStoreModule(source, feedItemDedupeKey, var7, getFeedScrollLimitModule(fFlagMomentsNonInfiniteScrollEndStateFixesModule, getFFlagMomentsNonInfiniteScroll(), function()
			-- upvalues: getMomentsCapabilities (copy)
			return getMomentsCapabilities(false)
		end))
	end, { source, var7 })
	reactModule.useEffect(function()
		-- upvalues: var15 (ref)
		var15.loadInitial()
		
		return function()
			-- upvalues: var15 (copy)
			var15.dispose()
		end
	end, { var15 })
	local var16 = reactModule.useRef(nil)
	local var17 = reactModule.useRef(nil)
	local var18 = reactModule.useMemo(function()
		-- upvalues: fFlagMomentsMediaSmoothnessTelemetry (copy), var17 (ref)
		return if fFlagMomentsMediaSmoothnessTelemetry then {
			onTargetCommitted = function(p2, p3, p4)
				-- upvalues: var17 (copy)
				local current = var17.current
				
				if current ~= nil then
					current(p2, p3, p4)
				end
			end
		} else nil
	end, {})
	local var19 = reactModule.useRef(0)
	local var20 = reactModule.useRef(false)
	local var21 = reactModule.useRef(0)
	local var22 = reactModule.useCallback(function()
		-- upvalues: var20 (ref), var19 (ref), var21 (ref), var15 (ref)
		if var20.current or DateTime.now().UnixTimestampMillis < var19.current then
			return
		end
		var20.current = true
		var21.current += 1
		local current = var21.current
		var15.refresh()
		task.spawn(function()
			-- upvalues: var20 (copy), current (ref), var21 (copy), var15 (copy), var19 (copy)
			while var20.current and current == var21.current do
				local status = var15.getStatus(false)
				
				if status ~= "Loaded" and status ~= "Empty" then
					if status ~= "Failed" then
						task.wait()
						continue
					end
					var20.current = false
					
					return
				end
				var20.current = false
				var19.current = DateTime.now().UnixTimestampMillis + 1000
				
				return
			end
		end)
	end, { var15 })
	local var23 = reactModule.useCallback(function(p2)
		-- upvalues: var15 (ref), var16 (ref)
		var15.prependItem({ kind = "moment", moment = p2 })
		local current = var16.current
		
		if current ~= nil then
			current.scrollToIndex(1)
		end
	end, { var15 })
	local var24 = reactModule.useCallback(function(p2)
		-- upvalues: logMomentViewBeganModule (copy), var12 (ref)
		if p2.kind == "moment" then
			logMomentViewBeganModule(p2.moment, var12.getSessionSource(false))
			
			return
		end
	end, { var12 })
	local var25 = useFeedTelemetryModule(var15.pager, {
		telemetry = telemetry,
		active = var4,
		getAttribution = feedItemAttribution,
		recommendationSource = source.recommendationSource,
		onItemBecameActive = var24,
		onEndStateReached = if getFFlagMomentsNonInfiniteScroll() then reactModule.useCallback(function(p2)
			-- upvalues: logFeedEndStateReachedModule (copy), var12 (ref), source (ref)
			logFeedEndStateReachedModule({
				source = var12.getSessionSource(false),
				recommendationSource = source.recommendationSource or "",
				feedSourceId = source.id or "",
				itemPosition = p2
			})
		end, { var12, source }) else nil
	})
	reactModule.useImperativeHandle(p1.controllerRef, function()
		-- upvalues: var23 (ref), var22 (ref), var25 (ref)
		return {
			prependMoment = var23,
			refresh = var22,
			flushView = var25.flushView
		}
	end, { var23, var22, var25.flushView })
	local var26 = reactModule.useRef(var5)
	reactModule.useEffect(function()
		-- upvalues: var26 (ref), var5 (ref), var15 (ref), var24 (ref)
		local current = var26.current
		var26.current = var5
		
		if var5 and not current then
			local currentItem = var15.pager.getCurrentItem(false)
			
			if currentItem ~= nil then
				var24(currentItem)
			end
		end
	end, { var5, var15, var24 })
	local var27 = reactModule.useCallback(function()
		-- upvalues: var16 (ref)
		local current = var16.current
		
		if current ~= nil then
			current.next()
		end
	end, {})
	local var28 = reactModule.useCallback(function()
		-- upvalues: var16 (ref)
		local current = var16.current
		
		if current ~= nil then
			current.previous()
		end
	end, {})
	local var29 = signalsReactModule.useSignalState(var15.getStatus)
	local var30 = signalsReactModule.useSignalState(var15.getLoadMoreFailed)
	local var31 = reactModule.useRef({})
	reactModule.useEffect(function()
		-- upvalues: var21 (ref), var20 (ref), var19 (ref)
		return function()
			-- upvalues: var21 (copy), var20 (copy), var19 (copy)
			var21.current += 1
			var20.current = false
			var19.current = 0
		end
	end, { var15 })
	local var32 = reactModule.useRef(false)
	local var33 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var32 (ref), var7 (ref), momentsSurfaceLoadManager (copy), fireAnalyticsEvent (copy), eventNames (copy)
		if not var32.current then
			var32.current = true
			
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
		-- upvalues: var7 (ref), var33 (ref), var29 (ref), fireAnalyticsEvent (copy), eventNames (copy)
		if var7 then return end
		if not var33.current and (var29 == "Loaded" or var29 == "LoadingMore") then
			var33.current = true
			fireAnalyticsEvent(eventNames.MomentsFirstContentLoadedTimestamp, { value = DateTime.now().UnixTimestampMillis })
		end
	end, { var29 })
	local var34 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: fFlagMomentsFeedHealthAnalytics (copy), var29 (ref), var34 (ref), fireAnalyticsEvent (copy), eventNames (copy), source (ref), var15 (ref)
		if not fFlagMomentsFeedHealthAnalytics then return end
		if var29 ~= var34.current then
			if var29 == "Failed" then
				fireAnalyticsEvent(eventNames.FeedLoadFailed, {
					recommendationSource = source.recommendationSource or "",
					feedSourceId = source.id or "",
					failureReason = var15.getError(false) or ""
				})
			elseif var29 == "Empty" then
				fireAnalyticsEvent(eventNames.FeedNoMomentsFetched, {
					recommendationSource = source.recommendationSource or "",
					feedSourceId = source.id or ""
				})
			end
		end
		var34.current = var29
	end, { var29 })
	local var35 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: fFlagMomentsFeedHealthAnalytics (copy), var30 (ref), var35 (ref), var15 (ref), feedItemRegistryModule (copy), fireAnalyticsEvent (copy), eventNames (copy), source (ref)
		if not fFlagMomentsFeedHealthAnalytics then return end
		if var30 and not var35.current then
			local var36
			local var37 = var15.pager.getItems(false)[var15.pager.getCurrentIndex(false)]
			
			if var37 == nil then
				var36 = nil
			else
				local kind = feedItemRegistryModule[var37.kind]
				var36 = if kind ~= nil then nil else kind.getAttribution(var37)
			end
			fireAnalyticsEvent(eventNames.FeedLoadMoreFailed, {
				recommendationSource = source.recommendationSource or "",
				feedSourceId = source.id or "",
				itemId = if var36 ~= nil then nil else var36.itemId,
				tracingId = if var36 ~= nil then nil else var36.tracingId
			})
		end
		var35.current = var30
	end, { var30 })
	local var36 = reactModule.useCallback(function()
		-- upvalues: var15 (ref), var16 (ref)
		local currentIndex = var15.pager.getCurrentIndex(false)
		local current = var16.current
		
		if current ~= nil then
			current.removeItem(currentIndex)
		end
	end, { var15 })
	local var37 = reactModule.useCallback(function()
		-- upvalues: var14 (ref), fFlagMomentsPassFeedItemIdToBackendApis (copy), var12 (ref), deleteMomentModule (copy), var3 (copy), parent (copy), getFFlagMomentsFixDeleteModule (copy), var36 (ref), fFlagMomentsRemoveDeletedFromProfile (copy), getDeletedMomentsStoreModule (copy), makeFeedActionFieldsModule (copy), fireAnalyticsEvent (copy), eventNames (copy), fFlagMomentsFixDeleteToastCopyModule (copy), var13 (ref), var11 (ref)
		if var14 then
			local momentId = var14.momentId
			local feedItemId = var14.feedItemId
			local feedSessionId = var14.feedSessionId
			
			if fFlagMomentsPassFeedItemIdToBackendApis and (feedItemId == nil or feedItemId == "") then
				var12.clearPendingDeletion()
				
				return
			end
			task.spawn(function()
				-- upvalues: fFlagMomentsPassFeedItemIdToBackendApis (copy), deleteMomentModule (copy), momentId (ref), feedItemId (ref), var3 (copy), parent (copy)
				local var38, var39 = (if fFlagMomentsPassFeedItemIdToBackendApis then deleteMomentModule(momentId, nil, feedItemId) else deleteMomentModule(momentId)):await()
				
				if not var38 then
					if var3 == nil then
						var3 = require(parent.Loggers).Logger:new("Moments.Feed")
					end
					var3:warning("Failed to delete moment {}: {}", momentId, tostring(var39))
				end
			end)
			
			if getFFlagMomentsFixDeleteModule() then
				var36()
				
				if fFlagMomentsRemoveDeletedFromProfile then
					getDeletedMomentsStoreModule(false).markDeleted(momentId)
				end
			end
			local var38 = makeFeedActionFieldsModule(momentId, feedItemId, feedSessionId, "delete")
			
			if var38 then
				fireAnalyticsEvent(eventNames.MomentItemDeleted, var38)
			end
			if fFlagMomentsFixDeleteToastCopyModule then
				var13.triggerToast({ text = "", title = var11.deletedToast })
			else
				var13.triggerToast({ title = var11.deletedTitle, text = var11.deletedBody })
			end
		end
		var12.clearPendingDeletion()
	end, {
		var14,
		var12,
		var13,
		var11,
		var36
	})
	local var38 = reactModule.useCallback(function()
		-- upvalues: var12 (ref)
		var12.clearPendingDeletion()
	end, { var12 })
	local var39 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var3 (copy), parent (copy), makeMediaLoadEventFields (copy), source (ref), fireAnalyticsEvent (copy), eventNames (copy)
		if var3 == nil then
			var3 = require(parent.Loggers).Logger:new("Moments.Feed")
		end
		var3:debug("Filtering moment after media load failure | momentId: {}, assetId: {}, captureType: {}, failureReason: {}", p2.momentId, tostring(p2.assetId), p2.metadata.captureType.Name, p3 or "nil")
		local var40 = makeMediaLoadEventFields(p2, source)
		
		if p3 ~= nil then
			var40.failureReason = p3
		end
		fireAnalyticsEvent(eventNames.FeedMediaLoadFailed, var40)
	end, { source })
	local var40 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var31 (ref), var15 (ref), var39 (ref), var16 (ref)
		if var31.current[p2] then return end
		for i, v in var15.pager.getItems(false) do
			if v.kind == "moment" and v.moment.momentId == p2 then
				var31.current[p2] = true
				var39(v.moment, p3)
				local current = var16.current
				
				if current == nil then
					var15.pager.removeItem(i)
					
					return
				end
				current.removeItem(i)
				
				return
			end
		end
	end, { var15, var39 })
	local var41 = reactModule.createElement(feedContext.Provider, {
		value = reactModule.useMemo(function()
			-- upvalues: var15 (ref), var4 (ref), var5 (ref), source (ref), telemetry (ref), var25 (ref), var10 (ref), var36 (ref), fFlagMomentsNonInfiniteScrollEndStateFixesModule (copy), getFFlagMomentsNonInfiniteScroll (copy)
			return {
				getStatus = var15.getStatus,
				isActiveFeed = var4,
				isPlaybackActive = var5,
				recommendationSource = source.recommendationSource,
				logAction = function(p4, p5, p6)
					-- upvalues: telemetry (copy)
					return telemetry.logAction(p4, p5, p6)
				end,
				flushView = var25.flushView,
				getChromeVisible = var10.getChromeVisible,
				revealChrome = var10.revealChrome,
				removeCurrentItem = var36,
				loadMoreBeyondLimit = if fFlagMomentsNonInfiniteScrollEndStateFixesModule then if getFFlagMomentsNonInfiniteScroll() then var15.loadBeyondLimit else nil else var15.loadBeyondLimit,
				getCanLoadMoreBeyondLimit = if fFlagMomentsNonInfiniteScrollEndStateFixesModule then var15.getCanLoadMoreBeyondLimit else nil
			}
		end, {
			var15, var4, var5, source, telemetry, var25.flushView, var10, var36
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
				store = var15.pager,
				renderItem = renderFeedItem,
				keyExtractor = feedItemKey,
				analytics = var18,
				onEndReached = var15.loadMore,
				active = var9 and (var29 ~= "Failed" and var29 ~= "Empty"),
				controllerRef = var16,
				initialIndex = p1.initialIndex,
				tuning = p1.pager,
				Size = UDim2.fromScale(1, 1)
			}),
			StateOverlay = reactModule.createElement(feedStateViewModule, {
				zIndex = 2,
				status = var29,
				loadMoreFailed = var30,
				onRetry = var15.retry,
				emptyContent = p1.emptyContent
			}),
			NavBar = if var6 and (if var29 ~= "Loaded" then var29 == "LoadingMore" else true) then reactModule.createElement(feedNavigationBarModule, {
				zIndex = 3,
				pager = var15.pager,
				active = var9,
				onScrollToNext = var27,
				onScrollToPrevious = var28
			}) else nil,
			ImmersiveController = if fFlagMomentsImmersiveChromeModule then reactModule.createElement(immersiveChromeControllerModule, {
				pager = var15.pager,
				active = var4 and var5,
				controllerRef = var16,
				coveringOverlay = var8
			}) else nil,
			SwipeLatency = if fFlagMomentsMediaSmoothnessTelemetry then reactModule.createElement(swipeLatencyTrackerModule, {
				pager = var15.pager,
				controllerRef = var16,
				onTargetCommittedRef = var17
			}) else nil,
			DeletionDialog = if var14 ~= nil then nil else reactModule.createElement(deletionConfirmationDialogModule, { onCancel = var38, onConfirm = var37 })
		})
	})
	
	return reactModule.createElement(momentMediaCoordinatorProviderModule, {
		pager = var15.pager,
		playbackActive = var5,
		createCoordinator = p1.createCoordinator,
		onMediaItemLoadAttempted = if fFlagMomentsRealtimeObservability or fFlagMomentsFeedMediaLoadAttemptedEvent and getFFlagMomentsFilterUnavailableFeedItemsModule() then reactModule.useCallback(function(p4)
			-- upvalues: fFlagMomentsRealtimeObservability (copy), analytics (copy), var15 (ref), fFlagMomentsFeedMediaLoadAttemptedEvent (copy), getFFlagMomentsFilterUnavailableFeedItemsModule (copy), fireAnalyticsEvent (copy), eventNames (copy), makeMediaLoadEventFields (copy), source (ref)
			if fFlagMomentsRealtimeObservability then
				analytics.reportMomentsFeedMediaLoad("attempted", var15.observabilityFeedType)
			end
			if fFlagMomentsFeedMediaLoadAttemptedEvent and getFFlagMomentsFilterUnavailableFeedItemsModule() then
				for i, v in var15.pager.getItems(false) do
					if v.kind == "moment" and v.moment.momentId == p4 then
						fireAnalyticsEvent(eventNames.FeedMediaLoadAttempted, makeMediaLoadEventFields(v.moment, source))
						
						return
					end
				end
			end
		end, { var15, source }) else nil,
		onMediaItemFailed = if fFlagMomentsRealtimeObservability or getFFlagMomentsFilterUnavailableFeedItemsModule() then reactModule.useCallback(function(p5, p6)
			-- upvalues: fFlagMomentsRealtimeObservability (copy), analytics (copy), var15 (ref), getFFlagMomentsFilterUnavailableFeedItemsModule (copy), var40 (ref)
			if fFlagMomentsRealtimeObservability then
				analytics.reportMomentsFeedMediaLoad("failed", var15.observabilityFeedType, p6)
			end
			if getFFlagMomentsFilterUnavailableFeedItemsModule() then
				var40(p5, p6)
			end
		end, { var15, var40 }) else nil
	}, if var7 then {
		Feed = var41,
		SurfaceReadyTracker = reactModule.createElement(surfaceReadyTrackerModule, { pager = var15.pager })
	} else var41)
end
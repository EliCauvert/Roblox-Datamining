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
local fFlagMomentsFeedHealthAnalytics = momentsCommonModule.Flags.FFlagMomentsFeedHealthAnalytics
local fFlagMomentsMediaSmoothnessTelemetry = momentsCommonModule.Flags.FFlagMomentsMediaSmoothnessTelemetry
local fFlagMomentsRealtimeObservability = momentsCommonModule.Flags.FFlagMomentsRealtimeObservability
local fFlagMomentsPassFeedItemIdToBackendApis = sharedFlagsModule.FFlagMomentsPassFeedItemIdToBackendApis
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
local getMomentsCapabilitiesModule = require(moments.Stores.GetMomentsCapabilities)
local useMomentsSession = require(moments.Stores.GetMomentsStore.MomentsSessionContext).useMomentsSession
local getFFlagMomentsFixDeleteModule = require(moments.Flags.GetFFlagMomentsFixDelete)
local fFlagMomentsFixDeleteToastCopyModule = require(moments.Flags.FFlagMomentsFixDeleteToastCopy)
local getFFlagMomentsNonInfiniteScrollModule = require(moments.Flags.GetFFlagMomentsNonInfiniteScroll)
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
local var34 = feedTelemetryModule.createNoopTelemetry()
local t = {
	deletedTitle = "Feature.Moments.Label.MomentDeletedTitle",
	deletedBody = "Feature.Moments.Label.MomentDeletedBody",
	deletedToast = "Feature.Moments.Label.PostDeleted"
}

local function renderFeedItem(p0, p1)
	-- upvalues: feedItemRegistryModule (ref)
	local kind = feedItemRegistryModule[p0.kind]
	
	return if kind == nil then nil else kind.render(p0, p1)
end

local function feedItemKey(p2, p3)
	-- upvalues: feedItemRegistryModule (ref)
	local kind = feedItemRegistryModule[p2.kind]
	local var41 = if kind ~= nil then nil else kind.getKey(p2)
	
	return if var41 == nil or var41 == "" then tostring(p3) else var41
end

local function feedItemDedupeKey(p4)
	-- upvalues: feedItemRegistryModule (ref)
	local kind = feedItemRegistryModule[p4.kind]
	
	return if kind == nil then nil else kind.getKey(p4)
end

local function feedItemAttribution(p5)
	-- upvalues: feedItemRegistryModule (ref)
	local kind = feedItemRegistryModule[p5.kind]
	
	return if kind == nil then nil else kind.getAttribution(p5)
end

local function _(p6)
	return if p6 == nil then nil else tostring(p6)
end

local var40 = nil

local _ = function()
	-- upvalues: var40 (write), parent (ref)
	if var40 == nil then
		var40 = require(parent.Loggers).Logger:new("Moments.Feed")
	end
	return var40
end

return function(p7)
	-- upvalues: var34 (ref), fFlagMomentsSurfaceLoadTTI (ref), getImmersiveChromeStoreModule (ref), fFlagMomentsImmersiveChromeModule (ref), useLocalization (ref), t (ref), useMomentsSession (ref), getToastStoreModule (ref), signalsReactModule (ref), reactModule (ref), getFeedScrollLimitModule (ref), fFlagMomentsNonInfiniteScrollEndStateFixesModule (ref), getFFlagMomentsNonInfiniteScrollModule (ref), getMomentsCapabilitiesModule (ref), createFeedStoreModule (ref), feedItemDedupeKey (ref), fFlagMomentsMediaSmoothnessTelemetry (ref), logMomentViewBeganModule (ref), logFeedEndStateReachedModule (ref), useFeedTelemetryModule (ref), feedItemAttribution (ref), momentsSurfaceLoadManager (ref), fireAnalyticsEvent (ref), eventNames (ref), fFlagMomentsFeedHealthAnalytics (ref), feedItemRegistryModule (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), deleteMomentModule (ref), var40 (write), parent (ref), getFFlagMomentsFixDeleteModule (ref), fFlagMomentsRemoveDeletedFromProfile (ref), getDeletedMomentsStoreModule (ref), makeFeedActionFieldsModule (ref), momentsCommonModule (ref), fFlagMomentsFixDeleteToastCopyModule (ref), analytics (ref), fFlagMomentsRealtimeObservability (ref), getFFlagMomentsFilterUnavailableFeedItemsModule (ref), feedContext (ref), verticalPager (ref), renderFeedItem (ref), feedItemKey (ref), feedStateViewModule (ref), feedNavigationBarModule (ref), immersiveChromeControllerModule (ref), swipeLatencyTrackerModule (ref), deletionConfirmationDialogModule (ref), momentMediaCoordinatorProviderModule (ref), surfaceReadyTrackerModule (ref)
	local source = p7.source
	local var42 = p7.active ~= nil or p7.active
	local var43 = if p7.playbackActive ~= nil then var42 else p7.playbackActive
	local var44 = p7.showNavigationBar ~= nil or p7.showNavigationBar
	local telemetry = p7.telemetry or var34
	local var46 = fFlagMomentsSurfaceLoadTTI and p7.trackSurfaceLoad == true
	local var47 = getImmersiveChromeStoreModule(false)
	local var48 = useLocalization(t)
	local var49 = useMomentsSession()
	local var50 = getToastStoreModule(false)
	local var51 = signalsReactModule.useSignalState(var49.getPendingDeletion)
	local var52 = reactModule.useMemo(function()
		-- upvalues: getFeedScrollLimitModule (copy), fFlagMomentsNonInfiniteScrollEndStateFixesModule (copy), getFFlagMomentsNonInfiniteScrollModule (copy), getMomentsCapabilitiesModule (copy), createFeedStoreModule (copy), source (ref), feedItemDedupeKey (copy), var46 (ref)
		return createFeedStoreModule(source, feedItemDedupeKey, var46, getFeedScrollLimitModule(fFlagMomentsNonInfiniteScrollEndStateFixesModule, getFFlagMomentsNonInfiniteScrollModule(), function()
			-- upvalues: getMomentsCapabilitiesModule (copy)
			return getMomentsCapabilitiesModule(false)
		end))
	end, { source, var46 })
	reactModule.useEffect(function()
		-- upvalues: var52 (ref)
		var52.loadInitial()
		
		return function()
			-- upvalues: var52 (copy)
			var52.dispose()
		end
	end, { var52 })
	local var53 = reactModule.useRef(nil)
	local var54 = reactModule.useRef(nil)
	local var55 = reactModule.useMemo(function()
		-- upvalues: fFlagMomentsMediaSmoothnessTelemetry (copy), var54 (ref)
		return if fFlagMomentsMediaSmoothnessTelemetry then {
			onTargetCommitted = function(p8, p9, p10)
				-- upvalues: var54 (copy)
				local current = var54.current
				
				if current ~= nil then
					current(p8, p9, p10)
				end
			end
		} else nil
	end, {})
	local var56 = reactModule.useRef(0)
	local var57 = reactModule.useRef(false)
	local var58 = reactModule.useRef(0)
	local var59 = reactModule.useCallback(function()
		-- upvalues: var57 (ref), var56 (ref), var58 (ref), var52 (ref)
		if var57.current or DateTime.now().UnixTimestampMillis < var56.current then
			return
		end
		var57.current = true
		var58.current += 1
		local current = var58.current
		var52.refresh()
		task.spawn(function()
			-- upvalues: var57 (copy), current (ref), var58 (copy), var52 (copy), var56 (copy)
			while var57.current and current == var58.current do
				local status = var52.getStatus(false)
				
				if status ~= "Loaded" and status ~= "Empty" then
					if status ~= "Failed" then
						task.wait()
						continue
					end
					var57.current = false
					
					return
				end
				var57.current = false
				var56.current = DateTime.now().UnixTimestampMillis + 1000
				
				return
			end
		end)
	end, { var52 })
	local var60 = reactModule.useCallback(function(p11)
		-- upvalues: var52 (ref), var53 (ref)
		var52.prependItem({ kind = "moment", moment = p11 })
		local current = var53.current
		
		if current ~= nil then
			current.scrollToIndex(1)
		end
	end, { var52 })
	reactModule.useImperativeHandle(p7.controllerRef, function()
		-- upvalues: var60 (ref), var59 (ref)
		return { prependMoment = var60, refresh = var59 }
	end, { var60, var59 })
	local var61 = reactModule.useCallback(function(p12)
		-- upvalues: logMomentViewBeganModule (copy), var49 (ref)
		if p12.kind == "moment" then
			logMomentViewBeganModule(p12.moment, var49.getSessionSource(false))
			
			return
		end
	end, { var49 })
	local var62 = useFeedTelemetryModule(var52.pager, {
		telemetry = telemetry,
		active = var42,
		getAttribution = feedItemAttribution,
		recommendationSource = source.recommendationSource,
		onItemBecameActive = var61,
		onEndStateReached = if getFFlagMomentsNonInfiniteScrollModule() then reactModule.useCallback(function(p13)
			-- upvalues: logFeedEndStateReachedModule (copy), var49 (ref), source (ref)
			logFeedEndStateReachedModule({
				source = var49.getSessionSource(false),
				recommendationSource = source.recommendationSource or "",
				feedSourceId = source.id or "",
				itemPosition = p13
			})
		end, { var49, source }) else nil
	})
	local var63 = reactModule.useRef(var43)
	reactModule.useEffect(function()
		-- upvalues: var63 (ref), var43 (ref), var52 (ref), var61 (ref)
		local current = var63.current
		var63.current = var43
		
		if var43 and not current then
			local currentItem = var52.pager.getCurrentItem(false)
			
			if currentItem ~= nil then
				var61(currentItem)
			end
		end
	end, { var43, var52, var61 })
	local var64 = reactModule.useCallback(function()
		-- upvalues: var53 (ref)
		local current = var53.current
		
		if current ~= nil then
			current.next()
		end
	end, {})
	local var65 = reactModule.useCallback(function()
		-- upvalues: var53 (ref)
		local current = var53.current
		
		if current ~= nil then
			current.previous()
		end
	end, {})
	local var66 = signalsReactModule.useSignalState(var52.getStatus)
	local var67 = signalsReactModule.useSignalState(var52.getLoadMoreFailed)
	local var68 = reactModule.useRef({})
	reactModule.useEffect(function()
		-- upvalues: var58 (ref), var57 (ref), var56 (ref)
		return function()
			-- upvalues: var58 (copy), var57 (copy), var56 (copy)
			var58.current += 1
			var57.current = false
			var56.current = 0
		end
	end, { var52 })
	local var69 = reactModule.useRef(false)
	local var70 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var69 (ref), var46 (ref), momentsSurfaceLoadManager (copy), fireAnalyticsEvent (copy), eventNames (copy)
		if not var69.current then
			var69.current = true
			
			if var46 then
				momentsSurfaceLoadManager.renderStarted()
				momentsSurfaceLoadManager.surfaceMounted()
			end
			fireAnalyticsEvent(eventNames.MomentsFirstUIRenderedTimestamp, {
				value = if var46 and momentsSurfaceLoadManager.isSessionActive() then momentsSurfaceLoadManager.elapsedMs() else DateTime.now().UnixTimestampMillis
			})
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var46 (ref), var70 (ref), var66 (ref), fireAnalyticsEvent (copy), eventNames (copy)
		if var46 then return end
		if not var70.current and (var66 == "Loaded" or var66 == "LoadingMore") then
			var70.current = true
			fireAnalyticsEvent(eventNames.MomentsFirstContentLoadedTimestamp, { value = DateTime.now().UnixTimestampMillis })
		end
	end, { var66 })
	local var71 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: fFlagMomentsFeedHealthAnalytics (copy), var66 (ref), var71 (ref), fireAnalyticsEvent (copy), eventNames (copy), source (ref), var52 (ref)
		if not fFlagMomentsFeedHealthAnalytics then return end
		if var66 ~= var71.current then
			if var66 == "Failed" then
				fireAnalyticsEvent(eventNames.FeedLoadFailed, {
					recommendationSource = source.recommendationSource or "",
					feedSourceId = source.id or "",
					failureReason = var52.getError(false) or ""
				})
			elseif var66 == "Empty" then
				fireAnalyticsEvent(eventNames.FeedNoMomentsFetched, {
					recommendationSource = source.recommendationSource or "",
					feedSourceId = source.id or ""
				})
			end
		end
		var71.current = var66
	end, { var66 })
	local var72 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: fFlagMomentsFeedHealthAnalytics (copy), var67 (ref), var72 (ref), var52 (ref), feedItemRegistryModule (copy), fireAnalyticsEvent (copy), eventNames (copy), source (ref)
		if not fFlagMomentsFeedHealthAnalytics then return end
		if var67 and not var72.current then
			local var82
			local var81 = var52.pager.getItems(false)[var52.pager.getCurrentIndex(false)]
			
			if var81 == nil then
				var82 = nil
			else
				local kind = feedItemRegistryModule[var81.kind]
				var82 = if kind ~= nil then nil else kind.getAttribution(var81)
			end
			fireAnalyticsEvent(eventNames.FeedLoadMoreFailed, {
				recommendationSource = source.recommendationSource or "",
				feedSourceId = source.id or "",
				itemId = if var82 ~= nil then nil else var82.itemId,
				tracingId = if var82 ~= nil then nil else var82.tracingId
			})
		end
		var72.current = var67
	end, { var67 })
	local var73 = reactModule.useCallback(function()
		-- upvalues: var52 (ref), var53 (ref)
		local currentIndex = var52.pager.getCurrentIndex(false)
		local current = var53.current
		
		if current ~= nil then
			current.removeItem(currentIndex)
		end
	end, { var52 })
	local var74 = reactModule.useCallback(function()
		-- upvalues: var51 (ref), fFlagMomentsPassFeedItemIdToBackendApis (copy), var49 (ref), deleteMomentModule (copy), var40 (copy), parent (copy), getFFlagMomentsFixDeleteModule (copy), var73 (ref), fFlagMomentsRemoveDeletedFromProfile (copy), getDeletedMomentsStoreModule (copy), makeFeedActionFieldsModule (copy), momentsCommonModule (copy), fireAnalyticsEvent (copy), eventNames (copy), fFlagMomentsFixDeleteToastCopyModule (copy), var50 (ref), var48 (ref)
		if var51 then
			local momentId = var51.momentId
			local feedItemId = var51.feedItemId
			local feedSessionId = var51.feedSessionId
			
			if fFlagMomentsPassFeedItemIdToBackendApis and (feedItemId == nil or feedItemId == "") then
				var49.clearPendingDeletion()
				
				return
			end
			task.spawn(function()
				-- upvalues: fFlagMomentsPassFeedItemIdToBackendApis (copy), deleteMomentModule (copy), momentId (ref), feedItemId (ref), var40 (copy), parent (copy)
				local var85, var86 = (if fFlagMomentsPassFeedItemIdToBackendApis then deleteMomentModule(momentId, nil, feedItemId) else deleteMomentModule(momentId)):await()
				
				if not var85 then
					if var40 == nil then
						var40 = require(parent.Loggers).Logger:new("Moments.Feed")
					end
					var40:warning("Failed to delete moment {}: {}", momentId, tostring(var86))
				end
			end)
			
			if getFFlagMomentsFixDeleteModule() then
				var73()
				
				if fFlagMomentsRemoveDeletedFromProfile then
					getDeletedMomentsStoreModule(false).markDeleted(momentId)
				end
			end
			local var84 = makeFeedActionFieldsModule(momentId, feedItemId, feedSessionId, if momentsCommonModule.Flags.GetFFlagMomentsAnalyticsSchemaIdentity() then "delete" else nil)
			
			if var84 then
				fireAnalyticsEvent(eventNames.MomentItemDeleted, var84)
			end
			if fFlagMomentsFixDeleteToastCopyModule then
				var50.triggerToast({ text = "", title = var48.deletedToast })
			else
				var50.triggerToast({ title = var48.deletedTitle, text = var48.deletedBody })
			end
		end
		var49.clearPendingDeletion()
	end, {
		var51,
		var49,
		var50,
		var48,
		var73
	})
	local var75 = reactModule.useCallback(function()
		-- upvalues: var49 (ref)
		var49.clearPendingDeletion()
	end, { var49 })
	local var76 = reactModule.useCallback(function(p14, p15)
		-- upvalues: var40 (copy), parent (copy), fireAnalyticsEvent (copy), eventNames (copy), source (ref)
		local recommendationMetadata = p14.recommendationMetadata
		
		if var40 == nil then
			var40 = require(parent.Loggers).Logger:new("Moments.Feed")
		end
		var40:debug("Filtering moment after media load failure | momentId: {}, assetId: {}, captureType: {}, failureReason: {}", p14.momentId, tostring(p14.assetId), p14.metadata.captureType.Name, p15 or "nil")
		local feedMediaLoadFailed = eventNames.FeedMediaLoadFailed
		local t = {
			momentId = p14.momentId,
			assetId = tostring(p14.assetId),
			captureType = p14.metadata.captureType.Name,
			creatorId = tostring(p14.creatorId),
			itemId = if recommendationMetadata ~= nil then nil else recommendationMetadata.feedItemId,
			tracingId = if recommendationMetadata ~= nil then nil else recommendationMetadata.tracingId,
			recommendationSource = source.recommendationSource or "",
			feedSourceId = source.id or ""
		}
		local placeId = p14.metadata.placeId
		t.placeId = if placeId ~= nil then nil else tostring(placeId)
		local universeId = p14.metadata.universeId
		t.universeId = if universeId ~= nil then nil else tostring(universeId)
		t.failureReason = p15
		fireAnalyticsEvent(feedMediaLoadFailed, t)
	end, { source })
	local var77 = reactModule.useCallback(function(p16, p17)
		-- upvalues: var68 (ref), var52 (ref), var76 (ref), var53 (ref)
		if var68.current[p16] then return end
		for i, v in var52.pager.getItems(false) do
			if v.kind == "moment" and v.moment.momentId == p16 then
				var68.current[p16] = true
				var76(v.moment, p17)
				local current = var53.current
				
				if current == nil then
					var52.pager.removeItem(i)
					
					return
				end
				current.removeItem(i)
				
				return
			end
		end
	end, { var52, var76 })
	local var78 = reactModule.createElement(feedContext.Provider, {
		value = reactModule.useMemo(function()
			-- upvalues: var52 (ref), var42 (ref), var43 (ref), source (ref), telemetry (ref), var62 (ref), var47 (ref), var73 (ref), fFlagMomentsNonInfiniteScrollEndStateFixesModule (copy), getFFlagMomentsNonInfiniteScrollModule (copy)
			return {
				getStatus = var52.getStatus,
				isActiveFeed = var42,
				isPlaybackActive = var43,
				recommendationSource = source.recommendationSource,
				logAction = function(p18, p19, p20)
					-- upvalues: telemetry (copy)
					return telemetry.logAction(p18, p19, p20)
				end,
				flushView = var62.flushView,
				getChromeVisible = var47.getChromeVisible,
				revealChrome = var47.revealChrome,
				removeCurrentItem = var73,
				loadMoreBeyondLimit = if fFlagMomentsNonInfiniteScrollEndStateFixesModule then if getFFlagMomentsNonInfiniteScrollModule() then var52.loadBeyondLimit else nil else var52.loadBeyondLimit,
				getCanLoadMoreBeyondLimit = if fFlagMomentsNonInfiniteScrollEndStateFixesModule then var52.getCanLoadMoreBeyondLimit else nil
			}
		end, {
			var52, var42, var43, source, telemetry, var62.flushView, var47, var73
		})
	}, {
		Root = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AnchorPoint = p7.AnchorPoint,
			LayoutOrder = p7.LayoutOrder,
			Position = p7.Position,
			Size = p7.Size or UDim2.fromScale(1, 1),
			ZIndex = p7.ZIndex
		}, {
			Pager = reactModule.createElement(verticalPager, {
				ZIndex = 1,
				store = var52.pager,
				renderItem = renderFeedItem,
				keyExtractor = feedItemKey,
				analytics = var55,
				onEndReached = var52.loadMore,
				active = var42 and (var66 ~= "Failed" and var66 ~= "Empty"),
				controllerRef = var53,
				initialIndex = p7.initialIndex,
				tuning = p7.pager,
				Size = UDim2.fromScale(1, 1)
			}),
			StateOverlay = reactModule.createElement(feedStateViewModule, {
				zIndex = 2,
				status = var66,
				loadMoreFailed = var67,
				onRetry = var52.retry,
				emptyContent = p7.emptyContent
			}),
			NavBar = if var44 and (if var66 ~= "Loaded" then var66 == "LoadingMore" else true) then reactModule.createElement(feedNavigationBarModule, {
				zIndex = 3,
				pager = var52.pager,
				active = var42,
				onScrollToNext = var64,
				onScrollToPrevious = var65
			}) else nil,
			ImmersiveController = if fFlagMomentsImmersiveChromeModule then reactModule.createElement(immersiveChromeControllerModule, {
				pager = var52.pager,
				active = var42 and var43,
				controllerRef = var53
			}) else nil,
			SwipeLatency = if fFlagMomentsMediaSmoothnessTelemetry then reactModule.createElement(swipeLatencyTrackerModule, {
				pager = var52.pager,
				controllerRef = var53,
				onTargetCommittedRef = var54
			}) else nil,
			DeletionDialog = if var51 ~= nil then nil else reactModule.createElement(deletionConfirmationDialogModule, { onCancel = var75, onConfirm = var74 })
		})
	})
	
	return reactModule.createElement(momentMediaCoordinatorProviderModule, {
		pager = var52.pager,
		playbackActive = var43,
		createCoordinator = p7.createCoordinator,
		onMediaItemLoadAttempted = if fFlagMomentsRealtimeObservability then reactModule.useCallback(function(_)
			-- upvalues: analytics (copy), var52 (ref)
			analytics.reportMomentsFeedMediaLoad("attempted", var52.observabilityFeedType)
		end, { var52 }) else nil,
		onMediaItemFailed = if fFlagMomentsRealtimeObservability or getFFlagMomentsFilterUnavailableFeedItemsModule() then reactModule.useCallback(function(p21, p22)
			-- upvalues: fFlagMomentsRealtimeObservability (copy), analytics (copy), var52 (ref), getFFlagMomentsFilterUnavailableFeedItemsModule (copy), var77 (ref)
			if fFlagMomentsRealtimeObservability then
				analytics.reportMomentsFeedMediaLoad("failed", var52.observabilityFeedType, p22)
			end
			if getFFlagMomentsFilterUnavailableFeedItemsModule() then
				var77(p21, p22)
			end
		end, { var52, var77 }) else nil
	}, if var46 then {
		Feed = var78,
		SurfaceReadyTracker = reactModule.createElement(surfaceReadyTrackerModule, { pager = var52.pager })
	} else var78)
end
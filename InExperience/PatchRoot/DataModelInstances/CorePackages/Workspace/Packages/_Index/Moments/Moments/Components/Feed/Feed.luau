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
local var33 = feedTelemetryModule.createNoopTelemetry()
local t = {
	deletedTitle = "Feature.Moments.Label.MomentDeletedTitle",
	deletedBody = "Feature.Moments.Label.MomentDeletedBody"
}

local function renderFeedItem(p0, p1) --[[ line: 102 ]]
	-- upvalues: feedItemRegistryModule (ref)
	local kind = feedItemRegistryModule[p0.kind]
	
	return if kind == nil then nil else kind.render(p0, p1)
end

local function feedItemKey(p2, p3) --[[ line: 107 ]]
	-- upvalues: feedItemRegistryModule (ref)
	local kind = feedItemRegistryModule[p2.kind]
	local var40 = if kind ~= nil then nil else kind.getKey(p2)
	
	return if var40 == nil or var40 == "" then tostring(p3) else var40
end

local function feedItemDedupeKey(p4) --[[ line: 117 ]]
	-- upvalues: feedItemRegistryModule (ref)
	local kind = feedItemRegistryModule[p4.kind]
	
	return if kind == nil then nil else kind.getKey(p4)
end

local function feedItemAttribution(p5) --[[ line: 122 ]]
	-- upvalues: feedItemRegistryModule (ref)
	local kind = feedItemRegistryModule[p5.kind]
	
	return if kind == nil then nil else kind.getAttribution(p5)
end

local function _(p6) --[[ line: 127 | named "stringOrNil" ]]
	return if p6 == nil then nil else tostring(p6)
end

local var39 = nil

local _ = function() --[[ line: 132 | named "getLogger" ]]
	-- upvalues: var39 (write), parent (ref)
	if var39 == nil then
		var39 = require(parent.Loggers).Logger:new("Moments.Feed")
	end
	return var39
end

return function(p7) --[[ line: 187 | named "Feed" ]]
	-- upvalues: var33 (ref), fFlagMomentsSurfaceLoadTTI (ref), getImmersiveChromeStoreModule (ref), fFlagMomentsImmersiveChromeModule (ref), useLocalization (ref), t (ref), useMomentsSession (ref), getToastStoreModule (ref), signalsReactModule (ref), reactModule (ref), getFeedScrollLimitModule (ref), fFlagMomentsNonInfiniteScrollEndStateFixesModule (ref), getFFlagMomentsNonInfiniteScrollModule (ref), getMomentsCapabilitiesModule (ref), createFeedStoreModule (ref), feedItemDedupeKey (ref), fFlagMomentsMediaSmoothnessTelemetry (ref), logMomentViewBeganModule (ref), logFeedEndStateReachedModule (ref), useFeedTelemetryModule (ref), feedItemAttribution (ref), momentsSurfaceLoadManager (ref), fireAnalyticsEvent (ref), eventNames (ref), fFlagMomentsFeedHealthAnalytics (ref), feedItemRegistryModule (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), deleteMomentModule (ref), var39 (write), parent (ref), getFFlagMomentsFixDeleteModule (ref), fFlagMomentsRemoveDeletedFromProfile (ref), getDeletedMomentsStoreModule (ref), makeFeedActionFieldsModule (ref), momentsCommonModule (ref), analytics (ref), fFlagMomentsRealtimeObservability (ref), getFFlagMomentsFilterUnavailableFeedItemsModule (ref), feedContext (ref), verticalPager (ref), renderFeedItem (ref), feedItemKey (ref), feedStateViewModule (ref), feedNavigationBarModule (ref), immersiveChromeControllerModule (ref), swipeLatencyTrackerModule (ref), deletionConfirmationDialogModule (ref), momentMediaCoordinatorProviderModule (ref), surfaceReadyTrackerModule (ref)
	local source = p7.source
	local var41 = p7.active ~= nil or p7.active
	local var42 = if p7.playbackActive ~= nil then var41 else p7.playbackActive
	local var43 = p7.showNavigationBar ~= nil or p7.showNavigationBar
	local telemetry = p7.telemetry or var33
	local var45 = fFlagMomentsSurfaceLoadTTI and p7.trackSurfaceLoad == true
	local var46 = getImmersiveChromeStoreModule(false)
	local var47 = useLocalization(t)
	local var48 = useMomentsSession()
	local var49 = getToastStoreModule(false)
	local var50 = signalsReactModule.useSignalState(var48.getPendingDeletion)
	local var51 = reactModule.useMemo(function() --[[ line: 213 ]]
		-- upvalues: getFeedScrollLimitModule (copy), fFlagMomentsNonInfiniteScrollEndStateFixesModule (copy), getFFlagMomentsNonInfiniteScrollModule (copy), getMomentsCapabilitiesModule (copy), createFeedStoreModule (copy), source (ref), feedItemDedupeKey (copy), var45 (ref)
		return createFeedStoreModule(source, feedItemDedupeKey, var45, getFeedScrollLimitModule(fFlagMomentsNonInfiniteScrollEndStateFixesModule, getFFlagMomentsNonInfiniteScrollModule(), function() --[[ line: 217 ]]
			-- upvalues: getMomentsCapabilitiesModule (copy)
			return getMomentsCapabilitiesModule(false)
		end))
	end, { source, var45 })
	reactModule.useEffect(function() --[[ line: 225 ]]
		-- upvalues: var51 (ref)
		var51.loadInitial()
		
		return function() --[[ line: 227 ]]
			-- upvalues: var51 (copy)
			var51.dispose()
		end
	end, { var51 })
	local var52 = reactModule.useRef(nil)
	local var53 = reactModule.useRef(nil)
	local var54 = reactModule.useMemo(function() --[[ line: 235 ]]
		-- upvalues: fFlagMomentsMediaSmoothnessTelemetry (copy), var53 (ref)
		return if fFlagMomentsMediaSmoothnessTelemetry then {
			onTargetCommitted = function(p8, p9, p10) --[[ line: 240 ]]
				-- upvalues: var53 (copy)
				local current = var53.current
				
				if current ~= nil then
					current(p8, p9, p10)
				end
			end
		} else nil
	end, {})
	local var55 = reactModule.useRef(0)
	local var56 = reactModule.useRef(false)
	local var57 = reactModule.useRef(0)
	local var58 = reactModule.useCallback(function() --[[ line: 252 ]]
		-- upvalues: var56 (ref), var55 (ref), var57 (ref), var51 (ref)
		if var56.current or DateTime.now().UnixTimestampMillis < var55.current then
			return
		end
		var56.current = true
		var57.current += 1
		local current = var57.current
		var51.refresh()
		task.spawn(function() --[[ line: 261 ]]
			-- upvalues: var56 (copy), current (ref), var57 (copy), var51 (copy), var55 (copy)
			while var56.current and current == var57.current do
				local status = var51.getStatus(false)
				
				if status ~= "Loaded" and status ~= "Empty" then
					if status ~= "Failed" then
						task.wait()
						continue
					end
					var56.current = false
					
					return
				end
				var56.current = false
				var55.current = DateTime.now().UnixTimestampMillis + 1000
				
				return
			end
		end)
	end, { var51 })
	local var59 = reactModule.useCallback(function(p11) --[[ line: 278 ]]
		-- upvalues: var51 (ref), var52 (ref)
		var51.prependItem({ kind = "moment", moment = p11 })
		local current = var52.current
		
		if current ~= nil then
			current.scrollToIndex(1)
		end
	end, { var51 })
	reactModule.useImperativeHandle(p7.controllerRef, function() --[[ line: 286 ]]
		-- upvalues: var59 (ref), var58 (ref)
		return { prependMoment = var59, refresh = var58 }
	end, { var59, var58 })
	local var60 = reactModule.useCallback(function(p12) --[[ line: 293 ]]
		-- upvalues: logMomentViewBeganModule (copy), var48 (ref)
		if p12.kind == "moment" then
			logMomentViewBeganModule(p12.moment, var48.getSessionSource(false))
			
			return
		end
	end, { var48 })
	local var61 = useFeedTelemetryModule(var51.pager, {
		telemetry = telemetry,
		active = var41,
		getAttribution = feedItemAttribution,
		recommendationSource = source.recommendationSource,
		onItemBecameActive = var60,
		onEndStateReached = if getFFlagMomentsNonInfiniteScrollModule() then reactModule.useCallback(function(p13) --[[ line: 301 ]]
			-- upvalues: logFeedEndStateReachedModule (copy), var48 (ref), source (ref)
			logFeedEndStateReachedModule({
				source = var48.getSessionSource(false),
				recommendationSource = source.recommendationSource or "",
				feedSourceId = source.id or "",
				itemPosition = p13
			})
		end, { var48, source }) else nil
	})
	local var62 = reactModule.useRef(var42)
	reactModule.useEffect(function() --[[ line: 324 ]]
		-- upvalues: var62 (ref), var42 (ref), var51 (ref), var60 (ref)
		local current = var62.current
		var62.current = var42
		
		if var42 and not current then
			local currentItem = var51.pager.getCurrentItem(false)
			
			if currentItem ~= nil then
				var60(currentItem)
			end
		end
	end, { var42, var51, var60 })
	local var63 = reactModule.useCallback(function() --[[ line: 335 ]]
		-- upvalues: var52 (ref)
		local current = var52.current
		
		if current ~= nil then
			current.next()
		end
	end, {})
	local var64 = reactModule.useCallback(function() --[[ line: 341 ]]
		-- upvalues: var52 (ref)
		local current = var52.current
		
		if current ~= nil then
			current.previous()
		end
	end, {})
	local var65 = signalsReactModule.useSignalState(var51.getStatus)
	local var66 = signalsReactModule.useSignalState(var51.getLoadMoreFailed)
	local var67 = reactModule.useRef({})
	reactModule.useEffect(function() --[[ line: 355 ]]
		-- upvalues: var57 (ref), var56 (ref), var55 (ref)
		return function() --[[ line: 356 ]]
			-- upvalues: var57 (copy), var56 (copy), var55 (copy)
			var57.current += 1
			var56.current = false
			var55.current = 0
		end
	end, { var51 })
	local var68 = reactModule.useRef(false)
	local var69 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 368 ]]
		-- upvalues: var68 (ref), var45 (ref), momentsSurfaceLoadManager (copy), fireAnalyticsEvent (copy), eventNames (copy)
		if not var68.current then
			var68.current = true
			
			if var45 then
				momentsSurfaceLoadManager.renderStarted()
				momentsSurfaceLoadManager.surfaceMounted()
			end
			fireAnalyticsEvent(eventNames.MomentsFirstUIRenderedTimestamp, {
				value = if var45 and momentsSurfaceLoadManager.isSessionActive() then momentsSurfaceLoadManager.elapsedMs() else DateTime.now().UnixTimestampMillis
			})
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 387 ]]
		-- upvalues: var45 (ref), var69 (ref), var65 (ref), fireAnalyticsEvent (copy), eventNames (copy)
		if var45 then return end
		if not var69.current and (var65 == "Loaded" or var65 == "LoadingMore") then
			var69.current = true
			fireAnalyticsEvent(eventNames.MomentsFirstContentLoadedTimestamp, { value = DateTime.now().UnixTimestampMillis })
		end
	end, { var65 })
	local var70 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 403 ]]
		-- upvalues: fFlagMomentsFeedHealthAnalytics (copy), var65 (ref), var70 (ref), fireAnalyticsEvent (copy), eventNames (copy), source (ref), var51 (ref)
		if not fFlagMomentsFeedHealthAnalytics then return end
		if var65 ~= var70.current then
			if var65 == "Failed" then
				fireAnalyticsEvent(eventNames.FeedLoadFailed, {
					recommendationSource = source.recommendationSource or "",
					feedSourceId = source.id or "",
					failureReason = var51.getError(false) or ""
				})
			elseif var65 == "Empty" then
				fireAnalyticsEvent(eventNames.FeedNoMomentsFetched, {
					recommendationSource = source.recommendationSource or "",
					feedSourceId = source.id or ""
				})
			end
		end
		var70.current = var65
	end, { var65 })
	local var71 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 430 ]]
		-- upvalues: fFlagMomentsFeedHealthAnalytics (copy), var66 (ref), var71 (ref), var51 (ref), feedItemRegistryModule (copy), fireAnalyticsEvent (copy), eventNames (copy), source (ref)
		if not fFlagMomentsFeedHealthAnalytics then return end
		if var66 and not var71.current then
			local var81
			local var80 = var51.pager.getItems(false)[var51.pager.getCurrentIndex(false)]
			
			if var80 == nil then
				var81 = nil
			else
				local kind = feedItemRegistryModule[var80.kind]
				var81 = if kind ~= nil then nil else kind.getAttribution(var80)
			end
			fireAnalyticsEvent(eventNames.FeedLoadMoreFailed, {
				recommendationSource = source.recommendationSource or "",
				feedSourceId = source.id or "",
				itemId = if var81 ~= nil then nil else var81.itemId,
				tracingId = if var81 ~= nil then nil else var81.tracingId
			})
		end
		var71.current = var66
	end, { var66 })
	local var72 = reactModule.useCallback(function() --[[ line: 448 ]]
		-- upvalues: var51 (ref), var52 (ref)
		local currentIndex = var51.pager.getCurrentIndex(false)
		local current = var52.current
		
		if current ~= nil then
			current.removeItem(currentIndex)
		end
	end, { var51 })
	local var73 = reactModule.useCallback(function() --[[ line: 460 ]]
		-- upvalues: var50 (ref), fFlagMomentsPassFeedItemIdToBackendApis (copy), var48 (ref), deleteMomentModule (copy), var39 (copy), parent (copy), getFFlagMomentsFixDeleteModule (copy), var72 (ref), fFlagMomentsRemoveDeletedFromProfile (copy), getDeletedMomentsStoreModule (copy), makeFeedActionFieldsModule (copy), momentsCommonModule (copy), fireAnalyticsEvent (copy), eventNames (copy), var49 (ref), var47 (ref)
		if var50 then
			local momentId = var50.momentId
			local feedItemId = var50.feedItemId
			local feedSessionId = var50.feedSessionId
			
			if fFlagMomentsPassFeedItemIdToBackendApis and (feedItemId == nil or feedItemId == "") then
				var48.clearPendingDeletion()
				
				return
			end
			task.spawn(function() --[[ line: 475 ]]
				-- upvalues: fFlagMomentsPassFeedItemIdToBackendApis (copy), deleteMomentModule (copy), momentId (ref), feedItemId (ref), var39 (copy), parent (copy)
				local var84, var85 = (if fFlagMomentsPassFeedItemIdToBackendApis then deleteMomentModule(momentId, nil, feedItemId) else deleteMomentModule(momentId)):await()
				
				if not var84 then
					if var39 == nil then
						var39 = require(parent.Loggers).Logger:new("Moments.Feed")
					end
					var39:warning("Failed to delete moment {}: {}", momentId, tostring(var85))
				end
			end)
			
			if getFFlagMomentsFixDeleteModule() then
				var72()
				
				if fFlagMomentsRemoveDeletedFromProfile then
					getDeletedMomentsStoreModule(false).markDeleted(momentId)
				end
			end
			local var83 = makeFeedActionFieldsModule(momentId, feedItemId, feedSessionId, if momentsCommonModule.Flags.GetFFlagMomentsAnalyticsSchemaIdentity() then "delete" else nil)
			
			if var83 then
				fireAnalyticsEvent(eventNames.MomentItemDeleted, var83)
			end
			var49.triggerToast({ title = var47.deletedTitle, text = var47.deletedBody })
		end
		var48.clearPendingDeletion()
	end, {
		var50,
		var48,
		var49,
		var47,
		var72
	})
	local var74 = reactModule.useCallback(function() --[[ line: 521 ]]
		-- upvalues: var48 (ref)
		var48.clearPendingDeletion()
	end, { var48 })
	local var75 = reactModule.useCallback(function(p14, p15) --[[ line: 525 ]]
		-- upvalues: var39 (copy), parent (copy), fireAnalyticsEvent (copy), eventNames (copy), source (ref)
		local recommendationMetadata = p14.recommendationMetadata
		
		if var39 == nil then
			var39 = require(parent.Loggers).Logger:new("Moments.Feed")
		end
		var39:debug("Filtering moment after media load failure | momentId: {}, assetId: {}, captureType: {}, failureReason: {}", p14.momentId, tostring(p14.assetId), p14.metadata.captureType.Name, p15 or "nil")
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
	local var76 = reactModule.useCallback(function(p16, p17) --[[ line: 549 ]]
		-- upvalues: var67 (ref), var51 (ref), var75 (ref), var52 (ref)
		if var67.current[p16] then return end
		for i, v in var51.pager.getItems(false) do
			if v.kind == "moment" and v.moment.momentId == p16 then
				var67.current[p16] = true
				var75(v.moment, p17)
				local current = var52.current
				
				if current == nil then
					var51.pager.removeItem(i)
					
					return
				end
				current.removeItem(i)
				
				return
			end
		end
	end, { var51, var75 })
	local var77 = reactModule.createElement(feedContext.Provider, {
		value = reactModule.useMemo(function() --[[ line: 584 ]]
			-- upvalues: var51 (ref), var41 (ref), var42 (ref), source (ref), telemetry (ref), var61 (ref), var46 (ref), var72 (ref), fFlagMomentsNonInfiniteScrollEndStateFixesModule (copy), getFFlagMomentsNonInfiniteScrollModule (copy)
			return {
				getStatus = var51.getStatus,
				isActiveFeed = var41,
				isPlaybackActive = var42,
				recommendationSource = source.recommendationSource,
				logAction = function(p18, p19, p20) --[[ line: 590 ]]
					-- upvalues: telemetry (copy)
					return telemetry.logAction(p18, p19, p20)
				end,
				flushView = var61.flushView,
				getChromeVisible = var46.getChromeVisible,
				revealChrome = var46.revealChrome,
				removeCurrentItem = var72,
				loadMoreBeyondLimit = if fFlagMomentsNonInfiniteScrollEndStateFixesModule then if getFFlagMomentsNonInfiniteScrollModule() then var51.loadBeyondLimit else nil else var51.loadBeyondLimit,
				getCanLoadMoreBeyondLimit = if fFlagMomentsNonInfiniteScrollEndStateFixesModule then var51.getCanLoadMoreBeyondLimit else nil
			}
		end, {
			var51, var41, var42, source, telemetry, var61.flushView, var46, var72
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
				store = var51.pager,
				renderItem = renderFeedItem,
				keyExtractor = feedItemKey,
				analytics = var54,
				onEndReached = var51.loadMore,
				active = var41 and (var65 ~= "Failed" and var65 ~= "Empty"),
				controllerRef = var52,
				initialIndex = p7.initialIndex,
				tuning = p7.pager,
				Size = UDim2.fromScale(1, 1)
			}),
			StateOverlay = reactModule.createElement(feedStateViewModule, {
				zIndex = 2,
				status = var65,
				loadMoreFailed = var66,
				onRetry = var51.retry,
				emptyContent = p7.emptyContent
			}),
			NavBar = if var43 and (if var65 ~= "Loaded" then var65 == "LoadingMore" else true) then reactModule.createElement(feedNavigationBarModule, {
				zIndex = 3,
				pager = var51.pager,
				active = var41,
				onScrollToNext = var63,
				onScrollToPrevious = var64
			}) else nil,
			ImmersiveController = if fFlagMomentsImmersiveChromeModule then reactModule.createElement(immersiveChromeControllerModule, {
				pager = var51.pager,
				active = var41 and var42,
				controllerRef = var52
			}) else nil,
			SwipeLatency = if fFlagMomentsMediaSmoothnessTelemetry then reactModule.createElement(swipeLatencyTrackerModule, {
				pager = var51.pager,
				controllerRef = var52,
				onTargetCommittedRef = var53
			}) else nil,
			DeletionDialog = if var50 ~= nil then nil else reactModule.createElement(deletionConfirmationDialogModule, { onCancel = var74, onConfirm = var73 })
		})
	})
	
	return reactModule.createElement(momentMediaCoordinatorProviderModule, {
		pager = var51.pager,
		playbackActive = var42,
		createCoordinator = p7.createCoordinator,
		onMediaItemLoadAttempted = if fFlagMomentsRealtimeObservability then reactModule.useCallback(function(_) --[[ line: 570 ]]
			-- upvalues: analytics (copy), var51 (ref)
			analytics.reportMomentsFeedMediaLoad("attempted", var51.observabilityFeedType)
		end, { var51 }) else nil,
		onMediaItemFailed = if fFlagMomentsRealtimeObservability or getFFlagMomentsFilterUnavailableFeedItemsModule() then reactModule.useCallback(function(p21, p22) --[[ line: 574 ]]
			-- upvalues: fFlagMomentsRealtimeObservability (copy), analytics (copy), var51 (ref), getFFlagMomentsFilterUnavailableFeedItemsModule (copy), var76 (ref)
			if fFlagMomentsRealtimeObservability then
				analytics.reportMomentsFeedMediaLoad("failed", var51.observabilityFeedType, p22)
			end
			if getFFlagMomentsFilterUnavailableFeedItemsModule() then
				var76(p21, p22)
			end
		end, { var51, var76 }) else nil
	}, if var45 then {
		Feed = var77,
		SurfaceReadyTracker = reactModule.createElement(surfaceReadyTrackerModule, { pager = var51.pager })
	} else var77)
end
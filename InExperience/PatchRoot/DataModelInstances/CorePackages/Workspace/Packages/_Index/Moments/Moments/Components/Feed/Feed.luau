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
local var1 = feedTelemetryModule.createNoopTelemetry()
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
	local var2 = if kind ~= nil then nil else kind.getKey(p1)
	
	return if var2 == nil or var2 == "" then tostring(p2) else var2
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

local var2 = nil

local _ = function()
	-- upvalues: var2 (write), parent (ref)
	if var2 == nil then
		var2 = require(parent.Loggers).Logger:new("Moments.Feed")
	end
	return var2
end

return function(p1)
	-- upvalues: var1 (ref), fFlagMomentsSurfaceLoadTTI (ref), getImmersiveChromeStoreModule (ref), fFlagMomentsImmersiveChromeModule (ref), useLocalization (ref), t (ref), useMomentsSession (ref), getToastStoreModule (ref), signalsReactModule (ref), reactModule (ref), getFeedScrollLimitModule (ref), fFlagMomentsNonInfiniteScrollEndStateFixesModule (ref), getFFlagMomentsNonInfiniteScrollModule (ref), getMomentsCapabilitiesModule (ref), createFeedStoreModule (ref), feedItemDedupeKey (ref), fFlagMomentsMediaSmoothnessTelemetry (ref), logMomentViewBeganModule (ref), logFeedEndStateReachedModule (ref), useFeedTelemetryModule (ref), feedItemAttribution (ref), momentsSurfaceLoadManager (ref), fireAnalyticsEvent (ref), eventNames (ref), fFlagMomentsFeedHealthAnalytics (ref), feedItemRegistryModule (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), deleteMomentModule (ref), var2 (write), parent (ref), getFFlagMomentsFixDeleteModule (ref), fFlagMomentsRemoveDeletedFromProfile (ref), getDeletedMomentsStoreModule (ref), makeFeedActionFieldsModule (ref), momentsCommonModule (ref), fFlagMomentsFixDeleteToastCopyModule (ref), analytics (ref), fFlagMomentsRealtimeObservability (ref), getFFlagMomentsFilterUnavailableFeedItemsModule (ref), feedContext (ref), verticalPager (ref), renderFeedItem (ref), feedItemKey (ref), feedStateViewModule (ref), feedNavigationBarModule (ref), immersiveChromeControllerModule (ref), swipeLatencyTrackerModule (ref), deletionConfirmationDialogModule (ref), momentMediaCoordinatorProviderModule (ref), surfaceReadyTrackerModule (ref)
	local source = p1.source
	local var3 = p1.active ~= nil or p1.active
	local var4 = if p1.playbackActive ~= nil then var3 else p1.playbackActive
	local var5 = p1.showNavigationBar ~= nil or p1.showNavigationBar
	local telemetry = p1.telemetry or var1
	local var6 = fFlagMomentsSurfaceLoadTTI and p1.trackSurfaceLoad == true
	local var7 = getImmersiveChromeStoreModule(false)
	local var8 = useLocalization(t)
	local var9 = useMomentsSession()
	local var10 = getToastStoreModule(false)
	local var11 = signalsReactModule.useSignalState(var9.getPendingDeletion)
	local var12 = reactModule.useMemo(function()
		-- upvalues: getFeedScrollLimitModule (copy), fFlagMomentsNonInfiniteScrollEndStateFixesModule (copy), getFFlagMomentsNonInfiniteScrollModule (copy), getMomentsCapabilitiesModule (copy), createFeedStoreModule (copy), source (ref), feedItemDedupeKey (copy), var6 (ref)
		return createFeedStoreModule(source, feedItemDedupeKey, var6, getFeedScrollLimitModule(fFlagMomentsNonInfiniteScrollEndStateFixesModule, getFFlagMomentsNonInfiniteScrollModule(), function()
			-- upvalues: getMomentsCapabilitiesModule (copy)
			return getMomentsCapabilitiesModule(false)
		end))
	end, { source, var6 })
	reactModule.useEffect(function()
		-- upvalues: var12 (ref)
		var12.loadInitial()
		
		return function()
			-- upvalues: var12 (copy)
			var12.dispose()
		end
	end, { var12 })
	local var13 = reactModule.useRef(nil)
	local var14 = reactModule.useRef(nil)
	local var15 = reactModule.useMemo(function()
		-- upvalues: fFlagMomentsMediaSmoothnessTelemetry (copy), var14 (ref)
		return if fFlagMomentsMediaSmoothnessTelemetry then {
			onTargetCommitted = function(p2, p3, p4)
				-- upvalues: var14 (copy)
				local current = var14.current
				
				if current ~= nil then
					current(p2, p3, p4)
				end
			end
		} else nil
	end, {})
	local var16 = reactModule.useRef(0)
	local var17 = reactModule.useRef(false)
	local var18 = reactModule.useRef(0)
	local var19 = reactModule.useCallback(function()
		-- upvalues: var17 (ref), var16 (ref), var18 (ref), var12 (ref)
		if var17.current or DateTime.now().UnixTimestampMillis < var16.current then
			return
		end
		var17.current = true
		var18.current += 1
		local current = var18.current
		var12.refresh()
		task.spawn(function()
			-- upvalues: var17 (copy), current (ref), var18 (copy), var12 (copy), var16 (copy)
			while var17.current and current == var18.current do
				local status = var12.getStatus(false)
				
				if status ~= "Loaded" and status ~= "Empty" then
					if status ~= "Failed" then
						task.wait()
						continue
					end
					var17.current = false
					
					return
				end
				var17.current = false
				var16.current = DateTime.now().UnixTimestampMillis + 1000
				
				return
			end
		end)
	end, { var12 })
	local var20 = reactModule.useCallback(function(p2)
		-- upvalues: var12 (ref), var13 (ref)
		var12.prependItem({ kind = "moment", moment = p2 })
		local current = var13.current
		
		if current ~= nil then
			current.scrollToIndex(1)
		end
	end, { var12 })
	reactModule.useImperativeHandle(p1.controllerRef, function()
		-- upvalues: var20 (ref), var19 (ref)
		return { prependMoment = var20, refresh = var19 }
	end, { var20, var19 })
	local var21 = reactModule.useCallback(function(p2)
		-- upvalues: logMomentViewBeganModule (copy), var9 (ref)
		if p2.kind == "moment" then
			logMomentViewBeganModule(p2.moment, var9.getSessionSource(false))
			
			return
		end
	end, { var9 })
	local var22 = useFeedTelemetryModule(var12.pager, {
		telemetry = telemetry,
		active = var3,
		getAttribution = feedItemAttribution,
		recommendationSource = source.recommendationSource,
		onItemBecameActive = var21,
		onEndStateReached = if getFFlagMomentsNonInfiniteScrollModule() then reactModule.useCallback(function(p2)
			-- upvalues: logFeedEndStateReachedModule (copy), var9 (ref), source (ref)
			logFeedEndStateReachedModule({
				source = var9.getSessionSource(false),
				recommendationSource = source.recommendationSource or "",
				feedSourceId = source.id or "",
				itemPosition = p2
			})
		end, { var9, source }) else nil
	})
	local var23 = reactModule.useRef(var4)
	reactModule.useEffect(function()
		-- upvalues: var23 (ref), var4 (ref), var12 (ref), var21 (ref)
		local current = var23.current
		var23.current = var4
		
		if var4 and not current then
			local currentItem = var12.pager.getCurrentItem(false)
			
			if currentItem ~= nil then
				var21(currentItem)
			end
		end
	end, { var4, var12, var21 })
	local var24 = reactModule.useCallback(function()
		-- upvalues: var13 (ref)
		local current = var13.current
		
		if current ~= nil then
			current.next()
		end
	end, {})
	local var25 = reactModule.useCallback(function()
		-- upvalues: var13 (ref)
		local current = var13.current
		
		if current ~= nil then
			current.previous()
		end
	end, {})
	local var26 = signalsReactModule.useSignalState(var12.getStatus)
	local var27 = signalsReactModule.useSignalState(var12.getLoadMoreFailed)
	local var28 = reactModule.useRef({})
	reactModule.useEffect(function()
		-- upvalues: var18 (ref), var17 (ref), var16 (ref)
		return function()
			-- upvalues: var18 (copy), var17 (copy), var16 (copy)
			var18.current += 1
			var17.current = false
			var16.current = 0
		end
	end, { var12 })
	local var29 = reactModule.useRef(false)
	local var30 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var29 (ref), var6 (ref), momentsSurfaceLoadManager (copy), fireAnalyticsEvent (copy), eventNames (copy)
		if not var29.current then
			var29.current = true
			
			if var6 then
				momentsSurfaceLoadManager.renderStarted()
				momentsSurfaceLoadManager.surfaceMounted()
			end
			fireAnalyticsEvent(eventNames.MomentsFirstUIRenderedTimestamp, {
				value = if var6 and momentsSurfaceLoadManager.isSessionActive() then momentsSurfaceLoadManager.elapsedMs() else DateTime.now().UnixTimestampMillis
			})
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), var30 (ref), var26 (ref), fireAnalyticsEvent (copy), eventNames (copy)
		if var6 then return end
		if not var30.current and (var26 == "Loaded" or var26 == "LoadingMore") then
			var30.current = true
			fireAnalyticsEvent(eventNames.MomentsFirstContentLoadedTimestamp, { value = DateTime.now().UnixTimestampMillis })
		end
	end, { var26 })
	local var31 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: fFlagMomentsFeedHealthAnalytics (copy), var26 (ref), var31 (ref), fireAnalyticsEvent (copy), eventNames (copy), source (ref), var12 (ref)
		if not fFlagMomentsFeedHealthAnalytics then return end
		if var26 ~= var31.current then
			if var26 == "Failed" then
				fireAnalyticsEvent(eventNames.FeedLoadFailed, {
					recommendationSource = source.recommendationSource or "",
					feedSourceId = source.id or "",
					failureReason = var12.getError(false) or ""
				})
			elseif var26 == "Empty" then
				fireAnalyticsEvent(eventNames.FeedNoMomentsFetched, {
					recommendationSource = source.recommendationSource or "",
					feedSourceId = source.id or ""
				})
			end
		end
		var31.current = var26
	end, { var26 })
	local var32 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: fFlagMomentsFeedHealthAnalytics (copy), var27 (ref), var32 (ref), var12 (ref), feedItemRegistryModule (copy), fireAnalyticsEvent (copy), eventNames (copy), source (ref)
		if not fFlagMomentsFeedHealthAnalytics then return end
		if var27 and not var32.current then
			local var33
			local var34 = var12.pager.getItems(false)[var12.pager.getCurrentIndex(false)]
			
			if var34 == nil then
				var33 = nil
			else
				local kind = feedItemRegistryModule[var34.kind]
				var33 = if kind ~= nil then nil else kind.getAttribution(var34)
			end
			fireAnalyticsEvent(eventNames.FeedLoadMoreFailed, {
				recommendationSource = source.recommendationSource or "",
				feedSourceId = source.id or "",
				itemId = if var33 ~= nil then nil else var33.itemId,
				tracingId = if var33 ~= nil then nil else var33.tracingId
			})
		end
		var32.current = var27
	end, { var27 })
	local var33 = reactModule.useCallback(function()
		-- upvalues: var12 (ref), var13 (ref)
		local currentIndex = var12.pager.getCurrentIndex(false)
		local current = var13.current
		
		if current ~= nil then
			current.removeItem(currentIndex)
		end
	end, { var12 })
	local var34 = reactModule.useCallback(function()
		-- upvalues: var11 (ref), fFlagMomentsPassFeedItemIdToBackendApis (copy), var9 (ref), deleteMomentModule (copy), var2 (copy), parent (copy), getFFlagMomentsFixDeleteModule (copy), var33 (ref), fFlagMomentsRemoveDeletedFromProfile (copy), getDeletedMomentsStoreModule (copy), makeFeedActionFieldsModule (copy), momentsCommonModule (copy), fireAnalyticsEvent (copy), eventNames (copy), fFlagMomentsFixDeleteToastCopyModule (copy), var10 (ref), var8 (ref)
		if var11 then
			local momentId = var11.momentId
			local feedItemId = var11.feedItemId
			local feedSessionId = var11.feedSessionId
			
			if fFlagMomentsPassFeedItemIdToBackendApis and (feedItemId == nil or feedItemId == "") then
				var9.clearPendingDeletion()
				
				return
			end
			task.spawn(function()
				-- upvalues: fFlagMomentsPassFeedItemIdToBackendApis (copy), deleteMomentModule (copy), momentId (ref), feedItemId (ref), var2 (copy), parent (copy)
				local var35, var36 = (if fFlagMomentsPassFeedItemIdToBackendApis then deleteMomentModule(momentId, nil, feedItemId) else deleteMomentModule(momentId)):await()
				
				if not var35 then
					if var2 == nil then
						var2 = require(parent.Loggers).Logger:new("Moments.Feed")
					end
					var2:warning("Failed to delete moment {}: {}", momentId, tostring(var36))
				end
			end)
			
			if getFFlagMomentsFixDeleteModule() then
				var33()
				
				if fFlagMomentsRemoveDeletedFromProfile then
					getDeletedMomentsStoreModule(false).markDeleted(momentId)
				end
			end
			local var35 = makeFeedActionFieldsModule(momentId, feedItemId, feedSessionId, if momentsCommonModule.Flags.GetFFlagMomentsAnalyticsSchemaIdentity() then "delete" else nil)
			
			if var35 then
				fireAnalyticsEvent(eventNames.MomentItemDeleted, var35)
			end
			if fFlagMomentsFixDeleteToastCopyModule then
				var10.triggerToast({ text = "", title = var8.deletedToast })
			else
				var10.triggerToast({ title = var8.deletedTitle, text = var8.deletedBody })
			end
		end
		var9.clearPendingDeletion()
	end, {
		var11,
		var9,
		var10,
		var8,
		var33
	})
	local var35 = reactModule.useCallback(function()
		-- upvalues: var9 (ref)
		var9.clearPendingDeletion()
	end, { var9 })
	local var36 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var2 (copy), parent (copy), fireAnalyticsEvent (copy), eventNames (copy), source (ref)
		local recommendationMetadata = p2.recommendationMetadata
		
		if var2 == nil then
			var2 = require(parent.Loggers).Logger:new("Moments.Feed")
		end
		var2:debug("Filtering moment after media load failure | momentId: {}, assetId: {}, captureType: {}, failureReason: {}", p2.momentId, tostring(p2.assetId), p2.metadata.captureType.Name, p3 or "nil")
		local feedMediaLoadFailed = eventNames.FeedMediaLoadFailed
		local t = {
			momentId = p2.momentId,
			assetId = tostring(p2.assetId),
			captureType = p2.metadata.captureType.Name,
			creatorId = tostring(p2.creatorId),
			itemId = if recommendationMetadata ~= nil then nil else recommendationMetadata.feedItemId,
			tracingId = if recommendationMetadata ~= nil then nil else recommendationMetadata.tracingId,
			recommendationSource = source.recommendationSource or "",
			feedSourceId = source.id or ""
		}
		local placeId = p2.metadata.placeId
		t.placeId = if placeId ~= nil then nil else tostring(placeId)
		local universeId = p2.metadata.universeId
		t.universeId = if universeId ~= nil then nil else tostring(universeId)
		t.failureReason = p3
		fireAnalyticsEvent(feedMediaLoadFailed, t)
	end, { source })
	local var37 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var28 (ref), var12 (ref), var36 (ref), var13 (ref)
		if var28.current[p2] then return end
		for i, v in var12.pager.getItems(false) do
			if v.kind == "moment" and v.moment.momentId == p2 then
				var28.current[p2] = true
				var36(v.moment, p3)
				local current = var13.current
				
				if current == nil then
					var12.pager.removeItem(i)
					
					return
				end
				current.removeItem(i)
				
				return
			end
		end
	end, { var12, var36 })
	local var38 = reactModule.createElement(feedContext.Provider, {
		value = reactModule.useMemo(function()
			-- upvalues: var12 (ref), var3 (ref), var4 (ref), source (ref), telemetry (ref), var22 (ref), var7 (ref), var33 (ref), fFlagMomentsNonInfiniteScrollEndStateFixesModule (copy), getFFlagMomentsNonInfiniteScrollModule (copy)
			return {
				getStatus = var12.getStatus,
				isActiveFeed = var3,
				isPlaybackActive = var4,
				recommendationSource = source.recommendationSource,
				logAction = function(p4, p5, p6)
					-- upvalues: telemetry (copy)
					return telemetry.logAction(p4, p5, p6)
				end,
				flushView = var22.flushView,
				getChromeVisible = var7.getChromeVisible,
				revealChrome = var7.revealChrome,
				removeCurrentItem = var33,
				loadMoreBeyondLimit = if fFlagMomentsNonInfiniteScrollEndStateFixesModule then if getFFlagMomentsNonInfiniteScrollModule() then var12.loadBeyondLimit else nil else var12.loadBeyondLimit,
				getCanLoadMoreBeyondLimit = if fFlagMomentsNonInfiniteScrollEndStateFixesModule then var12.getCanLoadMoreBeyondLimit else nil
			}
		end, {
			var12, var3, var4, source, telemetry, var22.flushView, var7, var33
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
				store = var12.pager,
				renderItem = renderFeedItem,
				keyExtractor = feedItemKey,
				analytics = var15,
				onEndReached = var12.loadMore,
				active = var3 and (var26 ~= "Failed" and var26 ~= "Empty"),
				controllerRef = var13,
				initialIndex = p1.initialIndex,
				tuning = p1.pager,
				Size = UDim2.fromScale(1, 1)
			}),
			StateOverlay = reactModule.createElement(feedStateViewModule, {
				zIndex = 2,
				status = var26,
				loadMoreFailed = var27,
				onRetry = var12.retry,
				emptyContent = p1.emptyContent
			}),
			NavBar = if var5 and (if var26 ~= "Loaded" then var26 == "LoadingMore" else true) then reactModule.createElement(feedNavigationBarModule, {
				zIndex = 3,
				pager = var12.pager,
				active = var3,
				onScrollToNext = var24,
				onScrollToPrevious = var25
			}) else nil,
			ImmersiveController = if fFlagMomentsImmersiveChromeModule then reactModule.createElement(immersiveChromeControllerModule, {
				pager = var12.pager,
				active = var3 and var4,
				controllerRef = var13
			}) else nil,
			SwipeLatency = if fFlagMomentsMediaSmoothnessTelemetry then reactModule.createElement(swipeLatencyTrackerModule, {
				pager = var12.pager,
				controllerRef = var13,
				onTargetCommittedRef = var14
			}) else nil,
			DeletionDialog = if var11 ~= nil then nil else reactModule.createElement(deletionConfirmationDialogModule, { onCancel = var35, onConfirm = var34 })
		})
	})
	
	return reactModule.createElement(momentMediaCoordinatorProviderModule, {
		pager = var12.pager,
		playbackActive = var4,
		createCoordinator = p1.createCoordinator,
		onMediaItemLoadAttempted = if fFlagMomentsRealtimeObservability then reactModule.useCallback(function(_)
			-- upvalues: analytics (copy), var12 (ref)
			analytics.reportMomentsFeedMediaLoad("attempted", var12.observabilityFeedType)
		end, { var12 }) else nil,
		onMediaItemFailed = if fFlagMomentsRealtimeObservability or getFFlagMomentsFilterUnavailableFeedItemsModule() then reactModule.useCallback(function(p4, p5)
			-- upvalues: fFlagMomentsRealtimeObservability (copy), analytics (copy), var12 (ref), getFFlagMomentsFilterUnavailableFeedItemsModule (copy), var37 (ref)
			if fFlagMomentsRealtimeObservability then
				analytics.reportMomentsFeedMediaLoad("failed", var12.observabilityFeedType, p5)
			end
			if getFFlagMomentsFilterUnavailableFeedItemsModule() then
				var37(p4, p5)
			end
		end, { var12, var37 }) else nil
	}, if var6 then {
		Feed = var38,
		SurfaceReadyTracker = reactModule.createElement(surfaceReadyTrackerModule, { pager = var12.pager })
	} else var38)
end
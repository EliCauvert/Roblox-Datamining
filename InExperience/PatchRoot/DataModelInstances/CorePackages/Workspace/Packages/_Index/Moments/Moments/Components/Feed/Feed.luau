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
local verticalPager = verticalPagerModule.VerticalPager
local feedContext = feedContextModule.FeedContext
local getFFlagMomentsFilterUnavailableFeedItemsModule = require(moments.Flags.GetFFlagMomentsFilterUnavailableFeedItems)
local var32 = feedTelemetryModule.createNoopTelemetry()
local t = {
	deletedTitle = "Feature.Moments.Label.MomentDeletedTitle",
	deletedBody = "Feature.Moments.Label.MomentDeletedBody"
}

local function renderFeedItem(p0, p1) --[[ line: 98 ]]
	-- upvalues: feedItemRegistryModule (ref)
	local kind = feedItemRegistryModule[p0.kind]
	
	return if kind == nil then nil else kind.render(p0, p1)
end

local function feedItemKey(p2, p3) --[[ line: 103 ]]
	-- upvalues: feedItemRegistryModule (ref)
	local kind = feedItemRegistryModule[p2.kind]
	local var39 = if kind ~= nil then nil else kind.getKey(p2)
	
	return if var39 == nil or var39 == "" then tostring(p3) else var39
end

local function feedItemDedupeKey(p4) --[[ line: 113 ]]
	-- upvalues: feedItemRegistryModule (ref)
	local kind = feedItemRegistryModule[p4.kind]
	
	return if kind == nil then nil else kind.getKey(p4)
end

local function feedItemAttribution(p5) --[[ line: 118 ]]
	-- upvalues: feedItemRegistryModule (ref)
	local kind = feedItemRegistryModule[p5.kind]
	
	return if kind == nil then nil else kind.getAttribution(p5)
end

local function _(p6) --[[ line: 123 | named "stringOrNil" ]]
	return if p6 == nil then nil else tostring(p6)
end

local var38 = nil

local _ = function() --[[ line: 128 | named "getLogger" ]]
	-- upvalues: var38 (write), parent (ref)
	if var38 == nil then
		var38 = require(parent.Loggers).Logger:new("Moments.Feed")
	end
	return var38
end

return function(p7) --[[ line: 183 | named "Feed" ]]
	-- upvalues: var32 (ref), fFlagMomentsSurfaceLoadTTI (ref), getImmersiveChromeStoreModule (ref), fFlagMomentsImmersiveChromeModule (ref), useLocalization (ref), t (ref), useMomentsSession (ref), getToastStoreModule (ref), signalsReactModule (ref), reactModule (ref), getFeedScrollLimitModule (ref), fFlagMomentsNonInfiniteScrollEndStateFixesModule (ref), getFFlagMomentsNonInfiniteScrollModule (ref), getMomentsCapabilitiesModule (ref), createFeedStoreModule (ref), feedItemDedupeKey (ref), logMomentViewBeganModule (ref), logFeedEndStateReachedModule (ref), useFeedTelemetryModule (ref), feedItemAttribution (ref), momentsSurfaceLoadManager (ref), fireAnalyticsEvent (ref), eventNames (ref), fFlagMomentsFeedHealthAnalytics (ref), feedItemRegistryModule (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), deleteMomentModule (ref), var38 (write), parent (ref), getFFlagMomentsFixDeleteModule (ref), fFlagMomentsRemoveDeletedFromProfile (ref), getDeletedMomentsStoreModule (ref), makeFeedActionFieldsModule (ref), momentsCommonModule (ref), analytics (ref), fFlagMomentsRealtimeObservability (ref), getFFlagMomentsFilterUnavailableFeedItemsModule (ref), feedContext (ref), verticalPager (ref), renderFeedItem (ref), feedItemKey (ref), feedStateViewModule (ref), feedNavigationBarModule (ref), immersiveChromeControllerModule (ref), deletionConfirmationDialogModule (ref), momentMediaCoordinatorProviderModule (ref), surfaceReadyTrackerModule (ref)
	local source = p7.source
	local var40 = p7.active ~= nil or p7.active
	local var41 = if p7.playbackActive ~= nil then var40 else p7.playbackActive
	local var42 = p7.showNavigationBar ~= nil or p7.showNavigationBar
	local telemetry = p7.telemetry or var32
	local var44 = fFlagMomentsSurfaceLoadTTI and p7.trackSurfaceLoad == true
	local var45 = getImmersiveChromeStoreModule(false)
	local var46 = useLocalization(t)
	local var47 = useMomentsSession()
	local var48 = getToastStoreModule(false)
	local var49 = signalsReactModule.useSignalState(var47.getPendingDeletion)
	local var50 = reactModule.useMemo(function() --[[ line: 209 ]]
		-- upvalues: getFeedScrollLimitModule (copy), fFlagMomentsNonInfiniteScrollEndStateFixesModule (copy), getFFlagMomentsNonInfiniteScrollModule (copy), getMomentsCapabilitiesModule (copy), createFeedStoreModule (copy), source (ref), feedItemDedupeKey (copy), var44 (ref)
		return createFeedStoreModule(source, feedItemDedupeKey, var44, getFeedScrollLimitModule(fFlagMomentsNonInfiniteScrollEndStateFixesModule, getFFlagMomentsNonInfiniteScrollModule(), function() --[[ line: 213 ]]
			-- upvalues: getMomentsCapabilitiesModule (copy)
			return getMomentsCapabilitiesModule(false)
		end))
	end, { source, var44 })
	reactModule.useEffect(function() --[[ line: 221 ]]
		-- upvalues: var50 (ref)
		var50.loadInitial()
		
		return function() --[[ line: 223 ]]
			-- upvalues: var50 (copy)
			var50.dispose()
		end
	end, { var50 })
	local var51 = reactModule.useRef(nil)
	local var52 = reactModule.useRef(0)
	local var53 = reactModule.useRef(false)
	local var54 = reactModule.useRef(0)
	local var55 = reactModule.useCallback(function() --[[ line: 234 ]]
		-- upvalues: var53 (ref), var52 (ref), var54 (ref), var50 (ref)
		if var53.current or DateTime.now().UnixTimestampMillis < var52.current then
			return
		end
		var53.current = true
		var54.current += 1
		local current = var54.current
		var50.refresh()
		task.spawn(function() --[[ line: 243 ]]
			-- upvalues: var53 (copy), current (ref), var54 (copy), var50 (copy), var52 (copy)
			while var53.current and current == var54.current do
				local status = var50.getStatus(false)
				
				if status ~= "Loaded" and status ~= "Empty" then
					if status ~= "Failed" then
						task.wait()
						continue
					end
					var53.current = false
					
					return
				end
				var53.current = false
				var52.current = DateTime.now().UnixTimestampMillis + 1000
				
				return
			end
		end)
	end, { var50 })
	local var56 = reactModule.useCallback(function(p8) --[[ line: 260 ]]
		-- upvalues: var50 (ref), var51 (ref)
		var50.prependItem({ kind = "moment", moment = p8 })
		local current = var51.current
		
		if current ~= nil then
			current.scrollToIndex(1)
		end
	end, { var50 })
	reactModule.useImperativeHandle(p7.controllerRef, function() --[[ line: 268 ]]
		-- upvalues: var56 (ref), var55 (ref)
		return { prependMoment = var56, refresh = var55 }
	end, { var56, var55 })
	local var57 = reactModule.useCallback(function(p9) --[[ line: 275 ]]
		-- upvalues: logMomentViewBeganModule (copy), var47 (ref)
		if p9.kind == "moment" then
			logMomentViewBeganModule(p9.moment, var47.getSessionSource(false))
			
			return
		end
	end, { var47 })
	local var58 = useFeedTelemetryModule(var50.pager, {
		telemetry = telemetry,
		active = var40,
		getAttribution = feedItemAttribution,
		recommendationSource = source.recommendationSource,
		onItemBecameActive = var57,
		onEndStateReached = if getFFlagMomentsNonInfiniteScrollModule() then reactModule.useCallback(function(p10) --[[ line: 283 ]]
			-- upvalues: logFeedEndStateReachedModule (copy), var47 (ref), source (ref)
			logFeedEndStateReachedModule({
				source = var47.getSessionSource(false),
				recommendationSource = source.recommendationSource or "",
				feedSourceId = source.id or "",
				itemPosition = p10
			})
		end, { var47, source }) else nil
	})
	local var59 = reactModule.useRef(var41)
	reactModule.useEffect(function() --[[ line: 306 ]]
		-- upvalues: var59 (ref), var41 (ref), var50 (ref), var57 (ref)
		local current = var59.current
		var59.current = var41
		
		if var41 and not current then
			local currentItem = var50.pager.getCurrentItem(false)
			
			if currentItem ~= nil then
				var57(currentItem)
			end
		end
	end, { var41, var50, var57 })
	local var60 = reactModule.useCallback(function() --[[ line: 317 ]]
		-- upvalues: var51 (ref)
		local current = var51.current
		
		if current ~= nil then
			current.next()
		end
	end, {})
	local var61 = reactModule.useCallback(function() --[[ line: 323 ]]
		-- upvalues: var51 (ref)
		local current = var51.current
		
		if current ~= nil then
			current.previous()
		end
	end, {})
	local var62 = signalsReactModule.useSignalState(var50.getStatus)
	local var63 = signalsReactModule.useSignalState(var50.getLoadMoreFailed)
	local var64 = reactModule.useRef({})
	reactModule.useEffect(function() --[[ line: 337 ]]
		-- upvalues: var54 (ref), var53 (ref), var52 (ref)
		return function() --[[ line: 338 ]]
			-- upvalues: var54 (copy), var53 (copy), var52 (copy)
			var54.current += 1
			var53.current = false
			var52.current = 0
		end
	end, { var50 })
	local var65 = reactModule.useRef(false)
	local var66 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 350 ]]
		-- upvalues: var65 (ref), var44 (ref), momentsSurfaceLoadManager (copy), fireAnalyticsEvent (copy), eventNames (copy)
		if not var65.current then
			var65.current = true
			
			if var44 then
				momentsSurfaceLoadManager.renderStarted()
				momentsSurfaceLoadManager.surfaceMounted()
			end
			fireAnalyticsEvent(eventNames.MomentsFirstUIRenderedTimestamp, {
				value = if var44 and momentsSurfaceLoadManager.isSessionActive() then momentsSurfaceLoadManager.elapsedMs() else DateTime.now().UnixTimestampMillis
			})
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 369 ]]
		-- upvalues: var44 (ref), var66 (ref), var62 (ref), fireAnalyticsEvent (copy), eventNames (copy)
		if var44 then return end
		if not var66.current and (var62 == "Loaded" or var62 == "LoadingMore") then
			var66.current = true
			fireAnalyticsEvent(eventNames.MomentsFirstContentLoadedTimestamp, { value = DateTime.now().UnixTimestampMillis })
		end
	end, { var62 })
	local var67 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 385 ]]
		-- upvalues: fFlagMomentsFeedHealthAnalytics (copy), var62 (ref), var67 (ref), fireAnalyticsEvent (copy), eventNames (copy), source (ref), var50 (ref)
		if not fFlagMomentsFeedHealthAnalytics then return end
		if var62 ~= var67.current then
			if var62 == "Failed" then
				fireAnalyticsEvent(eventNames.FeedLoadFailed, {
					recommendationSource = source.recommendationSource or "",
					feedSourceId = source.id or "",
					failureReason = var50.getError(false) or ""
				})
			elseif var62 == "Empty" then
				fireAnalyticsEvent(eventNames.FeedNoMomentsFetched, {
					recommendationSource = source.recommendationSource or "",
					feedSourceId = source.id or ""
				})
			end
		end
		var67.current = var62
	end, { var62 })
	local var68 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 412 ]]
		-- upvalues: fFlagMomentsFeedHealthAnalytics (copy), var63 (ref), var68 (ref), var50 (ref), feedItemRegistryModule (copy), fireAnalyticsEvent (copy), eventNames (copy), source (ref)
		if not fFlagMomentsFeedHealthAnalytics then return end
		if var63 and not var68.current then
			local var78
			local var77 = var50.pager.getItems(false)[var50.pager.getCurrentIndex(false)]
			
			if var77 == nil then
				var78 = nil
			else
				local kind = feedItemRegistryModule[var77.kind]
				var78 = if kind ~= nil then nil else kind.getAttribution(var77)
			end
			fireAnalyticsEvent(eventNames.FeedLoadMoreFailed, {
				recommendationSource = source.recommendationSource or "",
				feedSourceId = source.id or "",
				itemId = if var78 ~= nil then nil else var78.itemId,
				tracingId = if var78 ~= nil then nil else var78.tracingId
			})
		end
		var68.current = var63
	end, { var63 })
	local var69 = reactModule.useCallback(function() --[[ line: 430 ]]
		-- upvalues: var50 (ref), var51 (ref)
		local currentIndex = var50.pager.getCurrentIndex(false)
		local current = var51.current
		
		if current ~= nil then
			current.removeItem(currentIndex)
		end
	end, { var50 })
	local var70 = reactModule.useCallback(function() --[[ line: 442 ]]
		-- upvalues: var49 (ref), fFlagMomentsPassFeedItemIdToBackendApis (copy), var47 (ref), deleteMomentModule (copy), var38 (copy), parent (copy), getFFlagMomentsFixDeleteModule (copy), var69 (ref), fFlagMomentsRemoveDeletedFromProfile (copy), getDeletedMomentsStoreModule (copy), makeFeedActionFieldsModule (copy), momentsCommonModule (copy), fireAnalyticsEvent (copy), eventNames (copy), var48 (ref), var46 (ref)
		if var49 then
			local momentId = var49.momentId
			local feedItemId = var49.feedItemId
			local feedSessionId = var49.feedSessionId
			
			if fFlagMomentsPassFeedItemIdToBackendApis and (feedItemId == nil or feedItemId == "") then
				var47.clearPendingDeletion()
				
				return
			end
			task.spawn(function() --[[ line: 457 ]]
				-- upvalues: fFlagMomentsPassFeedItemIdToBackendApis (copy), deleteMomentModule (copy), momentId (ref), feedItemId (ref), var38 (copy), parent (copy)
				local var81, var82 = (if fFlagMomentsPassFeedItemIdToBackendApis then deleteMomentModule(momentId, nil, feedItemId) else deleteMomentModule(momentId)):await()
				
				if not var81 then
					if var38 == nil then
						var38 = require(parent.Loggers).Logger:new("Moments.Feed")
					end
					var38:warning("Failed to delete moment {}: {}", momentId, tostring(var82))
				end
			end)
			
			if getFFlagMomentsFixDeleteModule() then
				var69()
				
				if fFlagMomentsRemoveDeletedFromProfile then
					getDeletedMomentsStoreModule(false).markDeleted(momentId)
				end
			end
			local var80 = makeFeedActionFieldsModule(momentId, feedItemId, feedSessionId, if momentsCommonModule.Flags.GetFFlagMomentsAnalyticsSchemaIdentity() then "delete" else nil)
			
			if var80 then
				fireAnalyticsEvent(eventNames.MomentItemDeleted, var80)
			end
			var48.triggerToast({ title = var46.deletedTitle, text = var46.deletedBody })
		end
		var47.clearPendingDeletion()
	end, {
		var49,
		var47,
		var48,
		var46,
		var69
	})
	local var71 = reactModule.useCallback(function() --[[ line: 503 ]]
		-- upvalues: var47 (ref)
		var47.clearPendingDeletion()
	end, { var47 })
	local var72 = reactModule.useCallback(function(p11, p12) --[[ line: 507 ]]
		-- upvalues: var38 (copy), parent (copy), fireAnalyticsEvent (copy), eventNames (copy), source (ref)
		local recommendationMetadata = p11.recommendationMetadata
		
		if var38 == nil then
			var38 = require(parent.Loggers).Logger:new("Moments.Feed")
		end
		var38:debug("Filtering moment after media load failure | momentId: {}, assetId: {}, captureType: {}, failureReason: {}", p11.momentId, tostring(p11.assetId), p11.metadata.captureType.Name, p12 or "nil")
		local feedMediaLoadFailed = eventNames.FeedMediaLoadFailed
		local t = {
			momentId = p11.momentId,
			assetId = tostring(p11.assetId),
			captureType = p11.metadata.captureType.Name,
			creatorId = tostring(p11.creatorId),
			itemId = if recommendationMetadata ~= nil then nil else recommendationMetadata.feedItemId,
			tracingId = if recommendationMetadata ~= nil then nil else recommendationMetadata.tracingId,
			recommendationSource = source.recommendationSource or "",
			feedSourceId = source.id or ""
		}
		local placeId = p11.metadata.placeId
		t.placeId = if placeId ~= nil then nil else tostring(placeId)
		local universeId = p11.metadata.universeId
		t.universeId = if universeId ~= nil then nil else tostring(universeId)
		t.failureReason = p12
		fireAnalyticsEvent(feedMediaLoadFailed, t)
	end, { source })
	local var73 = reactModule.useCallback(function(p13, p14) --[[ line: 531 ]]
		-- upvalues: var64 (ref), var50 (ref), var72 (ref), var51 (ref)
		if var64.current[p13] then return end
		for i, v in var50.pager.getItems(false) do
			if v.kind == "moment" and v.moment.momentId == p13 then
				var64.current[p13] = true
				var72(v.moment, p14)
				local current = var51.current
				
				if current == nil then
					var50.pager.removeItem(i)
					
					return
				end
				current.removeItem(i)
				
				return
			end
		end
	end, { var50, var72 })
	local var74 = reactModule.createElement(feedContext.Provider, {
		value = reactModule.useMemo(function() --[[ line: 566 ]]
			-- upvalues: var50 (ref), var40 (ref), var41 (ref), source (ref), telemetry (ref), var58 (ref), var45 (ref), var69 (ref), fFlagMomentsNonInfiniteScrollEndStateFixesModule (copy), getFFlagMomentsNonInfiniteScrollModule (copy)
			return {
				getStatus = var50.getStatus,
				isActiveFeed = var40,
				isPlaybackActive = var41,
				recommendationSource = source.recommendationSource,
				logAction = function(p15, p16, p17) --[[ line: 572 ]]
					-- upvalues: telemetry (copy)
					return telemetry.logAction(p15, p16, p17)
				end,
				flushView = var58.flushView,
				getChromeVisible = var45.getChromeVisible,
				revealChrome = var45.revealChrome,
				removeCurrentItem = var69,
				loadMoreBeyondLimit = if fFlagMomentsNonInfiniteScrollEndStateFixesModule then if getFFlagMomentsNonInfiniteScrollModule() then var50.loadBeyondLimit else nil else var50.loadBeyondLimit,
				getCanLoadMoreBeyondLimit = if fFlagMomentsNonInfiniteScrollEndStateFixesModule then var50.getCanLoadMoreBeyondLimit else nil
			}
		end, {
			var50, var40, var41, source, telemetry, var58.flushView, var45, var69
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
				store = var50.pager,
				renderItem = renderFeedItem,
				keyExtractor = feedItemKey,
				onEndReached = var50.loadMore,
				active = var40 and (var62 ~= "Failed" and var62 ~= "Empty"),
				controllerRef = var51,
				initialIndex = p7.initialIndex,
				tuning = p7.pager,
				Size = UDim2.fromScale(1, 1)
			}),
			StateOverlay = reactModule.createElement(feedStateViewModule, {
				zIndex = 2,
				status = var62,
				loadMoreFailed = var63,
				onRetry = var50.retry,
				emptyContent = p7.emptyContent
			}),
			NavBar = if var42 and (if var62 ~= "Loaded" then var62 == "LoadingMore" else true) then reactModule.createElement(feedNavigationBarModule, {
				zIndex = 3,
				pager = var50.pager,
				active = var40,
				onScrollToNext = var60,
				onScrollToPrevious = var61
			}) else nil,
			ImmersiveController = if fFlagMomentsImmersiveChromeModule then reactModule.createElement(immersiveChromeControllerModule, {
				pager = var50.pager,
				active = var40 and var41,
				controllerRef = var51
			}) else nil,
			DeletionDialog = if var49 ~= nil then nil else reactModule.createElement(deletionConfirmationDialogModule, { onCancel = var71, onConfirm = var70 })
		})
	})
	
	return reactModule.createElement(momentMediaCoordinatorProviderModule, {
		pager = var50.pager,
		playbackActive = var41,
		createCoordinator = p7.createCoordinator,
		onMediaItemLoadAttempted = if fFlagMomentsRealtimeObservability then reactModule.useCallback(function(_) --[[ line: 552 ]]
			-- upvalues: analytics (copy), var50 (ref)
			analytics.reportMomentsFeedMediaLoad("attempted", var50.observabilityFeedType)
		end, { var50 }) else nil,
		onMediaItemFailed = if fFlagMomentsRealtimeObservability or getFFlagMomentsFilterUnavailableFeedItemsModule() then reactModule.useCallback(function(p18, p19) --[[ line: 556 ]]
			-- upvalues: fFlagMomentsRealtimeObservability (copy), analytics (copy), var50 (ref), getFFlagMomentsFilterUnavailableFeedItemsModule (copy), var73 (ref)
			if fFlagMomentsRealtimeObservability then
				analytics.reportMomentsFeedMediaLoad("failed", var50.observabilityFeedType, p19)
			end
			if getFFlagMomentsFilterUnavailableFeedItemsModule() then
				var73(p18, p19)
			end
		end, { var50, var73 }) else nil
	}, if var44 then {
		Feed = var74,
		SurfaceReadyTracker = reactModule.createElement(surfaceReadyTrackerModule, { pager = var50.pager })
	} else var74)
end
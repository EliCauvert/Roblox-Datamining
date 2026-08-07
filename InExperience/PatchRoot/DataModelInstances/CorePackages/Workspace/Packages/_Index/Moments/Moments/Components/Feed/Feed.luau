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
local fFlagMomentsPassFeedItemIdToBackendApis = sharedFlagsModule.FFlagMomentsPassFeedItemIdToBackendApis
local verticalPagerModule = require(moments.Components.VerticalPager)
local _ = require(script.Parent.FeedTypes)
local feedContextModule = require(script.Parent.FeedContext)
local feedStateViewModule = require(script.Parent.FeedStateView)
local createFeedStoreModule = require(script.Parent.createFeedStore)
local feedItemRegistryModule = require(script.Parent.feedItemRegistry)
local feedTelemetryModule = require(script.Parent.feedTelemetry)
local useFeedTelemetryModule = require(script.Parent.useFeedTelemetry)
local feedNavigationBarModule = require(script.Parent.FeedNavigationBar)
local immersiveChromeControllerModule = require(script.Parent.ImmersiveChromeController)
local deletionConfirmationDialogModule = require(script.Parent.DeletionConfirmationDialog)
local getImmersiveChromeStoreModule = require(moments.Stores.GetImmersiveChromeStore)
local fFlagMomentsImmersiveChromeModule = require(moments.Flags.FFlagMomentsImmersiveChrome)
local useMomentsSession = require(moments.Stores.GetMomentsStore.MomentsSessionContext).useMomentsSession
local getFFlagMomentsFixDeleteModule = require(moments.Flags.GetFFlagMomentsFixDelete)
local getToastStoreModule = require(moments.Stores.GetToastStore)
local getDeletedMomentsStoreModule = require(moments.Stores.GetDeletedMomentsStore)
local deleteMomentModule = require(moments.Moderation.deleteMoment)
local makeMomentViewBeganFieldsModule = require(moments.Analytics.makeMomentViewBeganFields)
local makeFeedActionFieldsModule = require(moments.Analytics.makeFeedActionFields)
local momentMediaCoordinatorProviderModule = require(script.Parent.Media.MomentMediaCoordinatorProvider)
local surfaceReadyTrackerModule = require(script.Parent.SurfaceReadyTracker)
local verticalPager = verticalPagerModule.VerticalPager
local feedContext = feedContextModule.FeedContext
local getFFlagMomentsFilterUnavailableFeedItemsModule = require(moments.Flags.GetFFlagMomentsFilterUnavailableFeedItems)
local var27 = feedTelemetryModule.createNoopTelemetry()
local t = {
	deletedTitle = "Feature.Moments.Label.MomentDeletedTitle",
	deletedBody = "Feature.Moments.Label.MomentDeletedBody"
}

local function renderFeedItem(p0, p1) --[[ line: 92 ]]
	-- upvalues: feedItemRegistryModule (ref)
	local kind = feedItemRegistryModule[p0.kind]
	
	return if kind == nil then nil else kind.render(p0, p1)
end

local function feedItemKey(p2, p3) --[[ line: 97 ]]
	-- upvalues: feedItemRegistryModule (ref)
	local kind = feedItemRegistryModule[p2.kind]
	local var34 = if kind ~= nil then nil else kind.getKey(p2)
	
	return if var34 == nil or var34 == "" then tostring(p3) else var34
end

local function feedItemDedupeKey(p4) --[[ line: 107 ]]
	-- upvalues: feedItemRegistryModule (ref)
	local kind = feedItemRegistryModule[p4.kind]
	
	return if kind == nil then nil else kind.getKey(p4)
end

local function feedItemAttribution(p5) --[[ line: 112 ]]
	-- upvalues: feedItemRegistryModule (ref)
	local kind = feedItemRegistryModule[p5.kind]
	
	return if kind == nil then nil else kind.getAttribution(p5)
end

local function _(p6) --[[ line: 117 | named "stringOrNil" ]]
	return if p6 == nil then nil else tostring(p6)
end

local var33 = nil

local _ = function() --[[ line: 122 | named "getLogger" ]]
	-- upvalues: var33 (write), parent (ref)
	if var33 == nil then
		var33 = require(parent.Loggers).Logger:new("Moments.Feed")
	end
	return var33
end

return function(p7) --[[ line: 177 | named "Feed" ]]
	-- upvalues: var27 (ref), fFlagMomentsSurfaceLoadTTI (ref), getImmersiveChromeStoreModule (ref), fFlagMomentsImmersiveChromeModule (ref), useLocalization (ref), t (ref), useMomentsSession (ref), getToastStoreModule (ref), signalsReactModule (ref), reactModule (ref), createFeedStoreModule (ref), feedItemDedupeKey (ref), makeMomentViewBeganFieldsModule (ref), fireAnalyticsEvent (ref), eventNames (ref), useFeedTelemetryModule (ref), feedItemAttribution (ref), momentsSurfaceLoadManager (ref), fFlagMomentsFeedHealthAnalytics (ref), feedItemRegistryModule (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), deleteMomentModule (ref), var33 (write), parent (ref), getFFlagMomentsFixDeleteModule (ref), fFlagMomentsRemoveDeletedFromProfile (ref), getDeletedMomentsStoreModule (ref), makeFeedActionFieldsModule (ref), momentsCommonModule (ref), getFFlagMomentsFilterUnavailableFeedItemsModule (ref), feedContext (ref), verticalPager (ref), renderFeedItem (ref), feedItemKey (ref), feedStateViewModule (ref), feedNavigationBarModule (ref), immersiveChromeControllerModule (ref), deletionConfirmationDialogModule (ref), momentMediaCoordinatorProviderModule (ref), surfaceReadyTrackerModule (ref)
	local source = p7.source
	local var35 = p7.active ~= nil or p7.active
	local var36 = if p7.playbackActive ~= nil then var35 else p7.playbackActive
	local var37 = p7.showNavigationBar ~= nil or p7.showNavigationBar
	local telemetry = p7.telemetry or var27
	local var39 = fFlagMomentsSurfaceLoadTTI and p7.trackSurfaceLoad == true
	local var40 = getImmersiveChromeStoreModule(false)
	local var41 = useLocalization(t)
	local var42 = useMomentsSession()
	local var43 = getToastStoreModule(false)
	local var44 = signalsReactModule.useSignalState(var42.getPendingDeletion)
	local var45 = reactModule.useMemo(function() --[[ line: 203 ]]
		-- upvalues: createFeedStoreModule (copy), source (ref), feedItemDedupeKey (copy), var39 (ref)
		return createFeedStoreModule(source, feedItemDedupeKey, var39)
	end, { source })
	reactModule.useEffect(function() --[[ line: 208 ]]
		-- upvalues: var45 (ref)
		var45.loadInitial()
		
		return function() --[[ line: 210 ]]
			-- upvalues: var45 (copy)
			var45.dispose()
		end
	end, { var45 })
	local var46 = reactModule.useRef(nil)
	local var47 = reactModule.useRef(0)
	local var48 = reactModule.useRef(false)
	local var49 = reactModule.useRef(0)
	local var50 = reactModule.useCallback(function() --[[ line: 221 ]]
		-- upvalues: var48 (ref), var47 (ref), var49 (ref), var45 (ref)
		if var48.current or DateTime.now().UnixTimestampMillis < var47.current then
			return
		end
		var48.current = true
		var49.current += 1
		local current = var49.current
		var45.refresh()
		task.spawn(function() --[[ line: 230 ]]
			-- upvalues: var48 (copy), current (ref), var49 (copy), var45 (copy), var47 (copy)
			while var48.current and current == var49.current do
				local status = var45.getStatus(false)
				
				if status ~= "Loaded" and status ~= "Empty" then
					if status ~= "Failed" then
						task.wait()
						continue
					end
					var48.current = false
					
					return
				end
				var48.current = false
				var47.current = DateTime.now().UnixTimestampMillis + 1000
				
				return
			end
		end)
	end, { var45 })
	local var51 = reactModule.useCallback(function(p8) --[[ line: 247 ]]
		-- upvalues: var45 (ref), var46 (ref)
		var45.prependItem({ kind = "moment", moment = p8 })
		local current = var46.current
		
		if current ~= nil then
			current.scrollToIndex(1)
		end
	end, { var45 })
	reactModule.useImperativeHandle(p7.controllerRef, function() --[[ line: 255 ]]
		-- upvalues: var51 (ref), var50 (ref)
		return { prependMoment = var51, refresh = var50 }
	end, { var51, var50 })
	local var52 = reactModule.useCallback(function(p9) --[[ line: 262 ]]
		-- upvalues: makeMomentViewBeganFieldsModule (copy), var42 (ref), fireAnalyticsEvent (copy), eventNames (copy)
		if p9.kind ~= "moment" then return end
		local var71 = makeMomentViewBeganFieldsModule(p9.moment, var42.getSessionSource(false))
		
		if var71 then
			fireAnalyticsEvent(eventNames.MomentViewBegan, var71)
		end
	end, { var42 })
	local var53 = useFeedTelemetryModule(var45.pager, {
		telemetry = telemetry,
		active = var35,
		getAttribution = feedItemAttribution,
		recommendationSource = source.recommendationSource,
		onItemBecameActive = var52
	})
	local var54 = reactModule.useRef(var36)
	reactModule.useEffect(function() --[[ line: 292 ]]
		-- upvalues: var54 (ref), var36 (ref), var45 (ref), var52 (ref)
		local current = var54.current
		var54.current = var36
		
		if var36 and not current then
			local currentItem = var45.pager.getCurrentItem(false)
			
			if currentItem ~= nil then
				var52(currentItem)
			end
		end
	end, { var36, var45, var52 })
	local var55 = reactModule.useCallback(function() --[[ line: 303 ]]
		-- upvalues: var46 (ref)
		local current = var46.current
		
		if current ~= nil then
			current.next()
		end
	end, {})
	local var56 = reactModule.useCallback(function() --[[ line: 309 ]]
		-- upvalues: var46 (ref)
		local current = var46.current
		
		if current ~= nil then
			current.previous()
		end
	end, {})
	local var57 = signalsReactModule.useSignalState(var45.getStatus)
	local var58 = signalsReactModule.useSignalState(var45.getLoadMoreFailed)
	local var59 = reactModule.useRef({})
	reactModule.useEffect(function() --[[ line: 323 ]]
		-- upvalues: var49 (ref), var48 (ref), var47 (ref)
		return function() --[[ line: 324 ]]
			-- upvalues: var49 (copy), var48 (copy), var47 (copy)
			var49.current += 1
			var48.current = false
			var47.current = 0
		end
	end, { var45 })
	local var60 = reactModule.useRef(false)
	local var61 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 335 ]]
		-- upvalues: var60 (ref), var39 (ref), momentsSurfaceLoadManager (copy), fireAnalyticsEvent (copy), eventNames (copy)
		if not var60.current then
			var60.current = true
			
			if var39 then
				momentsSurfaceLoadManager.renderStarted()
				momentsSurfaceLoadManager.surfaceMounted()
			end
			fireAnalyticsEvent(eventNames.MomentsFirstUIRenderedTimestamp, {
				value = if var39 and momentsSurfaceLoadManager.isSessionActive() then momentsSurfaceLoadManager.elapsedMs() else DateTime.now().UnixTimestampMillis
			})
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 353 ]]
		-- upvalues: var39 (ref), var61 (ref), var57 (ref), fireAnalyticsEvent (copy), eventNames (copy)
		if var39 then return end
		if not var61.current and (var57 == "Loaded" or var57 == "LoadingMore") then
			var61.current = true
			fireAnalyticsEvent(eventNames.MomentsFirstContentLoadedTimestamp, { value = DateTime.now().UnixTimestampMillis })
		end
	end, { var57 })
	local var62 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 369 ]]
		-- upvalues: fFlagMomentsFeedHealthAnalytics (copy), var57 (ref), var62 (ref), fireAnalyticsEvent (copy), eventNames (copy), source (ref), var45 (ref)
		if not fFlagMomentsFeedHealthAnalytics then return end
		if var57 ~= var62.current then
			if var57 == "Failed" then
				fireAnalyticsEvent(eventNames.FeedLoadFailed, {
					recommendationSource = source.recommendationSource or "",
					feedSourceId = source.id or "",
					failureReason = var45.getError(false) or ""
				})
			elseif var57 == "Empty" then
				fireAnalyticsEvent(eventNames.FeedNoMomentsFetched, {
					recommendationSource = source.recommendationSource or "",
					feedSourceId = source.id or ""
				})
			end
		end
		var62.current = var57
	end, { var57 })
	local var63 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 396 ]]
		-- upvalues: fFlagMomentsFeedHealthAnalytics (copy), var58 (ref), var63 (ref), var45 (ref), feedItemRegistryModule (copy), fireAnalyticsEvent (copy), eventNames (copy), source (ref)
		if not fFlagMomentsFeedHealthAnalytics then return end
		if var58 and not var63.current then
			local var74
			local var73 = var45.pager.getItems(false)[var45.pager.getCurrentIndex(false)]
			
			if var73 == nil then
				var74 = nil
			else
				local kind = feedItemRegistryModule[var73.kind]
				var74 = if kind ~= nil then nil else kind.getAttribution(var73)
			end
			fireAnalyticsEvent(eventNames.FeedLoadMoreFailed, {
				recommendationSource = source.recommendationSource or "",
				feedSourceId = source.id or "",
				itemId = if var74 ~= nil then nil else var74.itemId,
				tracingId = if var74 ~= nil then nil else var74.tracingId
			})
		end
		var63.current = var58
	end, { var58 })
	local var64 = reactModule.useCallback(function() --[[ line: 414 ]]
		-- upvalues: var45 (ref), var46 (ref)
		local currentIndex = var45.pager.getCurrentIndex(false)
		local current = var46.current
		
		if current ~= nil then
			current.removeItem(currentIndex)
		end
	end, { var45 })
	local var65 = reactModule.useCallback(function() --[[ line: 426 ]]
		-- upvalues: var44 (ref), fFlagMomentsPassFeedItemIdToBackendApis (copy), var42 (ref), deleteMomentModule (copy), var33 (copy), parent (copy), getFFlagMomentsFixDeleteModule (copy), var64 (ref), fFlagMomentsRemoveDeletedFromProfile (copy), getDeletedMomentsStoreModule (copy), makeFeedActionFieldsModule (copy), momentsCommonModule (copy), fireAnalyticsEvent (copy), eventNames (copy), var43 (ref), var41 (ref)
		if var44 then
			local momentId = var44.momentId
			local feedItemId = var44.feedItemId
			local feedSessionId = var44.feedSessionId
			
			if fFlagMomentsPassFeedItemIdToBackendApis and (feedItemId == nil or feedItemId == "") then
				var42.clearPendingDeletion()
				
				return
			end
			task.spawn(function() --[[ line: 441 ]]
				-- upvalues: fFlagMomentsPassFeedItemIdToBackendApis (copy), deleteMomentModule (copy), momentId (ref), feedItemId (ref), var33 (copy), parent (copy)
				local var77, var78 = (if fFlagMomentsPassFeedItemIdToBackendApis then deleteMomentModule(momentId, nil, feedItemId) else deleteMomentModule(momentId)):await()
				
				if not var77 then
					if var33 == nil then
						var33 = require(parent.Loggers).Logger:new("Moments.Feed")
					end
					var33:warning("Failed to delete moment {}: {}", momentId, tostring(var78))
				end
			end)
			
			if getFFlagMomentsFixDeleteModule() then
				var64()
				
				if fFlagMomentsRemoveDeletedFromProfile then
					getDeletedMomentsStoreModule(false).markDeleted(momentId)
				end
			end
			local var76 = makeFeedActionFieldsModule(momentId, feedItemId, feedSessionId, if momentsCommonModule.Flags.GetFFlagMomentsAnalyticsSchemaIdentity() then "delete" else nil)
			
			if var76 then
				fireAnalyticsEvent(eventNames.MomentItemDeleted, var76)
			end
			var43.triggerToast({ title = var41.deletedTitle, text = var41.deletedBody })
		end
		var42.clearPendingDeletion()
	end, {
		var44,
		var42,
		var43,
		var41,
		var64
	})
	local var66 = reactModule.useCallback(function() --[[ line: 487 ]]
		-- upvalues: var42 (ref)
		var42.clearPendingDeletion()
	end, { var42 })
	local var67 = reactModule.useCallback(function(p10, p11) --[[ line: 491 ]]
		-- upvalues: var33 (copy), parent (copy), fireAnalyticsEvent (copy), eventNames (copy), source (ref)
		local recommendationMetadata = p10.recommendationMetadata
		
		if var33 == nil then
			var33 = require(parent.Loggers).Logger:new("Moments.Feed")
		end
		var33:debug("Filtering moment after media load failure | momentId: {}, assetId: {}, captureType: {}, failureReason: {}", p10.momentId, tostring(p10.assetId), p10.metadata.captureType.Name, p11 or "nil")
		local feedMediaLoadFailed = eventNames.FeedMediaLoadFailed
		local t = {
			momentId = p10.momentId,
			assetId = tostring(p10.assetId),
			captureType = p10.metadata.captureType.Name,
			creatorId = tostring(p10.creatorId),
			itemId = if recommendationMetadata ~= nil then nil else recommendationMetadata.feedItemId,
			tracingId = if recommendationMetadata ~= nil then nil else recommendationMetadata.tracingId,
			recommendationSource = source.recommendationSource or "",
			feedSourceId = source.id or ""
		}
		local placeId = p10.metadata.placeId
		t.placeId = if placeId ~= nil then nil else tostring(placeId)
		local universeId = p10.metadata.universeId
		t.universeId = if universeId ~= nil then nil else tostring(universeId)
		t.failureReason = p11
		fireAnalyticsEvent(feedMediaLoadFailed, t)
	end, { source })
	local var68 = reactModule.useCallback(function(p12, p13) --[[ line: 515 ]]
		-- upvalues: var59 (ref), var45 (ref), var67 (ref), var46 (ref)
		if var59.current[p12] then return end
		for i, v in var45.pager.getItems(false) do
			if v.kind == "moment" and v.moment.momentId == p12 then
				var59.current[p12] = true
				var67(v.moment, p13)
				local current = var46.current
				
				if current == nil then
					var45.pager.removeItem(i)
					
					return
				end
				current.removeItem(i)
				
				return
			end
		end
	end, { var45, var67 })
	local var69 = reactModule.createElement(feedContext.Provider, {
		value = reactModule.useMemo(function() --[[ line: 543 ]]
			-- upvalues: var45 (ref), var35 (ref), var36 (ref), source (ref), telemetry (ref), var53 (ref), var40 (ref), var64 (ref)
			return {
				getStatus = var45.getStatus,
				isActiveFeed = var35,
				isPlaybackActive = var36,
				recommendationSource = source.recommendationSource,
				logAction = function(p14, p15, p16) --[[ line: 549 ]]
					-- upvalues: telemetry (copy)
					return telemetry.logAction(p14, p15, p16)
				end,
				flushView = var53.flushView,
				getChromeVisible = var40.getChromeVisible,
				revealChrome = var40.revealChrome,
				removeCurrentItem = var64
			}
		end, {
			var45, var35, var36, source, telemetry, var53.flushView, var40, var64
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
				store = var45.pager,
				renderItem = renderFeedItem,
				keyExtractor = feedItemKey,
				onEndReached = var45.loadMore,
				active = var35 and (var57 ~= "Failed" and var57 ~= "Empty"),
				controllerRef = var46,
				initialIndex = p7.initialIndex,
				tuning = p7.pager,
				Size = UDim2.fromScale(1, 1)
			}),
			StateOverlay = reactModule.createElement(feedStateViewModule, {
				zIndex = 2,
				status = var57,
				loadMoreFailed = var58,
				onRetry = var45.retry,
				emptyContent = p7.emptyContent
			}),
			NavBar = if var37 and (if var57 ~= "Loaded" then var57 == "LoadingMore" else true) then reactModule.createElement(feedNavigationBarModule, {
				zIndex = 3,
				pager = var45.pager,
				active = var35,
				onScrollToNext = var55,
				onScrollToPrevious = var56
			}) else nil,
			ImmersiveController = if fFlagMomentsImmersiveChromeModule then reactModule.createElement(immersiveChromeControllerModule, {
				pager = var45.pager,
				active = var35 and var36,
				controllerRef = var46
			}) else nil,
			DeletionDialog = if var44 ~= nil then nil else reactModule.createElement(deletionConfirmationDialogModule, { onCancel = var66, onConfirm = var65 })
		})
	})
	
	return reactModule.createElement(momentMediaCoordinatorProviderModule, {
		pager = var45.pager,
		playbackActive = var36,
		createCoordinator = p7.createCoordinator,
		onMediaItemFailed = if getFFlagMomentsFilterUnavailableFeedItemsModule() then reactModule.useCallback(function(p17, p18) --[[ line: 536 ]]
			-- upvalues: getFFlagMomentsFilterUnavailableFeedItemsModule (copy), var68 (ref)
			if getFFlagMomentsFilterUnavailableFeedItemsModule() then
				var68(p17, p18)
			end
		end, { var68 }) else nil
	}, if var39 then {
		Feed = var69,
		SurfaceReadyTracker = reactModule.createElement(surfaceReadyTrackerModule, { pager = var45.pager })
	} else var69)
end
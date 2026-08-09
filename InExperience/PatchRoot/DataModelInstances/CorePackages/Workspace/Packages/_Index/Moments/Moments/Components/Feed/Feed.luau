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
local getFFlagMomentsImmersiveChromeModule = require(moments.Flags.GetFFlagMomentsImmersiveChrome)
local useMomentsSession = require(moments.Stores.GetMomentsStore.MomentsSessionContext).useMomentsSession
local getFFlagMomentsFixDeleteModule = require(moments.Flags.GetFFlagMomentsFixDelete)
local getToastStoreModule = require(moments.Stores.GetToastStore)
local deleteMomentModule = require(moments.Moderation.deleteMoment)
local momentMediaCoordinatorProviderModule = require(script.Parent.Media.MomentMediaCoordinatorProvider)
local surfaceReadyTrackerModule = require(script.Parent.SurfaceReadyTracker)
local verticalPager = verticalPagerModule.VerticalPager
local feedContext = feedContextModule.FeedContext
local getFFlagMomentsFilterUnavailableFeedItemsModule = require(moments.Flags.GetFFlagMomentsFilterUnavailableFeedItems)
local var24 = feedTelemetryModule.createNoopTelemetry()
local t = {
	deletedTitle = "Feature.Moments.Label.MomentDeletedTitle",
	deletedBody = "Feature.Moments.Label.MomentDeletedBody"
}

local function renderFeedItem(p0, p1) --[[ line: 86 ]]
	-- upvalues: feedItemRegistryModule (ref)
	local kind = feedItemRegistryModule[p0.kind]
	
	return if kind == nil then nil else kind.render(p0, p1)
end

local function feedItemKey(p2, p3) --[[ line: 91 ]]
	-- upvalues: feedItemRegistryModule (ref)
	local kind = feedItemRegistryModule[p2.kind]
	local var31 = if kind ~= nil then nil else kind.getKey(p2)
	
	return if var31 == nil or var31 == "" then tostring(p3) else var31
end

local function feedItemDedupeKey(p4) --[[ line: 101 ]]
	-- upvalues: feedItemRegistryModule (ref)
	local kind = feedItemRegistryModule[p4.kind]
	
	return if kind == nil then nil else kind.getKey(p4)
end

local function feedItemAttribution(p5) --[[ line: 106 ]]
	-- upvalues: feedItemRegistryModule (ref)
	local kind = feedItemRegistryModule[p5.kind]
	
	return if kind == nil then nil else kind.getAttribution(p5)
end

local function _(p6) --[[ line: 111 | named "stringOrNil" ]]
	return if p6 == nil then nil else tostring(p6)
end

local var30 = nil

local _ = function() --[[ line: 116 | named "getLogger" ]]
	-- upvalues: var30 (write), parent (ref)
	if var30 == nil then
		var30 = require(parent.Loggers).Logger:new("Moments.Feed")
	end
	return var30
end

return function(p7) --[[ line: 171 | named "Feed" ]]
	-- upvalues: var24 (ref), fFlagMomentsSurfaceLoadTTI (ref), getImmersiveChromeStoreModule (ref), getFFlagMomentsImmersiveChromeModule (ref), useLocalization (ref), t (ref), useMomentsSession (ref), getToastStoreModule (ref), signalsReactModule (ref), reactModule (ref), createFeedStoreModule (ref), feedItemDedupeKey (ref), fireAnalyticsEvent (ref), eventNames (ref), useFeedTelemetryModule (ref), feedItemAttribution (ref), momentsSurfaceLoadManager (ref), deleteMomentModule (ref), var30 (write), parent (ref), getFFlagMomentsFixDeleteModule (ref), getFFlagMomentsFilterUnavailableFeedItemsModule (ref), feedContext (ref), verticalPager (ref), renderFeedItem (ref), feedItemKey (ref), feedStateViewModule (ref), feedNavigationBarModule (ref), immersiveChromeControllerModule (ref), deletionConfirmationDialogModule (ref), momentMediaCoordinatorProviderModule (ref), surfaceReadyTrackerModule (ref)
	local source = p7.source
	local var32 = p7.active ~= nil or p7.active
	local var33 = if p7.playbackActive ~= nil then var32 else p7.playbackActive
	local var34 = p7.showNavigationBar ~= nil or p7.showNavigationBar
	local telemetry = p7.telemetry or var24
	local var36 = fFlagMomentsSurfaceLoadTTI and p7.trackSurfaceLoad == true
	local var37 = getImmersiveChromeStoreModule(false)
	local var38 = getFFlagMomentsImmersiveChromeModule()
	local var39 = useLocalization(t)
	local var40 = useMomentsSession()
	local var41 = getToastStoreModule(false)
	local var42 = signalsReactModule.useSignalState(var40.getPendingDeletion)
	local var43 = reactModule.useMemo(function() --[[ line: 197 ]]
		-- upvalues: createFeedStoreModule (copy), source (ref), feedItemDedupeKey (copy), var36 (ref)
		return createFeedStoreModule(source, feedItemDedupeKey, var36)
	end, { source })
	reactModule.useEffect(function() --[[ line: 202 ]]
		-- upvalues: var43 (ref)
		var43.loadInitial()
		
		return function() --[[ line: 204 ]]
			-- upvalues: var43 (copy)
			var43.dispose()
		end
	end, { var43 })
	local var44 = reactModule.useRef(nil)
	local var45 = reactModule.useRef(0)
	local var46 = reactModule.useRef(false)
	local var47 = reactModule.useRef(0)
	local var48 = reactModule.useCallback(function() --[[ line: 215 ]]
		-- upvalues: var46 (ref), var45 (ref), var47 (ref), var43 (ref)
		if var46.current or DateTime.now().UnixTimestampMillis < var45.current then
			return
		end
		var46.current = true
		var47.current += 1
		local current = var47.current
		var43.refresh()
		task.spawn(function() --[[ line: 224 ]]
			-- upvalues: var46 (copy), current (ref), var47 (copy), var43 (copy), var45 (copy)
			while var46.current and current == var47.current do
				local status = var43.getStatus(false)
				
				if status ~= "Loaded" and status ~= "Empty" then
					if status ~= "Failed" then
						task.wait()
						continue
					end
					var46.current = false
					
					return
				end
				var46.current = false
				var45.current = DateTime.now().UnixTimestampMillis + 1000
				
				return
			end
		end)
	end, { var43 })
	local var49 = reactModule.useCallback(function(p8) --[[ line: 241 ]]
		-- upvalues: var43 (ref), var44 (ref)
		var43.prependItem({ kind = "moment", moment = p8 })
		local current = var44.current
		
		if current ~= nil then
			current.scrollToIndex(1)
		end
	end, { var43 })
	reactModule.useImperativeHandle(p7.controllerRef, function() --[[ line: 249 ]]
		-- upvalues: var49 (ref), var48 (ref)
		return { prependMoment = var49, refresh = var48 }
	end, { var49, var48 })
	local var50 = reactModule.useCallback(function(p9) --[[ line: 256 ]]
		-- upvalues: fireAnalyticsEvent (copy), eventNames (copy)
		if p9.kind == "moment" then
			local moment = p9.moment
			fireAnalyticsEvent(eventNames.MomentViewBegan, {
				viewMode = "vertical",
				momentId = moment.momentId,
				itemId = moment.recommendationMetadata.itemId,
				tracingId = moment.recommendationMetadata.tracingId or ""
			})
			
			return
		end
	end, {})
	local var51 = useFeedTelemetryModule(var43.pager, {
		telemetry = telemetry,
		active = var32,
		getAttribution = feedItemAttribution,
		recommendationSource = source.recommendationSource,
		onItemBecameActive = var50
	})
	local var52 = reactModule.useRef(var33)
	reactModule.useEffect(function() --[[ line: 282 ]]
		-- upvalues: var52 (ref), var33 (ref), var43 (ref), var50 (ref)
		local current = var52.current
		var52.current = var33
		
		if var33 and not current then
			local currentItem = var43.pager.getCurrentItem(false)
			
			if currentItem ~= nil then
				var50(currentItem)
			end
		end
	end, { var33, var43, var50 })
	local var53 = reactModule.useCallback(function() --[[ line: 293 ]]
		-- upvalues: var44 (ref)
		local current = var44.current
		
		if current ~= nil then
			current.next()
		end
	end, {})
	local var54 = reactModule.useCallback(function() --[[ line: 299 ]]
		-- upvalues: var44 (ref)
		local current = var44.current
		
		if current ~= nil then
			current.previous()
		end
	end, {})
	local var55 = signalsReactModule.useSignalState(var43.getStatus)
	local var56 = signalsReactModule.useSignalState(var43.getLoadMoreFailed)
	local var57 = reactModule.useRef({})
	reactModule.useEffect(function() --[[ line: 313 ]]
		-- upvalues: var47 (ref), var46 (ref), var45 (ref)
		return function() --[[ line: 314 ]]
			-- upvalues: var47 (copy), var46 (copy), var45 (copy)
			var47.current += 1
			var46.current = false
			var45.current = 0
		end
	end, { var43 })
	local var58 = reactModule.useRef(false)
	local var59 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 325 ]]
		-- upvalues: var58 (ref), var36 (ref), momentsSurfaceLoadManager (copy), fireAnalyticsEvent (copy), eventNames (copy)
		if not var58.current then
			var58.current = true
			
			if var36 then
				momentsSurfaceLoadManager.renderStarted()
				momentsSurfaceLoadManager.surfaceMounted()
			end
			fireAnalyticsEvent(eventNames.MomentsFirstUIRenderedTimestamp, {
				value = if var36 and momentsSurfaceLoadManager.isSessionActive() then momentsSurfaceLoadManager.elapsedMs() else DateTime.now().UnixTimestampMillis
			})
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 343 ]]
		-- upvalues: var36 (ref), var59 (ref), var55 (ref), fireAnalyticsEvent (copy), eventNames (copy)
		if var36 then return end
		if not var59.current and (var55 == "Loaded" or var55 == "LoadingMore") then
			var59.current = true
			fireAnalyticsEvent(eventNames.MomentsFirstContentLoadedTimestamp, { value = DateTime.now().UnixTimestampMillis })
		end
	end, { var55 })
	local var60 = reactModule.useCallback(function() --[[ line: 355 ]]
		-- upvalues: var43 (ref), var44 (ref)
		local currentIndex = var43.pager.getCurrentIndex(false)
		local current = var44.current
		
		if current ~= nil then
			current.removeItem(currentIndex)
		end
	end, { var43 })
	local var61 = reactModule.useCallback(function() --[[ line: 367 ]]
		-- upvalues: var42 (ref), deleteMomentModule (copy), var30 (copy), parent (copy), getFFlagMomentsFixDeleteModule (copy), var60 (ref), fireAnalyticsEvent (copy), eventNames (copy), var41 (ref), var39 (ref), var40 (ref)
		if var42 then
			local var69 = var42
			task.spawn(function() --[[ line: 374 ]]
				-- upvalues: deleteMomentModule (copy), var69 (ref), var30 (copy), parent (copy)
				local var70, var71 = deleteMomentModule(var69):await()
				
				if not var70 then
					if var30 == nil then
						var30 = require(parent.Loggers).Logger:new("Moments.Feed")
					end
					var30:warning("Failed to delete moment {}: {}", var69, tostring(var71))
				end
			end)
			
			if getFFlagMomentsFixDeleteModule() then
				var60()
			end
			fireAnalyticsEvent(eventNames.MomentItemDeleted, { momentId = var69 })
			var41.triggerToast({ title = var39.deletedTitle, text = var39.deletedBody })
		end
		var40.clearPendingDeletion()
	end, {
		var42,
		var40,
		var41,
		var39,
		var60
	})
	local var62 = reactModule.useCallback(function() --[[ line: 401 ]]
		-- upvalues: var40 (ref)
		var40.clearPendingDeletion()
	end, { var40 })
	local var63 = reactModule.useCallback(function(p10, p11) --[[ line: 405 ]]
		-- upvalues: var30 (copy), parent (copy), fireAnalyticsEvent (copy), eventNames (copy), source (ref)
		local recommendationMetadata = p10.recommendationMetadata
		
		if var30 == nil then
			var30 = require(parent.Loggers).Logger:new("Moments.Feed")
		end
		var30:debug("Filtering moment after media load failure | momentId: {}, assetId: {}, captureType: {}, failureReason: {}", p10.momentId, tostring(p10.assetId), p10.metadata.captureType.Name, p11 or "nil")
		local feedMediaLoadFailed = eventNames.FeedMediaLoadFailed
		local t = {
			momentId = p10.momentId,
			assetId = tostring(p10.assetId),
			captureType = p10.metadata.captureType.Name,
			creatorId = tostring(p10.creatorId),
			itemId = if recommendationMetadata ~= nil then nil else recommendationMetadata.itemId,
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
	local var64 = reactModule.useCallback(function(p12, p13) --[[ line: 429 ]]
		-- upvalues: var57 (ref), var43 (ref), var63 (ref), var44 (ref)
		if var57.current[p12] then return end
		for i, v in var43.pager.getItems(false) do
			if v.kind == "moment" and v.moment.momentId == p12 then
				var57.current[p12] = true
				var63(v.moment, p13)
				local current = var44.current
				
				if current == nil then
					var43.pager.removeItem(i)
					
					return
				end
				current.removeItem(i)
				
				return
			end
		end
	end, { var43, var63 })
	local var65 = reactModule.createElement(feedContext.Provider, {
		value = reactModule.useMemo(function() --[[ line: 457 ]]
			-- upvalues: var43 (ref), var32 (ref), var33 (ref), source (ref), telemetry (ref), var51 (ref), var37 (ref), var60 (ref)
			return {
				getStatus = var43.getStatus,
				isActiveFeed = var32,
				isPlaybackActive = var33,
				recommendationSource = source.recommendationSource,
				logAction = function(p14, p15, p16) --[[ line: 463 ]]
					-- upvalues: telemetry (copy)
					return telemetry.logAction(p14, p15, p16)
				end,
				flushView = var51.flushView,
				getChromeVisible = var37.getChromeVisible,
				revealChrome = var37.revealChrome,
				removeCurrentItem = var60
			}
		end, {
			var43, var32, var33, source, telemetry, var51.flushView, var37, var60
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
				store = var43.pager,
				renderItem = renderFeedItem,
				keyExtractor = feedItemKey,
				onEndReached = var43.loadMore,
				active = var32 and (var55 ~= "Failed" and var55 ~= "Empty"),
				controllerRef = var44,
				initialIndex = p7.initialIndex,
				tuning = p7.pager,
				Size = UDim2.fromScale(1, 1)
			}),
			StateOverlay = reactModule.createElement(feedStateViewModule, {
				zIndex = 2,
				status = var55,
				loadMoreFailed = var56,
				onRetry = var43.retry,
				emptyContent = p7.emptyContent
			}),
			NavBar = if var34 and (if var55 ~= "Loaded" then var55 == "LoadingMore" else true) then reactModule.createElement(feedNavigationBarModule, {
				zIndex = 3,
				pager = var43.pager,
				active = var32,
				onScrollToNext = var53,
				onScrollToPrevious = var54
			}) else nil,
			ImmersiveController = if var38 then reactModule.createElement(immersiveChromeControllerModule, {
				pager = var43.pager,
				active = var32 and var33,
				controllerRef = var44
			}) else nil,
			DeletionDialog = if var42 ~= nil then nil else reactModule.createElement(deletionConfirmationDialogModule, { onCancel = var62, onConfirm = var61 })
		})
	})
	
	return reactModule.createElement(momentMediaCoordinatorProviderModule, {
		pager = var43.pager,
		playbackActive = var33,
		createCoordinator = p7.createCoordinator,
		onMediaItemFailed = if getFFlagMomentsFilterUnavailableFeedItemsModule() then reactModule.useCallback(function(p17, p18) --[[ line: 450 ]]
			-- upvalues: getFFlagMomentsFilterUnavailableFeedItemsModule (copy), var64 (ref)
			if getFFlagMomentsFilterUnavailableFeedItemsModule() then
				var64(p17, p18)
			end
		end, { var64 }) else nil
	}, if var36 then {
		Feed = var65,
		SurfaceReadyTracker = reactModule.createElement(surfaceReadyTrackerModule, { pager = var43.pager })
	} else var65)
end
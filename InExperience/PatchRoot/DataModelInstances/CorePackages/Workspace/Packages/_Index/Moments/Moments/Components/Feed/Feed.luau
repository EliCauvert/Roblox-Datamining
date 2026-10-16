local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local MomentsCommonModule = require(Parent.MomentsCommon)
local _ = require(Parent.MomentsTypes)
local ReactModule = require(Parent.React)
local SharedFlagsModule = require(Parent.SharedFlags)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local Analytics = MomentsCommonModule.Analytics
local EventNames = Analytics.EventNames
local FireAnalyticsEventFunction = Analytics.fireAnalyticsEvent
local MomentsSurfaceLoadManager = MomentsCommonModule.Performance.MomentsSurfaceLoadManager
local FFlagMomentsRemoveDeletedFromProfile = SharedFlagsModule.FFlagMomentsRemoveDeletedFromProfile
local FFlagMomentsOptimisticProfilePending = SharedFlagsModule.FFlagMomentsOptimisticProfilePending
local FFlagMomentsFeedMediaLoadAttemptedEvent = MomentsCommonModule.Flags.FFlagMomentsFeedMediaLoadAttemptedEvent
local FFlagMomentsMediaSmoothnessTelemetry = MomentsCommonModule.Flags.FFlagMomentsMediaSmoothnessTelemetry
local FFlagMomentsPassFeedItemIdToBackendApis = SharedFlagsModule.FFlagMomentsPassFeedItemIdToBackendApis
local FFlagMomentsComments = SharedFlagsModule.FFlagMomentsComments
local GetCommentsSheetStoreModule = if FFlagMomentsComments then require(Moments.Components.Comments.Sheet.getCommentsSheetStore) else nil
local _ = require(script.Parent.FeedTypes)
local FeedStateViewModule = require(script.Parent.FeedStateView)
local CreateFeedStoreModule = require(script.Parent.createFeedStore)
local FeedItemRegistryModule = require(script.Parent.feedItemRegistry)
local GetFeedScrollLimitModule = require(script.Parent.getFeedScrollLimit)
local UseFeedTelemetryModule = require(script.Parent.useFeedTelemetry)
local FeedNavigationBarModule = require(script.Parent.FeedNavigationBar)
local ImmersiveChromeControllerModule = require(script.Parent.ImmersiveChromeController)
local DeletionConfirmationDialogModule = require(script.Parent.DeletionConfirmationDialog)
local GetImmersiveChromeStoreModule = require(Moments.Stores.GetImmersiveChromeStore)
local FFlagMomentsCommentsCloseOnFeedJumpModule = require(Moments.Flags.FFlagMomentsCommentsCloseOnFeedJump)
local GetMomentsCapabilitiesFunction = MomentsCommonModule.Stores.GetMomentsCapabilities
local UseMomentsSessionFunction = require(Moments.Stores.GetMomentsStore.MomentsSessionContext).useMomentsSession
local FFlagMomentsDeleteSnackbarModule = require(Moments.Flags.FFlagMomentsDeleteSnackbar)
local FFlagMomentsFixDeleteToastCopyModule = require(Moments.Flags.FFlagMomentsFixDeleteToastCopy)
local GetFFlagMomentsNonInfiniteScrollFunction = MomentsCommonModule.Flags.GetFFlagMomentsNonInfiniteScroll
local FFlagMomentsNonInfiniteScrollEndStateFixesModule = require(Moments.Flags.FFlagMomentsNonInfiniteScrollEndStateFixes)
local GetToastStoreModule = require(Moments.Stores.GetToastStore)
local GetDeletedMomentsStoreModule = require(Moments.Stores.GetDeletedMomentsStore)
local DeleteMomentModule = require(Moments.Moderation.deleteMoment)
local LogMomentViewBeganModule = require(Moments.Analytics.logMomentViewBegan)
local FFlagMomentsNavigationEventModule = require(Moments.Flags.FFlagMomentsNavigationEvent)
local LogFeedEndStateReachedModule = require(Moments.Analytics.logFeedEndStateReached)
local MakeFeedActionFieldsModule = require(Moments.Analytics.makeFeedActionFields)
local MomentMediaCoordinatorProviderModule = require(script.Parent.Media.MomentMediaCoordinatorProvider)
local SurfaceReadyTrackerModule = require(script.Parent.SurfaceReadyTracker)
local SwipeLatencyTrackerModule = require(script.Parent.SwipeLatencyTracker)
local VerticalPager = require(Moments.Components.VerticalPager).VerticalPager
local FeedContext = require(script.Parent.FeedContext).FeedContext
local NoopTelemetry = require(script.Parent.feedTelemetry).createNoopTelemetry()
local config = {
	deletedTitle = "Feature.Moments.Label.MomentDeletedTitle",
	deletedBody = "Feature.Moments.Label.MomentDeletedBody",
	deletedToast = "Feature.Moments.Label.PostDeleted"
}

local function renderFeedItem(p1, p2) --[[ Line: 110 ]]
	-- upvalues: FeedItemRegistryModule (copy)
	local FeedItemRegistryModuleEntry = FeedItemRegistryModule[p1.kind]
	
	return if FeedItemRegistryModuleEntry == nil then nil else FeedItemRegistryModuleEntry.render(p1, p2)
end

local function feedItemKey(p1, p2) --[[ Line: 115 ]]
	-- upvalues: FeedItemRegistryModule (copy)
	local FeedItemRegistryModuleEntry = FeedItemRegistryModule[p1.kind]
	local Key = if FeedItemRegistryModuleEntry == nil then nil else FeedItemRegistryModuleEntry.getKey(p1)
	
	return if Key == nil or Key == "" then tostring(p2) else Key
end

local function feedItemDedupeKey(p1) --[[ Line: 125 ]]
	-- upvalues: FeedItemRegistryModule (copy)
	local FeedItemRegistryModuleEntry = FeedItemRegistryModule[p1.kind]
	
	return if FeedItemRegistryModuleEntry == nil then nil else FeedItemRegistryModuleEntry.getKey(p1)
end

local function feedItemAttribution(p1) --[[ Line: 130 ]]
	-- upvalues: FeedItemRegistryModule (copy)
	local FeedItemRegistryModuleEntry = FeedItemRegistryModule[p1.kind]
	
	return if FeedItemRegistryModuleEntry == nil then nil else FeedItemRegistryModuleEntry.getAttribution(p1)
end

local function _(p1) --[[ Line: 135 | Named "stringOrNil" ]]
	return if p1 == nil then nil else tostring(p1)
end

local function makeMediaLoadEventFields(MediaLoadEventFields, Source) --[[ Line: 139 ]]
	local RecommendationMetadata = MediaLoadEventFields.recommendationMetadata
	local PlaceId = MediaLoadEventFields.metadata.placeId
	local Text = if PlaceId == nil then nil else tostring(PlaceId)
	local UniverseId = MediaLoadEventFields.metadata.universeId
	
	return {
		momentId = MediaLoadEventFields.momentId,
		assetId = tostring(MediaLoadEventFields.assetId),
		captureType = MediaLoadEventFields.metadata.captureType.Name,
		creatorId = tostring(MediaLoadEventFields.creatorId),
		itemId = if RecommendationMetadata == nil then nil else RecommendationMetadata.feedItemId,
		tracingId = if RecommendationMetadata == nil then nil else RecommendationMetadata.tracingId,
		recommendationSource = Source.recommendationSource or "",
		feedSourceId = Source.id or "",
		placeId = Text,
		universeId = if UniverseId == nil then nil else tostring(UniverseId)
	}
end

local MomentsFeed = nil

local _ = function() --[[ Line: 156 | Named "getLogger" ]]
	-- upvalues: MomentsFeed (ref), Parent (copy)
	if MomentsFeed == nil then
		MomentsFeed = require(Parent.Loggers).Logger:new("Moments.Feed")
	end
	return MomentsFeed
end

return function(Frame: Frame) --[[ Line: 214 | Named "Feed" ]]
	-- upvalues: NoopTelemetry (copy), FFlagMomentsComments (copy), GetCommentsSheetStoreModule (copy), SignalsReactModule (copy), GetImmersiveChromeStoreModule (copy), UseLocalizationFunction (copy), config (copy), UseMomentsSessionFunction (copy), GetToastStoreModule (copy), ReactModule (copy), GetFeedScrollLimitModule (copy), FFlagMomentsNonInfiniteScrollEndStateFixesModule (copy), GetFFlagMomentsNonInfiniteScrollFunction (copy), GetMomentsCapabilitiesFunction (copy), CreateFeedStoreModule (copy), feedItemDedupeKey (copy), FFlagMomentsCommentsCloseOnFeedJumpModule (copy), SignalsModule (copy), FFlagMomentsMediaSmoothnessTelemetry (copy), FFlagMomentsNavigationEventModule (copy), LogMomentViewBeganModule (copy), Moments (copy), FireAnalyticsEventFunction (copy), EventNames (copy), LogFeedEndStateReachedModule (copy), UseFeedTelemetryModule (copy), feedItemAttribution (copy), FFlagMomentsOptimisticProfilePending (copy), MomentsSurfaceLoadManager (copy), FeedItemRegistryModule (copy), FFlagMomentsPassFeedItemIdToBackendApis (copy), DeleteMomentModule (copy), MomentsFeed (ref), Parent (copy), FFlagMomentsRemoveDeletedFromProfile (copy), GetDeletedMomentsStoreModule (copy), MakeFeedActionFieldsModule (copy), FFlagMomentsDeleteSnackbarModule (copy), FFlagMomentsFixDeleteToastCopyModule (copy), makeMediaLoadEventFields (copy), Analytics (copy), FFlagMomentsFeedMediaLoadAttemptedEvent (copy), FeedContext (copy), VerticalPager (copy), renderFeedItem (copy), feedItemKey (copy), FeedStateViewModule (copy), FeedNavigationBarModule (copy), ImmersiveChromeControllerModule (copy), SwipeLatencyTrackerModule (copy), DeletionConfirmationDialogModule (copy), MomentMediaCoordinatorProviderModule (copy), SurfaceReadyTrackerModule (copy)
	local Source = Frame.source
	local NoActive = Frame.active == nil or Frame.active
	local NoActive1 = if Frame.playbackActive == nil then NoActive else Frame.playbackActive
	local NoShowNavigationBar = Frame.showNavigationBar == nil or Frame.showNavigationBar
	local Telemetry = Frame.telemetry or NoopTelemetry
	local IsTrackSurfaceLoad = Frame.trackSurfaceLoad == true
	local UseSignalStateResult = false
	local UseSignalStateResult1 = false
	
	if FFlagMomentsComments and GetCommentsSheetStoreModule ~= nil then
		UseSignalStateResult = SignalsReactModule.useSignalState(GetCommentsSheetStoreModule(false).getIsOpen)
		UseSignalStateResult1 = SignalsReactModule.useSignalState(GetCommentsSheetStoreModule(false).getIsExpanded)
	end
	local NoUseSignalStateResult: boolean = NoActive and not UseSignalStateResult
	local NoUseSignalStateResult1: boolean = NoActive1 and not UseSignalStateResult1
	local ImmersiveChromeStoreModule = GetImmersiveChromeStoreModule(false)
	local UseLocalizationResult = UseLocalizationFunction(config)
	local UseMomentsSessionResult = UseMomentsSessionFunction()
	local ToastStoreModule = GetToastStoreModule(false)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(UseMomentsSessionResult.getPendingDeletion)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 253 ]]
		-- upvalues: GetFeedScrollLimitModule (upval), FFlagMomentsNonInfiniteScrollEndStateFixesModule (upval), GetFFlagMomentsNonInfiniteScrollFunction (upval), GetMomentsCapabilitiesFunction (upval), CreateFeedStoreModule (upval), Source (copy), feedItemDedupeKey (upval), IsTrackSurfaceLoad (copy)
		return CreateFeedStoreModule(Source, feedItemDedupeKey, IsTrackSurfaceLoad, (GetFeedScrollLimitModule(FFlagMomentsNonInfiniteScrollEndStateFixesModule, GetFFlagMomentsNonInfiniteScrollFunction(), function() --[[ Line: 257 ]]
			-- upvalues: GetMomentsCapabilitiesFunction (upval)
			return GetMomentsCapabilitiesFunction(false)
		end)))
	end, { Source, IsTrackSurfaceLoad })
	ReactModule.useEffect(function() --[[ Line: 265 ]]
		-- upvalues: UseMemoResult (copy)
		UseMemoResult.loadInitial()
		
		return function() --[[ Line: 267 ]]
			-- upvalues: UseMemoResult (upval)
			UseMemoResult.dispose()
		end
	end, { UseMemoResult })
	
	if FFlagMomentsCommentsCloseOnFeedJumpModule and GetCommentsSheetStoreModule ~= nil then
		ReactModule.useEffect(function() --[[ Line: 278 ]]
			-- upvalues: NoActive (copy), GetCommentsSheetStoreModule (upval), UseMemoResult (copy), SignalsModule (upval)
			if not NoActive then return end
			local CommentsSheetStoreModule = GetCommentsSheetStoreModule(false)
			
			local function _(p1) --[[ Line: 285 | Named "getCurrentPosition" ]]
				-- upvalues: UseMemoResult (upval)
				local CurrentItem = UseMemoResult.pager.getCurrentItem(p1)
				
				if CurrentItem == nil or CurrentItem.kind == "skeleton" then
					return nil
				elseif CurrentItem.kind == "moment" then
					local Moment = CurrentItem.moment
					
					return Moment.recommendationMetadata.feedItemId or `moment:{Moment.momentId}`
				else
					return `kind:{CurrentItem.kind}`
				end
			end
			
			local CurrentItem = UseMemoResult.pager.getCurrentItem(false)
			local FeedItemId = nil
			
			if CurrentItem == nil or CurrentItem.kind == "skeleton" then
				FeedItemId = nil
			elseif CurrentItem.kind == "moment" then
				local Moment = CurrentItem.moment
				FeedItemId = Moment.recommendationMetadata.feedItemId or `moment:{Moment.momentId}`
			else
				FeedItemId = `kind:{CurrentItem.kind}`
			end
			return SignalsModule.createEffect(function(p1) --[[ Line: 297 ]]
				-- upvalues: UseMemoResult (upval), FeedItemId (ref), CommentsSheetStoreModule (copy)
				local CurrentItem = UseMemoResult.pager.getCurrentItem(p1)
				local FeedItemId1 = nil
				
				if CurrentItem == nil or CurrentItem.kind == "skeleton" then
					FeedItemId1 = nil
				elseif CurrentItem.kind == "moment" then
					local Moment = CurrentItem.moment
					FeedItemId1 = Moment.recommendationMetadata.feedItemId or `moment:{Moment.momentId}`
				else
					FeedItemId1 = `kind:{CurrentItem.kind}`
				end
				if FeedItemId1 == nil or FeedItemId1 == FeedItemId then return end
				local FeedItemId2: string = FeedItemId
				FeedItemId = FeedItemId1
				
				if FeedItemId2 ~= nil and CommentsSheetStoreModule.getIsOpen(false) and CommentsSheetStoreModule.getFeedItemId(false) == FeedItemId2 then
					CommentsSheetStoreModule.close()
				end
			end)
		end, { NoActive, UseMemoResult })
	end
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 320 ]]
		-- upvalues: FFlagMomentsMediaSmoothnessTelemetry (upval), FFlagMomentsNavigationEventModule (upval), UseRefResult1 (copy), UseRefResult2 (copy)
		if not FFlagMomentsMediaSmoothnessTelemetry and not FFlagMomentsNavigationEventModule then
			return nil
		end
		local t = {}
		
		if FFlagMomentsMediaSmoothnessTelemetry then
			function t.onTargetCommitted(p1, p2, p3) --[[ Line: 326 ]]
				-- upvalues: UseRefResult1 (upval)
				local CurrentFunction: (any, any, any) -> () = UseRefResult1.current
				
				if CurrentFunction ~= nil then
					CurrentFunction(p1, p2, p3)
				end
			end
		end
		if FFlagMomentsNavigationEventModule then
			function t.onUserStep(p1, p2) --[[ Line: 334 ]]
				-- upvalues: UseRefResult2 (upval)
				local CurrentFunction: (any, any) -> () = UseRefResult2.current
				
				if CurrentFunction ~= nil then
					CurrentFunction(p1, p2)
				end
			end
		end
		return t
	end, {})
	local UseRefResult3 = ReactModule.useRef(0)
	local UseRefResult4 = ReactModule.useRef(false)
	local UseRefResult5 = ReactModule.useRef(0)
	local UseRefResult6 = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function(p1) --[[ Line: 349 ]]
		-- upvalues: UseRefResult4 (copy), UseRefResult3 (copy), UseRefResult6 (copy), FFlagMomentsNavigationEventModule (upval), UseRefResult5 (copy), UseMemoResult (copy)
		if UseRefResult4.current or DateTime.now().UnixTimestampMillis < UseRefResult3.current then return end
		local CurrentFunction: (any) -> () = UseRefResult6.current
		
		if FFlagMomentsNavigationEventModule and p1 ~= nil and CurrentFunction ~= nil then
			CurrentFunction(p1)
		end
		UseRefResult4.current = true
		UseRefResult5.current += 1
		local Current = UseRefResult5.current
		UseMemoResult.refresh()
		task.spawn(function() --[[ Line: 364 ]]
			-- upvalues: UseRefResult4 (upval), Current (copy), UseRefResult5 (upval), UseMemoResult (upval), UseRefResult3 (upval)
			while UseRefResult4.current and Current == UseRefResult5.current do
				local Status = UseMemoResult.getStatus(false)
				
				if Status == "Loaded" or Status == "Empty" then
					UseRefResult4.current = false
					UseRefResult3.current = DateTime.now().UnixTimestampMillis + 1000
					break
				end
				if Status == "Failed" then
					UseRefResult4.current = false
					break
				end
				task.wait()
			end
		end)
	end, { UseMemoResult })
	local UseResult1 = ReactModule.useCallback(function(Moment) --[[ Line: 381 ]]
		-- upvalues: UseMemoResult (copy), UseRefResult (copy)
		UseMemoResult.prependItem({ kind = "moment", moment = Moment })
		local Current = UseRefResult.current
		
		if Current ~= nil then
			Current.scrollToIndex(1)
		end
	end, { UseMemoResult })
	local UseRefResult7 = ReactModule.useRef(nil)
	local UseResult2 = ReactModule.useCallback(function(p2) --[[ Line: 391 ]]
		-- upvalues: UseRefResult7 (copy), LogMomentViewBeganModule (upval), UseMomentsSessionResult (copy), FFlagMomentsNavigationEventModule (upval)
		if p2.kind == "moment" then
			local CurrentFunction = UseRefResult7.current
			LogMomentViewBeganModule(p2.moment, UseMomentsSessionResult.getSessionSource(false), if FFlagMomentsNavigationEventModule and CurrentFunction ~= nil then CurrentFunction() else nil)
			
			return
		end
	end, { UseMomentsSessionResult })
	local HasTelemetry = Frame.telemetry ~= nil
	local UseResult3 = ReactModule.useCallback(function(MediaLoadEventFields, p2) --[[ Line: 407 ]]
		-- upvalues: Moments (upval), FireAnalyticsEventFunction (upval), EventNames (upval), HasTelemetry (copy)
		FireAnalyticsEventFunction(EventNames.MomentsNavigationEvent, require(Moments.Analytics.makeMomentsNavigationFields)({
			feedItemId = MediaLoadEventFields.itemId,
			viewId = p2.viewId,
			durationSeconds = p2.durationSeconds,
			destinationType = p2.destination,
			itemPosition = p2.itemPosition,
			tracingId = MediaLoadEventFields.tracingId,
			includeRecommendationDetail = HasTelemetry,
			clientEventTimestampMs = DateTime.now().UnixTimestampMillis
		}))
	end, { HasTelemetry })
	local UseResult4 = ReactModule.useCallback(function(ItemPosition) --[[ Line: 425 ]]
		-- upvalues: LogFeedEndStateReachedModule (upval), UseMomentsSessionResult (copy), Source (copy)
		LogFeedEndStateReachedModule({
			source = UseMomentsSessionResult.getSessionSource(false),
			recommendationSource = Source.recommendationSource or "",
			feedSourceId = Source.id or "",
			itemPosition = ItemPosition
		})
	end, { UseMomentsSessionResult, Source })
	local UseFeedTelemetryModuleResult = UseFeedTelemetryModule(UseMemoResult.pager, {
		telemetry = Telemetry,
		active = NoActive,
		getAttribution = feedItemAttribution,
		recommendationSource = Source.recommendationSource,
		onItemBecameActive = UseResult2,
		onEndStateReached = if GetFFlagMomentsNonInfiniteScrollFunction() then UseResult4 else nil,
		onViewEnded = if FFlagMomentsNavigationEventModule then UseResult3 else nil,
		inactiveDestination = if FFlagMomentsNavigationEventModule then Frame.inactiveDestination else nil
	})
	UseRefResult7.current = UseFeedTelemetryModuleResult.getViewId
	UseRefResult6.current = UseFeedTelemetryModuleResult.flushView
	UseRefResult2.current = UseFeedTelemetryModuleResult.noteUserStep
	ReactModule.useImperativeHandle(Frame.controllerRef, function() --[[ Line: 448 ]]
		-- upvalues: UseResult1 (copy), UseResult (copy), UseFeedTelemetryModuleResult (copy)
		return {
			prependMoment = UseResult1,
			refresh = UseResult,
			flushView = UseFeedTelemetryModuleResult.flushView
		}
	end, {
		UseResult1,
		UseResult,
		UseFeedTelemetryModuleResult.flushView
	})
	local UseRefResult8 = ReactModule.useRef(NoActive1)
	ReactModule.useEffect(function() --[[ Line: 461 ]]
		-- upvalues: UseRefResult8 (copy), NoActive1 (copy), UseMemoResult (copy), UseResult2 (copy)
		local Current = UseRefResult8.current
		UseRefResult8.current = NoActive1
		
		if NoActive1 and not Current then
			local CurrentItem = UseMemoResult.pager.getCurrentItem(false)
			
			if CurrentItem ~= nil then
				UseResult2(CurrentItem)
			end
		end
	end, { NoActive1, UseMemoResult, UseResult2 })
	local UseResult5 = ReactModule.useCallback(function() --[[ Line: 472 ]]
		-- upvalues: UseRefResult (copy)
		local Current = UseRefResult.current
		
		if Current ~= nil then
			Current.next()
		end
	end, {})
	local UseResult6 = ReactModule.useCallback(function() --[[ Line: 478 ]]
		-- upvalues: UseRefResult (copy)
		local Current = UseRefResult.current
		
		if Current ~= nil then
			Current.previous()
		end
	end, {})
	local UseSignalStateResult3 = SignalsReactModule.useSignalState(UseMemoResult.getStatus)
	local UseSignalStateResult4 = nil
	local UseSignalStateResult5 = nil
	
	if FFlagMomentsOptimisticProfilePending then
		UseSignalStateResult4 = SignalsReactModule.useSignalState(UseMemoResult.getInitialIndex)
		UseSignalStateResult5 = SignalsReactModule.useSignalState(UseMemoResult.getError)
	end
	local UseSignalStateResult6 = SignalsReactModule.useSignalState(UseMemoResult.getLoadMoreFailed)
	local UseRefResult9 = ReactModule.useRef({})
	ReactModule.useEffect(function() --[[ Line: 498 ]]
		-- upvalues: UseRefResult5 (copy), UseRefResult4 (copy), UseRefResult3 (copy)
		return function() --[[ Line: 499 ]]
			-- upvalues: UseRefResult5 (upval), UseRefResult4 (upval), UseRefResult3 (upval)
			UseRefResult5.current += 1
			UseRefResult4.current = false
			UseRefResult3.current = 0
		end
	end, { UseMemoResult })
	local UseRefResult10 = ReactModule.useRef(false)
	local UseRefResult11 = ReactModule.useRef(false)
	ReactModule.useEffect(function() --[[ Line: 511 ]]
		-- upvalues: UseRefResult10 (copy), IsTrackSurfaceLoad (copy), MomentsSurfaceLoadManager (upval), FireAnalyticsEventFunction (upval), EventNames (upval)
		if not UseRefResult10.current then
			UseRefResult10.current = true
			
			if IsTrackSurfaceLoad then
				MomentsSurfaceLoadManager.renderStarted()
				MomentsSurfaceLoadManager.surfaceMounted()
			end
			FireAnalyticsEventFunction(EventNames.MomentsFirstUIRenderedTimestamp, {
				value = if IsTrackSurfaceLoad and MomentsSurfaceLoadManager.isSessionActive() then MomentsSurfaceLoadManager.elapsedMs() else DateTime.now().UnixTimestampMillis
			})
		end
	end, {})
	ReactModule.useEffect(function() --[[ Line: 530 ]]
		-- upvalues: IsTrackSurfaceLoad (copy), UseRefResult11 (copy), UseSignalStateResult3 (copy), FireAnalyticsEventFunction (upval), EventNames (upval)
		if IsTrackSurfaceLoad then return end
		if not UseRefResult11.current and (UseSignalStateResult3 == "Loaded" or UseSignalStateResult3 == "LoadingMore") then
			UseRefResult11.current = true
			FireAnalyticsEventFunction(EventNames.MomentsFirstContentLoadedTimestamp, { value = DateTime.now().UnixTimestampMillis })
		end
	end, { UseSignalStateResult3 })
	local UseRefResult12 = ReactModule.useRef(nil)
	ReactModule.useEffect(function() --[[ Line: 546 ]]
		-- upvalues: UseSignalStateResult3 (copy), UseRefResult12 (copy), FireAnalyticsEventFunction (upval), EventNames (upval), Source (copy), UseMemoResult (copy)
		if UseSignalStateResult3 ~= UseRefResult12.current then
			if UseSignalStateResult3 == "Failed" then
				FireAnalyticsEventFunction(EventNames.FeedLoadFailed, {
					recommendationSource = Source.recommendationSource or "",
					feedSourceId = Source.id or "",
					failureReason = UseMemoResult.getError(false) or ""
				})
			elseif UseSignalStateResult3 == "Empty" then
				FireAnalyticsEventFunction(EventNames.FeedNoMomentsFetched, {
					recommendationSource = Source.recommendationSource or "",
					feedSourceId = Source.id or ""
				})
			end
		end
		UseRefResult12.current = UseSignalStateResult3
	end, { UseSignalStateResult3 })
	local UseRefResult13 = ReactModule.useRef(false)
	ReactModule.useEffect(function() --[[ Line: 569 ]]
		-- upvalues: UseSignalStateResult6 (copy), UseRefResult13 (copy), UseMemoResult (copy), FeedItemRegistryModule (upval), FireAnalyticsEventFunction (upval), EventNames (upval), Source (copy)
		if UseSignalStateResult6 and not UseRefResult13.current then
			local Item = UseMemoResult.pager.getItems(false)[UseMemoResult.pager.getCurrentIndex(false)]
			local Attribution = nil
			
			if Item == nil then
				Attribution = nil
			else
				local FeedItemRegistryModuleEntry = FeedItemRegistryModule[Item.kind]
				Attribution = if FeedItemRegistryModuleEntry == nil then nil else FeedItemRegistryModuleEntry.getAttribution(Item)
			end
			FireAnalyticsEventFunction(EventNames.FeedLoadMoreFailed, {
				recommendationSource = Source.recommendationSource or "",
				feedSourceId = Source.id or "",
				itemId = if Attribution == nil then nil else Attribution.itemId,
				tracingId = if Attribution == nil then nil else Attribution.tracingId
			})
		end
		UseRefResult13.current = UseSignalStateResult6
	end, { UseSignalStateResult6 })
	local UseResult7 = ReactModule.useCallback(function() --[[ Line: 584 ]]
		-- upvalues: UseMemoResult (copy), UseRefResult (copy)
		local CurrentIndex = UseMemoResult.pager.getCurrentIndex(false)
		local Current = UseRefResult.current
		
		if Current ~= nil then
			Current.removeItem(CurrentIndex)
		end
	end, { UseMemoResult })
	local UseResult8 = ReactModule.useCallback(function() --[[ Line: 596 ]]
		-- upvalues: UseSignalStateResult2 (copy), FFlagMomentsPassFeedItemIdToBackendApis (upval), UseMomentsSessionResult (copy), DeleteMomentModule (upval), MomentsFeed (upval), Parent (upval), UseResult7 (copy), FFlagMomentsRemoveDeletedFromProfile (upval), FFlagMomentsOptimisticProfilePending (upval), GetDeletedMomentsStoreModule (upval), MakeFeedActionFieldsModule (upval), FireAnalyticsEventFunction (upval), EventNames (upval), FFlagMomentsDeleteSnackbarModule (upval), ToastStoreModule (copy), UseLocalizationResult (copy), FFlagMomentsFixDeleteToastCopyModule (upval)
		if UseSignalStateResult2 then
			local MomentId = UseSignalStateResult2.momentId
			local FeedItemId = UseSignalStateResult2.feedItemId
			local FeedSessionId = UseSignalStateResult2.feedSessionId
			
			if FFlagMomentsPassFeedItemIdToBackendApis and (FeedItemId == nil or FeedItemId == "") then
				UseMomentsSessionResult.clearPendingDeletion()
				
				return
			end
			task.spawn(function() --[[ Line: 611 ]]
				-- upvalues: FFlagMomentsPassFeedItemIdToBackendApis (upval), DeleteMomentModule (upval), MomentId (copy), FeedItemId (copy), MomentsFeed (upval), Parent (upval)
				local v1, v2 = (if FFlagMomentsPassFeedItemIdToBackendApis then DeleteMomentModule(MomentId, nil, FeedItemId) else DeleteMomentModule(MomentId)):await()
				
				if not v1 then
					if MomentsFeed == nil then
						MomentsFeed = require(Parent.Loggers).Logger:new("Moments.Feed")
					end
					MomentsFeed:warning("Failed to delete moment {}: {}", MomentId, (tostring(v2)))
				end
			end)
			UseResult7()
			
			if FFlagMomentsRemoveDeletedFromProfile or FFlagMomentsOptimisticProfilePending then
				GetDeletedMomentsStoreModule(false).markDeleted(MomentId)
			end
			local Delete = MakeFeedActionFieldsModule(MomentId, FeedItemId, FeedSessionId, "delete")
			
			if Delete then
				FireAnalyticsEventFunction(EventNames.MomentItemDeleted, Delete)
			end
			if FFlagMomentsDeleteSnackbarModule then
				ToastStoreModule.triggerToast({
					text = "",
					variant = "snackbar",
					title = UseLocalizationResult.deletedToast
				})
			elseif FFlagMomentsFixDeleteToastCopyModule then
				ToastStoreModule.triggerToast({ text = "", title = UseLocalizationResult.deletedToast })
			else
				ToastStoreModule.triggerToast({
					title = UseLocalizationResult.deletedTitle,
					text = UseLocalizationResult.deletedBody
				})
			end
		end
		UseMomentsSessionResult.clearPendingDeletion()
	end, {
		UseSignalStateResult2,
		UseMomentsSessionResult,
		ToastStoreModule,
		UseLocalizationResult,
		UseResult7
	})
	local UseResult9 = ReactModule.useCallback(function() --[[ Line: 652 ]]
		-- upvalues: UseMomentsSessionResult (copy)
		UseMomentsSessionResult.clearPendingDeletion()
	end, { UseMomentsSessionResult })
	local UseResult10 = ReactModule.useCallback(function(MediaLoadEventFields, FailureReason) --[[ Line: 656 ]]
		-- upvalues: MomentsFeed (upval), Parent (upval), makeMediaLoadEventFields (upval), Source (copy), FireAnalyticsEventFunction (upval), EventNames (upval)
		if MomentsFeed == nil then
			MomentsFeed = require(Parent.Loggers).Logger:new("Moments.Feed")
		end
		MomentsFeed:debug("Filtering moment after media load failure | momentId: {}, assetId: {}, captureType: {}, failureReason: {}", MediaLoadEventFields.momentId, tostring(MediaLoadEventFields.assetId), MediaLoadEventFields.metadata.captureType.Name, FailureReason or "nil")
		local MediaLoadEventFields1 = makeMediaLoadEventFields(MediaLoadEventFields, Source)
		
		if FailureReason ~= nil then
			MediaLoadEventFields1.failureReason = FailureReason
		end
		FireAnalyticsEventFunction(EventNames.FeedMediaLoadFailed, MediaLoadEventFields1)
	end, { Source })
	local UseResult11 = ReactModule.useCallback(function(MomentId, p2) --[[ Line: 671 ]]
		-- upvalues: UseRefResult9 (copy), UseMemoResult (copy), UseResult10 (copy), UseRefResult (copy)
		if UseRefResult9.current[MomentId] then return end
		for i, value in UseMemoResult.pager.getItems(false) do
			if value.kind == "moment" and value.moment.momentId == MomentId then
				UseRefResult9.current[MomentId] = true
				UseResult10(value.moment, p2)
				local Current = UseRefResult.current
				
				if Current == nil then
					UseMemoResult.pager.removeItem(i)
					break
				else
					Current.removeItem(i)
					break
				end
			end
		end
	end, { UseMemoResult, UseResult10 })
	local IsLoaded: boolean = NoShowNavigationBar and (UseSignalStateResult3 == "Loaded" or UseSignalStateResult3 == "LoadingMore")
	local Element = ReactModule.createElement(FeedContext.Provider, {
		value = ReactModule.useMemo(function() --[[ Line: 711 ]]
			-- upvalues: UseMemoResult (copy), NoActive (copy), NoActive1 (copy), Source (copy), Telemetry (copy), UseFeedTelemetryModuleResult (copy), ImmersiveChromeStoreModule (copy), UseResult7 (copy), UseResult5 (copy), FFlagMomentsNonInfiniteScrollEndStateFixesModule (upval), GetFFlagMomentsNonInfiniteScrollFunction (upval)
			return {
				getStatus = UseMemoResult.getStatus,
				isActiveFeed = NoActive,
				isPlaybackActive = NoActive1,
				recommendationSource = Source.recommendationSource,
				logAction = function(p3, p4, p5) --[[ Line: 717 ]]
					-- upvalues: Telemetry (upval)
					return Telemetry.logAction(p3, p4, p5)
				end,
				flushView = UseFeedTelemetryModuleResult.flushView,
				getChromeVisible = ImmersiveChromeStoreModule.getChromeVisible,
				revealChrome = ImmersiveChromeStoreModule.revealChrome,
				removeCurrentItem = UseResult7,
				scrollToNext = UseResult5,
				loadMoreBeyondLimit = if FFlagMomentsNonInfiniteScrollEndStateFixesModule then if GetFFlagMomentsNonInfiniteScrollFunction() then UseMemoResult.loadBeyondLimit else nil else UseMemoResult.loadBeyondLimit,
				getCanLoadMoreBeyondLimit = if FFlagMomentsNonInfiniteScrollEndStateFixesModule then UseMemoResult.getCanLoadMoreBeyondLimit else nil
			}
		end, {
			UseMemoResult, NoActive, NoActive1, Source, Telemetry,
			UseFeedTelemetryModuleResult.flushView, ImmersiveChromeStoreModule, UseResult7,
			UseResult5
		})
	}, {
		Root = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AnchorPoint = Frame.AnchorPoint,
			LayoutOrder = Frame.LayoutOrder,
			Position = Frame.Position,
			Size = Frame.Size or UDim2.fromScale(1, 1),
			ZIndex = Frame.ZIndex
		}, {
			Pager = ReactModule.createElement(VerticalPager, {
				ZIndex = 1,
				store = UseMemoResult.pager,
				renderItem = renderFeedItem,
				keyExtractor = feedItemKey,
				analytics = UseMemoResult1,
				onEndReached = UseMemoResult.loadMore,
				active = NoUseSignalStateResult and (UseSignalStateResult3 ~= "Failed" and UseSignalStateResult3 ~= "Empty"),
				controllerRef = UseRefResult,
				initialIndex = FFlagMomentsOptimisticProfilePending and UseSignalStateResult4 or Frame.initialIndex,
				tuning = Frame.pager,
				Size = UDim2.fromScale(1, 1)
			}),
			StateOverlay = ReactModule.createElement(FeedStateViewModule, {
				zIndex = 2,
				status = UseSignalStateResult3,
				loadMoreFailed = UseSignalStateResult6 or FFlagMomentsOptimisticProfilePending and UseSignalStateResult5 ~= nil,
				onRetry = UseMemoResult.retry,
				emptyContent = Frame.emptyContent
			}),
			NavBar = if IsLoaded then ReactModule.createElement(FeedNavigationBarModule, {
				zIndex = 3,
				pager = UseMemoResult.pager,
				active = NoUseSignalStateResult,
				onScrollToNext = UseResult5,
				onScrollToPrevious = UseResult6
			}) else nil,
			ImmersiveController = ReactModule.createElement(ImmersiveChromeControllerModule, {
				pager = UseMemoResult.pager,
				active = NoActive and NoActive1,
				controllerRef = UseRefResult,
				coveringOverlay = UseSignalStateResult
			}),
			SwipeLatency = if FFlagMomentsMediaSmoothnessTelemetry then ReactModule.createElement(SwipeLatencyTrackerModule, {
				pager = UseMemoResult.pager,
				controllerRef = UseRefResult,
				onTargetCommittedRef = UseRefResult1
			}) else nil,
			DeletionDialog = if UseSignalStateResult2 == nil then nil else ReactModule.createElement(DeletionConfirmationDialogModule, { onCancel = UseResult9, onConfirm = UseResult8 })
		})
	})
	
	return ReactModule.createElement(MomentMediaCoordinatorProviderModule, {
		pager = UseMemoResult.pager,
		playbackActive = NoUseSignalStateResult1,
		createCoordinator = Frame.createCoordinator,
		onMediaItemLoadAttempted = ReactModule.useCallback(function(MomentId) --[[ Line: 692 ]]
			-- upvalues: Analytics (upval), UseMemoResult (copy), FFlagMomentsFeedMediaLoadAttemptedEvent (upval), FireAnalyticsEventFunction (upval), EventNames (upval), makeMediaLoadEventFields (upval), Source (copy)
			Analytics.reportMomentsFeedMediaLoad("attempted", UseMemoResult.observabilityFeedType)
			
			if FFlagMomentsFeedMediaLoadAttemptedEvent then
				for _, value in UseMemoResult.pager.getItems(false) do
					if value.kind == "moment" and value.moment.momentId == MomentId then
						FireAnalyticsEventFunction(EventNames.FeedMediaLoadAttempted, (makeMediaLoadEventFields(value.moment, Source)))
						break
					end
				end
			end
		end, { UseMemoResult, Source }),
		onMediaItemFailed = ReactModule.useCallback(function(p3, p4) --[[ Line: 705 ]]
			-- upvalues: Analytics (upval), UseMemoResult (copy), UseResult11 (copy)
			Analytics.reportMomentsFeedMediaLoad("failed", UseMemoResult.observabilityFeedType, p4)
			UseResult11(p3, p4)
		end, { UseMemoResult, UseResult11 })
	}, if IsTrackSurfaceLoad then {
		Feed = Element,
		SurfaceReadyTracker = ReactModule.createElement(SurfaceReadyTrackerModule, { pager = UseMemoResult.pager })
	} else Element)
end
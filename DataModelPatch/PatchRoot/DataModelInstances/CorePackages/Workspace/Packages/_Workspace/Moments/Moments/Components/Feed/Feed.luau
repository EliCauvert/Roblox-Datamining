local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local MomentsCommonModule = require(Parent.MomentsCommon)
local _ = require(Parent.MomentsTypes)
local ReactModule = require(Parent.React)
local SharedFlagsModule = require(Parent.SharedFlags)
local SignalsReactModule = require(Parent.SignalsReact)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local Analytics = MomentsCommonModule.Analytics
local EventNames = Analytics.EventNames
local FireAnalyticsEventFunction = Analytics.fireAnalyticsEvent
local MomentsSurfaceLoadManager = MomentsCommonModule.Performance.MomentsSurfaceLoadManager
local FFlagMomentsSurfaceLoadTTI = SharedFlagsModule.FFlagMomentsSurfaceLoadTTI
local FFlagMomentsRemoveDeletedFromProfile = SharedFlagsModule.FFlagMomentsRemoveDeletedFromProfile
local _ = require(script.Parent.FeedTypes)
local FeedStateViewModule = require(script.Parent.FeedStateView)
local CreateFeedStoreModule = require(script.Parent.createFeedStore)
local FeedItemRegistryModule = require(script.Parent.feedItemRegistry)
local UseFeedTelemetryModule = require(script.Parent.useFeedTelemetry)
local FeedNavigationBarModule = require(script.Parent.FeedNavigationBar)
local ImmersiveChromeControllerModule = require(script.Parent.ImmersiveChromeController)
local DeletionConfirmationDialogModule = require(script.Parent.DeletionConfirmationDialog)
local GetImmersiveChromeStoreModule = require(Moments.Stores.GetImmersiveChromeStore)
local GetFFlagMomentsImmersiveChromeModule = require(Moments.Flags.GetFFlagMomentsImmersiveChrome)
local UseMomentsSessionFunction = require(Moments.Stores.GetMomentsStore.MomentsSessionContext).useMomentsSession
local GetFFlagMomentsFixDeleteModule = require(Moments.Flags.GetFFlagMomentsFixDelete)
local GetToastStoreModule = require(Moments.Stores.GetToastStore)
local GetDeletedMomentsStoreModule = require(Moments.Stores.GetDeletedMomentsStore)
local DeleteMomentModule = require(Moments.Moderation.deleteMoment)
local MakeMomentViewBeganFieldsModule = require(Moments.Analytics.makeMomentViewBeganFields)
local MakeFeedActionFieldsModule = require(Moments.Analytics.makeFeedActionFields)
local MomentMediaCoordinatorProviderModule = require(script.Parent.Media.MomentMediaCoordinatorProvider)
local SurfaceReadyTrackerModule = require(script.Parent.SurfaceReadyTracker)
local VerticalPager = require(Moments.Components.VerticalPager).VerticalPager
local FeedContext = require(script.Parent.FeedContext).FeedContext
local GetFFlagMomentsFilterUnavailableFeedItemsModule = require(Moments.Flags.GetFFlagMomentsFilterUnavailableFeedItems)
local NoopTelemetry = require(script.Parent.feedTelemetry).createNoopTelemetry()
local config = {
	deletedTitle = "Feature.Moments.Label.MomentDeletedTitle",
	deletedBody = "Feature.Moments.Label.MomentDeletedBody"
}

local function renderFeedItem(p1, p2)
	-- upvalues: FeedItemRegistryModule (copy)
	local FeedItemRegistryModuleEntry = FeedItemRegistryModule[p1.kind]
	
	return if FeedItemRegistryModuleEntry == nil then nil else FeedItemRegistryModuleEntry.render(p1, p2)
end

local function feedItemKey(p1, p2)
	-- upvalues: FeedItemRegistryModule (copy)
	local FeedItemRegistryModuleEntry = FeedItemRegistryModule[p1.kind]
	local Key = if FeedItemRegistryModuleEntry == nil then nil else FeedItemRegistryModuleEntry.getKey(p1)
	
	return if Key == nil or Key == "" then tostring(p2) else Key
end

local function feedItemDedupeKey(p1)
	-- upvalues: FeedItemRegistryModule (copy)
	local FeedItemRegistryModuleEntry = FeedItemRegistryModule[p1.kind]
	
	return if FeedItemRegistryModuleEntry == nil then nil else FeedItemRegistryModuleEntry.getKey(p1)
end

local function feedItemAttribution(p1)
	-- upvalues: FeedItemRegistryModule (copy)
	local FeedItemRegistryModuleEntry = FeedItemRegistryModule[p1.kind]
	
	return if FeedItemRegistryModuleEntry == nil then nil else FeedItemRegistryModuleEntry.getAttribution(p1)
end

local function _(p1)
	return if p1 == nil then nil else tostring(p1)
end

local MomentsFeed = nil

local _ = function()
	-- upvalues: MomentsFeed (ref), Parent (copy)
	if MomentsFeed == nil then
		MomentsFeed = require(Parent.Loggers).Logger:new("Moments.Feed")
	end
	return MomentsFeed
end

return function(Frame: Frame)
	-- upvalues: NoopTelemetry (copy), FFlagMomentsSurfaceLoadTTI (copy), GetImmersiveChromeStoreModule (copy), GetFFlagMomentsImmersiveChromeModule (copy), UseLocalizationFunction (copy), config (copy), UseMomentsSessionFunction (copy), GetToastStoreModule (copy), SignalsReactModule (copy), ReactModule (copy), CreateFeedStoreModule (copy), feedItemDedupeKey (copy), MakeMomentViewBeganFieldsModule (copy), FireAnalyticsEventFunction (copy), EventNames (copy), UseFeedTelemetryModule (copy), feedItemAttribution (copy), MomentsSurfaceLoadManager (copy), DeleteMomentModule (copy), MomentsFeed (ref), Parent (copy), GetFFlagMomentsFixDeleteModule (copy), FFlagMomentsRemoveDeletedFromProfile (copy), GetDeletedMomentsStoreModule (copy), MakeFeedActionFieldsModule (copy), MomentsCommonModule (copy), GetFFlagMomentsFilterUnavailableFeedItemsModule (copy), FeedContext (copy), VerticalPager (copy), renderFeedItem (copy), feedItemKey (copy), FeedStateViewModule (copy), FeedNavigationBarModule (copy), ImmersiveChromeControllerModule (copy), DeletionConfirmationDialogModule (copy), MomentMediaCoordinatorProviderModule (copy), SurfaceReadyTrackerModule (copy)
	local Source = Frame.source
	local NoActive = Frame.active == nil or Frame.active
	local NoActive1 = if Frame.playbackActive == nil then NoActive else Frame.playbackActive
	local NoShowNavigationBar = Frame.showNavigationBar == nil or Frame.showNavigationBar
	local Telemetry = Frame.telemetry or NoopTelemetry
	local IsTrackSurfaceLoad: boolean = FFlagMomentsSurfaceLoadTTI and Frame.trackSurfaceLoad == true
	local ImmersiveChromeStoreModule = GetImmersiveChromeStoreModule(false)
	local FFlagMomentsImmersiveChromeModule = GetFFlagMomentsImmersiveChromeModule()
	local UseLocalizationResult = UseLocalizationFunction(config)
	local UseMomentsSessionResult = UseMomentsSessionFunction()
	local ToastStoreModule = GetToastStoreModule(false)
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseMomentsSessionResult.getPendingDeletion)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: CreateFeedStoreModule (upval), Source (copy), feedItemDedupeKey (upval), IsTrackSurfaceLoad (copy)
		return CreateFeedStoreModule(Source, feedItemDedupeKey, IsTrackSurfaceLoad)
	end, { Source })
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy)
		UseMemoResult.loadInitial()
		
		return function()
			-- upvalues: UseMemoResult (upval)
			UseMemoResult.dispose()
		end
	end, { UseMemoResult })
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(0)
	local UseRefResult2 = ReactModule.useRef(false)
	local UseRefResult3 = ReactModule.useRef(0)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult2 (copy), UseRefResult1 (copy), UseRefResult3 (copy), UseMemoResult (copy)
		if not UseRefResult2.current and DateTime.now().UnixTimestampMillis >= UseRefResult1.current then
			UseRefResult2.current = true
			UseRefResult3.current += 1
			local Current = UseRefResult3.current
			UseMemoResult.refresh()
			task.spawn(function()
				-- upvalues: UseRefResult2 (upval), Current (copy), UseRefResult3 (upval), UseMemoResult (upval), UseRefResult1 (upval)
				while UseRefResult2.current and Current == UseRefResult3.current do
					local Status = UseMemoResult.getStatus(false)
					
					if Status == "Loaded" or Status == "Empty" then
						UseRefResult2.current = false
						UseRefResult1.current = DateTime.now().UnixTimestampMillis + 1000
						break
					end
					if Status == "Failed" then
						UseRefResult2.current = false
						break
					end
					task.wait()
				end
			end)
			
			return
		end
	end, { UseMemoResult })
	local UseResult1 = ReactModule.useCallback(function(Moment)
		-- upvalues: UseMemoResult (copy), UseRefResult (copy)
		UseMemoResult.prependItem({ kind = "moment", moment = Moment })
		local Current = UseRefResult.current
		
		if Current ~= nil then
			Current.scrollToIndex(1)
		end
	end, { UseMemoResult })
	ReactModule.useImperativeHandle(Frame.controllerRef, function()
		-- upvalues: UseResult1 (copy), UseResult (copy)
		return { prependMoment = UseResult1, refresh = UseResult }
	end, { UseResult1, UseResult })
	local UseResult2 = ReactModule.useCallback(function(p1)
		-- upvalues: MakeMomentViewBeganFieldsModule (upval), UseMomentsSessionResult (copy), FireAnalyticsEventFunction (upval), EventNames (upval)
		if p1.kind ~= "moment" then return end
		local MomentViewBeganFieldsModule = MakeMomentViewBeganFieldsModule(p1.moment, UseMomentsSessionResult.getSessionSource(false))
		
		if MomentViewBeganFieldsModule then
			FireAnalyticsEventFunction(EventNames.MomentViewBegan, MomentViewBeganFieldsModule)
		end
	end, { UseMomentsSessionResult })
	local UseFeedTelemetryModuleResult = UseFeedTelemetryModule(UseMemoResult.pager, {
		telemetry = Telemetry,
		active = NoActive,
		getAttribution = feedItemAttribution,
		recommendationSource = Source.recommendationSource,
		onItemBecameActive = UseResult2
	})
	local UseRefResult4 = ReactModule.useRef(NoActive1)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult4 (copy), NoActive1 (copy), UseMemoResult (copy), UseResult2 (copy)
		local Current = UseRefResult4.current
		UseRefResult4.current = NoActive1
		
		if NoActive1 and not Current then
			local CurrentItem = UseMemoResult.pager.getCurrentItem(false)
			
			if CurrentItem ~= nil then
				UseResult2(CurrentItem)
			end
		end
	end, { NoActive1, UseMemoResult, UseResult2 })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy)
		local Current = UseRefResult.current
		
		if Current ~= nil then
			Current.next()
		end
	end, {})
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy)
		local Current = UseRefResult.current
		
		if Current ~= nil then
			Current.previous()
		end
	end, {})
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(UseMemoResult.getStatus)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(UseMemoResult.getLoadMoreFailed)
	local UseRefResult5 = ReactModule.useRef({})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult3 (copy), UseRefResult2 (copy), UseRefResult1 (copy)
		return function()
			-- upvalues: UseRefResult3 (upval), UseRefResult2 (upval), UseRefResult1 (upval)
			UseRefResult3.current += 1
			UseRefResult2.current = false
			UseRefResult1.current = 0
		end
	end, { UseMemoResult })
	local UseRefResult6 = ReactModule.useRef(false)
	local UseRefResult7 = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult6 (copy), IsTrackSurfaceLoad (copy), MomentsSurfaceLoadManager (upval), FireAnalyticsEventFunction (upval), EventNames (upval)
		if not UseRefResult6.current then
			UseRefResult6.current = true
			
			if IsTrackSurfaceLoad then
				MomentsSurfaceLoadManager.renderStarted()
				MomentsSurfaceLoadManager.surfaceMounted()
			end
			FireAnalyticsEventFunction(EventNames.MomentsFirstUIRenderedTimestamp, {
				value = if IsTrackSurfaceLoad and MomentsSurfaceLoadManager.isSessionActive() then MomentsSurfaceLoadManager.elapsedMs() else DateTime.now().UnixTimestampMillis
			})
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: IsTrackSurfaceLoad (copy), UseRefResult7 (copy), UseSignalStateResult1 (copy), FireAnalyticsEventFunction (upval), EventNames (upval)
		if IsTrackSurfaceLoad then return end
		if not UseRefResult7.current and (UseSignalStateResult1 == "Loaded" or UseSignalStateResult1 == "LoadingMore") then
			UseRefResult7.current = true
			FireAnalyticsEventFunction(EventNames.MomentsFirstContentLoadedTimestamp, { value = DateTime.now().UnixTimestampMillis })
		end
	end, { UseSignalStateResult1 })
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: UseMemoResult (copy), UseRefResult (copy)
		local CurrentIndex = UseMemoResult.pager.getCurrentIndex(false)
		local Current = UseRefResult.current
		
		if Current ~= nil then
			Current.removeItem(CurrentIndex)
		end
	end, { UseMemoResult })
	local UseResult6 = ReactModule.useCallback(function()
		-- upvalues: UseSignalStateResult (copy), DeleteMomentModule (upval), MomentsFeed (upval), Parent (upval), GetFFlagMomentsFixDeleteModule (upval), UseResult5 (copy), FFlagMomentsRemoveDeletedFromProfile (upval), GetDeletedMomentsStoreModule (upval), MakeFeedActionFieldsModule (upval), MomentsCommonModule (upval), FireAnalyticsEventFunction (upval), EventNames (upval), ToastStoreModule (copy), UseLocalizationResult (copy), UseMomentsSessionResult (copy)
		if UseSignalStateResult then
			local MomentId = UseSignalStateResult.momentId
			local FeedItemId = UseSignalStateResult.feedItemId
			local FeedSessionId = UseSignalStateResult.feedSessionId
			task.spawn(function()
				-- upvalues: DeleteMomentModule (upval), MomentId (copy), MomentsFeed (upval), Parent (upval)
				local v1, v2 = DeleteMomentModule(MomentId):await()
				
				if not v1 then
					if MomentsFeed == nil then
						MomentsFeed = require(Parent.Loggers).Logger:new("Moments.Feed")
					end
					MomentsFeed:warning("Failed to delete moment {}: {}", MomentId, (tostring(v2)))
				end
			end)
			
			if GetFFlagMomentsFixDeleteModule() then
				UseResult5()
				
				if FFlagMomentsRemoveDeletedFromProfile then
					GetDeletedMomentsStoreModule(false).markDeleted(MomentId)
				end
			end
			local FeedActionFieldsModule = MakeFeedActionFieldsModule(MomentId, FeedItemId, FeedSessionId, if MomentsCommonModule.Flags.GetFFlagMomentsAnalyticsSchemaIdentity() then "delete" else nil)
			
			if FeedActionFieldsModule then
				FireAnalyticsEventFunction(EventNames.MomentItemDeleted, FeedActionFieldsModule)
			end
			ToastStoreModule.triggerToast({
				title = UseLocalizationResult.deletedTitle,
				text = UseLocalizationResult.deletedBody
			})
		end
		UseMomentsSessionResult.clearPendingDeletion()
	end, {
		UseSignalStateResult,
		UseMomentsSessionResult,
		ToastStoreModule,
		UseLocalizationResult,
		UseResult5
	})
	local UseResult7 = ReactModule.useCallback(function()
		-- upvalues: UseMomentsSessionResult (copy)
		UseMomentsSessionResult.clearPendingDeletion()
	end, { UseMomentsSessionResult })
	local UseResult8 = ReactModule.useCallback(function(p1, FailureReason)
		-- upvalues: MomentsFeed (upval), Parent (upval), FireAnalyticsEventFunction (upval), EventNames (upval), Source (copy)
		local RecommendationMetadata = p1.recommendationMetadata
		
		if MomentsFeed == nil then
			MomentsFeed = require(Parent.Loggers).Logger:new("Moments.Feed")
		end
		MomentsFeed:debug("Filtering moment after media load failure | momentId: {}, assetId: {}, captureType: {}, failureReason: {}", p1.momentId, tostring(p1.assetId), p1.metadata.captureType.Name, FailureReason or "nil")
		local PlaceId = p1.metadata.placeId
		local Text = if PlaceId == nil then nil else tostring(PlaceId)
		local UniverseId = p1.metadata.universeId
		FireAnalyticsEventFunction(EventNames.FeedMediaLoadFailed, {
			momentId = p1.momentId,
			assetId = tostring(p1.assetId),
			captureType = p1.metadata.captureType.Name,
			creatorId = tostring(p1.creatorId),
			itemId = if RecommendationMetadata == nil then nil else RecommendationMetadata.itemId,
			tracingId = if RecommendationMetadata == nil then nil else RecommendationMetadata.tracingId,
			recommendationSource = Source.recommendationSource or "",
			feedSourceId = Source.id or "",
			placeId = Text,
			universeId = if UniverseId == nil then nil else tostring(UniverseId),
			failureReason = FailureReason
		})
	end, { Source })
	local UseResult9 = ReactModule.useCallback(function(MomentId, p1)
		-- upvalues: UseRefResult5 (copy), UseMemoResult (copy), UseResult8 (copy), UseRefResult (copy)
		if UseRefResult5.current[MomentId] then return end
		for i, value in UseMemoResult.pager.getItems(false) do
			if value.kind == "moment" and value.moment.momentId == MomentId then
				UseRefResult5.current[MomentId] = true
				UseResult8(value.moment, p1)
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
	end, { UseMemoResult, UseResult8 })
	local UseResult10 = ReactModule.useCallback(function(p2, p3)
		-- upvalues: GetFFlagMomentsFilterUnavailableFeedItemsModule (upval), UseResult9 (copy)
		if GetFFlagMomentsFilterUnavailableFeedItemsModule() then
			UseResult9(p2, p3)
		end
	end, { UseResult9 })
	local IsLoaded: boolean = NoShowNavigationBar and (UseSignalStateResult1 == "Loaded" or UseSignalStateResult1 == "LoadingMore")
	local Element = ReactModule.createElement(FeedContext.Provider, {
		value = ReactModule.useMemo(function()
			-- upvalues: UseMemoResult (copy), NoActive (copy), NoActive1 (copy), Source (copy), Telemetry (copy), UseFeedTelemetryModuleResult (copy), ImmersiveChromeStoreModule (copy), UseResult5 (copy)
			return {
				getStatus = UseMemoResult.getStatus,
				isActiveFeed = NoActive,
				isPlaybackActive = NoActive1,
				recommendationSource = Source.recommendationSource,
				logAction = function(p2, p3, p4)
					-- upvalues: Telemetry (upval)
					return Telemetry.logAction(p2, p3, p4)
				end,
				flushView = UseFeedTelemetryModuleResult.flushView,
				getChromeVisible = ImmersiveChromeStoreModule.getChromeVisible,
				revealChrome = ImmersiveChromeStoreModule.revealChrome,
				removeCurrentItem = UseResult5
			}
		end, {
			UseMemoResult, NoActive, NoActive1, Source, Telemetry,
			UseFeedTelemetryModuleResult.flushView, ImmersiveChromeStoreModule, UseResult5
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
				onEndReached = UseMemoResult.loadMore,
				active = NoActive and (UseSignalStateResult1 ~= "Failed" and UseSignalStateResult1 ~= "Empty"),
				controllerRef = UseRefResult,
				initialIndex = Frame.initialIndex,
				tuning = Frame.pager,
				Size = UDim2.fromScale(1, 1)
			}),
			StateOverlay = ReactModule.createElement(FeedStateViewModule, {
				zIndex = 2,
				status = UseSignalStateResult1,
				loadMoreFailed = UseSignalStateResult2,
				onRetry = UseMemoResult.retry,
				emptyContent = Frame.emptyContent
			}),
			NavBar = if IsLoaded then ReactModule.createElement(FeedNavigationBarModule, {
				zIndex = 3,
				pager = UseMemoResult.pager,
				active = NoActive,
				onScrollToNext = UseResult3,
				onScrollToPrevious = UseResult4
			}) else nil,
			ImmersiveController = if FFlagMomentsImmersiveChromeModule then ReactModule.createElement(ImmersiveChromeControllerModule, {
				pager = UseMemoResult.pager,
				active = NoActive and NoActive1,
				controllerRef = UseRefResult
			}) else nil,
			DeletionDialog = if UseSignalStateResult == nil then nil else ReactModule.createElement(DeletionConfirmationDialogModule, { onCancel = UseResult7, onConfirm = UseResult6 })
		})
	})
	
	return ReactModule.createElement(MomentMediaCoordinatorProviderModule, {
		pager = UseMemoResult.pager,
		playbackActive = NoActive1,
		createCoordinator = Frame.createCoordinator,
		onMediaItemFailed = if GetFFlagMomentsFilterUnavailableFeedItemsModule() then UseResult10 else nil
	}, if IsTrackSurfaceLoad then {
		Feed = Element,
		SurfaceReadyTracker = ReactModule.createElement(SurfaceReadyTrackerModule, { pager = UseMemoResult.pager })
	} else Element)
end
local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local _ = require(Parent.MomentsTypes)
local MomentsCommonModule = require(Parent.MomentsCommon)
local MomentsGetMomentsCommentsStoreModule = require(Parent.DataHydration.MomentsGetMomentsCommentsStore)
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local AppAppLifecycleObserverService = require(Parent.RoactServiceTags).AppAppLifecycleObserverService
local UseFeedOptionalFunction = require(Moments.Components.Feed.FeedContext).useFeedOptional
local MakeRecommendationAttributionModule = require(Moments.Analytics.makeRecommendationAttribution)
local MakeCommentCountFieldsModule = require(Moments.Analytics.makeCommentCountFields)
local FFlagMomentsCommentsCountAnalyticsModule = require(Moments.Flags.FFlagMomentsCommentsCountAnalytics)
local GetCommentsSheetStoreModule = require(script.Parent.Sheet.getCommentsSheetStore)
local CreateCommentsRecommendationSessionModule = require(script.Parent.createCommentsRecommendationSession)
local CreateCommentsAnalyticsSessionModule = require(script.Parent.createCommentsAnalyticsSession)
local UseCommentCapabilitiesModule = require(script.Parent.useCommentCapabilities)

return function(p1, Callback)
	-- upvalues: UseFeedOptionalFunction (copy), UseRoactServiceFunction (copy), AppAppLifecycleObserverService (copy), GetCommentsSheetStoreModule (copy), ReactModule (copy), SignalsModule (copy), UseCommentCapabilitiesModule (copy), MakeRecommendationAttributionModule (copy), CreateCommentsRecommendationSessionModule (copy), MomentsGetMomentsCommentsStoreModule (copy), MomentsCommonModule (copy), FFlagMomentsCommentsCountAnalyticsModule (copy), MakeCommentCountFieldsModule (copy), CreateCommentsAnalyticsSessionModule (copy)
	local UseFeedOptionalResult = UseFeedOptionalFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(AppAppLifecycleObserverService)
	local CommentsSheetStoreModule = GetCommentsSheetStoreModule(false)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local IsPlaybackActive = UseFeedOptionalResult ~= nil and (UseFeedOptionalResult.isActiveFeed and UseFeedOptionalResult.isPlaybackActive)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval)
		local Signal, Signal2 = SignalsModule.createSignal(true)
		
		return { get = Signal, set = Signal2 }
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseRoactServiceResult (copy), UseMemoResult (copy)
		if UseRoactServiceResult == nil then return end
		local OnHideConnection = UseRoactServiceResult.OnHide:Connect(function()
			-- upvalues: UseMemoResult (upval)
			UseMemoResult.set(false)
		end)
		local OnUnhideConnection = UseRoactServiceResult.OnUnhide:Connect(function()
			-- upvalues: UseMemoResult (upval)
			UseMemoResult.set(true)
		end)
		
		return function()
			-- upvalues: OnHideConnection (copy), OnUnhideConnection (copy)
			OnHideConnection:Disconnect()
			OnUnhideConnection:Disconnect()
		end
	end, { UseRoactServiceResult, UseMemoResult })
	ReactModule.useEffect(function()
		-- upvalues: SignalsModule (upval), UseMemoResult (copy), CommentsSheetStoreModule (copy), UseRefResult (copy), UseRefResult1 (copy), IsPlaybackActive (copy)
		return SignalsModule.createEffect(function(p2)
			-- upvalues: UseMemoResult (upval), CommentsSheetStoreModule (upval), UseRefResult (upval), UseRefResult1 (upval), IsPlaybackActive (upval)
			local GetResult = UseMemoResult.get(p2)
			local IsOpen = CommentsSheetStoreModule.getIsOpen(p2)
			local OpenSessionId = CommentsSheetStoreModule.getOpenSessionId(p2)
			local FeedItemId = CommentsSheetStoreModule.getFeedItemId(false) or ""
			local Current = UseRefResult.current
			local Current1 = UseRefResult1.current
			local IsOpen1 = IsPlaybackActive and (GetResult and IsOpen)
			
			if Current ~= nil then
				if IsOpen1 and CommentsSheetStoreModule.getRecommendationSession(FeedItemId, OpenSessionId) == Current then
					Current.startView()
				else
					Current.finishView()
				end
			end
			if Current1 ~= nil then
				if IsOpen1 and CommentsSheetStoreModule.getAnalyticsSession(FeedItemId, OpenSessionId) == Current1 then
					Current1.startView()
					
					return
				end
				if not GetResult then
					Current1.finishView("app_hidden")
					
					return
				end
				if not IsPlaybackActive then
					Current1.finishView("navigation_hidden")
				end
			end
		end)
	end, {
		IsPlaybackActive,
		CommentsSheetStoreModule,
		UseMemoResult
	})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy)
		return function()
			-- upvalues: UseRefResult (upval), UseRefResult1 (upval)
			if UseRefResult.current ~= nil then
				UseRefResult.current.finishView()
			end
			if UseRefResult1.current ~= nil then
				UseRefResult1.current.finishView("unmounted")
			end
		end
	end, {})
	local CanRead = UseCommentCapabilitiesModule().canRead
	
	return ReactModule.useCallback(function()
		-- upvalues: p1 (copy), CanRead (copy), MakeRecommendationAttributionModule (upval), UseFeedOptionalResult (copy), CreateCommentsRecommendationSessionModule (upval), Callback (copy), MomentsGetMomentsCommentsStoreModule (upval), MomentsCommonModule (upval), FFlagMomentsCommentsCountAnalyticsModule (upval), MakeCommentCountFieldsModule (upval), CreateCommentsAnalyticsSessionModule (upval), UseRefResult (copy), UseRefResult1 (copy), CommentsSheetStoreModule (copy)
		local FeedItemId = if p1 == nil then nil else p1.feedItemId
		
		if FeedItemId == nil or FeedItemId == "" or not CanRead then return end
		local Current = nil
		local RecommendationAttributionModule = MakeRecommendationAttributionModule(p1)
		
		if UseFeedOptionalResult ~= nil and RecommendationAttributionModule ~= nil then
			Current = CreateCommentsRecommendationSessionModule(UseFeedOptionalResult.logAction, RecommendationAttributionModule, Callback(false))
		end
		local MomentsGetMomentsCommentsStoreModuleResult = MomentsGetMomentsCommentsStoreModule(false)
		local OwnerGeneration = MomentsGetMomentsCommentsStoreModuleResult.getOwnerGeneration(false)
		local IsRecommendationSourceMatch: boolean = UseFeedOptionalResult ~= nil and (UseFeedOptionalResult.recommendationSource == MomentsCommonModule.Analytics.RecommendationSource.Profile or UseFeedOptionalResult.recommendationSource == MomentsCommonModule.Analytics.RecommendationSource.MyMoments)
		local CommentsAnalyticsSessionModule = CreateCommentsAnalyticsSessionModule(FeedItemId, if IsRecommendationSourceMatch then "profile" else "watch_tab", function(): boolean
			-- upvalues: MomentsGetMomentsCommentsStoreModuleResult (copy), OwnerGeneration (copy)
			return MomentsGetMomentsCommentsStoreModuleResult.getOwnerGeneration(false) == OwnerGeneration
		end, nil, nil, nil, if FFlagMomentsCommentsCountAnalyticsModule then function()
			-- upvalues: MakeCommentCountFieldsModule (upval), MomentsGetMomentsCommentsStoreModuleResult (copy), FeedItemId (copy)
			return MakeCommentCountFieldsModule(MomentsGetMomentsCommentsStoreModuleResult.getCachedMomentComments(FeedItemId).data(false))
		end else nil)
		UseRefResult.current = Current
		UseRefResult1.current = CommentsAnalyticsSessionModule
		CommentsSheetStoreModule.open(FeedItemId, Current, CommentsAnalyticsSessionModule)
	end, {
		p1 or false,
		UseFeedOptionalResult or false,
		CommentsSheetStoreModule,
		Callback,
		CanRead
	})
end